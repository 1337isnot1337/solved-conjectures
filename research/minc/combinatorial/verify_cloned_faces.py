"""Exact tree, clone permanent, and localized Hessian checks."""

from fractions import Fraction as F
from itertools import combinations, permutations
from math import comb, factorial, prod


def permanent(a):
    terms = {0: 1}
    for row in a:
        values = {}
        for mask, term in terms.items():
            for j, x in enumerate(row):
                if x and not (mask >> j & 1):
                    key = mask | (1 << j)
                    values[key] = values.get(key, 0) + term*x
        terms = values
    return terms.get((1 << len(a))-1, 0)


def det(a):
    a = [[F(t) for t in row] for row in a]
    value = 1
    for i in range(len(a)):
        j = next((j for j in range(i, len(a)) if a[j][i]), None)
        if j is None:
            return 0
        if i != j:
            a[i], a[j] = a[j], a[i]
            value *= -1
        x = a[i][i]
        value *= x
        for row in a[i+1:]:
            q = row[i]/x
            for j in range(i, len(a)):
                row[j] -= q*a[i][j]
    return value


def check_trees(x):
    h = len(x)
    edges = [(i,j+h,x[i][j]) for i in range(h) for j in range(h) if x[i][j]]
    tau = 0
    for subset in combinations(edges, 2*h-1):
        reached = {0}
        for _ in range(2*h-1):
            for i,j,_ in subset:
                if i in reached or j in reached:
                    reached.update((i,j))
        if len(reached) == 2*h:
            tau += prod(v for _,_,v in subset)
    b = [[v-F(1,h) for v in row] for row in x]
    matrix = [[int(i==j)-sum(row[i]*row[j] for row in b)
               for j in range(h)] for i in range(h)]
    assert det(matrix) == h*tau


def block_value(l, p, removed):
    # Row and column multiplicities (l-removed,l); sum over 2x2 flow tables.
    first = l-removed
    q = 1-p
    return sum(comb(first,k)*comb(l,k)*factorial(first)*factorial(l)
               * (q/l)**(2*k) * (p/l)**(first+l-2*k)
               for k in range(first+1))


if __name__ == '__main__':
    count = 0
    for h in (2, 3):
        perms = list(permutations(range(h)))
        for P in perms:
            for Q in perms:
                for R in (tuple(range(h)), tuple(reversed(range(h)))):
                    x = [[F(2*(P[i]==j) + 3*(Q[i]==j) + 4*(R[i]==j),9)
                          for j in range(h)] for i in range(h)]
                    check_trees(x)
                    count += 1
    values = 0
    for p in (F(1,2), F(3,4), F(4,5)):
        for l in (2, 3, 4, 5):
            a = [[(p if i//l == j//l else 1-p)/l for j in range(2*l)]
                 for i in range(2*l)]
            assert permanent(a) == block_value(l,p,0)
            # Twice the sum of the two signed products of the four direction
            # entries equals one, giving this minor as the Hessian.
            assert permanent([row[2:] for row in a[2:]]) == block_value(l,p,2)
            values += 2
        errors = []
        for l in (8, 32, 96):
            d = F(factorial(2*l), (2*l)**(2*l))
            hessian = block_value(l,p,2)/d
            # The squared determinant-model Hessian equals 1/(1-(2p-1)^2).
            errors.append(abs(hessian**2*(1-(2*p-1)**2)-1))
        assert errors[-1] < errors[1] < errors[0] and errors[-1] < F(1,20)
    print(f'Passed {count} spanning-tree identities, {values} clone permanents '
          'and minors, and three localized Hessian limit examples.')
