#!/usr/bin/env python3
"""
The Crowded Room (Breathe as One) — Master Engraving & Audio Generator
CGMusicalComposition — Dedicated to Wisconsin Rapids City Band (John Daniel Dondlinger)

Core Medley Instrumentation:
- Core Medley Lead: Oboe in Concert Bb (Medley Lead, Concert Pitch D4-Eb5)
- Core Bass & Foundation: Tuba (Bb1-F3)
- Pitched Percussion:
  * Bells (Glockenspiel, Bb5-D7)
  * Marimba (C3-G5)
  * Timpani (Kettles locked to F2 and Bb2)
- Battery Percussion:
  * Concert Snare & Suspended Ride Cymbal (roll w/ marimba mallets)
  * Concert Bass Drum

ZERO PIANO INVARIANT: 100% Concert Band instrumentation.
"""

import os
import sys
import mido
import subprocess
from band_dsl_compiler import FastMidiTrack, build_midi_file_bytes

WORKDIR = os.path.dirname(os.path.abspath(__file__))
LILYPOND = r"C:\dev\tools\lilypond\lilypond-2.24.4\bin\lilypond.exe"
FLUIDSYNTH = r"C:\dev\tools\fluidsynth\bin\fluidsynth.exe"
SOUNDFONT = r"C:\dev\tools\soundfonts\MuseScore_General.sf3"

def build():
    ticks_per_beat = 480
    
    # 1. MIDI Tracks
    trk_cond = FastMidiTrack("Conductor Master")
    trk_lead = FastMidiTrack("Oboe (Medley Lead)")       # Ch 2 (GM 68 Oboe)
    trk_bass = FastMidiTrack("Tuba (Bass Foundation)")    # Ch 3 (GM 58 Tuba)
    trk_bells = FastMidiTrack("Glockenspiel (Bells)")    # Ch 0 (GM 9 Glockenspiel)
    trk_marimba = FastMidiTrack("Marimba")               # Ch 4 (GM 12 Marimba)
    trk_timp = FastMidiTrack("Timpani")                  # Ch 1 (GM 47 Timpani)
    trk_snare = FastMidiTrack("Concert Snare & Suspended Cymbal") # Ch 9
    trk_bassdrum = FastMidiTrack("Concert Bass Drum")    # Ch 9
    
    # Program Changes & Initial Volumes
    # Glockenspiel (Ch 0)
    trk_bells.add_event(0, bytes([0xC0, 9]))
    trk_bells.add_event(0, bytes([0xB0, 7, 100]))
    trk_bells.add_event(0, bytes([0xB0, 10, 36])) # Left
    
    # Timpani (Ch 1)
    trk_timp.add_event(0, bytes([0xC1, 47]))
    trk_timp.add_event(0, bytes([0xB1, 7, 105]))
    trk_timp.add_event(0, bytes([0xB1, 10, 72])) # Right-Center
    
    # Oboe (Medley Lead, Ch 2)
    trk_lead.add_event(0, bytes([0xC2, 68]))   # GM 68 Oboe
    trk_lead.add_event(0, bytes([0xB2, 7, 100]))
    trk_lead.add_event(0, bytes([0xB2, 10, 60])) # Center-Left
    
    # Tuba (Bass Foundation, Ch 3)
    trk_bass.add_event(0, bytes([0xC3, 58]))   # GM 58 Tuba
    trk_bass.add_event(0, bytes([0xB3, 7, 105]))
    trk_bass.add_event(0, bytes([0xB3, 10, 64])) # Center
    
    # Marimba (Ch 4)
    trk_marimba.add_event(0, bytes([0xC4, 12])) # GM 12 Marimba
    trk_marimba.add_event(0, bytes([0xB4, 7, 95]))
    trk_marimba.add_event(0, bytes([0xB4, 10, 48])) # Center-Left
    
    # Tempo Map
    tempo_132 = mido.bpm2tempo(132).to_bytes(3, 'big')
    tempo_92 = mido.bpm2tempo(92).to_bytes(3, 'big')
    tempo_68 = mido.bpm2tempo(68).to_bytes(3, 'big')
    
    # LilyPond Buffers
    ly_snare = []
    ly_bassdrum = []
    ly_timpani = []
    ly_bells = []
    ly_marimba = []
    ly_lead = []
    ly_bass = []
    ly_chords = []
    
    # =============================================================
    # MOVEMENT I: The Anxious Spark & Crowded Room (mm. 1-28, 132 BPM, G minor / Bb)
    # mm. 1-12: Percussion Alone (Off-beat, anxiety-driven)
    # mm. 13-24: Polyphonic Voices enter (Oboe lead, Tuba bass, Marimba ostinato)
    # mm. 25-28: Breath & Transition (Oboe and Tuba rest to honor 16-bar rule)
    # =============================================================
    trk_cond.add_event(0, b'\xFF\x51\x03' + tempo_132)
    trk_cond.add_event(0, b'\xFF\x58\x04\x04\x02\x18\x08')
    trk_cond.add_event(0, b'\xFF\x06\x1bI. The Anxious Crowded Room')
    
    ly_snare.append('\n  % --- I. The Anxious Crowded Room (mm. 1-28) ---')
    ly_snare.append('  \\time 4/4 \\tempo "Inquieto e Ansioso" 4 = 132')
    ly_bassdrum.append('\n  % --- I. The Anxious Crowded Room ---')
    ly_bassdrum.append('  \\time 4/4')
    ly_timpani.append('\n  % --- I. The Anxious Crowded Room ---')
    ly_timpani.append('  \\time 4/4 \\clef bass')
    ly_bells.append('\n  % --- I. The Anxious Crowded Room ---')
    ly_bells.append('  \\time 4/4 \\key g \\minor \\clef treble')
    ly_marimba.append('\n  % --- I. The Anxious Crowded Room ---')
    ly_marimba.append('  \\time 4/4 \\key g \\minor \\clef treble')
    ly_lead.append('\n  % --- I. The Anxious Crowded Room ---')
    ly_lead.append('  \\time 4/4 \\key g \\minor \\clef treble')
    ly_bass.append('\n  % --- I. The Anxious Crowded Room ---')
    ly_bass.append('  \\time 4/4 \\key g \\minor \\clef bass')
    ly_chords.append('\n  % --- I. The Anxious Crowded Room ---')
    ly_chords.append('  \\time 4/4')
    
    t_per_bar = 480 * 4
    
    for bar in range(1, 29):
        m_tick = (bar - 1) * t_per_bar
        
        # --- PERCUSSION: Off-beat, anxious syncopation ---
        if bar in [1, 3, 5, 7, 9, 11]:
            # Displaced syncopated snare: hits on the 'e' of 1, 'and' of 2, 'ah' of 3
            ly_snare.append("  r8 sn16\\p sn r8 sn8-> r16 sn sn8 r8 sn8-> |")
            trk_snare.add_event(m_tick + 240, bytes([0x99, 38, 80]))  # sn
            trk_snare.add_event(m_tick + 340, bytes([0x89, 38, 64]))
            trk_snare.add_event(m_tick + 360, bytes([0x99, 38, 85]))
            trk_snare.add_event(m_tick + 460, bytes([0x89, 38, 64]))
            trk_snare.add_event(m_tick + 720, bytes([0x99, 38, 105])) # accent
            trk_snare.add_event(m_tick + 940, bytes([0x89, 38, 64]))
            trk_snare.add_event(m_tick + 1080, bytes([0x99, 38, 82]))
            trk_snare.add_event(m_tick + 1180, bytes([0x89, 38, 64]))
            trk_snare.add_event(m_tick + 1200, bytes([0x99, 38, 88]))
            trk_snare.add_event(m_tick + 1400, bytes([0x89, 38, 64]))
            trk_snare.add_event(m_tick + 1440, bytes([0x99, 38, 110])) # accent
            trk_snare.add_event(m_tick + 1800, bytes([0x89, 38, 64]))
            
            # Bass drum: unexpected heart thumps on the upbeat of 1 and upbeat of 3
            ly_bassdrum.append("  r8 bd4\\p r8 bd4\\p r4 |")
            trk_bassdrum.add_event(m_tick + 240, bytes([0x99, 36, 85]))
            trk_bassdrum.add_event(m_tick + 680, bytes([0x89, 36, 64]))
            trk_bassdrum.add_event(m_tick + 960, bytes([0x99, 36, 92]))
            trk_bassdrum.add_event(m_tick + 1200, bytes([0x89, 36, 64]))
            
        elif bar in [2, 4, 6, 8, 10, 12]:
            # Suspended ride cymbal roll with marimba sticks swelling into choke
            ly_snare.append(r"  cymr4:32\p\<^\markup { \italic ""roll w/ marimba mallets on susp. ride"" } cymr4\f\! r8 sn16\p sn r8 sn8-> |")
            for i, vel in enumerate([48, 54, 60, 66, 73, 80, 88, 96]):
                trk_snare.add_event(m_tick + (i * 60), bytes([0x99, 51, vel]))
                trk_snare.add_event(m_tick + (i * 60) + 50, bytes([0x89, 51, 64]))
            trk_snare.add_event(m_tick + 480, bytes([0x99, 51, 102])) # accent choke
            trk_snare.add_event(m_tick + 800, bytes([0x89, 51, 64]))
            
            # Snare syncopations on beats 3 and 4
            trk_snare.add_event(m_tick + 1200, bytes([0x99, 38, 85]))
            trk_snare.add_event(m_tick + 1300, bytes([0x89, 38, 64]))
            trk_snare.add_event(m_tick + 1320, bytes([0x99, 38, 88]))
            trk_snare.add_event(m_tick + 1420, bytes([0x89, 38, 64]))
            trk_snare.add_event(m_tick + 1680, bytes([0x99, 38, 108])) # accent
            trk_snare.add_event(m_tick + 1900, bytes([0x89, 38, 64]))
            
            ly_bassdrum.append("  bd4\\f r8 bd8 r4 bd8 r8 |")
            trk_bassdrum.add_event(m_tick, bytes([0x99, 36, 105]))
            trk_bassdrum.add_event(m_tick + 400, bytes([0x89, 36, 64]))
            trk_bassdrum.add_event(m_tick + 720, bytes([0x99, 36, 88]))
            trk_bassdrum.add_event(m_tick + 920, bytes([0x89, 36, 64]))
            trk_bassdrum.add_event(m_tick + 1440, bytes([0x99, 36, 95]))
            trk_bassdrum.add_event(m_tick + 1680, bytes([0x89, 36, 64]))
        else:
            # Full ensemble groove in mm. 13-28
            ly_snare.append("  sn8->\\f r8 sn16 sn sn8 r8 sn8-> sn16 sn sn8 |")
            ly_bassdrum.append("  bd4 r8 bd8 bd4 r4 |")
            trk_snare.add_event(m_tick, bytes([0x99, 38, 110]))
            trk_snare.add_event(m_tick + 200, bytes([0x89, 38, 64]))
            trk_snare.add_event(m_tick + 480, bytes([0x99, 38, 90]))
            trk_snare.add_event(m_tick + 680, bytes([0x89, 38, 64]))
            trk_snare.add_event(m_tick + 960, bytes([0x99, 38, 112]))
            trk_snare.add_event(m_tick + 1160, bytes([0x89, 38, 64]))
            trk_snare.add_event(m_tick + 1440, bytes([0x99, 38, 95]))
            trk_snare.add_event(m_tick + 1640, bytes([0x89, 38, 64]))
            
            trk_bassdrum.add_event(m_tick, bytes([0x99, 36, 105]))
            trk_bassdrum.add_event(m_tick + 440, bytes([0x89, 36, 64]))
            trk_bassdrum.add_event(m_tick + 720, bytes([0x99, 36, 92]))
            trk_bassdrum.add_event(m_tick + 920, bytes([0x89, 36, 64]))
            trk_bassdrum.add_event(m_tick + 960, bytes([0x99, 36, 102]))
            trk_bassdrum.add_event(m_tick + 1400, bytes([0x89, 36, 64]))

        # --- TIMPANI: Locked to F2 (41) and Bb2 (46) ---
        if bar in range(1, 13):
            if bar % 2 == 1:
                ly_timpani.append("  f,4\\p r8 f,8 r4 r8 f,8 |") # F2
                trk_timp.add_event(m_tick, bytes([0x91, 41, 85]))
                trk_timp.add_event(m_tick + 440, bytes([0x81, 41, 64]))
                trk_timp.add_event(m_tick + 720, bytes([0x91, 41, 80]))
                trk_timp.add_event(m_tick + 920, bytes([0x81, 41, 64]))
                trk_timp.add_event(m_tick + 1680, bytes([0x91, 41, 90]))
                trk_timp.add_event(m_tick + 1900, bytes([0x81, 41, 64]))
            else:
                ly_timpani.append("  bes,,4\\p r8 bes,,8 r2 |") # Bb2
                trk_timp.add_event(m_tick, bytes([0x91, 46, 88]))
                trk_timp.add_event(m_tick + 440, bytes([0x81, 46, 64]))
                trk_timp.add_event(m_tick + 720, bytes([0x91, 46, 82]))
                trk_timp.add_event(m_tick + 920, bytes([0x81, 46, 64]))
        else:
            k = 46 if (bar % 4 in [1, 2]) else 41
            k_ly = "bes,," if k == 46 else "f,"
            ly_timpani.append(f"  {k_ly}4\\f r8 {k_ly}8 {k_ly}4 r4 |")
            trk_timp.add_event(m_tick, bytes([0x91, k, 102]))
            trk_timp.add_event(m_tick + 440, bytes([0x81, k, 64]))
            trk_timp.add_event(m_tick + 720, bytes([0x91, k, 95]))
            trk_timp.add_event(m_tick + 920, bytes([0x81, k, 64]))
            trk_timp.add_event(m_tick + 960, bytes([0x91, k, 100]))
            trk_timp.add_event(m_tick + 1400, bytes([0x81, k, 64]))

        # --- BELLS (Glockenspiel, Bb5-D7) & MARIMBA (C3-G5) ---
        if bar < 5:
            ly_bells.append("  R1 |")
            ly_marimba.append("  R1 |")
        elif bar in range(5, 13):
            # Glockenspiel: D6 (86), Eb6 (87) - strictly within [82, 98]
            ly_bells.append("  r8 d'''16\\p ees''' r8 d'''16 ees''' d'''8 r r4 |")
            trk_bells.add_event(m_tick + 240, bytes([0x90, 86, 75]))
            trk_bells.add_event(m_tick + 340, bytes([0x80, 86, 64]))
            trk_bells.add_event(m_tick + 360, bytes([0x90, 87, 80]))
            trk_bells.add_event(m_tick + 460, bytes([0x80, 87, 64]))
            trk_bells.add_event(m_tick + 720, bytes([0x90, 86, 78]))
            trk_bells.add_event(m_tick + 820, bytes([0x80, 86, 64]))
            trk_bells.add_event(m_tick + 840, bytes([0x90, 87, 85]))
            trk_bells.add_event(m_tick + 940, bytes([0x80, 87, 64]))
            trk_bells.add_event(m_tick + 960, bytes([0x90, 86, 88]))
            trk_bells.add_event(m_tick + 1160, bytes([0x80, 86, 64]))
            
            # Marimba: G3 (55), D4 (62), Eb4 (63) - strictly within [48, 79]
            ly_marimba.append("  g8\\p r d'16 ees' d'8 r g d'4 |")
            trk_marimba.add_event(m_tick, bytes([0x94, 55, 75]))
            trk_marimba.add_event(m_tick + 200, bytes([0x84, 55, 64]))
            trk_marimba.add_event(m_tick + 480, bytes([0x94, 62, 78]))
            trk_marimba.add_event(m_tick + 580, bytes([0x84, 62, 64]))
            trk_marimba.add_event(m_tick + 600, bytes([0x94, 63, 80]))
            trk_marimba.add_event(m_tick + 700, bytes([0x84, 63, 64]))
            trk_marimba.add_event(m_tick + 720, bytes([0x94, 62, 78]))
            trk_marimba.add_event(m_tick + 920, bytes([0x84, 62, 64]))
            trk_marimba.add_event(m_tick + 1200, bytes([0x94, 55, 75]))
            trk_marimba.add_event(m_tick + 1400, bytes([0x84, 55, 64]))
            trk_marimba.add_event(m_tick + 1440, bytes([0x94, 62, 82]))
            trk_marimba.add_event(m_tick + 1880, bytes([0x84, 62, 64]))
        else:
            # mm. 13-28
            # Glockenspiel: Bb5 (82), D6 (86), Eb6 (87), C6 (84) - within [82, 98]
            ly_bells.append("  bes''8\\f r d'''16 ees''' d'''8 c'''4 bes''8 r |")
            trk_bells.add_event(m_tick, bytes([0x90, 82, 95]))
            trk_bells.add_event(m_tick + 220, bytes([0x80, 82, 64]))
            trk_bells.add_event(m_tick + 480, bytes([0x90, 86, 98]))
            trk_bells.add_event(m_tick + 680, bytes([0x80, 86, 64]))
            trk_bells.add_event(m_tick + 720, bytes([0x90, 87, 98]))
            trk_bells.add_event(m_tick + 920, bytes([0x80, 87, 64]))
            trk_bells.add_event(m_tick + 960, bytes([0x90, 84, 92]))
            trk_bells.add_event(m_tick + 1400, bytes([0x80, 84, 64]))
            trk_bells.add_event(m_tick + 1440, bytes([0x90, 82, 95]))
            trk_bells.add_event(m_tick + 1880, bytes([0x80, 82, 64]))
            
            # Marimba: G3 (55), Bb3 (58), C4 (60), A3 (57) - strictly within [48, 79]
            ly_marimba.append("  g8 r bes16 c' bes8 a4 g8 r |")
            trk_marimba.add_event(m_tick, bytes([0x94, 55, 88]))
            trk_marimba.add_event(m_tick + 220, bytes([0x84, 55, 64]))
            trk_marimba.add_event(m_tick + 480, bytes([0x94, 58, 90]))
            trk_marimba.add_event(m_tick + 580, bytes([0x84, 58, 64]))
            trk_marimba.add_event(m_tick + 600, bytes([0x94, 60, 92]))
            trk_marimba.add_event(m_tick + 700, bytes([0x84, 60, 64]))
            trk_marimba.add_event(m_tick + 720, bytes([0x94, 58, 90]))
            trk_marimba.add_event(m_tick + 920, bytes([0x84, 58, 64]))
            trk_marimba.add_event(m_tick + 960, bytes([0x94, 57, 88]))
            trk_marimba.add_event(m_tick + 1400, bytes([0x84, 57, 64]))
            trk_marimba.add_event(m_tick + 1440, bytes([0x94, 55, 88]))
            trk_marimba.add_event(m_tick + 1880, bytes([0x84, 55, 64]))

        # --- CORE MEDLEY: OBOE LEAD & TUBA BASS FOUNDATION ---
        if bar in range(1, 13):
            # Percussion alone in mm. 1-12
            ly_lead.append("  R1 |")
            ly_bass.append("  R1 |")
            ly_chords.append("  s1 |")
        elif bar in range(25, 29):
            # mm. 25-28: 4-bar breathing rest for Oboe and Tuba (transition into Mvt II)
            # 12 bars played (mm. 13-24) followed by 4 bars rest => 100% compliant with 16-bar rule!
            ly_lead.append("  R1 |")
            ly_bass.append("  R1 |")
            chord_pats = ["g:m", "ees", "bes", "d:7"]
            c_sym = chord_pats[bar - 25]
            ly_chords.append(f"  {c_sym}1 |")
        else:
            # mm. 13-24: Polyphonic voices enter
            chord_pats = ["g:m", "ees", "c:m", "f", "g:m", "bes", "ees", "d:7"]
            c_sym = chord_pats[(bar - 13) % len(chord_pats)]
            ly_chords.append(f"  {c_sym}1 |")
            
            # Oboe Medley Lead: Bb4 (70), C5 (72), Bb4 (70), G4 (67)
            # All pitches [67, 72] are strictly within Grade 3/4 Oboe range [62, 75]!
            ly_lead.append("  bes'4.\\f c''8 bes'4 g' |")
            trk_lead.add_event(m_tick, bytes([0x92, 70, 102]))       # Bb4 (70)
            trk_lead.add_event(m_tick + 700, bytes([0x82, 70, 64]))
            trk_lead.add_event(m_tick + 720, bytes([0x92, 72, 98]))   # C5 (72)
            trk_lead.add_event(m_tick + 940, bytes([0x82, 72, 64]))
            trk_lead.add_event(m_tick + 960, bytes([0x92, 70, 100]))  # Bb4 (70)
            trk_lead.add_event(m_tick + 1400, bytes([0x82, 70, 64]))
            trk_lead.add_event(m_tick + 1440, bytes([0x92, 67, 95]))  # G4 (67)
            trk_lead.add_event(m_tick + 1880, bytes([0x82, 67, 64]))
            
            # Tuba Bass Foundation: G2 (43), Eb2 (39)
            # Pitches are strictly within Grade 3/4 Tuba range [34, 53]!
            ly_bass.append("  g,2\\mf ees, |")
            trk_bass.add_event(m_tick, bytes([0x93, 43, 95]))         # G2 (43)
            trk_bass.add_event(m_tick + 940, bytes([0x83, 43, 64]))
            trk_bass.add_event(m_tick + 960, bytes([0x93, 39, 90]))   # Eb2 (39)
            trk_bass.add_event(m_tick + 1900, bytes([0x83, 39, 64]))

    # =============================================================
    # MOVEMENT II: Convergence (Drawing Near) (mm. 29-52, 92 BPM, Bb Major)
    # mm. 29-44: Lyrical Convergence (Oboe & Tuba play 16 bars)
    # mm. 45-52: 8-bar breathing rest for Oboe & Tuba before Mvt III
    # =============================================================
    m2_start_tick = 28 * t_per_bar
    trk_cond.add_event(m2_start_tick, b'\xFF\x51\x03' + tempo_92)
    trk_cond.add_event(m2_start_tick, b'\xFF\x06\x0fII. Convergence')
    
    ly_snare.append('\n  % --- II. Convergence (mm. 29-52) ---')
    ly_snare.append('  \\tempo "Lirico e Convergente" 4 = 92')
    ly_bassdrum.append('\n  % --- II. Convergence ---')
    ly_timpani.append('\n  % --- II. Convergence ---')
    ly_bells.append('\n  % --- II. Convergence --- \\key bes \\major')
    ly_marimba.append('\n  % --- II. Convergence --- \\key bes \\major')
    ly_lead.append('\n  % --- II. Convergence --- \\key bes \\major')
    ly_bass.append('\n  % --- II. Convergence --- \\key bes \\major')
    ly_chords.append('\n  % --- II. Convergence ---')

    for bar in range(29, 53):
        m_tick = m2_start_tick + ((bar - 29) * t_per_bar)
        
        # Percussion softens into gentle ballad pulse
        ly_snare.append("  r4 sn8\\mp sn r4 sn |")
        trk_snare.add_event(m_tick + 480, bytes([0x99, 38, 75]))
        trk_snare.add_event(m_tick + 700, bytes([0x89, 38, 64]))
        trk_snare.add_event(m_tick + 720, bytes([0x99, 38, 70]))
        trk_snare.add_event(m_tick + 940, bytes([0x89, 38, 64]))
        trk_snare.add_event(m_tick + 1440, bytes([0x99, 38, 80]))
        trk_snare.add_event(m_tick + 1800, bytes([0x89, 38, 64]))
        
        ly_bassdrum.append("  bd4\\mp r r bd |")
        trk_bassdrum.add_event(m_tick, bytes([0x99, 36, 75]))
        trk_bassdrum.add_event(m_tick + 440, bytes([0x89, 36, 64]))
        trk_bassdrum.add_event(m_tick + 1440, bytes([0x99, 36, 78]))
        trk_bassdrum.add_event(m_tick + 1880, bytes([0x89, 36, 64]))
        
        ly_timpani.append("  bes,,2\\mp f, |")
        trk_timp.add_event(m_tick, bytes([0x91, 46, 80]))
        trk_timp.add_event(m_tick + 940, bytes([0x81, 46, 64]))
        trk_timp.add_event(m_tick + 960, bytes([0x91, 41, 75]))
        trk_timp.add_event(m_tick + 1900, bytes([0x81, 41, 64]))
        
        ly_chords.append("  ees1 |" if bar % 2 == 1 else "  bes1 |")
        
        # Bells: D6 (86), C6 (84) - within [82, 98]
        ly_bells.append("  d'''2\\mp c''' |")
        trk_bells.add_event(m_tick, bytes([0x90, 86, 78]))
        trk_bells.add_event(m_tick + 920, bytes([0x80, 86, 64]))
        trk_bells.add_event(m_tick + 960, bytes([0x90, 84, 75]))
        trk_bells.add_event(m_tick + 1880, bytes([0x80, 84, 64]))
        
        # Marimba: F4 (65), D4 (62) - strictly within [48, 79]
        ly_marimba.append("  f'2\\mp d' |")
        trk_marimba.add_event(m_tick, bytes([0x94, 65, 75]))
        trk_marimba.add_event(m_tick + 920, bytes([0x84, 65, 64]))
        trk_marimba.add_event(m_tick + 960, bytes([0x94, 62, 72]))
        trk_marimba.add_event(m_tick + 1880, bytes([0x84, 62, 64]))
        
        if bar in range(45, 53):
            # mm. 45-52: 8-bar breathing rest for Oboe and Tuba (satisfies 16-bar rule!)
            ly_lead.append("  R1 |")
            ly_bass.append("  R1 |")
        else:
            # mm. 29-44 (16 bars exactly)
            # Oboe Lead: F4 (65), G4 (67), F4 (65), D4 (62) - strictly within [62, 75]
            ly_lead.append("  f'4.\\mf g'8 f'4 d' |")
            trk_lead.add_event(m_tick, bytes([0x92, 65, 92]))       # F4 (65)
            trk_lead.add_event(m_tick + 700, bytes([0x82, 65, 64]))
            trk_lead.add_event(m_tick + 720, bytes([0x92, 67, 90]))   # G4 (67)
            trk_lead.add_event(m_tick + 940, bytes([0x82, 67, 64]))
            trk_lead.add_event(m_tick + 960, bytes([0x92, 65, 92]))   # F4 (65)
            trk_lead.add_event(m_tick + 1400, bytes([0x82, 65, 64]))
            trk_lead.add_event(m_tick + 1440, bytes([0x92, 62, 88]))  # D4 (62)
            trk_lead.add_event(m_tick + 1880, bytes([0x82, 62, 64]))
            
            # Tuba Bass: Bb2 (46), D3 (50) - strictly within [34, 53]
            ly_bass.append("  bes,,2\\mf d, |")
            trk_bass.add_event(m_tick, bytes([0x93, 46, 88]))        # Bb2 (46)
            trk_bass.add_event(m_tick + 940, bytes([0x83, 46, 64]))
            trk_bass.add_event(m_tick + 960, bytes([0x93, 50, 85]))   # D3 (50)
            trk_bass.add_event(m_tick + 1900, bytes([0x83, 50, 64]))

    # =============================================================
    # MOVEMENT III: Strange Unison (Breathe as One) (mm. 53-76, 68 BPM, Bb Major)
    # mm. 53-68: Unison Hymn (16 bars)
    # mm. 69-72: Tacet / drop-off into absolute breath
    # mm. 73-74: Full Ensemble Fermata Breath Rest
    # mm. 75-76: Final Glorious Ringing Unison on Bb
    # =============================================================
    m3_start_tick = m2_start_tick + (24 * t_per_bar)
    trk_cond.add_event(m3_start_tick, b'\xFF\x51\x03' + tempo_68)
    trk_cond.add_event(m3_start_tick, b'\xFF\x06\x24III. Strange Unison (Breathe as One)')
    
    ly_snare.append('\n  % --- III. Strange Unison (Breathe as One) (mm. 53-76) ---')
    ly_snare.append('  \\tempo "Maestoso e Solenne — Come Unico Respiro" 4 = 68')
    ly_bassdrum.append('\n  % --- III. Strange Unison ---')
    ly_timpani.append('\n  % --- III. Strange Unison ---')
    ly_bells.append('\n  % --- III. Strange Unison ---')
    ly_marimba.append('\n  % --- III. Strange Unison ---')
    ly_lead.append('\n  % --- III. Strange Unison ---')
    ly_bass.append('\n  % --- III. Strange Unison ---')
    ly_chords.append('\n  % --- III. Strange Unison ---')

    for bar in range(53, 77):
        m_tick = m3_start_tick + ((bar - 53) * t_per_bar)
        
        # In mm 73-74: Full Breath Rest (Fermata Pause)
        if bar in [73, 74]:
            ly_snare.append(r"  R1\fermata |")
            ly_bassdrum.append(r"  R1\fermata |")
            ly_timpani.append(r"  R1\fermata |")
            ly_bells.append(r"  R1\fermata |")
            ly_marimba.append(r"  R1\fermata |")
            ly_lead.append(r"  R1\fermata |")
            ly_bass.append(r"  R1\fermata |")
            ly_chords.append("  s1 |")
            continue

        # In mm 75-76: Final Glorious Unison Ringing Octave on Bb
        if bar == 75:
            ly_snare.append(r"  cymr1:32\f\<^\markup { \italic ""roll w/ marimba mallets on susp. ride"" } ~ |")
            ly_bassdrum.append(r"  bd1\ff ~ |")
            ly_timpani.append(r"  bes,,1\ff ~ |")
            ly_bells.append(r"  bes''1\ff ~ |")
            ly_marimba.append(r"  bes1\ff ~ |")
            ly_lead.append(r"  bes'1\fff-^ ~ |")
            ly_bass.append(r"  bes,,1\fff-^ ~ |")
            ly_chords.append("  bes1 |")
            
            # MIDI final ringing unison
            # Oboe: Bb4 (70)
            trk_lead.add_event(m_tick, bytes([0x92, 70, 118]))
            trk_lead.add_event(m_tick + (2 * t_per_bar) - 40, bytes([0x82, 70, 64]))
            
            # Tuba: Bb2 (46)
            trk_bass.add_event(m_tick, bytes([0x93, 46, 120]))
            trk_bass.add_event(m_tick + (2 * t_per_bar) - 40, bytes([0x83, 46, 64]))
            
            # Bells: Bb5 (82)
            trk_bells.add_event(m_tick, bytes([0x90, 82, 115]))
            trk_bells.add_event(m_tick + (2 * t_per_bar) - 40, bytes([0x80, 82, 64]))
            
            # Marimba: Bb3 (58)
            trk_marimba.add_event(m_tick, bytes([0x94, 58, 110]))
            trk_marimba.add_event(m_tick + (2 * t_per_bar) - 40, bytes([0x84, 58, 64]))
            
            # Timpani: Bb2 (46)
            trk_timp.add_event(m_tick, bytes([0x91, 46, 120]))
            trk_timp.add_event(m_tick + (2 * t_per_bar) - 40, bytes([0x81, 46, 64]))
            
            # Suspended ride roll with marimba sticks across mm 75-76
            for i in range(16):
                v = min(120, int(75 + (i * 3.0)))
                trk_snare.add_event(m_tick + (i * 120), bytes([0x99, 51, v]))
                trk_snare.add_event(m_tick + (i * 120) + 100, bytes([0x89, 51, 64]))
            continue

        if bar == 76:
            ly_snare.append(r"  cymr1\fermata\ff |")
            ly_bassdrum.append(r"  bd1\fermata |")
            ly_timpani.append(r"  bes,,1\fermata |")
            ly_bells.append(r"  bes''1\fermata |")
            ly_marimba.append(r"  bes1\fermata |")
            ly_lead.append(r"  bes'1\fermata |")
            ly_bass.append(r"  bes,,1\fermata |")
            ly_chords.append("  bes1 |")
            
            trk_snare.add_event(m_tick, bytes([0x99, 51, 120]))
            trk_snare.add_event(m_tick + t_per_bar - 40, bytes([0x89, 51, 64]))
            continue

        # mm. 53-72
        ly_chords.append("  bes1 |" if bar % 2 == 1 else "  f1:sus4 |")
        
        # Soft suspended ride cymbal roll & bass drum heartbeat
        if bar % 4 == 1:
            ly_snare.append(r"  cymr1:32\p\<^\markup { \italic ""roll w/ marimba mallets"" } \! |")
            for i in range(8):
                trk_snare.add_event(m_tick + (i * 240), bytes([0x99, 51, 55 + (i * 3)]))
                trk_snare.add_event(m_tick + (i * 240) + 200, bytes([0x89, 51, 64]))
        else:
            ly_snare.append("  r2 sn4\\p r |")
            trk_snare.add_event(m_tick + 960, bytes([0x99, 38, 70]))
            trk_snare.add_event(m_tick + 1400, bytes([0x89, 38, 64]))
        
        ly_bassdrum.append("  bd2\\pp bd |")
        trk_bassdrum.add_event(m_tick, bytes([0x99, 36, 75]))
        trk_bassdrum.add_event(m_tick + 900, bytes([0x89, 36, 64]))
        trk_bassdrum.add_event(m_tick + 960, bytes([0x99, 36, 72]))
        trk_bassdrum.add_event(m_tick + 1880, bytes([0x89, 36, 64]))
        
        ly_timpani.append("  bes,,1\\p |")
        trk_timp.add_event(m_tick, bytes([0x91, 46, 85]))
        trk_timp.add_event(m_tick + t_per_bar - 40, bytes([0x81, 46, 64]))
        
        ly_bells.append("  bes''1\\f |")
        trk_bells.add_event(m_tick, bytes([0x90, 82, 98]))        # Bb5 (82)
        trk_bells.add_event(m_tick + t_per_bar - 40, bytes([0x80, 82, 64]))
        
        ly_marimba.append("  bes1\\f |")
        trk_marimba.add_event(m_tick, bytes([0x94, 58, 95]))      # Bb3 (58)
        trk_marimba.add_event(m_tick + t_per_bar - 40, bytes([0x84, 58, 64]))

        if bar in range(69, 73):
            # mm. 69-72: Oboe and Tuba rest before the collective breath (mm. 73-74)
            # mm. 53-68 was 16 bars exactly! Satisfies 16-bar rule!
            ly_lead.append("  R1 |")
            ly_bass.append("  R1 |")
        else:
            # mm. 53-68 (16 bars)
            # Oboe: Bb4 (70), C5 (72) or D5 (74), Bb4 (70) - strictly within [62, 75]
            ly_lead.append("  bes'2.\\f( c''4) |" if bar % 2 == 1 else "  d''2( bes'2) |")
            trk_lead.add_event(m_tick, bytes([0x92, 70, 105]))       # Bb4 (70)
            trk_lead.add_event(m_tick + 1400, bytes([0x82, 70, 64]))
            trk_lead.add_event(m_tick + 1440, bytes([0x92, 72, 102])) # C5 (72)
            trk_lead.add_event(m_tick + 1880, bytes([0x82, 72, 64]))
            
            # Tuba: Bb2 (46) - strictly within [34, 53]
            ly_bass.append("  bes,,1\\f |")
            trk_bass.add_event(m_tick, bytes([0x93, 46, 105]))
            trk_bass.add_event(m_tick + t_per_bar - 40, bytes([0x83, 46, 64]))

    # -------------------------------------------------------------
    # LilyPond Document Construction
    # -------------------------------------------------------------
    ly_code = [
        r'\version "2.24.0"',
        r'\include "articulate.ly"',
        "",
        r'\header {',
        '  title = "The Crowded Room (Breathe as One)"',
        '  subtitle = "A Symphonic Concert Band Study in Unison and Shared Breath"',
        '  composer = "John Daniel Dondlinger"',
        '  arranger = "Wisconsin Rapids City Band"',
        '  tagline = "The Crowded Room — Dedicated to the Wisconsin Rapids City Band (2026)"',
        r'}',
        "",
        r'#(set-global-staff-size 15)',
        "",
        r'\paper {',
        r'  #(set-paper-size "letter")',
        r'  top-margin = 0.5\in',
        r'  bottom-margin = 0.5\in',
        r'  left-margin = 0.55\in',
        r'  right-margin = 0.5\in',
        r'  ragged-last-bottom = ##f',
        r'}',
        "",
        "chordTrack = \\chordmode {",
    ]
    ly_code.extend(ly_chords)
    ly_code.append("}\n")
    
    ly_code.append(r"snarePart = \drummode {")
    ly_code.extend(ly_snare)
    ly_code.append(r'  \bar "|."')
    ly_code.append("}\n")
    
    ly_code.append(r"bassDrumPart = \drummode {")
    ly_code.extend(ly_bassdrum)
    ly_code.append(r'  \bar "|."')
    ly_code.append("}\n")
    
    ly_code.append(r"timpaniPart = \fixed c, {")
    ly_code.extend(ly_timpani)
    ly_code.append(r'  \bar "|."')
    ly_code.append("}\n")
    
    ly_code.append(r"bellsPart = \fixed c''' {")
    ly_code.extend(ly_bells)
    ly_code.append(r'  \bar "|."')
    ly_code.append("}\n")
    
    ly_code.append(r"marimbaPart = \fixed c' {")
    ly_code.extend(ly_marimba)
    ly_code.append(r'  \bar "|."')
    ly_code.append("}\n")
    
    ly_code.append(r"leadPart = \fixed c' {")
    ly_code.extend(ly_lead)
    ly_code.append(r'  \bar "|."')
    ly_code.append("}\n")
    
    ly_code.append(r"bassPart = \fixed c, {")
    ly_code.extend(ly_bass)
    ly_code.append(r'  \bar "|."')
    ly_code.append("}\n")
    
    ly_code.append(r"\score {")
    ly_code.append(r"  <<")
    ly_code.append(r"    \new ChordNames { \chordTrack }")
    ly_code.append(r'    \new StaffGroup = "CoreMedley" \with { instrumentName = #"Core Medley" } <<')
    ly_code.append(r'      \new Staff \with {')
    ly_code.append(r'        instrumentName = #"Oboe (B♭ Medley Lead)"')
    ly_code.append(r'        shortInstrumentName = #"Ob."')
    ly_code.append(r'        midiInstrument = #"oboe"')
    ly_code.append(r'      } { \leadPart }')
    ly_code.append(r'      \new Staff \with {')
    ly_code.append(r'        instrumentName = #"Tuba (Bass Foundation)"')
    ly_code.append(r'        shortInstrumentName = #"Tuba"')
    ly_code.append(r'        midiInstrument = #"tuba"')
    ly_code.append(r'      } { \bassPart }')
    ly_code.append(r'    >>')
    ly_code.append(r'    \new StaffGroup = "TunedPercussion" <<')
    ly_code.append(r'      \new Staff \with {')
    ly_code.append(r'        instrumentName = #"Bells"')
    ly_code.append(r'        shortInstrumentName = #"Bl."')
    ly_code.append(r'        midiInstrument = #"glockenspiel"')
    ly_code.append(r'      } { \bellsPart }')
    ly_code.append(r'      \new Staff \with {')
    ly_code.append(r'        instrumentName = #"Marimba"')
    ly_code.append(r'        shortInstrumentName = #"Mba."')
    ly_code.append(r'        midiInstrument = #"marimba"')
    ly_code.append(r'      } { \marimbaPart }')
    ly_code.append(r'      \new Staff \with {')
    ly_code.append(r'        instrumentName = #"Timpani"')
    ly_code.append(r'        shortInstrumentName = #"Tmp."')
    ly_code.append(r'        midiInstrument = #"timpani"')
    ly_code.append(r'      } { \timpaniPart }')
    ly_code.append(r'    >>')
    ly_code.append(r'    \new StaffGroup = "BatteryPercussion" <<')
    ly_code.append(r'      \new DrumStaff \with { instrumentName = #"Snare / Susp. Cymbal" shortInstrumentName = #"Sn./Susp." } { \snarePart }')
    ly_code.append(r'      \new DrumStaff \with { instrumentName = #"Bass Drum" shortInstrumentName = #"B.D." } { \bassDrumPart }')
    ly_code.append(r'    >>')
    ly_code.append(r'  >>')
    ly_code.append(r'  \layout { }')
    ly_code.append(r'}')
    
    # Exclude \midi { } so LilyPond never clobbers our custom concert band MIDI with default Piano
    ly_text = "\n".join(ly_code)
    
    # Save files
    scores_dir = os.path.join(WORKDIR, "Scores")
    os.makedirs(scores_dir, exist_ok=True)
    out_ly = os.path.join(scores_dir, "the_crowded_room_score.ly")
    out_mid = os.path.join(scores_dir, "the_crowded_room_score.mid")
    out_wav = os.path.join(WORKDIR, "the_crowded_room_master.wav")
    
    with open(out_ly, "w", encoding="utf-8") as f:
        f.write(ly_text)
        
    # 1. Engrave PDF via LilyPond
    print(f"[ENGRAVE] Compiling score via LilyPond...")
    subprocess.run([LILYPOND, "-o", os.path.splitext(out_ly)[0], out_ly], cwd=WORKDIR, check=True)
    print(f"[ENGRAVE] PDF Generated: {os.path.splitext(out_ly)[0]}.pdf")
    
    # 2. Write Authoritative Multi-Track Concert Band MIDI (Oboe, Tuba, Glock, Marimba, Timpani, Drums — ZERO PIANO)
    all_tracks = [trk_cond, trk_lead, trk_bass, trk_bells, trk_marimba, trk_timp, trk_snare, trk_bassdrum]
    mid_bytes = build_midi_file_bytes(all_tracks, division=ticks_per_beat)
    with open(out_mid, "wb") as f:
        f.write(mid_bytes)
    print(f"[COMPOSE] Authoritative Concert Band MIDI Emitted: {out_mid} ({len(mid_bytes):,} bytes)")
    
    # 3. Audio Synthesis via FluidSynth
    print(f"[AUDIO] Rendering master audio via FluidSynth...")
    subprocess.run([
        FLUIDSYNTH,
        "-F", out_wav,
        "-o", "synth.reverb.active=1",
        "-o", "synth.reverb.room-size=0.50",
        "-o", "synth.reverb.damp=0.55",
        "-o", "synth.gain=0.50",
        SOUNDFONT,
        out_mid
    ], cwd=WORKDIR, check=True)
    size_mb = os.path.getsize(out_wav) / (1024 * 1024)
    print(f"[AUDIO] Master Audio Rendered (100% Piano-Free Concert Band): {out_wav} ({size_mb:.1f} MB)")

if __name__ == "__main__":
    build()
