#!/usr/bin/env python3
"""Port Gen 2 (pokegold) front and back Pokemon sprites into this tree.

Gen 2 sprite PNGs are colortype-3 with a 4-entry PLTE whose index order is the
shade order (white, light, dark, black), so converting them to the DMG greyscale
Gen 1 expects is a palette rewrite -- pixel indices are untouched, tRNS dropped.

Fronts keep Gen 2's dimensions (both generations store variable-size square
front pics, 5x5 to 7x7). Backs are Gen 2's native 6x6, which requires the
LoadMonBackPic changes in engine/battle/init_battle.asm.

Usage: tools/port_gen2_sprites.py <path-to-pokegold> [--check]
"""
import os, struct, sys, zlib

GRAYS = bytes([0xff,0xff,0xff, 0xaa,0xaa,0xaa, 0x55,0x55,0x55, 0x00,0x00,0x00])

# Species whose directory name in pokegold differs from our pic filename.
RENAMES = {
    'farfetchd': 'farfetch_d',
    'mr.mime':   'mr__mime',
    'nidoranf':  'nidoran_f',
    'nidoranm':  'nidoran_m',
}

# Gen 1-only pics with no Gen 2 counterpart.
SKIP = {'fossilaerodactyl', 'fossilkabutops'}


def read_chunks(data):
    if data[:8] != b'\x89PNG\r\n\x1a\n':
        raise ValueError("not a PNG")
    i, out = 8, []
    while i < len(data):
        ln, = struct.unpack(">I", data[i:i+4])
        out.append((data[i+4:i+8], data[i+8:i+8+ln]))
        i += 8 + ln + 4
    return out


def write_png(path, chunks):
    parts = [b'\x89PNG\r\n\x1a\n']
    for typ, body in chunks:
        parts += [struct.pack(">I", len(body)), typ + body,
                  struct.pack(">I", zlib.crc32(typ + body) & 0xffffffff)]
    with open(path, 'wb') as f:
        f.write(b''.join(parts))


def convert(src, dst, expect=None):
    """Rewrite src's palette to DMG greys. Returns (width, height) in tiles."""
    chunks = read_chunks(open(src, 'rb').read())
    ihdr = next(b for t, b in chunks if t == b'IHDR')
    w, h, _depth, ctype = struct.unpack(">IIBB", ihdr[:10])
    if ctype != 3:
        raise ValueError(f"{src}: expected indexed PNG, got colortype {ctype}")
    if w % 8 or h % 8:
        raise ValueError(f"{src}: {w}x{h} is not a whole number of tiles")
    if w != h:
        # pkmncompress infers square dimensions from the .2bpp size.
        raise ValueError(f"{src}: {w}x{h} is not square")
    if w > 56:
        raise ValueError(f"{src}: {w}x{h} exceeds the 7x7 tile pic limit")
    if expect and (w, h) != expect:
        raise ValueError(f"{src}: expected {expect[0]}x{expect[1]}, got {w}x{h}")
    plte = next(b for t, b in chunks if t == b'PLTE')
    if len(plte) != 12:
        raise ValueError(f"{src}: expected a 4-colour palette, got {len(plte)//3}")
    out = [(t, GRAYS if t == b'PLTE' else b) for t, b in chunks if t != b'tRNS']
    if dst:
        write_png(dst, out)
    return w // 8, h // 8


def main():
    if len(sys.argv) < 2:
        sys.exit(__doc__)
    gold = sys.argv[1]
    check_only = '--check' in sys.argv
    here = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    front_dir = os.path.join(here, 'gfx', 'pokemon', 'front')
    back_dir = os.path.join(here, 'gfx', 'pokemon', 'back')

    names = sorted(f[:-4] for f in os.listdir(front_dir) if f.endswith('.png'))
    dims, errors, done = {}, [], 0
    for name in names:
        if name in SKIP:
            continue
        src_dir = os.path.join(gold, 'gfx', 'pokemon', RENAMES.get(name, name))
        if not os.path.isdir(src_dir):
            errors.append(f"{name}: no such directory {src_dir}")
            continue
        try:
            fw, fh = convert(os.path.join(src_dir, 'front_gold.png'),
                             None if check_only else os.path.join(front_dir, name + '.png'))
            convert(os.path.join(src_dir, 'back.png'),
                    None if check_only else os.path.join(back_dir, name + 'b.png'),
                    expect=(48, 48))
        except (ValueError, FileNotFoundError) as e:
            errors.append(str(e))
            continue
        dims[f"{fw}x{fh}"] = dims.get(f"{fw}x{fh}", 0) + 1
        done += 1

    print(f"{'checked' if check_only else 'ported'} {done} species")
    print("front pic dimensions:", ", ".join(f"{k}: {v}" for k, v in sorted(dims.items())))
    print(f"back pic dimensions: 6x6 (all {done})")
    if errors:
        print(f"\n{len(errors)} problem(s):")
        for e in errors:
            print("  " + e)
        sys.exit(1)


if __name__ == '__main__':
    main()
