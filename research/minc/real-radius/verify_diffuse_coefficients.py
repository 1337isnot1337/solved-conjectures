"""Check the Gaussian coefficient identity and normalized coefficient bound."""
from fractions import Fraction as F
from math import comb, factorial, prod

from verify_hall_bound import permanent


def coefficients(frame, rank):
    # Expand the product of row linear forms plus one, before Gaussian averaging.
    zero = (0,)*rank
    out = {zero: 1}
    for row in frame:
        expanded = out.copy()
        for degree, value in out.items():
            for j, signed in enumerate(row):
                next_degree = list(degree)
                next_degree[j] += 1
                key = tuple(next_degree)
                expanded[key] = expanded.get(key, 0) + value*signed
        out = expanded
    return out


def check(n, r, permuted, singular):
    indices = list(range(n))
    sigma = [(i+1) % n for i in indices] if permuted else indices
    hadamard = [[(-1)**((i & j).bit_count()) for j in range(1,r+1)] for i in indices]
    right = [hadamard[i] for i in sigma]
    entries = [[sum(x*s*y for x,s,y in zip(row,singular,col))/n
                for col in right] for row in hadamard]
    lhs = coefficients(hadamard, r)
    rhs = coefficients(right, r)
    gaussian = [F(0)]*(n+1)
    for powers, left in lhs.items():
        k = sum(powers)
        gaussian[k] += left*rhs[powers]*prod(
            factorial(j)*(s/n)**j for j,s in zip(powers,singular))
    c = [val * n**k * F(factorial(n-k), factorial(n)) for k,val in enumerate(gaussian)]
    homogeneous = [F(1)] + [F(0)]*n
    for s in singular:
        for k in range(1,n+1):
            homogeneous[k] += s * homogeneous[k-1]
    for k, val in enumerate(c):
        factor = F(n**n, comb(n,k)*k**k*(n-k)**(n-k))
        assert abs(val) <= factor * homogeneous[k]
    for j in range(n+1):
        t = F(j-2, 3)
        rows = [[F(1,n)+t*item for item in row] for row in entries]
        assert sum(v*t**k for k,v in enumerate(c)) == permanent(rows)*F(n**n, factorial(n))
    return n+1


if __name__ == "__main__":
    count = 0
    for n in [4,8]:
        for r in range(1,4):
            for permuted in [False, True]:
                count += check(n,r,permuted,[F(i+1,2*r+1) for i in range(r)])
    print(f"Passed {count} exact normalized coefficient bounds and {count} polynomial evaluations.")
