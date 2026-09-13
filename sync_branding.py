import shutil
import os
from PIL import Image

BRAIN = r"C:\Users\John\.gemini\antigravity\brain\bde80231-c8ac-40b1-a472-8c324a5a6207"
DIST = r"C:\dev\CGMusicalComposition\dist"
ROOT = r"C:\dev\CGMusicalComposition"

hero_src = os.path.join(BRAIN, "cg_banner_hero_1789304173504.jpg")
icon_src = os.path.join(BRAIN, "cg_app_icon_1789304157456.jpg")

# 1. Convert hero to og-banner.png in both dist and root
hero_img = Image.open(hero_src)
hero_img.save(os.path.join(DIST, "og-banner.png"), "PNG")
hero_img.save(os.path.join(ROOT, "og-banner.png"), "PNG")
print("Saved og-banner.png to dist and root.")

# 2. Convert app icon to app-icon.png in both dist and root
icon_img = Image.open(icon_src)
icon_img.save(os.path.join(DIST, "app-icon.png"), "PNG")
icon_img.save(os.path.join(ROOT, "app-icon.png"), "PNG")
# Also save favicon sizes
icon_img.resize((192, 192), Image.Resampling.LANCZOS).save(os.path.join(DIST, "icon-192.png"), "PNG")
icon_img.resize((512, 512), Image.Resampling.LANCZOS).save(os.path.join(DIST, "icon-512.png"), "PNG")
icon_img.resize((64, 64), Image.Resampling.LANCZOS).save(os.path.join(DIST, "favicon.png"), "PNG")
print("Saved icons to dist and root.")
