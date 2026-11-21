# Independent review of the sign-matrix continuation

Review date: 21 November 2026 UTC.

Reviewed `../sign/continuation_checkpoint.md`,
`../sign/continuation_checks.py`, and both imported arithmetic modules.
No complete resolution of a MINC problem is asserted or established here.

## Exact checks

Running

```sh
python research/minc/continuation-2026-11-20/sign/continuation_checks.py
```

returned `Exact triangular-family and H2-doubling obstruction checks passed.`
The permanent routine is the standard exact subset recurrence, with the row
index determined by the subset cardinality. The determinant routine uses
Gaussian elimination over Python `Fraction` objects and checks integral output.
Its omission of explicit zero assignments below each pivot is harmless: later
steps only read columns at or to the right of the current pivot.

The separate exact evaluation of the four-by-four source matrix in the
doubling example gives `per(A) = 4`. This establishes the nonzero-permanent
hypothesis as well as nonsingularity. The author was asked to add that value
to the checkpoint and checker.

## Quantifiers and arguments

1. **Rank constraint.** The proof is valid over any field of prime
   characteristic `p`. In the quotient by the squares of all variables,
   Frobenius gives `L^p = 0` for every linear form. Expanding a product of
   `n > r(p-1)` forms in a basis of their span therefore gives zero. A
   permanent nonzero modulo `p` forces `rank >= ceil(n/(p-1))`. Applying
   the same argument to a subset of rows is legitimate, because a zero
   subproduct would make the whole product zero. The passage from rank
   over `F_3` to rational rank uses integer minors and is correct.
   This is a necessary condition, not a construction or sufficient condition.

2. **One-free-row triangular family.** For `n >= 2`, subtract consecutive
   fixed rows from bottom to top. Rows 3 through `n` become the corresponding
   coordinate rows multiplied by 2. Expansion leaves
   `2^(n-2) det([[s_1,s_2],[1,1]])`, proving the displayed determinant formula.
   The ten-dimensional cofactor vector is checked exactly. Pairing opposite
   cofactors gives all 81 ternary sums displayed in the checkpoint. The
   parity argument excludes both possible determinant signs. This rejects
   the entire specified one-row family at an already known admissible order;
   it does not reject general sign matrices or multirow modifications.

3. **Doubling.** Write the row forms of the source matrix in variables `x`
   and `y` as `L_i(x)` and `L_i(y)`. The doubled product is
   `product_i (L_i(x)^2 - L_i(y)^2)`. The coefficient of all eight variables
   requires two row-pair factors on each side. Every resulting partition
   places row 1 with one other row. That pair has odd Hamming distance,
   so its doubled-row permanent vanishes by the elementary-symmetric
   calculation. Thus every contribution vanishes. Also
   `det(B) = (-2)^4 det(A)^2 = 1024`. The matrix is not Hadamard; the
   checkpoint correctly excludes any conclusion about Problem 5.

## Primary-source attribution

The following source checks support the claims made in the checkpoint.

- [Glynn's institutional publication record](https://researchnow.flinders.edu.au/en/publications/the-factorization-of-the-permanent-of-a-matrix-with-minimal-rank-/)
  states the characteristic-`p` rank obstruction and explicitly identifies
  it as a known result. The checkpoint does not claim novelty for it.
- [Wanless's complete 2005 paper](https://users.monash.edu.au/~iwanless/papers/wangconjLAMA.pdf)
  gives equality examples through order 20 in Section 3 and the Teichert
  zero-permanent construction in Section 4. In the latter construction,
  every row after the first `m` is all ones, so repeated rows are present.
  It cannot provide the required nonsingular equality construction.
- [Chabaud's paper](https://arxiv.org/pdf/1802.08001) uses the multiplicative
  group of rows of the Sylvester matrix. Its theorem does not address
  arbitrary Hadamard matrices.
- [Ingram and Razborov's published article](https://www.sciencedirect.com/science/article/pii/S0024379526001928)
  matches the given journal, volume, year, and pages. Its introduction
  explicitly retains the minimum-positive-value conjecture as open.
- [Budrevich and Guterman's author abstract](https://arxiv.org/abs/1810.04439)
  identifies the result as a rank-dependent upper bound. It is not the
  minimum-attainment conjecture.
- The [separate certificate submission](https://github.com/ajt60gaibb/OpenProblemsInNLA/blob/main/arithmetic-and-complexity/AC-11/README.md)
  says that its supplied certificates cover orders through 35 and leave
  all larger orders unresolved. This review checked that stated scope;
  it did not independently rerun that separate certificate collection.

The two initial wording issues, the missing `n >= 2` restriction and the
missing link for the separate certificate submission, were sent to the
author and corrected. No mathematical defect was found in the three scoped
arguments. This review establishes neither an exhaustive priority search
nor a full resolution of any of the original problems.
