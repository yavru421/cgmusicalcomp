@echo off
set "PATH=C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.6\bin;C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Tools\MSVC\14.44.35207\bin\Hostx64\x64;%PATH%"
cd /d "C:\dev\CGMusicalComposition"

echo [COMPILING] band_dsp_cuda.dll for AD107 (SM_89, 32MB L2 Cache)...
nvcc -O3 --shared -arch=sm_89 -Xcompiler "/O2 /MD" csrc\band_dsp_cuda.cu -o band_dsp_cuda.dll -lcudart -lcufft

if %ERRORLEVEL% EQU 0 (
    echo [SUCCESS] band_dsp_cuda.dll built successfully for RTX 4060 AD107!
) else (
    echo [ERROR] Build failed with exit code %ERRORLEVEL%
)
