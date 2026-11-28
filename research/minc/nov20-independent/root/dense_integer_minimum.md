# The dense line of the integer minimum problem

Date: 20 November 2026 (America/Chicago).

Status: independently reviewed proof. This is partial progress
on Minc Conjecture 24. It treats $`k=n-1`$ in all sufficiently large
orders and does not resolve the other degrees or the remaining orders.
It contributes zero complete list resolutions. No priority claim is made.

The [independent review](../compound/dense_integer_review.md) checks the
assignment bound, local comparison, confinement, and equality cases.

## 1. Statement

Let $`D_n`$ denote the number of derangements of $`n`$ objects.

**Theorem.** Suppose

```math
n\ge500\,000\,000\,000\,000.
```

For every nonnegative integer matrix $`A`$ of order $`n`$ with every
row and column sum equal to $`n-1`$,

```math
\mathop{\mathrm{per}}A\ge D_n.
```

Equality holds exactly when $`A`$ is a binary matrix, or equivalently
when $`A=\mathbf1\mathbf1^T-P`$ for a permutation matrix $`P`$.

The deviations from a binary matrix may grow with $`n`$. No fixed
defect pattern is assumed. The large explicit threshold comes from the
coarse constants in the previously reviewed uniform stability theorem.

## 2. An assignment with controlled cost

For a nonnegative integer matrix with the stated margins, put

```math
C=\sum_{i,j}\binom{a_{ij}}2,
\qquad E=\sum_{i,j}(a_{ij}-1)_+.
```

Then $`E\le C`$. The zero entries of $`A`$ form a bipartite graph.
If $`e_i=\sum_j(a_{ij}-1)_+`$, the degree of row vertex $`i`$ in
this graph is exactly $`1+e_i`$. Indeed, the number of positive
entries in that row plus $`e_i`$ equals $`n-1`$. The analogous
formula holds for column degrees, with their excesses summing to $`E`$.

For any set $`R`$ of row vertices, the number of incident zero edges is
at least $`|R|`$, and at most $`|N(R)|+E`$ by the column degree
formula. Hence

```math
|R|\le |N(R)|+E.
```

Append $`E`$ universal dummy column vertices. Hall's theorem gives a
matching covering all row vertices. Removing edges to the dummy vertices
leaves a zero matching missing at most $`E`$ rows and columns. If
$`E\ge n`$, the same bound is immediate without this construction.

Complete the zero matching to a permutation on the original matrix.
If $`d\le E`$ new edges are used, their total weight is at most
$`d+E`$, because $`a_{ij}\le1+(a_{ij}-1)_+`$ and no selected entry
is repeated. Therefore some permutation $`\pi`$ has

```math
s:=\sum_i a_{i,\pi(i)}\le 2E\le2C.                 \tag{1}
```

Permuting columns allows us to assume $`\pi(i)=i`$. This preserves
the permanent, margins, integrality, collision count, and distance from
the uniform matrix.

## 3. The local Hessian and the barycenter gradient

Write

```math
k=n-1,\qquad J_n=\frac1n\mathbf1\mathbf1^T,
\qquad d_n=\frac{n!}{n^n},
\qquad P_n(B)=\frac{\mathop{\mathrm{per}}(J_n+B)}{d_n}.
```

All derivatives below are restricted to the real subspace of matrices
with zero row and column sums. The
[reviewed local theorem](../inequalities/uniform_radial_permanent.md#4a-a-tighter-hessian-comparison-in-a-smaller-ball)
bounds the Hessian deviation from $`c_n=n/(n-1)`$ times the identity
by $`13/50`$ in the Frobenius ball of radius $`1/2000`$.

Every term in that deviation has degree at least one in the radius:
the degree-$`j`$ term has a Cauchy bound proportional to
$`\delta^{j-2}`$, with $`j\ge3`$. Halving the radius therefore
halves the entire positive majorant. Thus, with

```math
\delta=\frac1{4000},\qquad\eta=\frac{13}{100},
```

one has

```math
(c_n-\eta)\|H\|_F^2
\le\nabla^2P_n(B)[H,H]
\le(c_n+\eta)\|H\|_F^2
\qquad(\|B\|_F\le\delta).                         \tag{2}
```

Let $`U_n=(\mathbf1\mathbf1^T-I)/(n-1)`$ and
$`B_0=U_n-J_n=-(I-J_n)/k`$. Simultaneous row and column permutations
fix $`B_0`$ and $`P_n`$. The gradient restricted to the centered
subspace must consequently be a multiple of $`B_0`$: an invariant
matrix has one value on the diagonal and one off the diagonal, and
centering leaves only the span of $`I-J_n`$. Write

```math
\nabla P_n(B_0)=\gamma B_0.
```

If $`\|B_0\|_F\le\delta`$, integration from zero, where the
gradient vanishes, gives

```math
\gamma\|B_0\|_F^2
=\int_0^1\nabla^2P_n(tB_0)[B_0,B_0]\,dt.
```

Equation (2) implies

```math
c_n-\eta\le\gamma\le c_n+\eta.                    \tag{3}
```

## 4. Comparing an integer matrix in the local ball

Set $`X=A/k-J_n`$ and $`D=X-B_0=(A-\mathbf1\mathbf1^T+I)/k`$,
using the diagonal assignment from Section 2. The margins give

```math
\langle B_0,D\rangle=-\frac{s}{k^2},\qquad
\|D\|_F^2=\frac{2(C+s)}{k^2}.                     \tag{4}
```

For the second identity, use
$`\sum a_{ij}^2=nk+2C`$ and
$`\langle A,\mathbf1\mathbf1^T-I\rangle=nk-s`$.
These identities retain the cost of a possibly nonzero diagonal; no
perfect matching of zero entries is assumed.

Suppose both $`X`$ and $`B_0`$ lie in the radius-$`\delta`$ ball.
Their connecting segment also lies there. Taylor's integral formula,
(2), (3), (4), and (1) yield

```math
\begin{aligned}
P_n(X)-P_n(B_0)
&\ge-\frac{(c_n+\eta)s}{k^2}
  +\frac{(c_n-\eta)(C+s)}{k^2}
\\ &=\frac{(c_n-\eta)C-2\eta s}{k^2}
\\ &\ge\frac{(c_n-5\eta)C}{k^2}
\ge\frac{7C}{20k^2}.
\end{aligned} \tag{5}
```

It is strictly positive whenever $`A`$ is nonbinary, since an integer
matrix is nonbinary exactly when $`C>0`$.

## 5. Every possible minimizer lies in that ball

Assume for contradiction that a nonbinary admissible $`A`$ satisfies
$`\mathop{\mathrm{per}}A\le D_n`$. Its normalization is doubly
stochastic, and this comparison is equivalent to
$`\mathop{\mathrm{per}}(A/k)\le\mathop{\mathrm{per}}U_n`$.

The [uniform Frobenius stability theorem](../inequalities/uniform_frobenius_stability.md)
therefore gives

```math
\|X\|_F^2
\le32\,000\,000\log\frac{\mathop{\mathrm{per}}U_n}{d_n}.
```

Section 4 of that note proves

```math
\log\frac{\mathop{\mathrm{per}}U_n}{d_n}
\le\frac1{2(n-1)}+\frac3{(n+1)!}
\le\frac3{4(n-1)}\qquad(n\ge3).                   \tag{6}
```

The last step follows from $`(n+1)!\ge12(n-1)`$, with equality
at $`n=3`$ and an increasing ratio thereafter. Hence

```math
\|X\|_F^2\le\frac{24\,000\,000}{n-1}
<\frac1{16\,000\,000}=\delta^2                   \tag{7}
```

at the stated threshold and for every larger $`n`$.
Also $`\|B_0\|_F^2=1/(n-1)<\delta^2`$ there. Equation (5)
contradicts the assumed permanent comparison.

Every binary admissible matrix is the complement of a permutation
matrix and has permanent $`D_n`$. This proves the theorem and its
equality characterization.

## 6. Verification and unresolved scope

The companion checker verifies the low-cost assignment bound and the
two geometric identities on complete small integer-margin classes. It
also checks the local margin and the large threshold by exact rational
arithmetic. These are algebra diagnostics, not finite-order proofs of
the conjecture or substitutes for the argument above.

The [current C24 statement](https://yair-lavi.com/mincs-list/conjecture-24/index.html)
already reports that every fixed nonbinary defect on this dense line is
eventually beaten by the binary matrix. The theorem here permits the
entire defect to depend on order. This comparison identifies the
quantifiers; it does not establish priority. The analytic and capacity
inputs are proved and sourced in the linked notes.

The complete C24 statement concerns every $`1\le k\le n`$ in every
order. That statement remains unresolved. The threshold above is not a
new counted problem, and neither are the checker's individual cases.

