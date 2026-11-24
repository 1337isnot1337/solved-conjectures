"""Exact Pauli-space checks for the sharp full-rank branch overlaps."""
from itertools import combinations


def rank(rows):
    pivots = {}
    for value in rows:
        while value:
            pivot = value.bit_length() - 1
            if pivot in pivots:
                value ^= pivots[pivot]
            else:
                pivots[pivot] = value
                break
    return len(pivots)


def symplectic(x, y, length):
    mask = (1 << length) - 1
    return (((x & mask) & (y >> length)).bit_count()
            + ((y & mask) & (x >> length)).bit_count()) % 2


def layouts(n, u):
    offset_b = n + u
    offset_c = 2 * (n + u)
    length = 4 * n + 2 * u

    def z(site):
        return 1 << (length + site)

    def x(site):
        return 1 << site

    a = list(range(n))
    af = list(range(n, n + u))
    b = list(range(offset_b, offset_b + n))
    bf = list(range(offset_b + n, offset_b + n + u))
    ci = list(range(offset_c, offset_c + n))
    cj = list(range(offset_c + n, offset_c + 2 * n))
    target = [z(a[t]) ^ z(ci[t]) for t in range(n)]
    target += [z(b[t]) ^ z(cj[t]) for t in range(n)]
    target += [z(af[t]) ^ z(bf[t]) for t in range(u)]
    target += [x(af[t]) ^ x(bf[t]) for t in range(u)]
    assert rank(target) == 2 * n + 2 * u
    return length, x, z, a, af, b, bf, ci, cj, target


def tagged(n, u):
    length, x, z, a, af, b, bf, ci, cj, target = layouts(n, u)
    images = [[], [], []]
    paired = min(u, n // 2)
    for t in range(paired):
        images[0] += [z(af[t]), z(a[t])]
        images[1] += [z(bf[t]), z(b[t]) ^ z(bf[t])]
        images[2] += [z(ci[t]) ^ z(cj[t]), z(ci[t])]
    for t in range(n - 2 * paired):
        bit = paired + t
        images[0].append(z(a[bit]))
        images[1].append(z(b[bit]))
        images[2].append(z(ci[bit]))
    for party in images:
        assert len(party) == n and rank(party) == n
        assert all(symplectic(v, w, length) == 0
                   for v, w in combinations(party, 2))
    source = [images[0][t] ^ images[1][t] for t in range(n)]
    source += [images[0][t] ^ images[2][t] for t in range(n)]
    assert rank(source) == 2 * n
    assert all(symplectic(v, w, length) == 0
               for v, w in combinations(source, 2))
    intersection = rank(source) + rank(target) - rank(source + target)
    assert intersection == n + paired
    assert intersection == min(n + u, (3 * n) // 2)
    exponent = 2 * n - intersection
    assert exponent == max(n - u, (n + 1) // 2)
    return intersection, exponent


def untagged(n, u):
    length, x, z, a, af, b, bf, ci, cj, target = layouts(n, u)
    z_images = [[], [], []]
    x_images = [[], [], []]
    assisted = min(n, u)
    for t in range(n):
        if t < assisted:
            z_images[0].append(z(af[t]))
            x_images[0].append(x(af[t]) ^ z(a[t]))
            z_images[1].append(z(bf[t]))
            x_images[1].append(x(bf[t]) ^ z(b[t]))
            z_images[2].append(x(ci[t]))
            x_images[2].append(z(ci[t]) ^ z(cj[t]))
        else:
            z_images[0].append(z(a[t]))
            x_images[0].append(x(a[t]))
            z_images[1].append(z(b[t]))
            x_images[1].append(x(b[t]))
            z_images[2].append(z(ci[t]))
            x_images[2].append(x(ci[t]))
    for party in range(3):
        zz, xx = z_images[party], x_images[party]
        assert rank(zz + xx) == 2 * n
        for i in range(n):
            for j in range(n):
                assert symplectic(zz[i], zz[j], length) == 0
                assert symplectic(xx[i], xx[j], length) == 0
                assert symplectic(zz[i], xx[j], length) == (i == j)
    source = [z_images[0][t] ^ z_images[1][t] for t in range(n)]
    source += [z_images[0][t] ^ z_images[2][t] for t in range(n)]
    source += [x_images[0][t] ^ x_images[1][t] ^ x_images[2][t]
               for t in range(n)]
    assert rank(source) == 3 * n
    assert all(symplectic(v, w, length) == 0
               for v, w in combinations(source, 2))
    intersection = rank(source) + rank(target) - rank(source + target)
    assert intersection == n + assisted
    exponent = 3 * n - intersection
    assert exponent == 2 * n - min(n, u)
    return intersection, exponent


def main():
    checks = 0
    for n in range(1, 9):
        for u in range(n + 2):
            tagged(n, u)
            untagged(n, u)
            checks += 2
    print({"exact_symplectic_and_intersection_checks": checks,
           "tagged_n2_u1": tagged(2, 1),
           "tagged_n5_u3": tagged(5, 3),
           "untagged_n3_u3": untagged(3, 3),
           "status": "passed"})


if __name__ == "__main__":
    main()

