"""Count check only (no decomposition test), j <= 2, larger n.  Uses bf.family / bf.formula."""
import random, sys
from factor import cyclic, random_nf, check
from bf import family, formula, find_F
from counts import params
rnd = random.Random(11)
for n in map(int, sys.argv[1:]):
    for name, col in [("cyc", cyclic(n)), ("rnd", random_nf(n, rnd))]:
        f = params(n)[0]; F = find_F(col, f, rnd)
        if F is None: print(n, name, "no F"); continue
        fam = family(col, F, 2)
        for j in (1, 2):
            if j > params(n)[2]//2: continue
            fj = fam.get(j, set())
            mx = max(sum(1 for M in fj if any(z in B for B in M)) for z in range(n) if z not in F)
            fo = formula(n, j)
            print(n, name, "f", f, "j", j, "max_z exact", mx, "formula", fo, "OK" if mx <= fo else "VIOLATION", flush=True)
