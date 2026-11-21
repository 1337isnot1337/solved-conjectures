# Independent review: partially forbidden diagonals

Reviewed 2026-11-21 UTC against [the proof](partial_diagonal_nonbarycentric.md).

I found no mathematical gap in the stated family theorem: for every `n >= 3` and `2 <= k < n`, the barycenter of the face supported by `J_n - diag(I_k,0)` is not stationary for the permanent.

The review covered the following logical steps, without relying on numerical evidence:

- Stationarity on the relative interior gives additive row and column cofactor potentials. The stochastic maximum principle forces the allowed cofactors to equal the permanent. The uniform supported-permutation law and the Gibbs law then have equal marginals; the sum of their two relative entropies forces the laws to coincide.
- The three barycenter entries have the stated inclusion-exclusion counts. The explicitly completed top/free four-cycle forces `ac = b^2` under stationarity, including the single-free-index boundary `k = n - 1`.
- The recurrence identity for the derangement log-convexity determinant is correct, including its signs. It proves strict log-convexity from `d_2` onward.
- The finite binomial-transform argument is valid: Pascal's identity expresses the determinant as `XZ - Y^2`, and strict termwise log-convexity followed by Cauchy--Schwarz gives positivity. Reversing the derangement prefix preserves log-convexity. The index range stops at `d_j` with `j >= 2`, so no exceptional `d_0,d_1` terms are imported.
- The separate determinant formulas for `j = 0,1` are correct. The lone negative determinant at `(N,j) = (3,1)` is nonzero, which is all the stationarity argument requires.

This is an independent proof review, not a priority determination. Minc's 1994 full text and the status of any explicit all-parameter conjecture remain under audit. The family theorem must not be counted as a named solved conjecture, a characterization for Problem 15, or a resolution of Conjecture 44 on the present evidence.
