"""Check modular action against direct subpermanents and test quotient observability."""
from itertools import combinations, permutations
from math import comb, factorial, prod
from random import Random
from modular_compound_action import compound_action, retained_moduli


def direct(A,k,vector,modulus):
    n = len(A)
    indices = list(combinations(range(n),k))
    return [sum(c*sum(prod(A[i][j] for i,j in zip(I,sigma)) for sigma in permutations(J))
                for c,J in zip(vector,indices)) % modulus for I in indices]


def compositions(k,n):
    if n == 1:
        yield (k,)
        return
    for t in range(k+1):
        for tail in compositions(k-t,n-1):
            yield (t,)+tail


def literal_routing(alpha,beta,modulus):
    # Expand by choosing each destination variable in the indicated source group.
    groups = []
    start = 0
    for m in alpha:
        groups.append(range(start,start+m))
        start += m
    masks = {0:1}
    for group,count in zip(groups,beta):
        for _ in range(count):
            out = {}
            for mask,mult in masks.items():
                for j in group:
                    if not (mask >> j) & 1:
                        key = mask | (1 << j)
                        out[key] = (out.get(key,0)+mult) % modulus
            masks = out
    return masks.get((1 << start)-1,0)


if __name__ == '__main__':
    rng = Random(111917)
    actions = 0
    for n in range(1,7):
        for A in ([[rng.randrange(-10,11) for j in range(n)] for i in range(n)],
                  [[2*rng.randrange(-5,6) for j in range(n)] for i in range(n)],
                  [[i + 2*j for j in range(n)] for i in range(n)],
                  [[0 for j in range(n)] for i in range(n)]):
            for p,b in ((2,1),(2,2),(2,4),(3,2),(5,1)):
                for k in range(n+1):
                    v = [rng.randrange(-100,101) for _ in range(comb(n,k))]
                    assert compound_action(A,k,v,p,b) == direct(A,k,v,p**b)
                    actions += 1
    probes = 0
    for n in range(1,6):
        for k in range(n+1):
            atoms = list(compositions(k,n))
            for alpha in atoms:
                weight = prod(factorial(a) for a in alpha)
                for p,b in ((2,2),(3,2)):
                    m = p**b
                    order = retained_moduli(k,p,b)(alpha)
                    assert weight*order % m == 0 and (order == 1 or weight*(order//p) % m)
                    for beta in atoms:
                        assert literal_routing(alpha,beta,m) == (weight if alpha==beta else 0) % m
                        probes += 1
    print(f'{actions} exact compound actions and {probes} squarefree routing probes passed')
