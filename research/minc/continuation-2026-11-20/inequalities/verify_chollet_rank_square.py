"""Exact certificate for the auxiliary rank-square spectral envelope.

This is NOT a proof of unrestricted Chollet. The mathematical reductions,
including the monomial tilt and the analytic rank tail, are in the checkpoint.
The finite certificate covers every real top eigenvalue at the listed ranks;
it does not sample correlation matrices or numerical instances.
"""
from fractions import Fraction as F
from functools import lru_cache
from math import comb
from pathlib import Path
import json
import sys

HERE = Path(__file__).resolve().parent
CERT = HERE / "chollet_rank_square_certificate.json"
TERMS = 24


@lru_cache(maxsize=None)
def harmonic(k):
    return sum((F(1, j) for j in range(1, k + 1)), F(0))


def small_log(y):
    assert 1 <= y <= 2
    z = (y - 1) / (y + 1)
    z2 = z * z
    power, total = z, F(0)
    for j in range(TERMS):
        total += 2 * power / (2 * j + 1)
        power *= z2
    tail = 2 * power / ((2 * TERMS + 1) * (1 - z2))
    return total, total + tail


LN2 = small_log(F(2))


@lru_cache(maxsize=None)
def log_bounds(x):
    x = F(x)
    assert x > 0
    k = x.numerator.bit_length() - x.denominator.bit_length()
    scale = F(2**k) if k >= 0 else F(1, 2**(-k))
    y = x / scale
    if y < 1:
        k -= 1
        y *= 2
    if y >= 2:
        k += 1
        y /= 2
    lo, hi = small_log(y)
    if k >= 0:
        return lo + k * LN2[0], hi + k * LN2[1]
    return lo + k * LN2[1], hi + k * LN2[0]


@lru_cache(maxsize=None)
def log_rising_lower(r, n):
    """Robbins bounds for log Gamma(n+r)-log Gamma(r)."""
    t = n + r
    return ((F(t) - F(1, 2)) * log_bounds(F(t))[0]
            - (F(r) - F(1, 2)) * log_bounds(F(r))[1]
            - n + F(1, 12 * t + 1) - F(1, 12 * r))


@lru_cache(maxsize=None)
def tilt_base_lower(r, d):
    n = r * r
    C = comb(r + d - 1, d)
    return (log_rising_lower(r, n) - log_bounds(F(C))[1]
            - d * harmonic(d) - (n - d) * harmonic(r + d - 1))


def gap_lower(r, left, right, d):
    n = r * r
    lower_p = tilt_base_lower(r, d) + left * harmonic(d)
    # h(x)=x exp(-1+(1+log x)/x) is an upper bound on b(x).
    lu = log_bounds(right)[1]
    upper_log_h = lu - 1 + (1 + lu) / right
    return 2 * lower_p / n - upper_log_h


def choose_d(r, left):
    return max(range(r + 1),
               key=lambda d: float(tilt_base_lower(r, d) + left * harmonic(d)))


def generate():
    rows = []
    for r in range(5, 64):
        stack = [(F(r), F(r * r), 0)]
        leaves = []
        while stack:
            left, right, depth = stack.pop()
            d = choose_d(r, left)
            gap = gap_lower(r, left, right, d)
            if gap > 0:
                leaves.append({"left": str(left), "right": str(right), "d": d})
                continue
            if depth >= 24:
                raise ArithmeticError((r, str(left), str(right), float(gap), d))
            middle = (left + right) / 2
            stack.append((middle, right, depth + 1))
            stack.append((left, middle, depth + 1))
        leaves.sort(key=lambda box: F(box["left"]))
        rows.append({"rank": r, "order": r * r, "intervals": leaves})
        print(f"rank {r}: {len(leaves)} closed intervals", flush=True)
    CERT.write_text(json.dumps({"version": 1, "ranks": rows}, indent=2) + "\n")


def verify_tail_constants():
    # H_m-log(m+1) < gamma < H_m-log(m+1/2).
    assert harmonic(100) - log_bounds(F(101))[1] > F(57, 100)
    assert harmonic(100) - log_bounds(F(201, 2))[0] < F(58, 100)
    assert log_bounds(F(31, 2))[0] > F(137, 50)
    assert log_bounds(F(331, 50))[0] > F(189, 100)
    assert log_bounds(F(5, 4))[1] < F(28, 125)
    assert log_bounds(F(64))[1] < F(104, 25)
    lower = F(189, 100) - 2 * F(28, 125) - 2 * F(58, 100) - (F(3, 2) + F(104, 25)) / 64
    assert lower > F(19, 100)


def verify():
    data = json.loads(CERT.read_text())
    assert data["version"] == 1
    assert [row["rank"] for row in data["ranks"]] == list(range(5, 64))
    total, worst = 0, None
    for row in data["ranks"]:
        r = row["rank"]
        assert row["order"] == r * r
        endpoint = F(r)
        for box in row["intervals"]:
            left, right = F(box["left"]), F(box["right"])
            d = box["d"]
            assert isinstance(d, int) and d >= 0
            assert left == endpoint and left < right
            assert right <= r * r
            gap = gap_lower(r, left, right, d)
            assert gap > 0, (r, left, right, d)
            worst = gap if worst is None else min(worst, gap)
            endpoint = right
            total += 1
        assert endpoint == r * r
    verify_tail_constants()
    print(f"Verified {total} closed intervals covering all ranks 5..63 at n=r^2.")
    print(f"Smallest certified interval gap exceeds {float(worst):.9g} (display only).")
    print("Verified rational constants in the analytic tail for every rank >=64.")
    print("Unrestricted Chollet still requires the unproved face-reduction bridge.")


if __name__ == "__main__":
    if "--generate" in sys.argv:
        generate()
    verify()
