"""Floating counterexample search for Marcus's block-permanent conjecture.

This is a diagnostic, not a proof or a claimed bounty solution. A candidate
must be converted to an exact Gram matrix and checked independently.
Only NumPy/SciPy and public mathematical parameters are used.
"""
from __future__ import annotations

import argparse
import json
import math
from pathlib import Path
import time

import numpy as np
from scipy.optimize import minimize


class Permanent:
    """Ryser permanent and all entry derivatives, with no division."""

    def __init__(self, n: int):
        self.n = n
        self.bits = ((np.arange(1 << n)[:, None] >> np.arange(n)) & 1).astype(float)
        self.sign = (-1.0) ** (n - self.bits.sum(axis=1))

    def value_gradient(self, a):
        row_sums = a @ self.bits.T
        left = np.ones_like(row_sums)
        right = np.ones_like(row_sums)
        left[1:] = np.cumprod(row_sums[:-1], axis=0)
        right[:-1] = np.cumprod(row_sums[:0:-1], axis=0)[::-1]
        value = np.sum(self.sign * np.prod(row_sums, axis=0))
        gradient = ((left * right) * self.sign) @ self.bits
        return value, gradient


class MarcusObjective:
    def __init__(self, m: int, rank: int, orthonormal: bool = False):
        self.m, self.n, self.rank = m, 2 * m, rank
        self.orthonormal = orthonormal
        self.large = Permanent(self.n)
        self.small = Permanent(m)
        self.calls = 0
        self.best = math.inf
        self.best_x = None

    def decode(self, x):
        z = x.reshape(2, self.n, self.rank)
        raw = z[0] + 1j * z[1]
        if self.orthonormal:
            first_norm = np.linalg.norm(raw[::2], axis=1, keepdims=True)
            u = raw[::2] / first_norm
            c = np.sum(u.conj() * raw[1::2], axis=1, keepdims=True)
            t = raw[1::2] - u * c
            second_norm = np.linalg.norm(t, axis=1, keepdims=True)
            v = np.empty_like(raw)
            v[::2], v[1::2] = u, t / second_norm
            return v, (first_norm, second_norm, c, raw[1::2])
        norms = np.linalg.norm(raw, axis=1, keepdims=True)
        return raw / norms, norms

    def __call__(self, x):
        self.calls += 1
        v, norms = self.decode(x)
        a = v @ v.conj().T
        b = a[::2, ::2] * a[1::2, 1::2] + a[::2, 1::2] * a[1::2, ::2]
        p, dp = self.large.value_gradient(a)
        q, dq = self.small.value_gradient(b)
        p, q = p.real, q.real
        if p <= 0 or q <= 0:
            raise ArithmeticError(f"Nonpositive numerical Gram permanent: {p=}, {q=}")
        db = np.empty_like(a)
        db[::2, ::2] = dq * a[1::2, 1::2]
        db[1::2, 1::2] = dq * a[::2, ::2]
        db[::2, 1::2] = dq * a[1::2, ::2]
        db[1::2, ::2] = dq * a[::2, 1::2]
        value = math.log(p) - math.log(q)
        gv = 2 * (dp / p - db / q).conj() @ v
        if self.orthonormal:
            first_norm, second_norm, c, y = norms
            u, w = v[::2], v[1::2]
            gt = (gv[1::2] - w * np.real(np.sum(w.conj() * gv[1::2], axis=1, keepdims=True))) / second_norm
            gu = gv[::2] - gt * c.conj() - y * np.sum(gt.conj() * u, axis=1, keepdims=True)
            gy = gt - u * np.sum(u.conj() * gt, axis=1, keepdims=True)
            gv[::2] = (gu - u * np.real(np.sum(u.conj() * gu, axis=1, keepdims=True))) / first_norm
            gv[1::2] = gy
        else:
            gv = (gv - v * np.real(np.sum(gv.conj() * v, axis=1, keepdims=True))) / norms
        gradient = np.stack([gv.real, gv.imag]).reshape(-1)
        if value < self.best:
            self.best, self.best_x = value, x.copy()
        return value, gradient


def verify_gradient(orthonormal=False):
    rng = np.random.default_rng(43307)
    f = MarcusObjective(3, 3, orthonormal)
    x = rng.normal(size=2 * f.n * f.rank)
    value, grad = f(x)
    d = rng.normal(size=x.shape)
    d /= np.linalg.norm(d)
    h = 1e-5
    fd = (f(x + h * d)[0] - f(x - h * d)[0]) / (2 * h)
    analytic = np.dot(grad, d)
    assert abs(fd - analytic) < 1e-7, (fd, analytic)
    # Independent permutation sum at an actual nontrivial complex matrix.
    import itertools
    a = (rng.normal(size=(4, 4)) + 1j * rng.normal(size=(4, 4)))
    expected = sum(np.prod(a[np.arange(4), perm]) for perm in itertools.permutations(range(4)))
    observed = Permanent(4).value_gradient(a)[0]
    assert abs(expected - observed) < 1e-9
    return {"finite_difference_error": abs(fd - analytic), "permutation_error": abs(expected - observed)}


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--blocks", type=int, default=5)
    p.add_argument("--ranks", type=int, nargs="+", default=[2, 3, 4, 5, 8, 10])
    p.add_argument("--starts", type=int, default=8)
    p.add_argument("--iterations", type=int, default=150)
    p.add_argument("--seed", type=int, default=20261121)
    p.add_argument("--orthonormal", action="store_true")
    p.add_argument("--output", type=Path, default=Path("marcus_search.json"))
    args = p.parse_args()
    checks = verify_gradient(args.orthonormal)
    rng = np.random.default_rng(args.seed)
    summary = {"status": "floating search only", "parameters": vars(args) | {"output": str(args.output)}, "checks": checks, "runs": []}
    start = time.monotonic()
    for rank in args.ranks:
        for iteration in range(args.starts):
            f = MarcusObjective(args.blocks, rank, args.orthonormal)
            x = rng.normal(size=2 * f.n * rank)
            r = minimize(f, x, method="L-BFGS-B", jac=True,
                         options={"maxiter": args.iterations, "ftol": 1e-13, "gtol": 1e-8, "maxls": 30})
            entry = {"rank": rank, "start": iteration, "best_log_ratio": f.best, "iterations": r.nit, "calls": f.calls, "success": bool(r.success)}
            summary["runs"].append(entry)
            print(json.dumps(entry), flush=True)
            if f.best < -1e-7:
                v, _ = f.decode(f.best_x)
                candidate = args.output.with_suffix(".candidate.npz")
                np.savez(candidate, vectors=v)
                summary["candidate"] = str(candidate)
                args.output.write_text(json.dumps(summary, indent=2) + "\n")
                return
    summary["elapsed_seconds"] = time.monotonic() - start
    summary["minimum_log_ratio"] = min(x["best_log_ratio"] for x in summary["runs"])
    args.output.write_text(json.dumps(summary, indent=2) + "\n")


if __name__ == "__main__":
    main()
