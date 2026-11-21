#!/usr/bin/env python3
"""Exact discovery screen for Gonzalez D'Leon--Wachs Conjectures 6.21/7.3.

Primary: arXiv:2608.08692v2, equations (5.3), (7.1).
Polynomials are integer dictionaries indexed by partitions in the h or e basis.
Positive bounded screens are not proofs. No floating point arithmetic is used.
"""
from collections import Counter, defaultdict
from functools import lru_cache
from itertools import combinations
from math import factorial
import argparse
import json
import random
import time


def clean(p):
    return {k: v for k, v in p.items() if v}


def plus(a, b, scale=1):
    out = dict(a)
    for k, v in b.items():
        out[k] = out.get(k, 0) + scale*v
    return clean(out)


@lru_cache(None)
def cat(a, b):
    return tuple(sorted(a+b, reverse=True))


def mul(a, b):
    out = defaultdict(int)
    for x, u in a.items():
        for y, v in b.items():
            out[cat(x, y)] += u*v
    return clean(out)


@lru_cache(None)
def partitions(n, cap=None):
    if n == 0:
        return ((),)
    if cap is None or cap > n:
        cap = n
    return tuple((a,)+q for a in range(cap, 0, -1)
                 for q in partitions(n-a, a))


@lru_cache(None)
def h_to_e_single(n):
    ans = {}
    for lam in partitions(n):
        c = factorial(len(lam))
        for v in Counter(lam).values():
            c //= factorial(v)
        ans[lam] = (-1)**(n-len(lam))*c
    return ans


@lru_cache(None)
def h_to_e_monomial(lam):
    out = {(): 1}
    for n in lam:
        out = mul(out, h_to_e_single(n))
    return out


def h_to_e(p):
    out = {}
    for lam, c in p.items():
        out = plus(out, h_to_e_monomial(lam), c)
    return out


@lru_cache(None)
def pieri(lam, r):
    """All mu for which mu/lam is a horizontal strip of size r."""
    n = sum(lam)+r
    result = []
    for mu in partitions(n):
        if len(mu) > len(lam)+1:
            continue
        if all(mu[i] >= a >= (mu[i+1] if i+1 < len(mu) else 0)
               for i, a in enumerate(lam)
               if i < len(mu)) and len(mu) >= len(lam):
            result.append(mu)
    return tuple(result)


@lru_cache(None)
def h_to_s_monomial(lam):
    if not lam:
        return {(): 1}
    out = defaultdict(int)
    for old, c in h_to_s_monomial(lam[:-1]).items():
        for mu in pieri(old, lam[-1]):
            out[mu] += c
    return dict(out)


def h_to_s(p):
    out = {}
    for lam, c in p.items():
        out = plus(out, h_to_s_monomial(lam), c)
    return out


class Bond:
    def __init__(self, n, edges):
        self.n = n
        self.edges = tuple(sorted(tuple(sorted(e)) for e in edges))
        self.adj = [0]*n
        for i, j in self.edges:
            assert 0 <= i < j < n
            self.adj[i] |= 1 << j
            self.adj[j] |= 1 << i
        self.conn = [False]*(1 << n)
        self.F = [None]*(1 << n)
        self.F[0] = [{(): 1}]
        self.M = [{} for _ in self.F]
        for mask in range(1, 1 << n):
            first = mask & -mask
            seen = 0
            todo = first
            while todo:
                v = todo & -todo
                todo ^= v
                seen |= v
                todo |= self.adj[v.bit_length()-1] & mask & ~seen
            self.conn[mask] = seen == mask
            sz = mask.bit_count()
            row = [{} for _ in range(sz+1)]
            # Every partition has a unique block containing the least vertex.
            # The full block is omitted until its M polynomial is computed.
            sub = (mask-1) & mask
            while sub:
                if sub & first and self.conn[sub]:
                    rest = mask ^ sub
                    for k, p in enumerate(self.F[rest]):
                        if p:
                            row[k+1] = plus(row[k+1], mul(self.M[sub], p))
                sub = (sub-1) & mask
            if sz == 1:
                self.M[mask] = {(): 1}
            elif self.conn[mask]:
                # Theorem 5.7: M_G=-sum_{k>=2} h_(k-1) F_(G,k).
                mm = defaultdict(int)
                for k in range(2, sz+1):
                    for lam, c in row[k].items():
                        mm[cat(lam, (k-1,))] -= c
                self.M[mask] = clean(mm)
            row[1] = self.M[mask]
            self.F[mask] = row

    def psi(self):
        full = self.F[-1]
        return [full[self.n-d] for d in range(self.n)]

    def check(self, schur=True):
        fullmask = (1 << self.n)-1
        if self.conn[fullmask]:
            e = h_to_e(self.M[fullmask])
            e = {p: (-1)**(self.n-1)*c for p, c in e.items()}
            bad = [(p,c) for p,c in e.items() if c < 0]
            if bad:
                return {'type': '6.21(1)', 'negative': bad}
        if schur:
            psi = self.psi()+[{}]
            for d in range(1, self.n):
                diff = plus(mul(psi[d], psi[d]), mul(psi[d-1], psi[d+1]), -1)
                ss = h_to_s(diff)
                bad = [(p,c) for p,c in ss.items() if c < 0]
                if bad:
                    return {'type': '7.3', 'd': d, 'negative': bad}
        return None


def validate():
    p3 = Bond(3, [(0,1),(1,2)])
    k3 = Bond(3, [(0,1),(1,2),(0,2)])
    assert h_to_e(p3.M[-1]) == {(1,1): 1, (2,): 1}
    assert h_to_e(k3.M[-1]) == {(1,1): 2, (2,): 1}
    assert [h_to_e(x) for x in p3.psi()] == [{():1},{(1,):-2},{(1,1):1,(2,):1}]
    assert h_to_s({(1,1):2,(2,):1}) == {(2,):3,(1,1):2}
    # The source's displayed Example 7.4 reverses these two Schur labels.
    assert h_to_s({(2,):1}) == {(2,):1}
    assert h_to_s({(1,1):1}) == {(2,):1,(1,1):1}
    for n in range(2,7):
        path = Bond(n, [(i,i+1) for i in range(n-1)])
        assert path.check() is None
        # One variable recovers reversed chromatic polynomial of a tree.
        assert [sum(x.values()) for x in path.psi()] == [(-1)**d*__import__('math').comb(n-1,d) for d in range(n)]


def graphs(n, count, seed):
    rng = random.Random(seed)
    # Cycles, complete bipartite graphs, wheels, and sparse/dense random graphs.
    yield 'cycle', [(i,(i+1)%n) for i in range(n)]
    for a in range(2,n//2+1):
        yield f'K{a},{n-a}', [(i,j) for i in range(a) for j in range(a,n)]
    yield 'wheel', [(0,j) for j in range(1,n)]+[(i,i+1) for i in range(1,n-1)]+[(1,n-1)]
    for index in range(count):
        p = (0.15,0.25,0.4,0.6,0.8)[index%5]
        edges = [(i,j) for i,j in combinations(range(n),2) if rng.random()<p]
        yield f'random-{index}-p{p}', edges


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--n',type=int,default=8)
    parser.add_argument('--count',type=int,default=20)
    parser.add_argument('--seed',type=int,default=260808692)
    parser.add_argument('--e-only',action='store_true')
    parser.add_argument('--edges',action='store_true',help='also test every same-component edge deletion')
    args=parser.parse_args()
    validate()
    start=time.time()
    for index,(name,edges) in enumerate(graphs(args.n,args.count,args.seed)):
        g=Bond(args.n,edges)
        bad=g.check(not args.e_only)
        if not bad and args.edges and g.conn[-1]:
            big = h_to_e(g.M[-1])
            for e in g.edges:
                smallg=Bond(args.n,[f for f in g.edges if f != e])
                if not smallg.conn[-1]:
                    continue
                diff=plus(big,h_to_e(smallg.M[-1]),-1)
                neg=[(p,(-1)**(args.n-1)*c) for p,c in diff.items()
                     if (-1)**(args.n-1)*c < 0]
                if neg:
                    bad={'type':'6.21(2)','deleted_edge':e,'negative':neg}
                    break
        record={'index':index,'n':args.n,'name':name,'edges':g.edges,
                'connected':g.conn[-1],'failure':bad,'seconds':round(time.time()-start,3)}
        print(json.dumps(record),flush=True)
        if bad:
            return


if __name__ == '__main__':
    main()
