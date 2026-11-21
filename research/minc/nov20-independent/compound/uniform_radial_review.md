# Independent review of the uniform local permanent inequality

Reviewed 20 November 2026 (America/Chicago), by the compound worker.

Targets:

- [uniform_radial_permanent.md](../inequalities/uniform_radial_permanent.md)
- [centered_permanental_coefficients.md](../sign/centered_permanental_coefficients.md)

## Verdict

No gap was found in the stated local Hessian theorem, its explicit
constant, or the zero-diagonal local consequence. The conditional
eventual-order consequence is separated correctly from the locally
proved result. Neither C44 nor P13 is fully resolved by these notes.

The rational diagnostic script was rerun and passed. Its coarse Hessian
lower bound is 33/500, which is strictly larger than 1/16.

The initial conditional global discussion has since been superseded by
an explicit capacity argument. Its separate
[review](eventual_zero_diagonal_review.md) verifies minimum and uniqueness
for every order at least 20,000,000,000,000. The local review below retains
the original source boundary; the new global proof does not rely on the
catalogue's unprovided confinement estimate.

## Partition normalization and contraction

For fixed unordered row and column sets, summing over both ordered tuples
counts every matching exactly k! times. Thus the factor 1/k! in the
ordered-tuple formula for sigma_k is correct.

Partition-lattice inclusion-exclusion kills every pair containing a
singleton row or column block, because the corresponding index can be
summed freely and the relevant margin vanishes. The surviving bipartite
multigraph therefore has minimum degree at least two.

The entropy direction in the graph-contraction argument is correct.
If the vertex variables are ordered, the chain rule for an edge entropy
conditions only on earlier variables in that edge. Conditioning on all
earlier vertices gives a smaller conditional entropy. Summing over
edges gives

```math
\sum_e H(X_e)
 \ge \sum_v \deg(v)\,H(X_v\mid X_{\text{earlier}})
 \ge 2H(X_{\text{all}}).
```

Conditional entropies are nonnegative because the variables are discrete.
Repeated edges cause no problem. The normalized absolute weights have
the stated Gibbs distribution, and every marginal is supported where
q is positive, so the relative-entropy calculation is valid even when
the original matrix has zero entries. It gives the contraction bound
with no missing factor depending on n.

The Möbius absolute sum is the derangement number because assigning a
cyclic ordering to each nonsingleton partition block produces precisely
a permutation with no fixed points. Hence the factor (!k)^2/k! is
correct. At k=3 the single block has Möbius coefficient 2 on each side,
so sigma_3=(4/6) sum b_ij^3, as claimed.

## Complex differentiation and constants

The complex centered subspace is preserved by B+zH. On the Cauchy circle
of radius r=2 delta/(k-2),

```math
\|B+zH\|_F\le\delta+r
```

when H has norm one. The second derivative estimate is 2 times the
boundary supremum divided by r squared. This gives exactly

```math
a_k\frac{k^k}{2(k-2)^{k-2}}\delta^{k-2}.
```

There is no additional factor of k or a lost factor of two.

The coefficient normalization c_(n,k)=n^k/(n)_k is also correct.
The left-endpoint Riemann sum for the decreasing logarithm bounds it
above by e^k, including k=n by the integrable endpoint limit.

The rational estimates are consistent:

- The cubic contribution to half the Hessian bound is less than
  729/2000, hence less than 3/8.
- The finite-prefix ratios are at most 648/3481<1/5.
- The finite-prefix sum is less than 2187/25000<9/100.
- The geometric quadratic-tail bracket at m=61 and q=3/5 is exactly
  9775, and its stated majorant is less than 1/500.

Thus S<467/1000 and 1-2S>33/500>1/16. The real quadratic term has Hessian
n/(n-1) times the Frobenius squared norm. Integrating the Hessian bound
along a segment supplies the factor 1/2 and hence the coefficient 1/32
in the permanent difference.

## Gaussian coefficient theorem

The auxiliary coefficient theorem is compatible with the complex
Cauchy application. I checked the following points independently:

- Proper complex Gaussian moments give sigma_k with no extra k!.
- B times the all-ones vector and B^T times that vector both vanish
  exactly when the two Hermitian covariance factors used in the SVD
  reduction are centered.
- The Frobenius norms of those covariance factors equal the Frobenius
  norm of B, rather than its nuclear norm.
- The scalar majorant has the stated uniform Hessian bound. Circular
  symmetry kills the mean gradient, including the damped cubic term.
- The rotation estimate has constant pi^2/8. Gaussian concentration of
  the norm of the gradient gives the square exponential moment used
  in the proof.
- The real covariance has eigenvalues equal to half the complex
  covariance eigenvalues, each repeated twice. Thus the factors
  b=50||C||op and a^2=5000||C||F^2 are correct.
- The bound u<=5/32 and the use of 1/(1-u)<=4/3 give the stated
  exponential constant. Substitution t=1/(200||B||F) then gives the
  coefficient majorant 2·200^k||B||F^k.

All of these arguments apply to degenerate covariances by their displayed
linear Gaussian construction; no density of a nonsingular covariance
matrix is needed.

## Zero-diagonal normalization and scope

For B_0=U_n-J_n and D=A-U_n, zero margins and zero diagonal imply
orthogonality. In particular,

```math
\|B_0+tD\|_F^2=\frac1{n-1}+t^2\|D\|_F^2.
```

The first variation at U_n is zero on the allowed directions because
all off-diagonal cofactors agree and the total sum of D is zero.
Consequently the same Hessian integral directly compares per A with
per U_n, without comparing two unrelated approximation errors.

The local region is empty unless n is large enough for
1/(n-1)<=10^-6. That does not invalidate the all-order conditional
statement of Theorem 2; it does make its large-order use explicit.

The catalogue's reported confinement has not been independently proved
in these files, so its use remains conditional. The equality quantifier
is also treated separately. No claim about an explicit global threshold,
the intervening finite orders, or priority follows from this review.

## Smaller-ball Hessian comparison

I also checked the added Section 4a, with delta=1/2000 and e<11/4.
The original coefficient and Cauchy estimates apply without alteration.
The cubic majorant is 483153/4096000. The factorial-prefix ratio is at
most 297/3481<1/10, giving the prefix sum 1771561/153600000. The tail
parameter is q=11/40, and the same exact quadratic geometric-series
formula bounds the tail by 1/1000000. Their sum is less than 13/100.

The Hessian remainder is twice that sum, so its operator norm is less
than 13/50 on the real centered subspace. With c=n/(n-1), the resulting
bounds m=c-13/50 and M=c+13/50 satisfy M<2m because c>=1>39/50.
The normalization and strict comparison are both correct. I reran the
updated exact checker; all added rational comparisons passed.

