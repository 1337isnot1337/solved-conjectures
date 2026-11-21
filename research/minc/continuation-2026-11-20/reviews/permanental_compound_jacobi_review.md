# Characteristic polynomial of permanental compounds

Review date: 21 November 2026 UTC.

This note reviews a proposed symmetric-power/Jacobi reduction for
[MINC Problem 17](https://yair-lavi.com/mincs-list/problem-17/index.html).
The identity is correct for every matrix and every `1 <= k <= n`.
It does not, by itself, supply a faster algorithm uniformly in `k`.
No resolution of Problem 17 is claimed.

## Exact identity without spectral genericity

Let `A` be an `n` by `n` matrix over a field, and let `S = Sym^k(A)` act on
the degree-`k` homogeneous polynomials. Use the ordinary monomial basis,
with the convention that its column indexed by `beta` consists of the
coefficients of

```math
\prod_{j=1}^n\left(\sum_{i=1}^n a_{ij}x_i\right)^{\beta_j}.
```

There are

```math
D=\binom{n+k-1}{k}
```

basis monomials. Let `F` be the squarefree monomials and `C` its complement.
Set

```math
N=|F|=\binom nk,\qquad M=|C|=D-N.
```

The principal block `S[F,F]` is exactly `P_k(A)`: the coefficient associated
with two squarefree indices is the permanent of the corresponding
submatrix of `A`. There is no factorial normalization in this block.

Apply the complementary-principal-minor identity to `z I_D - S` over the
rational-function field. Its determinant is a nonzero monic polynomial,
so the inverse exists there for every `A`. The result is

```math
\chi_{P_k(A)}(z)
 =\chi_S(z)\det\left((zI_D-S)^{-1}[C,C]\right).
```

This argument does not require distinct eigenvalues, diagonalizability,
cyclicity, a nonzero determinant of `A`, or a random perturbation.
When `M=0`, the empty determinant is 1.

For `M >= 1`, put `H(z) = adj(z I_D-S)[C,C]`. An equivalent polynomial identity is

```math
\det H(z)=\chi_S(z)^{M-1}\chi_{P_k(A)}(z).
```

Each entry of `H` has degree at most `D-1`. The divisibility in this
identity is exact, but exploiting its large cancellation is an algorithmic
requirement, not an automatic consequence of the formula.

Triangularizing `A` over an algebraic closure also proves

```math
\chi_S(z)=\prod_{\substack{\alpha\in\mathbb N^n\\|\alpha|=k}}
 \left(z-\prod_i\lambda_i^{\alpha_i}\right),
```

with all multiplicities retained. This is a spectral identity, not a
field-operation algorithm for obtaining the roots or collision resolvent.

## The collision dimension

The exact ratio is

```math
\frac ND=\prod_{j=0}^{k-1}\frac{n-j}{n+j}.
```

Since `log((1-x)/(1+x)) <= -2x` for `0 <= x < 1`,

```math
\frac ND\leq \exp\left(-\frac{k(k-1)}n\right),
\qquad
\frac MN\geq \exp\left(\frac{k(k-1)}n\right)-1.
```

For `k=o(sqrt(n))`, expanding the logarithm gives

```math
\log(N/D)=-\frac{k(k-1)}n+O(k^4/n^3).
```

Thus the collision index set is small relative to the target only in that
regime. In particular, for fixed `k >= 2`,

```math
N\sim D\sim\frac{n^k}{k!},\qquad
M\sim\frac{n^{k-1}}{(k-2)!}.
```

The first exact dimensions are `M=n` for `k=2`, `M=n^2` for `k=3`, and
`M=n(n^2+1)/2` for `k=4`. If `k` is much larger than `sqrt(n)`, `M/N`
diverges. For `k=n`, the target has dimension 1, whereas

```math
D=\binom{2n-1}{n}\sim\frac{4^n}{2\sqrt{\pi n}}.
```

An explicit expansion of the symmetric-power characteristic polynomial
would already have exponentially more coefficients than the target in
this last case.

## Cost of a direct polynomial-matrix implementation

Suppose, optimistically, that `H(z)` and `chi_S(z)` have already been
constructed. A general polynomial-matrix determinant algorithm applied to
the `M` by `M` matrix `H`, of degree at most `D-1`, gives the bound

```math
\widetilde O(M^\omega D)
```

field operations for that determinant stage. This follows, for example,
from the deterministic algorithm of
[Labahn, Neiger, and Zhou](https://arxiv.org/abs/1607.04176).
The matrix is nonsingular over the rational-function field because its
determinant is the product of nonzero characteristic polynomials above.

For fixed `k`, this bound is

```math
\widetilde O(n^{(k-1)\omega+k}).
```

Building `P_k(A)` for fixed `k` uses `O(n^(2k))` field operations, with a
constant depending on `k`; the usual fast characteristic-polynomial stage
has bound `tilde O(N^omega) = tilde O(n^(k omega))`. The exponent difference
between the displayed determinant-stage bounds is `k-omega`.

- At `k=2`, the symmetric-power bound is `tilde O(n^(omega+2))`, matching
  the scale of the already reported special case on the live problem page.
- For every fixed `k >= 3` and `omega < 3`, this generic bound is worse
  than the direct characteristic-polynomial bound.

These are comparisons of available upper bounds, not lower bounds on
every implementation of the Jacobi formula. A special representation of
the collision resolvent could improve them. No such representation and
complete complexity proof has been supplied in this proposal. The cost
of constructing `H` has also not yet been charged.

## Why a cyclic-vector assumption does not fill the gap

`Sym^k(A)` need not be cyclic. For example, `A = I_n` gives `S = I_D`,
whose minimal polynomial has degree 1 even when `D > 1`. An arbitrary
single-vector Krylov sequence therefore cannot be assumed to recover its
characteristic polynomial. Repeated eigenvalues and Jordan blocks must
be handled explicitly in any general algorithm.

Conversely, no universal small minimal-polynomial degree is available:
take a diagonal matrix whose diagonal entries are distinct primes over
the rationals. Unique prime factorization makes all degree-`k` monomial
eigenvalues distinct. Then `S` has minimal-polynomial degree `D`.
This example only disproves a universal low-degree recurrence assumption;
the diagonal input itself is easy and is not an algorithmic lower bound.

Knowing the monomial eigenvalues also does not determine the collision
resolvent. Its entries depend on how the symmetric-power eigenvectors
project onto the original monomial coordinates. In a diagonalizable
factorization `A = V Lambda V^-1`, that information lies in `Sym^k(V)`
and `Sym^k(V^-1)`, whose coefficients contain repeated-index permanents.
Using this factorization requires accounting for those coefficients and
the cost of the extension field, not only multiplying the eigenvalues.

## Remaining requirement

A claimed all-`k` improvement needs a structured algorithm for the selected
resolvent, a determinant computation that exploits its cancellations,
and an end-to-end cost comparison including construction and coefficient
arithmetic. It must work on degenerate spectra as well as generic inputs.
The valid identity alone establishes none of these requirements.
