#!/usr/bin/env python3
"""Exact checks of the numerical conditions behind the wild-number result for K_n, n >= 155.

Run from the repository root with Python 3.10 or later and no other dependencies:

    python3 results/wild-number-complete-graphs/verify.py

Every check is an assertion on exact rationals (fractions.Fraction); the script ends with
ALL CHECKS PASSED and takes a few seconds. It reuses the scripts that the proofs cite:
improvement/counts.py (author, Theorem B), review2/bounds.py (second referee, independent
coefficients for Theorem B), review/lll_indep.py and review/tail_indep.py (first referee,
Theorem A) and theorem-a/lll2.py (author, Theorem A).

[1] Fixed block F (REPORT.md Section 4, corrected in review/REVIEW.md E1): the over-count
    n*C(h,2)*C(n-4,f-4) + n*h*C(n-3,f-3) < C(n,f) for odd n in [19, 20001] when f = 4 and
    odd n in [49, 20001] when f = 5. This is a finite check; for larger n the inequality is a
    comparison of a cubic (f = 4) or quartic (f = 5) with C(n,f).
[2] Theorem B, every odd n in [155, 189]: condition (*) of IMPROVEMENT.md Section 4.3,
    sum_j c_j a^(3j) <= a - 1, with the author's coefficients at a rational a = k/2000.
[3] The same n and a with the second referee's coefficients: they are termwise at most the
    author's, and (*) holds.
[4] Theorem A, every odd n in [189, 1201]: the lopsided LLL condition
    W(mu) <= (1 - x_max) * ((mu-1) - (mu-1)^2/2) of REPORT.md Section 4 at a rational mu,
    with the first referee's coefficients; x_max is attained at j = 1 because
    q_j mu^(3j) decreases in j. The coefficients agree exactly with the author's lll2.py at
    sample values of n.
[5] Theorem A, every n >= 1201: the first referee's explicit bound B(n) <= RHS(n) at n = 1201,
    1203, 1205 with mu = 41/40. B is non-increasing and RHS non-decreasing in n
    (review/REVIEW.md, G2), so this covers every larger n.

The written proofs are REPORT.md (Theorem A) and IMPROVEMENT.md (Theorem B). Even n follow from
odd n - 1 by the deletion lemma, so only odd n are checked.
"""
from fractions import Fraction as Fr
from math import comb
from pathlib import Path
import sys

HERE = Path(__file__).resolve().parent
for sub in ("improvement", "review2", "review", "theorem-a"):
    sys.path.insert(0, str(HERE / sub))

import counts          # improvement/counts.py
import bounds          # review2/bounds.py
import lll_indep       # review/lll_indep.py
import tail_indep      # review/tail_indep.py
import lll2            # theorem-a/lll2.py

THEOREM_B = range(155, 190, 2)
THEOREM_A = range(189, 1202, 2)


def check_fixed_block():
    for n in range(19, 20002, 2):
        f = {1: 4, 2: 5}.get(n % 3)
        if f is None or (f == 5 and n < 49):
            continue
        h = (n - 1) // 2
        bad = n * comb(h, 2) * comb(n - 4, f - 4) + n * h * comb(n - 3, f - 3)
        assert bad < comb(n, f), n
    print("[1] a rainbow, sub-valid block F exists for odd n in [19, 20001] (f = 4) "
          "and [49, 20001] (f = 5): OK")


def check_theorem_b():
    chosen = {}
    worst = None
    for n in THEOREM_B:
        co = counts.coef(n)
        a, _ = counts.best_a(n, co)
        ok, w = counts.exact_check(n, a, co)
        assert ok and a > 1, (n, a)
        slack = a - 1 - w
        worst = min(worst, (slack, n)) if worst else (slack, n)
        chosen[n] = (a, co)
    print(f"[2] Theorem B condition (*) holds exactly for every odd n in [155, 189] "
          f"(author's coefficients); least slack {float(worst[0]):.6f} at n = {worst[1]}: OK")
    for n, (a, co) in chosen.items():
        co2 = bounds.coefs(n)
        assert len(co2) == len(co), n
        assert all(x <= y for x, y in zip(co2, co)), n
        assert bounds.W(co2, a) <= a - 1, n
    print("[3] second referee's coefficients are termwise at most the author's and satisfy (*) "
          "at the same a for every odd n in [155, 189]: OK")


def check_theorem_a():
    worst = None
    for n in THEOREM_A:
        (mu, _), co = lll_indep.best_mu(n)
        ok, w, rhs = lll_indep.exact_ok(n, mu, co)
        k = 1
        while not ok and k < 200:
            mu = Fr(1000 + k, 1000)
            ok, w, rhs = lll_indep.exact_ok(n, mu, co)
            k += 1
        assert ok, n
        f, N, t, h = lll_indep.params(n)
        # q_{j+1} mu^(3j+3) / (q_j mu^(3j)) = mu^3 / C(N-1-3j, 2) < 1 for all j < t//2
        assert mu ** 3 < comb(N - 1 - 3 * (t // 2 - 1), 2), n
        rel = (rhs - w) / rhs
        worst = min(worst, (rel, n)) if worst else (rel, n)
    print(f"[4] Theorem A LLL condition holds exactly for every odd n in [189, 1201]; "
          f"least relative slack {float(worst[0]):.4f} at n = {worst[1]}: OK")
    for n in (189, 191, 193, 401, 403, 405, 1199, 1201):
        w1, wf, _ = lll2.weights(n)
        assert [a + b for a, b in zip(w1, wf)] == lll_indep.coeffs(n), n
    print("    referee and author LLL coefficients agree exactly at n = 189, 191, 193, 401, 403, "
          "405, 1199, 1201: OK")


def check_tail():
    mu = Fr(41, 40)
    for n in (1201, 1203, 1205):
        b, _ = tail_indep.B(n, mu)
        rhs = tail_indep.RHS(n, mu)
        assert b <= rhs, n
    b, _ = tail_indep.B(1201, mu)
    print(f"[5] tail bound at n = 1201, mu = 41/40: B = {float(b):.6f} <= RHS = "
          f"{float(tail_indep.RHS(1201, mu)):.6f}, hence for every n >= 1201: OK")


if __name__ == "__main__":
    check_fixed_block()
    check_theorem_b()
    check_theorem_a()
    check_tail()
    print("ALL CHECKS PASSED")
