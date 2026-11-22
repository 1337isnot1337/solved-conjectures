#!/usr/bin/env python3
"""Independent re-check (shares no code with verify.py; standard library only): rebuild H_g from the formulas of PROOF.md,
assign each edge its colour by closed formula, check ALL pairs of adjacent edges, Delta and |E|.
Colour of base class K_a (a in Z_2n): position of base colour 3a mod 2n in the final sequence, i.e.
3a + 3*(number of blocks inserted at base colours <= 3a mod 2n); block b class j at position c_b + 3*b + j."""
import sys, json, os
from fractions import Fraction


def build_explicit(g):
    n = 6 * g + 1; u = 2 * g + 7; N = g - 3; c = 3 * g + 3
    M0 = [(c - j, c + 1 + j) for j in range(3, g - 3)] + [(a, 3 * g + 6 - a) for a in range(6)]
    Pp = lambda i: u + 2 * i
    Qq = lambda i: u + 2 * i + 1
    E = []
    if N % 2 == 0:
        pis = [i for i in range(2, N // 2)]
        kas = [i for i in range(0, N // 2 - 1)]
        if N % 4 == 0:
            kas.remove(N // 4 - 1)
        else:
            pis.remove((N - 2) // 4)
        E += [(Pp(i), Pp(N - 1 - i)) for i in pis] + [(Qq(i), Qq(N - 2 - i)) for i in kas]
        E += [(Qq(N // 2 - 1), Qq(N - 1))]
    else:
        pis = list(range(2, (N - 3) // 2 + 1))
        if N % 4 == 1:
            pis.remove((N - 1) // 4); extra = (Pp(0), Pp((N - 1) // 2))
        else:
            pis.remove((N + 1) // 4); extra = (Pp(1), Pp((N - 1) // 2))
        E += [(Pp(i), Pp(N - 1 - i)) for i in pis] + [extra]
        E += [(Qq(i), Qq(N - 2 - i)) for i in range(0, (N - 3) // 2 + 1)]
    if g % 2:
        xs = [Fraction(3 * g - 11, 2), 2 * g - 10, Fraction(g - 5, 2), 2, 2 * g - 8, 0]
    elif g % 4 == 0:
        xs = [Fraction(3 * g - 12, 2), 2 * g - 10, Fraction(g - 4, 2), 2 * g - 7, 2, 2 * g - 8]
    else:
        xs = [Fraction(3 * g - 14, 2), 2 * g - 10, Fraction(g - 2, 2), 2 * g - 7, 0, 2 * g - 8]
    for a, x in zip(range(1, 7), xs):
        assert x == int(x)
        E.append((a, u + int(x)))
    return n, M0, E


def classes(n, M0, M1):
    def Kset(a):
        i, e = divmod(a, 2)
        return [((x + i) % n, (y + i) % n) for x, y in (M0 if e == 0 else M1)]
    return Kset


def blocks_explicit(g, n, Vset):
    """Vset(c) -> vertex set of base colour c."""
    res = []
    X1 = {0, 2, 4} | set(range(7, 6 * g, 2))
    for c0, sh in ((0, 0), (6, 1)):
        res.append((c0, [[(x, (x + 1) % n) for x in sorted(X1) if (x + sh) % n in Vset(c0 + j) for x in [(x + sh) % n]]
                         for j in range(3)]))
    a = 0
    while (g - 3 - 3 * a) % 5:
        a += 1
    b = (g - 3 - 3 * a) // 5
    Fs = []
    for j in range(3):
        S = Vset(12 + j)
        F = []
        for s in [x for x in S if (x - 1) % n not in S]:
            L = 0
            while (s + L) % n in S:
                L += 1
            pieces = [6] if L == 6 else [6] * a + [10] * b
            pos = s
            for size in pieces:
                h = size // 2
                F += [((pos + t) % n, (pos + t + h) % n) for t in range(h)]
                pos += size
        Fs.append(F)
    res.append((12, Fs))
    return res


def run(g, n, M0, M1, blocks=None):
    K = classes(n, M0, M1)
    two_n = 2 * n
    inv3 = pow(3, -1, two_n)
    Vset = lambda c: {x for e in K((inv3 * c) % two_n) for x in e}
    if blocks is None:
        blocks = blocks_explicit(g, n, Vset)
    cb = sorted(c for c, _ in blocks)
    col = {}
    def add(e, cc):
        key = frozenset(e)
        assert len(key) == 2 and key not in col
        col[key] = cc
    for a in range(two_n):
        base_c = (3 * a) % two_n
        shift = 3 * sum(1 for c in cb if c <= base_c)
        for e in K(a):
            add(e, base_c + shift)
    for b, (c0, Fs) in enumerate(sorted(blocks)):
        for j, F in enumerate(Fs):
            for e in F:
                add(e, c0 + 3 * b + j)
    p = two_n + 9
    inc = {}
    for e, cc in col.items():
        for v in e:
            inc.setdefault(v, []).append(cc)
    for v, cs in inc.items():
        for i in range(len(cs)):
            for j in range(i + 1, len(cs)):
                d = (cs[i] - cs[j]) % p
                assert min(d, p - d) >= 3, (g, v)
    D = max(len(cs) for cs in inc.values())
    assert D == 4 * g + 3 and len(col) == 2 * g * n + 9 * g and len(inc) == n
    assert Fraction(len(col), 3 * g) == Fraction(p, 3)
    return True


if __name__ == '__main__':
    G = int(sys.argv[1]) if len(sys.argv) > 1 else 40
    for g in range(15, G + 1):
        n, M0, M1 = build_explicit(g)
        run(g, n, M0, M1)
    print('explicit 15..%d OK (all pairs)' % G)
    here = os.path.dirname(os.path.abspath(__file__))
    for cert in json.load(open(os.path.join(here, 'certificates.json'))):
        g = cert['g']; n = 6 * g + 1
        blocks = [(c, [[tuple(e) for e in F] for F in Fs]) for c, Fs in zip(cert['block_colours'], cert['blocks'])]
        run(g, n, [tuple(e) for e in cert['M0']], [tuple(e) for e in cert['M1']], blocks)
        print('cert g=%d OK' % g)
