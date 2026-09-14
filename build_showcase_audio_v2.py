#!/usr/bin/env python3
"""
Narrated Benchmark Suite Audio Compiler v2 (build_showcase_audio_v2.py)
Generates high-fidelity narrated audio benchmark for the 14-Voice Concert Band Suite.
Includes alternating Kokoro neural voice announcements (Malachi & Mercy personas),
authentic Wisconsin lexicon, and calibrated audio mixing (instruments front & center at 0.88 peak,
narration comfortably tucked at 0.38 peak).
"""

import os
import sys
import subprocess
import mido
import soundfile as sf
import numpy as np
from scipy.signal import resample_poly

WORKDIR = os.path.dirname(os.path.abspath(__file__))
PYTHON_EXE = sys.executable
SYNTH_PY = r"C:\dev\speech-mcp-server\synth.py"
LILYPOND = r"C:\dev\tools\lilypond\lilypond-2.24.4\bin\lilypond.exe"
FLUIDSYNTH = r"C:\dev\tools\fluidsynth\bin\fluidsynth.exe"
SOUNDFONT = r"C:\dev\tools\soundfonts\MuseScore_General.sf3"
SCRATCH_DIR = os.path.join(WORKDIR, "scratch_showcase_v2")
os.makedirs(SCRATCH_DIR, exist_ok=True)

# ============================================================================
# Concert Band Acoustic Seating Layout: MIDI CC 10 (Pan: 0-127, 64=Center)
# ============================================================================
CONCERT_BAND_PAN = {
    "flute": 38,                     # Left-Center (Front Row Woodwinds)
    "oboe": 52,                      # Center-Left (Inner Woodwinds)
    "clarinet": 30,                  # Front-Left (Clarinet Section Core)
    "bassoon": 60,                   # Center (Double Reed Low Anchor)
    "alto sax": 78,                  # Center-Right (Saxophone Row)
    "tenor sax": 84,                 # Right-Center (Saxophone Row)
    "trumpet": 92,                   # Back-Right (Upper Brass)
    "french horn": 46,               # Center-Left Back (Middle Brass)
    "trombone": 82,                  # Center-Right (Low Brass Slide Section)
    "euphonium": 72,                 # Center-Right (Cello of the Band)
    "tuba": 64,                      # Center-Back (Bass Foundation)
    "timpani": 74,                   # Center-Right Back (Kettle Drums)
    "marimba": 36,                   # Left-Center (Keyboard Percussion)
    "standard kit": 64,              # Center-Back (Battery Percussion)
}

TUTTI_PAN_SEQUENCE = [
    38,  # 1. Flute
    52,  # 2. Oboe
    30,  # 3. Clarinet
    60,  # 4. Bassoon
    78,  # 5. Alto Sax
    84,  # 6. Tenor Sax
    92,  # 7. Trumpet
    46,  # 8. French Horn
    82,  # 9. Trombone
    72,  # 10. Euphonium
    64,  # 11. Tuba
    74,  # 12. Timpani
    36,  # 13. Tuned Percussion
    64,  # 14. Battery Percussion
]

INSTRUMENTS = [
    (
        "01_flute",
        "From Wisconsin Rapids to Green Bay, here is the Flute.",
        "mercy",
        "flute",
        "treble",
        r"""
        d'4(\p f'8 bes' d''4. c''8 |
        bes'8 a' g' f' g'4 f'8 d') |
        ees'16(\mf f' g' a' bes' c'' d'' ees'' f''8-. d''-.) bes'4 |
        c''8-.(\f d''-. c''-. bes'-.) f'2\fermata \bar "|."
        """,
        False
    ),
    (
        "02_oboe",
        "Singing like an evening over Waupaca, the Oboe.",
        "malachi",
        "oboe",
        "treble",
        r"""
        bes4(\mf c'8. d'16 ees'4 d'8 c' |
        bes4. g8 f2) |
        g8(\p a bes c' d'4. ees'8 |
        d'8 c' bes a bes2\fermata) \bar "|."
        """,
        False
    ),
    (
        "03_clarinet",
        "Down the line from Weyauwega, the B-flat Clarinet.",
        "mercy",
        "clarinet",
        "treble",
        r"""
        d,8(\p f, g, bes, d4 c8 bes, |
        g,2.) r8 f(\mf |
        bes8 c' d' ees' f'4 g'8 f' |
        ees'8 d' c' bes d'2\fermata) \bar "|."
        """,
        False
    ),
    (
        "04_bassoon",
        "Straight out of Wausau, the Bassoon.",
        "malachi",
        "bassoon",
        "bass",
        r"""
        bes,,8-.\mf r bes,,16( c, d,8) f,8-. g,16( a,) bes,8-. r |
        bes,,4-^ f,4-^ bes,8-.( a,-. g,-. f,-.) |
        d4(\p ees8. d16 c4 d8 c |
        bes,8 c d ees f2\fermata) \bar "|."
        """,
        False
    ),
    (
        "05_altosax",
        "Rich as Wisconsin cheddar, the Alto Saxophone.",
        "mercy",
        "alto sax",
        "treble",
        r"""
        f4(\mf g8. aes16 bes4 c'8 bes |
        aes8 f ees c ees4-^ r) |
        f8-.(\f f-.) r8 aes16( bes c'8-. ees'-. c'4) |
        bes8( aes f ees f2\fermata) \bar "|."
        """,
        False
    ),
    (
        "06_tenorsax",
        "Cruising past Oshkosh, the Tenor Saxophone.",
        "malachi",
        "tenor sax",
        "treble",
        r"""
        bes,4(\mf d8. ees16 f4 g8 f |
        ees8 c bes, g, bes,4-^ r) |
        d8-.(\f d-.) r8 f16( g bes8-. c'-. bes4) |
        g8( f d c d2\fermata) \bar "|."
        """,
        False
    ),
    (
        "07_trumpet",
        "Bright as the lights in Ashwaubenon, the B-flat Trumpet.",
        "mercy",
        "trumpet",
        "treble",
        r"""
        bes,4.\f d8 f4 bes |
        d'4. c'8 bes4 r |
        f'8-.(\ff f'-.) d'-. bes-. c'4. d'8 |
        bes1\fermata \bar "|."
        """,
        False
    ),
    (
        "08_horn",
        "Calling deep through the Chequamegon woods, the French Horn.",
        "malachi",
        "french horn",
        "treble",
        r"""
        bes,8(\mf d f bes d'4. c'8 |
        bes4. f8 d2) |
        ees4(\f f8 g bes4. a8 |
        f1\fermata) \bar "|."
        """,
        False
    ),
    (
        "09_trombone",
        "Pure brass thunder rolling over Fond du Lac, the Tenor Trombone.",
        "mercy",
        "trombone",
        "bass",
        r"""
        bes,,4.\f d,8 f,4 bes, |
        d4. c8 bes,4 r8 f, |
        g,8-.(\ff aes,-. g,-. f,-.) ees,4. d,8 |
        bes,,1\fermata \bar "|."
        """,
        False
    ),
    (
        "10_euphonium",
        "Velvet singing from Prairie du Chien, the Euphonium.",
        "malachi",
        "trombone",
        "bass",
        r"""
        d,4(\mf ees,8. f,16 g,4 f,8 ees, |
        d,4. bes,,8 f,,2) |
        bes,,16(\f c, d, ees, f, g, a, bes, c8-.) d-. ees-. f-. |
        d8( c bes, a, bes,2\fermata) \bar "|."
        """,
        False
    ),
    (
        "11_tuba",
        "Rock solid bedrock from Baraboo to Milwaukee, the Tuba.",
        "mercy",
        "tuba",
        "bass",
        r"""
        bes,,,4-.\f r8 f,, bes,,4-. r8 f,, |
        bes,,,4-. d,,8-. f,,-. bes,,4-^ r |
        ees,,4-. r8 bes,,, ees,,4-. r8 f,, |
        bes,,,1\fermata \bar "|."
        """,
        False
    ),
    (
        "12_timpani",
        "Shaking the kettle moraine, the Timpani.",
        "malachi",
        "timpani",
        "bass",
        r"""
        bes,,1\p:32\< ~ |
        bes,,2\ff:32 bes,,4-^ r |
        f,,4-^\f r bes,,4-^ r |
        f,,8-.\ff f,,-. bes,,4-^ r2\fermata \bar "|."
        """,
        False
    ),
    (
        "13_marimba",
        "Crystalline sparkle over Lake Winnebago, Tuned Percussion.",
        "mercy",
        "marimba",
        "treble",
        r"""
        <bes, d f bes>1\f:32 |
        <ees g bes ees'>2:32 <f a c' f'>2:32 |
        bes,16(\mf d f bes d' bes f d bes,8-.) d-. f-. bes-. |
        <bes, d f bes>1\fermata \bar "|."
        """,
        False
    ),
    (
        "14_percussion",
        "Driving the Wisconsin Rapids parade cadence, Concert Battery Percussion.",
        "malachi",
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
        "All fourteen voices united in Wisconsin Rapids, the Grand Tutti Climax!",
        "malachi",
        "all",
        "score",
        r"""
        % Full Tutti
        """,
        False
    )
]

def apply_midi_pan_to_file(mid_path: str, pan_val: int) -> None:
    """Injects CC 10 (Pan) into all non-drum tracks."""
    try:
        mid = mido.MidiFile(mid_path)
        for track in mid.tracks:
            ch = 0
            for msg in track:
                if hasattr(msg, "channel"):
                    ch = msg.channel
                    break
            if ch != 9:  # Do not pan drum channel 9/10
                pan_msg = mido.Message('control_change', channel=ch, control=10, value=pan_val, time=0)
                track.insert(0, pan_msg)
        mid.save(mid_path)
    except Exception as e:
        print(f"[WARN] Failed to apply CC 10 pan to {mid_path}: {e}", file=sys.stderr)

def apply_tutti_midi_panning(mid_path: str) -> None:
    """Applies authentic spatial seating pan across all 14 tutti voices."""
    try:
        mid = mido.MidiFile(mid_path)
        track_idx = 0
        for track in mid.tracks:
            has_notes = any(msg.type == 'note_on' for msg in track)
            if has_notes:
                pan_val = TUTTI_PAN_SEQUENCE[track_idx % len(TUTTI_PAN_SEQUENCE)]
                track_idx += 1
                ch = 0
                for msg in track:
                    if hasattr(msg, "channel"):
                        ch = msg.channel
                        break
                if ch != 9:
                    pan_msg = mido.Message('control_change', channel=ch, control=10, value=pan_val, time=0)
                    track.insert(0, pan_msg)
        mid.save(mid_path)
    except Exception as e:
        print(f"[WARN] Failed to apply tutti panning: {e}", file=sys.stderr)

def high_quality_resample(audio_data: np.ndarray, orig_sr: int, target_sr: int) -> np.ndarray:
    if orig_sr == target_sr:
        return audio_data
    gcd = np.gcd(orig_sr, target_sr)
    up = target_sr // gcd
    down = orig_sr // gcd
    return resample_poly(audio_data, up, down, axis=0).astype(np.float32)

def synthesize_voice(text: str, persona: str, out_wav: str) -> bool:
    """Synthesizes speech using Kokoro ONNX neural engine with selected persona & Wisconsin lexicon."""
    cmd = [PYTHON_EXE, SYNTH_PY, text, persona, "1.0"]
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

    pan_val = CONCERT_BAND_PAN.get(midi_inst, 64)
    apply_midi_pan_to_file(mid_file, pan_val)
        
    cmd = [
        FLUIDSYNTH,
        "-ni",
        "-F", out_wav,
        "-r", "44100",
        "-o", "synth.reverb.active=1",
        "-o", "synth.reverb.room-size=0.75",
        "-o", "synth.reverb.damp=0.25",
        "-o", "synth.reverb.width=0.85",
        "-o", "synth.reverb.level=0.55",
        "-o", "synth.gain=0.75",
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
    \new Staff \with { midiInstrument = #"flute" } { \fixed c' { \global \clef treble d''4.\fff c''8 bes'4 f' | g'4. f'8 d'4 bes | c'4.\fff d'8 ees'4 f' | g'2 f' | bes'4.\fff c''8 d''4 c'' | bes'4. f'8 g'4 f' | ees''8-.(\ffff d''-. c''-. bes'-.) f''4-^ f''4-^ | f''1\fermata \bar "|." } }
    \new Staff \with { midiInstrument = #"oboe" } { \fixed c' { \global \clef treble bes4.\fff c'8 d'4 d' | ees'4. d'8 bes4 g | g4.\fff a8 bes4 c' | ees'2 d' | bes4.\fff c'8 d'4 c' | bes4. g8 f4 d | g8-.(\ffff a-. bes-. c'-.) d'4-^ d'4-^ | d'1\fermata \bar "|." } }
    \new Staff \with { midiInstrument = #"clarinet" } { \fixed c' { \global \clef treble f'4.\fff ees'8 d'4 bes | c'4. bes8 g4 f | ees4.\fff f8 g4 a | bes2 bes | f'4.\fff g'8 f'4 d' | ees'4. d'8 c'4 bes | g8-.(\ffff a-. bes-. c'-.) bes4-^ bes4-^ | bes1\fermata \bar "|." } }
    \new Staff \with { midiInstrument = #"bassoon" } { \fixed c' { \global \clef bass bes,,4.\fff d,8 f,4 bes, | ees,4. d,8 c,4 f,, | c,4.\fff d,8 ees,4 f, | ees,2 d, | bes,,4.\fff d,8 f,4 bes, | ees,4. d,8 c,4 f,, | bes,,8-.(\ffff c,-. d,-. ees,-.) f,4-^ f,,4-^ | bes,,1\fermata \bar "|." } }
    \new Staff \with { midiInstrument = #"alto sax" } { \fixed c' { \global \clef treble d'4.\fff c'8 bes4 f | g4. f8 ees4 d | ees4.\fff f8 g4 a | bes2 a | d'4.\fff c'8 bes4 f | g4. f8 ees4 d | ees8-.(\ffff f-. g-. a-.) f4-^ f4-^ | f1\fermata \bar "|." } }
    \new Staff \with { midiInstrument = #"tenor sax" } { \fixed c' { \global \clef treble bes,4.\fff d8 f4 bes | bes4. a8 g4 f | g4.\fff f8 ees4 d | ees2 f | bes,4.\fff d8 f4 bes | bes4. a8 g4 f | g8-.(\ffff f-. ees-. d-.) d4-^ d4-^ | d1\fermata \bar "|." } }
    \new Staff \with { midiInstrument = #"trumpet" } { \fixed c' { \global \clef treble bes4.\fff d'8 f'4 bes | d'4. c'8 bes4 f | ees4.\fff f8 g4 a | bes2 c' | d'4.\fff ees'8 f'4 d' | ees'4. d'8 c'4 bes | ees'8-.(\ffff d'-. c'-. bes-.) f'4-^ f'4-^ | bes1\fermata \bar "|." } }
    \new Staff \with { midiInstrument = #"french horn" } { \fixed c' { \global \clef treble f4.\fff g8 f4 d | ees4. d8 c4 bes, | c4.\fff d8 ees4 f | g2 f | f4.\fff g8 f4 d | ees4. d8 c4 bes, | c8-.(\ffff d-. ees-. f-.) d4-^ d4-^ | d1\fermata \bar "|." } }
    \new Staff \with { midiInstrument = #"trombone" } { \fixed c' { \global \clef bass d4.\fff c8 bes,4 f, | g,4. f,8 ees,4 d, | ees,4.\fff f,8 g,4 a, | bes,2 a, | d4.\fff c8 bes,4 f, | g,4. f,8 ees,4 d, | ees,8-.(\ffff f,-. g,-. a,-.) bes,4-^ bes,4-^ | bes,1\fermata \bar "|." } }
    \new Staff \with { midiInstrument = #"trombone" } { \fixed c' { \global \clef bass bes,4.\fff c8 d4 d | ees4. d8 bes,4 g, | c4.\fff d8 ees4 f | g2 f | bes,4.\fff c8 d4 d | ees4. d8 bes,4 g, | c8-.(\ffff d-. ees-. f-.) d4-^ d4-^ | bes,1\fermata \bar "|." } }
    \new Staff \with { midiInstrument = #"tuba" } { \fixed c' { \global \clef bass bes,,,4.\fff d,,8 f,,4 bes,, | ees,,4. d,,8 c,,4 f,, | c,,4.\fff d,,8 ees,,4 f,, | ees,,2 f,, | bes,,,4.\fff d,,8 f,,4 bes,, | ees,,4. d,,8 c,,4 f,, | bes,,,8-.(\ffff c,,-. d,,-. ees,,-.) f,,4-^ f,,4-^ | bes,,,1\fermata \bar "|." } }
    \new Staff \with { midiInstrument = #"timpani" } { \fixed c' { \global \clef bass bes,,4.\fff r8 f,,4 bes,, | ees,4. r8 c,4 f,, | c,4.\fff r8 ees,4 f,, | ees,2 f,, | bes,,4.\fff r8 f,,4 bes,, | ees,4. r8 c,4 f,, | bes,,8-.(\ffff bes,,-. f,,-. f,,-.) bes,,4-^ bes,,4-^ | bes,,1\fermata \bar "|." } }
    \new Staff \with { midiInstrument = #"marimba" } { \fixed c' { \global \clef treble <bes, d f bes>4.\fff <c ees g c'>8 <d f bes d'>4 <f a c' f'> | <g bes d' g'>4. <f a c' f'>8 <ees g bes ees'>4 <d f bes d'> | <c ees g c'>4.\fff <d f bes d'>8 <ees g bes ees'>4 <f a c' f'> | <g bes d' g'>2 <f a c' f'> | <bes, d f bes>4.\fff <c ees g c'>8 <d f bes d'>4 <f a c' f'> | <g bes d' g'>4. <f a c' f'>8 <ees g bes ees'>4 <d f bes d'> | <ees g bes ees'>8-.(\ffff <f a c' f'>-. <g bes d' g'>-. <a c' f'>-.) <bes d' f'>4-^ <bes d' f'>4-^ | <bes, d f bes>1\fermata \bar "|." } }
    \new DrumStaff \with { midiInstrument = #"standard kit" } { \drummode { \global bd4.\fff sn8 bd4 sn | bd4 sn8 sn bd4 sn | bd4.\fff sn8 bd4 sn | bd4 sn8 sn cymc4 sn | bd4.\fff sn8 bd4 sn | bd4 sn8 sn bd4 sn | sn8-.(\ffff sn-. sn-. sn-.) cymc4-^ cymc4-^ | cymc1\fermata \bar "|." } }
  >>
  \midi { }
}
"""
    with open(ly_file, "w", encoding="utf-8") as f:
        f.write(ly_content)
    subprocess.run([LILYPOND, ly_file], capture_output=True, text=True, cwd=SCRATCH_DIR, timeout=90)
    apply_tutti_midi_panning(mid_file)

    cmd = [
        FLUIDSYNTH,
        "-ni",
        "-F", out_wav,
        "-r", "44100",
        "-o", "synth.reverb.active=1",
        "-o", "synth.reverb.room-size=0.75",
        "-o", "synth.reverb.damp=0.25",
        "-o", "synth.reverb.width=0.85",
        "-o", "synth.reverb.level=0.55",
        "-o", "synth.gain=0.75",
        SOUNDFONT,
        mid_file
    ]
    subprocess.run(cmd, capture_output=True, text=True, cwd=SCRATCH_DIR, timeout=120)
    return os.path.exists(out_wav)

def assemble_narrated_suite():
    target_sr = 44100
    timeline = []
    
    print("=== Wisconsin Rapids City Band Instrument Benchmark Suite v2 ===")
    print("Synthesizing 14-Voice Concert Band Audio with Malachi & Mercy (Wisconsin Lexicon)...")
    print("Enforcing Audio Level Hierarchy: Instruments front & center (0.88 peak), Narration tucked (0.38 peak).")
    
    for idx, (tag, spoken_text, persona, midi_inst, clef, notes, is_drum) in enumerate(INSTRUMENTS, 1):
        voice_wav = os.path.join(SCRATCH_DIR, f"voice_{tag}.wav")
        solo_wav = os.path.join(SCRATCH_DIR, f"solo_{tag}.wav")
        
        print(f"\n[{idx}/15] Synthesizing speech ({persona.upper()}): '{spoken_text}'...")
        synthesize_voice(spoken_text, persona, voice_wav)
        
        pan_val = CONCERT_BAND_PAN.get(midi_inst, 64)
        print(f"[{idx}/15] Rendering instrument solo: {tag} ({midi_inst}, CC10 Pan={pan_val})...")
        if tag == "15_tutti":
            render_tutti_solo(solo_wav)
        else:
            render_instrument_solo(tag, midi_inst, clef, notes, is_drum, solo_wav)
            
        # 1. Voice Narration: Scaled to 0.38 peak (subordinate to instruments)
        if os.path.exists(voice_wav):
            v_data, v_sr = sf.read(voice_wav)
            if v_data.ndim == 1:
                v_data = np.column_stack([v_data, v_data])
            if v_sr != target_sr:
                v_data = high_quality_resample(v_data, v_sr, target_sr)
            v_peak = np.max(np.abs(v_data))
            if v_peak > 0:
                v_data = (v_data / v_peak) * 0.38  # Tucked comfortably in the mix
            timeline.append(v_data)
            
        timeline.append(np.zeros((int(target_sr * 0.35), 2), dtype=np.float32))
        
        # 2. Solo Instrument: Scaled to 0.88 peak (commanding, rich concert presence)
        if os.path.exists(solo_wav):
            s_data, s_sr = sf.read(solo_wav)
            if s_data.ndim == 1:
                s_data = np.column_stack([s_data, s_data])
            if s_sr != target_sr:
                s_data = high_quality_resample(s_data, s_sr, target_sr)
            s_peak = np.max(np.abs(s_data))
            if s_peak > 0:
                s_data = (s_data / s_peak) * 0.88  # Front and center
            timeline.append(s_data)
            
        timeline.append(np.zeros((int(target_sr * 0.75), 2), dtype=np.float32))

    timeline.append(np.zeros((int(target_sr * 1.5), 2), dtype=np.float32))
    
    full_audio = np.concatenate(timeline, axis=0)
    master_peak = np.max(np.abs(full_audio))
    if master_peak > 0:
        full_audio = (full_audio / master_peak) * 0.95
        
    master_out = os.path.join(WORKDIR, "benchmark_instruments_showcase_v2_narrated.wav")
    sf.write(master_out, full_audio, target_sr, subtype="PCM_16")
    print(f"\n[SUCCESS] Master benchmark v2 narrated audio written to: {master_out}")
    print(f"          Total duration: {len(full_audio) / target_sr:.2f} seconds.")

    # Encode MP3 master
    mp3_out = os.path.join(WORKDIR, "showcase_narrated_v2.mp3")
    cmd_mp3 = ["ffmpeg", "-y", "-i", master_out, "-b:a", "192k", mp3_out]
    res_mp3 = subprocess.run(cmd_mp3, capture_output=True, text=True, cwd=WORKDIR)
    if res_mp3.returncode == 0:
        print(f"[SUCCESS] High-fidelity MP3 encoded: {mp3_out}")

if __name__ == "__main__":
    assemble_narrated_suite()
