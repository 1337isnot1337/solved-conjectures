"""Brute-force test of the lex-leader clause pattern used in gen13.py / cubesb.py: for random permutations g of
n<=6 variables, the clauses (projected to x) accept exactly {x : x <=lex g(x)} (false < true)."""
import itertools, random
from pysat.solvers import Solver
def enc(xs, zs, top):
    cl = []; e_prev = None
    for i, (x, z) in enumerate(zip(xs, zs)):
        cl.append([-x, z] if e_prev is None else [-e_prev, -x, z])
        if i == len(xs) - 1: break
        top += 1; en = top
        if e_prev is None: cl += [[x, z, en], [-x, -z, en]]
        else: cl += [[-e_prev, x, z, en], [-e_prev, -x, -z, en]]
        e_prev = en
    return cl
rng = random.Random(3); tests = 0
for t in range(300):
    n = rng.randint(2, 6); g = list(range(n)); rng.shuffle(g)
    order = list(range(n)); xs = [i + 1 for i in order if g[i] != i]; zs = [g[i] + 1 for i in order if g[i] != i]
    cl = enc(xs, zs, n)
    for bits in itertools.product([0, 1], repeat=n):
        gx = [bits[g[i]] for i in range(n)]
        want = list(bits) <= gx
        with Solver(bootstrap_with=cl) as S:
            got = S.solve(assumptions=[(i + 1) if bits[i] else -(i + 1) for i in range(n)])
        assert want == got, (g, bits); tests += 1
print('ok', tests)
