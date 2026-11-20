# Gatzweiler–Krattenthaler conjecture

**Result:** the shifted-product positivity conjecture is false. This is Conjecture 4 of Gatzweiler and Krattenthaler's 2026 paper, also restated as Conjecture 1.3 of arXiv:2603.22226.

For every positive integer $`r`$, take $`m=33r`$, $`n=30r`$, and $`a_i=1`$ exactly at $`i=17r,18r,21r,27r,30r`$. The conjectured quotient is an integer polynomial, but its coefficient of $`q^{50r}`$ is $`-1`$.

The proof gives an explicit cyclotomic factorization and an additive-semigroup gap. It refutes the universal conjecture, rather than proving or improving a single parameter case.

- [Complete proof](proof.md)
- [Exact standard-library verifier](verify.py)
- [Literature and scope checks](literature.md)
- [Coordination issue #78](https://github.com/1337isnot1337/solved-conjectures/issues/78)

Run `python results/gatzweiler-krattenthaler/verify.py` from the repository root.

The distinct conjecture about quotients of two Gaussian binomial coefficients and the symmetric-sequence conjectures are not resolved by this construction. No Lean work is included. This note is unrefereed.
