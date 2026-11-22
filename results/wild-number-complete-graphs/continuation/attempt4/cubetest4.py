import sys, json, itertools, subprocess, time
from gen13 import build, write
k = 0
cl, nv, y, bad, cov, NY = build(k, 'none', False, False)
c = json.load(open('best_k0.json'))
verts = [int(x) for x in sys.argv[1].split(',')]
units = []
for (e, col), v in y.items():
    if e[0] in verts or e[1] in verts:
        units.append([v] if c['%d-%d' % e] == col else [-v])
write(cl + units, nv, 'cube.cnf')
t0 = time.time()
r = subprocess.run(['nice', '-n', '19', 'bin/kissat', '-q', '--time=%s' % sys.argv[2], 'cube.cnf'], capture_output=True, text=True)
print(verts, len(units), r.stdout.strip().splitlines()[0] if r.stdout.strip() else r.stdout, '%.1fs' % (time.time() - t0))
