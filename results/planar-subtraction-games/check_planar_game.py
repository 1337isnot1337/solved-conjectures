#!/usr/bin/env python3
"""Check the 15-move game's residue arithmetic and compare legal play to Pascal parity."""

from math import comb


HORIZONTAL = (6, 7, 8, 12, 20, 28, 29, 33, 38, 41, 49, 57, 63)
MOVES = tuple((length, 0) for length in HORIZONTAL) + ((33, 1), (62, 1))
MODULUS = 69
LOSING_RESIDUES = {0, 1, 2, 3, 4, 5, 18}
# Each triple records horizontal displacement, vertical displacement, and destination residue.
SPECIAL_OPTIONS = {
    19: {(33, 0, 55), (33, 1, 55)},
    27: {(8, 0, 19), (41, 0, 55)},
    48: {(29, 0, 19), (62, 1, 55)},
    55: {(28, 0, 27), (7, 0, 48)},
}


def check_residues():
    special = LOSING_RESIDUES | SPECIAL_OPTIONS.keys()
    winning = set(range(MODULUS)) - special
    first_block_wins = {r + length for r in LOSING_RESIDUES for length in HORIZONTAL
                        if r + length < MODULUS}
    assert first_block_wins == winning
    for residue in sorted(special):
        actual = {(dx, dy, (residue - dx) % MODULUS) for dx, dy in MOVES
                  if (residue - dx) % MODULUS in special}
        assert actual == SPECIAL_OPTIONS.get(residue, set()), (residue, actual)
    print(f'All {MODULUS} residues passed: {len(LOSING_RESIDUES)} losing, '
          f'{len(winning)} winning, and {len(SPECIAL_OPTIONS)} table rows.')


def check_board(blocks=72, heights=80):
    width = MODULUS * blocks
    # A move decreases x even when it also changes the row.
    wins = [bytearray(heights) for _ in range(width)]
    for x in range(width):
        for y in range(heights):
            wins[x][y] = any(not wins[x - dx][y - dy] for dx, dy in MOVES
                             if dx <= x and dy <= y)
    for n in range(blocks):
        for y in range(heights):
            assert wins[MODULUS * n + 55][y] == comb(n, y + 1) % 2, (n, y)
    ray_points = 0
    for i in range(heights):
        x = 138 * i + 124
        if x >= width:
            break
        assert wins[x][i] == ((i & (i + 1)) == 0), i
        ray_points += 1
    print(f'Direct play on {width * heights:,} positions matched all {blocks * heights:,} '
          f'binomial outputs and {ray_points} ray points.')


if __name__ == '__main__':
    check_residues()
    check_board()
