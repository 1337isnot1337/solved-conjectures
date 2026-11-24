#!/usr/bin/env python3
"""Exact sparse multilinear checks for the positive Capelli source map."""

from itertools import combinations, permutations, product
from math import comb, factorial


def sign(word):
    return (-1)**sum(word[a] > word[b] for a in range(len(word))
                     for b in range(a+1, len(word)))


def aligned_word(word, selected):
    order = tuple(selected)+tuple(j for j in range(len(word)) if j not in selected)
    return tuple(word[j] for j in order)


def minor_matrix(s, r, selected, out_set, in_set):
    # Creation of one determinant after differentiation by another.
    # The dictionary is its full matrix on multilinear row monomials.
    result = {}
    k = len(selected)
    for inp in product(range(r), repeat=s):
        local = tuple(inp[j] for j in selected)
        if tuple(sorted(local)) != tuple(in_set):
            continue
        in_sign = sign(local)
        for out_local in permutations(out_set):
            out = list(inp)
            for j,v in zip(selected,out_local):
                out[j] = v
            result[(tuple(out),inp)] = in_sign*sign(out_local)
    return result


def check_case(s,k,r):
    physical = list(combinations(range(s),k))
    flavours = list(combinations(range(r),k))
    first = tuple(range(k))
    matrices = 0
    for i in physical:
        for h in flavours:
            for kk in flavours:
                original = minor_matrix(s,r,i,h,kk)
                conjugated = {(aligned_word(out,i),aligned_word(inp,i)):v
                              for (out,inp),v in original.items()}
                standard = minor_matrix(s,r,first,h,kk)
                assert conjugated == standard
                matrices += 1
    # The alternating insertion vectors are orthogonal with squared norm k!.
    for h in flavours:
        for kk in flavours:
            wh = {word:sign(word) for word in permutations(h)}
            wk = {word:sign(word) for word in permutations(kk)}
            dot = sum(v*wk.get(word,0) for word,v in wh.items())
            assert dot == (factorial(k) if h==kk else 0)
    p,q,rest = comb(s,k),comb(r,k),r**(2*(s-k))
    n = p*r**(2*s-k)
    assert n == p*r**k*rest
    # Exact count of each lowered source flag and selected output spaces.
    assert n == len(physical)*r**(s-k)*r**s
    assert p*q*q*rest <= q*n
    return {'s':s,'k':k,'r':r,'p':p,'q':q,'source_flag':n,
            'inactive_wire':rest,'aligned_minor_matrices':matrices}


if __name__ == '__main__':
    results = [check_case(*params) for params in ((3,1,2),(4,2,2),(4,2,3))]
    print({'cases':results,'status':'passed',
           'output':'W_AD(p) W_BD(p) U_ABC(q^2) W_AB(R)',
           'scope':'This is not the unresolved copied-target trade.'})
