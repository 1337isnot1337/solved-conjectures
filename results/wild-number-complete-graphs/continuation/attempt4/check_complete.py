"""Check that every cube of a family has an UNSATISFIABLE line in its result file; report totals/timing."""
import sys
from orbits import gen
fam = {'k0_N': ({'H': 6, 'N': 2}, 4, False), 'k1_Nw': ({'H': 5, 'N': 3}, 3, False), 'k1_Hw': ({'H': 4, 'N': 4}, 3, False)}
for tag, (cnt, ns, sp) in fam.items():
    tot = len(gen(cnt, ['H', 'N'], ns, sp)); st = {}; t = 0.0; mx = 0.0
    try:
        for l in open('cubes/res_%s.txt' % tag):
            p = l.split(); i = int(p[0])
            if 'UNSATISFIABLE' in l:
                st[i] = 'U'; dt = float(p[2]) if p[1] == 'UNSATISFIABLE' else float(p[3]); t += dt; mx = max(mx, dt)
            elif i not in st: st[i] = p[1]
    except FileNotFoundError: pass
    nu = sum(1 for v in st.values() if v == 'U'); other = {i: v for i, v in st.items() if v != 'U'}
    print('%-6s cubes %4d  UNSAT %4d  missing %4d  other %s  cpu-wall sum %.0f s  max %.1f s' % (tag, tot, nu, tot - len(st), other, t, mx))
