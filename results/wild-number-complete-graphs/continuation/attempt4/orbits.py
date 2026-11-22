"""Orbits of the star of a fixed vertex x0 under Stab_G(x0).
Star = injective map f: W\\{x0} -> colours (W\\{x0}) u Dc, f(v) != v  (edge x0-v has colour f(v)).
Stab acts by simultaneous relabelling inside each vertex type class and arbitrary relabelling of the
interchangeable D-colours (Dsym = those D-colours that are mutually interchangeable).
Orbits <-> isomorphism classes of the functional graph v -> f(v): disjoint cycles (len>=2) and paths ending
in a D-colour sink; components coded by type strings (cycles up to rotation). For k=1 the special
D-colour d0 is a distinguished sink (path may end at 'S' or at 'd0').
"""
import itertools
def canon_cycle(s):
    return min(s[i:] + s[:i] for i in range(len(s)))
def components(maxlen, types):
    comps = []
    for L in range(1, maxlen + 1):
        for s in itertools.product(types, repeat=L):
            s = ''.join(s)
            for end in ends:
                comps.append(('P' + end, s))
            if L >= 2 and canon_cycle(s) == s:
                comps.append(('C', s))
    return comps
def gen(counts, types, nsinks, special=False):
    global ends
    ends = ['S'] + (['0'] if special else [])
    comps = sorted(set(components(sum(counts.values()), types)))
    out = []
    def rec(i, rem, chosen, npaths, n0):
        if all(v == 0 for v in rem.values()):
            out.append(list(chosen)); return
        for j in range(i, len(comps)):
            kind, s = comps[j]
            need = {t: s.count(t) for t in types}
            if any(need[t] > rem[t] for t in types): continue
            np_ = npaths + (kind == 'PS'); n0_ = n0 + (kind == 'P0')
            if np_ > nsinks or n0_ > 1: continue
            for t in types: rem[t] -= need[t]
            chosen.append(comps[j]); rec(j, rem, chosen, np_, n0_); chosen.pop()
            for t in types: rem[t] += need[t]
    rec(0, dict(counts), [], 0, 0)
    return out
def realise(orbit, verts_by_type, sinks, d0=None):
    """return dict v -> colour"""
    pools = {t: list(vs) for t, vs in verts_by_type.items()}; sinks = list(sinks); f = {}
    for kind, s in orbit:
        vs = [pools[t].pop(0) for t in s]
        if kind == 'C':
            for a, b in zip(vs, vs[1:] + vs[:1]): f[a] = b
        else:
            for a, b in zip(vs, vs[1:]): f[a] = b
            f[vs[-1]] = d0 if kind == 'P0' else sinks.pop(0)
    return f
if __name__ == '__main__':
    # k=0, x0 heavy (vertex 0): other heavy 1..5 (type H), light 6..8 (type N), 4 interchangeable sinks
    o = gen({'H': 5, 'N': 3}, ['H', 'N'], 4); print('k0 x0 heavy:', len(o))
    o = gen({'H': 6, 'N': 2}, ['H', 'N'], 4); print('k0 x0 light:', len(o))
    o = gen({'H': 4, 'N': 4}, ['H', 'N'], 3, True); print('k1 x0 heavy:', len(o))
    o = gen({'H': 5, 'N': 3}, ['H', 'N'], 3, True); print('k1 x0 light:', len(o))
