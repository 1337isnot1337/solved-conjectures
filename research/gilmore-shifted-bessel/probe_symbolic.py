from sympy.polys.rings import ring
from sympy.polys.domains import ZZ
from itertools import combinations
import time

R, t, x = ring('t,x', ZZ)


def rows(N, r, s, mu):
    q = r * s * mu
    qnums = [R.zero] + [sum((r**j * s**(k-1-j) for j in range(k)), R.zero)
                         for k in range(1, N+1)]
    a = [[R.one]]
    p = [R.one]
    for n in range(1, N+1):
        b = [R.zero] * (n+2)
        for k in range(n, 0, -1):
            b[k] = qnums[k]*b[k+1] + mu**(n-k)*a[-1][k-1]
        a.append(b[:-1])
        p.append(sum((a[n][k]*q**(k*(k-1)//2)*x**k for k in range(n+1)), R.zero))
    return p


def det(a):
    a = [row[:] for row in a]
    prev = R.one
    for k in range(len(a)-1):
        if not a[k][k]:
            raise ValueError('zero pivot')
        for i in range(k+1, len(a)):
            for j in range(k+1, len(a)):
                a[i][j] = (a[i][j]*a[k][k] - a[i][k]*a[k][j]).exquo(prev)
        prev = a[k][k]
    return a[-1][-1]


if __name__ == '__main__':
    start = time.time()
    for params in [(1+t,R.one,R.one), (R.one,R.one,1+t),
                   (1+t,1+t,R.one), (1+t,R.one,1+t), (1+t,1+t,1+t)]:
        p = rows(12,*params)
        total = 0
        for size in (2,3,4):
            for offset in range(0, 5):
                aa = list(range(size))
                bb = list(range(offset, offset+size))
                value = det([[p[i+j] for j in bb] for i in aa])
                bad = [(mon,c) for mon,c in value.items() if c<0]
                if bad:
                    print('FAIL',params,aa,bb,bad[:8],flush=True)
                    raise SystemExit
                total += 1
        print('PASS',params,total,'minors;',round(time.time()-start,2),'seconds',flush=True)
