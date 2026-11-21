"""Exact obstruction using all labelled <=5-edge replacement gadgets.

The gadget meets the outside graph at terminals 0,1,2. Other vertices are
internal. Graph realization of the tested abstract boundary data is not
asserted. A negative diagnostic would supply an additional constraint, not
a graph counterexample.
"""
from fractions import Fraction as F
from itertools import combinations, combinations_with_replacement
import json


def classes(n, edges):
    roots = list(range(n))
    cycles = 0
    def root(x):
        while roots[x] != x:
            roots[x] = roots[roots[x]]
            x = roots[x]
        return x
    for a,b in edges:
        x,y = root(a),root(b)
        if x == y:
            cycles += 1
        else:
            roots[x] = y
    return [root(x) for x in range(n)], cycles


def allowed(n, edges):
    degrees = [0]*n
    for x,y in edges:
        degrees[x] += 1
        degrees[y] += 1
    if any(degrees[i] < 2 for i in range(3,n)):
        return False
    extra = [(0,1),(1,2)]
    if len(set(classes(n, edges+extra)[0])) != 1:
        return False
    for i in range(len(edges)):
        if len(set(classes(n, edges[:i]+edges[i+1:]+extra)[0])) != 1:
            return False
    return True


def coefficients(n, edges):
    aa, cc, tt = [0]*5, [0]*5, [0]*5
    k = n-3
    for mask in range(1 << len(edges)):
        chosen = [e for i,e in enumerate(edges) if mask >> i & 1]
        cl, cycles = classes(n, chosen)
        terminal_roots = set(cl[:3])
        separate_internal = len(set(cl[3:])-terminal_roots)
        rank = 3-len(terminal_roots)
        if rank == 0:
            pi = 0
        elif rank == 2:
            pi = 4
        elif cl[0] == cl[1]:
            pi = 1
        elif cl[0] == cl[2]:
            pi = 2
        else:
            pi = 3
        aa[pi] += (-1)**((k+len(chosen)+separate_internal-rank) % 2)
        cc[pi] += (-1)**separate_internal
        if not cycles and not separate_internal:
            tt[pi] += 1
    return aa,cc,tt


def main():
    a = [F(1)]+[F(99,100)]*3+[F(49,50)]
    c = [F(101,100)]+[F(21,10)]*3+[F(27,10)]
    t = [F(1)]+[F(11,8)]*3+[F(363,256)]
    count = 0
    least = None
    types = set()
    for n in range(3,8):
        pairs = list(combinations(range(n), 2))
        for m in range(6):
            if 2*(n-3) > 2*m:
                continue
            for ee in combinations_with_replacement(pairs, m):
                edges = list(ee)
                if not allowed(n, edges):
                    continue
                count += 1
                coef = coefficients(n, edges)
                key = tuple(map(tuple,coef))
                if key in types:
                    continue
                types.add(key)
                values = [sum(x*y for x,y in zip(p,v)) for p,v in zip(coef,(a,c,t))]
                margin = values[0]*values[1]-values[2]**2
                if least is None or margin < least['margin']:
                    least = {'margin':margin,'n':n,'edges':edges,'coefficients':coef}
    assert least['margin'] > 0
    target_a = 4+sum(a[1:4])+a[4]
    target_c = 8*c[0]+9*sum(c[1:4])+27*c[4]
    target_t = 6+4*sum(t[1:4])+8*t[4]
    target_margin = target_a*target_c-target_t**2
    assert target_margin == F(-6507957,128000)
    least['margin'] = str(least['margin'])
    print(json.dumps({'labelled_gadgets_checked':count,
                      'distinct_boundary_coefficient_triples':len(types),
                      'least_margin':least,
                      'original_doubled_star_margin':str(target_margin),
                      'proof_of_Merino_Welsh_claimed':False},indent=2))


if __name__ == '__main__':
    main()
