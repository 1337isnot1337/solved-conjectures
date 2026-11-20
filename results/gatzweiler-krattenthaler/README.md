# Gatzweiler–Krattenthaler conjecture

**Status: previously disproved; excluded from new-resolution claims.** The [CoPEER archive](https://github.com/qqliu/CoPEER/blob/105523fdaf018b62eaf2883347724dfe79935611/mathematics/discoveries/entries/number-theory/fake-gaussian-positivity-counterexample.md) contains an exact counterexample to Conjecture 4, with an internal deposition date of 11 September 2026. Its [public repository commit](https://github.com/qqliu/CoPEER/commit/105523fdaf018b62eaf2883347724dfe79935611) is dated 24 October 2026. The complete source binding and arithmetic were independently checked on 20 November 2026. The five-factor family below is retained as an independently found exposition of the same already resolved conjecture.

**Mathematical result:** the shifted-product positivity conjecture is false. This is Conjecture 4 of Gatzweiler and Krattenthaler's 2026 paper, also restated as Conjecture 1.3 of arXiv:2603.22226.

For every positive integer $`r`$, take $`m=33r`$, $`n=30r`$, and $`a_i=1`$ exactly at $`i=17r,18r,21r,27r,30r`$. The conjectured quotient is an integer polynomial, but its coefficient of $`q^{50r}`$ is $`-1`$.

The proof gives an explicit cyclotomic factorization and an additive-semigroup gap for an infinite family. It supplies a different counterexample to the universal statement; it does not constitute a new resolution.

- [Complete proof](proof.md)
- [Exact standard-library verifier](verify.py)
- [Literature and scope checks](literature.md)
- [Coordination issue #78](https://github.com/1337isnot1337/solved-conjectures/issues/78)

Run `python results/gatzweiler-krattenthaler/verify.py` from the repository root.

The distinct conjecture about quotients of two Gaussian binomial coefficients and the symmetric-sequence conjectures are not resolved by this construction. No Lean work is included. This note is unrefereed.
