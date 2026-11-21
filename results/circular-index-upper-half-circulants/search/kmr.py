import sys, time
from fixsat import solve, verify
from fractions import Fraction
def graph(m, extra):
    n = 2*m+1
    R = {(2*i, 2*i+1) for i in range(m)} | set(extra)
    E = [(a,b) for a in range(n) for b in range(a+1,n) if (a,b) not in R]
    return n, E, R
m = int(sys.argv[1]); mode = sys.argv[2] if len(sys.argv)>2 else 'j1'
n = 2*m+1
extra = {'j1': [(0, 2*m)], 'j1b': [(1, 2*m)]}[mode]
n, E, R = graph(m, extra)
val = Fraction(len(E), m); p, q = val.numerator, val.denominator
deg = [sum(1 for e in E if v in e) for v in range(n)]
t = time.time()
st, cls = solve(n, E, p, q)
print("m=%d n=%d R=%s Delta=%d value=%s=Delta+%s : %s %.1fs" % (m, n, sorted(R), max(deg), val, val-max(deg), st, time.time()-t), flush=True)
if st == 'sat':
    verify(n, E, p, q, cls); print("  sequence:", [cls[c] for c in range(p)])
