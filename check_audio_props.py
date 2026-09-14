import wave
import os

wav_path = 'city_of_evil_medley_master.wav'
size = os.path.getsize(wav_path)
with wave.open(wav_path, 'rb') as w:
    frames = w.getnframes()
    rate = w.getframerate()
    channels = w.getnchannels()
    duration = frames / float(rate)
    print(f"File: {wav_path}")
    print(f"Size: {size / (1024*1024):.2f} MB")
    print(f"Duration: {duration:.2f} seconds ({duration/60:.2f} minutes)")
    print(f"Sample Rate: {rate} Hz, Channels: {channels}")
