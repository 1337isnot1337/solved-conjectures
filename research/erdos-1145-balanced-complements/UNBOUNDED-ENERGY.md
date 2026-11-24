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

## Extension: one regularly varying summand, without balance

Let $A+B$ be cofinite. Suppose only that $A(x)$ is regularly varying with index $0<\alpha<1$: for fixed $t>0$, $A(tx)/A(x)\to t^\alpha$. Put $M(x)=\max\{A(x),x/A(x)\}$. Then
$$
\liminf_{N\to\infty}\frac{D(N)}N>0,
\qquad
\liminf_{N\to\infty}\frac{E(N)}{M(N)}>0 .
$$
In particular an eventually unique complement pair cannot have even one counting function regularly varying with an index strictly between zero and one. Here no termwise balance is assumed.

In the analogue of the scaling lemma, assume $x_j\to\infty$, $x_j=o(N_j)$ and $E(N_j)=o(x_j)$. The counting identities give $R(t x_j)/x_j\to t$ for fixed $t>0$. Normalize the counting measures of $A,B$ by $1/A(x_j)$ and $A(x_j)/x_j$, respectively. Regular variation gives the vague limit $d\mu(u)=\alpha u^{\alpha-1}\,du$ for $A$, and $A(x_j)B(tx_j)\le R((1+t)x_j)$ bounds the measures for $B$ locally. As in the scaling lemma every limit $\nu$ for $B$ satisfies $\mu*\nu=dt$. Laplace transforms identify it uniquely as
$$
d\nu(v)=\frac{v^{-\alpha}}{\Gamma(1+\alpha)\Gamma(1-\alpha)}\,dv .
$$
The normalization factors of the two counting measures multiply to $1/x_j$. For fixed $\epsilon\in(0,1/4)$, consider the compact strip $\epsilon\le u\le1/2$, $u\le v\le u+\epsilon$. Its boundary has zero product limit mass, so its pair count divided by $x_j$ converges to its product mass. As $v\le2u$, that product mass is at least
$$
\frac{\alpha 2^{-\alpha}}{\Gamma(1+\alpha)\Gamma(1-\alpha)}
\epsilon\log\frac1{2\epsilon}.
$$
For small enough fixed $\epsilon$ this exceeds $2\epsilon$, and the same swap argument gives $D(2x_j)\gg_\alpha x_j$. Choosing $x_j=\sqrt{N_j(1+D(N_j))}$ contradicts $D(N_j)=o(N_j)$ exactly as before.

If $E(N_j)=o(M(N_j))$, we can choose $x_j=N_j/k_j$ for integers $k_j\to\infty$ so slowly that $x_j\to\infty$ and $E(N_j)=o(M(x_j))$: for fixed $k$ the ratio $M(N_j/k)/M(N_j)$ is bounded away from zero by the regular variation of each entry of the maximum; use successive blocks at those fixed $k$. Both entries of $M(x)$ are $o(x)$, since $A(x)\to\infty$ and $A(x)/x\to0$ (the latter follows from regular variation with index $<1$ by dyadic iteration). Thus the scaling hypotheses hold. Using $R(3x_j)=O(x_j)$ yields
$$
\max_{n\le2x_j}r(n)\le\min\{A(2x_j),B(2x_j)\}
=O\left(\min\{A(x_j),x_j/A(x_j)\}\right)=O(x_j/M(x_j)).
$$
Consequently $D(2x_j)\le O(x_j/M(x_j))E(N_j)=o(x_j)$, a contradiction.

## Separate remark: finite-edit rigidity for eventual uniqueness

Two pairs of infinite subsets of the nonnegative integers, both eventually uniquely complementary, cannot differ by a nontrivial finite edit to either summand if the other summand is also changed only finitely. In fact an infinite eventual-unique pair is determined by the ordered pair of its two tails.

Write the ordinary generating functions as $F,G$ and $F+P,G+Q$, where $P,Q\in\mathbf Z[z]$. Both products are $1/(1-z)$ plus polynomials, since the coefficients are eventually one. Hence $QF+PG=R$ is polynomial. If $P,Q$ are both nonzero, then
$$
QF^2-RF+P(FG)=0
$$
makes $F$ algebraic over $\mathbf Q(z)$. If just one of $P,Q$ is nonzero, the same identity $QF+PG=R$ makes one series rational directly. The classical Fatou theorem (also a consequence of Pólya–Carlson) says an algebraic power series with coefficients in a finite set of integers is rational, so in either case one series is rational and the rational product then makes both rational. A rational series with coefficients in a finite alphabet is eventually periodic: its fixed-order coefficient recurrence is deterministic once it becomes homogeneous, and there are only finitely many states. Infinite eventual-periodic supports have positive lower density, which contradicts $A(N)B(N)\le\sum_{n\le2N}r(n)=O(N)$. Therefore $P=Q=0$. This does not preclude exceptions in an eventual-unique pair; it only shows they cannot be removed by finite edits in both summands.

## A robustness consequence of the diagonal argument

There are absolute $\delta,c>0$ such that for every cofinite pair with
$$
\limsup_{i\to\infty}|a_i/b_i-1|\le\delta,
$$
one has $\liminf_N D(N)/N\ge c$ and $\liminf_N E(N)/\sqrt N\ge c$. Indeed, if no such simultaneous constants existed, for each $j$ choose a pair with balance limsup at most $1/j$ for which at least one of the two energy lower limits is less than $1/j$. Pass to a subsequence with one fixed type of failure. In each pair the balance error is at most $2/j$ beyond a finite prefix; take sufficiently large offending $N_j$ so this prefix and the finite set of uncovered integers are negligible, just as in the uniformity argument above. After rescaling, the same equal-measure limit and the same finite difference count contradict that failure. This argument only gives existence of a universal allowable $\delta$, not a sharp threshold or explicit value.

## A quantitative bound in terms of rank-displacement diversity

For a balanced cofinite pair, let $k_N=\min\{A(N/2),B(N/2)\}$. For $i\le k_N$ let $k_{N,d}$ be the number of indices with displacement $b_i-a_i=d$, and let $K_N$ be the number of such displacement values. Then
$$
E(N)\ge\sum_d\binom{k_{N,d}}2\ge\frac12(k_N^2/K_N-k_N).
$$
For any two distinct indices of the same displacement, $(a_i,b_j)$ and $(a_j,b_i)$ give two different representations of the same sum at most $N$. These pairs of representations are disjoint as *sets of representations* across index pairs (although several pairs may produce the same target). At a target with $p\ge1$ such pairs, the excess is at least $2p-1\ge p$. This proves the first bound, and the second is Cauchy–Schwarz.

Coverage gives $A(N/3)B(N/3)\ge N/3-O(1)$. For either summand, its counting function at $N/2$ is at least the maximum of the two counting functions at $N/3$ minus $O(1)$, by termwise balance beyond a fixed prefix. Thus $k_N\gg\sqrt N$. In particular, if $K_N=o(\sqrt N)$ we obtain $E(N)\gg N/K_N$. This gives positive linear excess if only finitely many displacements occur, and $E(N)\gg N^{1-\beta}$ when $|b_i-a_i|=O((a_i+1)^\beta)$ with $0\le\beta<1/2$.
