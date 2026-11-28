# One-pivot storage refinement

Research checkpoint, 20 November 2026 (America/Chicago). This refines
the storage bound of [mixed_compound_action.md](mixed_compound_action.md).
It changes neither the full-resolution count nor the arithmetic-time
conclusion of that note.

Use m=1, r=n-1 at every recursive Schur step. The intermediate dimension
then is

```math
D_{n,k}=[z^k]\frac{(1+z)^{n-1}}{1-z}
=\sum_{j=0}^{\min(k,n-1)}\binom{n-1}{j}.                   \tag{1}
```

The same safe projections and scalar interpolation apply. The arithmetic
recurrence specializes to

```math
T(n,k)\le\mathop{\mathrm{poly}}(n,k)D_{n,k}
 +\sum_{j=0}^{\min(k,n-1)}T(n-1,j).
```

The symmetric-dimension convolution bounds each aggregate recursion
level by poly(n,k) binom(n+k-1,k). There are at most n levels. Therefore
the total time remains

```math
\mathop{\mathrm{poly}}(n,k)\binom{n+k-1}{k}.                  \tag{2}
```

For every child degree j<=k, D_(n-1,j)<=D_(n,k). Process one left-power
group at a time, retaining only one active child. The storage bound is

```math
O\!\left(nD_{n,k}+\mathop{\mathrm{poly}}(n,k)\right)
```

field elements. This includes coefficient arrays at all active levels;
interpolation can accumulate its output one sample at a time.

When k<=n/2, the binomial coefficients in (1) are nondecreasing through
degree k. Consequently,

```math
D_{n,k}\le(k+1)\binom nk.                                 \tag{3}
```

Thus (2) can be achieved with working storage within a polynomial factor
of the input/output dimension N=binom(n,k). At k=n/2, the workspace is
2^(n+o(n)) field elements, while the full symmetric coefficient vector
has (3sqrt(3)/2)^(n+o(n)) entries.

This is a joint time/space comparison with the full symmetric-power
action. Streaming individual compound entries already permits small
storage for every k, but may take O(k2^k N^2) arithmetic operations for
one action. No optimal-memory claim is being made.

Run

```sh
python research/minc/nov20-independent/compound/one_pivot_compound_checks.py
```

The checker implements the scalar-pivot recursion with rational
arithmetic and compares 75 actions against independent permutation
enumeration. It covers all degrees in orders two through six, including
singular and zero-pivot inputs repaired by interpolation. These checks
verify the modified recursion; they are not new numerical conjecture
cases.

