# Johnson's conjecture

Status: proposed complete proof. Independent mathematical reviews have passed; the final current-source priority audit is pending. No finite computation is used in the argument.

## Statement and attribution

William Johnson's *Pfaffian Positivity for Convex Kernels and Optimal Matching Bounds*, arXiv:2610.24371v1, Conjecture 7.1, asks the following. Let $`n`$ be positive and even, let $`x_1<\cdots<x_n`$, and let $`f:(0,\infty)\to(0,\infty)`$ be nonincreasing and log-convex. Define the real skew-symmetric matrix $`A`$ by

```math
A_{ij}=f(x_j-x_i)\qquad(i\lt j).
```

For every perfect matching $`M`$ of $`\{1,\ldots,n\}`$, the conjecture asserts

```math
\mathop{\mathrm{Pf}}(A)
\geq \prod_{\{i,j\}\in M,\ i\lt j} A_{ij}.
```

The proof below uses Johnson's already proved Proposition 4.2, the endpoint inequality for additive interval matrices. The new argument passes from products of interval factors to that additive class after arbitrary cyclic relabeling and positive diagonal scaling. This supplies an inequality for every adjacent pair, which can be iterated along any noncrossing matching. No claim is made that the endpoint inequality, the source's rainbow bound, or its resolution of the Albouy–Moeckel nonvanishing conjecture is new here.

## 1. The imported endpoint inequality

For a linearly ordered set $`[n]`$, let $`\mathcal I_n`$ denote its intervals of size at least two. An additive interval matrix is the skew-symmetric matrix whose positive-order entries have the form

```math
B_{ij}=\sum_{I\in\mathcal I_n:\ i,j\in I} b_I,
\qquad i\lt j,\qquad b_I\geq0.
```

Johnson's Proposition 4.2 states, for every even $`n\geq2`$,

```math
\mathop{\mathrm{Pf}}(B)
\geq B_{1n}\,
\mathop{\mathrm{Pf}}\bigl(B[[n]\setminus\{1,n\}]\bigr).
\tag{1}
```

Here and throughout, the empty Pfaffian is one. The proposition applies to every additive interval matrix with nonnegative coefficients, not only to matrices arising from a distance kernel. Its statement also explicitly covers every even principal submatrix. The source proves the stronger coefficientwise polynomial inequality; only the real-valued inequality (1) is needed here.

## 2. A class defined by products of circular interval factors

Place $`[n]`$ in its cyclic order. A circular interval is a consecutive block in this cyclic order; the full set is allowed. Choose finitely many circular intervals $`I`$, numbers $`t_I\geq1`$, and positive vertex factors $`d_1,\ldots,d_n`$. Define

```math
A_{ij}=d_i d_j
\prod_I t_I^{\mathbf 1_I(i)\mathbf 1_I(j)}
\qquad(i\lt j),
\tag{2}
```

and complete $`A`$ by skew-symmetry. Empty or singleton interval supports contribute no off-diagonal factor and may be discarded.

**Theorem.** Every matrix (2) of even order satisfies

```math
\mathop{\mathrm{Pf}}(A)
\geq \prod_{\{i,j\}\in M,\ i\lt j}A_{ij}
\tag{3}
```

for every perfect matching $`M`$.

We first prove four elementary facts about this class.

### 2.1 Positive diagonal scaling preserves the comparison

If $`D=\mathop{\mathrm{diag}}(d_1,\ldots,d_n)`$ with all $`d_i>0`$, then

```math
\mathop{\mathrm{Pf}}(DBD)
=\left(\prod_i d_i\right)\mathop{\mathrm{Pf}}(B).
```

Every perfect-matching product is multiplied by the same factor $`\prod_i d_i`$. Also, in an endpoint comparison, $`B_{1n}\mathop{\mathrm{Pf}}(B[[n]\setminus\{1,n\}])`$ is multiplied by this same factor. These identities follow directly from the perfect-matching expansion, since every vertex occurs exactly once.

### 2.2 Products of ordinary interval factors are additive interval matrices

For an ordinary linear interval $`I`$,

```math
t_I^{\mathbf 1_I(i)\mathbf 1_I(j)}
=1+(t_I-1)\mathbf 1_I(i)\mathbf 1_I(j).
```

Expand a finite product of these expressions. Each term is a nonnegative coefficient times

```math
\prod_{I\in\mathcal S}\mathbf 1_I(i)\mathbf 1_I(j)
=\mathbf 1_{\cap_{I\in\mathcal S}I}(i)
 \mathbf 1_{\cap_{I\in\mathcal S}I}(j).
```

The intersection of linear intervals is a linear interval, possibly empty or a singleton. The empty selection contributes the constant one, represented by the full interval $`[n]`$. Thus the product matrix has nonnegative additive interval coefficients. This is a finite algebraic expansion, requiring no convergence argument.

### 2.3 A wrapped interval can be replaced by its complement

Fix any cut of the cyclic order and regard the resulting order as linear. A proper circular interval that wraps across the cut has an ordinary-interval complement. For such an interval $`I`$, put $`u_i=\mathbf 1_I(i)`$. The identity

```math
u_i u_j
=\left(u_i-\frac12\right)
 +\left(u_j-\frac12\right)
 +(1-u_i)(1-u_j)
```

gives

```math
t_I^{\mathbf 1_I(i)\mathbf 1_I(j)}
=g_i g_j\,
t_I^{\mathbf 1_{I^c}(i)\mathbf 1_{I^c}(j)},
\qquad g_i=t_I^{\mathbf 1_I(i)-1/2}>0.
\tag{4}
```

Replace every wrapped proper interval in this way and absorb all $`g_i`$ into the positive vertex factors. Ordinary intervals and the full interval are left unchanged. The resulting matrix, after removing the positive diagonal factors, is a product of ordinary interval factors with parameters at least one. By Section 2.2 it is an additive interval matrix. Consequently, (1) can be applied after any cyclic relabeling of (2), with the diagonal factors then restored using Section 2.1.

### 2.4 Cyclic relabeling preserves the positive-order Pfaffian

For any symmetric collection of edge weights, form the skew matrix by putting those weights above the diagonal. Its Pfaffian is the sum over perfect matchings of the matching product times $`(-1)^{\mathop{\mathrm{cr}}(M)}`$, where $`\mathop{\mathrm{cr}}(M)`$ is the number of pairs of chords whose endpoints alternate in the cyclic order. Alternation is invariant under rotating the cyclic order. Hence the Pfaffian, when the same edge weights are again placed above the diagonal, is unchanged by cyclic relabeling.

Equivalently, for a one-step rotation in even order, the permutation changes the Pfaffian's sign, and reversing the moved vertex's row and column restores the positive-order entries and changes the sign back. The same observation applies to every even induced subconfiguration.

## 3. Every adjacent pair satisfies the endpoint comparison

Let $`u,v`$ be cyclically adjacent vertices of a matrix (2). Cut the circle between them so that they become the first and last vertices of the resulting linear order. By Sections 2.2–2.3, a positive diagonal scaling turns this reordered matrix into an additive interval matrix. Apply (1), undo the diagonal scaling, and use cyclic invariance from Section 2.4. We obtain

```math
\mathop{\mathrm{Pf}}(A)
\geq A_{uv}^{+}\,
\mathop{\mathrm{Pf}}\bigl(A[[n]\setminus\{u,v\}]\bigr),
\tag{5}
```

where $`A_{uv}^{+}=A_{\min(u,v),\max(u,v)}`$ is the positive edge weight. The principal submatrix is written in the original induced increasing order; cyclic invariance permits this restoration of order.

Restriction to any subset preserves class (2). Indeed, the intersection of a circular interval with the subset is a circular interval in the subset's induced cyclic order, or is empty. The vertex factors remain positive and the parameters remain at least one. Thus (5) can be applied again after deleting a matched adjacent pair.

## 4. Noncrossing matchings and uncrossing

For the original distance kernels, Johnson already gives the uncrossing argument and strictly decreasing total-length termination immediately after Conjecture 7.1. The factorwise comparison below extends that existing reduction to the circular interval-product class. The new proof step is the adjacent-pair inequality (5), which settles the noncrossing case in every order.

Every noncrossing perfect matching has a cyclically adjacent matched pair. To see this, use any linear cut and choose a matched pair with minimum index difference. If a vertex lies strictly between its endpoints, noncrossing forces that vertex to be matched to another vertex between the same endpoints. That inner pair has a smaller index difference, a contradiction. Thus the chosen pair is adjacent.

Apply (5) to such a pair. The remaining matching is noncrossing in the induced order and the remaining matrix is still in class (2). Induction on the number of vertices, with the empty matching as the initial case, proves (3) for every noncrossing perfect matching.

Now consider four cyclically ordered vertices $`i<j<k<l`$. For any circular interval $`I`$, its intersection with these four vertices is circularly consecutive. Therefore

```math
\mathbf 1_I(i)\mathbf 1_I(j)+\mathbf 1_I(k)\mathbf 1_I(l)
\geq
\mathbf 1_I(i)\mathbf 1_I(k)+\mathbf 1_I(j)\mathbf 1_I(l).
\tag{6}
```

To check (6), intersections of size zero, one, three, or four give equal sums. If the intersection has size two, those two vertices are cyclically adjacent among the four, so the right side is zero and the left side is nonnegative. This exhausts the possibilities.

As every $`t_I\geq1`$, multiplying (6)'s factorwise inequalities and canceling the common vertex factors gives

```math
A_{ij}A_{kl}\geq A_{ik}A_{jl}.
\tag{7}
```

Hence a crossing pair of matching edges $`\{i,k\},\{j,l\}`$ can be replaced by $`\{i,j\},\{k,l\}`$ without decreasing the matching product. The sum of the edge lengths in the fixed index order strictly decreases:

```math
(k-i)+(l-j)-\bigl((j-i)+(l-k)\bigr)=2(k-j)>0.
```

Repeated replacements therefore terminate at a noncrossing perfect matching. Its product is at least the original matching product, and the already proved noncrossing case bounds it above by $`\mathop{\mathrm{Pf}}(A)`$. This proves the theorem for every matching.

## 5. Log-convex distance kernels belong to this class

Return to the conjecture's kernel and ordered nodes. Let $`D=x_n-x_1`$ and, for $`i<j`$, put

```math
L_{ij}=\log f(x_j-x_i)-\log f(D).
```

Because $`f`$ is positive and nonincreasing, these are finite nonnegative real numbers and $`L_{1n}=0`$. Set the out-of-range boundary values $`L_{0j}=L_{i,n+1}=0`$. For each linear interval $`[a,b]`$ of size at least two, define

```math
\lambda_{ab}
=L_{ab}-L_{a-1,b}-L_{a,b+1}+L_{a-1,b+1}.
\tag{8}
```

All these coefficients are nonnegative. For $`a=1,b<n`$ or $`a>1,b=n`$, this follows from monotonicity. For $`a=1,b=n`$ the coefficient is zero. In the interior, write

```math
r=x_b-x_a,\qquad h=x_a-x_{a-1}>0,
\qquad k=x_{b+1}-x_b>0,
\qquad g=\log f.
```

Then

```math
\lambda_{ab}
=g(r)-g(r+h)-g(r+k)+g(r+h+k)\geq0,
```

since the increments of a convex function over a fixed positive length are nondecreasing in their starting point. No differentiability assumption is needed.

Double telescoping in (8) gives, for every $`i<j`$,

```math
L_{ij}=\sum_{a=1}^{i}\sum_{b=j}^{n}\lambda_{ab}.
```

Consequently,

```math
A_{ij}=f(D)
\prod_{[a,b]\supseteq\{i,j\}}\exp(\lambda_{ab}).
\tag{9}
```

This is (2), with $`d_i=\sqrt{f(D)}>0`$ and $`t_{[a,b]}=\exp(\lambda_{ab})\geq1`$. The theorem therefore proves Johnson's conjecture in its full stated generality.

## Sources and proof boundary

- William Johnson, *Pfaffian Positivity for Convex Kernels and Optimal Matching Bounds*, arXiv:2610.24371v1, 17 October 2026. [Primary abstract](https://arxiv.org/abs/2610.24371v1); [primary PDF](https://arxiv.org/pdf/2610.24371v1). Proposition 4.2 is on printed pages 8–9; Conjecture 7.1 is on printed page 14.
- The imported inequality is exactly Proposition 4.2 for arbitrary nonnegative additive interval coefficients. The kernel uncrossing reduction is also already stated after Conjecture 7.1. The new steps are the circular-complement gauge, its use to move the endpoint inequality to any adjacent pair, and the resulting all-matching theorem for (2).
- The previously run finite screens are exploratory checks, not premises of this proof. The stronger multivariate coefficientwise domination suggested by those screens is not asserted here.
- Priority status is recorded separately. A correct derivation is not, by itself, evidence that no earlier derivation exists.
