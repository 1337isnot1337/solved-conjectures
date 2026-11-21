"""Exact diagnostics for BKS Conjecture 10.6; no finite test proves it.

Parameters a=pi[0]-1, c=pi[-1]-pi[0]>0, b=K-pi[-1].
N(j) counts the linear extensions of the j-chain overlap-one poset.
Uses integer exponential-polynomial coefficients of its order-polytope
integral. All determinant signs are exact.
"""
from math import comb, factorial, prod
from itertools import product


def packing_counts(a, b, c, occurrences):
    assert a >= 0 and b >= 0 and c >= 1
    d = a + b + c
    facts = [factorial(k) for k in range(d * occurrences + 2)]
    coeff = {0: 1}
    out = []
    scale = 1
    for j in range(1, occurrences + 1):
        nxt = {}
        for p, value in coeff.items():
            q = p + a + c
            w = value * comb(p + a, a)
            rising = 1
            for k in range(b + 1):
                if k:
                    rising *= q + k
                z = q + k
                nxt[z] = nxt.get(z, 0) + w * (-1)**k * comb(b, k) * rising
        coeff = {p:v for p,v in nxt.items() if v}
        scale *= facts[b]
        n = 1 + j * d
        numerator = sum(value * (facts[n] // facts[p+1]) for p,value in coeff.items())
        value, rem = divmod(numerator, scale)
        assert rem == 0 and value > 0, (a,b,c,j,value,rem)
        out.append(value)
    assert out[0] == 1
    return out


def leading_hankel_determinants(moments, size, shift=0):
    """Bareiss elimination returns every leading principal determinant."""
    matrix = [[moments[i+j+shift] for j in range(size)] for i in range(size)]
    previous = 1
    answer = []
    for k in range(size):
        pivot = matrix[k][k]
        answer.append(pivot)
        if pivot == 0:
            return answer
        for i in range(k+1,size):
            for j in range(i,size):
                numerator = matrix[i][j] * pivot - matrix[i][k] * matrix[k][j]
                value, rem = divmod(numerator, previous)
                assert rem == 0
                matrix[i][j] = matrix[j][i] = value
        previous = pivot
    return answer


def rooted_formula(b,c,j):
    d=b+c
    return prod(comb(i*d+b,b) for i in range(j))


def check_known_cases():
    for b,c in product(range(6),range(1,6)):
        got = packing_counts(0,b,c,9)
        assert got == [rooted_formula(b,c,j) for j in range(1,10)]
        assert got == packing_counts(b,0,c,9)
    for a,b,c in product(range(4),range(4),range(1,5)):
        assert packing_counts(a,b,c,6) == packing_counts(b,a,c,6)
        assert packing_counts(a,b,c,2)[1] == comb(2*a+c,a)*comb(2*b+c,b)


if __name__ == '__main__':
    import argparse,json,time
    parser=argparse.ArgumentParser()
    parser.add_argument('--max-a',type=int,default=5)
    parser.add_argument('--max-b',type=int,default=5)
    parser.add_argument('--max-c',type=int,default=10)
    parser.add_argument('--size',type=int,default=8)
    args=parser.parse_args()
    check_known_cases()
    print(json.dumps({'known_cases':'passed','minimal_unknown':packing_counts(1,1,3,8)}),flush=True)
    t=time.time(); checked=0
    for a in range(1,args.max_a+1):
        for b in range(a,args.max_b+1):
            for c in range(3,args.max_c+1):
                moments=packing_counts(a,b,c,2*args.size)
                for shift in (0,1):
                    dets=leading_hankel_determinants(moments,args.size,shift)
                    if any(x<=0 for x in dets):
                        print(json.dumps({'obstruction':(a,b,c),'shift':shift,'determinants':[str(x) for x in dets]}),flush=True)
                        raise SystemExit(1)
                checked+=1
    print(json.dumps({'parameter_triples':checked,'size':args.size,'signs':'all strictly positive','seconds':time.time()-t}),flush=True)
