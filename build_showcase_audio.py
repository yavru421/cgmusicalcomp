import os
import sys
import subprocess
import math
import shutil
import mido
import soundfile as sf
import numpy as np
from scipy.signal import resample_poly

WORKDIR = os.environ.get("CG_WORKDIR", r"C:\dev\CGMusicalComposition")
PYTHON_EXE = os.environ.get("CG_PYTHON", r"C:\Miniforge\python.exe")
SYNTH_PY = os.environ.get("CG_SYNTH_PY", r"C:\dev\speech-mcp-server\synth.py")
LILYPOND = os.environ.get("CG_LILYPOND", r"C:\dev\tools\lilypond\lilypond-2.24.4\bin\lilypond.exe")
FLUIDSYNTH = os.environ.get("CG_FLUIDSYNTH", r"C:\dev\tools\fluidsynth\bin\fluidsynth.exe")
SOUNDFONT = os.environ.get("CG_SOUNDFONT", r"C:\dev\tools\soundfonts\MuseScore_General.sf3")
SCRATCH_DIR = os.path.join(WORKDIR, "scratch_showcase")
os.makedirs(SCRATCH_DIR, exist_ok=True)

# ============================================================================
# Standard Concert Band Acoustic Seating Layout: MIDI CC 10 (Pan: 0-127, 64=Center)
# ============================================================================
CONCERT_BAND_PAN = {
    "flute": 38,                     # Left-Center (Front Row Woodwinds)
    "oboe": 52,                      # Center-Left (Inner Woodwinds)
    "clarinet": 30,                  # Front-Left (Clarinet Section Core)
    "alto sax": 80,                  # Center-Right (Saxophone Row)
    "trumpet": 92,                   # Back-Right (Upper Brass)
    "french horn": 48,               # Center-Left Back (Middle Brass)
    "trombone": 84,                  # Center-Right (Low Brass Slide Section)
    "tuba": 64,                      # Center-Back (Bass Anchor)
    "electric bass (finger)": 58,    # Center-Left (Rhythm Foundation)
    "cello": 82,                     # Right-Center (Strings Tenor)
    "glockenspiel": 22,              # Far-Left Back (Metallic Percussion)
    "marimba": 42,                   # Left-Center (Keyboard Percussion)
    "timpani": 72,                   # Center-Right Back (Kettle Drums)
    "standard kit": 64,              # Center-Back (Battery Percussion)
}

TUTTI_PAN_SEQUENCE = [
    38,  # 1. Flute
    52,  # 2. Oboe
    30,  # 3. Clarinet
    80,  # 4. Alto Sax
    92,  # 5. Trumpet
    48,  # 6. French Horn
    84,  # 7. Trombone
    64,  # 8. Tuba
    58,  # 9. Electric Bass
    82,  # 10. Cello
    22,  # 11. Glockenspiel
    42,  # 12. Marimba
    72,  # 13. Timpani
    64,  # 14. Percussion Battery
]

INSTRUMENTS = [
    (
        "01_flute",
        "Flute",
        "flute",
        "treble",
        r"""
        d''4(\p f''8 bes'' d'''4. c'''8 |
        bes''8 a'' g'' f'' g''4 f''8 d'') |
        ees''16(\mf f'' g'' a'' bes'' c''' d''' ees''' f'''8-. d'''-.) bes''4 |
        c'''8-.(\f d'''-. c'''-. bes''-.) f''2\fermata \bar "|."
        """,
        False
    ),
    (
        "02_oboe",
        "Oboe",
        "oboe",
        "treble",
        r"""
        bes'4(\mf c''8. d''16 ees''4 d''8 c'' |
        bes'4. g'8 f'2) |
        g'8(\p a' bes' c'' d''4. ees''8 |
        d''8 c'' bes' a' bes'2\fermata) \bar "|."
        """,
        False
    ),
    (
        "03_clarinet",
        "B-flat Clarinet",
        "clarinet",
        "treble",
        r"""
        d8(\p f g bes d'4 c'8 bes |
        g1) |
        bes'8(\mf c'' d'' ees'' f''4 g''8 f'' |
        ees''8 d'' c'' bes' d''2\fermata) \bar "|."
        """,
        False
    ),
    (
        "04_altosax",
        "Alto Saxophone",
        "alto sax",
        "treble",
        r"""
        f'4(\mf g'8. aes'16 bes'4 c''8 bes' |
        aes'8 f' ees' c' ees'4-^ r) |
        f'8-.(\f f'-.) r8 aes'16( bes' c''8-. ees''-. c''4) |
        bes'8( aes' f' ees' f'2\fermata) \bar "|."
        """,
        False
    ),
    (
        "05_trumpet",
        "B-flat Trumpet",
        "trumpet",
        "treble",
        r"""
        bes4.\f d'8 f'4 bes' |
        d''4. c''8 bes'4 r |
        f''8-.(\ff f''-.) d''-. bes'-. c''4. d''8 |
        bes'1\fermata \bar "|."
        """,
        False
    ),
    (
        "06_horn",
        "French Horn in F",
        "french horn",
        "treble",
        r"""
        bes8(\mf d' f' bes' d''4. c''8 |
        bes'4. f'8 d'2) |
        ees'4(\f f'8 g' bes'4. a'8 |
        f'1\fermata) \bar "|."
        """,
        False
    ),
    (
        "07_trombone",
        "Tenor Trombone",
        "trombone",
        "bass",
        r"""
        bes,4.\f d8 f4 bes |
        d'4. c'8 bes4 r8 f |
        g8-.(\ff aes-. g-. f-.) ees4. d8 |
        bes,1\fermata \bar "|."
        """,
        False
    ),
    (
        "08_tuba",
        "Tuba",
        "tuba",
        "bass",
        r"""
        bes,,4-.\f r8 f, bes,4-. r8 f, |
        bes,,4-. d,8-. f,-. bes,4-^ r |
        ees,4-. r8 bes,, ees,4-. r8 f, |
        bes,,1\fermata \bar "|."
        """,
        False
    ),
    (
        "09_electricbass",
        "Electric Bass",
        "electric bass (finger)",
        "bass",
        r"""
        bes,,8-.\f r bes,,16( c, d,8) f,8-. g,16( aes,) f,8-. r |
        bes,,8-. r bes,4-^ r8 f,8-. bes,,4 |
        ees,8-. ees,16( f, g,8) bes,8 c8-. d16( c) bes,8-. f, |
        bes,,1\fermata \bar "|."
        """,
        False
    ),
    (
        "10_cello",
        "Cello",
        "cello",
        "bass",
        r"""
        d4(\mf ees8. f16 g4 f8 ees |
        d4. bes,8 f,2) |
        g,8(\p a, bes, c d4. ees8 |
        d8 c bes, a, bes,2\fermata) \bar "|."
        """,
        False
    ),
    (
        "11_glockenspiel",
        "Glockenspiel",
        "glockenspiel",
        "treble",
        r"""
        bes''8\f d''' f''' bes''' d''''4. c''''8 |
        bes'''8 a''' g''' f''' g'''4 f''' |
        ees'''8 f''' g''' a''' bes'''4-^ d''''-^ |
        bes'''1\fermata \bar "|."
        """,
        False
    ),
    (
        "12_marimba",
        "Marimba",
        "marimba",
        "treble",
        r"""
        <bes d' f' bes'>1\f:32 |
        <ees' g' bes' ees''>2:32 <f' a' c'' f''>2:32 |
        bes'16(\mf d'' f'' bes'' d''' bes'' f'' d'' bes'8-.) d''-. f''-. bes''-. |
        <bes d' f' bes'>1\fermata \bar "|."
        """,
        False
    ),
    (
        "13_timpani",
        "Timpani",
        "timpani",
        "bass",
        r"""
        bes,1\p:32\< ~ |
        bes,2\ff:32 bes,4-^ r |
        f,4-^\f r bes,4-^ r |
        f,8-.\ff f,-. bes,4-^ r2\fermata \bar "|."
        """,
        False
    ),
    (
        "14_percussion",
        "Concert Percussion",
        "standard kit",
        "percussion",
        r"""
        sn1\p:32\< ~ |
        sn2\ff:32 sn8^"R" sn16^"L" sn^"R" sn8-^ r |
        bd4\f r8 sn cymc4-^ r8 sn |
        sn8\ff sn16 sn sn8 sn bd4-^ r\fermata \bar "|."
        """,
        True
    ),
    (
        "15_tutti",
        "Full Concert Band Ensemble",
        "all",
        "score",
        r"""
        % Full Tutti
        """,
        False
    )
]

def apply_midi_pan_to_file(mid_path: str, pan_val: int) -> None:
    """Injects CC 10 (Pan) into all non-drum tracks of a single-instrument MIDI file."""
    try:
        mid = mido.MidiFile(mid_path)
        for track in mid.tracks:
            # Find the channel used
            ch = 0
            for msg in track:
                if hasattr(msg, "channel"):
                    ch = msg.channel
                    break
            track.insert(0, mido.Message('control_change', channel=ch, control=10, value=pan_val, time=0))
        mid.save(mid_path)
    except Exception as e:
        print(f"[WARN] Failed to apply CC 10 pan to {mid_path}: {e}", file=sys.stderr)

def apply_tutti_midi_panning(mid_path: str) -> None:
    """Injects CC 10 (Pan) into each track of the multi-track Tutti MIDI file based on seating sequence."""
    try:
        mid = mido.MidiFile(mid_path)
        pan_idx = 0
        for track in mid.tracks:
            # Check if this track contains note events
            has_notes = any(msg.type == 'note_on' for msg in track)
            if has_notes:
                pan_val = TUTTI_PAN_SEQUENCE[pan_idx] if pan_idx < len(TUTTI_PAN_SEQUENCE) else 64
                ch = 0
                for msg in track:
                    if hasattr(msg, "channel"):
                        ch = msg.channel
                        break
                track.insert(0, mido.Message('control_change', channel=ch, control=10, value=pan_val, time=0))
                pan_idx += 1
        mid.save(mid_path)
        print(f"[PAN] Applied concert band stereo spatialization (CC 10) across {pan_idx} tracks.")
    except Exception as e:
        print(f"[WARN] Failed to apply tutti CC 10 pan: {e}", file=sys.stderr)

def high_quality_resample(audio_data: np.ndarray, orig_sr: int, target_sr: int) -> np.ndarray:
    """Polyphase sinc filtering for anti-aliased sample rate conversion."""
    if orig_sr == target_sr:
        return audio_data
    gcd = math.gcd(orig_sr, target_sr)
    up = target_sr // gcd
    down = orig_sr // gcd
    return resample_poly(audio_data, up, down, axis=0).astype(np.float32)

def synthesize_voice(text, out_wav):
    cmd = [PYTHON_EXE, SYNTH_PY, text, "gideon", "1.05"]
    try:
        res = subprocess.run(cmd, capture_output=True, text=True, cwd=WORKDIR, timeout=60)
        for line in res.stdout.splitlines():
            if line.startswith("SYNTH_WAV:"):
                gen_file = line.replace("SYNTH_WAV:", "").strip()
                if os.path.exists(gen_file):
                    data, sr = sf.read(gen_file)
                    sf.write(out_wav, data, sr)
                    return True
    except Exception as e:
        print(f"[WARN] Voice synthesis exception: {e}", file=sys.stderr)
    return False

def render_instrument_solo(tag, midi_inst, clef, notes, is_drum, out_wav):
    ly_file = os.path.join(SCRATCH_DIR, f"{tag}.ly")
    mid_file = os.path.join(SCRATCH_DIR, f"{tag}.mid")
    
    if is_drum:
        staff_def = f'\\new DrumStaff \\with {{ midiInstrument = #"{midi_inst}" }} {{ \\drummode {{ \\tempo 4 = 100 {notes} }} }}'
    else:
        staff_def = f'\\new Staff \\with {{ midiInstrument = #"{midi_inst}" }} {{ \\fixed c\' {{ \\key bes \\major \\time 4/4 \\tempo 4 = 100 \\clef {clef} {notes} }} }}'
        
    ly_content = f"""\\version "2.24.0"
\\include "articulate.ly"
\\score {{
  {staff_def}
  \\midi {{ }}
}}
"""
    with open(ly_file, "w", encoding="utf-8") as f:
        f.write(ly_content)
        
    subprocess.run([LILYPOND, ly_file], capture_output=True, text=True, cwd=SCRATCH_DIR, timeout=60)
    if not os.path.exists(mid_file):
        return False

    # Apply CC 10 Panning based on Concert Band seating position
    pan_val = CONCERT_BAND_PAN.get(midi_inst, 64)
    apply_midi_pan_to_file(mid_file, pan_val)
        
    cmd = [
        FLUIDSYNTH,
        "-F", out_wav,
        "-o", "synth.reverb.active=1",
        "-o", "synth.reverb.room-size=0.75",
        "-o", "synth.reverb.damp=0.25",
        "-o", "synth.reverb.width=0.85",
        "-o", "synth.reverb.level=0.55",
        "-o", "synth.gain=0.35",
        SOUNDFONT,
        mid_file
    ]
    subprocess.run(cmd, capture_output=True, text=True, cwd=SCRATCH_DIR, timeout=120)
    return os.path.exists(out_wav)

def render_tutti_solo(out_wav):
    ly_file = os.path.join(SCRATCH_DIR, "15_tutti.ly")
    mid_file = os.path.join(SCRATCH_DIR, "15_tutti.mid")
    
    ly_content = r"""\version "2.24.0"
\include "articulate.ly"
global = { \key bes \major \time 4/4 \tempo 4 = 100 }
\score {
  <<
    \new Staff \with { midiInstrument = #"flute" } { \fixed c' { \global \clef treble d'''4.\fff c'''8 bes''4 f'' | g''4. f''8 d''4 bes' | ees'''8-.(\ffff d'''-. c'''-. bes''-.) f'''4-^ f'''4-^ | <bes'' d''' f'''>1\fermata \bar "|." } }
    \new Staff \with { midiInstrument = #"oboe" } { \fixed c' { \global \clef treble bes'4.\fff c''8 d''4 d'' | ees''4. d''8 bes'4 g' | c''8-.(\ffff d''-. ees''-. f''-.) d''4-^ d''4-^ | d''1\fermata \bar "|." } }
    \new Staff \with { midiInstrument = #"clarinet" } { \fixed c' { \global \clef treble f''4.\fff ees''8 d''4 bes' | c''4. bes'8 g'4 f' | g'8-.(\ffff a'-. bes'-. c''-.) bes'4-^ bes'4-^ | bes'1\fermata \bar "|." } }
    \new Staff \with { midiInstrument = #"alto sax" } { \fixed c' { \global \clef treble d''4.\fff c''8 bes'4 f' | g'4. f'8 ees'4 d' | ees'8-.(\ffff f'-. g'-. a'-.) f'4-^ f'4-^ | f'1\fermata \bar "|." } }
    \new Staff \with { midiInstrument = #"trumpet" } { \fixed c' { \global \clef treble bes'4.\fff d''8 f''4 bes'' | bes''4. a''8 g''4 f'' | ees''8-.(\ffff f''-. g''-. a''-.) bes''4-^ bes''4-^ | bes''1\fermata \bar "|." } }
    \new Staff \with { midiInstrument = #"french horn" } { \fixed c' { \global \clef treble f'4.\fff g'8 f'4 d' | ees'4. d'8 c'4 bes | c'8-.(\ffff d'-. ees'-. f'-.) d'4-^ d'4-^ | d'1\fermata \bar "|." } }
    \new Staff \with { midiInstrument = #"trombone" } { \fixed c' { \global \clef bass d'4.\fff c'8 bes4 f | g4. f8 ees4 d | ees8-.(\ffff f-. g-. a-.) bes4-^ bes4-^ | bes1\fermata \bar "|." } }
    \new Staff \with { midiInstrument = #"tuba" } { \fixed c' { \global \clef bass bes,,4.\fff d,8 f,4 bes, | ees,4. d,8 c,4 f,, | bes,,8-.(\ffff c,-. d,-. ees,-.) f,4-^ f,,4-^ | bes,,1\fermata \bar "|." } }
    \new Staff \with { midiInstrument = #"electric bass (finger)" } { \fixed c' { \global \clef bass bes,,4.\fff d,8 f,4 bes, | ees,4. d,8 c,4 f,, | bes,,8-.(\ffff c,-. d,-. ees,-.) f,4-^ f,,4-^ | bes,,1\fermata \bar "|." } }
    \new Staff \with { midiInstrument = #"cello" } { \fixed c' { \global \clef bass bes4.\fff f8 d4 bes, | ees4. d8 c4 f, | g,8-.(\ffff a,-. bes,-. c-.) d4-^ d4-^ | bes,1\fermata \bar "|." } }
    \new Staff \with { midiInstrument = #"glockenspiel" } { \fixed c' { \global \clef treble d'''4.\fff c'''8 bes''4 f'' | g''4. f''8 d''4 bes' | ees'''8-.(\ffff d'''-. c'''-. bes''-.) f'''4-^ f'''4-^ | bes'''1\fermata \bar "|." } }
    \new Staff \with { midiInstrument = #"marimba" } { \fixed c' { \global \clef treble <bes d' f' bes'>4.\fff <c' ees' g' c''>8 <d' f' bes' d''>4 <f' a' c'' f''> | <g' bes' d'' g''>4. <f' a' c'' f''>8 <ees' g' bes' ees''>4 <d' f' bes' d''> | <ees' g' bes' ees''>8-.(\ffff <f' a' c'' f''>-. <g' bes' d'' g''>-. <a' c'' f'' a''>-.) <bes' d'' f'' bes''>4-^ <bes' d'' f'' bes''>4-^ | <bes d' f' bes'>1\fermata \bar "|." } }
    \new Staff \with { midiInstrument = #"timpani" } { \fixed c' { \global \clef bass bes,4.\fff r8 f,4 bes, | ees4. d8 c4 f, | bes,8-.(\ffff bes,-. f,-. f,-.) bes,4-^ bes,4-^ | bes,1\fermata \bar "|." } }
    \new DrumStaff \with { midiInstrument = #"standard kit" } { \drummode { \global bd4.\fff sn8 bd4 sn | bd4 sn8 sn bd4 sn | sn8-.(\ffff sn-. sn-. sn-.) cymc4-^ cymc4-^ | cymc1\fermata \bar "|." } }
  >>
  \midi { }
}
"""
    with open(ly_file, "w", encoding="utf-8") as f:
        f.write(ly_content)
    subprocess.run([LILYPOND, ly_file], capture_output=True, text=True, cwd=SCRATCH_DIR, timeout=90)
    
    # Apply full concert band spatial panning across tutti staves
    apply_tutti_midi_panning(mid_file)

    cmd = [
        FLUIDSYNTH,
        "-F", out_wav,
        "-o", "synth.reverb.active=1",
        "-o", "synth.reverb.room-size=0.75",
        "-o", "synth.reverb.damp=0.25",
        "-o", "synth.reverb.width=0.85",
        "-o", "synth.reverb.level=0.55",
        "-o", "synth.gain=0.35",
        SOUNDFONT,
        mid_file
    ]
    subprocess.run(cmd, capture_output=True, text=True, cwd=SCRATCH_DIR, timeout=120)
    return os.path.exists(out_wav)

def assemble_narrated_suite():
    target_sr = 44100
    timeline = []
    
    print(f"=== Wisconsin Rapids City Band Instrument Benchmark Suite ===")
    print(f"Configuring concert band spatialization & polyphase resampling...")
    
    for idx, (tag, spoken_name, midi_inst, clef, notes, is_drum) in enumerate(INSTRUMENTS, 1):
        voice_wav = os.path.join(SCRATCH_DIR, f"voice_{tag}.wav")
        solo_wav = os.path.join(SCRATCH_DIR, f"solo_{tag}.wav")
        
        print(f"\n[{idx}/15] Synthesizing speech label: '{spoken_name}'...")
        synthesize_voice(spoken_name, voice_wav)
        
        pan_val = CONCERT_BAND_PAN.get(midi_inst, 64)
        print(f"[{idx}/15] Rendering instrument solo: {tag} ({midi_inst}, CC10 Pan={pan_val})...")
        if tag == "15_tutti":
            render_tutti_solo(solo_wav)
        else:
            render_instrument_solo(tag, midi_inst, clef, notes, is_drum, solo_wav)
            
        if os.path.exists(voice_wav):
            v_data, v_sr = sf.read(voice_wav)
            if v_data.ndim == 1:
                v_data = np.column_stack([v_data, v_data])
            if v_sr != target_sr:
                v_data = high_quality_resample(v_data, v_sr, target_sr)
            v_peak = np.max(np.abs(v_data))
            if v_peak > 0:
                v_data = (v_data / v_peak) * 0.85
            timeline.append(v_data)
            
        timeline.append(np.zeros((int(target_sr * 0.35), 2), dtype=np.float32))
        
        if os.path.exists(solo_wav):
            s_data, s_sr = sf.read(solo_wav)
            if s_data.ndim == 1:
                s_data = np.column_stack([s_data, s_data])
            if s_sr != target_sr:
                s_data = high_quality_resample(s_data, s_sr, target_sr)
            timeline.append(s_data)
            
        timeline.append(np.zeros((int(target_sr * 0.75), 2), dtype=np.float32))

    timeline.append(np.zeros((int(target_sr * 1.5), 2), dtype=np.float32))
    
    full_audio = np.concatenate(timeline, axis=0)
    master_peak = np.max(np.abs(full_audio))
    if master_peak > 0:
        full_audio = (full_audio / master_peak) * 0.95
        
    master_out = os.path.join(WORKDIR, "benchmark_instruments_showcase_narrated.wav")
    sf.write(master_out, full_audio, target_sr, subtype="PCM_16")
    print(f"\n[SUCCESS] Master benchmark narrated audio written to: {master_out}")
    print(f"          Total duration: {len(full_audio) / target_sr:.2f} seconds.")

if __name__ == "__main__":
    assemble_narrated_suite()
