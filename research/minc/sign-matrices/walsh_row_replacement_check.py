"""Independent exact Walsh row-replacement checks, without external packages."""
from itertools import combinations, product
from math import prod

from paley_ii_torus_check import ryser_signs


def walsh(d):
    return [[(-1)**((i & j).bit_count()%2) for j in range(1 << d)]
            for i in range(1 << d)]


def switched(d, s, field):
    h = 1 << s
    return [[-x if i<h and j%h==field else x for j,x in enumerate(row)]
            for i,row in enumerate(walsh(d))]


def compare_three_labels():
    # A single four-row switch in order eight yields another dephased-up-to-row-sign Hadamard.
    base, other = walsh(3), switched(3,2,0)
    for matrix in (base,other):
        cols = list(zip(*matrix))
        assert all(prod(col)==1 for col in cols)
        assert all(sum(x*y for x,y in zip(a,b))==0 for a,b in combinations(cols,2))
    for labels in combinations(range(8),3):
        # Compare the products of the three-variable linear forms after row dephasing.
        def pairs(matrix):
            i,j,k = labels
            return sorted((row[i]*row[j],row[i]*row[k]) for row in matrix)
        assert pairs(base) == pairs(other)


def check_orbits():
    n, h = 16, 4
    before, after = walsh(4), switched(4,2,0)
    shears = []
    for m0,m1,w in product(range(4),repeat=3):
        shears.append(tuple((j%4)+4*((j//4)^w^(m0 if j&1 else 0)^(m1 if j&2 else 0))
                            for j in range(n)))
    sets = set(combinations(range(n),h))
    total = 0
    count = 0
    while sets:
        c = next(iter(sets))
        orbit = {tuple(sorted(phi[j] for j in c)) for phi in shears}
        sets.difference_update(orbit)
        if len({j%4 for j in c})==4:
            assert len(orbit)==64
            count += 1
        terms = set()
        for chosen in orbit:
            def packet(matrix):
                return ryser_signs([[row[j] for j in chosen] for row in matrix[:h]])
            change = packet(after)-packet(before)
            if change:
                assert len({j%4 for j in chosen})==4
                tail = [[x for j,x in enumerate(row) if j not in chosen] for row in before[h:]]
                change *= ryser_signs(tail)
            terms.add(change)
        assert len(terms)==1
        total += len(orbit)*terms.pop()
    a,b = ryser_signs(before), ryser_signs(after)
    assert b-a==total and total%(1 << n)==0
    assert a%(1 << n)==b%(1 << n)==1 << (n-1)
    print(f'Order 16 full permanents {a}, {b}; {count} shear orbits occupy all four fibers.')


if __name__=='__main__':
    compare_three_labels()
    check_orbits()
