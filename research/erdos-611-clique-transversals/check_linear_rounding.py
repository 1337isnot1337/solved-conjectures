"""Independent finite regression for the fractional power-rounding lemma."""
import itertools
import random
import numpy as np
from scipy.optimize import linprog


def test(seed=611, repeats=180):
    rng = random.Random(seed)
    count = {}
    for rank in (2, 3, 4, 5, 6, 7, 8):
        best_ratio = 0
        for _ in range(repeats):
            n = rng.randrange(rank, 11)
            sets = {tuple(sorted(rng.sample(range(n), rng.randint(1,rank))))
                    for _ in range(rng.randrange(6,25))}
            sets = sorted(sets)
            # Mix ordinary costs, near-ties, and ratios spanning several orders.
            if _ % 3 == 0:
                weights = np.asarray([10 ** rng.uniform(-2, 2) for i in range(n)])
            elif _ % 3 == 1:
                weights = np.asarray([1 + 1e-4*rng.randrange(20) for i in range(n)])
            else:
                weights = np.asarray([float(rng.randrange(1,30)) for i in range(n)])
            mat = np.asarray([[int(i in s) for i in range(n)] for s in sets])
            lp = linprog(weights,A_ub=-mat,b_ub=-np.ones(len(sets)),
                         bounds=(0,None),method="highs")
            assert lp.success
            a = weights / lp.fun
            power = (2 if rank == 2 else 2*rank)
            # We validate the actual integral optimum, not the proof's selection rule.
            sm = [sum(1 << i for i in e) for e in sets]
            chosen = min(sum(a[i]**power for i in range(n) if m >> i & 1)
                         for m in range(1 << n) if all(m & h for h in sm))
            assert chosen <= 1+1e-6, (seed, rank, sets, weights, lp.fun, chosen)
            best_ratio = max(best_ratio, chosen)
            # Also test the actual constructive two-sample/single-atom rule.
            S = sum(1 << i for i in range(n) if lp.x[i] > 1e-8)
            dist = {}
            for h, q in zip(sm, -lp.ineqlin.marginals / lp.fun):
                if q > 1e-8:
                    dist[h & S] = dist.get(h & S, 0.0) + q
            assert abs(sum(dist.values()) - 1) < 1e-6
            F = max(dist, key=dist.get)
            def cost(mask):
                return sum(a[i] ** (2*rank) for i in range(n) if mask >> i & 1)
            if dist[F] > 0.5:
                h = min((i for i in range(n) if F >> i & 1), key=lambda i: a[i])
                T = (S & ~F) | (1 << h)
            else:
                T = min((S & ~(F & Fp) for F, Fp in itertools.combinations(dist,2)),
                        key=cost)
            assert all(T & h for h in sm)
            assert cost(T) <= 1 + 1e-6, (seed, rank, sets, lp.fun, T, cost(T))
        count[rank] = (repeats,best_ratio)
    for rank,(t,ratio) in count.items():
        print(f"rank={rank} cases={t} max normalized integral power cost={ratio:.9f}")


if __name__ == "__main__":
    test()
