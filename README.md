# CGMusicalComposition: Algorithmic Concert Band Engine & Score Engraver

<div align="center">
  <img src="./og-banner.png" alt="CGMusicalComposition Hero Banner" width="100%" style="border-radius: 12px; border: 1px solid #272d38; box-shadow: 0 10px 30px rgba(0,0,0,0.5);" />
  <br/><br/>
</div>

[![LilyPond 2.24.4](https://img.shields.io/badge/Engraver-LilyPond_2.24.4-blue.svg?logo=gnu&style=for-the-badge)](https://lilypond.org/)
[![FluidSynth 2.4.3](https://img.shields.io/badge/Synthesizer-FluidSynth_2.4.3-green.svg?style=for-the-badge)](https://www.fluidsynth.org/)
[![Web Jukebox PWA](https://img.shields.io/badge/Live_Jukebox-cgmusicalcomp.dondlingergc.com-cyan.svg?style=for-the-badge)](https://cgmusicalcomp.dondlingergc.com)
[![Audio 44.1kHz Stereo](https://img.shields.io/badge/Audio-44.1kHz_Stereo_Master-orange.svg?style=for-the-badge)](file:///C:/dev/CGMusicalComposition/)
[![13 Conductor Scores](https://img.shields.io/badge/Scores-13_Full_Conductor_Scores-purple.svg?style=for-the-badge)](file:///C:/dev/CGMusicalComposition/)
[![33 Musician Parts](https://img.shields.io/badge/Parts-33_Musician_Parts-blueviolet.svg?style=for-the-badge)](file:///C:/dev/CGMusicalComposition/Parts/)
[![License: MIT & CC BY 4.0](https://img.shields.io/badge/License-MIT_%26_CC_BY_4.0-red.svg?style=for-the-badge)](./LICENSE)
[![City Band](https://img.shields.io/badge/Ensemble-Wisconsin_Rapids_City_Band-gold.svg?style=for-the-badge)](https://www.wirapids.org/)

**Composed, Arranged & Orchestrated by John Daniel Dondlinger**  
*Dedicated to the musicians, directors, and community of the Wisconsin Rapids City Band (Wisconsin Rapids, WI)*

---

## 🏛️ Wisconsin Rapids City Band Historical Context & Heritage

**CGMusicalComposition** (`cgmusicalcomp`) is an end-to-end algorithmic music composition, sheet music engraving, and acoustic simulation engine. Engineered specifically for a **14-to-16-voice Community Concert Band**, the system automates the transition from symbolic notation to publication-grade conductor scores, transposed instrumental parts, and spatialized stereo audio previews.

The repository is built in honor of the **150+ year band tradition in Wisconsin Rapids**:
* **1870s Pinery Logging Era**: Public band music in Wisconsin Rapids dates back to the 1870s lumber boom, when civic brass musicians crossed the Wisconsin River between the twin frontier cities of **Centralia** and **Grand Rapids**.
* **Historic Ensembles**: Includes Frank Bliss's renowned **Bliss Band** (1905–1910) and Emil Lambert's **Twin City / Consolidated Water Power & Paper Co. Band** (1915–1920).
* **Grassroots Community Transition**: In 2006, following municipal funding cuts, dedicated band members formed an independent governing Board of Directors. Supported by the Incourage Community Foundation (formerly Community Foundation of Greater South Wood County), the ensemble earned formal **501(c)(3) nonprofit status** in 2014.
* **Annual Summer Concert Tradition**: Conducted by Keith Olson, performing weekly Wednesday night concerts under the summer canopy at Robinson Park Band Shell, alongside formal seasonal benefit performances at the Performing Arts Center (PAC).

---

## 🚀 Live Distribution & Interactive Score Jukebox

Explore, stream, and inspect the scores and transposed parts online:
* **Live Web Jukebox & Score Viewer**: [cgmusicalcomp.dondlingergc.com](https://cgmusicalcomp.dondlingergc.com)
* **Latest GitHub Release Package (v1.0.0)**: [v1.0.0 Moonlight Samba Tabloid Conductor Score & 19 Transposed Parts Bundle](https://github.com/yavru421/cgmusicalcomp/releases)

---

## 📜 Master Architectural Directives

All AI agents and human contributors must comply with the three core engineering and musical directives governing this repository:

1. **[Human Playability & Ergonomics Directive](./AGENT_PLAYABILITY_DIRECTIVE.md)**: Enforces Grade 3/4 working registers, 16-bar wind breathing limits, embouchure recovery cycles, and timpani kettle tuning constraints.
2. **[Modular Score Architecture Specification](./SCORE_ARCHITECTURE.md)**: Governs strict single-source note definitions (`Notes/`), `\fixed c'` absolute concert pitch architecture, multi-measure rest compression (`\compressMMRests`), and conductor score layouts.
3. **[Audio Synthesis & Spatial DSP Directive](./AGENT_AUDIO_DSP_DIRECTIVE.md)**: Specifies concert band seating panning (CC 10), timing micro-jitter humanization ($\pm 6\text{ ms}$), FluidSynth acoustic hall reverberation DSP, and Kokoro ONNX neural speech narration.

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

## 🎧 Master Repertoire Jukebox & Score Catalog

Every completed piece in this repository is engraved in vector PDF, exported to MIDI, and synthesized into a release-quality stereo master via FluidSynth and acoustic hall reverberation:

| Work Title & Description | Key & Meter | Tempo | 🎼 Sheet Music (PDF) | 🔊 Master Audio (WAV) | 🎹 MIDI Export |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Still D.R.E.**<br>*Concert Band Edition — G-Funk Pocket & Scott Storch Motif* | A minor | 94 BPM | [still_dre_score.pdf](file:///C:/dev/CGMusicalComposition/Scores/still_dre_score.pdf) | [still_dre_master.wav](file:///C:/dev/CGMusicalComposition/still_dre_master.wav) | [still_dre_score.mid](file:///C:/dev/CGMusicalComposition/Scores/still_dre_score.mid) |
| **Moonlight Samba**<br>*Beethoven Op. 27 No. 2 recast in Latin Bossa* | C# minor | 116 BPM | [moonlight_samba_score.pdf](file:///C:/dev/CGMusicalComposition/Scores/moonlight_samba_score.pdf) | [moonlight_samba_master.wav](file:///C:/dev/CGMusicalComposition/moonlight_samba_master.wav) | [moonlight_samba_score.mid](file:///C:/dev/CGMusicalComposition/Scores/moonlight_samba_score.mid) |
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

## 🎺 Concert Band Instrumentation Matrix (The 14-to-16 Voices)

All scores maintain master note files in absolute concert pitch (`\fixed c'`) to ensure 100% audio-engraving alignment:

1. **Flute (C)**: Single-line woodwind lead (`Notes/moonlight_samba_flute.ily`).
2. **Oboe (C)**: Piercing mid-register lyric counter-melody (`Notes/moonlight_samba_oboe.ily`).
3. **B♭ Clarinet I & II**: Octave doubling and montuno arpeggios (`Notes/moonlight_samba_clarinet.ily`).
4. **E♭ Alto Saxophone**: Rich inner harmony and blues-scale riffs (`Notes/moonlight_samba_altosax.ily`).
5. **B♭ Tenor Saxophone**: Smooth tenor counterpoint (`Notes/moonlight_samba_tenorsax.ily`).
6. **B♭ Trumpet I & II**: Antiphonal fanfares and brass hits (`Notes/moonlight_samba_trumpet.ily`).
7. **F French Horn**: Noble horn calls and harmonic pad (`Notes/moonlight_samba_horn.ily`).
8. **Tenor Trombone**: Tenor brass power in concert bass clef (`Notes/moonlight_samba_trombone.ily`).
9. **Euphonium / Baritone B.C.**: Warm melodic counter-lines (`Notes/moonlight_samba_euphonium.ily`).
10. **BB♭ Tuba**: Foundation bass anchor (`Notes/moonlight_samba_tuba.ily`).
11. **Electric Bass**: Slap/groove pocket reinforcement (`Notes/moonlight_samba_bass.ily`).
12. **Glockenspiel & Orchestral Bells**: Top-register bell sparkle (`Notes/moonlight_samba_glockenspiel.ily`).
13. **Marimba / Mallets**: 4-mallet ostinato rolls and warmth (`Notes/moonlight_samba_marimba.ily`).
14. **Timpani**: Pitched kettle punctuation (`Notes/moonlight_samba_timpani.ily`).
15. **Concert Battery (Snare, Bass Drum, Crash/Ride)**: Dynamic march and groove foundation (`Notes/moonlight_samba_percussion1.ily`, `Notes/moonlight_samba_percussion2.ily`).
16. **Latin Percussion Battery (Cabasa, Timbales, Congas)**: Channel-isolated 4-voice authentic Latin groove (`Notes/moonlight_samba_latin_perc1.ily`, `Notes/moonlight_samba_latin_perc2.ily`, `Notes/moonlight_samba_latin_perc3.ily`).

---

## ⚖️ Licensing & Attribution

- **Sheet Music & Engravings**: Creative Commons Attribution 4.0 International ([CC BY 4.0](./LICENSE)). You are free to share, perform, and adapt these scores with attribution to **John Daniel Dondlinger** and the **Wisconsin Rapids City Band**.
- **Algorithmic Software Engine**: Open source under the [MIT License](./LICENSE).
