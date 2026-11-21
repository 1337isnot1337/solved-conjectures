"""Exact exploratory screen of Gutierrez--Krattenthaler Conjecture 2.

Positive finite checks are not a resolution.  Products are computed by
Kronecker substitution at a rigorously oversized power of two.  Each checked
coefficient is an exact integer, including the signed character differences.
"""
import argparse
import json
import time


class QuantumPascal:
    def __init__(self, max_n):
        self.max_n = max_n
        # The coefficient l1 norm of either product is at most 2**(2*max_n).
        # Multiplying their difference by (1-t) has norm at most 2**(2*max_n+2).
        self.bits = ((2 * max_n + 5 + 7) // 8) * 8
        self.block = self.bits // 8
        self.base = 1 << self.bits
        self.rows = [[1]]
        for n in range(1, max_n + 1):
            prev = self.rows[-1]
            row = []
            for k in range(n // 2 + 1):
                p = prev[min(k, n - 1 - k)] if k <= n - 1 else 0
                q = prev[min(k - 1, n - k)] if k else 0
                row.append(p + (q << (self.bits * (n - k))))
            self.rows.append(row)

    def gaussian(self, n, k):
        if n < 0 or k < 0 or k > n:
            return 0
        return self.rows[n][min(k, n-k)]

    def coefficients(self, val, count):
        """Decode possibly signed coefficients with absolute value < base/2."""
        val &= (1 << (count * self.bits)) - 1
        data = val.to_bytes(count * self.block, 'little')
        carry = 0
        half = self.base // 2
        for start in range(0, len(data), self.block):
            digit = int.from_bytes(data[start:start + self.block], 'little') + carry
            if digit >= half:
                yield digit - self.base
                carry = 1
            else:
                yield digit
                carry = 0

    def check(self, n, k, alpha, beta, gap):
        # Central term is j=1; second central term is j=1+gap.
        pairs = [(n,k), (n-gap*alpha,k+gap*beta),
                 (n+alpha,k-beta), (n-(gap+1)*alpha,k+(gap+1)*beta)]
        if any(N < K or K < 0 or N > self.max_n for N,K in pairs):
            return None
        a,b,c,d = [self.gaussian(N,K) for N,K in pairs]
        dp = sum(N*K-K*K for N,K in pairs[:2])
        dq = sum(N*K-K*K for N,K in pairs[2:])
        assert dp-dq == 2*beta*(alpha+beta)*(gap+1)
        shift = (dp-dq)//2
        assert shift >= 0
        diff = a*b - ((c*d) << (self.bits * shift))
        # A centered Laurent polynomial is an SL2 character iff its successive
        # ordinary coefficients increase from the left endpoint to the center.
        char = diff - (diff << self.bits)
        for j, coeff in enumerate(self.coefficients(char, dp//2+1)):
            if coeff < 0:
                return {'n':n,'k':k,'alpha':alpha,'beta':beta,'gap':gap,
                        'degree':dp,'coefficient_index':j,
                        'character_coefficient':coeff,'pairs':pairs}
        return False


def main():
    ap=argparse.ArgumentParser()
    ap.add_argument('--max-n',type=int,default=40)
    ap.add_argument('--max-step',type=int,default=5)
    ap.add_argument('--max-gap',type=int,default=3)
    args=ap.parse_args()
    q=QuantumPascal(args.max_n+args.max_step+args.max_gap+1)
    assert list(q.coefficients(q.gaussian(4,2),5)) == [1,1,2,1,1]
    assert list(q.coefficients(1-q.base+q.base*q.base,3)) == [1,-1,1]
    checked=0
    start=time.monotonic()
    for n in range(1,args.max_n+1):
        for k in range(n+1):
            for alpha in [-1]+list(range(1,args.max_step+1)):
                for beta in range(1,args.max_step+1):
                    if alpha==-1 and beta==1:  # a known column by symmetry
                        continue
                    for gap in range(args.max_gap+1):
                        result=q.check(n,k,alpha,beta,gap)
                        if result is None:
                            continue
                        checked+=1
                        if result:
                            print(json.dumps({'counterexample':result,'checked':checked,
                                              'seconds':time.monotonic()-start}),flush=True)
                            return
        if n%5==0:
            print(json.dumps({'max_n':n,'checked':checked,
                              'seconds':round(time.monotonic()-start,3)}),flush=True)
    print(json.dumps({'status':'no counterexample in bounded screen',
                      'checked':checked,'seconds':time.monotonic()-start}),flush=True)


if __name__=='__main__':
    main()
