# Entropy nonconcavity on the zero-diagonal face

This is an exact obstruction to a proposed proof method for Minc Conjecture 44. It is not a counterexample to that conjecture and is not counted as a conjecture resolution.

For a doubly stochastic matrix P with zero diagonal, let `H_perm(P)` be the maximum Shannon entropy of a law on derangements with marginal matrix P, and put

`I(P) = -sum_(i!=j) p_ij log p_ij - H_perm(P)`.

This is the restriction of the minimum-total-correlation functional studied by S. Sra, *A new proof of van der Waerden's inequality, and beyond*, <https://hexagonmath.org/pdf/2611.00118v1>. Sra proves monotonicity under pair row and column averaging; concavity is a different assertion.

## Exact witness

Take the Gibbs parameter matrix

```
B = [[0,6,1,1],
     [7,0,6,8],
     [3,2,0,4],
     [3,2,9,0]].
```

Its permanent is 3590. Under the law on derangements proportional to `product_i b_(i,sigma(i))`, the marginal matrix is

```
P = (1/3590) [[   0,3240, 152, 198],
              [1694,   0, 504,1392],
              [1380, 210,   0,2000],
              [ 516, 140,2934,   0]].
```

All off-diagonal entries are positive. Let C be the covariance matrix of the twelve edge indicators under this law. With one-based indices put `h=E_13-E_42`, regarded as a vector on these edges, and `Delta=C h`. Explicitly,

```
Delta = (1/3222025) [[     0, -9720, 42624,-32904],
                     [ -5082,     0,-33822, 38904],
                     [-36450, 42450,     0, -6000],
                     [ 41532,-32730, -8802,     0]].
```

Every row and column of Delta sums to zero. Hence `P+s Delta` stays in the relative interior of the same face for sufficiently small positive or negative s.

Finite exponential-family duality gives

`d^2 I(P)[Delta,Delta] = h^T C h - sum_e Delta_e^2/P_e`.

Indeed, the Hessian of the log partition function in Gibbs parameters is C; the Hessian of `-H_perm` on the marginal tangent space is its inverse. For `Delta=C h`, its quadratic value is `h^T C h`. The row-entropy Hessian contributes the negative sum above. Gauge directions cause no problem: both sides depend only on the class of h modulo the covariance kernel.

Direct rational arithmetic gives

`d^2 I(P)[Delta,Delta] = 175156783137/19313877896225 > 0`.

Thus I is not concave on the zero-diagonal face. The standard-library script `entropy_nonconcavity.py` independently reconstructs all nine derangement weights, the marginals, the covariance, and the positive rational curvature.

This still leaves more restricted averaging statements logically possible. A separate exact certificate in the sign-matrix worker's `c44_research.md` and `c44_obstructions.py` disproves unrestricted simultaneous row/column transposition-conjugation monotonicity as well. These obstructions close those entropy bridges; they do not alter the status of the permanent minimum conjecture.
