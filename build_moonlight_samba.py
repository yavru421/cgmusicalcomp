#!/usr/bin/env python3
"""
Moonlight Samba (1-Minute Concert Band Feature — Snappy, Authentic Latin Arranging)
CGMusicalComposition — Dedicated to Wisconsin Rapids City Band (John Daniel Dondlinger)

Key: C minor (Concert Pitch)
Duration: ~59.5 Seconds (Exact 1-Minute Concert Feature)

Musical Architecture:
1. Part 1: Adagio Cantabile (♩ = 64, mm. 1-5, ~18.8s):
   - OBOE OWNS THE MELODY: Lyrical Beethoven theme sung cleanly and expressively.
   - MARIMBA: Gentle, hypnotic rolling triplets (C3-Eb3-G3) underneath.
   - m. 5: Grand hold on high G4 with swelling Marimba tremolo roll (p -> f).
2. Part 2: Samba Energico (♩ = 112, mm. 6-24, ~40.7s):
   - m. 6: THE SNAP! Electric tutti crash/rimshot/surdo punch into an authentic Latin groove!
   - FRENCH HORNS: Syncopated, punchy Latin montuno brass vamps underneath.
   - TROMBONE: Greasy, swaggering Latin glissando slides on key phrase transitions!
   - BATTERY: Authentic Brazilian Surdo pulse (heavy upbeat 2 & 4), syncopated Caixa rimshots, and cutting Cowbell!
   - TUBA & BASSOON: Bouncing syncopated Brazilian root-fifth bassline (beats 1, 2-and, 3, 4-and).
   - mm. 8-15: B♭ TRUMPET OWNS THE SAMBA LEAD: Syncopated Latin Beethoven theme, bright & snappy.
   - mm. 16-17: 2-Bar Featured Latin Percussion Break (Strict Tacet for brass breathing rest).
   - mm. 18-23: Tutti ensemble Latin climax with soaring lines and turnaround trombone slide.
   - m. 24: Decisive staccatissimo hit on beat 1 with crash choke and instant silence.

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

class TrackBuilder:
    """Collects events and sorts them strictly chronologically before building FastMidiTrack.
    Completely eliminates MIDI time-smearing, desynchronization, and hanging voices."""
    def __init__(self, name: str):
        self.name = name
        self.events = []

    def add_event(self, tick: int, event_bytes: bytes):
        self.events.append((tick, event_bytes))

    def add_note(self, ch: int, note: int, vel: int, start_tick: int, dur_ticks: int):
        self.events.append((start_tick, bytes([0x90 | ch, note, vel])))
        self.events.append((start_tick + dur_ticks, bytes([0x80 | ch, note, 64])))

    def build_track(self) -> FastMidiTrack:
        # Sort chronologically. Note-Off precedes Note-On at identical ticks
        self.events.sort(key=lambda e: (e[0], 0 if (e[1][0] & 0xF0 == 0x80) else 1))
        trk = FastMidiTrack(self.name)
        for tick, b in self.events:
            trk.add_event(tick, b)
        return trk

def build():
    ticks_per_beat = 480
    t_per_bar = 480 * 4
    
    # 1. Track Builders
    tb_cond = TrackBuilder("Conductor Master")
    tb_bells = TrackBuilder("Glockenspiel (Bells)")       # Ch 0 (GM 9 Glockenspiel)
    tb_timp = TrackBuilder("Timpani")                     # Ch 1 (GM 47 Timpani)
    tb_oboe = TrackBuilder("Oboe")                        # Ch 2 (GM 68 Oboe)
    tb_bsn = TrackBuilder("Bassoon")                       # Ch 3 (GM 70 Bassoon)
    tb_marimba = TrackBuilder("Marimba")                  # Ch 4 (GM 12 Marimba)
    tb_hn = TrackBuilder("French Horn in F")               # Ch 5 (GM 60 French Horn)
    tb_tpt = TrackBuilder("Bb Trumpet")                    # Ch 6 (GM 56 Trumpet)
    tb_tbn = TrackBuilder("Trombone")                      # Ch 7 (GM 57 Trombone)
    tb_tuba = TrackBuilder("Tuba")                         # Ch 8 (GM 58 Tuba)
    tb_drums = TrackBuilder("Concert Battery Percussion")  # Ch 9 (GM Drums)
    
    # Program Changes & Concert Band Spatial Balancing
    tb_bells.add_event(0, bytes([0xC0, 9]))
    tb_bells.add_event(0, bytes([0xB0, 7, 95]))
    tb_bells.add_event(0, bytes([0xB0, 10, 36]))
    
    tb_timp.add_event(0, bytes([0xC1, 47]))
    tb_timp.add_event(0, bytes([0xB1, 7, 106]))
    tb_timp.add_event(0, bytes([0xB1, 10, 72]))
    
    tb_oboe.add_event(0, bytes([0xC2, 68]))
    tb_oboe.add_event(0, bytes([0xB2, 7, 108]))
    tb_oboe.add_event(0, bytes([0xB2, 10, 48]))
    
    tb_bsn.add_event(0, bytes([0xC3, 70]))
    tb_bsn.add_event(0, bytes([0xB3, 7, 102]))
    tb_bsn.add_event(0, bytes([0xB3, 10, 56]))
    
    tb_marimba.add_event(0, bytes([0xC4, 12]))
    tb_marimba.add_event(0, bytes([0xB4, 7, 98]))
    tb_marimba.add_event(0, bytes([0xB4, 10, 44]))
    
    tb_hn.add_event(0, bytes([0xC5, 60]))
    tb_hn.add_event(0, bytes([0xB5, 7, 104]))
    tb_hn.add_event(0, bytes([0xB5, 10, 40]))
    
    tb_tpt.add_event(0, bytes([0xC6, 56]))
    tb_tpt.add_event(0, bytes([0xB6, 7, 115]))
    tb_tpt.add_event(0, bytes([0xB6, 10, 68]))
    
    tb_tbn.add_event(0, bytes([0xC7, 57]))
    tb_tbn.add_event(0, bytes([0xB7, 7, 108]))
    tb_tbn.add_event(0, bytes([0xB7, 10, 76]))
    
    tb_tuba.add_event(0, bytes([0xC8, 58]))
    tb_tuba.add_event(0, bytes([0xB8, 7, 114]))
    tb_tuba.add_event(0, bytes([0xB8, 10, 64]))
    
    # Tempo Map:
    # mm. 1-5: Adagio Cantabile (♩ = 64)
    # mm. 6-24: Samba Energico (♩ = 112)
    tempo_64 = mido.bpm2tempo(64).to_bytes(3, 'big')
    tempo_112 = mido.bpm2tempo(112).to_bytes(3, 'big')
    
    tb_cond.add_event(0, b'\xFF\x51\x03' + tempo_64)
    tb_cond.add_event(0, b'\xFF\x58\x04\x04\x02\x18\x08')
    m1_tag = b"I. Adagio Cantabile"
    tb_cond.add_event(0, b'\xFF\x06' + bytes([len(m1_tag)]) + m1_tag)
    
    snap_tick = 5 * t_per_bar
    tb_cond.add_event(snap_tick, b'\xFF\x51\x03' + tempo_112)
    m2_tag = b"II. Samba Energico (The Snap!)"
    tb_cond.add_event(snap_tick, b'\xFF\x06' + bytes([len(m2_tag)]) + m2_tag)
    
    # LilyPond Buffers
    ly_chords = []
    ly_oboe = []
    ly_bsn = []
    ly_tpt = []
    ly_hn = []
    ly_tbn = []
    ly_tuba = []
    ly_bells = []
    ly_marimba = []
    ly_timpani = []
    ly_snare = []
    ly_bassdrum = []
    
    ly_chords.append('  \\time 4/4')
    ly_oboe.append('  \\time 4/4 \\key c \\minor \\clef treble \\tempo "Adagio Cantabile" 4 = 64')
    ly_bsn.append('  \\time 4/4 \\key c \\minor \\clef bass')
    ly_tpt.append('  \\time 4/4 \\key c \\minor \\clef treble')
    ly_hn.append('  \\time 4/4 \\key c \\minor \\clef treble')
    ly_tbn.append('  \\time 4/4 \\key c \\minor \\clef bass')
    ly_tuba.append('  \\time 4/4 \\key c \\minor \\clef bass')
    ly_bells.append('  \\time 4/4 \\key c \\minor \\clef treble')
    ly_marimba.append('  \\time 4/4 \\key c \\minor \\clef treble')
    ly_timpani.append('  \\time 4/4 \\clef bass')
    ly_snare.append('  \\time 4/4')
    ly_bassdrum.append('  \\time 4/4')
    
    for bar in range(1, 25):
        m_tick = (bar - 1) * t_per_bar
        
        # -------------------------------------------------------------
        # Harmony Tracking (C minor)
        # -------------------------------------------------------------
        if bar in [1, 2, 6, 8, 12, 16, 20]:
            ly_chords.append("  c1:m |")
        elif bar in [3, 7, 9, 13, 21]:
            ly_chords.append("  aes1 |")
        elif bar in [4, 10, 14]:
            ly_chords.append("  g1:7 |")
        elif bar == 5:
            ly_chords.append("  g1:7\\fermata |")
        elif bar in [11, 15]:
            ly_chords.append("  f1:m |")
        elif bar in [18, 19]:
            ly_chords.append("  d1:dim |")
        elif bar in [22, 23, 24]:
            ly_chords.append("  c1:m |")
        else:
            ly_chords.append("  c1:m |")

        # =============================================================
        # PART 1: ADAGIO CANTABILE (mm. 1-5, Oboe Sings Whole Melody)
        # =============================================================
        if bar in range(1, 6):
            ly_bsn.append("  R1 |")
            ly_tpt.append("  R1 |")
            ly_hn.append("  R1 |")
            ly_tbn.append("  R1 |")
            ly_tuba.append("  R1 |")
            ly_bells.append("  R1 |")
            ly_timpani.append("  R1 |")
            ly_snare.append("  R1 |")
            ly_bassdrum.append("  R1 |")
            
            # Marimba: Quiet, hypnotic arpeggiated accompaniment
            if bar in range(1, 5):
                ly_marimba.append("  \\tuplet 3/2 4 { c8\\p ees g c ees g c ees g c ees g } |")
                for trip in range(4):
                    b_t = m_tick + (trip * 480)
                    for i, p in enumerate([48, 51, 55]): # C3, Eb3, G3
                        tb_marimba.add_note(4, p, 58, b_t + (i * 160), 140)
            else:
                # m. 5: Tremolo roll swelling smoothly (p -> f) into the snap
                ly_marimba.append(r"  <c' ees' g'>1:32\fermata\p\< \! |")
                for i in range(16):
                    v = int(48 + (i * 3.2))
                    t_off = i * 120
                    tb_marimba.add_note(4, 60, v, m_tick + t_off, 110) # C4
                    tb_marimba.add_note(4, 67, v, m_tick + t_off, 110) # G4

            # Oboe: Sings the ENTIRE lyrical Beethoven melody alone!
            if bar == 1:
                ly_oboe.append("  r2 g'4.\\p g'8 |")
                tb_oboe.add_note(2, 67, 92, m_tick + 960, 680)
                tb_oboe.add_note(2, 67, 88, m_tick + 1680, 220)
            elif bar == 2:
                ly_oboe.append("  g'4. g'8 g'2 |")
                tb_oboe.add_note(2, 67, 92, m_tick, 680)
                tb_oboe.add_note(2, 67, 88, m_tick + 720, 220)
                tb_oboe.add_note(2, 67, 90, m_tick + 960, 920)
            elif bar == 3:
                ly_oboe.append("  r8 aes'4\\mp( g'8) fis'4.( aes'8) |")
                tb_oboe.add_note(2, 68, 95, m_tick + 240, 460)
                tb_oboe.add_note(2, 67, 90, m_tick + 720, 220)
                tb_oboe.add_note(2, 66, 92, m_tick + 960, 700)
                tb_oboe.add_note(2, 68, 95, m_tick + 1680, 220)
            elif bar == 4:
                ly_oboe.append("  g'4.\\mf g'8 bes'4. g'8 |")
                tb_oboe.add_note(2, 67, 95, m_tick, 680)
                tb_oboe.add_note(2, 67, 90, m_tick + 720, 220)
                tb_oboe.add_note(2, 70, 98, m_tick + 960, 680)
                tb_oboe.add_note(2, 67, 92, m_tick + 1680, 220)
            elif bar == 5:
                # The Hold: Oboe holds high soaring G4 into the fermata
                ly_oboe.append(r"  g'1\fermata\p\< \! |")
                tb_oboe.add_note(2, 67, 90, m_tick, t_per_bar - 40)

        # =============================================================
        # PART 2: SAMBA ENERGICO (mm. 6-24, ♩ = 112, THE SNAP!)
        # =============================================================
        else:
            # ---------------------------------------------------------
            # BATTERY: SNAPPY BRAZILIAN PERCUSSION (Surdo + Caixa + Cowbell!)
            # ---------------------------------------------------------
            if bar == 24:
                # Final decisive hit on beat 1 with crash choke
                ly_snare.append(r"  <sn cymc>4\fff-^ r r2\fermata |")
                tb_drums.add_note(9, 38, 127, m_tick, 350)           # Snare pop
                tb_drums.add_note(9, 49, 127, m_tick, 350)           # Crash cymbal
                
                ly_bassdrum.append(r"  bd4\fff-^ r r2\fermata |")
                tb_drums.add_note(9, 36, 127, m_tick, 350)           # Bass drum punch
                
                ly_timpani.append(r"  c4\fff-^ r r2\fermata |")
                tb_timp.add_note(1, 48, 127, m_tick, 350)            # Timpani C3
            elif bar == 6:
                # MEASURE 6: THE SNAP! Explosive crash + rimshot + cowbell groove start!
                ly_snare.append(r'  <sn cymc>4\fff-^ sn8\f sn sn4\f sn8 sn |')
                tb_drums.add_note(9, 49, 126, m_tick, 450)           # Crash Cymbal
                tb_drums.add_note(9, 38, 127, m_tick, 220)           # Snare rimshot
                tb_drums.add_note(9, 56, 115, m_tick, 220)           # Cowbell accent!
                
                # Snappy Brazilian caixa fill
                tb_drums.add_note(9, 37, 90, m_tick + 480, 180)      # Rim click
                tb_drums.add_note(9, 37, 95, m_tick + 720, 180)
                tb_drums.add_note(9, 38, 110, m_tick + 960, 220)     # Snare pop
                tb_drums.add_note(9, 37, 90, m_tick + 1440, 180)
                tb_drums.add_note(9, 37, 95, m_tick + 1680, 180)
                
                # Cowbell continuous syncopated pattern
                tb_drums.add_note(9, 56, 100, m_tick + 480, 180)
                tb_drums.add_note(9, 56, 105, m_tick + 720, 180)
                tb_drums.add_note(9, 56, 100, m_tick + 960, 180)
                tb_drums.add_note(9, 56, 105, m_tick + 1440, 180)
                tb_drums.add_note(9, 56, 110, m_tick + 1680, 180)
                
                # Surdo / Bass Drum: Heavy punch on 1, swing accent on upbeat of 2 & 4
                ly_bassdrum.append(r"  bd4\ff-^ r8 bd\f bd4\f r8 bd\f |")
                tb_drums.add_note(9, 36, 125, m_tick, 320)
                tb_drums.add_note(9, 36, 112, m_tick + 720, 220)
                tb_drums.add_note(9, 36, 95, m_tick + 960, 280)
                tb_drums.add_note(9, 36, 115, m_tick + 1680, 220)
                
                # Timpani: Accented C3 punch on beat 1, syncopated Eb3 on upbeat of 2
                ly_timpani.append(r"  c4\ff-^ r8 ees r2 |")
                tb_timp.add_note(1, 48, 120, m_tick, 350)            # C3
                tb_timp.add_note(1, 51, 110, m_tick + 720, 220)      # Eb3
            else:
                # Regular Snappy Samba Groove
                ly_snare.append("  sn8\\f sn r sn sn8. sn16 sn8 sn |")
                tb_drums.add_note(9, 37, 92, m_tick, 180)            # Rim click
                tb_drums.add_note(9, 37, 95, m_tick + 240, 180)
                tb_drums.add_note(9, 38, 108, m_tick + 720, 200)     # Snare pop
                tb_drums.add_note(9, 37, 95, m_tick + 960, 180)
                tb_drums.add_note(9, 37, 90, m_tick + 1320, 120)
                tb_drums.add_note(9, 38, 112, m_tick + 1440, 200)
                tb_drums.add_note(9, 37, 95, m_tick + 1680, 180)
                
                # Cowbell Pattern (Authentic Latin Drive)
                tb_drums.add_note(9, 56, 102, m_tick, 200)
                tb_drums.add_note(9, 56, 95, m_tick + 480, 200)
                tb_drums.add_note(9, 56, 108, m_tick + 720, 200)
                tb_drums.add_note(9, 56, 100, m_tick + 960, 200)
                tb_drums.add_note(9, 56, 95, m_tick + 1440, 200)
                tb_drums.add_note(9, 56, 110, m_tick + 1680, 200)
                
                # Surdo Bass Drum: Authentic Brazilian 2-beat swing
                ly_bassdrum.append("  bd4\\f r8 bd\\ff bd4\\f r8 bd\\ff |")
                tb_drums.add_note(9, 36, 90, m_tick, 280)
                tb_drums.add_note(9, 36, 115, m_tick + 720, 220)     # Upbeat 2 accent
                tb_drums.add_note(9, 36, 90, m_tick + 960, 280)
                tb_drums.add_note(9, 36, 118, m_tick + 1680, 220)    # Upbeat 4 accent
                
                # Timpani: Latin bass punch (C3 on 1, Eb3 on upbeat of 2)
                if bar in [16, 17]:
                    # Featured Percussion Break! Timpani joins in full force
                    ly_timpani.append("  c4\\ff-^ r8 ees c4-^ r8 ees |")
                    tb_timp.add_note(1, 48, 118, m_tick, 260)
                    tb_timp.add_note(1, 51, 112, m_tick + 720, 220)
                    tb_timp.add_note(1, 48, 115, m_tick + 960, 260)
                    tb_timp.add_note(1, 51, 112, m_tick + 1680, 220)
                elif bar % 2 == 1:
                    ly_timpani.append("  c4\\f-^ r8 ees r2 |")
                    tb_timp.add_note(1, 48, 112, m_tick, 280)
                    tb_timp.add_note(1, 51, 105, m_tick + 720, 220)
                else:
                    ly_timpani.append("  R1 |")

            # ---------------------------------------------------------
            # FRENCH HORNS: Syncopated Latin Montuno Vamps!
            # mm. 16-17: 2-bar breath rest (STRICT TACET!)
            # ---------------------------------------------------------
            if bar in [16, 17]:
                ly_hn.append("  R1 |")
            elif bar == 24:
                ly_hn.append(r"  <c' ees'>4\fff-^ r r2\fermata |")
                tb_hn.add_note(5, 60, 127, m_tick, 350)              # C4 (60)
                tb_hn.add_note(5, 63, 127, m_tick, 350)              # Eb4 (63)
            elif bar == 6:
                # m. 6: THE SNAP! Horns punch syncopated Latin montuno vamp
                ly_hn.append(r"  r8 <c' ees'>8-^\f r <c' ees'>-^ r <c' ees'>-^ <d' f'>4-^ |")
                tb_hn.add_note(5, 60, 115, m_tick + 240, 200)
                tb_hn.add_note(5, 63, 115, m_tick + 240, 200)
                tb_hn.add_note(5, 60, 110, m_tick + 720, 200)
                tb_hn.add_note(5, 63, 110, m_tick + 720, 200)
                tb_hn.add_note(5, 60, 112, m_tick + 1200, 200)
                tb_hn.add_note(5, 63, 112, m_tick + 1200, 200)
                tb_hn.add_note(5, 62, 118, m_tick + 1440, 420)       # D4 (62)
                tb_hn.add_note(5, 65, 118, m_tick + 1440, 420)       # F4 (65)
            elif bar == 7:
                # m. 7: Horns continue vamp leading into Trumpet entrance
                ly_hn.append(r"  r8 <c' ees'>8-^\f r <c' ees'>-^ r <d' f'>-^ <ees' g'>4-^ |")
                tb_hn.add_note(5, 60, 115, m_tick + 240, 200)
                tb_hn.add_note(5, 63, 115, m_tick + 240, 200)
                tb_hn.add_note(5, 60, 110, m_tick + 720, 200)
                tb_hn.add_note(5, 63, 110, m_tick + 720, 200)
                tb_hn.add_note(5, 62, 112, m_tick + 1200, 200)
                tb_hn.add_note(5, 65, 112, m_tick + 1200, 200)
                tb_hn.add_note(5, 63, 120, m_tick + 1440, 420)       # Eb4 (63)
                tb_hn.add_note(5, 67, 120, m_tick + 1440, 420)       # G4 (67)
            elif bar in [18, 19, 20, 21, 22, 23]:
                # Climax Tutti: Powerful rhythmic Latin chord punches
                ly_hn.append("  r8 <c' ees'>4\\ff <c' ees'>8 r <d' f'>4 <ees' g'>8 |")
                tb_hn.add_note(5, 60, 115, m_tick + 240, 420)
                tb_hn.add_note(5, 63, 115, m_tick + 240, 420)
                tb_hn.add_note(5, 60, 110, m_tick + 720, 200)
                tb_hn.add_note(5, 63, 110, m_tick + 720, 200)
                tb_hn.add_note(5, 62, 115, m_tick + 1200, 420)
                tb_hn.add_note(5, 65, 115, m_tick + 1200, 420)
                tb_hn.add_note(5, 63, 118, m_tick + 1680, 220)
                tb_hn.add_note(5, 67, 118, m_tick + 1680, 220)
            else:
                # mm. 8-15: Warm, syncopated Latin montuno comping underneath Trumpet
                ly_hn.append("  r8 <c' ees'>4\\mf <c' ees'>8 r <c' ees'>4 <c' ees'>8 |")
                tb_hn.add_note(5, 60, 95, m_tick + 240, 420)
                tb_hn.add_note(5, 63, 95, m_tick + 240, 420)
                tb_hn.add_note(5, 60, 90, m_tick + 720, 200)
                tb_hn.add_note(5, 63, 90, m_tick + 720, 200)
                tb_hn.add_note(5, 60, 95, m_tick + 1200, 420)
                tb_hn.add_note(5, 63, 95, m_tick + 1200, 420)
                tb_hn.add_note(5, 60, 90, m_tick + 1680, 220)
                tb_hn.add_note(5, 63, 90, m_tick + 1680, 220)

            # ---------------------------------------------------------
            # TROMBONE: Swaggering Latin Slides!
            # mm. 16-17: 2-bar breath rest (STRICT TACET!)
            # ---------------------------------------------------------
            if bar in [16, 17]:
                ly_tbn.append("  R1 |")
            elif bar == 24:
                ly_tbn.append(r"  c4\fff-^ r r2\fermata |")
                tb_tbn.add_note(7, 48, 127, m_tick, 350)             # C3 (48)
            elif bar == 6:
                # Slide 1: THE SNAP! Greasy rip (F3 -> G3)
                ly_tbn.append(r"  r8 f4\f\glissando( g8-^) r2 |")
                tb_tbn.add_note(7, 53, 112, m_tick + 240, 220)       # F3 (53)
                tb_tbn.add_note(7, 55, 120, m_tick + 480, 460)       # G3 (55)
            elif bar == 7:
                # Slide 2: Answering slide setting up Trumpet lead (D3 -> Eb3)
                ly_tbn.append(r"  r8 d4\f\glissando( ees8-^) r2 |")
                tb_tbn.add_note(7, 50, 112, m_tick + 240, 220)       # D3 (50)
                tb_tbn.add_note(7, 51, 120, m_tick + 480, 460)       # Eb3 (51)
            elif bar == 11:
                # Slide 3: Punching into the Trumpet's secondary phrase (F3 -> G3)
                ly_tbn.append(r"  r8 f4\f\glissando( g8-^) r2 |")
                tb_tbn.add_note(7, 53, 110, m_tick + 240, 220)
                tb_tbn.add_note(7, 55, 118, m_tick + 480, 460)
            elif bar == 15:
                # Slide 4: Turnaround into the Percussion Break (D3 -> Eb3)
                ly_tbn.append(r"  r8 d4\f\glissando( ees8-^) r2 |")
                tb_tbn.add_note(7, 50, 110, m_tick + 240, 220)
                tb_tbn.add_note(7, 51, 118, m_tick + 480, 460)
            elif bar == 21:
                # Slide 5: Climax Turnaround Slide! (F3 -> G3)
                ly_tbn.append(r"  r8 f4\ff\glissando( g8-^) r2 |")
                tb_tbn.add_note(7, 53, 118, m_tick + 240, 220)
                tb_tbn.add_note(7, 55, 125, m_tick + 480, 460)
            else:
                # Syncopated Latin tenor harmony stabs
                ly_tbn.append("  r8 c4\\mf c8 r c4 c8 |")
                tb_tbn.add_note(7, 48, 92, m_tick + 240, 420)        # C3 (48)
                tb_tbn.add_note(7, 48, 88, m_tick + 720, 200)
                tb_tbn.add_note(7, 48, 92, m_tick + 1200, 420)
                tb_tbn.add_note(7, 48, 88, m_tick + 1680, 220)

            # ---------------------------------------------------------
            # TUBA & BASSOON: Bouncing Brazilian Samba Bassline!
            # mm. 16-17: 2-bar breath rest (STRICT TACET!)
            # ---------------------------------------------------------
            if bar in [16, 17]:
                ly_tuba.append("  R1 |")
                ly_bsn.append("  R1 |")
            elif bar == 24:
                ly_tuba.append(r"  c,4\fff-^ r r2\fermata |")
                tb_tuba.add_note(8, 36, 127, m_tick, 350)            # C2 (36)
                ly_bsn.append(r"  c,4\fff-^ r r2\fermata |")
                tb_bsn.add_note(3, 36, 125, m_tick, 350)             # C2 (36)
            else:
                # Authentic Brazilian Samba Bass: Root on 1, upbeat 2; Fifth on 3, upbeat 4!
                p_r = 36  # C2
                p_5 = 43  # G2
                dyn = r"\ff" if bar in [18, 19, 20, 21, 22, 23] else r"\f"
                v_down = 115 if bar in [18, 19, 20, 21, 22, 23] else 105
                v_up = 122 if bar in [18, 19, 20, 21, 22, 23] else 112
                
                ly_tuba.append(f"  c,4{dyn} r8 c,8 g,,4 r8 g,,8 |")
                tb_tuba.add_note(8, p_r, v_down, m_tick, 380)
                tb_tuba.add_note(8, p_r, v_up, m_tick + 720, 220)    # Upbeat 2
                tb_tuba.add_note(8, p_5, v_down, m_tick + 960, 380)
                tb_tuba.add_note(8, p_5, v_up, m_tick + 1680, 220)   # Upbeat 4
                
                ly_bsn.append(f"  c,4{dyn} r8 c,8 g,,4 r8 g,,8 |")
                tb_bsn.add_note(3, p_r, v_down - 5, m_tick, 380)
                tb_bsn.add_note(3, p_r, v_up - 5, m_tick + 720, 220)
                tb_bsn.add_note(3, p_5, v_down - 5, m_tick + 960, 380)
                tb_bsn.add_note(3, p_5, v_up - 5, m_tick + 1680, 220)

            # ---------------------------------------------------------
            # B♭ TRUMPET: OWNS THE SAMBA LEAD! (Syncopated Latin Phrasing)
            # mm. 6-7: Tacet (Groove setup). mm. 8-15: 8 bars <= 16.
            # mm. 16-17: 2-bar breath rest. mm. 18-24: 7 bars <= 16.
            # ---------------------------------------------------------
            if bar in [6, 7, 16, 17]:
                ly_tpt.append("  R1 |")
            elif bar == 24:
                ly_tpt.append(r"  c''4\fff-^ r r2\fermata |")
                tb_tpt.add_note(6, 72, 127, m_tick, 350)             # C5 (72)
            elif bar == 8:
                # Trumpet enters on snappy syncopated Beethoven theme!
                ly_tpt.append("  r8 g'8\\ff g'4 r8 g'8 g'4 |")
                tb_tpt.add_note(6, 67, 118, m_tick + 240, 220)       # G4 (67)
                tb_tpt.add_note(6, 67, 122, m_tick + 480, 420)
                tb_tpt.add_note(6, 67, 115, m_tick + 1200, 220)
                tb_tpt.add_note(6, 67, 120, m_tick + 1440, 420)
            elif bar == 9:
                ly_tpt.append("  r8 g'8 g'4 bes'8.\\ff g'16 g'4 |")
                tb_tpt.add_note(6, 67, 118, m_tick + 240, 220)
                tb_tpt.add_note(6, 67, 120, m_tick + 480, 420)
                tb_tpt.add_note(6, 70, 125, m_tick + 960, 320)       # Bb4 (70)
                tb_tpt.add_note(6, 67, 112, m_tick + 1320, 120)
                tb_tpt.add_note(6, 67, 120, m_tick + 1440, 420)
            elif bar == 10:
                ly_tpt.append("  aes'4.\\ff g'8 fis'4. aes'8 |")
                tb_tpt.add_note(6, 68, 122, m_tick, 680)             # Ab4 (68)
                tb_tpt.add_note(6, 67, 115, m_tick + 720, 220)       # G4 (67)
                tb_tpt.add_note(6, 66, 120, m_tick + 960, 680)       # F#4 (66)
                tb_tpt.add_note(6, 68, 122, m_tick + 1680, 220)      # Ab4 (68)
            elif bar == 11:
                ly_tpt.append("  g'2. r4 |")
                tb_tpt.add_note(6, 67, 122, m_tick, 1400)
            elif bar == 12:
                # Secondary Latin Phrase
                ly_tpt.append("  r8 bes'8\\ff bes'4 r8 c''8 bes'4 |")
                tb_tpt.add_note(6, 70, 120, m_tick + 240, 220)       # Bb4 (70)
                tb_tpt.add_note(6, 70, 125, m_tick + 480, 420)
                tb_tpt.add_note(6, 72, 125, m_tick + 1200, 220)      # C5 (72)
                tb_tpt.add_note(6, 70, 120, m_tick + 1440, 420)
            elif bar == 13:
                ly_tpt.append("  des''4.\\ff c''8 b'4. c''8 |")
                tb_tpt.add_note(6, 73, 125, m_tick, 680)             # Db5 (73)
                tb_tpt.add_note(6, 72, 120, m_tick + 720, 220)       # C5 (72)
                tb_tpt.add_note(6, 71, 122, m_tick + 960, 680)       # B4 (71)
                tb_tpt.add_note(6, 72, 125, m_tick + 1680, 220)      # C5 (72)
            elif bar == 14:
                ly_tpt.append("  d''4.\\ff c''8 b'4. c''8 |")
                tb_tpt.add_note(6, 74, 125, m_tick, 680)             # D5 (74)
                tb_tpt.add_note(6, 72, 120, m_tick + 720, 220)       # C5 (72)
                tb_tpt.add_note(6, 71, 122, m_tick + 960, 680)       # B4 (71)
                tb_tpt.add_note(6, 72, 125, m_tick + 1680, 220)      # C5 (72)
            elif bar == 15:
                ly_tpt.append("  c''2. r4 |")
                tb_tpt.add_note(6, 72, 125, m_tick, 1400)
            elif bar == 18:
                # Climax Re-entry
                ly_tpt.append("  d''4.\\fff c''8 b'4. c''8 |")
                tb_tpt.add_note(6, 74, 126, m_tick, 680)             # D5 (74)
                tb_tpt.add_note(6, 72, 120, m_tick + 720, 220)       # C5 (72)
                tb_tpt.add_note(6, 71, 122, m_tick + 960, 680)       # B4 (71)
                tb_tpt.add_note(6, 72, 125, m_tick + 1680, 220)      # C5 (72)
            elif bar == 19:
                ly_tpt.append("  d''2.\\fff g'4\\fff |")
                tb_tpt.add_note(6, 74, 127, m_tick, 1400)            # D5 (74)
                tb_tpt.add_note(6, 67, 125, m_tick + 1440, 440)      # G4 (67)
            elif bar == 20:
                ly_tpt.append("  c''4.\\fff c''8 d''4. c''8 |")
                tb_tpt.add_note(6, 72, 127, m_tick, 680)             # C5 (72)
                tb_tpt.add_note(6, 72, 122, m_tick + 720, 220)
                tb_tpt.add_note(6, 74, 127, m_tick + 960, 680)       # D5 (74)
                tb_tpt.add_note(6, 72, 122, m_tick + 1680, 220)
            elif bar == 21:
                ly_tpt.append("  ees''4.\\fff d''8 c''4. bes'8 |")
                tb_tpt.add_note(6, 75, 127, m_tick, 680)             # Eb5 (75) <= 77!
                tb_tpt.add_note(6, 74, 122, m_tick + 720, 220)       # D5 (74)
                tb_tpt.add_note(6, 72, 125, m_tick + 960, 680)       # C5 (72)
                tb_tpt.add_note(6, 70, 120, m_tick + 1680, 220)      # Bb4 (70)
            elif bar in [22, 23]:
                ly_tpt.append("  c''1\\fff |")
                tb_tpt.add_note(6, 72, 127, m_tick, t_per_bar - 40)  # C5 (72)

            # ---------------------------------------------------------
            # OBOE: Rests in Samba so Trumpet has full spotlight!
            # Joins on final climax (mm. 22-24)
            # ---------------------------------------------------------
            if bar in range(6, 22):
                ly_oboe.append("  R1 |")
            elif bar in [22, 23]:
                ly_oboe.append("  c''1\\ff |")
                tb_oboe.add_note(2, 72, 115, m_tick, t_per_bar - 40) # C5 (72)
            elif bar == 24:
                ly_oboe.append(r"  c''4\fff-^ r r2\fermata |")
                tb_oboe.add_note(2, 72, 127, m_tick, 350)

            # ---------------------------------------------------------
            # MARIMBA: Crisp Latin Montuno Comping (Wooden Choro Mallets!)
            # ---------------------------------------------------------
            if bar == 24:
                ly_marimba.append(r"  <c' ees' g'>4\fff-^ r r2\fermata |")
                tb_marimba.add_note(4, 48, 127, m_tick, 350)
                tb_marimba.add_note(4, 51, 127, m_tick, 350)
                tb_marimba.add_note(4, 55, 127, m_tick, 350)
            elif bar in range(6, 24):
                # Crisp Latin offbeat chord stabs
                ly_marimba.append("  r8 <c' ees'>8\\mp r <c' ees'> r <c' ees'> <c' ees'>4 |")
                tb_marimba.add_note(4, 60, 85, m_tick + 240, 200)    # C4
                tb_marimba.add_note(4, 63, 85, m_tick + 240, 200)    # Eb4
                tb_marimba.add_note(4, 60, 80, m_tick + 720, 200)
                tb_marimba.add_note(4, 63, 80, m_tick + 720, 200)
                tb_marimba.add_note(4, 60, 85, m_tick + 1200, 200)
                tb_marimba.add_note(4, 63, 85, m_tick + 1200, 200)
                tb_marimba.add_note(4, 60, 88, m_tick + 1440, 420)
                tb_marimba.add_note(4, 63, 88, m_tick + 1440, 420)

            # ---------------------------------------------------------
            # GLOCKENSPIEL: Climax Brilliance
            # ---------------------------------------------------------
            if bar == 24:
                ly_bells.append(r"  c'''4\fff-^ r r2\fermata |")
                tb_bells.add_note(0, 84, 127, m_tick, 350)           # C6 (84)
            elif bar in [22, 23]:
                ly_bells.append("  c'''1\\f |")
                tb_bells.add_note(0, 84, 110, m_tick, t_per_bar - 40)
            else:
                ly_bells.append("  R1 |")

    # -------------------------------------------------------------
    # LilyPond Document Construction
    # -------------------------------------------------------------
    ly_code = [
        r'\version "2.24.0"',
        r'\include "articulate.ly"',
        "",
        r'\header {',
        '  title = "Moonlight Samba (1-Minute Concert Band Feature)"',
        '  subtitle = "Adagio Cantabile e Samba Energico — Op. 27, No. 2"',
        '  composer = "Ludwig van Beethoven"',
        '  arranger = "Arranged by John Daniel Dondlinger"',
        '  tagline = "Dedicated to the Wisconsin Rapids City Band by John Daniel Dondlinger (2026)"',
        r'}',
        "",
        r'#(set-global-staff-size 14)',
        "",
        r'\paper {',
        r'  #(set-paper-size "letter")',
        r'  top-margin = 0.45\in',
        r'  bottom-margin = 0.45\in',
        r'  left-margin = 0.5\in',
        r'  right-margin = 0.45\in',
        r'  ragged-last-bottom = ##f',
        r'}',
        "",
        "chordTrack = \\chordmode {",
    ]
    ly_code.extend(ly_chords)
    ly_code.append("}\n")
    
    ly_code.append(r"oboePart = \fixed c' {")
    ly_code.extend(ly_oboe)
    ly_code.append(r'  \bar "|."')
    ly_code.append("}\n")
    
    ly_code.append(r"bassoonPart = \fixed c, {")
    ly_code.extend(ly_bsn)
    ly_code.append(r'  \bar "|."')
    ly_code.append("}\n")
    
    ly_code.append(r"trumpetPart = \fixed c' {")
    ly_code.extend(ly_tpt)
    ly_code.append(r'  \bar "|."')
    ly_code.append("}\n")
    
    ly_code.append(r"hornPart = \fixed c' {")
    ly_code.extend(ly_hn)
    ly_code.append(r'  \bar "|."')
    ly_code.append("}\n")
    
    ly_code.append(r"trombonePart = \fixed c {")
    ly_code.extend(ly_tbn)
    ly_code.append(r'  \bar "|."')
    ly_code.append("}\n")
    
    ly_code.append(r"tubaPart = \fixed c, {")
    ly_code.extend(ly_tuba)
    ly_code.append(r'  \bar "|."')
    ly_code.append("}\n")
    
    ly_code.append(r"bellsPart = \fixed c' {")
    ly_code.extend(ly_bells)
    ly_code.append(r'  \bar "|."')
    ly_code.append("}\n")
    
    ly_code.append(r"marimbaPart = \fixed c' {")
    ly_code.extend(ly_marimba)
    ly_code.append(r'  \bar "|."')
    ly_code.append("}\n")
    
    ly_code.append(r"timpaniPart = \fixed c, {")
    ly_code.extend(ly_timpani)
    ly_code.append(r'  \bar "|."')
    ly_code.append("}\n")
    
    ly_code.append(r"snarePart = \drummode {")
    ly_code.extend(ly_snare)
    ly_code.append(r'  \bar "|."')
    ly_code.append("}\n")
    
    ly_code.append(r"bassDrumPart = \drummode {")
    ly_code.extend(ly_bassdrum)
    ly_code.append(r'  \bar "|."')
    ly_code.append("}\n")
    
    ly_code.append(r"\score {")
    ly_code.append(r"  <<")
    ly_code.append(r"    \new ChordNames { \chordTrack }")
    ly_code.append(r'    \new StaffGroup = "Woodwinds" <<')
    ly_code.append(r'      \new Staff \with {')
    ly_code.append(r'        instrumentName = #"Oboe"')
    ly_code.append(r'        shortInstrumentName = #"Ob."')
    ly_code.append(r'        midiInstrument = #"oboe"')
    ly_code.append(r'      } { \oboePart }')
    ly_code.append(r'      \new Staff \with {')
    ly_code.append(r'        instrumentName = #"Bassoon"')
    ly_code.append(r'        shortInstrumentName = #"Bsn."')
    ly_code.append(r'        midiInstrument = #"bassoon"')
    ly_code.append(r'      } { \bassoonPart }')
    ly_code.append(r'    >>')
    ly_code.append(r'    \new StaffGroup = "Brass" <<')
    ly_code.append(r'      \new Staff \with {')
    ly_code.append(r'        instrumentName = #"B♭ Trumpet"')
    ly_code.append(r'        shortInstrumentName = #"Tpt."')
    ly_code.append(r'        midiInstrument = #"trumpet"')
    ly_code.append(r'      } { \trumpetPart }')
    ly_code.append(r'      \new Staff \with {')
    ly_code.append(r'        instrumentName = #"French Horn in F"')
    ly_code.append(r'        shortInstrumentName = #"Hn."')
    ly_code.append(r'        midiInstrument = #"french horn"')
    ly_code.append(r'      } { \hornPart }')
    ly_code.append(r'      \new Staff \with {')
    ly_code.append(r'        instrumentName = #"Trombone"')
    ly_code.append(r'        shortInstrumentName = #"Tbn."')
    ly_code.append(r'        midiInstrument = #"trombone"')
    ly_code.append(r'      } { \trombonePart }')
    ly_code.append(r'      \new Staff \with {')
    ly_code.append(r'        instrumentName = #"Tuba"')
    ly_code.append(r'        shortInstrumentName = #"Tuba"')
    ly_code.append(r'        midiInstrument = #"tuba"')
    ly_code.append(r'      } { \tubaPart }')
    ly_code.append(r'    >>')
    ly_code.append(r'    \new StaffGroup = "TunedPercussion" <<')
    ly_code.append(r'      \new Staff \with {')
    ly_code.append(r'        instrumentName = #"Glockenspiel (Bells)"')
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
    ly_code.append(r'      \new DrumStaff \with {')
    ly_code.append(r'        instrumentName = #"Concert Snare"')
    ly_code.append(r'        shortInstrumentName = #"Sn."')
    ly_code.append(r'      } { \snarePart }')
    ly_code.append(r'      \new DrumStaff \with {')
    ly_code.append(r'        instrumentName = #"Concert Bass Drum"')
    ly_code.append(r'        shortInstrumentName = #"B.D."')
    ly_code.append(r'      } { \bassDrumPart }')
    ly_code.append(r'    >>')
    ly_code.append(r'  >>')
    ly_code.append(r'  \layout { }')
    ly_code.append(r'}')
    
    os.makedirs(os.path.join(WORKDIR, "Scores"), exist_ok=True)
    ly_path = os.path.join(WORKDIR, "Scores", "moonlight_samba_score.ly")
    with open(ly_path, "w", encoding="utf-8") as f:
        f.write("\n".join(ly_code) + "\n")
    print(f"[OK] Wrote LilyPond Score: {ly_path}")
    
    # -------------------------------------------------------------
    # MIDI File Compilation
    # -------------------------------------------------------------
    tracks = [
        tb_cond.build_track(),
        tb_bells.build_track(),
        tb_timp.build_track(),
        tb_oboe.build_track(),
        tb_bsn.build_track(),
        tb_marimba.build_track(),
        tb_hn.build_track(),
        tb_tpt.build_track(),
        tb_tbn.build_track(),
        tb_tuba.build_track(),
        tb_drums.build_track(),
    ]
    midi_bytes = build_midi_file_bytes(tracks, division=ticks_per_beat)
    mid_path = os.path.join(WORKDIR, "Scores", "moonlight_samba_score.mid")
    with open(mid_path, "wb") as f:
        f.write(midi_bytes)
    print(f"[OK] Wrote Master MIDI: {mid_path} ({len(midi_bytes)} bytes)")
    
    # Verify Duration
    mid = mido.MidiFile(mid_path)
    total_sec = mid.length
    print(f"[VERIFY] Total Score Duration: {total_sec:.2f} seconds")
    
    # -------------------------------------------------------------
    # LilyPond Engraving
    # -------------------------------------------------------------
    print("[ENGRAVE] Compiling LilyPond Score to PDF...")
    cmd_ly = [LILYPOND, "-o", os.path.join(WORKDIR, "Scores", "moonlight_samba_score"), ly_path]
    res_ly = subprocess.run(cmd_ly, capture_output=True, text=True)
    if res_ly.returncode != 0:
        print("[ERROR] LilyPond Failed:")
        print(res_ly.stderr)
        sys.exit(1)
    print("[OK] PDF Engraved: Scores/moonlight_samba_score.pdf")
    
    # -------------------------------------------------------------
    # FluidSynth Master Audio Synthesis
    # -------------------------------------------------------------
    wav_path = os.path.join(WORKDIR, "moonlight_samba_master.wav")
    print(f"[SYNTH] Rendering Master Audio via FluidSynth to {wav_path}...")
    cmd_fs = [
        FLUIDSYNTH,
        "-ni",
        "-g", "1.1",
        SOUNDFONT,
        mid_path,
        "-F", wav_path,
        "-r", "44100"
    ]
    res_fs = subprocess.run(cmd_fs, capture_output=True, text=True)
    if res_fs.returncode != 0:
        print("[ERROR] FluidSynth Failed:")
        print(res_fs.stderr)
        sys.exit(1)
    wav_size = os.path.getsize(wav_path)
    print(f"[OK] Master Audio Rendered: {wav_size} bytes ({wav_size / 1024 / 1024:.1f} MB)")
    
    # -------------------------------------------------------------
    # Mirror Deliverables to John's Send Directory
    # -------------------------------------------------------------
    send_dir = os.path.join(WORKDIR, "Scores", "moonlight_samba_jd_send")
    if os.path.exists(send_dir):
        import shutil
        shutil.copy2(mid_path, os.path.join(send_dir, "moonlight_samba_score.mid"))
        pdf_src = os.path.join(WORKDIR, "Scores", "moonlight_samba_score.pdf")
        if os.path.exists(pdf_src):
            shutil.copy2(pdf_src, os.path.join(send_dir, "moonlight_samba_score.pdf"))
        if os.path.exists(wav_path):
            shutil.copy2(wav_path, os.path.join(send_dir, "moonlight_samba_master.wav"))
        print(f"[SYNC] Mirrored master deliverables (WAV, PDF, MID) to: {send_dir}")
    
    print("\n=== Moonlight Samba Build Successfully Completed! ===")

if __name__ == "__main__":
    build()
