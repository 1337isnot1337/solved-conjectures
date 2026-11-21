"""Exact arithmetic checks for an abstract obstruction model, not a Ramsey solver."""
import json
from math import isqrt
from pathlib import Path


def F(n: int) -> int:
    assert n >= 1
    return n + isqrt(n) + 1


def ceil_sqrt(n: int) -> int:
    t = isqrt(n)
    return t + (t * t < n)


LIMIT = 1_000_000
for n in range(1, LIMIT + 1):
    assert F(n + 1) - F(n) in (1, 2)
    assert (F(n) - n) ** 2 > n
    assert F(F(n) + 1) <= 2 * F(n) - n + 2
    if n >= 2:
        assert F(2 * n - F(n) + 1) >= n
        assert F(n) <= n + ceil_sqrt(n - 1) + 1
for a in range(1, 2001):
    for b in range(1, 101):
        assert F(a) >= a + b or F(a + b) <= a + 2 * b
for m in range(2, 1001):
    assert F(m * m + 3) == m * m + m + 4
    assert F(m * m) == m * m + m + 1

result = {
    "status": "all exact arithmetic checks passed",
    "one_variable_range": [1, LIMIT],
    "alternative_a_range": [1, 2000],
    "alternative_b_range": [1, 100],
    "square_parameter_range": [2, 1000],
    "new_ramsey_values": 0,
    "bounty_solutions": 0,
    "meaning": "finite checks of a proved abstract model; not an actual Ramsey construction",
}
Path(__file__).with_name("erdos552-model-check.json").write_text(json.dumps(result, indent=2) + "\n")
print(json.dumps(result, indent=2))
