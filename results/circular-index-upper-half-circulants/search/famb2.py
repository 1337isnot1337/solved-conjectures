import sys, famb
def mk(g):
    n = 6*g+1
    allowed = {1, 2*g+1, 2*g+2}
    ln = lambda v, w: min((w-v) % n, (v-w) % n)
    def extra(cnf, pool, n_, Y, F):
        for j in range(2):
            for t in range(3):
                for v in range(n):
                    for w in range(v+1, n):
                        if ln(v, w) not in allowed: cnf.append([-F(j, t, v, w)])
    return extra
g = int(sys.argv[1]); D = int(sys.argv[2])
n = 6*g+1; ln = lambda e: min((e[1]-e[0]) % n, (e[0]-e[1]) % n)
res = famb.run(g, D, [1, 2*g+1, 2*g+2], extra=mk(g))
if res[0] == 'sat':
    _, base, blocks, dt, deg, val = res
    print("g=%d D=%d SAT %.1fs value=%s Delta=%d" % (g, D, dt, val, max(deg)))
    for b in base: print("  base", b, [ln(e) for e in b])
    for j, bl in enumerate(blocks):
        for t, F in enumerate(bl): print("  block", j, t, [(e, ln(e)) for e in F if ln(e) > 1], "+len1:", [e for e in F if ln(e) == 1])
else: print("g=%d D=%d %s %.1fs" % (g, D, res[0], res[-1]))
