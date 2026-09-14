import os
import sys
import time
import mido

# Test fast binary midi generation
def encode_vlq(delta: int) -> bytes:
    if delta < 128:
        return bytes([delta])
    buf = bytearray()
    buf.append(delta & 0x7F)
    delta >>= 7
    while delta > 0:
        buf.append((delta & 0x7F) | 0x80)
        delta >>= 7
    buf.reverse()
    return bytes(buf)

class FastMidiTrack:
    def __init__(self, name: str):
        self.name = name
        self.buf = bytearray()
        self.last_tick = 0
        
        # Add track name meta event at time 0
        name_bytes = name.encode('latin-1')
        self.buf.extend(b'\x00\xFF\x03' + bytes([len(name_bytes)]) + name_bytes)

    def add_event(self, tick: int, event_bytes: bytes):
        delta = max(0, tick - self.last_tick)
        self.buf.extend(encode_vlq(delta))
        self.buf.extend(event_bytes)
        self.last_tick = tick

    def finish(self) -> bytes:
        # Add End of Track event
        self.buf.extend(b'\x00\xFF\x2F\x00')
        trk_len = len(self.buf)
        return b'MTrk' + trk_len.to_bytes(4, 'big') + self.buf

def create_fast_midi(tracks: list, division: int = 480) -> bytes:
    num_tracks = len(tracks)
    header = b'MThd\x00\x00\x00\x06\x00\x01' + num_tracks.to_bytes(2, 'big') + division.to_bytes(2, 'big')
    return header + b''.join(t.finish() for t in tracks)

print("FastMidi engine initialized successfully.")
