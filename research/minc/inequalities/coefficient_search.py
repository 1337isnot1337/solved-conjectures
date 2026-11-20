"""Exploratory test of a centered-coefficient bound; numerical output is not proof.

Build locally: g++ -O3 -shared -fPIC subpermanent_grad.cpp -o subpermanent_grad.so
Run: python coefficient_search.py --max-n 10 --starts 20
"""
import argparse
import ctypes
import itertools
import json
import math
from pathlib import Path

import numpy as np
from scipy.linalg import helmert
from scipy.optimize import minimize

ROOT = Path(__file__).resolve().parent
LIB = ctypes.CDLL(str(ROOT / "subpermanent_grad.so"))
DPTR = np.ctypeslib.ndpointer(dtype=np.float64, flags="C_CONTIGUOUS")
LIB.subpermanent_grad.argtypes = [ctypes.c_int, ctypes.c_int, DPTR, DPTR, DPTR]


def coefficient(a, k):
    n = len(a)
    a = np.ascontiguousarray(a)
    value, grad = np.zeros(1), np.zeros_like(a)
    LIB.subpermanent_grad(n, k, a, value, grad)
    factor = n**k * math.factorial(n - k) / math.factorial(n)
    return factor * value[0], factor * grad


def verify(rng):
    a = rng.normal(size=(4, 4))
    for k in range(2, 5):
        direct = 0
        for rows in itertools.combinations(range(4), k):
            for cols in itertools.permutations(range(4), k):
                direct += math.prod(a[i, j] for i, j in zip(rows, cols))
        direct *= 4**k * math.factorial(4 - k) / math.factorial(4)
        value, gradient = coefficient(a, k)
        assert np.allclose(value, direct, atol=1e-10)
        direction = rng.normal(size=a.shape)
        eps = 1e-6
        finite_difference = (coefficient(a + eps * direction, k)[0]
                             - coefficient(a - eps * direction, k)[0]) / (2 * eps)
        assert np.allclose(finite_difference, np.sum(gradient * direction), rtol=1e-7)


def optimize(n, k, starts, rng):
    h = helmert(n, full=False).T
    best = (-1, None)
    outcomes = []
    for trial in range(starts):
        if trial == 0:
            w = np.eye(n - 1)
        elif trial == 1:
            u = np.ones(n)
            u[:n // 2] = -1
            u -= u.mean()
            w = np.outer(h.T @ u, h.T @ u)
        elif trial < 5:
            rank = trial - 1
            w = rng.normal(size=(n - 1, rank)) @ rng.normal(size=(rank, n - 1))
        else:
            w = rng.normal(size=(n - 1, n - 1))
        w /= np.linalg.norm(w)
        sign = -1 if trial % 2 and k % 2 == 0 else 1

        def fun(flat):
            raw = flat.reshape(n - 1, n - 1)
            norm = np.linalg.norm(raw)
            w = raw / norm
            value, grad = coefficient(h @ w @ h.T, k)
            g = h.T @ grad @ h
            g = (g - np.sum(g * w) * w) / norm
            return -sign * value, (-sign * g).ravel()

        result = minimize(fun, w.ravel(), jac=True, method="L-BFGS-B",
                          options={"maxiter": 400, "ftol": 1e-13, "gtol": 1e-9})
        final = result.x.reshape(n - 1, n - 1)
        final /= np.linalg.norm(final)
        x = h @ final @ h.T
        value, _ = coefficient(x, k)
        outcomes.append({"value": float(value), "success": bool(result.success),
                         "iterations": int(result.nit)})
        if abs(value) > best[0]:
            best = (abs(value), x)
        if abs(value) > 1 + 1e-7:
            np.save(ROOT / f"coefficient_violation_n{n}_k{k}.npy", x)
            print("COUNTEREXAMPLE CANDIDATE", n, k, value, flush=True)
            break
    return best, outcomes


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--max-n", type=int, default=10)
    parser.add_argument("--starts", type=int, default=20)
    parser.add_argument("--seed", type=int, default=261120)
    args = parser.parse_args()
    rng = np.random.default_rng(args.seed)
    verify(rng)
    records = []
    for n in range(3, args.max_n + 1):
        for k in range(3, n + 1):
            best, outcomes = optimize(n, k, args.starts, rng)
            record = {"n": n, "k": k, "maximum_found": best[0], "outcomes": outcomes}
            records.append(record)
            print(n, k, best[0], flush=True)
            (ROOT / "coefficient_search.json").write_text(json.dumps(records, indent=2) + "\n")


if __name__ == "__main__":
    main()
