#!/usr/bin/env python3
"""Tight (p,q)-edge-colourings by SAT, with 'vertex v plays at colour c' variables.

n = 2m+1 vertices, colours Z_p, every q consecutive colour classes pairwise
disjoint.  Every colour class has exactly k edges (k given), so |E| = p*k.
Degrees: listed deficiencies (default: as equal as possible), max degree D.
Certified bounds: |E|/m <= chi'_c <= p/q.
With k = 0 the class sizes are free and the number of edges is (n*D - d)/2
for the deficiency d given as the 8th argument.
usage: sat2.py D n p q k [seed] [solver] [d]"""
import sys, itertools, json, time, random
from pysat.solvers import Solver
from pysat.card import CardEnc, EncType
D, n, p, q, k = map(int, sys.argv[1:6])
seed = int(sys.argv[6]) if len(sys.argv) > 6 else 0
sname = sys.argv[7] if len(sys.argv) > 7 else 'cadical153'
m = (n - 1) // 2
dsum = n * D - 2 * p * k if k else int(sys.argv[8])
assert dsum >= 0 and (n * D - dsum) % 2 == 0, "bad edge count"
NE = (n * D - dsum) // 2
deg = [D] * n
for i in range(dsum): deg[n - 1 - (i % n)] -= 1            # deficient vertices are the last ones
E = list(itertools.combinations(range(n), 2)); eid = {e: i for i, e in enumerate(E)}
P = lambda v, c: 1 + v * p + (c % p)
Y = lambda e, c: 1 + n * p + eid[e] * p + (c % p)
top = n * p + len(E) * p
cl = []
def card(lits, b, kind):
    global top
    f = {'le': CardEnc.atmost, 'ge': CardEnc.atleast, 'eq': CardEnc.equals}[kind]
    enc = f(lits=lits, bound=b, top_id=top, encoding=EncType.seqcounter)
    top = max(top, enc.nv); cl.extend(enc.clauses)
inc = {v: [e for e in E if v in e] for v in range(n)}
for v in range(n):
    for c in range(p):
        # window: v plays at most once in q consecutive colours
        for j in range(1, q): cl.append([-P(v, c), -P(v, c + j)])
        # v plays at c iff exactly one incident edge has colour c
        ys = [Y(e, c) for e in inc[v]]
        cl.append([-P(v, c)] + ys)
        for y in ys: cl.append([-y, P(v, c)])
        for a, b in itertools.combinations(ys, 2): cl.append([-a, -b])
    card([P(v, c) for c in range(p)], deg[v], 'eq')
if k:
    for c in range(p): card([P(v, c) for v in range(n)], 2 * k, 'eq')
for e in E: card([Y(e, c) for c in range(p)], 1, 'le')
# symmetry breaking: colour 0 is the matching 01, 23, ...; colour 1 is the next 2k vertices
for i in range(k): cl.append([Y((2 * i, 2 * i + 1), 0)])
if not k: cl.append([Y((0, 1), 0)])
if k and q >= 2 and 4 * k <= n:
    for i in range(k): cl.append([Y((2 * k + 2 * i, 2 * k + 2 * i + 1), 1)])
random.seed(seed)
if seed: random.shuffle(cl)
t0 = time.time()
s = Solver(name=sname, bootstrap_with=cl)
print(f"D={D} n={n} (p,q)=({p},{q}) k={k} |E|={NE} degrees {sorted(set(deg))} : {top} vars {len(cl)} clauses; {NE}/{m}={NE/m:.4f} <= chi'_c <= {p/q:.4f}", flush=True)
ok = s.solve()
print("SAT" if ok else "UNSAT", f"{time.time()-t0:.1f}s", flush=True)
if ok:
    mdl = set(l for l in s.get_model() if l > 0)
    col = {f"{e[0]}-{e[1]}": c for e in E for c in range(p) if Y(e, c) in mdl}
    json.dump({"Delta": D, "n": n, "p": p, "q": q, "edges": col}, open(f"cert_D{D}_n{n}_p{p}_q{q}.json", "w"))
