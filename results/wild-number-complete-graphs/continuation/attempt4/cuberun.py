"""Isomorph-free cube-and-conquer for A13(k): cubes = Stab_G(x0)-orbit representatives of the star of x0.
Base CNF: exact bad indicators + cardinality |Bad| <= 34/35 (sound: |Inv| = 24-k, closed sets 10+k).
Inside each cube: lex-leader (<= 60 random elements, seed = cube index) for Stab(rho) (cubesb.py).
Soundness: every counterexample chi is G-equivalent to one whose x0-star is a representative (orbits.py),
and G maps counterexamples to counterexamples; the base CNF has NO other symmetry breaking.
Resumable: cubes already listed in the result file are skipped.
Result line: idx status seconds orbit.  Solver: bin/kissat (4.0.4, from pip wheel passagemath-kissat 10.8.14),
command:  nice -n 19 bin/kissat -q --unsat --time=TL cube.cnf proof.drat   (cube CNF = mkcube.py k x0type idx [w])
Usage: python3 cuberun.py k x0type start end timelimit [w]
   k=0: x0type N (light vertex).  k=1: x0type H or N with 'w' (x0 = w*, the W-vertex missed by the d0-edges)."""
import sys, subprocess, time, os
from orbits import gen, realise
from gen13 import build, write
import itertools, random
from cubesb import stab_autos, lex_clauses
k = int(sys.argv[1]); x0type = sys.argv[2]; a, b = int(sys.argv[3]), int(sys.argv[4]); tl = sys.argv[5]
wst = len(sys.argv) > 6 and sys.argv[6] == 'w'
cl, nv, y, bad, cov, NY = build(k, 'none', True, True)   # exact bad vars + |Bad| <= 34 (k=0) / 35 (k=1)
colD = list(range(6)) if k == 0 else list(range(5)); N = [u for u in range(9) if u not in colD]
x0 = colD[0] if x0type == 'H' else N[0]
vb = {'H': [u for u in colD if u != x0], 'N': [u for u in N if u != x0]}
counts = {t: len(v) for t, v in vb.items()}
if k == 0: orbs = gen(counts, ['H', 'N'], 4); sinks = [9, 10, 11, 12]; d0 = None
elif wst: orbs = gen(counts, ['H', 'N'], 3); sinks = [10, 11, 12]; d0 = None
else: orbs = gen(counts, ['H', 'N'], 3, True); sinks = [10, 11, 12]; d0 = 9
tag = 'k%d_%s%s' % (k, x0type, 'w' if wst else '')
resf = 'cubes/res_%s.txt' % tag
done = set()
if os.path.exists(resf):
    for l in open(resf):
        if 'UNSATISFIABLE' in l: done.add(int(l.split()[0]))
base = 'cubes/base_k%d_cnt.cnf' % k
write(cl, nv, base)
body = open(base).read().split('\n', 1)[1]
out = open(resf, 'a')
CAP = 2 * 10**9
def proofs_total():
    return sum(os.path.getsize(os.path.join('cubes', q)) for q in os.listdir('cubes') if q.endswith('.drat.gz'))
for i in range(a, min(b, len(orbs))):
    if i in done: continue
    f = realise(orbs[i], vb, sinks, d0)
    units = [y[(min(x0, v), max(x0, v)), c] for v, c in f.items()]
    if wst: units.append(-cov[x0, 9])
    autos = stab_autos(k, x0, f, colD, N, sinks, [] if d0 is None else [d0])
    for g in autos:
        for v, c in f.items(): assert f[g[v]] == g[c]
    random.Random(i).shuffle(autos)
    top = [nv]
    def new():
        top[0] += 1; return top[0]
    lx = lex_clauses(autos, y, list(itertools.combinations(range(9), 2)), list(range(13)), new, 60)
    fn = 'cubes/c_%s.cnf' % tag
    with open(fn, 'w') as fh:
        fh.write('p cnf %d %d\n' % (top[0], len(cl) + len(units) + len(lx)))
        fh.write(body)
        for u in units: fh.write('%d 0\n' % u)
        for c_ in lx: fh.write(' '.join(map(str, c_)) + ' 0\n')
    pf = 'cubes/p_%s_%d.drat' % (tag, i)
    t0 = time.time()
    cmd = ['nice', '-n', '19', 'bin/kissat', '-q', '--unsat', '--time=' + tl, fn]
    if proofs_total() < CAP: cmd.append(pf)          # beyond the 2 GB cap: no proof (regenerable, see docstring)
    r = subprocess.run(cmd, capture_output=True, text=True)
    st = [l for l in r.stdout.splitlines() if l.startswith('s ')]
    st = st[0].split()[1] if st else '?'
    dt = time.time() - t0
    if st != 'UNSATISFIABLE':
        if os.path.exists(pf): os.remove(pf)
    elif os.path.exists(pf):
        if proofs_total() < CAP:
            subprocess.run(['nice', '-n', '19', 'gzip', '-1', '-f', pf])
        else:
            os.remove(pf)
    out.write('%d %s %.2f sb%d %s\n' % (i, st, dt, len(autos) + 1, orbs[i])); out.flush()
    if st != 'UNSATISFIABLE':
        print('NOT UNSAT', i, st, orbs[i], flush=True)
        if st == 'SATISFIABLE':
            print('STOP: SAT cube', i, flush=True); sys.exit(2)
print('done', tag, a, b, len(orbs), flush=True)
