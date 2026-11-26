"""Build and check exact primal/dual certificates without an LP solver."""
from fractions import Fraction as F
import argparse


def published(n):
    if n % 2 == 0:
        return max(F(2*(n*n-2*t*(t+1)), 2*n-2*t-1)
                   for t in range(n//2+1))
    return max(
        max(F(n*n+1-8*k*k, n-2*k) for k in range((n+1)//4+1)),
        max(F(n*n-1-8*k*(k+1), n-2*k-1) for k in range((n-1)//4+1)),
    )


def certificate(n):
    from math import isqrt
    N = n-1
    Np = N % 2
    if n % 2:
        A = N*(N+2)//2
        L = isqrt(A)
        t = N-L
        costs = {s % 2:F(A+1-s*s,2*(N-s+1)) for s in (t,t+1)}
        W = max(costs.values())
        scale = {p:W/(2*costs[p]) for p in (0,1)}
        if W == costs[t % 2]:
            winning = (t % 2,L)
        else:
            winning = ((t+1) % 2,L-1)
    else:
        W,t = max((F(n*n-2*t*(t+1),2*(2*n-2*t-1)),t) for t in range(n//2+1))
        L = N-t
        scale = {0:F(1,2),1:F(1,2)}
        winning = (None,L)
    assert 4*W == published(n), (n,W,winning)

    def boundary(a):
        q = (a+1)*(N-a+1)
        if n % 2:
            return scale[a % 2] * (1+F(N*(2*a-N),2*q))
        endpoint = L if (L-a) % 2 == 0 else L-1
        z0 = (endpoint+1)*W
        return (z0+N*(a-endpoint)-F(a*a-endpoint*endpoint,2))/q

    h = [F(0) for _ in range(L+1)]
    for a in range(L-1):
        h[a+2] = h[a]
        if a >= t:
            h[a+2] += 2*boundary(a)/(N-a-1)
    if not n % 2:
        vs = range(-L+(L+1)%2,L+1,2)
        count = len(vs)
        shift = F(1,2)-(W+sum(h[abs(v)] for v in vs))/count
        for a in range(1,L+1,2):
            h[a] += shift

    rows = {}
    for u in range(-N,N+1):
        a = abs(u)
        B = N-a
        vs = list(range(-B,B+1,2))
        if a <= L:
            values = [scale[a % 2]+h[a]-h[abs(v)] if abs(v)<=L else F(0) for v in vs]
        elif B == 0:
            values = [W]
        else:
            values = [F(1)+(W-len(vs))/2 if abs(v)==B else F(1) for v in vs]
        assert sum(values) == W and min(values) >= 0, (n,u)
        rows[u] = dict(zip(vs,values))

    # Check adjacent-row transport independently via a greedy mass coupling.
    # Matching in sorted order is the one-dimensional monotone coupling.
    for u in range(-N,N):
        rows_a = [[v,m] for v,m in rows[u].items() if m]
        rows_b = [[v,m] for v,m in rows[u+1].items() if m]
        i = j = 0
        while i < len(rows_a) and j < len(rows_b):
            v,x = rows_a[i]
            w,y = rows_b[j]
            assert abs(v-w) == 1, (n,u,v,w)
            moved = min(x,y)
            rows_a[i][1] -= moved
            rows_b[j][1] -= moved
            if not rows_a[i][1]:
                i += 1
            if not rows_b[j][1]:
                j += 1
        assert (i,j) == (len(rows_a),len(rows_b))
    for u,row in rows.items():
        for v,x in row.items():
            assert x+rows[v][u] >= 1, (n,u,v)

    parity,L0 = winning
    def vertex(i,j):
        u,v = i+j-N,i-j
        return int(abs(u)<=L0 and abs(v)<=L0 and (parity is None or u%2==parity))
    total = sum(vertex(i,j) for i in range(n) for j in range(n))
    max_path = 0
    for reflect in (False,True):
        dp = [[0]*n for _ in range(n)]
        for i in range(n):
            for j in range(n):
                below = dp[i-1][j] if i else 0
                left = dp[i][j-1] if j else 0
                dp[i][j] = vertex(i,n-1-j if reflect else j) + max(left,below)
        max_path = max(max_path,dp[-1][-1])
    assert F(2*total,max_path) == 4*W
    return sum(map(len,rows.values())),2*N


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--limit",default=100,type=int)
    ap.add_argument("--also",default=[],nargs="*",type=int)
    args = ap.parse_args()
    orders = sorted({*range(4,args.limit+1),*args.also})
    cells = transitions = 0
    for n in orders:
        x,y = certificate(n)
        cells += x
        transitions += y
    print(f"{len(orders)} orders through {max(orders)}; "
          f"{cells:,} exact cell covers, {transitions:,} mass couplings, both primal paths")


if __name__ == "__main__":
    main()
