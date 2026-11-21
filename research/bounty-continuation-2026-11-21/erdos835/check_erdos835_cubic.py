"""Exact diagnostic for forced, symmetrized third color moments.

This tests a necessary condition; it does not search for colorings and does not
count any finite negative case as an answer to the existential problem.
"""
from itertools import combinations
from math import comb, lcm
from fractions import Fraction
import argparse
import json


def analyze(k):
    assert k >= 2 and k % 2 == 0
    p = k + 1
    den = p * lcm(*(comb(k, j) for j in range(k + 1)))
    ed = [(-1) ** j * (den // (p * comb(k, j))) for j in range(k + 1)]
    vertices = [sum(1 << j for j in v) for v in combinations(range(2*k), k)]
    a = (1 << k) - 1
    ea = [ed[(a & v).bit_count()] for v in vertices]
    kap = k * (k - 1) * (k + 2) // 2
    d3 = den**3
    checks = 0
    failures = []
    minima = [None] * 5
    for dist in range(k + 1):
        b = ((1 << (k-dist)) - 1) | (((1 << dist)-1) << k)
        cells = [[j for j in range(2*k) if bool(a & (1<<j)) == aa and bool(b & (1<<j)) == bb]
                 for aa, bb in ((1,1),(1,0),(0,1),(0,0))]
        eb = [ed[(b & v).bit_count()] for v in vertices]
        ab_product = [x*y for x,y in zip(ea,eb)]
        eab = ed[(a & b).bit_count()]
        for c0 in range(len(cells[0])+1):
            for c1 in range(len(cells[1])+1):
                for c2 in range(len(cells[2])+1):
                    c3 = k-c0-c1-c2
                    if not 0 <= c3 <= len(cells[3]):
                        continue
                    counts = (c0,c1,c2,c3)
                    c = sum(1<<j for cell,num in zip(cells,counts) for j in cell[:num])
                    eac = ed[(a & c).bit_count()]
                    ebc = ed[(b & c).bit_count()]
                    cubic = sum(z * ed[(c & v).bit_count()] for z,v in zip(ab_product,vertices))
                    same = d3 // p**2 + k*(eab+eac+ebc)*(den**2//p) + kap*cubic
                    kpairs = [(den//p+k*e)*den**2 for e in (eab,eac,ebc)]
                    nums = [same] + [q-same for q in kpairs] + [d3-sum(kpairs)+2*same]
                    checks += 1
                    for j,num in enumerate(nums):
                        if minima[j] is None or num < minima[j]:
                            minima[j] = num
                    if min(nums) < 0:
                        failures.append({'distance_ab':dist,'c_cell_counts':counts,
                                         'probabilities':[str(Fraction(z,d3)) for z in nums]})
    return {'k':k,'p':p,'vertices':len(vertices),'triple_orbits':checks,
            'minima':[str(Fraction(z,d3)) for z in minima],
            'failures':failures}


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('k',type=int,nargs='+')
    args = parser.parse_args()
    for k in args.k:
        print(json.dumps(analyze(k)),flush=True)
