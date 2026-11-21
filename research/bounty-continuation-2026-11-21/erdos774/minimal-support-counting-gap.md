# Erdős 774: a minimal-support counting gap

Date: 21 November 2026.

This note diagnoses a proof route. It neither proves nor refutes Erdős 774, and it does not establish a new bounty result. The elementary calculation below was independently checked by the parent researcher and a separate review agent. The [independent review](INDEPENDENT_REVIEW.md) also checked the minimal-support local-lemma condition against the primary theorem and verified the integer-matrix countermodel.

## 1. The candidate and the exact coloring question

For $`2\leq k<n`$, give $`\bigwedge^k\mathbb R^n`$ its usual basis $`e_I`$, indexed by increasing $`k`$-subsets of $`[n]`$. Set

```math
u=e_1+\cdots+e_n,\qquad
\partial=\iota_u,\qquad
E_{n,k}=\{\partial e_I:I\in\binom{[n]}k\}.
```


A ternary relation among these columns is exactly a nonzero vector

```math
z=\sum_I z_Ie_I,\qquad
z_I\in\{-1,0,1\},\qquad \partial z=0.
```


A coloring of the columns is dissociated precisely when no such relation has monochromatic support.

The prior [simplicial extraction manuscript](https://erdosproblems.ai/wiki/research/erdos_774/routes/simplicial_extraction) considers

```math
k=\left\lfloor\frac{n}{C\log n}\right\rfloor,
\qquad 0<C<\infty\text{ fixed}.
\tag{1}
```


It gives a uniform hereditary extraction constant for this family. Its claim uses a semistable exterior-root lattice and a weak Gaussian estimate; this note does not re-prove that extraction theorem. The missing counterexample step is an unbounded number of actual dissociated colors at one fixed $`C`$.

The [prior decomposable-cycle manuscript](https://erdosproblems.ai/wiki/research/erdos_774/lemmas/decomposable_cycle_colors) gives three colors avoiding all simple-wedge ternary cycles. The [joined-boundary manuscript](https://erdosproblems.ai/wiki/research/erdos_774/lemmas/joined_boundary_colors) gives two colors avoiding another specified collection, including all joined simplex boundaries. Neither colors every ternary relation.

An opposite test is whether (1) has a bounded number of dissociated colors. A sufficiently sharp local-lemma estimate for minimal supports would prove this and close this candidate route. The corresponding estimate for **all** supports is false, as shown next.

## 2. Disjoint elementary boundaries force the all-support load to diverge

Let $`\mathcal H_{n,k}^{\mathrm{all}}`$ be the set of distinct supports of all nonzero ternary vectors in $`\ker\partial`$. For a fixed real $`\lambda>0`$, define

```math
W_{n,k}^{\mathrm{all}}(\lambda)
=
\max_{I\in\binom{[n]}k}
\sum_{\substack{T\in\mathcal H_{n,k}^{\mathrm{all}}\\I\in T}}
e^{-\lambda|T|}.
\tag{2}
```


### Proposition

Along (1), for every fixed $`\lambda>0`$,

```math
W_{n,k}^{\mathrm{all}}(\lambda)\longrightarrow\infty.
\tag{3}
```


This is a statement about a counting method, not about the chromatic number.

### Proof

For each $`(k+1)`$-set $`J`$, the chain

```math
z_J=\partial e_J
```


has coefficients in $`\{-1,0,1\}`$, support

```math
T_J=\{J\setminus\{j\}:j\in J\},
```


and zero boundary. Thus $`T_J`$ is an elementary relation support of size $`k+1`$.

Two distinct elementary supports intersect if and only if their indexing $`(k+1)`$-sets meet in exactly $`k`$ vertices. Fixing $`J`$, one obtains a conflicting set by deleting one of its $`k+1`$ vertices and inserting one of the $`n-k-1`$ outside vertices. Hence the conflict graph is regular of degree

```math
D=(k+1)(n-k-1).
```


A greedy independent set in this graph supplies elementary cycles $`z_1,\ldots,z_m`$ with pairwise disjoint supports and

```math
m\geq
\frac{\binom n{k+1}}{(k+1)(n-k-1)+1}.
\tag{4}
```


Choose a facet $`I`$ in the support of $`z_1`$. For every subset $`S\subseteq\{2,\ldots,m\}`$, the vector

```math
z_1+\sum_{j\in S}z_j
```


is a nonzero ternary cycle. The disjoint supports prevent coefficient cancellation or growth. Different $`S`$ give different supports, all containing $`I`$, with size $`(k+1)(1+|S|)`$. Writing $`a=e^{-\lambda(k+1)}`$, equation (2) therefore gives

```math
W_{n,k}^{\mathrm{all}}(\lambda)
\geq a(1+a)^{m-1}.
\tag{5}
```


It remains to check the limit exactly. Put $`s=k+1`$. The inequalities

```math
\binom ns\geq(n/s)^s,\qquad
s(n-s)+1\leq sn
```


imply

```math
\log m\geq s\log(n/s)-\log(sn).
```


Consequently,

```math
\log\frac{ma}{k}
\geq
s\bigl(\log(n/s)-\lambda\bigr)-\log(nsk).
\tag{6}
```


Under (1), $`n/k\sim C\log n`$, $`k/\log n\to\infty`$, and $`\log(n/s)\to\infty`$. Dividing the right side of (6) by $`k`$ shows that it tends to infinity. In particular,

```math
\frac{ma}{k}\longrightarrow\infty.
```


Since $`a\to0`$ and $`\log(1+a)\geq a/2`$ for $`0\leq a\leq1`$, equation (5) yields

```math
\log W_{n,k}^{\mathrm{all}}(\lambda)
\geq -\lambda(k+1)+\frac{(m-1)a}{2}
\longrightarrow\infty.
```


This proves (3).

### Scope

The large count in this proof comes from unions of disjoint elementary supports. Those unions contain smaller relation supports and add no new forbidden monochromatic event after the smaller events are excluded.

The conclusion therefore does not rule out a local-lemma proof. It shows that an unreduced sum over all ternary supports cannot provide a small weighted incidence at a fixed exponential weight. A whole-lattice theta bound does not remove this problem by itself; an additional connected or minimal-support reduction is necessary.

No new-result priority is claimed for the underlying disjoint-support principle. The calculation specifies its exact effect in this candidate family.

## 3. The precise minimal-support estimate that would suffice

Let $`\mathcal H_{n,k}^{\min}`$ consist of the inclusion-minimal members of $`\mathcal H_{n,k}^{\mathrm{all}}`$, and put

```math
W_{n,k}^{\min}(\lambda)
=
\max_I
\sum_{\substack{T\in\mathcal H_{n,k}^{\min}\\I\in T}}
e^{-\lambda|T|}.
\tag{7}
```


Every relation support contains a minimal one, because the family is finite. Thus avoiding monochromatic members of $`\mathcal H_{n,k}^{\min}`$ is equivalent to a dissociated coloring.

Every nonzero cycle has at least $`k+1`$ facets. Indeed, each of the $`k`$ ridges of one supported facet requires another supported facet to cancel its nonzero boundary coefficient. A different $`k`$-set cannot contain two distinct ridges of the original facet, so these $`k`$ additional facets are distinct.

Here is the exact standard local-lemma implication. Give every facet one of $`q\geq2`$ independent uniform colors. A support of size $`t`$ is monochromatic with probability $`q^{1-t}`$. Set

```math
x_T=e^{-\lambda|T|}.
```


Suppose $`\lambda(k+1)\geq\log2`$, so $`x_T\leq1/2`$. Use support intersection as a dependency graph. With $`W=W_{n,k}^{\min}(\lambda)`$,

```math
\sum_{U\in\Gamma(T)}x_U\leq |T|W,
\qquad
\prod_{U\in\Gamma(T)}(1-x_U)
\geq e^{-2|T|W}.
```


The asymmetric local lemma therefore applies whenever

```math
\log q
\leq
(k+1)\bigl(\log q-\lambda-2W\bigr).
\tag{8}
```


In particular, if one could prove

```math
W_{n,k}^{\min}(\lambda)=o(1)
\tag{9}
```


for a fixed $`\lambda>0`$ along (1), every fixed integer $`q>e^\lambda`$ would eventually give a dissociated coloring. This would bound the coloring number of the candidate family. It would not prove the original integer partition theorem for all proportionately dissociated sets.

The asymmetric local-lemma statement used here is the standard one, for example [Moser–Tardos, Theorem 1.1](https://arxiv.org/abs/0903.0544). Equation (9) is **not established**. Its failure would also not prove an unbounded chromatic number: the local lemma is only a sufficient condition.

## 4. Ternary-minimal is not automatically rational-support-minimal

A separate algebraic issue arises when importing simplicial-circuit estimates. Inclusion-minimal support among ternary kernel vectors need not be a support-minimal rational dependency.

For a concrete integer matrix, take

```math
A=
\begin{pmatrix}
1&-2&1&0\\
3&-4&0&1
\end{pmatrix}.
```


Its rational kernel is

```math
\ker_{\mathbb Q}A
=
\{(a,a+b,a+2b,a+4b):a,b\in\mathbb Q\}.
\tag{10}
```


If such a vector is ternary, then $`a`$ and $`b`$ are integers. The range of its four entries is $`4|b|`$, whereas a ternary vector has range at most two. Hence $`b=0`$. Its only nonzero ternary vectors are

```math
(1,1,1,1),\qquad (-1,-1,-1,-1).
```


Their four-coordinate support is ternary-minimal. But the rational kernel has dimension two and contains the proper-support vector $`(0,1,2,4)`$. Thus that support is not a rational circuit.

This is a countermodel to a **general inference about integer matrices**. It is not claimed to be a simplicial boundary matrix, nor a counterexample to Erdős 774. A theorem special to the simplicial matrices would be needed to identify the two kinds of minimality there.

Reduction modulo two creates a further scope issue: a ternary integer cycle reduces to a binary cycle, but a smaller binary cycle need not lift to an oriented ternary integer cycle with the same support.

## 5. Bounded primary comparison and stopping point

The author manuscript [Dotterrer–Guth–Kahle, *2-Complexes with Large 2-Girth*, arXiv:1509.03871v2](https://arxiv.org/pdf/1509.03871) was read at its definitions and counting theorem. It studies two-dimensional complexes and inclusion-minimal cycles over $`\mathbb Z/2`$. Its surface enumeration controls a specific fixed-dimensional random-complex problem. It does not state a weighted-incidence estimate uniform in $`k\to\infty`$ for the ternary-minimal supports in (7).

Searches for minimal simplicial-cycle enumeration, circuit counts, and lower bounds in terms of facets and vertices did not produce the missing estimate. Results about rational circuits, binary cycles, manifolds, or fixed dimension cannot be used here without proving the required transfer and uniform constants.

The present route stops at (9). Neither a bounded coloring nor unbounded actual coloring has been proved for the fixed-$`C`$ family. The original paid problem remains open in this work.

See [the exact target and eligibility audit](target-and-prior-audit.md) for the current bounty and prior-work record.
