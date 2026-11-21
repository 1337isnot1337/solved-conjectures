"""Integer diagnostics for the fiber product and parity formulas."""
from itertools import permutations, product
from math import prod


def quaternion_product(a, b):
    # Encodings 0,1,2,3 are 1,i,j,k; adding four negates the unit.
    table = ((0, 1, 2, 3), (1, 4, 3, 6), (2, 7, 4, 1), (3, 2, 5, 4))
    return table[a % 4][b % 4] ^ ((a ^ b) & 4)


def weights(vectors, action):
    matrix = [[sum(x*y for x,y in zip(u,v)) for v in vectors] for u in vectors]
    return [prod(matrix[i][j] for i,j in enumerate(row)) for row in action]


def quaternion_check():
    action = [[quaternion_product(g,x) for x in range(8)] for g in range(8)]
    vectors = [[(i*i+3*i*j+j*j+1) % 7-3 for j in range(4)] for i in range(8)]
    other = [[(3*i*i+2*i*j+j*j+1) % 11-5 for j in range(3)] for i in range(8)]
    first, second = weights(vectors, action), weights(other, action)
    subgroup = [(g,h) for g,h in product(range(8), repeat=2) if g%4 == h%4]
    def character(g,h):
        return 1 if g == h else -1
    for (g,h),(a,b) in product(subgroup,repeat=2):
        assert character(quaternion_product(g,a),quaternion_product(h,b)) == character(g,h)*character(a,b)
    coset1 = [first[i]-first[i+4] for i in range(4)]
    coset2 = [second[i]-second[i+4] for i in range(4)]
    direct = sum(character(g,h)*first[g]*second[h] for g,h in subgroup)
    assert direct == sum(a*b for a,b in zip(coset1, coset2))
    lhs = sum(character(g,h)*first[g]*first[h] for g,h in subgroup)
    assert lhs == sum(a*a for a in coset1)
    assert direct**2 <= lhs*sum(a*a for a in coset2)
    assert any(coset1) and any(coset2)


def parity_check():
    n = 5
    action = list(permutations(range(n)))
    parities = [sum(p[i]>p[j] for j in range(n) for i in range(j))%2 for p in action]
    vals = weights([[((i+1)*(j+1)+i*i+j)%9-4 for j in range(n)] for i in range(n)], action)
    by_parity = [sum(v for v,p in zip(vals,parities) if p == e) for e in (0,1)]
    assert min(by_parity) >= 0
    subgroup_sum = sum((-1)**e*v*w for e,v in zip(parities, vals) for f,w in zip(parities, vals) if e == f)
    assert subgroup_sum == by_parity[0]**2-by_parity[1]**2
    assert abs(subgroup_sum) <= sum(vals)**2


if __name__ == '__main__':
    quaternion_check()
    parity_check()
    print('Q8 central quotient, self-pair identity, mixed Cauchy bound and S5 parity coupling passed')
