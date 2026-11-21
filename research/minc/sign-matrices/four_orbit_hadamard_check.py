"""Check four-orbit quaternion identities and small integral candidate spaces."""
from itertools import combinations, permutations, product
from math import isqrt, prod


def permanent(a):
    return sum(prod(row[j] for row,j in zip(a, perm)) for perm in permutations(range(4)))


def dot(x, y):
    return sum(a*b for a,b in zip(x,y))


def rank_two(a, p):
    # Orthogonality has already bounded the rank by two.
    pairs = list(combinations(range(4), 2))
    return any((a[i][k]*a[j][l]-a[j][k]*a[i][l]) % p for i,j in pairs for k,l in pairs)


def check_candidates(m, p):
    radius = isqrt(4*m)
    odd = [v for v in range(-radius,radius+1) if v%2]
    vectors = [v for v in product(odd, repeat=4) if v[0]>0 and dot(v,v)==4*m]
    count = 0
    for first in vectors:
        # Normalize the first row by column signs and permutations. Subsequent
        # row signs and their ordering also preserve the assertions under test.
        if first != tuple(sorted(map(abs, first))):
            continue
        perp = [v for v in vectors if dot(first,v)==0]
        for second, third, fourth in combinations(perp,3):
            if dot(second,third) or dot(second,fourth) or dot(third,fourth):
                continue
            a = (first,second,third,fourth)
            cols = list(zip(*a))
            if len({sum(v)%4 for v in a})>1 or len({sum(v)%4 for v in cols})>1:
                continue
            if not rank_two(a,p):
                assert m != p
                continue
            value = abs(permanent(a))
            for x in cols:
                if any(y%p for y in x):
                    assert value == abs(2*sum(y**4 for y in x)-16*m*m)
            assert len({tuple(sorted(map(abs,x))) for x in cols}) == 1
            count += 1
    assert count > 0
    return count


def main():
    # Degree in each of a,b,c,d is at most four on both sides.
    for a,b,c,d in product(range(5),repeat=4):
        q = [[a,-b,-c,-d],[b,a,-d,c],[c,d,a,-b],[d,-c,b,a]]
        nums = a,b,c,d
        assert permanent(q) == 2*sum(t**4 for t in nums)-dot(nums,nums)**2
    x = 1,3,7,15
    assert dot(x,x) == 4*71 and sum(t**4 for t in x)%71 == 0
    for m,p in [(3,3),(5,5),(7,7),(9,3),(11,11),(13,13)]:
        print(f'm={m}: {check_candidates(m,p)} normalized rank-two candidates')


if __name__ == '__main__':
    main()
