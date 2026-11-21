"""Exact monomer comparisons and finite radial derivatives for graph powers."""
from fractions import Fraction
from verify import jerrum_graph, multiply, rook_polynomial


def graph(f):
    n, edges = jerrum_graph(f=f)
    coefficients = rook_polynomial(n, edges)
    assert coefficients[n] == 3 * 32**f
    assert 3 * coefficients[n-1] >= 2**f * coefficients[n]
    return coefficients


def monomer_ratio(rook, w):
    """Unmatched probability divided by 1/(1+w) at activity w(w+1)."""
    n = len(rook)-1
    z = w*(w+1)
    terms = [v*z**k*3**(n-k) for k,v in enumerate(rook)]
    return Fraction((1+w)*sum((n-k)*v for k,v in enumerate(terms)), n*sum(terms))


def radial_sign(rook, w):
    """Sign of the finite derivative at w/(1+w), using the perfecting factorial."""
    n = len(rook)-1
    scale = w*n
    factor = scale**n
    total = 0
    for k in range(n,-1,-1):
        total += rook[k] * factor * (k-(n-k)*w)
        if k:
            factor = (factor // scale) * 3*(n-k+1)
    return (total > 0) - (total < 0)


if __name__ == '__main__':
    small, large = graph(10), graph(35)
    comparisons = []
    for exponent in [0,8,14,20,26]:
        w = 2**exponent
        ratio = (999*monomer_ratio(small,w)+monomer_ratio(large,w))/1000
        comparisons.append((ratio < 1) - (ratio > 1))
    assert comparisons == [1,-1,1,-1,1]
    print("five exact limiting derivative signs:", comparisons)

    copy = small
    for m in (1,2,4,8,16):
        if m > 1:
            copy = multiply(copy, copy)
        signs = [radial_sign(copy,w) for w in (16,256,4096)]
        print("copies", m, "finite derivative signs at w=16,256,4096:", signs)
        assert signs[:2] == [1,-1]
