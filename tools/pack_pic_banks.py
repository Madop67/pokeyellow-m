#!/usr/bin/env python3
"""Work out how the Pokemon pics partition across ROM banks.

UncompressMonSprite (home/pics.asm) picks a pic bank by comparing the species'
internal index against a few thresholds, so each bank must hold a *contiguous*
run of species in internal-index order -- the order gfx/pics.asm lists them in.
This computes a greedy partition of that ordered list into banks and reports the
thresholds it implies, so home/pics.asm and gfx/pics.asm can be kept in sync.

Usage: tools/pack_pic_banks.py [--banks N]
"""
import os, re, sys

BANK_SIZE = 0x4000

# Pics that aren't a species' front/back pair. The fossil pics' internal indices
# ($B6, $B7) sit above the last bank's threshold, so they must live in the last
# bank for UncompressMonSprite's comparisons to route to them.
SPECIALS = ('FossilKabutopsPic', 'FossilAerodactylPic')

# The pics won't quite fit in six banks with the Ghost pic among them, so it
# lives in its own section and UncompressMonSprite special-cases MON_GHOST.
EXCLUDED = ('GhostPic',)

def load_entries(root):
    """Ordered [(label, [paths]), ...] for the mon pic sections of gfx/pics.asm."""
    text = open(os.path.join(root, 'gfx', 'pics.asm')).read()
    entries, section = [], None
    for line in text.splitlines():
        m = re.match(r'\s*SECTION\s+"([^"]+)"', line)
        if m:
            section = m.group(1)
            continue
        m = re.match(r'\s*(\w+)::\s*INCBIN\s+"([^"]+)"', line)
        if m and section and section.startswith('Pics ') and section != 'Pics 7':
            entries.append((m.group(1), m.group(2)))
    return entries


def group_species(entries):
    """Collapse each species' Front/Back pics into one indivisible unit.

    A species' front and back must share a bank, since UncompressMonSprite picks
    one bank per species for both. Most are listed as adjacent Front/Back pairs,
    but a few (Ponyta/Rapidash) interleave, so accumulate until every species
    named in the run has been closed out.
    """
    groups, cur, pending = [], [], set()
    for label, path in entries:
        cur.append((label, path))
        if label.endswith('PicFront'):
            pending.add(label[:-8])
        elif label.endswith('PicBack'):
            pending.discard(label[:-7])
        if not pending:
            names = [l[:-8] for l, _ in cur if l.endswith('PicFront')] \
                    or [cur[0][0].replace('Pic', '')]
            groups.append(('/'.join(names), [p for _, p in cur],
                           [l for l, _ in cur]))
            cur = []
    if cur:
        raise SystemExit(f"unpaired pics at end: {[l for l, _ in cur]}")
    return groups


def main():
    root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    nbanks = 6
    if '--banks' in sys.argv:
        nbanks = int(sys.argv[sys.argv.index('--banks') + 1])

    groups = group_species(load_entries(root))
    groups = [g for g in groups if not any(l in EXCLUDED for l in g[2])]
    # Route the fossil pics to the last bank by sorting them to the end.
    specials = [g for g in groups if any(l in SPECIALS for l in g[2])]
    groups = [g for g in groups if g not in specials] + specials

    sized = []
    for name, paths, labels in groups:
        total = 0
        for p in paths:
            f = os.path.join(root, p)
            if not os.path.exists(f):
                sys.exit(f"missing {p} -- run `make` or build the pics first")
            total += os.path.getsize(f)
        sized.append((name, total, list(zip(labels, paths))))

    grand = sum(u[1] for u in sized)
    print(f"{len(sized)} pic units, {grand} bytes, {nbanks} banks "
          f"({nbanks * BANK_SIZE} capacity, {nbanks * BANK_SIZE - grand} spare)\n")

    def split(cap):
        """Greedily fill contiguous banks at the given cap. Optimal for feasibility."""
        out, cur, used = [], [], 0
        for unit in sized:
            if used + unit[1] > cap:
                out.append((cur, used))
                cur, used = [], 0
            cur.append(unit)
            used += unit[1]
        if cur:
            out.append((cur, used))
        return out

    # Find the smallest per-bank cap that still fits in nbanks, so the spare
    # space is spread across the banks rather than piling up in the last one.
    lo, hi = max(u[1] for u in sized), BANK_SIZE
    while lo < hi:
        mid = (lo + hi) // 2
        if len(split(mid)) <= nbanks:
            hi = mid
        else:
            lo = mid + 1
    banks = split(lo) if len(split(lo)) <= nbanks else split(BANK_SIZE)

    ok = True
    for i, (items, used) in enumerate(banks, 1):
        flag = "" if used <= BANK_SIZE else "  <-- OVERFLOW"
        if used > BANK_SIZE:
            ok = False
        print(f'Pics {i}: {len(items):3d} units  {used:5d}/{BANK_SIZE} bytes  '
              f'({BANK_SIZE - used:5d} free)  {items[0][0]} .. {items[-1][0]}{flag}')

    if len(banks) > nbanks:
        print(f"\nneeds {len(banks)} banks, only {nbanks} available")
        ok = False

    print("\nbank thresholds for UncompressMonSprite (first species of each bank):")
    for i, (items, _) in enumerate(banks[1:], 2):
        print(f"  Pics {i}: {items[0][0]}")

    if '--write' in sys.argv and ok:
        write_pics_asm(root, banks)
        print(f"\nrewrote gfx/pics.asm ({len(banks)} sections)")

    print("\nfits" if ok else "\nDOES NOT FIT")
    return 0 if ok else 1


def write_pics_asm(root, banks):
    """Rewrite the mon pic sections of gfx/pics.asm, preserving the rest."""
    path = os.path.join(root, 'gfx', 'pics.asm')
    text = open(path).read()
    # Everything from "Trainer Pics" onwards is left alone.
    tail_at = text.index('SECTION "Trainer Pics"')
    width = max(len(l) for items, _ in banks for _, _, incs in items for l, _ in incs) + 3

    out = []
    for i, (items, _) in enumerate(banks, 1):
        out.append(f'SECTION "Pics {i}", ROMX\n\n')
        for _, _, incs in items:
            for label, inc in incs:
                out.append(f'{(label + "::").ljust(width)}INCBIN "{inc}"\n')
        out.append('\n\n')
    open(path, 'w').write(''.join(out) + text[tail_at:])


if __name__ == '__main__':
    sys.exit(main())
