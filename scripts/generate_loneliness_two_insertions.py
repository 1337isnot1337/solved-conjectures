#!/usr/bin/env python3
"""Produce rational certificates for the exact small interval cases.

The producer is not a proof premise. Lean checks every stored interval,
cutoff, witness, and coverage index before extending to unbounded speeds.
"""

from fractions import Fraction
import importlib.util
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "results/lonely-runner-two-insertions/two_additions.py"
SPEC = importlib.util.spec_from_file_location("two_insertions_reference", SOURCE)
REFERENCE = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(REFERENCE)


def rational(value):
    value = Fraction(value)
    if value.denominator == 1:
        return str(value.numerator)
    return f"({value.numerator}/{value.denominator})"


def floor(value):
    return value.numerator // value.denominator


def produce(p):
    q = p + 2
    bound = 2*p*q // (p-2)
    window = [(Fraction(1, q), Fraction(1, p))]
    rows = []
    count = 0
    for b in range(1, bound+1):
        free = REFERENCE.intersect(window, REFERENCE.good((b,), q))
        left, right = max(free, key=lambda interval: interval[1]-interval[0])
        width = right-left
        assert width > 0
        cutoff = (2/(q*width)).__ceil__()
        first_shift = floor(b*left)
        assert Fraction(1, q) <= b*left-first_shift
        assert b*right-first_shift <= 1-Fraction(1, q)
        assert 2 <= q*cutoff*width
        witnesses = []
        for c in range(b, cutoff):
            intersection = REFERENCE.intersect(free, REFERENCE.good((c,), q))
            assert intersection
            time = intersection[0][0]
            shifts = [floor(v*time) for v in (b, c)]
            assert all(Fraction(1, q) <= v*time-k <= 1-Fraction(1, q)
                       for v, k in zip((b, c), shifts))
            witnesses.append(f"⟨{rational(time)}, {shifts[0]}, {shifts[1]}⟩")
        count += len(witnesses)
        interval = f"⟨{rational(left)}, {rational(right)}, {first_shift}, {cutoff}⟩"
        rows.append(f"  ⟨{interval}, [{', '.join(witnesses)}]⟩")
    body = ",\n".join(rows)
    source = f'''import Conjectures.LonelinessTwoInsertionsRows

namespace Loneliness.TwoInsertions.Small{p}

set_option maxRecDepth 32768
set_option maxHeartbeats 0

def rows : List BaseRow := [
{body}]

theorem size_checked : rows.length = smallBound {p} := by decide +kernel

theorem rows_checked : ∀ i : Fin rows.length,
    (rows.get i).Valid {p} (i.val+1) := by decide +kernel

theorem bounded_first (b c : ℕ) (hb : 1 ≤ b)
    (hbound : b ≤ smallBound {p}) (hbc : b ≤ c) : TwoSpeedWindow {p} b c :=
  checked_rows_sound {p} rows (by decide) size_checked rows_checked b c hb hbound hbc

end Loneliness.TwoInsertions.Small{p}
'''
    path = ROOT / f"lean/Conjectures/LonelinessTwoInsertionsSmall{p}.lean"
    path.write_text(source)
    return len(rows), count


def main():
    counts = [produce(p) for p in range(3, 11)]
    assert sum(rows for rows, _ in counts) == 210
    assert sum(pairs for _, pairs in counts) == 643
    print("Produced 210 interval rows and 643 exact pair witnesses")


if __name__ == "__main__":
    main()
