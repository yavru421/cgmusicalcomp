# CGMusicalComp: Algorithmic Concert Band Engine & Score Generator

[![LilyPond 2.24.4](https://img.shields.io/badge/Engraver-LilyPond_2.24.4-blue.svg?logo=gnu&style=for-the-badge)](https://lilypond.org/)
[![FluidSynth 2.4.3](https://img.shields.io/badge/Synthesizer-FluidSynth_2.4.3-green.svg?style=for-the-badge)](https://www.fluidsynth.org/)
[![Audio 44.1kHz Stereo](https://img.shields.io/badge/Audio-44.1kHz_Stereo_Master-orange.svg?style=for-the-badge)](file:///C:/dev/CGMusicalComposition/)
[![13 Conductor Scores](https://img.shields.io/badge/Scores-13_Full_Conductor_Scores-purple.svg?style=for-the-badge)](file:///C:/dev/CGMusicalComposition/)
[![33 Musician Parts](https://img.shields.io/badge/Parts-33_Musician_Parts-blueviolet.svg?style=for-the-badge)](file:///C:/dev/CGMusicalComposition/Parts/)
[![License: MIT & CC BY 4.0](https://img.shields.io/badge/License-MIT_%26_CC_BY_4.0-red.svg?style=for-the-badge)](./LICENSE)
[![City Band](https://img.shields.io/badge/Ensemble-Wisconsin_Rapids_City_Band-gold.svg?style=for-the-badge)](https://www.wirapids.org/)

**Composed, Arranged & Orchestrated by John Daniel Dondlinger**  
*Dedicated to the musicians and community of the Wisconsin Rapids City Band (Wisconsin Rapids, WI)*

---

## 🌟 Spotlight: *Moonlight Samba* (Beethoven Op. 27 No. 2 Recast in Latin Bossa)

What happens when Beethoven’s iconic *Moonlight Sonata* meets an authentic Afro-Cuban / Bossa Nova concert band groove?

* **Listen to the Master Audio**: [moonlight_samba_master.wav](file:///C:/dev/CGMusicalComposition/moonlight_samba_master.wav)
* **View the Conductor Score (PDF)**: [Scores/moonlight_samba_score.pdf](file:///C:/dev/CGMusicalComposition/Scores/moonlight_samba_score.pdf)
* **Individual Musician Parts (19 printable PDFs)**: [Parts/](file:///C:/dev/CGMusicalComposition/Parts/)
* **Multi-Track MIDI Export**: [Scores/moonlight_samba_score.mid](file:///C:/dev/CGMusicalComposition/Scores/moonlight_samba_score.mid)

### Musical & Technical Innovations in *Moonlight Samba*:
1. **Montuno & Clave Counterpoint**: Beethoven’s triplet arpeggios are re-voiced across clarinets and flutes over a syncopated bossa rhythm section (claves, cabasa, timbales, congas, bass).
2. **Channel-Isolated Latin Percussion**: Latin percussion battery is mapped across independent MIDI channels (`ch 9, 10, 11, 12`) to eliminate General MIDI voice-stealing and drum clipping.
3. **Calibrated Acoustic Spatialization**: FluidSynth concert hall reverberation (`room-size=0.45`, `damp=0.60`, `level=0.25`, `gain=0.45`) with spatial band seating pan curves (CC 10).
4. **Gaussian Humanization**: Note timing micro-jitter ($\pm 6\text{ ms}$) and metric dynamic curves remove robotic MIDI stiffness across 2,495 notes.

---

## 🎯 Repository Highlights

* **13 Full Conductor Scores & Masters**: Complete engraving sources (`.ly`), conductor scores (`.pdf`), multi-track sequences (`.mid`), and stereo masters (`.wav`).
* **33 Individual Musician Parts**: Automatic extraction with `\compressMMRests`, rehearsal cues, and page turns for full concert band rehearsal.
* **The 14-Voice Concert Band Core**: Strict absolute concert pitch architecture (`\fixed c'`) with zero relative-mode octave runaway.
* **Solo Toms 3/4 Overture**: The centerpiece *A Soix Medley* begins with a 12-measure unaccompanied concert tom-toms solo in $\frac{3}{4}$ meter.
* **14-Instrument Benchmark Suite**: Features every acoustic instrument playing an individual solo medley, complete with Kokoro ONNX neural voice narration (`benchmark_instruments_showcase_narrated.wav`).
* **Production-Grade Licensing**: Dual MIT (software & tooling) and Creative Commons Attribution 4.0 (musical scores & audio).

---

## 🎧 Master Repertoire Jukebox & Score Catalog

Every completed piece in this repository is engraved in vector PDF, exported to MIDI, and synthesized into a release-quality stereo master via FluidSynth and acoustic hall reverberation:

| Work Title & Description | Key & Meter | Tempo | 🎼 Sheet Music (PDF) | 🔊 Master Audio (WAV) | 🎹 MIDI Export |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Still D.R.E.**<br>*Concert Band Edition — G-Funk Pocket & Scott Storch Motif* | A minor | 94 BPM | [still_dre_score.pdf](file:///C:/dev/CGMusicalComposition/Scores/still_dre_score.pdf) | [still_dre_master.wav](file:///C:/dev/CGMusicalComposition/still_dre_master.wav) | [still_dre_score.mid](file:///C:/dev/CGMusicalComposition/Scores/still_dre_score.mid) |
| **Moonlight Samba**<br>*Beethoven Op. 27 No. 2 recast in Latin Bossa* | C minor | 116 BPM | [moonlight_samba_score.pdf](file:///C:/dev/CGMusicalComposition/Scores/moonlight_samba_score.pdf) | [moonlight_samba_master.wav](file:///C:/dev/CGMusicalComposition/moonlight_samba_master.wav) | [moonlight_samba_score.mid](file:///C:/dev/CGMusicalComposition/Scores/moonlight_samba_score.mid) |
| **A Soix Medley**<br>*6-movement suite with 3/4 Solo Toms Overture* | $E\flat$ / C min / D min / $B\flat$ | $120 \to 96 \to 116 \to 104 \to 95 \to 120$ | [a_soix_medley.pdf](file:///C:/dev/CGMusicalComposition/a_soix_medley.pdf) | [a_soix_medley.wav](file:///C:/dev/CGMusicalComposition/a_soix_medley.wav) | [a_soix_medley.mid](file:///C:/dev/CGMusicalComposition/a_soix_medley.mid) |
| **Instrument Showcase & Benchmark (Narrated)**<br>*All 14 band instruments with voice intros* | $B\flat$ Major | 100 BPM | [benchmark_instruments_showcase.pdf](file:///C:/dev/CGMusicalComposition/benchmark_instruments_showcase.pdf) | [benchmark_instruments_showcase_narrated.wav](file:///C:/dev/CGMusicalComposition/benchmark_instruments_showcase_narrated.wav) | [benchmark_instruments_showcase.mid](file:///C:/dev/CGMusicalComposition/benchmark_instruments_showcase.mid) |
| **Instrument Showcase (Continuous)**<br>*Unbroken 60-bar solo sequence & tutti finale* | $B\flat$ Major | 100 BPM | [benchmark_instruments_showcase.pdf](file:///C:/dev/CGMusicalComposition/benchmark_instruments_showcase.pdf) | [benchmark_instruments_showcase.wav](file:///C:/dev/CGMusicalComposition/benchmark_instruments_showcase.wav) | [benchmark_instruments_showcase.mid](file:///C:/dev/CGMusicalComposition/benchmark_instruments_showcase.mid) |
| **Sovereign Light**<br>*Pentatonic tone poem for band & 4-mallet marimba* | $E\flat$ Major | 96 BPM | [sovereign_light.pdf](file:///C:/dev/CGMusicalComposition/sovereign_light.pdf) | [sovereign_light.wav](file:///C:/dev/CGMusicalComposition/sovereign_light.wav) | [sovereign_light.mid](file:///C:/dev/CGMusicalComposition/sovereign_light.mid) |
| **Sovereign Forge**<br>*Grand heroic brass & percussion overture* | $B\flat$ Major | 112 BPM | [sovereign_forge.pdf](file:///C:/dev/CGMusicalComposition/sovereign_forge.pdf) | [sovereign_forge.wav](file:///C:/dev/CGMusicalComposition/sovereign_forge.wav) | [sovereign_forge.mid](file:///C:/dev/CGMusicalComposition/sovereign_forge.mid) |
| **Moonlight Intro (Quartet)**<br>*Flute, Clarinet, Horn, and Cello chamber setting* | C# minor | 60 BPM | [moonlight_intro.pdf](file:///C:/dev/CGMusicalComposition/moonlight_intro.pdf) | [moonlight_intro.wav](file:///C:/dev/CGMusicalComposition/moonlight_intro.wav) | [moonlight_intro.mid](file:///C:/dev/CGMusicalComposition/moonlight_intro.mid) |
| **The Buccaneer's Reel & Island Horizon**<br>*Swashbuckling 6/8 Caribbean maritime adventure* | D minor / F Maj | 112 BPM (in 6/8) | [pirate_caribbean_groove.pdf](file:///C:/dev/CGMusicalComposition/pirate_caribbean_groove.pdf) | [pirate_caribbean_groove.wav](file:///C:/dev/CGMusicalComposition/pirate_caribbean_groove.wav) | [pirate_caribbean_groove.mid](file:///C:/dev/CGMusicalComposition/pirate_caribbean_groove.mid) |
| **Groovatude**<br>*70s brass funk pocket with slap bass & alto sax* | $B\flat$ Major | 104 BPM | [groovatude.pdf](file:///C:/dev/CGMusicalComposition/groovatude.pdf) | [groovatude.wav](file:///C:/dev/CGMusicalComposition/groovatude.wav) | [groovatude.mid](file:///C:/dev/CGMusicalComposition/groovatude.mid) |
| **The Next Episode (Concert Band Intro)**<br>*David Axelrod "The Edge" bassline & string hook* | G minor | 95 BPM | [next_episode_intro.pdf](file:///C:/dev/CGMusicalComposition/next_episode_intro.pdf) | [next_episode_intro.wav](file:///C:/dev/CGMusicalComposition/next_episode_intro.wav) | [next_episode_intro.mid](file:///C:/dev/CGMusicalComposition/next_episode_intro.mid) |
| **B-Flat Concert Scale Test**<br>*Unison tuning, octaves, and harmonic balance test* | $B\flat$ Major | 100 BPM | [bflat_scale_test.pdf](file:///C:/dev/CGMusicalComposition/bflat_scale_test.pdf) | [bflat_scale_test.wav](file:///C:/dev/CGMusicalComposition/bflat_scale_test.wav) | [bflat_scale_test.mid](file:///C:/dev/CGMusicalComposition/bflat_scale_test.mid) |
| **Concert Percussion Test**<br>*Snare rolls (:32), stickings, and bass drum test* | $B\flat$ Major | 120 BPM | [percussion_test.pdf](file:///C:/dev/CGMusicalComposition/percussion_test.pdf) | [percussion_test.wav](file:///C:/dev/CGMusicalComposition/percussion_test.wav) | [percussion_test.mid](file:///C:/dev/CGMusicalComposition/percussion_test.mid) |

---

## 🥁 Highlight: *A Soix Medley* & The 3/4 Solo Toms Overture

The premier composition, **A Soix Medley** (`a_soix_medley.ly`), solves the challenge of uniting diverse musical idioms into an organic concert suite:

```text
[ mm. 1-4 ] Solo Concert Tom-Toms (unaccompanied in 3/4, syncopated 16ths, flams, accents)
    │
[ mm. 5-8 ] Floor Tom & Polyrhythmic Drive + Subterranean Timpani Pedal Accents
    │
[ mm. 9-12] Sharp Full-Ensemble Brass & Woodwind Stabs over Driving Toms Groove -> Fermata Pause
    │
[ mm. 13-20] Theme I: Sovereign Light (4/4 E♭ Major, 96 BPM, Marimba Rolled Chords & Flute/Oboe)
    │
[ mm. 21-28] Theme II: Moonlight Samba (4/4 C minor, 116 BPM, Latin Bossa Triplet Counterpoint)
    │
[ mm. 29-36] Theme III: The Buccaneer's Reel (6/8 D minor, 112 BPM, Swashbuckling Sea Shanty)
    │
[ mm. 37-44] Theme IV: Groovatude (4/4 B♭ Major, 104 BPM, 70s Funk Brass Pocket & Slap Bass)
    │
[ mm. 45-52] Theme V: The Next Episode (4/4 G minor, 95 BPM, David Axelrod Bassline & Woodwind Stabs)
    │
[ mm. 53-62] Theme VI: Sovereign Forge Grand Finale (4/4 B♭ Major, 120 BPM, Triumphal Tutti Climax)
```

---

## 🎺 Concert Band Instrumentation Matrix (The 14 Voices)

All scores are written in concert pitch to ensure 100% audio-engraving alignment:

```text
                          ┌──────────────────────────┐
                          │       PERCUSSION         │
                          │ Timpani · Marimba · Bells│
                          │ Concert Snare & Tom-Toms │
                          │ Latin Percussion Battery │
                          └──────────────────────────┘
                  ┌────────────────────┐      ┌────────────────────┐
                  │       BRASS        │      │    STRINGS/BASS    │
                  │ Trumpet · Horn     │      │ Cello · Upright /  │
                  │ Trombone · Tuba    │      │ Electric Bass      │
                  └────────────────────┘      └────────────────────┘
                                ┌───────────────────┐
                                │    WOODWINDS      │
                                │ Flute · Oboe      │
                                │ Clarinet · Sax    │
                                └───────────────────┘
                                          ▼
                                      CONDUCTOR
```

| Voice | Instrument | Range (Concert Pitch) | Clef | Characteristic Band Role |
| :--- | :--- | :--- | :--- | :--- |
| **1** | **Flute** | $E\flat_4$ to $F_6$ | Treble | Soaring melodies, sparkling 16th flourishes, high octave doubling |
| **2** | **Oboe** | $D_4$ to $E\flat_5$ | Treble | Singing, reedy pastoral cantabile, expressive inner counterpoint |
| **3** | **B♭ Clarinet** | $D_3$ to $G_5$ | Treble | Deep chalumeau warmth into brilliant ringing clarion register |
| **4** | **Alto Saxophone** | $C_4$ to $F_5$ | Treble | Warm jazz/ballad lyricism, punchy syncopated horn section stabs |
| **5** | **B♭ Trumpet** | $B\flat_3$ to $F_5$ | Treble | Heroic ceremonial fanfares, brilliant upper brass projection |
| **6** | **French Horn** | $B\flat_3$ to $F_5$ | Treble | Noble woodland calls, golden core brass warmth, rich countermelodies |
| **7** | **Tenor Trombone** | $E\flat_2$ to $G_4$ | Bass | Majestic slide cantabile, bold bass-tenor brass power |
| **8** | **Tuba** | $B\flat_1$ to $F_3$ | Bass | Deep foundational root bass, bouncy concert march anchor |
| **9** | **Electric Bass** | $E_1$ to $G_3$ | Bass | Tight walking funk lines, syncopated slap accents, acoustic anchor |
| **10** | **Cello** | $C_2$ to $E_4$ | Bass | Rich romantic string warmth, singing tenor countermelodies |
| **11** | **Glockenspiel** | $B\flat_5$ to $D_7$ | Treble | Crystalline metallic high chimes ringing over the full band |
| **12** | **Marimba** | $C_3$ to $G_5$ | Treble | Warm 4-mallet rolled chords, resonant rosewood melodic runs |
| **13** | **Timpani** | $F_2, B\flat_2, C_3, E\flat_3$ | Bass | Thunderous dramatic rolls, tuned subterranean rhythmic punctuation |
| **14** | **Concert Percussion** | Snare, Bass, Cymbals, Toms, Latin Battery | Drum | Dynamic battery drive, military rolls, clave syncopations |

---

## ⚙️ Architecture & Synthesis Pipeline

### 1. Engraving Guard: Absolute Concert Pitch (`\fixed c'`)
LilyPond's `\relative` mode presents an insidious trap: when notes are notated with octave ticks (`c''''`), relative mode treats them as compounding intervals against the *previous note*, launching pitches into dog-whistle registers (50+ ledger lines off the page).  
**The Solution**: Every score in this repository unconditionally enforces **`\fixed c'` (absolute concert pitch)**, eliminating octave drift.

### 2. Acoustic Reverb DSP & Channel Isolation
Raw MIDI synthesis sounds clinical and robotic. All FluidSynth renders apply calibrated acoustic hall spatialization and separate percussion channels:
```bash
fluidsynth.exe -F moonlight_samba_master.wav \
  -o synth.reverb.active=1 \
  -o synth.reverb.room-size=0.45 \
  -o synth.reverb.damp=0.60 \
  -o synth.reverb.width=0.75 \
  -o synth.reverb.level=0.25 \
  -o synth.gain=0.45 \
  path/to/MuseScore_General.sf3 \
  moonlight_samba_score_humanized_panned.mid
```

### 3. Concert Band Seating Panning (`CC 10`)
The build pipeline injects MIDI Control Change 10 (Pan) values to match standard concert band stage positioning:
* Flute / Oboe: Pan 40–50 (Left)
* Clarinet / Saxophone: Pan 45–55 (Center-Left)
* Horns: Pan 45 (Left-Center)
* Trumpets / Trombones: Pan 75–85 (Center-Right)
* Tuba / Bass: Pan 64 (Center Root)
* Percussion / Mallets: Pan 35–90 (Spread rear acoustic stage)

### 4. Gaussian Humanization
Micro-timing jitter ($\pm 6\text{ ms}$) and metric dynamic curves are applied across note events via `humanize.py` to recreate the subtle acoustic breath and physical articulation of living musicians.

### 5. Neural Voice Narration Pipeline (`build_showcase_audio.py`)
To produce the master narrated showcase (`benchmark_instruments_showcase_narrated.wav`), our automated build script:
1. Compiles each instrument's 4-measure solo with LilyPond.
2. Renders each solo to uncompressed PCM audio via FluidSynth.
3. Synthesizes clear neural speech labels using the **Kokoro ONNX** engine with native GPU Mel filterbank acceleration.
4. Concatenates speech labels and instrument solos with natural reverberant room decay and peak normalizes to $-0.3\text{ dBFS}$.

---

## 🛠 Compilation & Reproduction Guide

### Toolchain Requirements
* **LilyPond** (v2.24.4+): `https://lilypond.org/`
* **FluidSynth** (v2.4.3+): `https://www.fluidsynth.org/`
* **SoundFont**: `MuseScore_General.sf3` (or any General MIDI compatible SF2/SF3 soundbank)
* **Python** (v3.10+): With `soundfile`, `numpy`, and `mido` installed

### Build & Render Complete Score Suite
```bash
# Render Moonlight Samba score, parts, and audio master
python build.py --score moonlight_samba

# Engrave a standalone LilyPond score to PDF + MIDI
lilypond Scores/moonlight_samba_score.ly
```

### Recompile the Complete Narrated Showcase Suite
```bash
python build_showcase_audio.py
```

---

## 📜 Intellectual Property & Licensing

* **Software, Build Scripts & Tooling**: [MIT License](./LICENSE) — Free for open-source modification and reuse.
* **Original Musical Compositions & Arrangements**: [Creative Commons Attribution 4.0 International (CC BY 4.0)](./LICENSE) — School, community, and professional concert bands are freely licensed to perform, record, distribute, and adapt these pieces with attribution to **John Daniel Dondlinger** and the **Wisconsin Rapids City Band**.
* **Third-Party Arrangement Notice**: *"The Next Episode (Intro)"* is an educational, non-commercial concert band adaptation of David McCallum & David Axelrod's *"The Edge"*. All underlying rights remain with original copyright holders.

---

## 🏷 Search Topics & Keywords
`#concert-band` `#lilypond` `#fluidsynth` `#sheet-music` `#audio-synthesis` `#wind-ensemble` `#brass-band` `#percussion-solo` `#toms-solo` `#marimba` `#midi` `#wisconsin-rapids-city-band` `#john-daniel-dondlinger` `#beethoven` `#bossa-nova`
