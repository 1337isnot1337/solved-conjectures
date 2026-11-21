# Independent review of the dense integer minimum theorem

Date: 20 November 2026 (America/Chicago).

Reviewed file: [dense_integer_minimum.md](../root/dense_integer_minimum.md).

Result: the stated theorem on the line k=n-1, including its equality
cases and explicit threshold, follows from the previously reviewed
uniform stability and local Hessian results. I found no gap. This is
partial progress on C24 and contributes no complete list resolution.

## Assignment and geometric identities

Each zero-graph row degree equals 1 plus that row's total excess over
one; the same holds for columns. For a row set R, counting its incident
zero edges gives the stronger inequality

```math
|R|+e_{\mathrm{row}}(R)
\le |N(R)|+e_{\mathrm{col}}(N(R)).
```

Thus Hall deficiency is at most E. The dummy-column construction in the
proof is valid, and extending the resulting matching to a permutation
costs at most d+E<=2E<=2C. The argument does not require a perfect zero
matching. The case E>=n is harmless, since any permutation then costs
at most n+E<=2E.

After moving this assignment to the diagonal, s=tr A is nonnegative.
The margin identities imply

```math
\langle B_0,D\rangle=-s/k^2,
\qquad \|D\|_F^2=2(C+s)/k^2.
```

I checked these directly from sum a_ij^2=nk+2C and from the sum of
off-diagonal entries nk-s. There is no missing normalization by n or k.

## Local comparison

The Hessian remainder majorant in the cited local theorem is a sum of
nonnegative bounds proportional to radius^(j-2), j>=3. Halving its
radius therefore divides the entire bound by at least two. This
justifies eta=13/100 at radius 1/4000, without a new analyticity or
entry-positivity hypothesis.

The gradient restricted to the centered subspace is equivariant under
simultaneous row and column permutations. Its value at B_0 is therefore
in the one-dimensional invariant centered subspace spanned by B_0.
Integration of the Hessian along tB_0 gives exactly
c_n-eta<=gamma<=c_n+eta.

The Taylor linear term is negative, namely -gamma s/k^2, so using the
upper bound for gamma is the correct inequality direction. The
quadratic remainder contributes at least
(c_n-eta)(C+s)/k^2. Their sum is at least

```math
\frac{(c_n-\eta)C-2\eta s}{k^2}
\ge\frac{(c_n-5\eta)C}{k^2}
\ge\frac{7C}{20k^2}.
```

The entire segment is in the local ball because both endpoints are in
that ball. Nonbinary integer entries are equivalent to C>0, so the
comparison is strict in exactly the required case.

## Confinement and equality

The already reviewed global stability bound applies to A/k, which is
doubly stochastic. If per A<=D_n, its normalization is bounded above by
per U_n. The derangement estimate gives
log(per U_n/d_n)<=3/[4(n-1)] for every n>=3: the only additional bound
is (n+1)!>=12(n-1), valid at n=3 with equality and thereafter by
induction.

Thus ||X||_F^2<=24,000,000/(n-1). This is strictly below 1/16,000,000
once n-1>384,000,000,000,000. The stated threshold
500,000,000,000,000 is sufficient. The other endpoint has squared norm
1/(n-1), also within the ball. The local strict inequality excludes
every nonbinary contender.

A binary matrix with margins n-1 has exactly one zero in every row and
column. It is the complement of a permutation matrix and has permanent
D_n. This verifies both directions of the equality characterization.

The proof allows a defect count growing with order, but remains confined
to k=n-1 above its threshold. This review does not establish priority or
remove those restrictions.
