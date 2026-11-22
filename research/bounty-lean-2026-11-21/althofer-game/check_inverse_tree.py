"""Exact certificate for the mass inequality in the inverse strategy tree."""
from fractions import Fraction

from check_remoteness import children

WEIGHTS = (0, 71, 50, 0, 70, 35, 0, 70, 100, 0, 49, 64, 0, 50)


def weight(n):
    r = n % 27
    return WEIGHTS[min(r, 27-r)]


def successors(m):
    for t in range(2, 17):
        z = (1 << t)*m
        b = 1 if z % 3 == 1 else -1
        w = (z-b)//3
        if w <= 1 or w % 3 == 0:
            continue
        s = 1 if w % 3 == 1 else -1
        n = (2*w+s)//3
        if n > 1 and n % 3 and (t >= 3 or b == s):
            yield t, w, n


def main():
    ratios = []
    for m in range(245, 245 + 486, 2):
        if m % 3 == 0:
            continue
        total = Fraction(0)
        for t, w, n in successors(m):
            # This lower bound is 3/sqrt(2**(t+1)), rounded down only when needed.
            factor = Fraction(3, 1 << ((t+1)//2))
            if (t+1) % 2:
                factor *= Fraction(70, 99)
            total += weight(n)*factor
            assert w == max(children(n))
            assert min(children(w)) == m
            assert all(m in children(d) for d in children(n))
            assert abs(9*n-(1 << (t+1))*m) <= 5
        ratios.append(total / weight(m))
    assert len(ratios) == 162
    assert 2*70**2 <= 99**2
    assert min(ratios) >= Fraction(211, 200)
    growth = Fraction(101, 100)
    assert Fraction(211, 200)**2 >= growth**2 * Fraction(61, 56)
    assert (5, 53, 35) in successors(5)
    assert weight(35)**2 * 5 >= growth**2 * weight(5)**2 * 35
    assert (5, 11, 7) in successors(1)
    assert all(1 in children(d) for d in children(7))
    print(f'{len(ratios)} unit residues modulo 243; minimum rational bound {min(ratios)}')
    print('Local expansion >= 101/100; root 7 and exceptional size 5 checked.')


if __name__ == '__main__':
    main()
