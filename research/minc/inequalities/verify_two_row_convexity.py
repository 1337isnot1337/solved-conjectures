"""Integer Newton coefficients of the two-row curvature numerator."""
from fractions import Fraction as Q
from itertools import product
from math import comb


def numerator(a, b, s, z):
    m, r = a + s, b + z

    def side(a, b, m, r):
        positive = Q(r**2*(m+1)*(m+2)*a**2*(b-1), b*(a+1)*(a+2))
        negative = Q(2*m*r*(2*r-1)*a*(m+1), a+1)
        return positive-negative

    scaled = 6*m**2*r**2-m*r*(m+r)+side(a,b,m,r)+side(b,a,r,m)
    value = scaled * a*b*(a+1)*(a+2)*(b+1)*(b+2)
    assert value.denominator == 1
    return value.numerator


def main():
    # The denominator-cleared terms have degrees at most 6,6,2,2.
    bounds = [6,6,2,2]
    points = list(product(*(range(k+1) for k in bounds)))
    table = {(a,b,s,z): numerator(a+1,b+1,s,z) for a,b,s,z in points}
    for axis in range(4):
        fresh = {}
        for point in points:
            k = point[axis]
            total = 0
            for i in range(k+1):
                p = list(point)
                p[axis] = i
                total += (-1)**(k-i) * comb(k,i) * table[tuple(p)]
            fresh[point] = total
        table = fresh
    assert min(table.values()) >= 0
    print("positive differences:", sum(v > 0 for v in table.values()))
    for i in range(3):
        for j in range(3):
            print((i,j), sum(v > 0 for p,v in table.items() if p[2:] == (i,j)))
    for p in [(0,0,0,0),(9,8,3,4),(0,22,9,1),(31,0,1,17)]:
        value = sum(v*comb(p[0],a)*comb(p[1],b)*comb(p[2],s)*comb(p[3],z)
                    for (a,b,s,z),v in table.items())
        assert value == numerator(p[0]+1,p[1]+1,p[2],p[3])

    # Recover the curvature by differentiating the Bernoulli convolution
    # with the linear parameters along the radial path at its endpoint.
    probes = 0
    for a,b,s,z in product(range(1,4),range(1,4),range(3),range(3)):
        m,r=a+s,b+z
        n=m+r
        p=Q(m,n)
        params=[Q(1)]*s+[Q(0)]*z+[Q(a,a+b)]*(a+b)
        c=[[Q(0)]*3 for _ in range(n+1)]
        c[0][0]=1
        for i,q in enumerate(params):
            fresh=[[Q(0)]*3 for _ in range(n+1)]
            for k in range(i+1):
                for j in range(3):
                    fresh[k][j] += (1-q)*c[k][j]
                    fresh[k+1][j] += q*c[k][j]
                    if j<2:
                        fresh[k][j+1] -= (q-p)*c[k][j]
                        fresh[k+1][j+1] += (q-p)*c[k][j]
            c=fresh
        D=a*b*(a+1)*(a+2)*(b+1)*(b+2)
        assert 2*c[m][2]*n**2*D == c[m][0]*numerator(a,b,s,z)
        probes += 1
    print("independent curvature comparisons:", probes)


if __name__ == "__main__":
    main()
