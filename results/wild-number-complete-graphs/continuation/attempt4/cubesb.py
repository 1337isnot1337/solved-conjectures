"""Residual symmetry breaking inside a cube: automorphisms of the x0-star rho inside Stab_G(x0)
(brute force over Stab_G(x0)), lex-leader constraints (edge-major order, false<true) for up to MAXG of them.
Sound: Stab(rho) maps the set of counterexamples with star rho onto itself; the lex-min element of each
Stab(rho)-orbit satisfies x <=lex g(x) for all g in Stab(rho)."""
import itertools
def stab_autos(k, x0, f, colD, N, Dsym, fixedD):
    H2 = [u for u in colD if u != x0]; N2 = [u for u in N if u != x0]
    autos = []
    for a in itertools.permutations(H2):
        pa = dict(zip(H2, a))
        # quick prune: f must be preserved on H2 part as far as possible
        for b in itertools.permutations(N2):
            p = dict(pa); p.update(zip(N2, b)); p[x0] = x0
            # induced sink map: forced by f
            q = {}; ok = True
            for v, c in f.items():
                c2 = f[p[v]]
                if c in p:            # vertex colour
                    if p[c] != c2: ok = False; break
                else:
                    if c in fixedD:
                        if c2 != c: ok = False; break
                    elif c2 in fixedD or (c in q and q[c] != c2): ok = False; break
                    q[c] = c2
            if not ok: continue
            usedD = [d for d in Dsym if d in q]; freeD = [d for d in Dsym if d not in q]
            imgs = set(q.values()); freeImg = [d for d in Dsym if d not in imgs]
            for r in itertools.permutations(freeImg):
                m = list(range(13))
                for v, w in p.items(): m[v] = w
                for d, e in q.items(): m[d] = e
                for d, e in zip(freeD, r): m[d] = e
                if m != list(range(13)): autos.append(m)
    return autos
def lex_clauses(autos, y, edges, cols, new, maxg=60):
    cl = []
    order = [y[e, c] for e in edges for c in cols if (e, c) in y]
    inv = {v: ec for ec, v in y.items()}
    for m in autos[:maxg]:
        xs, zs = [], []
        for v in order:
            (a, b), c = inv[v]
            a2, b2 = m[a], m[b]; e2 = (a2, b2) if a2 < b2 else (b2, a2)
            w = y[e2, m[c]]
            if w != v: xs.append(v); zs.append(w)
        e_prev = None
        for i, (x, z) in enumerate(zip(xs, zs)):
            cl.append([-x, z] if e_prev is None else [-e_prev, -x, z])
            if i == len(xs) - 1: break
            en = new()
            if e_prev is None: cl += [[x, z, en], [-x, -z, en]]
            else: cl += [[-e_prev, x, z, en], [-e_prev, -x, -z, en]]
            e_prev = en
    return cl
