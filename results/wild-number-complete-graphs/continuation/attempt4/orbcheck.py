import itertools
from orbits import gen, realise
def brute(nH, nN, nS, special):
    V = list(range(nH + nN)); H = V[:nH]; N = V[nH:]
    S = ['s%d' % i for i in range(nS)]; cols = V + S + (['d0'] if special else [])
    fs = []
    for img in itertools.permutations(cols, len(V)):
        if any(img[v] == v for v in V): continue
        fs.append(dict(zip(V, img)))
    def key(f): return tuple(sorted(f.items(), key=str))
    seen = set(); orbits = 0
    perms = [dict(zip(H, a)) | dict(zip(N, b)) for a in itertools.permutations(H) for b in itertools.permutations(N)]
    for f in fs:
        kf = key(f)
        if kf in seen: continue
        orbits += 1
        for p in perms:
            for q in itertools.permutations(S):
                qm = dict(zip(S, q)); qm['d0'] = 'd0'
                g = {p[v]: (p[c] if c in p else qm[c]) for v, c in f.items()}
                seen.add(key(g))
    return orbits
for nH, nN, nS, sp in [(2, 1, 2, False), (3, 1, 2, False), (2, 2, 2, False), (2, 2, 1, True), (3, 2, 2, False), (2, 2, 2, True)]:
    print(nH, nN, nS, sp, brute(nH, nN, nS, sp), len(gen({'H': nH, 'N': nN}, ['H', 'N'], nS, sp)))
