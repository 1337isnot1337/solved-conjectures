# Erdős 835: the top-space algebra condition and an averaging gap

Date: 2026-11-21. Research coordination: [issue 236](https://github.com/1337isnot1337/solved-conjectures/issues/236).

Status: an exact reformulation and an identified limitation of one proposed
quartic test. This is not a coloring, a nonexistence theorem, or a bounty
completion. No novelty claim is made for the algebra reformulation.

## 1. Notation and literature scope

Let $`k\ge2`$, $`p=k+1`$, $`N=\binom{2k}k`$, and let $`E`$ project onto
$`V_k=\ker D`$, where $`D`$ is the down operator on the middle layer. For the
even $`k`$ relevant after the known divisibility obstruction, $`E`$ and its
cubic tensor are given in
[the cubic feasibility note](erdos835-cubic-feasibility-barrier.md).

The product

```math
 f\star g=E(fg),\qquad f,g\in V_k,
```


where $`fg`$ is pointwise multiplication, is a Norton product. The term is
standard; it does not supply an obstruction by itself.

Two primary sources located in the literature check are
[Maldonado and Penazzi, *Lattices and Norton algebras of Johnson, Grassmann and Hamming graphs*](https://arxiv.org/abs/1204.1947)
and [Huang, *Nonassociativity of the Norton Algebras of Some Distance Regular Graphs*](https://www.combinatorics.org/ojs/index.php/eljc/article/view/v27i4p27).
Their explicit Johnson multiplication results used in the located discussion
concern the space $`V_1`$ of the second largest eigenvalue. In particular the
zero-product statement at $`n=2k`$ concerns $`V_1`$. It must not be transferred
to our top-degree space $`V_k`$. For even $`k`$, the nonzero tensor in the cubic
note proves directly that our product is not identically zero.

## 2. Exact projector characterization

The desired coloring exists at a given $`k`$ if and only if there is a real
symmetric matrix $`P`$, indexed by the $`k`$-sets, such that

```math
 P^2=P,\qquad PE=P,\qquad
 P\circ P=\frac{p-2}{N}P+\frac{k}{N^2}J.                 \tag{1}
```


Here $`\circ`$ is the entrywise product, and $`J`$ is the all-ones matrix.
The rank and diagonal need not be separately imposed: (1) forces
$`\mathop{\mathrm{rank}}P=k`$ and $`P_{AA}=k/N`$.

### Forward direction

Every class of a proper $`p`$-coloring has size $`N/p`$. This follows by counting
the rainbow stars through $`(k-1)`$-sets. Put

```math
 P_{AB}=\frac{p}{N}\left(\mathbf1_{\{c(A)=c(B)\}}-\frac1p\right).
                                                               \tag{2}
```


This is the orthogonal projector onto the span of the centered class
indicators. That span has dimension $`p-1=k`$ and lies in $`V_k`$, proving the
first two identities. Its entries are $`k/N`$ and $`-1/N`$, and both roots
satisfy the final quadratic equation in (1).

### Reverse direction

A real symmetric idempotent is an orthogonal projector, hence has nonnegative
diagonal. The entrywise equation in (1) has exactly the roots

```math
 k/N,\quad -1/N.
```


Therefore every diagonal entry is $`k/N`$, and taking the trace gives rank
$`k`$. Also $`P\mathbf1=0`$, since $`PE=P`$ and $`E\mathbf1=0`$.

If $`P_{AB}=k/N`$, the $`A`$- and $`B`$-columns coincide: their squared
distance is

```math
 \|P\mathbf e_A-P\mathbf e_B\|^2=P_{AA}+P_{BB}-2P_{AB}=0.
```


Thus the relation $`P_{AB}=k/N`$ is an equivalence relation. A class of size
$`m`$ has row sum $`((k+1)m-N)/N`$, which vanishes. Every class therefore has
size $`N/p`$, and there are exactly $`p`$ classes.

The column corresponding to a class $`F`$ is

```math
 \frac pN\mathbf1_F-\frac1N\mathbf1.
```


It lies in $`V_k`$, so applying $`D`$ shows $`D\mathbf1_F=\mathbf1`$, because
each star has $`p`$ vertices. Every star consequently contains exactly one
vertex from each class. This is the required coloring.

## 3. The associated algebra and the associativity caveat

If $`W=\mathop{\mathrm{im}}P`$, then $`\mathbb R\mathbf1\oplus W`$ is a
$`p`$-dimensional subalgebra for pointwise multiplication. Conversely, a
$`p`$-dimensional pointwise subalgebra containing $`\mathbf1`$, with its
mean-zero part contained in $`V_k`$, supplies such a partition: finite
dimensional subalgebras of real functions containing constants are the spaces
of functions constant on the classes of a partition. Applying $`D`$ to a
centered class indicator forces each class proportion to be a positive
integer multiple of $`1/p`$. Since there are $`p`$ nonempty classes and their
proportions sum to one, each proportion is $`1/p`$.

For centered class indicators $`h_i=X_i-1/p`$,

```math
 h_i\star h_i=\frac{p-2}{p}h_i,\qquad
 h_i\star h_j=-\frac{h_i+h_j}{p}\quad(i\ne j).          \tag{3}
```


Although the algebra with the constant included is associative, the projected
product on $`W`$ alone need not be associative. If $`m(u,v)=E(uv)`$ on $`W`$,
its correct associator is

```math
 m(m(u,v),w)-m(u,m(v,w))
 =\frac{\langle v,w\rangle u-\langle u,v\rangle w}{N}.
                                                               \tag{4}
```


This follows by restoring the constant term
$`uv=m(u,v)+\langle u,v\rangle\mathbf1/N`$ in the associative pointwise
product. Equation (3) is the familiar centered product of the complete graph.
Treating $`W`$ as an associative Norton subalgebra would impose a false extra
condition. A route based on classifying subalgebras would need the correct
product and the constant term.

## 4. A quartic defect whose averaged trace adds no obstruction

Let $`P_0=J/N`$, and let $`u_1,\ldots,u_k`$ be an orthonormal basis of $`W`$.
Define the nonnegative defect for products leaving the whole space
$`\mathbb R\mathbf1\oplus V_k`$:

```math
 \mathcal D(P)=\sum_{i,j=1}^k
       \|(I-E-P_0)(u_i u_j)\|^2.
                                                               \tag{5}
```


The matrix of the products in (5) is $`P\circ P`$, so

```math
 \mathcal D(P)=\mathop{\mathrm{tr}}((I-E-P_0)(P\circ P)).    \tag{6}
```


A coloring has zero defect. It is tempting to average (6) under ground-set
permutations and seek a contradiction. The already feasible pair data make
that averaged test identically zero.

To see the precise limitation, use the forced same-color pair probability

```math
 K_{AB}=1/p+kE_{AB}.
```


For entries of the form (2), the formal averaged square is

```math
\begin{split}
 \mathbb E[P_{AB}^2]
 &=\frac{k^2K_{AB}+1-K_{AB}}{N^2}
 \\ &=\frac{k}{N^2}+\frac{kp(p-2)}{N^2}E_{AB}.
\end{split}
```


In matrix form,

```math
 \overline{P\circ P}
 =\frac{k}{N^2}J+\frac{kp(p-2)}{N^2}E.                 \tag{7}
```


Both coefficients are nonnegative, and the entire matrix is supported on
$`\mathbb R\mathbf1\oplus V_k`$. Consequently the formal value of (6) is
zero. This conclusion uses only the pair marginal formula and the two possible
entry values; it supplies no distribution on actual projectors.

There is no claim that zero defect is sufficient to recover a coloring from
arbitrary relaxed data. A proof by the nonnegative defect would need an
additional fact showing that no actual rank-$`k`$ projector contained in $`V_k`$
can meet all the required closure and entry conditions. The feasible averaged
matrix (7) provides no such fact.

There is also a stronger defect that tests closure in the actual subspace:

```math
 \mathcal D_W(P)=\mathop{\mathrm{tr}}((I-P-P_0)(P\circ P)).  \tag{8}
```


For a rank-$`k`$ projector with $`P\mathbf1=0`$ and diagonal $`k/N`$, the total
product energy is $`k^2/N`$, and its constant-channel energy is $`k/N`$. Hence

```math
\begin{split}
 \mathcal D(P)&=k(k-1)/N-\langle E,P\circ P\rangle,
 \\ \mathcal D_W(P)&=k(k-1)/N-\langle P,P\circ P\rangle.
\end{split}                                                   \tag{9}
```


Both are nonnegative. The first is zero exactly when every $`u_i u_j`$ belongs
to $`\mathbb R\mathbf1\oplus V_k`$; the second is zero exactly when every
product belongs to $`\mathbb R\mathbf1\oplus W`$. These conditions must not
be conflated.

Even the formally averaged trace in the stronger test is automatic from the
pair data once the prescribed two entry values are imposed. Indeed,

```math
 \langle P,P\circ P\rangle=\sum_{A,B}P_{AB}^3,
```


and the formal moment supplied by $`K`$ is

```math
 \mathbb E[P_{AB}^3]=\frac{(k^3+1)K_{AB}-1}{N^3}.
```


Since $`\sum_{A,B}K_{AB}=N^2/p`$, the sum is
$`k(k-1)/N`$. Thus the formal average of (8) is zero as well. This is not an
actual probability distribution on projectors, and it does not discharge the
pointwise compatibility in (1). It identifies why these averaged trace tests
alone cannot supply that missing compatibility.

## 5. Exact remaining gap

The global condition (1) is substantially stronger than nonnegative three-
vertex probabilities: it requires a single compatible projection whose
entries all take the prescribed values. The current analysis has neither
constructed such a projection nor ruled it out for all remaining $`k`$.

The simple averaged product-defect traces are exhausted by the pair data. A further
attack would have to retain correlations between different pairs, classify
the relevant top-space subalgebras, or impose another condition not reduced
to (7). The $`V_1`$ Norton-algebra literature and ordinary associativity of
the centered space do not fill this gap.
