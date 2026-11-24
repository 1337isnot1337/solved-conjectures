"""Finite diagnostic for the support-reduction construction in README.md.

Tests only the unbalanced collision lemma and extension step, not the imported
matroid equitability theorem or the unrestricted AJT conjecture. All arithmetic
is exact over prime fields. Python 3.8+; standard library only.
"""
import itertools
import random


def rank_mod(rows, p, n):
    R = [list(r) for r in rows]
    i = 0
    for j in range(n):
        k = next((k for k in range(i, len(R)) if R[k][j] % p), None)
        if k is None:
            continue
        R[i], R[k] = R[k], R[i]
        a = pow(R[i][j] % p, -1, p)
        R[i] = [(a*x) % p for x in R[i]]
        for k in range(i+1, len(R)):
            a = R[k][j]
            if a:
                R[k] = [(x-a*y) % p for x, y in zip(R[k], R[i])]
        i += 1
        if i == len(R):
            break
    return i


def dot(x, y, p):
    return sum(a*b for a, b in zip(x, y)) % p


def random_basis(n, p, rng):
    B = []
    while len(B) < n:
        v = tuple(rng.randrange(p) for _ in range(n))
        if rank_mod(B+[v], p, n) > len(B):
            B.append(v)
    return B


def test(p, n, N, rng):
    checked = 0
    for _ in range(N):
        B = random_basis(n, p, rng)
        C = random_basis(n, p, rng)
        E = B+C
        v = tuple(rng.randrange(p) for _ in range(n))
        if not any(v):
            continue
        S = [i for i, f in enumerate(E) if dot(f, v, p)]
        b = sum(i < n for i in S)
        c = len(S)-b
        if max(b, c) > p-2:
            continue
        U = [E[i] for i in range(n) if i not in S]
        T = [E[i] for i in range(n, 2*n) if i not in S]
        z = {i: tuple(x*pow(dot(E[i], v, p), -1, p) % p
                      for x in E[i]) for i in S}
        a = [rng.randrange(p) for _ in E]
        alpha = {i: a[i]*pow(dot(E[i], v, p), -1, p) % p for i in S}
        W, rhs = [], []
        for j in range(min(b, c)-1):
            for i, h in itertools.combinations(S, 2):
                d = tuple((x-y) % p for x, y in zip(z[i], z[h]))
                if (rank_mod(U+W+[d], p, n) == len(U)+len(W)+1
                    and rank_mod(T+W+[d], p, n) == len(T)+len(W)+1):
                    W.append(d)
                    rhs.append((alpha[i]-alpha[h]) % p)
                    break
            else:
                raise AssertionError("no admissible difference")
        # Check directly every point satisfying the retained constraints and
        # collision equations. This does not assume the quotient proof.
        found = 0
        for w in itertools.product(range(p), repeat=n):
            if any(dot(d, w, p) != a for d, a in zip(W, rhs)):
                continue
            if any(dot(E[i], w, p) == a[i]
                   for i in range(2*n) if i not in S):
                continue
            found += 1
            forbidden = {(alpha[i]-dot(z[i], w, p)) % p for i in S}
            assert len(forbidden) <= max(b, c)+1
            lam = next(t for t in range(p) if t not in forbidden)
            x = tuple((u+lam*s) % p for u, s in zip(w, v))
            assert all(dot(f, x, p) != a[i] for i, f in enumerate(E))
        assert found
        checked += 1
    return checked


if __name__ == "__main__":
    rng = random.Random(138)
    for p, n in [(3, 2), (3, 3), (5, 3), (5, 4), (7, 4)]:
        print(p, n, test(p, n, 25, rng))
