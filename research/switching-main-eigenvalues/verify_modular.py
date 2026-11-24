#!/usr/bin/env python3
"""Exact diagnostic for the modular switching criterion in README.md.

Requires SymPy and NetworkX; tested with 1.14.0 and 3.6.1.
The asymptotic and modular sufficient theorems are proved in writing.
Finite checks do not prove the unrestricted conjecture.
"""
import collections
import itertools
import math
from fractions import Fraction

import networkx as nx
import sympy as sp


def relation_mod2(rows):
    piv = {}
    for j, row in enumerate(rows):
        z = sum((int(x) & 1) << i for i, x in enumerate(row))
        r = 1 << j
        while z:
            i = z.bit_length() - 1
            if i not in piv:
                piv[i] = z, r
                break
            a, b = piv[i]
            z ^= a
            r ^= b
        else:
            return r
    return 0


def saturate2(rows):
    # Start with rationally independent integer vectors. A dependency
    # modulo two permits replacing a row by half the indicated sum,
    # enlarging the lattice with index two. Iteration terminates because
    # the starting lattice has finite index in its saturation.
    rows = [list(map(int, r)) for r in rows]
    while (d := relation_mod2(rows)):
        inds = [j for j in range(len(rows)) if d >> j & 1]
        z = [sum(rows[j][i] for j in inds) for i in range(len(rows[0]))]
        assert all(x % 2 == 0 for x in z)
        rows[inds[-1]] = [x // 2 for x in z]
    return rows


def poly_eval(f, A):
    B = sp.zeros(A.rows)
    I = sp.eye(A.rows)
    for c in f.all_coeffs():
        B = B*A + c*I
    return B


def spectral_blocks(G):
    n = G.number_of_nodes()
    A = sp.Matrix(nx.to_numpy_array(G, dtype=int).tolist())
    fs = sp.factor_list(A.charpoly().as_poly())[1]
    blocks = []
    for f, m in fs:
        F = poly_eval(f, A)
        K = F.nullspace()
        assert len(K) == f.degree()*m
        rows = []
        for v in K:
            q = math.lcm(*(int(x.q) for x in v))
            rows.append([int(q*x) for x in v])
        rows = saturate2(rows)
        assert all(F*sp.Matrix(v) == sp.zeros(n, 1) for v in rows)
        blocks.append((f, m, rows))
    return blocks


def witness(blocks, n, mod=None):
    # Fix the last sign positive: global negation preserves all tests.
    if mod == 4:
        masks = []
        for f, m, rows in blocks:
            if any(sum(r) % 2 for r in rows):
                continue
            masks.append([(sum((x % 2) << i for i, x in enumerate(r)),
                           (sum(r)//2) % 2) for r in rows])
        for b in range(1 << (n-1)):
            if all(any(((b & mask).bit_count() & 1) != t
                       for mask, t in block) for block in masks):
                return b
        return None
    for b in range(1 << (n-1)):
        s = [1 - 2*(b >> i & 1) for i in range(n)]
        def good(r):
            x = sum(a*y for a, y in zip(s, r))
            return x % mod != 0 if mod else x != 0
        if all(any(good(r) for r in rows) for f, m, rows in blocks):
            return b
    return None


def separated(blocks):
    fs = [sp.Poly(f, modulus=2) for f, m, rows in blocks]
    return all(sp.gcd(f, g).degree() == 0
               for f, g in itertools.combinations(fs, 2))


def modular_component_criterion(blocks):
    fs = [sp.Poly(f, modulus=2) for f, m, rows in blocks]
    H = nx.Graph()
    H.add_nodes_from(range(len(fs)))
    H.add_edges_from((i, j) for i, j in itertools.combinations(range(len(fs)), 2)
                     if sp.gcd(fs[i], fs[j]).degree() > 0)
    for comp in nx.connected_components(H):
        total = Fraction(0)
        for i in comp:
            f, m, rows = blocks[i]
            if all(sum(r) % 2 == 0 for r in rows):
                total += Fraction(1, 2**len(rows))
        if total >= 1:
            return False
    return True


def explicit_obstruction():
    G = nx.Graph()
    G.add_nodes_from(range(7))
    G.add_edges_from([(0,1),(0,4),(0,5),(0,6),(1,3),(1,5),(1,6),
                      (2,3),(2,4),(3,4),(3,5),(3,6),(4,5),(4,6),(5,6)])
    assert nx.is_connected(G)
    A = sp.Matrix(nx.to_numpy_array(G, dtype=int).tolist())
    t = sp.symbols('t')
    f = sp.Poly(t**3 - 2*t**2 - 10*t - 6, t)
    assert f.is_irreducible
    assert A.charpoly(t).as_poly() == sp.Poly(t*(t-1)*(t+1)*(t+2)*f.as_expr(), t)
    rows = [[2,2,-4,-2,-2,1,1], [1,-1,0,-1,1,0,0],
            [0,0,0,0,0,-1,1], [-1,1,0,-1,1,0,0]]
    for lam, w in zip([1,0,-1,-2], rows):
        assert A*sp.Matrix(w) == lam*sp.Matrix(w)
        assert math.gcd(*w) == 1
    for s in itertools.product([-1,1], repeat=7):
        dots = [sum(x*y for x, y in zip(s, w)) for w in rows]
        assert not all(x % 8 for x in dots)
    s = [-1,1,1,1,1,-1,1]
    assert [sum(x*y for x, y in zip(s, w)) for w in rows] == [-8,-2,2,2]
    w = sp.Matrix([1,1,1,0,0,0,0])
    assert poly_eval(f, A)*w == sp.zeros(7,1)
    assert w.dot(sp.Matrix(s)) == 1
    print('explicit obstruction verified: no mod-8 certificate, but exact switching exists')


def main():
    stats = collections.Counter()
    for G in nx.graph_atlas_g():
        n = len(G)
        if n < 2 or not nx.is_connected(G):
            continue
        G = nx.convert_node_labels_to_integers(G)
        B = spectral_blocks(G)
        w = witness(B, n, 4)
        stats[n, 'connected'] += 1
        if separated(B):
            assert w is not None
            stats[n, 'separated'] += 1
        if modular_component_criterion(B):
            assert w is not None
            stats[n, 'component criterion'] += 1
        if w is None:
            stats[n, 'mod4 fail'] += 1
            if witness(B, n, 8) is None:
                stats[n, 'mod8 fail'] += 1
            if witness(B, n) is None:
                stats[n, 'exact fail'] += 1
        else:
            # Independently check the recovered binary mask over integers.
            s = [1 - 2*(w >> i & 1) for i in range(n)]
            assert all(any(sum(x*y for x, y in zip(s, r)) % 4
                           for r in rows) for f, m, rows in B)
    for (n, k), v in sorted(stats.items()):
        print(n, k, v)
    totals = {k: sum(v for (_, j), v in stats.items() if j == k)
              for k in ['connected', 'separated', 'component criterion',
                        'mod4 fail', 'mod8 fail', 'exact fail']}
    assert totals == {'connected': 995, 'separated': 142,
                      'component criterion': 775, 'mod4 fail': 44,
                      'mod8 fail': 3, 'exact fail': 2}
    print(totals)
    explicit_obstruction()


if __name__ == '__main__':
    main()
