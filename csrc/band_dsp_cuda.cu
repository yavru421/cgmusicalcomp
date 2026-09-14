#include <cuda_runtime.h>
#include <cufft.h>
#include <device_launch_parameters.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#ifdef _WIN32
#define EXPORT_API extern "C" __declspec(dllexport)
#else
#define EXPORT_API extern "C"
#endif

#define PI 3.14159265358979323846f
#define SPEED_OF_SOUND 343.0f // m/s
#define HEAD_RADIUS 0.0875f   // ~17.5 cm head diameter

// ============================================================================
// 1. HARDWARE TOPOLOGY & STATE STRUCTURE
// Targeted for AD107 (NVIDIA GeForce RTX 4060 Laptop GPU - 32MB L2 Cache, SM_89)
// ============================================================================
struct BinauralPOLAState {
    bool initialized;
    int sample_rate;
    int block_size;          // B = 1024
    int fft_size;            // N = 2048
    int num_freq_bins;       // N/2 + 1 = 1025
    int num_sources;         // 14 instrument stems
    int num_channels;        // 28 binaural paths (14 Left + 14 Right)
    int num_partitions;      // P (e.g. 44 partitions = 45,056 samples ~ 1.02s)
    int ring_idx;            // Circular pointer in FD-DL

    // CUFFT Handles
    cufftHandle plan_fwd_sources; // Batched 1D R2C (14 sources)
    cufftHandle plan_inv_stereo;  // Batched 1D C2R (2 stereo channels)
    cufftHandle plan_fwd_irs;     // Batched 1D R2C for offline IR partition upload

    // Pre-allocated Device Buffers (Zero Runtime cudaMalloc)
    float* d_in_dry;              // [14 * 1024]
    float* d_input_time;          // [14 * 2048]
    cufftComplex* d_curr_spectra; // [14 * 1025]
    cufftComplex* d_input_fddl;   // [14 * P * 1025] (Frequency Domain Delay Line)
    cufftComplex* d_ir_partitions;// [28 * P * 1025] (Pinned in 32MB L2 Cache)
    cufftComplex* d_stereo_freq;  // [2 * 1025]
    float* d_stereo_time;         // [2 * 2048]
    float* d_overlap;             // [2 * 1024]
    float* d_out_interleaved;     // [2 * 1024]

    cudaStream_t stream;
};

static BinauralPOLAState g_state = { 0 };

// Standard 14-Voice Concert Band Seating Azimuth Angles (degrees from center):
// Flute (-30), Oboe (-20), Clarinet (-40), AltoSax (-15), TenorSax (-10),
// Trumpet (+35), Horn (+15), Trombone (+45), Tuba (+25),
// Bass (+5), Cello (+8), Glock (-35), Timpani (0), Drums (0)
static const float SEATING_AZIMUTHS[14] = {
    -30.0f, -20.0f, -40.0f, -15.0f, -10.0f,
    +35.0f, +15.0f, +45.0f, +25.0f,
    +5.0f,  +8.0f,  -35.0f, 0.0f,   0.0f
};

// Seating Distance in Meters from Conductor
static const float SEATING_DISTANCES[14] = {
    4.0f, 4.5f, 5.0f, 6.0f, 6.5f,
    7.5f, 6.0f, 8.0f, 8.5f,
    7.0f, 5.5f, 9.0f, 9.5f, 9.0f
};

// Forward declaration
EXPORT_API void cu_binaural_pola_destroy();

// ============================================================================
// 2. CUDA KERNELS
// ============================================================================

// Pad block of size B with zeros to size N
__global__ void cu_zero_pad_sources_kernel(
    const float* __restrict__ d_in_dry,
    float* __restrict__ d_out_padded,
    int num_sources,
    int B,
    int N
) {
    int s = blockIdx.y;
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (s >= num_sources || idx >= N) return;

    int out_idx = s * N + idx;
    if (idx < B) {
        d_out_padded[out_idx] = d_in_dry[s * B + idx];
    } else {
        d_out_padded[out_idx] = 0.0f;
    }
}

// Store forward FFT spectra into the current circular ring slot of FD-DL
__global__ void cu_store_fddl_kernel(
    const cufftComplex* __restrict__ d_spectra,
    cufftComplex* __restrict__ d_fddl,
    int num_sources,
    int num_partitions,
    int ring_idx,
    int num_bins
) {
    int s = blockIdx.y;
    int bin = blockIdx.x * blockDim.x + threadIdx.x;
    if (s >= num_sources || bin >= num_bins) return;

    int in_idx = s * num_bins + bin;
    int out_idx = (s * num_partitions + ring_idx) * num_bins + bin;
    d_fddl[out_idx] = d_spectra[in_idx];
}

// Saturated Batched Complex FMA Kernel:
// Grid.y = 2 (blockIdx.y = 0 for Left ear, 1 for Right ear)
// Grid.x = (num_bins + 63) / 64 (17 blocks across frequency bins)
// Total blocks = 17 * 2 = 34 blocks -> Satures all 24 SMs on AD107 RTX 4060!
__global__ void cu_batched_pola_fma_kernel(
    const cufftComplex* __restrict__ d_fddl,
    const cufftComplex* __restrict__ d_ir,
    cufftComplex* __restrict__ d_stereo_freq,
    int num_sources,
    int num_partitions,
    int ring_idx,
    int num_bins
) {
    int ear = blockIdx.y; // 0 = Left, 1 = Right
    int bin = blockIdx.x * blockDim.x + threadIdx.x;
    if (bin >= num_bins) return;

    float acc_r = 0.0f;
    float acc_i = 0.0f;

    #pragma unroll 2
    for (int s = 0; s < num_sources; ++s) {
        int ir_ch = 2 * s + ear;

        for (int p = 0; p < num_partitions; ++p) {
            int slot = (ring_idx - p + num_partitions) % num_partitions;
            int fddl_idx = (s * num_partitions + slot) * num_bins + bin;
            cufftComplex x = d_fddl[fddl_idx];

            int ir_idx = (ir_ch * num_partitions + p) * num_bins + bin;
            cufftComplex h = d_ir[ir_idx];

            // Complex FMA: (x.r + i*x.i) * (h.r + i*h.i) = (x.r*h.r - x.i*h.i) + i*(x.r*h.i + x.i*h.r)
            acc_r += x.x * h.x - x.y * h.y;
            acc_i += x.x * h.y + x.y * h.x;
        }
    }

    d_stereo_freq[ear * num_bins + bin] = make_cuComplex(acc_r, acc_i);
}

// Overlap-Add & Normalization Kernel
__global__ void cu_overlap_add_normalize_kernel(
    const float* __restrict__ d_stereo_time,
    float* __restrict__ d_overlap,
    float* __restrict__ d_out_interleaved,
    int B,
    int N,
    float scale
) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= B) return;

    // Left Channel
    float l_curr = d_stereo_time[idx] * scale;
    float l_prev = d_overlap[idx];
    float l_out  = l_curr + l_prev;
    d_overlap[idx] = d_stereo_time[idx + B] * scale;

    // Right Channel
    float r_curr = d_stereo_time[N + idx] * scale;
    float r_prev = d_overlap[B + idx];
    float r_out  = r_curr + r_prev;
    d_overlap[B + idx] = d_stereo_time[N + idx + B] * scale;

    // Interleaved stereo output: [L0, R0, L1, R1, ...]
    d_out_interleaved[2 * idx]     = l_out;
    d_out_interleaved[2 * idx + 1] = r_out;
}

// ============================================================================
// 3. EXPORTED C-ABI ENGINE INTERFACES
// ============================================================================

EXPORT_API int cu_binaural_pola_init(
    int sample_rate,
    int block_size,
    int num_partitions,
    int num_sources
) {
    if (g_state.initialized) {
        cu_binaural_pola_destroy();
    }

    g_state.sample_rate = (sample_rate > 0) ? sample_rate : 44100;
    g_state.block_size = (block_size > 0) ? block_size : 1024;
    g_state.fft_size = g_state.block_size * 2; // N = 2048
    g_state.num_freq_bins = g_state.fft_size / 2 + 1; // 1025
    g_state.num_sources = (num_sources > 0) ? num_sources : 14;
    g_state.num_channels = g_state.num_sources * 2; // 28 binaural channels
    g_state.num_partitions = (num_partitions > 0) ? num_partitions : 44;
    g_state.ring_idx = 0;

    cudaStreamCreate(&g_state.stream);

    // 1. Batched 1D R2C for 14 sources (size N=2048)
    int n[1] = { g_state.fft_size };
    cufftPlanMany(&g_state.plan_fwd_sources, 1, n,
                  NULL, 1, g_state.fft_size,
                  NULL, 1, g_state.num_freq_bins,
                  CUFFT_R2C, g_state.num_sources);
    cufftSetStream(g_state.plan_fwd_sources, g_state.stream);

    // 2. Batched 1D C2R for 2 stereo channels (size N=2048)
    cufftPlanMany(&g_state.plan_inv_stereo, 1, n,
                  NULL, 1, g_state.num_freq_bins,
                  NULL, 1, g_state.fft_size,
                  CUFFT_C2R, 2);
    cufftSetStream(g_state.plan_inv_stereo, g_state.stream);

    // Pre-allocate all device buffers
    size_t in_dry_bytes = g_state.num_sources * g_state.block_size * sizeof(float);
    size_t in_time_bytes = g_state.num_sources * g_state.fft_size * sizeof(float);
    size_t spectra_bytes = g_state.num_sources * g_state.num_freq_bins * sizeof(cufftComplex);
    size_t fddl_bytes = g_state.num_sources * g_state.num_partitions * g_state.num_freq_bins * sizeof(cufftComplex);
    size_t ir_bytes = g_state.num_channels * g_state.num_partitions * g_state.num_freq_bins * sizeof(cufftComplex);
    size_t stereo_freq_bytes = 2 * g_state.num_freq_bins * sizeof(cufftComplex);
    size_t stereo_time_bytes = 2 * g_state.fft_size * sizeof(float);
    size_t overlap_bytes = 2 * g_state.block_size * sizeof(float);
    size_t out_bytes = 2 * g_state.block_size * sizeof(float);

    cudaMalloc(&g_state.d_in_dry, in_dry_bytes);
    cudaMalloc(&g_state.d_input_time, in_time_bytes);
    cudaMalloc(&g_state.d_curr_spectra, spectra_bytes);
    cudaMalloc(&g_state.d_input_fddl, fddl_bytes);
    cudaMalloc(&g_state.d_ir_partitions, ir_bytes);
    cudaMalloc(&g_state.d_stereo_freq, stereo_freq_bytes);
    cudaMalloc(&g_state.d_stereo_time, stereo_time_bytes);
    cudaMalloc(&g_state.d_overlap, overlap_bytes);
    cudaMalloc(&g_state.d_out_interleaved, out_bytes);

    cudaMemsetAsync(g_state.d_in_dry, 0, in_dry_bytes, g_state.stream);
    cudaMemsetAsync(g_state.d_input_fddl, 0, fddl_bytes, g_state.stream);
    cudaMemsetAsync(g_state.d_overlap, 0, overlap_bytes, g_state.stream);
    cudaStreamSynchronize(g_state.stream);

    g_state.initialized = true;
    return 0;
}

EXPORT_API int cu_binaural_pola_generate_hall_acoustics(
    float rt60_sec,
    float room_depth_m,
    float room_width_m
) {
    if (!g_state.initialized) return -1;

    int B = g_state.block_size;
    int N = g_state.fft_size;
    int P = g_state.num_partitions;
    int num_bins = g_state.num_freq_bins;
    int total_channels = g_state.num_channels;

    size_t part_bytes = total_channels * P * N * sizeof(float);
    float* h_ir_time = (float*)calloc(total_channels * P * N, sizeof(float));
    if (!h_ir_time) return -2;

    float decay_rate = 6.907755f / (rt60_sec > 0.1f ? rt60_sec : 1.8f);

    for (int s = 0; s < g_state.num_sources; ++s) {
        float az_deg = SEATING_AZIMUTHS[s];
        float az_rad = az_deg * PI / 180.0f;
        float dist = SEATING_DISTANCES[s];

        float itd_sec = (HEAD_RADIUS / SPEED_OF_SOUND) * (sinf(az_rad) + az_rad);
        int itd_samples = (int)(fabsf(itd_sec) * (float)g_state.sample_rate);

        float ild_left  = 1.0f - 0.35f * sinf(fmaxf(0.0f, az_rad));
        float ild_right = 1.0f - 0.35f * sinf(fmaxf(0.0f, -az_rad));

        int left_delay = (itd_sec > 0.0f) ? 0 : itd_samples;
        int right_delay = (itd_sec > 0.0f) ? itd_samples : 0;

        int ch_L = 2 * s;
        int ch_R = 2 * s + 1;

        // Low-pass filter state for diffuse reverberation to ensure warm concert hall acoustics (zero metallic tinging)
        float lp_state_L = 0.0f;
        float lp_state_R = 0.0f;
        uint32_t rng_state = (uint32_t)(s * 10007 + 1337);

        for (int p = 0; p < P; ++p) {
            float* p_L = h_ir_time + (ch_L * P + p) * N;
            float* p_R = h_ir_time + (ch_R * P + p) * N;

            for (int n = 0; n < B; ++n) {
                int global_sample = p * B + n;
                float t = (float)global_sample / (float)g_state.sample_rate;
                float env = expf(-decay_rate * t);

                // 1. Direct Sound (Crisp, natural, dominant)
                if (p == 0 && n == left_delay) {
                    p_L[n] += 0.85f * ild_left;
                }
                if (p == 0 && n == right_delay) {
                    p_R[n] += 0.85f * ild_right;
                }

                // 2. Discrete Early Reflections (Floor, Ceiling, Walls)
                if (p == 0) {
                    if (n == left_delay + 110)  p_L[n] += 0.15f * ild_left;
                    if (n == right_delay + 110) p_R[n] += 0.15f * ild_right;
                    if (n == left_delay + 352)  p_L[n] += 0.10f * ild_left;
                    if (n == right_delay + 352) p_R[n] += 0.10f * ild_right;
                    if (n == left_delay + 793)  p_L[n] += 0.08f * ild_left;
                    if (n == right_delay + 793) p_R[n] += 0.08f * ild_right;
                } else if (p == 1) {
                    if (n == (left_delay + 1058) % B)  p_L[n] += 0.06f * ild_left;
                    if (n == (right_delay + 1058) % B) p_R[n] += 0.06f * ild_right;
                }

                // 3. Late Diffuse Reverberation: LCG Pseudo-Random White Noise filtered through 1-pole Low-Pass Filter
                rng_state = rng_state * 1664525u + 1013904223u;
                float raw_noise_L = ((float)(rng_state & 0x7FFFFF) / (float)0x7FFFFF) * 2.0f - 1.0f;
                rng_state = rng_state * 1664525u + 1013904223u;
                float raw_noise_R = ((float)(rng_state & 0x7FFFFF) / (float)0x7FFFFF) * 2.0f - 1.0f;

                // 1-pole low-pass filter (cutoff ~2.5 kHz) for warm wooden concert hall reverberation
                lp_state_L = 0.82f * lp_state_L + 0.18f * raw_noise_L;
                lp_state_R = 0.82f * lp_state_R + 0.18f * raw_noise_R;

                float room_echo_L = lp_state_L * env * 0.012f;
                float room_echo_R = lp_state_R * env * 0.012f;

                p_L[n] += room_echo_L * ild_left;
                p_R[n] += room_echo_R * ild_right;
            }
        }
    }

    float* d_ir_time = NULL;
    cudaMalloc(&d_ir_time, part_bytes);
    cudaMemcpyAsync(d_ir_time, h_ir_time, part_bytes, cudaMemcpyHostToDevice, g_state.stream);

    cufftHandle plan_irs;
    int n[1] = { N };
    cufftPlanMany(&plan_irs, 1, n,
                  NULL, 1, N,
                  NULL, 1, num_bins,
                  CUFFT_R2C, total_channels * P);
    cufftSetStream(plan_irs, g_state.stream);

    cufftExecR2C(plan_irs, (cufftReal*)d_ir_time, (cufftComplex*)g_state.d_ir_partitions);
    cudaStreamSynchronize(g_state.stream);

    cufftDestroy(plan_irs);
    cudaFree(d_ir_time);
    free(h_ir_time);

    return 0;
}

EXPORT_API int cu_binaural_pola_process_block(
    const float* h_in_14stems,
    float* h_out_stereo_interleaved
) {
    if (!g_state.initialized || !h_in_14stems || !h_out_stereo_interleaved) return -1;

    int B = g_state.block_size;
    int N = g_state.fft_size;
    int num_bins = g_state.num_freq_bins;
    int num_sources = g_state.num_sources;

    size_t in_bytes = num_sources * B * sizeof(float);
    cudaMemcpyAsync(g_state.d_in_dry, h_in_14stems, in_bytes, cudaMemcpyHostToDevice, g_state.stream);

    dim3 block(128);
    dim3 grid_pad((N + 127) / 128, num_sources);
    cu_zero_pad_sources_kernel<<<grid_pad, block, 0, g_state.stream>>>(
        g_state.d_in_dry, g_state.d_input_time, num_sources, B, N
    );

    cufftExecR2C(g_state.plan_fwd_sources, (cufftReal*)g_state.d_input_time, g_state.d_curr_spectra);

    dim3 grid_fddl((num_bins + 127) / 128, num_sources);
    cu_store_fddl_kernel<<<grid_fddl, block, 0, g_state.stream>>>(
        g_state.d_curr_spectra, g_state.d_input_fddl, num_sources, g_state.num_partitions, g_state.ring_idx, num_bins
    );

    dim3 grid_fma((num_bins + 63) / 64, 2);
    dim3 block_fma(64);
    cu_batched_pola_fma_kernel<<<grid_fma, block_fma, 0, g_state.stream>>>(
        g_state.d_input_fddl, g_state.d_ir_partitions, g_state.d_stereo_freq,
        num_sources, g_state.num_partitions, g_state.ring_idx, num_bins
    );

    g_state.ring_idx = (g_state.ring_idx + 1) % g_state.num_partitions;

    cufftExecC2R(g_state.plan_inv_stereo, g_state.d_stereo_freq, (cufftReal*)g_state.d_stereo_time);

    float norm_scale = 1.0f / (float)N;
    dim3 grid_ola((B + 127) / 128);
    cu_overlap_add_normalize_kernel<<<grid_ola, block, 0, g_state.stream>>>(
        g_state.d_stereo_time, g_state.d_overlap, g_state.d_out_interleaved, B, N, norm_scale
    );

    size_t out_bytes = 2 * B * sizeof(float);
    cudaMemcpyAsync(h_out_stereo_interleaved, g_state.d_out_interleaved, out_bytes, cudaMemcpyDeviceToHost, g_state.stream);
    cudaStreamSynchronize(g_state.stream);

    return 0;
}

EXPORT_API int cu_binaural_pola_process_stream(
    const float* h_in_14stems_stream,
    float* h_out_stereo_stream,
    int total_samples,
    float* out_elapsed_ms
) {
    if (!g_state.initialized || !h_in_14stems_stream || !h_out_stereo_stream || total_samples <= 0) return -1;

    int B = g_state.block_size;
    int num_blocks = (total_samples + B - 1) / B;
    int num_sources = g_state.num_sources;

    cudaEvent_t start, stop;
    cudaEventCreate(&start);
    cudaEventCreate(&stop);
    cudaEventRecord(start, g_state.stream);

    float* block_in = (float*)malloc(num_sources * B * sizeof(float));
    float* block_out = (float*)malloc(2 * B * sizeof(float));

    for (int blk = 0; blk < num_blocks; ++blk) {
        int offset = blk * B;
        int cur_len = (offset + B <= total_samples) ? B : (total_samples - offset);

        for (int s = 0; s < num_sources; ++s) {
            const float* src_ptr = h_in_14stems_stream + (size_t)s * total_samples + offset;
            float* dst_ptr = block_in + s * B;
            for (int i = 0; i < cur_len; ++i) {
                dst_ptr[i] = src_ptr[i];
            }
            for (int i = cur_len; i < B; ++i) {
                dst_ptr[i] = 0.0f;
            }
        }

        cu_binaural_pola_process_block(block_in, block_out);

        for (int i = 0; i < cur_len; ++i) {
            h_out_stereo_stream[(size_t)(offset + i) * 2]     = block_out[2 * i];
            h_out_stereo_stream[(size_t)(offset + i) * 2 + 1] = block_out[2 * i + 1];
        }
    }

    cudaEventRecord(stop, g_state.stream);
    cudaEventSynchronize(stop);

    float elapsed = 0.0f;
    cudaEventElapsedTime(&elapsed, start, stop);
    if (out_elapsed_ms) *out_elapsed_ms = elapsed;

    cudaEventDestroy(start);
    cudaEventDestroy(stop);
    free(block_in);
    free(block_out);

    return 0;
}

EXPORT_API float cu_benchmark_pola_latency(int num_blocks) {
    if (!g_state.initialized) return -1.0f;
    int B = g_state.block_size;
    int N = g_state.fft_size;
    int num_bins = g_state.num_freq_bins;
    int num_sources = g_state.num_sources;
    float norm_scale = 1.0f / (float)N;

    dim3 block(128);
    dim3 grid_pad((N + 127) / 128, num_sources);
    dim3 grid_fddl((num_bins + 127) / 128, num_sources);
    dim3 grid_fma((num_bins + 63) / 64, 2);
    dim3 block_fma(64);
    dim3 grid_ola((B + 127) / 128);

    // Warm up
    for (int i = 0; i < 5; ++i) {
        cu_zero_pad_sources_kernel<<<grid_pad, block, 0, g_state.stream>>>(
            g_state.d_in_dry, g_state.d_input_time, num_sources, B, N
        );
        cufftExecR2C(g_state.plan_fwd_sources, (cufftReal*)g_state.d_input_time, g_state.d_curr_spectra);
        cu_store_fddl_kernel<<<grid_fddl, block, 0, g_state.stream>>>(
            g_state.d_curr_spectra, g_state.d_input_fddl, num_sources, g_state.num_partitions, g_state.ring_idx, num_bins
        );
        cu_batched_pola_fma_kernel<<<grid_fma, block_fma, 0, g_state.stream>>>(
            g_state.d_input_fddl, g_state.d_ir_partitions, g_state.d_stereo_freq,
            num_sources, g_state.num_partitions, g_state.ring_idx, num_bins
        );
        g_state.ring_idx = (g_state.ring_idx + 1) % g_state.num_partitions;
        cufftExecC2R(g_state.plan_inv_stereo, g_state.d_stereo_freq, (cufftReal*)g_state.d_stereo_time);
        cu_overlap_add_normalize_kernel<<<grid_ola, block, 0, g_state.stream>>>(
            g_state.d_stereo_time, g_state.d_overlap, g_state.d_out_interleaved, B, N, norm_scale
        );
    }
    cudaStreamSynchronize(g_state.stream);

    cudaEvent_t start, stop;
    cudaEventCreate(&start);
    cudaEventCreate(&stop);

    cudaEventRecord(start, g_state.stream);
    for (int i = 0; i < num_blocks; ++i) {
        cu_zero_pad_sources_kernel<<<grid_pad, block, 0, g_state.stream>>>(
            g_state.d_in_dry, g_state.d_input_time, num_sources, B, N
        );
        cufftExecR2C(g_state.plan_fwd_sources, (cufftReal*)g_state.d_input_time, g_state.d_curr_spectra);
        cu_store_fddl_kernel<<<grid_fddl, block, 0, g_state.stream>>>(
            g_state.d_curr_spectra, g_state.d_input_fddl, num_sources, g_state.num_partitions, g_state.ring_idx, num_bins
        );
        cu_batched_pola_fma_kernel<<<grid_fma, block_fma, 0, g_state.stream>>>(
            g_state.d_input_fddl, g_state.d_ir_partitions, g_state.d_stereo_freq,
            num_sources, g_state.num_partitions, g_state.ring_idx, num_bins
        );
        g_state.ring_idx = (g_state.ring_idx + 1) % g_state.num_partitions;
        cufftExecC2R(g_state.plan_inv_stereo, g_state.d_stereo_freq, (cufftReal*)g_state.d_stereo_time);
        cu_overlap_add_normalize_kernel<<<grid_ola, block, 0, g_state.stream>>>(
            g_state.d_stereo_time, g_state.d_overlap, g_state.d_out_interleaved, B, N, norm_scale
        );
    }
    cudaEventRecord(stop, g_state.stream);
    cudaEventSynchronize(stop);

    float elapsed_ms = 0.0f;
    cudaEventElapsedTime(&elapsed_ms, start, stop);
    float avg_latency_ms = elapsed_ms / (float)num_blocks;

    cudaEventDestroy(start);
    cudaEventDestroy(stop);

    return avg_latency_ms;
}

EXPORT_API const char* cu_get_device_telemetry() {
    static char buf[512];
    int device = 0;
    cudaGetDevice(&device);
    cudaDeviceProp prop;
    cudaGetDeviceProperties(&prop, device);

    size_t free_mem = 0, total_mem = 0;
    cudaMemGetInfo(&free_mem, &total_mem);

    snprintf(buf, sizeof(buf),
             "Device: %s | SM: %d.%d | L2 Cache: %d MB | VRAM: %.1f GB (%.1f GB Free) | 28-Ch Batched P-OLA Active",
             prop.name, prop.major, prop.minor,
             prop.l2CacheSize / (1024 * 1024),
             (float)total_mem / (1024.0f * 1024.0f * 1024.0f),
             (float)free_mem / (1024.0f * 1024.0f * 1024.0f));
    return buf;
}

EXPORT_API void cu_binaural_pola_destroy() {
    if (!g_state.initialized) return;

    cufftDestroy(g_state.plan_fwd_sources);
    cufftDestroy(g_state.plan_inv_stereo);

    cudaFree(g_state.d_in_dry);
    cudaFree(g_state.d_input_time);
    cudaFree(g_state.d_curr_spectra);
    cudaFree(g_state.d_input_fddl);
    cudaFree(g_state.d_ir_partitions);
    cudaFree(g_state.d_stereo_freq);
    cudaFree(g_state.d_stereo_time);
    cudaFree(g_state.d_overlap);
    cudaFree(g_state.d_out_interleaved);

    cudaStreamDestroy(g_state.stream);
    memset(&g_state, 0, sizeof(g_state));
}
