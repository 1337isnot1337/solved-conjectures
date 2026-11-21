# A dense-band comparison for normalized minimum permanents

Date: 2026-11-20 (America/Chicago).

Status: a general partial result for
[Minc Conjecture 6](https://yair-lavi.com/mincs-list/conjecture-6/index.html).
It follows from the accompanying
[uniform Hessian estimate](../inequalities/uniform_radial_permanent.md#4a-a-tighter-hessian-comparison-in-a-smaller-ball).
It does not resolve the full conjecture. No historical-priority claim is
made.

## 1. Statement

Let $`\Lambda_n^k`$ consist of the binary matrices of order $`n`$ whose
row and column sums are all $`k`$. Put

```math
d_n=\frac{n!}{n^n},\qquad
\widetilde m(n,k)
=\min_{A\in\Lambda_n^k}\mathop{\mathrm{per}}(A/k).
```

**Theorem.** Suppose $`1\le k<n`$ and

```math
\frac{n-k}{k}\le\frac1{4000000}.
\tag{1}
```

Write $`r=n-k`$. For any $`A\in\Lambda_n^k`$ and any decomposition of
its complement into disjoint permutation matrices,

```math
\mathbf1\mathbf1^T-A=P_1+\cdots+P_r,
```

one has

```math
\boxed{
\frac1r\sum_{j=1}^r
\mathop{\mathrm{per}}\!\left(\frac{A+P_j}{k+1}\right)
\le
\mathop{\mathrm{per}}\!\left(\frac Ak\right)
-\frac{11nd_n}{100k(k+1)}.
}
\tag{2}
```

Such a decomposition always exists. In particular,

```math
\boxed{
\widetilde m(n,k+1)
\le\widetilde m(n,k)-\frac{11nd_n}{100k(k+1)}
<\widetilde m(n,k).
}
\tag{3}
```

Condition (1) is the fixed dense band
$`k/n\ge4000000/4000001`$. The assertion has no upper bound on order
and no asymptotic qualifier. It leaves all other degrees untreated.

## 2. An averaging lemma

Let $`F`$ be twice continuously differentiable on a Euclidean ball
centered at zero. Suppose $`\nabla F(0)=0`$ and throughout that ball

```math
m\|H\|^2\le\nabla^2F(X)[H,H]\le M\|H\|^2
\tag{4}
```

for every direction $`H`$, where $`M<2m`$. Let $`X`$ and every endpoint
$`X+D`$ lie in that ball. Suppose $`D`$ is a finitely supported random
vector and, for some $`\alpha>0`$,

```math
\mathbb E D=-\alpha X,\qquad
\mathbb E\|D\|^2=\alpha\|X\|^2.
\tag{5}
```

Then

```math
\mathbb E F(X+D)
\le F(X)-\alpha(m-M/2)\|X\|^2.
\tag{6}
```

Indeed, the entire segments from zero to $`X`$ and from $`X`$ to each
endpoint stay in the ball. Integration of (4) gives

```math
\langle\nabla F(X),X\rangle
=\int_0^1\nabla^2F(tX)[X,X]\,dt
\ge m\|X\|^2.
```

Taylor's formula along $`D`$ gives

```math
F(X+D)-F(X)
\le\langle\nabla F(X),D\rangle+\frac M2\|D\|^2.
```

Taking expectations and using (5) proves (6).

## 3. Complementary matchings give the exact moments

Let $`J_n=\mathbf1\mathbf1^T/n`$ and consider the centered subspace

```math
\mathcal H_n
=\{B\in\mathbb R^{n\times n}:B\mathbf1=B^T\mathbf1=0\}.
```

The complement of $`A`$ is the incidence matrix of a regular bipartite
graph of degree $`r`$. Hall's condition follows by counting edges from
any subset $`S`$ of one vertex class: its $`r|S|`$ incident edges end
in a set with capacity at most $`r|N(S)|`$, so
$`|N(S)|\ge|S|`$. Removing a perfect matching preserves regularity.
Iteration gives the stated decomposition into $`r`$ permutation
matrices.

Choose $`P`$ uniformly from these $`r`$ matrices. This is a specified
finite distribution, with

```math
\mathbb E P=\frac{\mathbf1\mathbf1^T-A}{r}.
\tag{7}
```

Define

```math
B=\frac Ak-J_n,\qquad
D=\frac{P-A/k}{k+1},\qquad
\alpha=\frac{n}{r(k+1)}.
\tag{8}
```

Both $`B`$ and $`D`$ belong to $`\mathcal H_n`$, and

```math
B+D=\frac{A+P}{k+1}-J_n.
```

Since $`A`$ has $`nk`$ ones,

```math
\|B\|_F^2=\frac nk-1=\frac rk.
\tag{9}
```

Substituting $`A=k(J_n+B)`$ in (7) gives

```math
\mathbb E D
=\frac1{k+1}
\left(J_n-\frac krB-J_n-B\right)
=-\alpha B.
\tag{10}
```

The supports of $`P`$ and $`A`$ are disjoint. Consequently

```math
\|D\|_F^2
=\frac{\|P\|_F^2+\|A/k\|_F^2}{(k+1)^2}
=\frac{n+n/k}{(k+1)^2}
=\frac{n}{k(k+1)}
=\alpha\|B\|_F^2.
\tag{11}
```

This equality holds for each matching, not only after expectation.
Finally, $`A+P`$ is binary and regular of degree $`k+1`$, so

```math
\|B+D\|_F^2
=\frac{n}{k+1}-1
=\frac{r-1}{k+1}
\le\frac rk.
\tag{12}
```

Equations (10) and (11) give precisely the two moments in (5). Under
(1), all endpoints and their connecting segments lie in the centered
Frobenius ball of radius $`1/2000`$.

## 4. Applying the permanent Hessian estimate

On $`\mathcal H_n`$, set

```math
P_n(B)=\frac{\mathop{\mathrm{per}}(J_n+B)}{d_n},\qquad
c_n=\frac{n}{n-1}.
```

The first derivative at zero vanishes because the permanent cofactors
of $`J_n`$ are equal and every centered direction has total sum zero.
Section 4a of the linked Hessian proof establishes, for
$`\|B\|_F\le1/2000`$,

```math
\left|\nabla^2P_n(B)[H,H]-c_n\|H\|_F^2\right|
\le\frac{13}{50}\|H\|_F^2.
\tag{13}
```

Thus (4) holds with

```math
m=c_n-\frac{13}{50},\qquad
M=c_n+\frac{13}{50},\qquad
m-\frac M2=\frac{c_n}{2}-\frac{39}{100}
\ge\frac{11}{100}>0.
```

The averaging lemma, (9), and (11) now give

```math
\mathbb E P_n(B+D)
\le P_n(B)-\frac{11}{100}\alpha\|B\|_F^2
=P_n(B)-\frac{11n}{100k(k+1)}.
```

Multiplication by $`d_n`$ proves (2). At least one summand is no
larger than the average. Applying this to a minimizer in the finite
set $`\Lambda_n^k`$ proves (3).

## 5. Scope and source record

The averaging proof uses any perfect-matching decomposition of the
complement. It does not require uniform sampling from the set of all
complementary perfect matchings. It also does not assert that each
matching individually improves the permanent. Those stronger statements
are distinct from (2).

The live catalogue reports that Wanless proved the dense range
$`k=n-o(n^{6/7})`$, along with sparse ranges and several exact degree
steps. A fixed positive band as in (1) is not contained in that
asymptotic dense range. This observation compares quantifiers; it is
not a priority determination. The catalogue and the sources below were
checked for the target and existing progress. No complete proof of
Conjecture 6 was found.

- Yair Lavi,
  [Conjecture 6: Monotonicity of normalized minimum permanents](https://yair-lavi.com/mincs-list/conjecture-6/index.html),
  accessed 20 November 2026 (America/Chicago).
- I. M. Wanless, *On Minc's sixth conjecture*, Linear and Multilinear
  Algebra 55 (2007), 57-63,
  [DOI](https://doi.org/10.1080/03081080600562670).
  The catalogue supplies the quoted dense-range statement; the full
  paper was not retrieved in this particular comparison.
- [Source audit for the centered coefficient bound](centered_coefficients_priority.md).
  This records the Gaussian and permanent literature examined for
  the analytic input and the remaining priority leads.

The accompanying exact checker verifies the moment identities on
noncirculant as well as circulant examples and checks the rational
Hessian margin. These diagnostics do not establish the theorem by
sampling: the proof in Sections 2-4 covers every admissible matrix and
every complementary matching decomposition.

Completed full Minc entries from this note: zero.
