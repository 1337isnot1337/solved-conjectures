# Sagan–Wilson's plactic centralizer stability conjecture

**Result.** For every finite word $u$ on the positive integers, the plactic centralizers $C(u^k)$ are constant for all sufficiently large $k$. If $u$ is nonempty and its largest letter is $m$, one can take $k\ge K_m=m(m+1)/2+2$. This bound does not depend on the length of $u$ or on the alphabet of a word tested for commutation.

This proves both the eventual-inclusion and eventual-equality clauses of [Sagan–Wilson, *Centralizers in the plactic monoid*, Conjecture 7.2](https://users.math.msu.edu/users/bsagan/Papers/Old/cpm-pub.pdf), *Semigroup Forum* 110 (2025), 724–744, [arXiv:2410.20460](https://arxiv.org/abs/2410.20460). [Sagan–Zhao](https://doi.org/10.1007/s00233-026-10652-4) prove special cases and propose an additional sharper threshold $m$ for $m$-packed words ([preprint Conjecture 3.8](https://arxiv.org/pdf/2512.21401#page=14)), which is not claimed here. [Defant, arXiv:2605.19979v3, Section 4](https://arxiv.org/html/2605.19979v3#S4) settles two other centralizer conjectures (bounds on tableau entries and evacuation), not stability. Exact-name and author searches did not find a prior proof of the general stability assertion. We do not certify priority.

## 1. Tropical representation and a lattice inequality

Use the [Johnson–Kambites representation of the finite-rank plactic monoid](https://arxiv.org/pdf/1906.03991), specifically Lemma 2.2 and Theorem 2.8. For an ambient alphabet $[n]$ it is faithful, with one tropical matrix block per subset size $d$, indexed by the lattice of $d$-subsets of $[n]$ written increasingly and ordered coordinatewise. This is a lattice under coordinatewise minimum and maximum: those operations preserve strictly increasing tuples of a fixed size.

In the block for $d$, write $M(v)_{S,T}=-\infty$ if $S\not\le T$. For $S\le T$, the entry is the maximum number of positions of $v$ captured by a nondecreasing sequence of states in $[S,T]$. Position $i$ is captured when its letter lies in the state at $i$. This is the source's readability interpretation, since a state at each omitted position can be filled in by copying prior or subsequent states. There are no constraints that the first and last internal states equal the endpoints. Concatenation of words corresponds to tropical multiplication: on a comparable interval, $(AB)_{S,T}=\max_{R\in[S,T]}(A_{S,R}+B_{R,T})$.

For every word $v$, its matrix satisfies
$$
 M(v)_{S,T}+M(v)_{S',T'}
 \le
 M(v)_{S\wedge S',\,T\wedge T'}+
 M(v)_{S\vee S',\,T\vee T'}                              \tag{1}
$$
whenever the two original intervals are valid. Take optimizing state sequences in the two intervals and use their pointwise meet and join. These are nondecreasing sequences in the new intervals. At each position the combined multiset of entries in the two state tuples is unchanged, because each coordinate pair has merely been put in increasing order. Each tuple is strictly increasing, so the total indicator that the letter belongs to a tuple, summed over the two tuples, is also unchanged. This proves (1).

For a word $u$, write $X=M(u)$. Its diagonal $d_X(S)=X_{S,S}$ counts the letters of $u$ that lie in $S$, with their multiplicities. Let
$$
 \lambda_{S,T}=\max_{H\in[S,T]} d_X(H).
$$
The formula is used separately in each subset-size block.

## 2. Affine powers with a uniform cutoff

Suppose $u$ is nonempty with largest letter $m$ and $n\ge m$. We prove that for every comparable interval
$$
 (X^k)_{S,T}=k\lambda_{S,T}+B_{S,T}\qquad(k\ge K_m),      \tag{2}
$$
where $K_m=m(m+1)/2+2$ and $B_{S,T}$ is independent of $k$. The constants $B_{S,T}$ may depend on the block and the ambient alphabet, but the same $K_m$ works in every case.

Fix $H\in[S,T]$ attaining $\lambda=\lambda_{S,T}$. Overlay an optimal state sequence for $u^k$ from $S$ to $T$ and the constant state sequence at $H$. Taking pointwise meet and join, as in (1), gives one path in $[S,H]$ and one in $[H,T]$. Their combined score is exactly $(X^k)_{S,T}+k\lambda$. Each path is divided into its $k$ consecutive blocks, a block being one complete copy of $u$. We can place nondecreasing boundary states between blocks, so each internal sequence is between its two corresponding boundary states. Each path's initial and terminal boundaries are its displayed endpoints.

For a state $A=(A_1,\ldots,A_d)$, define its clipped potential $c(A)=\sum_i\min(A_i,m+1)$. It increases strictly along any block whose boundary states have different intersections with $[m]$: those intersections are exactly the entries of the clipped tuple smaller than $m+1$, and no coordinate decreases. For any comparable $S\le T$ its cumulative increase is at most $m(m+1)/2$. Indeed, $S_i\ge i$, and only positions $i\le m$ can contribute a difference. Consecutive increases along the two paths telescope from $S$ through $H$ to $T$. Thus there are at most $m(m+1)/2$ blocks of changing low intersection, total across the two paths.

On a block with unchanged low intersection, all internal states have that same intersection, because each clipped coordinate is constant between the two boundary states. Its score is then exactly the corresponding diagonal weight, at most $\lambda$. Delete such blocks. To preserve the endpoints of each path, keep one block of that path if otherwise no block would remain. Retained blocks stay in their original order and admit exactly the same internal state sequences after deletion: adjacent surviving sequences are ordered, and their first and last states still lie within the original endpoints. This leaves at most $K_m$ blocks total and removes at most $\lambda$ score per deleted block. If $\ell$ is the number retained, concatenate their two state sequences at $H$, padding by $k-\ell$ full blocks of constant state $H$ between them. For $k\ge K_m$, its final score is at least
$$
 (X^k)_{S,T}+k\lambda-(2k-\ell)\lambda+(k-\ell)\lambda
 =(X^k)_{S,T}.
$$
In particular an optimal path may be taken to consist of at most $K_m$ blocks before and after its constant padding at $H$, in total.

Define $B_{S,T}$ as the largest score minus $\ell\lambda$ among paths of length $\ell\le K_m$ complete blocks, split into an $S$-to-$H$ and an $H$-to-$T$ piece. This is a maximum over finitely many choices. The compression gives the upper bound in (2), and padding each of these choices gives the reverse bound. Also $B_{H,H}=0$, since exactly the one constant state is allowed on a singleton interval. This proves (2) and its uniform cutoff.

## 3. Leading tropical equalities suffice for exact commutation

Let $Y=M(w)$ for any word in $[n]$. On each interval $S\le T$ define leading constants for the two tropical products:
$$
 L_{S,T}=\max_{\substack{R\in[S,T]\\ \lambda_{S,R}=\lambda_{S,T}}}
                 (B_{S,R}+Y_{R,T}),\qquad
 R_{S,T}=\max_{\substack{R\in[S,T]\\ \lambda_{R,T}=\lambda_{S,T}}}
                 (Y_{S,R}+B_{R,T}).
$$
Both maxima are over nonempty sets, using $R=T$ on the left and $R=S$ on the right. For each fixed $Y$, they are exactly the eventual $k$-independent remainders of the $S,T$ entries of $X^kY$ and $YX^k$, after subtracting $k\lambda_{S,T}$: each is a finite maximum of affine-linear terms, with highest slope $\lambda_{S,T}$. Therefore if $Y$ commutes with $X^a$ at any $a\ge1$, it also commutes at all positive multiples of $a$, and $L_{S,T}=R_{S,T}$ on every interval.

The point is that the same leading equalities suffice for actual commutation as soon as $k\ge K_m$, even when $Y$ varies. Suppose all of them hold. Fix $S\le T$, write $\lambda=\lambda_{S,T}$, and choose a minimal attaining state $H\in[S,T]$ under the lattice order. For an arbitrary split $J\in[S,T]$, put $P=J\wedge H$, $Q=J\vee H$. The only $\lambda$-attaining state in $[P,H]$ is $H$, by minimality. On this interval, the leading left constant is $B_{P,H}+Y_{H,H}$, since only the final split $H$ can produce $\lambda$ in a left factor. The leading right constant is at least $Y_{P,H}+B_{H,H}=Y_{P,H}$. Their equality gives
$$
 Y_{P,H}\le B_{P,H}+Y_{H,H}.
$$
Apply (1) to $Y_{J,T}+Y_{H,H}$ and subtract $Y_{H,H}$ to get
$$
 Y_{J,T}\le B_{P,H}+Y_{Q,T}.                                \tag{3}
$$
The same inequality (1) for $M(u^k)$, with intervals $[S,J]$ and $[P,H]$, gives
$$
 (X^k)_{S,J}+(X^k)_{P,H}
 \le (X^k)_{S,P}+(X^k)_{P,Q}
 \le (X^{2k})_{S,Q}.
$$
Both $[P,H]$ and $[S,Q]$ contain $H$, so their rate is $\lambda$. Applying (2) at $k$ and at $2k$ yields $(X^k)_{S,J}+B_{P,H}\le (X^k)_{S,Q}$. Together with (3), the original split term for $X^kY$ is bounded by the split term at $Q$, which has the leading slope. Hence $(X^kY)_{S,T}=k\lambda+L_{S,T}$ for every $k\ge K_m$.

For the right product choose instead a maximal attaining state $H$. Again put $P=J\wedge H,Q=J\vee H$ for any split $J$. The only maximum in $[H,Q]$ is $H$. The leading equality on $[H,Q]$ gives $Y_{H,Q}\le Y_{H,H}+B_{H,Q}$. Applying (1) to $Y_{S,J}+Y_{H,H}$ gives $Y_{S,J}\le Y_{S,P}+B_{H,Q}$. Applying (1) to the two $X^k$ intervals $[J,T]$ and $[H,Q]$ gives
$$
 (X^k)_{J,T}+(X^k)_{H,Q}
 \le (X^k)_{P,Q}+(X^k)_{Q,T}
 \le (X^{2k})_{P,T}.
$$
The rates on $[H,Q]$ and $[P,T]$ are both $\lambda$. By (2), $(X^k)_{J,T}+B_{H,Q}\le(X^k)_{P,T}$, so the right term at $J$ is bounded by the leading-slope term at $P$. This proves $(YX^k)_{S,T}=k\lambda+R_{S,T}$ for every $k\ge K_m$. Equality of the leading constants now yields actual commutation.

## 4. Return to the infinite alphabet

For arbitrary finite $w$, choose an ambient finite alphabet $[n]$ containing $u,w$. Knuth equivalence agrees with equality of the faithful Johnson–Kambites matrices there. If $w\in C(u^a)$ for any $a\ge1$, its matrices satisfy all leading equalities by the multiples argument. Thus $w\in C(u^k)$ for every $k\ge K_m$, with $K_m$ independent of the choice of $n$ and $w$. In particular
$$
 C(u^k)=\bigcup_{a\ge1}C(u^a)\qquad(k\ge K_m).
$$
The empty word commutes with every word at every exponent. This completes the proof.
