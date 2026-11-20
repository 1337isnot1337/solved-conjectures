"""Exploratory PSD search after the singular-value Cauchy--Schwarz reduction.

This is a diagnostic for an unproved centered-coefficient lemma. It does not
prove that lemma or resolve a listed conjecture.
"""
import argparse
import json
from pathlib import Path

import numpy as np
from scipy.linalg import helmert
from scipy.optimize import minimize

from coefficient_search import coefficient


def optimize(n, k, starts, rng):
    h = helmert(n, full=False).T
    records = []
    best = 0.0
    for trial in range(starts):
        if trial == 0:
            b = np.eye(n - 1)
        elif trial == 1:
            u = np.ones(n)
            u[:n // 2] = -1
            u -= u.mean()
            b = (h.T @ u)[:, None]
        elif trial == 2:
            b = (h.T @ np.eye(n)[:, 0])[:, None]
        else:
            rank = min(n - 1, 1 + (trial - 3) % 5)
            b = rng.normal(size=(n - 1, rank))
        b /= np.linalg.norm(b)
        shape = b.shape

        def fun(flat):
            b = flat.reshape(shape)
            z = b @ b.T
            norm = np.linalg.norm(z)
            w = z / norm
            value, gradient = coefficient(h @ w @ h.T, k)
            g = h.T @ gradient @ h
            g = (g - np.sum(g * w) * w) / norm
            return -value, (-(g + g.T) @ b).ravel()

        result = minimize(fun, b.ravel(), jac=True, method="L-BFGS-B",
                          options={"maxiter": 250, "ftol": 2e-13, "gtol": 1e-8})
        value = -float(result.fun)
        best = max(best, value)
        records.append({"trial": trial, "rank_bound": shape[1], "value": value,
                        "iterations": int(result.nit), "success": bool(result.success)})
        if value > 1 + 1e-7:
            b = result.x.reshape(shape)
            z = b @ b.T
            x = h @ (z / np.linalg.norm(z)) @ h.T
            np.save(Path(__file__).with_name(f"psd_violation_n{n}_k{k}.npy"), x)
            break
    return {"n": n, "k": k, "maximum_found": best, "outcomes": records}


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--starts", type=int, default=9)
    parser.add_argument("--max-n", type=int, default=14)
    args = parser.parse_args()
    rng = np.random.default_rng(20261121)
    records = []
    out = Path(__file__).with_suffix(".json")
    for n in range(11, args.max_n + 1):
        for k in sorted({3, 4, n // 2, n - 1, n}):
            record = optimize(n, k, args.starts, rng)
            records.append(record)
            print(n, k, record["maximum_found"], flush=True)
            out.write_text(json.dumps(records, indent=2) + "\n")


if __name__ == "__main__":
    main()
