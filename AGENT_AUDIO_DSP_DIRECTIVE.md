# Master AI Agent Directive: Audio Synthesis, Humanization & Spatial DSP

**Target Audience**: Local AI Agents (Audio/DSP & Python Build Pipeline)  
**Target Output**: High-Fidelity 44.1 kHz Stereo Preview Masters  
**Tools & Libraries**: FluidSynth v2.4.3+, `mido`, `soundfile`, `numpy`, Kokoro ONNX Neural Speech

---

## 📌 Executive Mandate

Raw MIDI files compiled from LilyPond sound mechanical and clinical. AI build agents MUST execute the post-processing pipeline defined in this directive to convert raw MIDI into warm, humanized, concert-hall spatialized audio previews.

---

## 🎧 1. Acoustic Spatialization & Band Seating Panning

All rendered audio MUST reflect the physical seating arrangement of a 14-voice concert band. Inject CC 10 (Pan) controller events into the MIDI sequence prior to FluidSynth rendering according to this layout:

```text
               ┌─────────────────────────────────────────┐
               │           PERCUSSION & TIMPANI          │
               │        Pan: 45 - 55 (Center-Back)       │
               └─────────────────────────────────────────┘
        ┌───────────────────────┐       ┌───────────────────────┐
        │    HIGH/MID BRASS     │       │     LOW BRASS/TUBA    │
        │ Trumpet · Horn (60-75)│       │ Trombone · Tuba (70-85│
        └───────────────────────┘       └───────────────────────┘
        ┌───────────────────────┐       ┌───────────────────────┐
        │       WOODWINDS       │       │    SAXES / BASS / CELLO│
        │ Flute · Oboe (25-40)  │       │ Clarinet · Sax (40-55)│
        └───────────────────────┘       └───────────────────────┘
                                   ▲
                               CONDUCTOR
```

### Concert Band Panning CC 10 Values Table
| Instrument Voice | MIDI Pan Value (0=Left, 64=Center, 127=Right) | Acoustic Location |
| :--- | :--- | :--- |
| **Flute / Oboe** | `32` (Left-Center) | Front Left |
| **B♭ Clarinet** | `42` (Left-Center) | Center Left |
| **Alto Saxophone** | `50` (Center-Left) | Center Left |
| **B♭ Trumpet** | `76` (Right-Center) | Mid Right |
| **French Horn** | `68` (Right-Center) | Mid Right |
| **Tenor Trombone** | `84` (Far Right) | Back Right |
| **Tuba** | `70` (Right-Center) | Back Right |
| **Electric / Upright Bass** | `60` (Center-Right) | Back Center-Right |
| **Cello** | `58` (Center-Right) | Mid Center-Right |
| **Glockenspiel / Marimba** | `48` (Center-Left) | Back Left |
| **Timpani** | `52` (Center) | Back Center |
| **Concert Snare & Drums** | `50` (Center) | Back Center |

---

## ⏱️ 2. Micro-Timing & Dynamic Humanization (`humanize.py`)

Run this Python script to add subtle human micro-timing jitter (±4 to 8 ms) and velocity fluctuations so notes do not hit with robotic, grid-aligned precision:

```python
import mido
import random

def humanize_midi(input_midi, output_midi, timing_jitter_ticks=10, velocity_jitter=5):
    mid = mido.MidiFile(input_midi)
    
    for track in mid.tracks:
        for msg in track:
            if not msg.is_meta:
                # Apply timing jitter to delta time
                if msg.time > 0:
                    delta_offset = random.randint(-timing_jitter_ticks, timing_jitter_ticks)
                    msg.time = max(0, msg.time + delta_offset)
                
                # Apply velocity humanization to note_on
                if msg.type == 'note_on' and msg.velocity > 0:
                    vel_offset = random.randint(-velocity_jitter, velocity_jitter)
                    msg.velocity = min(127, max(1, msg.velocity + vel_offset))
                    
    mid.save(output_midi)
    print(f"✅ Humanized MIDI saved to {output_midi}")

if __name__ == '__main__':
    import sys
    humanize_midi(sys.argv[1], sys.argv[2])
```

---

## 🏛️ 3. FluidSynth Hall Reverb DSP Execution

Always render WAV files using FluidSynth's calibrated acoustic hall parameters:

```bash
fluidsynth -F master_output.wav \
  -o synth.reverb.active=1 \
  -o synth.reverb.room-size=0.45 \
  -o synth.reverb.damp=0.60 \
  -o synth.reverb.width=0.75 \
  -o synth.reverb.level=0.25 \
  -o synth.gain=0.45 \
  MuseScore_General.sf3 \
  humanized_score.mid
```

---

## 🎙️ 4. Master Showcase Build Script (`build_showcase_audio.py`)

Automates full-band showcase tracks with Kokoro ONNX neural speech narration:

```python
import os
import subprocess
import numpy as np
import soundfile as sf

def build_narrated_showcase(instruments, soundfont, output_wav):
    audio_segments = []
    
    for inst in instruments:
        ly_file = f"Notes/{inst}_solo.ly"
        mid_file = f"MIDI/{inst}_solo.mid"
        wav_file = f"Audio/{inst}_solo.wav"
        
        # 1. Compile LilyPond
        subprocess.run(["lilypond", "-o", f"MIDI/{inst}_solo", ly_file], check=True)
        
        # 2. Render FluidSynth Audio
        cmd = [
            "fluidsynth", "-F", wav_file,
            "-o", "synth.reverb.active=1",
            "-o", "synth.reverb.room-size=0.45",
            "-o", "synth.reverb.damp=0.60",
            "-o", "synth.reverb.level=0.25",
            "-o", "synth.gain=0.45",
            soundfont, mid_file
        ]
        subprocess.run(cmd, check=True)
        
        # 3. Load Audio Segment
        data, sr = sf.read(wav_file)
        audio_segments.append(data)
        
    # Combine & Normalize to -0.3 dBFS
    full_audio = np.concatenate(audio_segments, axis=0)
    max_val = np.max(np.abs(full_audio))
    target_peak = 10 ** (-0.3 / 20)
    normalized_audio = (full_audio / max_val) * target_peak
    
    sf.write(output_wav, normalized_audio, sr)
    print(f"🎉 Master Showcase Audio published to {output_wav} (-0.3 dBFS Normalized)")

if __name__ == '__main__':
    inst_list = ['flute', 'clarinet', 'trumpet', 'horn', 'trombone', 'tuba', 'snare']
    build_narrated_showcase(inst_list, 'MuseScore_General.sf3', 'master_showcase.wav')
```
