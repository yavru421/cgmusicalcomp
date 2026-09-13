import os
from PIL import Image, ImageDraw, ImageFont

WIDTH = 1200
HEIGHT = 630

# High-contrast, publication-grade dark background
img = Image.new("RGBA", (WIDTH, HEIGHT), (14, 17, 23, 255))
draw = ImageDraw.Draw(img)

# Outer decorative metallic gold & slate borders
draw.rectangle([14, 14, WIDTH - 15, HEIGHT - 15], outline=(48, 54, 61, 255), width=3)
draw.rectangle([22, 22, WIDTH - 23, HEIGHT - 23], outline=(210, 153, 34, 255), width=2)

# Load clean Windows system fonts
font_header = ImageFont.truetype("arialbd.ttf", 46)
font_subtitle = ImageFont.truetype("arialbd.ttf", 26)
font_badge = ImageFont.truetype("arialbd.ttf", 15)
font_body = ImageFont.truetype("arial.ttf", 19)
font_body_bold = ImageFont.truetype("arialbd.ttf", 19)
font_footer = ImageFont.truetype("arial.ttf", 15)

# Badges at the top
draw.text((60, 50), "WISCONSIN RAPIDS CITY BAND (150+ YEAR HERITAGE)", fill=(210, 153, 34, 255), font=font_badge)
draw.text((60, 78), "GNU LILYPOND 2.24.4   |   FLUIDSYNTH ACOUSTIC HALL   |   TABLOID 11x17 CONDUCTOR GEOMETRY", fill=(139, 148, 158, 255), font=font_badge)

# Main Titles
draw.text((60, 130), "CGMusicalComposition", fill=(240, 246, 252, 255), font=font_header)
draw.text((60, 195), "Algorithmic Concert Band Engine & Score Engraver", fill=(88, 166, 255, 255), font=font_subtitle)

# Feature bullet points
features = [
    ("Spotlight:", " Beethoven's Moonlight Samba (Op. 27 No. 2 Recast in Latin Bossa Nova)"),
    ("Score Architecture:", " Tabloid 11x17 Landscape Master Podium Layout & 14-to-16 Voice Wind Band"),
    ("Musician Parts:", " 19 Single-Source Print-Ready PDFs (Transposed with Multi-Measure Rest Blocks)"),
    ("Spatial Acoustic DSP:", " FluidSynth Concert Hall Synthesis + Seating Pan Curves (CC 10) & Timing Jitter"),
    ("Interactive Web Jukebox:", " Full PWA Audio Streaming & Vector PDF Score Viewer at cgmusicalcomp.dondlingergc.com")
]

y_pos = 265
for label, desc in features:
    # Bullet dot
    draw.ellipse([60, y_pos + 6, 68, y_pos + 14], fill=(210, 153, 34, 255))
    draw.text((80, y_pos), label, fill=(240, 246, 252, 255), font=font_body_bold)
    label_width = int(draw.textlength(label, font=font_body_bold))
    draw.text((80 + label_width, y_pos), desc, fill=(201, 209, 217, 255), font=font_body)
    y_pos += 48

# Footer attribution and licensing
draw.line([(60, 535), (WIDTH - 60, 535)], fill=(48, 54, 61, 255), width=1)
draw.text((60, 555), "Composed, Arranged & Orchestrated by John Daniel Dondlinger   |   Creative Commons Attribution 4.0 (CC BY 4.0) & MIT", fill=(139, 148, 158, 255), font=font_footer)
draw.text((60, 580), "Repository: github.com/yavru421/cgmusicalcomp   |   Wisconsin Rapids, WI", fill=(139, 148, 158, 255), font=font_footer)

dist_path = r"C:\dev\CGMusicalComposition\dist\og-banner.png"
root_path = r"C:\dev\CGMusicalComposition\og-banner.png"

img.convert("RGB").save(dist_path, "PNG")
img.convert("RGB").save(root_path, "PNG")
print("Social OpenGraph banner successfully generated with TrueType fonts.")
