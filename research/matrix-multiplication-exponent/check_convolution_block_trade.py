"""Exact balanced-trade obstruction for Q_m^tensor3, valid for m >= 2."""

from collections import Counter

source = [
    ((0, 0, 1), (1, 0, 0), (0, 1, 0), (1, 1, 1)),
    ((0, 0, 0), (0, 1, 0), (0, 0, 0), (0, 1, 0)),
    ((0, 0, 0), (0, 0, 0), (1, 0, 0), (1, 0, 0)),
]

target = [
    ((0, 0, 1), (0, 1, 0), (1, 0, 0), (1, 1, 1)),
    ((0, 0, 0), (1, 0, 0), (0, 0, 0), (1, 0, 0)),
    ((0, 0, 0), (0, 0, 0), (0, 1, 0), (0, 1, 0)),
]

for row in source + target:
    a, b, c, d = row
    assert d == tuple(a[i] + b[i] + c[i] for i in range(3))
    assert all(x in (0, 1) for v in row for x in v)

for a, b, c, _ in source:
    assert len({a[2], b[1], c[0]}) > 1

for a, b, c, _ in target:
    assert a[2] == b[1] == c[0]

for party in range(4):
    assert Counter(row[party] for row in source) == Counter(
        row[party] for row in target
    )

print("PASS: all six terms belong to Q_m^tensor3 for every m >= 2")
print("PASS: exactly the target terms have equal block labels")
print("PASS: the local coordinate multisets agree at all four parties")
