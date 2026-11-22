import sys, subprocess
sys.path.insert(0, '/home/claude/probes')
from slr3 import slp
n, f = int(sys.argv[1]), sys.argv[2]; Gf = int(sys.argv[3]); iters = int(sys.argv[4]); T0, T1 = sys.argv[5], sys.argv[6]; margin = sys.argv[7]; seeds = int(sys.argv[8])
v = list(range(1, n+1))
for seed in range(seeds):
    o = subprocess.run(['./anneal3f', str(n), str(Gf), str(iters), str(seed), margin, T0, T1, 'init=' + f], capture_output=True, text=True)
    s = [float(x) for x in o.stdout.split()[1:]]
    s2, g = slp(v, s, 60); print("refine seed=%d fine-cost=%s traj=%s E=%.4f" % (seed, o.stdout.split()[0], o.stderr.strip(), 1/g-(n+1)), flush=True)
