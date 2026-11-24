# Collision energy and excess in balanced additive complements

**Scope.** This note proves two lower bounds without any bounded-representation hypothesis. The results do not resolve the original Erdős–Sárközy conjecture, already disproved in November 2026, and do not decide van Doorn–Liu–Tang Question 5.1 without the balance condition.

Let $A=\{a_1<a_2<\cdots\}$ and $B=\{b_1<b_2<\cdots\}$ be infinite sets of nonnegative integers. Suppose $a_i/b_i\to1$ and $A+B$ includes every sufficiently large integer. Define
$$
r(n)=\#\{(a,b)\in A\times B:a+b=n\},\quad
E(N)=\sum_{0\le n\le N}(r(n)-1)_+,\quad
D(N)=\sum_{0\le n\le N}\binom{r(n)}2 .
$$

**Theorem.** There exist absolute constants $c_1,c_2>0$ such that every such pair satisfies
$$
\liminf_{N\to\infty}\frac{D(N)}{N}\ge c_1,\qquad
\liminf_{N\to\infty}\frac{E(N)}{\sqrt N}\ge c_2.
$$
In particular, eventual unit multiplicity is impossible. The bounded-multiplicity consequence (positive lower density of $r(n)>1$ if $r$ is bounded) was already recorded in the [September 24 collision-density note](https://erdosproblems.ai/wiki/research/erdos_1145/collision_density).

## Local scaling lemma

Write $R(y)=\sum_{0\le n\le y}r(n)$. If $N_j\to\infty$, $x_j\to\infty$, $x_j=o(N_j)$, and $E(N_j)=o(x_j)$, then for every fixed $t\ge0$,
$$
R(t x_j)/x_j\longrightarrow t.
\tag{1}
$$
Indeed, the lower bound by $\lfloor t x_j\rfloor+1$ loses at most the fixed number of uncovered integers; the upper bound exceeds $\lfloor t x_j\rfloor+1$ by at most $E(N_j)$ once $t x_j\le N_j$.

Define nonnegative locally finite measures by $\mu_j=x_j^{-1/2}\sum_{a\in A}\delta_{a/x_j}$ and $\nu_j=x_j^{-1/2}\sum_{b\in B}\delta_{b/x_j}$. They converge vaguely to
$$
d\mu(t)=\frac{\mathbf1_{t>0}}{\sqrt{\pi t}}\,dt.
\tag{2}
$$
Here is a proof that requires no tail bound or global growth restriction. For fixed $t>0$, rank balance gives $A(t x_j)\le B(2t x_j)+C$ and $B(t x_j)\le A(2t x_j)+C$ for a constant $C$. Therefore
$$
A(t x_j)\big(A(t x_j)-C\big)\le A(t x_j)B(2t x_j)\le R(3t x_j),
$$
and symmetrically for $B$. By (1) the measures have uniformly bounded mass on each compact interval. Extract a common vaguely convergent subsequence. Its two limits coincide: for any continuous compactly supported test function, matching the terms $a_i,b_i$ changes each rescaled argument by $o(1)$ uniformly outside an arbitrary sufficiently long fixed prefix, and the number of pairs contributing is $O(\sqrt{x_j})$. More explicitly, if either argument is at most a fixed $t$, sufficiently late paired arguments are both in $[0,2t]$ and differ by at most $2t\eta$ whenever $|a_i/b_i-1|\le\eta$; divided by $\sqrt{x_j}$ the fixed prefix costs $o(1)$, and then let $\eta\downarrow0$ in the modulus of continuity.

Convolution on $[0,\infty)$ preserves this vague convergence: for compactly supported $\phi$, the test $(s,t)\mapsto\phi(s+t)$ is also compactly supported in the quadrant, where the product measures converge. By (1) the convolution limit is Lebesgue measure, so $\mu*\mu=dt$ on $[0,\infty)$. By Tonelli and positivity its Laplace transform satisfies
$$
\left(\int_0^\infty e^{-s t}\,d\mu(t)\right)^2=\frac1s\quad(s>0).
$$
The nonnegative root is the Laplace transform of (2), uniquely identifying every subsequential limit.

## A finite difference count

Under the scaling lemma, fix $\epsilon=2^{-16}$. For $k=1,\ldots,16$, partition each interval $[2^{-k},2^{1-k})$ into bins of length $\epsilon$. In a bin in that interval, the limiting mass (2) is at least $\epsilon/\sqrt{2\pi\,2^{-k}}$. After normalizing by $x_j$, the number of pairs from $A\times B$ whose two rescaled coordinates lie in the same bin converges to the sum of the squared bin masses. There are $2^{-k}/\epsilon$ bins in the $k$th interval. Thus the limiting count per $x_j$ is at least
$$
\frac{16\epsilon}{2\pi}=\frac8\pi\epsilon>2\epsilon.
$$
All these pairs satisfy $a,b\le x_j$ and $|a-b|\le\epsilon x_j$. There are at most $2\epsilon x_j+1$ integer differences in that range. If $m(d)$ counts these pairs by difference, $\binom{m(d)}2\ge(m(d)-1)_+$. Each unordered collision of differences maps injectively to an unordered collision of sums at a target at most $2x_j$, via
$$
\{(a,b),(a',b')\}\mapsto\{(a,b'),(a',b)\}.
$$
The equality of differences gives equality of swapped sums, the representatives remain distinct, and the map is its own inverse on unordered pairs when the roles of sums/differences are exchanged. It follows that
$$
D(2x_j)\ge (8/\pi-2+o(1))\,\epsilon x_j .
\tag{3}
$$

## The two conclusions

If $D(N_j)=o(N_j)$ along a subsequence, set $x_j=\sqrt{N_j(1+D(N_j))}$. Then $x_j=o(N_j)$, $D(N_j)=o(x_j)$, and $E(N_j)\le D(N_j)$. The scaling lemma applies, and (3) contradicts $D(2x_j)\le D(N_j)=o(x_j)$.

If $E(N_j)=o(\sqrt{N_j})$ along a subsequence, set $x_j=\sqrt{N_j(1+E(N_j)^2)}$. Then $x_j=o(N_j)$ and $E(N_j)=o(\sqrt{x_j})$. The local compactness bound gives $\max_{0\le n\le2x_j}r(n)\le A(2x_j)=O(\sqrt{x_j})$. Since $\binom{r}2=r(r-1)_+/2$ for every nonnegative integer $r$, we have $D(2x_j)\le O(\sqrt{x_j})E(N_j)=o(x_j)$, again contradicting (3).

The resulting lower-limit constants can be chosen absolute. Otherwise choose a different counterexample pair for each $j$, with an arbitrarily large offending $N_j$ at which the corresponding ratio is at most $1/j$. For pair $j$ choose a finite rank prefix outside which the balance error is at most $1/j$, and record its finite count of uncovered integers. Take $N_j$ so large that these two fixed numbers are $o(N_j^{1/4})$. Since both prescribed $x_j$ are at least $\sqrt{N_j}$, finite-prefix terms are $o(\sqrt{x_j})$ and coverage defects are $o(x_j)$. Every step of the same argument now applies to the varying pairs, a contradiction.

## Literature and exact status

- [Howe–Huffman–Kohlmeyer–Kruer's November 2026 paper](https://hexagonmath.org/pdf/2611.00758v1) gives balanced cofinite complements with $r(n)\le47005$, disproving Problem 1145. This construction is prior work.
- The [September 24 collision-density note](https://erdosproblems.ai/wiki/research/erdos_1145/collision_density) already gives finite-bin difference collision counting and explicit positive linear lower bounds for both quantities when $r$ is bounded. Its unconditional statement concerns $A(x)B(x)/x$, not these two bounds.
- The [October 13 nonconstant-representations note](https://erdosproblems.ai/wiki/research/erdos_1145/nonconstant_representations) already uses subsequence rescaling and Laplace limits under boundedness, showing positive lower-density disagreement from each nonzero periodic sequence. The novelty of this note, if any, is the unbounded-$r$ pair of bounds, using locally finite scaling without a global Laplace-tail estimate. No exclusive priority is claimed.
- [Van Doorn–Liu–Tang, arXiv:2610.35027v1](https://arxiv.org/html/2610.35027v1#S5) distinguish eventual uniqueness from almost-perfectness in Question 5.1. The balanced case is impossible, already implicit in the prior collision-density result; the general question remains unaffected.
