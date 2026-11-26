#!/usr/bin/env python3
"""Exact one-runner extension check for the published 57-runner seed."""

from fractions import Fraction
from hashlib import sha256
import json
from math import lcm
from pathlib import Path

from verify import dist

CERTIFICATES = Path(__file__).with_name("certificates.json")
SEED_SHA256 = "c13ff152619c2dfeca4aef794c2ee9e677db8850897072485dd7cffef8790bdd"
RADIUS = Fraction(1359451, 79000000)
SPEED = 528344
PHASE_START = Fraction(4737613, 31600000)
PHASE_WIDTH = Fraction(178783, 158000000)
WITNESS_TIME = Fraction(38586773, 79000000)
TARGET = Fraction(1, 59)
STABILITY = Fraction(1207609, 4661000000)


def require(condition, message):
    if not condition:
        raise ValueError(message)


def load_seed():
    records = json.loads(CERTIFICATES.read_text())
    rows = [row for row in records if row["n"] == 57]
    require(len(rows) == 1, "Expected exactly one 57-runner record")
    row = rows[0]
    encoded = json.dumps(row, sort_keys=True, separators=(",", ":")).encode("ascii")
    require(sha256(encoded).hexdigest() == SEED_SHA256, "The published 57-runner seed has changed")
    tracks = list(zip(row["speeds"], (Fraction(n, row["shift_den"]) for n in row["shift_num"]),
                      strict=True))
    require(len({v for v, _ in tracks}) == len(tracks) == 57, "The seed speeds must be distinct")
    require(all(v > 0 and 0 <= s < 1 for v, s in tracks), "Invalid seed speed or shift")
    return tracks, Fraction(row["gamma"])


def closed_gaps(tracks, radius):
    """Return closures of the gaps in the union of the closed seed arcs."""
    arcs = []
    for speed, phase in tracks:
        # On [0, 1] the runner's phase lift lies between 0 and speed + 1.
        for winding in range(speed + 2):
            left = (winding - phase - radius) / speed
            right = (winding - phase + radius) / speed
            if 0 <= right and left <= 1:
                arcs.append((max(Fraction(0), left), min(Fraction(1), right)))

    gaps = []
    reach = Fraction(0)
    for left, right in sorted(arcs):
        if reach < left:
            gaps.append((reach, left))
        reach = max(reach, right)
    if reach < 1:
        gaps.append((reach, Fraction(1)))
    return gaps


def feasible_extensions(gaps, used_speeds, radius):
    """Find every feasible speed and its closed phase interval modulo one."""
    require(0 < radius < Fraction(1, 8), "Phase windows require radius between 0 and 1/8")
    gaps = sorted(gaps, key=lambda gap: gap[1] - gap[0], reverse=True)
    anchor = gaps[0][0]
    scale = lcm(radius.denominator, *(x.denominator for gap in gaps for x in gap))
    # Every scaled radius and gap endpoint is an integer.
    diameter = int(2 * radius * scale)
    windows = [(int((anchor - a) * scale), int((b - a) * scale)) for a, b in gaps]
    longest = windows[0][1]
    speed_limit = diameter // longest
    feasible = []
    for speed in range(1, speed_limit + 1):
        if speed in used_speeds:
            continue
        low, high = 0, diameter - speed * longest
        for offset, length in windows[1:]:
            start = (speed * offset) % scale
            if 2 * start > scale:
                start -= scale
            low = max(low, start)
            high = min(high, start + diameter - speed * length)
            if low > high:
                break
        if low <= high:
            phase = (Fraction(low, scale) - speed * anchor - radius) % 1
            feasible.append((speed, phase, Fraction(high - low, scale)))
    return speed_limit, feasible


def verify():
    tracks, seed_radius = load_seed()
    gaps = closed_gaps(tracks, RADIUS)
    require(len(gaps) == 11, "Expected eleven gaps")
    longest = max(b - a for a, b in gaps)
    require(longest == Fraction(53, 1264000000), "Longest gap changed")
    limit, feasible = feasible_extensions(gaps, {v for v, _ in tracks}, RADIUS)
    require(limit == 820800, "Unexpected speed bound")
    require(feasible == [(SPEED, PHASE_START, PHASE_WIDTH)], f"Unexpected weak covers: {feasible}")

    # Cross-check the claimed cover directly at the extreme time/phase corners.
    for a, b in gaps:
        left = SPEED * a + PHASE_START
        right = SPEED * b + PHASE_START + PHASE_WIDTH
        winding = round((left + right) / 2)
        require(-RADIUS <= left - winding <= right - winding <= RADIUS,
                f"Uncovered time gap {a} to {b}")

    # A seed time at equality rules out strict improvement for every weak cover.
    seed_distances = {v: dist(v * WITNESS_TIME + s) for v, s in tracks}
    require(min(seed_distances.values()) == seed_distances[44] == seed_distances[114] == RADIUS,
            "The seed does not attain the proposed radius at the witness time")
    extra_distance = dist(SPEED * WITNESS_TIME + PHASE_START)
    require(extra_distance == Fraction(66324111, 158000000)
            and extra_distance - PHASE_WIDTH > RADIUS,
            "Some weak covers may improve on the proposed radius")
    require(RADIUS - TARGET == STABILITY and STABILITY > 0, "Unexpected stability margin")
    require(seed_radius - RADIUS == Fraction(63, 395000000), "Unexpected improvement")

    return {
        "radius": str(RADIUS),
        "seed_radius": str(seed_radius),
        "seed_gaps_at_radius": len(gaps),
        "longest_gap": str(longest),
        "speed_limit_at_radius": limit,
        "optimal_speed": SPEED,
        "optimal_phase_start": str(PHASE_START),
        "optimal_phase_width": str(PHASE_WIDTH),
        "attainment_time": str(WITNESS_TIME),
        "phase_perturbation_barrier": str(STABILITY),
        "seed_sha256": SEED_SHA256,
    }


if __name__ == "__main__":
    print(json.dumps(verify(), indent=2))
