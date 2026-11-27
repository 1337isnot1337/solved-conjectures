# Finite-order two-sided localization

**Theorem.** Barrett–Evans–Hall–Kempton's dandelion conjecture,
including the generalized-dandelion equality classification,
holds for every order at least 29. The only unresolved orders are
11 through 28, with at least one side leafless. This closes the
whole band between 29 and the previous [uniform threshold of 65](INTERVAL-LEAF-THRESHOLD.md)
without enumerating graphs in that band.

## Two-sided norm bound

Let $`f`$ be a unit mean-zero Laplacian eigenvector of a simple
$`n`$-vertex graph with eigenvalue $`\lambda`$. If a vertex $`v`$ has
degree $`k`$ with $`1\le k\le n-2`$, its row equation and mean zero give
neighbor-coordinate sum $`(k-\lambda)f_v`$ and nonneighbor-coordinate
sum $`-(k+1-\lambda)f_v`$ (neither sum includes $`v`$). Applying
Cauchy–Schwarz on both disjoint groups gives

```math
1\ge f_v^2\left(1+\frac{(k-\lambda)^2}{k}
                  +\frac{(k+1-\lambda)^2}{n-1-k}\right).
```

For $`0\le\lambda\le u`$, minimize the parenthesis at
$`\min(u,nk/(n-1))`$, the projection of its unconstrained minimum
to the allowed interval. Thus a lower bound on $`|f_v|`$ bounds its
own degree by scanning the integers $`1,\ldots,n-2`$ exactly.
If there are at most $`j`$ missing neighbors, instead use the
minimum parenthesis over $`k\ge n-1-j`$ in the same range.
This makes no monotonicity assumption about that parenthesis.
Both degree restrictions hold since the graph and its complement
are connected.

## A ratio bound using all neighbors

Use the notation of the [interval proof](INTERVAL-LEAF-THRESHOLD.md).
Let $`a_l=M`$, $`b_h=H`$, lower bounds $`m,h_0`$, and let $`d`$
bound the number of neighbors of $`l`$ in $`G`$.
The deficit sum at $`l`$ is $`xM`$. If its neighbors are listed
in increasing order of their $`a`$-coordinates, neighbor number
$`i`$ has coordinate at least $`(1-x_U/i)M`$; otherwise the first
$`i`$ deficits would already exceed the total. The degree bound
of the preceding section gives a missing-neighbor bound in
$`G^c`$ for each such vertex. Call the resulting upper bound on
its $`|b|`$-entry $`B_i`$. The mean-zero row at $`l`$ gives

```math
\frac{|b_l|}{H}\le
\frac{\sum_{i=1}^d\min(1,B_i/h_0)}{n-d-y_U}.
```

Extra summands if the true degree is smaller are harmless.
Combine this with the independent absolute bound $`|b_l|\le B`$
to get $`|b_l|/H\le\rho`$ and hence
$`|b_l|\le\min(B,\rho H)`$. The bound improves the lower
estimate for $`y`$ after excluding edge $`lh`$, and for the other
positive $`b`$-coordinate when $`h`$ is not a leaf. In the latter
comparison, $`\min(B/H,\rho)`$ is nonincreasing in $`H`$, so any
strict positive bound checked at $`H=h_0`$ remains valid for larger
$`H`$. In particular, the lower bound
$`(2-y_U)H-\min(B,\rho H)`$ is nondecreasing thereafter if its
value at $`h_0`$ is positive: if the minimum is the linear term at
$`h_0`$, positivity forces positive linear slope; otherwise the
minimum stays the constant term.

## Exact checks for the intermediate orders

The target bound is the exact outward-bracketed dandelion value,
not the larger universal bound in the previous interval proof.
Use [the original cubic, Lemma 4.2](https://arxiv.org/pdf/2201.04225#page=15).
Its lowest nonzero root is in $`(0,1)`$ and its highest is in
$`(n-1,n)`$; the cubic signs at these four endpoints identify those
roots. Integer bisection of each interval at denominator
$`65536`$ gives an upper bound on the small root and a lower bound
on the large one. Add the order to their difference to obtain
$`D`$ above the sum to be minimized.

For each order, the [verifier](verify_finite_localization.py)
divides $`0\le x\le D/2`$ into 150 intervals. On each interval it
chooses a rational split for $`H`$ and checks both sides, in each
case with $`d_l=1`$ or $`d_l\ge 2`$. Apart from the two tightened
bounds and exact target above, the logic is the same as in the
[uniform interval proof](INTERVAL-LEAF-THRESHOLD.md). For the last
strict inequality one divides by $`H`$ before using the ratio
bound, as the previous paragraph allows. All arithmetic is
rational with outward-rounded square roots. A branch is accepted
only if impossible or if both leaves are forced. The
[all-orders double-leaf comparison](MISSING-LEAF.md) then gives
the stated inequality and equality case.

    python3 verify_finite_localization.py 29 64

All 600 branches per order close at all 36 orders, for 21,600
checked branches. The previous result covers every order at
least 65. The [exact small-order check](SMALL-REMAINDER.md)
covers 4 through 10, and the double-leaf argument applies at
all orders regardless of this localization. This note does not
claim that the probes for 11 through 28 have closed.

[Issue #962](https://github.com/1337isnot1337/solved-conjectures/issues/962).
