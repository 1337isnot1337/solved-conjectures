#!/usr/bin/env python3
"""Independent exact checks for subgroup-transfer obstruction notes.

The exceptional S5 is constructed as PGL(2,5), independently of the other
worker's construction through six F20 lines.  No conjecture is resolved.
"""

from itertools import combinations, permutations, product
from math import factorial


ZERO = (0, 0)
ONE = (1, 0)


def zadd(a, b):
    return (a[0] + b[0], a[1] + b[1])


def zmul(a, b):
    return (a[0] * b[0] - a[1] * b[1], a[0] * b[1] + a[1] * b[0])


def zscale(c, a):
    return (c * a[0], c * a[1])


def zconj(a):
    return (a[0], -a[1])


def zsum(xs):
    out = ZERO
    for x in xs:
        out = zadd(out, x)
    return out


def zprod(xs):
    out = ONE
    for x in xs:
        out = zmul(out, x)
    return out


def zreal(a):
    assert a[1] == 0
    return a[0]


def gram(columns):
    return [[zsum(zmul(zconj(x), y) for x, y in zip(u, v))
             for v in columns] for u in columns]


def compose(p, q):
    return tuple(p[q[i]] for i in range(len(p)))


def inverse(p):
    q = [0] * len(p)
    for i, j in enumerate(p):
        q[j] = i
    return tuple(q)


def sign(p):
    return (-1) ** sum(p[i] > p[j] for i in range(len(p)) for j in range(i + 1, len(p)))


def conjugates(h, group):
    return sorted({tuple(sorted(compose(compose(p, q), inverse(p)) for q in h))
                   for p in group})


def fixed_subsets(p, k):
    return sum(sorted(p[i] for i in subset) == list(subset)
               for subset in combinations(range(len(p)), k))


def terms(a, group):
    return {p: zprod(a[i][p[i]] for i in range(len(p))) for p in group}


def subset_operator(ts, n, k):
    subsets = list(combinations(range(n), k))
    lookup = {subset: i for i, subset in enumerate(subsets)}
    b = [[ZERO for _ in subsets] for _ in subsets]
    for p, value in ts.items():
        for j, subset in enumerate(subsets):
            i = lookup[tuple(sorted(p[t] for t in subset))]
            b[i][j] = zadd(b[i][j], value)
    assert all(b[i][j] == zconj(b[j][i]) for i in range(len(b)) for j in range(len(b)))
    return b


def trace(b):
    return zreal(zsum(b[i][i] for i in range(len(b))))


def trace_square(b):
    return zreal(zsum(zmul(b[i][j], b[j][i]) for i in range(len(b)) for j in range(len(b))))


def pgl25():
    """Mobius transformations on F5 together with infinity, encoded as 5."""
    h = set()
    for a, b, c, d in product(range(5), repeat=4):
        if (a * d - b * c) % 5 == 0:
            continue
        p = []
        for x in range(6):
            numerator = a if x == 5 else (a * x + b) % 5
            denominator = c if x == 5 else (c * x + d) % 5
            p.append(5 if denominator == 0 else numerator * pow(denominator, -1, 5) % 5)
        h.add(tuple(p))
    assert len(h) == 120
    assert all(set(p) == set(range(6)) for p in h)
    assert all(compose(p, q) in h for p in h for q in h)
    assert {p[0] for p in h} == set(range(6))
    return h


def s6_check():
    group = tuple(permutations(range(6)))
    h = pgl25()
    copies = conjugates(h, group)
    assert len(copies) == 6
    for p in group:
        induced = sign(p) * sum(p in k for k in copies)
        assert induced == sign(p) + fixed_subsets(p, 3) - fixed_subsets(p, 2)
    columns = [((1, 0), (0, 0)), ((0, 0), (1, 0)),
               ((1, 0), (1, 0)), ((1, 0), (-1, 0)),
               ((1, 0), (0, 1)), ((1, 0), (0, -1))]
    ts = terms(gram(columns), group)
    p = zreal(zsum(ts.values()))
    assert p == 240 == 2 * factorial(5)
    values = [zreal(zsum(zscale(sign(q), ts[q]) for q in k)) for k in copies]
    assert sorted(values) == [24, 24, 24, 24, 120, 120]
    b3, b2 = subset_operator(ts, 6, 3), subset_operator(ts, 6, 2)
    tr33 = trace(b3) - trace(b2)
    tr233 = trace_square(b3) - trace_square(b2)
    assert tr33 == 336 and tr233 == 336 ** 2
    print('Independent PGL(2,5) construction: order120, six conjugates, induced sign identity verified.')
    print(f'  per={p}, trace33={tr33}, trace-square33={tr233}, sign sums={sorted(values)}')
    return copies


def f20_check():
    group = tuple(permutations(range(5)))
    h = {tuple((a * x + b) % 5 for x in range(5))
         for a in range(1, 5) for b in range(5)}
    copies = conjugates(h, group)
    assert len(copies) == 6
    for p in group:
        induced = sign(p) * sum(p in k for k in copies)
        assert induced == sign(p) + fixed_subsets(p, 2) - fixed_subsets(p, 1)
    columns = [((4, -2), (2, 4)), ((2, 3), (0, 3)),
               ((-4, 4), (2, 4)), ((-3, -4), (0, 3)), ((1, 0), (-5, 7))]
    ts = terms(gram(columns), group)
    p = zreal(zsum(ts.values()))
    assert p == 814016640
    values = [zreal(zsum(zscale(sign(q), ts[q]) for q in k)) for k in copies]
    assert sorted(values) == [175632320, 217411520, 231295040, 234838080, 253091520, 286627520]
    b2, b1 = subset_operator(ts, 5, 2), subset_operator(ts, 5, 1)
    tr32 = trace(b2) - trace(b1)
    tr232 = trace_square(b2) - trace_square(b1)
    t, d = 2185775, 160600333345
    assert tr32 == 640 * t
    assert tr232 == 2 * 320 ** 2 * (t * t + d)
    # Rank-two Schur--Weyl bound gives rank(B32)<=2.  Thus these moments
    # certify eigenvalues 320*(t +/- sqrt(d)), without a numerical solver.
    gap = 3 * p - 800 * t
    assert gap > 0 and gap * gap > 800 ** 2 * d
    assert max(values) < p
    print('Independent affine F20 construction: six conjugates and induced sign identity verified.')
    print(f'  per={p}, trace32={tr32}, trace-square32={tr232}, sign sums={sorted(values)}')
    print('  Exact two-moment certificate verifies the 6/5 spectral-threshold obstruction.')


def one_vector_check(copies):
    # Recover the entire Hermitian quadratic form by direct degree-six sums
    # at four vectors. This does not reuse the cofactor construction from the
    # other worker's checker.
    cores = {
        'Shchesnovich': [((4, -2), (2, 4)), ((2, 3), (0, 3)),
                        ((-4, 4), (2, 4)), ((-3, -4), (0, 3)), ((1, 0), (-5, 7))],
        'Tran': [((1, 0), (1, -1)), ((1, 0), (-1, -1)),
                 ((1, 0), (-1, 1)), ((1, 0), (1, 1)), ((1, 0), (0, 0))],
    }
    samples = [((1, 0), (0, 0)), ((0, 0), (1, 0)),
               ((1, 0), (1, 0)), ((1, 0), (0, 1))]
    group5 = tuple(permutations(range(5)))
    group6 = tuple(permutations(range(6)))
    expected_min = {'Shchesnovich': 5289492733102080000, 'Tran': 2109312}
    for name, columns in cores.items():
        base_terms = terms(gram(columns), group5)
        p0 = zreal(zsum(base_terms.values()))
        sampled = []
        for v in samples:
            ts = terms(gram(columns + [v]), group6)
            p = zreal(zsum(ts.values()))
            sampled.append([p - zreal(zsum(zscale(sign(q), ts[q]) for q in h))
                            for h in copies])
        determinants = []
        for j, h in enumerate(copies):
            delta = p0 - zreal(zsum(zscale(sign(q), base_terms[q[:5]])
                                   for q in h if q[5] == 5))
            a, d = sampled[0][j], sampled[1][j]
            re2 = sampled[2][j] - a - d
            im2 = a + d - sampled[3][j]
            assert re2 % 2 == im2 % 2 == 0
            re, im = re2 // 2, im2 // 2
            det = a * d - re * re - im * im
            assert delta > 0 and a > 0 and det > 0
            determinants.append(det)
        assert min(determinants) == expected_min[name]
        print(f'Independent all-vector certificate, {name}: six positive forms; minimum determinant {min(determinants)}.')


if __name__ == '__main__':
    f20_check()
    copies = s6_check()
    one_vector_check(copies)
    print('All independent exact subgroup checks passed.')
