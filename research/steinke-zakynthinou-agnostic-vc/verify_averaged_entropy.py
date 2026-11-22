"""Exact checks for prediction residuals and the restriction-entropy gradient."""
from fractions import Fraction
from itertools import combinations, product
from math import comb, log


def projection(hypotheses, weights, coords):
    traces = [tuple(h[i] for i in coords) for h in hypotheses]
    return [[w / sum(v for v,t in zip(weights,traces) if t == row) if col == row else Fraction(0)
             for w,col in zip(weights,traces)] for row in traces]


def matmul(a,b):
    return [[sum(x*y for x,y in zip(row,col)) for col in zip(*b)] for row in a]


def av_projection(hypotheses, weights, coords, m):
    mats = [projection(hypotheses, weights, indices) for indices in combinations(coords,m)]
    return [[sum(mat[i][j] for mat in mats)/len(mats) for j in range(len(weights))]
            for i in range(len(weights))]


def residual_checks():
    count = 0
    cube = list(product((0,1),repeat=3))
    for mask in range(1,1<<len(cube)):
        family = [h for j,h in enumerate(cube) if mask & (1<<j)]
        total = len(family)*(len(family)+1)//2
        weights = [Fraction(j+1,total) for j in range(len(family))]
        coords = (0,1,2)
        d = max(k for k in range(4) if any(
            len({tuple(h[i] for i in J) for h in family}) == 2**k
            for J in combinations(coords,k)))
        for m in (0,1,2):
            residual = Fraction(0)
            for J in combinations(coords,m):
                P = projection(family,weights,J)
                for i in coords:
                    f = [h[i] for h in family]
                    mean = [sum(a*b for a,b in zip(row,f)) for row in P]
                    residual += sum(w*(v-u)**2 for w,v,u in zip(weights,f,mean))
            residual /= len(coords)*comb(len(coords),m)
            assert residual <= Fraction(d,m+1)
            count += 1
    return count


def marginal_entropy(q,traces):
    mass = {}
    for w,trace in zip(q,traces):
        mass[trace] = mass.get(trace,0) + w
    return -sum(w*log(w) for w in mass.values()), mass


def gradient_checks():
    family = list(product((0,1),repeat=3))
    q = [(i+1)/36 for i in range(8)]
    v = [(2*i-7)/100 for i in range(8)]
    count = 0
    for coords in ((0,), (0,2), (1,1)):
        for i in range(3):
            coarse = [tuple(h[j] for j in coords) for h in family]
            fine = [trace+(h[i],) for trace,h in zip(coarse,family)]
            _,old = marginal_entropy(q,coarse)
            _,new = marginal_entropy(q,fine)
            score = [log(new[b]/old[a]) for a,b in zip(coarse,fine)]
            expected = sum(x*y for x,y in zip(v,score))
            def diff(delta):
                qq = [x+delta*y for x,y in zip(q,v)]
                return marginal_entropy(qq,coarse)[0]-marginal_entropy(qq,fine)[0]
            assert abs(expected-(diff(1e-5)-diff(-1e-5))/2e-5) < 1e-8
            count += 1
    return count


if __name__ == '__main__':
    H = ((0,0,0),(0,0,1),(0,1,0),(1,0,0))
    weights = [Fraction(k,10) for k in (1,2,3,4)]
    a,b = [av_projection(H,weights,range(3),m) for m in (1,2)]
    commutator = matmul(a,b)[0][1]-matmul(b,a)[0][1]
    assert commutator != 0
    print(f'{residual_checks()} exact residual bounds and {gradient_checks()} gradient differences passed. '
          f'The (0,1) commutator entry is {commutator}.')
