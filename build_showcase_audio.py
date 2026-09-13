import os
import subprocess
import soundfile as sf
import numpy as np

WORKDIR = r"C:\dev\CGMusicalComposition"
PYTHON_EXE = r"C:\Miniforge\python.exe"
SYNTH_PY = r"C:\dev\speech-mcp-server\synth.py"
LILYPOND = r"C:\dev\tools\lilypond\lilypond-2.24.4\bin\lilypond.exe"
FLUIDSYNTH = r"C:\dev\tools\fluidsynth\bin\fluidsynth.exe"
SOUNDFONT = r"C:\dev\tools\soundfonts\MuseScore_General.sf3"
SCRATCH_DIR = os.path.join(WORKDIR, "scratch_showcase")
os.makedirs(SCRATCH_DIR, exist_ok=True)

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

def synthesize_voice(text, out_wav):
    cmd = [PYTHON_EXE, SYNTH_PY, text, "gideon", "1.05"]
    res = subprocess.run(cmd, capture_output=True, text=True, cwd=WORKDIR)
    for line in res.stdout.splitlines():
        if line.startswith("SYNTH_WAV:"):
            gen_file = line.replace("SYNTH_WAV:", "").strip()
            if os.path.exists(gen_file):
                data, sr = sf.read(gen_file)
                sf.write(out_wav, data, sr)
                return True
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
        
    subprocess.run([LILYPOND, ly_file], capture_output=True, text=True, cwd=SCRATCH_DIR)
    if not os.path.exists(mid_file):
        return False
        
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
    subprocess.run(cmd, capture_output=True, text=True, cwd=SCRATCH_DIR)
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
    subprocess.run([LILYPOND, ly_file], capture_output=True, text=True, cwd=SCRATCH_DIR)
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
    subprocess.run(cmd, capture_output=True, text=True, cwd=SCRATCH_DIR)
    return os.path.exists(out_wav)

def assemble_narrated_suite():
    target_sr = 44100
    timeline = []
    
    print("Beginning compilation of Wisconsin Rapids City Band Instrument Benchmark...")
    for idx, (tag, spoken_name, midi_inst, clef, notes, is_drum) in enumerate(INSTRUMENTS, 1):
        voice_wav = os.path.join(SCRATCH_DIR, f"voice_{tag}.wav")
        solo_wav = os.path.join(SCRATCH_DIR, f"solo_{tag}.wav")
        
        print(f"[{idx}/15] Synthesizing speech label: '{spoken_name}'...")
        synthesize_voice(spoken_name, voice_wav)
        
        print(f"[{idx}/15] Rendering instrument solo: {tag} ({midi_inst})...")
        if tag == "15_tutti":
            render_tutti_solo(solo_wav)
        else:
            render_instrument_solo(tag, midi_inst, clef, notes, is_drum, solo_wav)
            
        if os.path.exists(voice_wav):
            v_data, v_sr = sf.read(voice_wav)
            if v_data.ndim == 1:
                v_data = np.column_stack([v_data, v_data])
            if v_sr != target_sr:
                orig_len = len(v_data)
                target_len = int(orig_len * (target_sr / v_sr))
                v_data_resampled = np.zeros((target_len, 2), dtype=np.float32)
                for ch in range(2):
                    v_data_resampled[:, ch] = np.interp(
                        np.linspace(0, orig_len - 1, target_len),
                        np.arange(orig_len),
                        v_data[:, ch]
                    )
                v_data = v_data_resampled
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
                orig_len = len(s_data)
                target_len = int(orig_len * (target_sr / s_sr))
                s_data_resampled = np.zeros((target_len, 2), dtype=np.float32)
                for ch in range(2):
                    s_data_resampled[:, ch] = np.interp(
                        np.linspace(0, orig_len - 1, target_len),
                        np.arange(orig_len),
                        s_data[:, ch]
                    )
                s_data = s_data_resampled
            timeline.append(s_data)
            
        timeline.append(np.zeros((int(target_sr * 0.75), 2), dtype=np.float32))

    timeline.append(np.zeros((int(target_sr * 1.5), 2), dtype=np.float32))
    
    full_audio = np.concatenate(timeline, axis=0)
    master_peak = np.max(np.abs(full_audio))
    if master_peak > 0:
        full_audio = (full_audio / master_peak) * 0.95
        
    master_out = os.path.join(WORKDIR, "benchmark_instruments_showcase_narrated.wav")
    sf.write(master_out, full_audio, target_sr, subtype="PCM_16")
    print(f"\nMaster benchmark narrated audio written to: {master_out}")
    print(f"Total duration: {len(full_audio) / target_sr:.2f} seconds.")

if __name__ == "__main__":
    assemble_narrated_suite()
