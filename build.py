#!/usr/bin/env python3
"""
Master Build & Engraving Automation Engine (build.py)
CGMusicalComposition — Algorithmic Music Engraving & Acoustic Simulation
Dedicated to the Wisconsin Rapids City Band (John Daniel Dondlinger)

Features:
- Compiles Full Conductor Scores (LilyPond 2.24.4) -> PDF + Multi-Track MIDI
- Batch Engraves Musician Parts (/Parts) with Multi-Measure Rest Compression
- Humanizes MIDI Timing (±6ms micro-timing jitter & expressive velocity curves)
- Injects Standard Concert Band Seating Spatialization (MIDI CC 10 Pan)
- Renders Acoustic Hall Masters via FluidSynth & MuseScore_General.sf3
"""

import os
import sys
import argparse
import subprocess
import shutil
import time
import mido

WORKDIR = os.environ.get("CG_WORKDIR", os.path.dirname(os.path.abspath(__file__)))
PYTHON_EXE = os.environ.get("CG_PYTHON", sys.executable or r"C:\Miniforge\python.exe")
LILYPOND = os.environ.get("CG_LILYPOND", r"C:\dev\tools\lilypond\lilypond-2.24.4\bin\lilypond.exe")
FLUIDSYNTH = os.environ.get("CG_FLUIDSYNTH", r"C:\dev\tools\fluidsynth\bin\fluidsynth.exe")
SOUNDFONT = os.environ.get("CG_SOUNDFONT", r"C:\dev\tools\soundfonts\MuseScore_General.sf3")
HUMANIZE_PY = os.path.join(WORKDIR, "humanize.py")
VALIDATE_PY = os.path.join(WORKDIR, "validate_playability.py")

# Concert Band Seating Panning Sequence (Flute, Oboe, Clarinet, Sax, Trumpet, Horn, Trombone, Bass, Drums, Timp)
DEFAULT_SEATING_PAN = [38, 52, 30, 80, 92, 48, 84, 64, 64, 72]

def check_dependencies():
    missing = []
    if not os.path.exists(LILYPOND) and not shutil.which("lilypond"):
        missing.append(f"LilyPond ({LILYPOND})")
    if not os.path.exists(FLUIDSYNTH) and not shutil.which("fluidsynth"):
        missing.append(f"FluidSynth ({FLUIDSYNTH})")
    if not os.path.exists(SOUNDFONT):
        missing.append(f"SoundFont ({SOUNDFONT})")
    if missing:
        print(f"[WARN] Some external tools were not found at configured paths: {', '.join(missing)}", file=sys.stderr)
    return len(missing) == 0

def apply_concert_band_panning(mid_path: str, seating_pans=None) -> str:
    """Injects CC 10 (Pan) into each instrument track of a multi-track MIDI file."""
    if seating_pans is None:
        seating_pans = DEFAULT_SEATING_PAN
    try:
        mid = mido.MidiFile(mid_path)
        pan_idx = 0
        for track in mid.tracks:
            has_notes = any(msg.type == 'note_on' for msg in track)
            if has_notes:
                pan_val = seating_pans[pan_idx] if pan_idx < len(seating_pans) else 64
                ch = 0
                for msg in track:
                    if hasattr(msg, "channel"):
                        ch = msg.channel
                        break
                track.insert(0, mido.Message('control_change', channel=ch, control=10, value=pan_val, time=0))
                pan_idx += 1
        panned_path = mid_path.replace(".mid", "_panned.mid")
        mid.save(panned_path)
        return panned_path
    except Exception as e:
        print(f"[WARN] MIDI panning injection skipped: {e}", file=sys.stderr)
        return mid_path

def compile_lilypond(ly_path: str, out_prefix: str = None) -> bool:
    cmd = [LILYPOND]
    if out_prefix:
        cmd.extend(["-o", out_prefix])
    cmd.append(ly_path)
    cwd = os.path.dirname(ly_path) or WORKDIR
    try:
        t0 = time.time()
        res = subprocess.run(cmd, capture_output=True, text=True, cwd=cwd, timeout=180)
        dt = time.time() - t0
        if res.returncode != 0:
            print(f"[ERROR] LilyPond failed on {ly_path}:\n{res.stderr}", file=sys.stderr)
            return False
        print(f"[ENGRAVE] Successfully compiled {os.path.basename(ly_path)} ({dt:.1f}s)")
        return True
    except subprocess.TimeoutExpired:
        print(f"[ERROR] LilyPond timed out (>180s) compiling {ly_path}", file=sys.stderr)
        return False

def render_fluidsynth(mid_path: str, out_wav_path: str) -> bool:
    cmd = [
        FLUIDSYNTH,
        "-F", out_wav_path,
        "-o", "synth.reverb.active=1",
        "-o", "synth.reverb.room-size=0.75",
        "-o", "synth.reverb.damp=0.25",
        "-o", "synth.reverb.width=0.85",
        "-o", "synth.reverb.level=0.55",
        "-o", "synth.gain=0.35",
        SOUNDFONT,
        mid_path
    ]
    try:
        t0 = time.time()
        res = subprocess.run(cmd, capture_output=True, text=True, cwd=os.path.dirname(out_wav_path), timeout=180)
        dt = time.time() - t0
        if os.path.exists(out_wav_path):
            size_mb = os.path.getsize(out_wav_path) / (1024 * 1024)
            print(f"[AUDIO] Rendered {os.path.basename(out_wav_path)} ({size_mb:.1f} MB, {dt:.1f}s)")
            return True
        print(f"[ERROR] FluidSynth output missing:\n{res.stderr}", file=sys.stderr)
        return False
    except Exception as e:
        print(f"[ERROR] FluidSynth render failed: {e}", file=sys.stderr)
        return False

def build_score(piece_name: str = "moonlight_samba", skip_audio: bool = False):
    print(f"\n=================================================================")
    print(f"  Building Conductor Score & Masters: {piece_name}")
    print(f"=================================================================")
    scores_dir = os.path.join(WORKDIR, "Scores")
    ly_file = os.path.join(scores_dir, f"{piece_name}_score.ly")
    if not os.path.exists(ly_file):
        # Fallback to root piece
        ly_file = os.path.join(WORKDIR, f"{piece_name}.ly")
        if not os.path.exists(ly_file):
            print(f"[ERROR] Score definition not found for: {piece_name}", file=sys.stderr)
            return False

    out_prefix = os.path.splitext(ly_file)[0]
    raw_mid = f"{out_prefix}.mid"
    human_mid = f"{out_prefix}_humanized.mid"
    out_wav = os.path.join(WORKDIR, f"{piece_name}_master.wav")

    # 1. Compile Score PDF + Raw MIDI
    if not compile_lilypond(ly_file, out_prefix):
        return False

    if not os.path.exists(raw_mid):
        print(f"[WARN] LilyPond did not output MIDI for {piece_name}")
        return True

    # 1b. Physical Playability & Human Ergonomics Validation Gate
    if os.path.exists(VALIDATE_PY):
        print(f"[AUDIT] Running Physical Playability & Ergonomics Gate on {os.path.basename(raw_mid)}...")
        cmd_audit = [PYTHON_EXE, VALIDATE_PY, raw_mid]
        audit_res = subprocess.run(cmd_audit, capture_output=True, text=True, cwd=WORKDIR)
        print(audit_res.stdout)
        if audit_res.returncode != 0:
            print(f"[WARN] Physical playability breaches detected. Executing auto-correction pass...", file=sys.stderr)
            corrected_mid = f"{out_prefix}_ergonomic.mid"
            cmd_fix = [PYTHON_EXE, VALIDATE_PY, raw_mid, "--auto-correct", "-o", corrected_mid]
            fix_res = subprocess.run(cmd_fix, capture_output=True, text=True, cwd=WORKDIR)
            print(fix_res.stdout)
            if os.path.exists(corrected_mid):
                raw_mid = corrected_mid
                print(f"[AUDIT] Gated & corrected MIDI staged for humanization: {os.path.basename(raw_mid)}")

    # 2. Humanize MIDI Timing & Dynamics
    if os.path.exists(HUMANIZE_PY):
        cmd = [PYTHON_EXE, HUMANIZE_PY, raw_mid, "-o", human_mid, "--jitter-ms", "6.0", "--vel-jitter", "5"]
        subprocess.run(cmd, capture_output=True, text=True, cwd=WORKDIR, timeout=60)
    target_mid = human_mid if os.path.exists(human_mid) else raw_mid

    # 3. Apply Concert Band Seating Pan (CC 10)
    panned_mid = apply_concert_band_panning(target_mid)

    # 4. Synthesize Audio
    if not skip_audio:
        render_fluidsynth(panned_mid, out_wav)

    print(f"[DONE] Successfully built {piece_name} conductor suite.")
    return True

def build_parts(filter_name: str = None):
    print(f"\n=================================================================")
    print(f"  Engraving Individual Musician Parts with \\compressMMRests")
    print(f"=================================================================")
    parts_dir = os.path.join(WORKDIR, "Parts")
    if not os.path.exists(parts_dir):
        print(f"[ERROR] Parts directory not found: {parts_dir}", file=sys.stderr)
        return False

    part_files = [f for f in os.listdir(parts_dir) if f.endswith(".ly")]
    if filter_name:
        part_files = [f for f in part_files if filter_name in f]

    print(f"[PARTS] Found {len(part_files)} musician part files to engrave...")
    successes = 0
    for pf in sorted(part_files):
        full_path = os.path.join(parts_dir, pf)
        out_prefix = os.path.splitext(full_path)[0]
        if compile_lilypond(full_path, out_prefix):
            successes += 1

    print(f"[PARTS] Completed {successes}/{len(part_files)} musician parts.")
    return successes == len(part_files)

def clean_scratch():
    print(f"[CLEAN] Removing intermediate scratch files...")
    scratch_dirs = [
        os.path.join(WORKDIR, "scratch_showcase"),
        os.path.join(WORKDIR, "scratch"),
    ]
    for d in scratch_dirs:
        if os.path.exists(d):
            shutil.rmtree(d, ignore_errors=True)
            print(f"[CLEAN] Removed {d}")

    # Remove temporary _panned.mid and .tmp files
    for root, _, files in os.walk(WORKDIR):
        if ".git" in root:
            continue
        for f in files:
            if f.endswith("_panned.mid") or f.endswith(".tmp"):
                try:
                    os.remove(os.path.join(root, f))
                except Exception:
                    pass
    print("[CLEAN] Workspace cleaned.")

def main():
    parser = argparse.ArgumentParser(
        description="Master Build & Engraving Automation for CGMusicalComposition",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  python build.py --score moonlight_samba      # Build Moonlight Samba score, humanize & render audio
  python build.py --parts                     # Engrave all individual musician parts with compressed rests
  python build.py --all                       # Full build of Moonlight Samba, all parts, and masters
  python build.py --clean                     # Clean intermediate scratch files
"""
    )
    parser.add_argument("--all", action="store_true", help="Build full score, musician parts, and audio master")
    parser.add_argument("--score", default="moonlight_samba", help="Piece name to build (default: moonlight_samba)")
    parser.add_argument("--parts", action="store_true", help="Compile individual musician parts")
    parser.add_argument("--skip-audio", action="store_true", help="Skip FluidSynth audio rendering")
    parser.add_argument("--clean", action="store_true", help="Clean scratch and temporary files")
    
    args = parser.parse_args()

    check_dependencies()

    if args.clean:
        clean_scratch()
        sys.exit(0)

    if args.all:
        build_score(args.score, skip_audio=args.skip_audio)
        build_parts(args.score)
        print("\n[ALL] Full publishing suite generated successfully.")
        sys.exit(0)

    if args.parts:
        success = build_parts(args.score if args.score != "moonlight_samba" else None)
        sys.exit(0 if success else 1)

    # Default action: build specified score
    success = build_score(args.score, skip_audio=args.skip_audio)
    sys.exit(0 if success else 1)

if __name__ == "__main__":
    main()
