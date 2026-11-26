"""Certify the first two optimized coefficients for the Leech deep-hole types."""

from decimal import Decimal
from math import prod

# The 23 types in Bachoc–Moustrou–Vallentin–Zimmermann, Table 3.
TYPES = [
    {'A1':24}, {'A2':12}, {'A3':8}, {'A4':6}, {'A5':4,'D4':1},
    {'A6':4}, {'A7':2,'D5':2}, {'A8':3}, {'A9':2,'D6':1},
    {'A11':1,'D7':1,'E6':1}, {'A12':2}, {'A15':1,'D9':1},
    {'A17':1,'E7':1}, {'A24':1}, {'D4':6}, {'D6':4}, {'D8':3},
    {'D10':1,'E7':2}, {'D12':2}, {'D16':1,'E8':1}, {'D24':1},
    {'E6':4}, {'E8':3},
]
SCALE = 10**9


def marks(key):
    rank = int(key[1:])
    if key[0] == 'A' and 1 <= rank <= 24:
        return [1] * (rank + 1)
    if key[0] == 'D' and 4 <= rank <= 24:
        return [1] * 4 + [2] * (rank - 3)
    return {
        'E6': [1, 1, 1, 2, 2, 2, 3],
        'E7': [1, 1, 2, 2, 2, 3, 3, 4],
        'E8': [1, 2, 2, 3, 3, 4, 4, 5, 6],
    }[key]


def component_lower(key):
    """Floor of SCALE times the component minimum h / product^(1/h)."""
    labels = marks(key)
    h = sum(labels)
    product = prod(a**a for a in labels)
    target = (h * SCALE)**h
    lo, hi = 0, h * SCALE + 1
    while hi - lo > 1:
        mid = (hi + lo) // 2
        if mid**h * product <= target:
            lo = mid
        else:
            hi = mid
    return lo


def type_bounds(components):
    """Enclose the sum in [lo, hi), allowing one grid unit per component."""
    lo = sum(count * component_lower(key) for key, count in components.items())
    hi = lo + sum(components.values())
    return Decimal(lo) / SCALE, Decimal(hi) / SCALE


def main():
    if len(TYPES) != 23 or len({frozenset(t.items()) for t in TYPES}) != 23:
        raise ValueError("Expected the 23 distinct deep-hole types in Table 3")

    bounds = []
    for components in TYPES:
        if any(count <= 0 for count in components.values()):
            raise ValueError(f"Nonpositive multiplicity in {components}")
        if sum(int(key[1:]) * count for key, count in components.items()) != 24:
            raise ValueError(f"Total rank differs from 24 in {components}")
        if len({sum(marks(key)) for key in components}) != 1:
            raise ValueError(f"Unequal Coxeter numbers in {components}")
        lo, hi = type_bounds(components)
        bounds.append((lo, hi, components))

    bounds.sort(key=lambda entry: entry[0])
    first_lo, first_hi, first = bounds[0]
    second_lo, second_hi, second = bounds[1]
    if first != {'E8': 3} or second != {'D24': 1}:
        raise ValueError(f"Unexpected first two types: {first}, {second}")
    if first_hi >= second_lo or second_hi >= bounds[2][0]:
        raise ValueError("Intervals do not strictly separate the first two types from each other and the rest")
    if not Decimal('24.32239535') < first_lo < first_hi < Decimal('24.32239545'):
        raise ValueError("E8^3 interval does not certify rounding to 24.3223954")
    if not Decimal('24.42892') < second_lo < second_hi < Decimal('24.42893'):
        raise ValueError("D24 interval is outside the quoted bounds")
    # The closed form for E8^3 is below the A24 value 25 after taking 30th powers.
    if not 16 * 3**48 < 5**35:
        raise ValueError("E8^3 failed the direct comparison with A24")

    for lo, hi, components in bounds:
        print(f"{components}: [{lo:.9f}, {hi:.9f})")


if __name__ == '__main__':
    main()
