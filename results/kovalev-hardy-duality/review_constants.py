"""Independent rational arithmetic for the Kovalev counterfamily review.

Only the standard library is used. Analytic inequality directions are checked
in the accompanying review; this file replays all rational substitutions.
"""

from fractions import Fraction as F


def log_bounds(y, terms=10):
    assert isinstance(y, F) and y > 1
    z = (y - 1) / (y + 1)
    partial = 2 * sum(
        (z ** (2 * j + 1) / (2 * j + 1) for j in range(terms)), F(0)
    )
    tail = 2 * z ** (2 * terms + 1) / ((2 * terms + 1) * (1 - z * z))
    return partial, partial + tail


lo2, hi2 = log_bounds(F(2))
lo75, hi75 = log_bounds(F(75, 64))
harmonic30 = sum((F(1, j) for j in range(1, 31)), F(0))
# 1/(2(N+1)) < H_N - log(N) - gamma < 1/(2N), N=30.
L_lower = 13 * lo2 + lo75 - harmonic30 + F(1, 62)
L_upper = 13 * hi2 + hi75 - harmonic30 + F(1, 60)
assert L_lower > F(519, 100)
assert L_upper < F(649, 125)

# Machin's identity, with the alternating-series upper/lower truncations.
atan5_upper = sum(
    ((-1) ** j * F(1, 5) ** (2 * j + 1) / (2 * j + 1) for j in range(5)),
    F(0),
)
atan239_lower = F(1, 239) - F(1, 3 * 239**3)
pi_upper = 16 * atan5_upper - 4 * atan239_lower
assert pi_upper < F(355, 113)
sqrt_2pi_upper = F(250663, 100000)
assert sqrt_2pi_upper**2 > 2 * F(355, 113)

z = F(1, 160)
w = z * z / 4
I_upper = 1 / (1 - w)
Iprime_upper = (2 / z) * w / (1 - w) ** 2
S_upper = w / (1 - w) ** 2
Sprime_upper = (2 / z) * w * (1 + w) / (1 - w) ** 3
K_difference_lower = (
    1 / z
    - F(649, 125) * (I_upper + Iprime_upper)
    - S_upper
    - Sprime_upper
)
assert K_difference_lower > 0
a_lower = F(1, 40) * (1 + z) * K_difference_lower / (2 * sqrt_2pi_upper)
b_lower = (1 + z) * F(519, 100) / sqrt_2pi_upper
assert a_lower > F(7767, 10000)
assert b_lower > F(2083, 1000)

# k >= 500000 gives 1/sqrt(2k) <= 1/1000.
a0 = F(7767, 10000)
b0 = F(2083, 1000)
V_lower = (a0**2 + F(1, 40) * (F(999, 1000) * b0) ** 2) ** 2 + 2 * a0**4
margin = V_lower - F(355, 113) ** 2 / 8
assert margin == F(
    8370960719747393508158728849,
    20430400000000000000000000000000,
)
assert margin > 0
print("PASS: logarithm, Euler constant, pi, Bessel, and separation bounds.")
print("Exact margin above (355/113)^2/8:", margin)
