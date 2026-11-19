# Rectangle partitions when both sides grow

Let $p(h,w)$ be the number of multisets of integer-sided rectangular blocks that tile an $h\times w$ rectangle with sides parallel to the axes. A block may be rotated, and different arrangements of the same multiset count once. All logarithms are natural.

**Theorem.** For integers $h\le w$, put $N=hw$ and $U=\min(h,N^{1/4})$. As $h\to\infty$, uniformly for all $w\ge h$,
$$
\log p(h,w)=(\pi\sqrt{2/3}+o(1))\sqrt{N\log U}.
$$

This proves both growing-side assertions of Gajdzica and Zakarczemny’s Remark 5.9. Indeed $\frac12\log h\le\log U\le\frac14\log N$, giving their lower and upper constants $\pi/\sqrt3$ and $\pi/\sqrt6$, respectively. If $\log w\sim\log h$, then $\log U\sim\frac12\log h$ and the lower bound is sharp. The theorem also identifies the leading logarithmic term at every intermediate aspect ratio. The two expressions for $U$ agree at $w=h^3$. [Original conjecture, Remark 5.9](https://arxiv.org/pdf/2608.08762#page=16)

## Upper bound

Every feasible multiset has total area $N$ and its blocks have smaller side at most $h$. First, dropping the restriction on the smaller side gives the multiset count $R(N)$ of Lemma 5.1 of the original paper. That lemma gives
$$
\log p(h,w)\le \log R(N)\le(\pi/\sqrt6+o(1))\sqrt{N\log N}.
$$
Second, overcount the block types by ordered pairs $(a,b)$ with $1\le a\le h$ and $b\ge1$. For $t>0$ the logarithm of their multiset generating function evaluated at $e^{-t}$ is at most
$$
\sum_{a=1}^{h}\sum_{k\ge1}\frac1{k(e^{tak}-1)}
\le \frac{\pi^2 H_h}{6t}, \qquad H_h=\sum_{a=1}^h\frac1a.
$$
Thus $\log p(h,w)\le tN+\pi^2H_h/(6t)$. Minimizing gives $\pi\sqrt{2NH_h/3}$, the explicit upper bound in the authors’ fixed-height paper. Taking the smaller of the two bounds and using $H_h=\log h+O(1)$ proves the required upper bound uniformly. [Lemma 5.1](https://arxiv.org/pdf/2608.08762) · [Theorem 1.1](https://arxiv.org/pdf/2608.22955)

## A packing lower bound

Write $P(T)$ for the ordinary integer partition function and set $\mu(T)=\lceil2\sqrt{T}\log T\rceil$. For all sufficiently large $T$ at least $P(T)/2$ partitions of $T$ have largest part at most $\mu(T)$ (Gajdzica–Zakarczemny, Lemma 5.4). From these partitions delete all parts below $a$. Each resulting partition $\lambda$ has total at most $T$, with every part $b$ satisfying $a\le b\le\mu(T)$. It has at most $(T+1)^{a-1}$ preimages, by recording the deleted multiplicities. Consequently there are at least $P(T)/(2(T+1)^{a-1})$ choices. The threshold on $T$ is absolute. [Lemma 5.4](https://arxiv.org/pdf/2608.08762)

For each integer $a$ in a range $I$ starting at $a\ge2$, reserve $Q_a$ strips of height $a$ and integer width $B_a$, disjoint across all reservations. Let $\delta\in(0,1)$ and set $T_a=\lfloor(1-\delta)Q_aB_a\rfloor$. Suppose $\mu(T_a)\le\delta B_a$. Pick a partition $\lambda_a$ as above and turn each part $b$ into a block $a\times b$. Pack the blocks successively into the reserved strips, starting a new strip whenever the next block does not fit. Every abandoned strip contains width greater than $B_a-\mu(T_a)$, whereas the total width is at most $T_a\le Q_a(B_a-\mu(T_a))$. Thus the blocks fit, as in the authors’ Lemma 5.5. Use integer coordinates throughout and fill all unused cells of the board with unit squares.

This map into tile multisets is injective. Remove the unit squares and sort the remaining blocks by their smaller side. Since $b\ge a\ge2$, the class with smaller side $a$ recovers exactly $\lambda_a$, including square blocks. Taking a logarithm gives
$$
\log p(h,w)\ge\sum_{a\in I}\log P(T_a)
-\sum_{a\in I}\big((a-1)\log(T_a+1)+\log 2\big). \tag{1}
$$

## Two strip reservations

Put $\ell=\log h$, $a_0=\lceil\ell^2\rceil$, $\delta=\ell^{-1/2}$, and $s=w/h$. Only sufficiently large $h$ is needed below. Define the upper endpoint $M$, the range $I=[a_0,M]\cap\mathbb Z$, and $L=\sum_{a\in I}1/a$ as follows.

**If $1\le s\le\ell^8$**, take $M=\lfloor\sqrt h/\ell^2\rfloor$. Then $\log U=\frac12\ell+O(\log\ell)$ and $L=\log U+O(\log\ell)$. Set
$$
Q_a=\left\lfloor\frac{h}{La^2}\right\rfloor,\qquad B_a=w .
$$
The strips can be stacked because $\sum_a aQ_a\le h$. The argument of the floor is uniformly $\gg\ell^3$ even at $a=M$. Consequently
$$
T_a=(1+o(1))\,\frac{N}{La^2} \tag{2}
$$
uniformly. Since $T_a\le N/(La^2)$ and $\log N=O(\ell)$ here,
$$
\frac{\mu(T_a)}{w}\ll\frac{1}{w}+\frac{\sqrt{h/w}\,\log N}{a\sqrt L}
=O(\ell^{-3/2})=o(\delta).
$$

**If $s>\ell^8$**, take $M=\lfloor U/\ell^2\rfloor$. Again $L=\log U+O(\log\ell)$, by the harmonic-sum estimate. Reserve side-by-side columns of integer widths $B_a$ across the board, placing $Q_a$ strips inside each column, with
$$
Q_a=\left\lfloor\frac{h}{a}\right\rfloor,\qquad
B_a=\left\lfloor\frac{w}{La}\right\rfloor .
$$
Indeed $aQ_a\le h$ and $\sum_a B_a\le w$. Both arguments of the floors grow uniformly: $h/a\ge\ell^2$ and $w/(La)\ge s\ell^2/L$. Hence (2) also holds here. In particular,
$$
\frac{\mu(T_a)}{B_a}
\ll \frac{1}{B_a}+\sqrt{\frac{L}{s}}\,\log N .
$$
The first term is $O(\ell^{-9})$. For the second, $(2\ell+\log s)/\sqrt s$ decreases for $s\ge\ell^8$ once $h$ is large. Its value at $\ell^8$ is $O(\ell^{-3})$. Since $L=O(\ell)$ and $\log N=2\ell+\log s$, the second term is $O(\ell^{-5/2})=o(\delta)$. This bound also covers widths growing faster than any power of $h$.

## Summation

In both constructions, $L\sim\log U$, with $\log U\ge\ell/2$. Also $M\le\min(h,N^{1/4})/\ell^2$ in both cases. In particular $M^2\le\sqrt N/\ell^4$. For sufficiently large $h$, (2) gives $T_a\ge N/(2LM^2)\ge\sqrt N\,\ell^4/(2L)$ for every $a$. This lower bound tends to infinity uniformly. Moreover $T_a/a^2\ge N/(2LM^4)\ge\ell^8/(2L)$, so $a\le\mu(T_a)$ throughout the construction. The Hardy–Ramanujan formula $\log P(T)\sim\pi\sqrt{2T/3}$ and (2) give
$$
\sum_{a\in I}\log P(T_a)
=(\pi\sqrt{2/3}+o(1))\sqrt{N/L}\sum_{a\in I}\frac1a
=(\pi\sqrt{2/3}+o(1))\sqrt{N\log U}.
$$
The subtracted quantity in (1) is $O(M^2\log(N+1))=O(\sqrt N/\ell^3)$. For $N\le h^4$ use $M^2\le\sqrt N/\ell^4$ and $\log N\le4\ell$. For $N>h^4$ use $M^2\le h^2/\ell^4$ and the decrease of $\log x/\sqrt x$ on $x\ge h^4$. Thus the loss is negligible uniformly, completing the proof.

## Scope and prior work

The square theorem, the unrestricted multiset upper bound, the partition truncation estimate, and the shelf-packing observation are due to Gajdzica and Zakarczemny. Their later paper also uses separate columns for different smaller sides to prove the fixed-height formula. The contribution here is the uniform choice of the active smaller-side range and the two reservations. They attain the better of the two known upper bounds for every sequence of rectangles whose shorter side tends to infinity. The result is an asymptotic for the logarithm. [Square case and conjecture](https://arxiv.org/abs/2608.08762) · [Fixed-height theorem](https://arxiv.org/abs/2608.22955)

A November 18, 2026 search by author, statement, aspect ratio, and citing paper found no prior proof of the growing-side conjecture. The fixed-height theorem, Shaikh’s bounded-bar theorem and a subsequent two-row result concern other regimes. The proof above is unrefereed and historical priority remains unconfirmed. [Restricted bars](https://arxiv.org/abs/2609.13305) · [Two-row result](https://doi.org/10.66977/xsci.2611.002b)

The [finite verifier](verify.py) enumerates small instances of the two strip constructions, checks disjointness cell by cell, and recovers each input family from its unordered tile multiset. The limiting estimates follow from the proof above.
