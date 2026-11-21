# Independent review: Erdős 774 support-counting diagnosis

Date: 21 November 2026.

Reviewed file: [the author's diagnosis](minimal-support-counting-gap.md). This review checks its counting proposition, conditional local-lemma implication, and integer-matrix example. It does not certify the external hereditary-extraction theorem or establish either direction of Erdős 774. No paid target is completed.

## 1. Exact objects and quantifiers

The columns are $`\partial e_I`$, indexed by $`I\in\binom{[n]}k`$, where $`\partial=\iota_{e_1+\cdots+e_n}`$. A nonzero ternary relation is a vector $`z\in\{-1,0,1\}^{\binom nk}`$ satisfying $`\partial z=0`$.

The family $`\mathcal H^{\mathrm{all}}_{n,k}`$ contains distinct supports of these vectors. It does not count orientations, signs, or multiple vectors with one support. The load under review is

```math
W^{\mathrm{all}}_{n,k}(\lambda)
=\max_{I\in\binom{[n]}k}
\sum_{\substack{T\in\mathcal H^{\mathrm{all}}_{n,k}\\I\in T}}
e^{-\lambda|T|}.
```

The proposition fixes arbitrary real constants $`C>0`$ and $`\lambda>0`$, then lets $`n\to\infty`$ with

```math
k=\left\lfloor\frac{n}{C\log n}\right\rfloor.
```

For sufficiently large $`n`$, the conditions $`2\le k<n`$ hold. The claim is not uniform over a growing $`C`$ or a weight $`\lambda`$ depending on $`n`$.

The external [simplicial-extraction manuscript](https://erdosproblems.ai/wiki/research/erdos_774/routes/simplicial_extraction) supplies the motivation for this scale. Its extraction assertion is unnecessary for the counting proof reviewed here.

## 2. Greedy packing and distinct-support counting

For a $`(k+1)`$-subset $`J`$, the vector $`z_J=\partial e_J`$ is a ternary cycle because $`\partial^2=0`$. Its support is exactly the set of its $`k+1`$ facets.

Two distinct such supports intersect precisely when their indexing sets share $`k`$ elements. Fixing $`J`$, every conflicting indexing set is uniquely specified by deleting one element of $`J`$ and inserting one element outside it. The conflict degree is therefore exactly

```math
D=(k+1)(n-k-1).
```

A greedy independent set in this conflict graph gives pairwise disjoint elementary supports $`T_1,\ldots,T_m`$ with

```math
m\ge\frac{\binom n{k+1}}{(k+1)(n-k-1)+1}.
```

Fix any facet $`I\in T_1`$. For every $`S\subseteq\{2,\ldots,m\}`$, the sum $`z_1+\sum_{j\in S}z_j`$ remains ternary and is nonzero. Disjoint supports prevent both cancellation and coefficients of magnitude greater than one.

Its support is $`T_1\cup\bigcup_{j\in S}T_j`$. Since the sets $`T_j`$ are nonempty and disjoint, the selected indices are recoverable from this union. Thus different choices of $`S`$ give genuinely different supports, not repeated orientations of one support.

Writing $`a=e^{-\lambda(k+1)}`$, their total contribution is exactly

```math
\sum_{S\subseteq\{2,\ldots,m\}}a^{1+|S|}
=a(1+a)^{m-1}.
```

This is a valid lower bound for the displayed incidence load at the chosen facet and hence for its maximum.

## 3. The asymptotic conclusion follows at fixed constants

Put $`s=k+1`$. For $`1\le s\le n`$,

```math
\binom ns
=\prod_{j=0}^{s-1}\frac{n-j}{s-j}
\ge(n/s)^s,
\qquad
s(n-s)+1\le sn.
```

Consequently,

```math
\log\frac{ma}{k}
\ge
s\bigl(\log(n/s)-\lambda\bigr)-\log(nsk).
```

Here $`s/k\to1`$, $`n/s\sim C\log n`$, and $`\log(nsk)/k\to0`$. Dividing the right-hand side by $`k`$ therefore gives a quantity tending to infinity. In particular, $`ma/k\to\infty`$.

Also $`a\to0`$, and $`\log(1+a)\ge a/2`$ for $`0\le a\le1`$. Hence

```math
\begin{aligned}
\log W^{\mathrm{all}}_{n,k}(\lambda)
&\ge-\lambda(k+1)+(m-1)\log(1+a)\\
&\ge-\lambda(k+1)+\frac{(m-1)a}{2}
\longrightarrow\infty.
\end{aligned}
```

This establishes the author's proposition for every fixed $`C>0`$ and every fixed $`\lambda>0`$.

The proof's large supports are redundant for the coloring problem: a union of two or more of the packed elementary supports already contains a smaller relation support. Once each elementary support is nonmonochromatic, its larger unions are nonmonochromatic too. Thus divergence of this unreduced load is not a lower bound on the actual dissociated coloring number. It rules out obtaining a small value of this particular all-support sum.

## 4. The conditional minimal-support local lemma checks

Every relation support contains an inclusion-minimal ternary relation support, because the ambient family is finite. Avoiding monochromatic minimal supports is therefore equivalent to a dissociated coloring.

The minimum support size $`k+1`$ is also valid. A supported facet has $`k`$ distinct ridges, each with a nonzero contribution to its boundary. Each ridge needs another supported facet to cancel it. One other facet cannot contain two distinct ridges of the original facet, because their union is the original $`k`$-set. Thus at least $`k`$ additional facets are required.

Let $`W=W^{\min}_{n,k}(\lambda)`$ and assign independent uniform colors from a set of size $`q\ge2`$. A support of size $`t`$ is monochromatic with probability $`q^{1-t}`$. With $`x_T=e^{-\lambda|T|}`$, and assuming $`\lambda(k+1)\ge\log2`$,

```math
\sum_{U\in\Gamma(T)}x_U\le |T|W,
\qquad
\prod_{U\in\Gamma(T)}(1-x_U)\ge e^{-2|T|W}.
```

The dependency graph is valid: events on disjoint supports depend on disjoint sets of independent color variables. I independently opened [Moser–Tardos, Theorem 1.1](https://arxiv.org/pdf/0903.0544), whose asymmetric local-lemma hypothesis is exactly the one used.

It suffices that

```math
\log q
\le (k+1)(\log q-\lambda-2W).
```

This inequality itself makes the expression in parentheses positive, so replacing $`k+1`$ by any larger support size preserves it. If a fixed $`\lambda>0`$ satisfied $`W^{\min}_{n,k}(\lambda)=o(1)`$, then every fixed integer $`q>e^\lambda`$ would satisfy the conditions eventually.

That vanishing estimate is not proved. Its failure would not imply that no bounded coloring exists. Even a proof of it would settle this candidate family's coloring question, not the full arbitrary-integer-set partition conjecture.

## 5. The integer-matrix countermodel is correct and has limited scope

For

```math
A=
\begin{pmatrix}
1&-2&1&0\\
3&-4&0&1
\end{pmatrix},
```

the equations give $`x_3=2x_2-x_1`$ and $`x_4=4x_2-3x_1`$. Setting $`a=x_1`$ and $`b=x_2-x_1`$ therefore yields exactly

```math
\ker_{\mathbb Q}A
=\{(a,a+b,a+2b,a+4b):a,b\in\mathbb Q\}.
```

If the vector is ternary, both $`a`$ and $`b`$ are integers. Its largest entry minus its smallest entry is $`4|b|`$, which cannot exceed two. Hence $`b=0`$. The only nonzero ternary vectors are $`(1,1,1,1)`$ and its negative.

Their full four-coordinate support is minimal among ternary relations. But $`(0,1,2,4)`$ is a nonzero rational dependency with proper support. Thus the full support is not a rational circuit. Equivalently, the displayed full-support submatrix has rational nullity two, not one.

This disproves a general inference for integer matrices. The example is not presented as a simplicial boundary matrix and proves no failure of circuit identification for the special matrices $`E_{n,k}`$. Such an identification there would require an additional theorem. Reduction modulo two supplies only a one-way passage from a ternary integer cycle to a binary cycle; the reverse lifting needed for an imported counting estimate must be justified separately.

## Review outcome

The diagnosis passes this independent mathematical review. The fixed-constant asymptotics, distinct-support enumeration, local-lemma implication, and rational-versus-ternary countermodel are valid.

The remaining obligation is a result controlling actual ternary-minimal supports, or another argument deciding the full coloring question for the fixed-$`C`$ family. No bounded coloring, unbounded coloring, proof of Erdős 774, or refutation of Erdős 774 follows from the reviewed note. The full paid-target completion count remains zero.

