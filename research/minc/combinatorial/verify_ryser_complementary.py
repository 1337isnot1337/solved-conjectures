"""Integer replay of the design defect, moment sign, cofactor counts, and K3,3 bound."""
from itertools import combinations, permutations, product
from pathlib import Path
import sys

sys.path.insert(0,str(Path(__file__).resolve().parents[1]/'extremal-graphs'))
from verify_complement_moments import moments, rook_counts


def design(n,S):
    return tuple(sum(1<<((i+j)%n) for j in S) for i in range(n))


def switches(H):
    for i,j in combinations(range(len(H)),2):
        a,b = H[i]&~H[j], H[j]&~H[i]
        if a and b:
            mask = (a&-a) | (b&-b)
            yield tuple(x^mask if k in (i,j) else x for k,x in enumerate(H))


def board(H):
    n = len(H)
    return tuple(frozenset(j for j in range(n) if row>>j&1) for row in H)


def hom33(H):
    return sum((a&b&c).bit_count()**3 for a,b,c in product(H,repeat=3))


def coarse_checks():
    cases = 0
    for n,S in [(7,(0,1,3)),(11,(1,3,4,5,9)),(13,(0,1,3,9))]:
        H = design(n,S)
        r = len(S)
        lam = r*(r-1)//(n-1)
        assert all((u&v).bit_count()==lam for u,v in combinations(H,2))
        ref = moments(rook_counts(H,n),9)
        perH = rook_counts([(1<<n)-1-x for x in H],n)[-1]
        for G in list(switches(H))[:6]:
            E = 2*sum(((u&v).bit_count()-lam)**2 for u,v in combinations(G,2))
            p = moments(rook_counts(G,n),9)
            assert E>0 and p[:4]==ref[:4] and p[4]-ref[4] == -E
            assert abs(hom33(G)-hom33(H)) <= 8*n*r**4+16*r*r*E
            difference = rook_counts([(1<<n)-1-x for x in G],n)[-1] - perH
            assert difference in {7: {0}, 11: {224,240}, 13: {35740}}[n]
            cases += 1
    return cases


def injective_checks():
    H = board(design(7,(0,1,3)))
    G = board(next(switches(design(7,(0,1,3)))))
    n = len(H)
    # Choose a distinguished right vertex adjacent to rows 0,1 and a connected
    # remaining pattern on 3+2 sites. Count every collision explicitly.
    left_images = list(permutations(range(n),3))
    checked = 0
    for bits in range(1,64):
        F = [(i,j) for i in range(3) for j in range(2) if bits>>(2*i+j)&1]
        seen = {0}
        for _ in range(5):
            for i,j in F:
                if i in seen or 3+j in seen:
                    seen.update((i,3+j))
        if len(seen)!=5:
            continue
        for host in (H,G):
            expected = actual = 0
            for left in left_images:
                common = host[left[0]] & host[left[1]]
                for right in permutations(range(n),2):
                    if all(right[j] in host[left[i]] for i,j in F):
                        actual += len(common.difference(right))
                        expected += 1 - sum(j in common for j in right)
                        if host is G:
                            expected += len(common)-1
            assert actual == expected
            checked += 1
    return checked


if __name__ == '__main__':
    print(f'{coarse_checks()} exact design comparisons and {injective_checks()} anchored-pattern counts passed')
