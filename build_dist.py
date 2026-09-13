import os
import zipfile
import subprocess
import shutil

ROOT = r"C:\dev\CGMusicalComposition"
DIST = os.path.join(ROOT, "dist")
SCORES_DIR = os.path.join(ROOT, "Scores")
PARTS_DIR = os.path.join(ROOT, "Parts")
AUDIO_DIR = os.path.join(DIST, "audio")
PDF_DIR = os.path.join(DIST, "scores")
PARTS_DIST_DIR = os.path.join(DIST, "parts")
RELEASES_DIR = os.path.join(DIST, "releases")

os.makedirs(AUDIO_DIR, exist_ok=True)
os.makedirs(PDF_DIR, exist_ok=True)
os.makedirs(PARTS_DIST_DIR, exist_ok=True)
os.makedirs(RELEASES_DIR, exist_ok=True)

print("[1/5] Building release ZIP bundles...")
# 1. Zip Moonlight Samba Full Conductor Score & Parts
moonlight_zip = os.path.join(RELEASES_DIR, "Moonlight_Samba_v1.0.0_ConcertBand_Score_and_Parts.zip")
with zipfile.ZipFile(moonlight_zip, 'w', zipfile.ZIP_DEFLATED) as zf:
    score_pdf = os.path.join(SCORES_DIR, "moonlight_samba_score.pdf")
    if os.path.exists(score_pdf):
        zf.write(score_pdf, arcname="Moonlight_Samba_Conductor_Score_Tabloid.pdf")
    for f in os.listdir(PARTS_DIR):
        if f.startswith("moonlight_samba_part_") and f.endswith(".pdf"):
            zf.write(os.path.join(PARTS_DIR, f), arcname=f"Parts/{f}")
    zf.write(os.path.join(ROOT, "README.md"), arcname="README.md")
    zf.write(os.path.join(ROOT, "LICENSE"), arcname="LICENSE")
print(f"Created {moonlight_zip}")

# 2. Copy PDFs to dist
print("[2/5] Copying PDFs to web dist...")
shutil.copy2(os.path.join(SCORES_DIR, "moonlight_samba_score.pdf"), os.path.join(PDF_DIR, "moonlight_samba_score.pdf"))
if os.path.exists(os.path.join(SCORES_DIR, "still_dre_score.pdf")):
    shutil.copy2(os.path.join(SCORES_DIR, "still_dre_score.pdf"), os.path.join(PDF_DIR, "still_dre_score.pdf"))
if os.path.exists(os.path.join(SCORES_DIR, "sovereign_forge_score.pdf")):
    shutil.copy2(os.path.join(SCORES_DIR, "sovereign_forge_score.pdf"), os.path.join(PDF_DIR, "sovereign_forge_score.pdf"))

# Copy all Moonlight Samba parts to parts dist
for f in os.listdir(PARTS_DIR):
    if f.endswith(".pdf"):
        shutil.copy2(os.path.join(PARTS_DIR, f), os.path.join(PARTS_DIST_DIR, f))

# 3. Audio conversion / compression for lightweight web streaming
print("[3/5] Processing web audio streaming masters...")
tracks = [
    ("moonlight_samba_master.wav", "moonlight_samba.mp3"),
    ("still_dre_master.wav", "still_dre.mp3"),
    ("sovereign_forge.wav", "sovereign_forge.mp3"),
    ("a_soix_medley.wav", "a_soix_medley.mp3"),
    ("benchmark_instruments_showcase_narrated.wav", "showcase_narrated.mp3"),
    ("pirate_caribbean_groove.wav", "pirate_caribbean.mp3"),
    ("groovatude.wav", "groovatude.mp3")
]

for src_wav, dst_mp3 in tracks:
    src_path = os.path.join(ROOT, src_wav)
    dst_path = os.path.join(AUDIO_DIR, dst_mp3)
    if os.path.exists(src_path):
        cmd = ["ffmpeg", "-y", "-i", src_path, "-codec:a", "libmp3lame", "-b:a", "192k", dst_path]
        res = subprocess.run(cmd, capture_output=True, text=True)
        if res.returncode == 0:
            print(f"Compressed: {src_wav} -> {dst_mp3} ({os.path.getsize(dst_path) // 1024} KB)")
        else:
            print(f"Warning converting {src_wav}: {res.stderr[:200]}")
    else:
        print(f"Source audio {src_wav} not found, skipping.")

print("[5/5] Packaging preparation complete.")
