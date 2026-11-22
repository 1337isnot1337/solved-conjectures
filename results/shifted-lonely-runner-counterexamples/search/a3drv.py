"""a3s (speed-change heat-bath) + SLP + exact certify. usage: a3drv.py n Vmax ps seeds [mult] [margin] [T0] [init]"""
import sys, os, subprocess, time, json
from hyb import slp, certify, log
n = int(sys.argv[1]); Vmax = int(sys.argv[2]); ps = float(sys.argv[3]); seeds = int(sys.argv[4])
mult = float(sys.argv[5]) if len(sys.argv) > 5 else 0.4; margin = float(sys.argv[6]) if len(sys.argv) > 6 else 0.3; T0 = sys.argv[7] if len(sys.argv) > 7 else '20'
init = sys.argv[8] if len(sys.argv) > 8 else '-'; F0 = os.environ.get('F0', '0'); MB = os.environ.get('MB', '8192'); off = int(os.environ.get('SEEDOFF', '0'))
G = max(12000, 500 * n); res = []
for k in range(seeds):
    seed = 9000 + 100 * n + k + off; t = time.time()
    p = subprocess.run(['/home/claude/slr_ideas/a3s', str(n), str(G), str(int(30000 * n * mult)), str(seed), repr(1 / (n + 1 + margin)), T0, '0.5', str(Vmax), str(ps), init, MB, F0, os.environ.get('KC', '0')], capture_output=True, text=True)
    out = p.stdout.split(); cost = int(out[0]); v = [int(x) for x in out[1::2][:n]]; s = [float(x) for x in out[2::2][:n]]
    s2, g = slp(v, s, [0] + [1] * (n - 1)); E = 1 / g - (n + 1); extra = ''
    if E > 0:
        c = certify(v, s2)
        if c:
            gex, m = c; fn = '/home/claude/slr_ideas/scert_%d_%d.json' % (n, seed)
            json.dump([{"n": n, "speeds": v, "shift_den": 10**6, "shift_num": m, "gamma": str(gex)}], open(fn, 'w')); extra = 'CERT %s E=%.4f %s' % (gex, float(1/gex) - n - 1, fn)
    sv = sorted(v); missing = [x for x in range(1, n + 1) if x not in sv]; big = [x for x in sv if x > n]
    res.append((cost, E))
    log('n=%d Vmax=%d ps=%.2f seed=%d cost=%d E=%.4f %.0fs missing=%s extra=%s %s' % (n, Vmax, ps, seed, cost, E, time.time() - t, missing, big, extra))
    json.dump({"v": v, "s": list(s2), "E": E}, open('/home/claude/slr_ideas/sstate_%d_%d.json' % (n, seed), 'w'))
c = sorted(x[0] for x in res); E = sorted(x[1] for x in res)
log('SUMMARY n=%d Vmax=%d ps=%.2f runs=%d median_cost=%s min_cost=%d success=%d bestE=%.4f medianE=%.4f' % (n, Vmax, ps, len(res), c[len(c) // 2], c[0], sum(e > 0 for e in E), E[-1], E[len(E) // 2]))
