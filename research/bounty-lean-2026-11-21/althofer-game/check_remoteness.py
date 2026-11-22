"""Check the arithmetic reductions against an independent finite-horizon game."""
from collections import Counter
from functools import cache
from itertools import product


def odd_part(x):
    assert x > 0
    return x // (x & -x)


def children(n):
    assert n > 1 and n % 2
    return odd_part(3*n - 1), odd_part(3*n + 1)


@cache
def horizon(n, t):
    if n == 1:
        return -1
    if t == 0:
        return 0
    return -min(horizon(child, t-1) for child in children(n))


def check_reductions():
    for g, k, x, y in product((-1, 0, 1), repeat=4):
        e = -min(g, x)
        h = -min(g, k)
        f = -min(y, k)
        assert max(min(e, h), min(h, f)) == h

    outcomes = Counter()
    starts = 0
    for s in (-1, 1):
        for modulus, residue, row in [(32, s, 1), (32, 9*s, 2), (128, 77*s, 3)]:
            for n in range(residue % modulus, 16000, modulus):
                if n == 1:
                    continue
                b = (3*n - s) // 2
                if row == 1:
                    h = (9*n - s) // 8
                    c, e, f = (3*n + s)//4, 2*h-s, (h+s)//2
                elif row == 2:
                    h = (9*n - s) // 16
                    c, e, f = (3*n + s)//4, 4*h-s, 2*h+s
                else:
                    h = (9*n - 5*s) // 16
                    c, e, f = (3*n + s)//8, 4*h+s, (h+s)//4
                assert {b, c} == set(children(n))
                assert {e, h} == set(children(b))
                assert {h, f} == set(children(c))
                g, k = children(h)
                assert ((g in children(e) and k in children(f)) or
                        (k in children(e) and g in children(f)))
                assert horizon(n, 1) == 0
                for t in (0, 1, 2, 4, 6, 8, 10, 12):
                    outcome = horizon(n, t+2)
                    assert outcome == horizon(h, t)
                    outcomes[outcome] += 1
                starts += 1
    assert set(outcomes) == {-1, 0, 1}

    reducing = [n for n in range(1, 1152, 2)
                if n % 36 in (1, 35) or n % 32 in (9, 23) or n % 128 in (77, 51)]
    assert len(reducing) == 144
    for s, a, c in product((-1, 1), range(2, 15), range(1, 10, 2)):
        n = s + (1 << a)*c
        for k in range((a-2)//3 + 1):
            h = s + (1 << (a-3*k))*9**k*c
            for t in (0, 2, 4, 6):
                assert horizon(n, t+2*k) == horizon(h, t)
    print(f"{starts} arithmetic instances; {sum(outcomes.values())} horizon comparisons.")
    print(f"{len(reducing)} reducing odd residues of 576 modulo 1152.")


if __name__ == "__main__":
    check_reductions()
