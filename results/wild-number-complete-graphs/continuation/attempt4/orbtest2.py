"""Check: the star of x0=6 in an abstract colouring (and its random G-images) has an orbit code in the list,
and realise(code) reproduces that code (round trip). Code of a star f: multiset of components."""
import json, random
from orbits import gen, realise, canon_cycle
c = json.load(open('best_k0.json')); col = {tuple(map(int, e.split('-'))): v for e, v in c.items()}
H = list(range(6)); N = [6, 7, 8]; x0 = 6
def code(f, typ):
    comps = []; seen = set()
    img = set(v for v in f.values() if isinstance(v, int) and v < 9)
    for s in f:
        if s in img: continue                     # path starts at a vertex not in the image
        p = [s]
        while f[p[-1]] < 9: p.append(f[p[-1]])
        seen.update(p); comps.append(('PS', ''.join(typ[v] for v in p)))
    for s in f:
        if s in seen: continue
        cyc = [s]; seen.add(s)
        while f[cyc[-1]] != s: cyc.append(f[cyc[-1]]); seen.add(cyc[-1])
        comps.append(('C', canon_cycle(''.join(typ[v] for v in cyc))))
    return sorted(comps)
typ = {v: 'H' for v in H}; typ.update({v: 'N' for v in N})
orbs = [sorted(o) for o in gen({'H': 6, 'N': 2}, ['H', 'N'], 4)]
rng = random.Random(1); ok = 0
for t in range(200):
    a = H[:]; rng.shuffle(a); b = N[:]; rng.shuffle(b); d = [9, 10, 11, 12]; rng.shuffle(d)
    p = dict(zip(H, a)); p.update(zip(N, b)); p.update(zip([9, 10, 11, 12], d))
    g = {}
    for (u, v), cc in col.items():
        e = tuple(sorted((p[u], p[v]))); g[e] = p[cc]
    # star of x0 in g
    f = {v: g[tuple(sorted((x0, v)))] for v in range(9) if v != x0}
    cd = code(f, typ); assert cd in orbs, cd
    vb = {'H': H, 'N': [7, 8]}
    f2 = realise(cd, vb, [9, 10, 11, 12]); assert code(f2, typ) == cd
    ok += 1
print('ok', ok)
