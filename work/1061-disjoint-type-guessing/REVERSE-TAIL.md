# Disjoint-type guessing with a reversible tail

This note distinguishes the **ordered** extra clause in [Lambie-Hanson–Uhrik, Mathematika (2024), Theorem 2.7](https://doi.org/10.1112/mtk.12261) from the version that allows either orientation. The previous [oriented tail proof](https://github.com/1337isnot1337/solved-conjectures/pull/1075) applies only to the ordered clause.

Normalize a disjoint type $t$ to end in $1$. Let $n$ be its width, $d$ its number of $1$'s before the last $0$, and $r$ its number of $0$'s before its final internal $1$ (or $0$ if $d=0$). Thus
```math
t=\sigma\,0^{\,n-r}1^{\,n-d},
```
where the word $\sigma$ contains $r$ zeros and $d$ ones, and $r,d<n$.

## The reverse-tail theorem in ZFC

**Theorem.** There is one ladder system on $\omega_1$ with the following property for every family $(t_k)_{k<\omega}$ with uniformly bounded $d_k,r_k$. For every $f:\omega_1\to\omega$ there are a color $k$ and a stationary set of $\beta$ of color $k$ such that, for every $\eta<\beta$, there is $\alpha<\beta$ of the same color with
```math
\mathop{\mathrm{tp}}\bigl(C_\beta[n_k],C_\alpha[n_k]\bigr)=t_k,
\qquad C_\alpha(d_k)>\eta.
```
In particular $C_\alpha(n_k)>\eta$. Note that the *ordinally later* ladder supplies the zeros of the normalized type. There is no bound on the widths.

**Universal ladders.** Choose a ladder system which realizes each finite strictly increasing ordinal tuple as an initial segment on stationarily many ordinals. For this, partition the nonzero countable limit ordinals into $\omega_1$ stationary sets, one for each finite tuple. On the set for a given tuple, prescribe it wherever its entries are below the ladder ordinal (discarding only a bounded exception). Any remaining coordinates can be filled to make a ladder.

**A stationary reservoir with finitely many flexible coordinates.** Fix the family, the coloring $f$, and $`L>\max\{\sup_k d_k,\sup_k r_k\}`$. For $|s|=L$ say that $s$ is $k$-good if $f^{-1}(k)$ meets the stationary prefix fiber of $s$ stationarily. Recursively, a shorter tuple $s$ is $k$-good if unboundedly many possible next entries $\xi$ give a $k$-good extension $s^\frown\xi$. At each tuple some color is good. At length $L$ this uses countable completeness of the nonstationary ideal. At shorter lengths use that a countable union of bounded sets is bounded. Fix $k$ for which the empty tuple is good. Every $k$-good tuple has a stationary prefix fiber of color $k$, by successively extending it to a good tuple of length $L$.

**Lay out the interleaving, then let just one coordinate vary.** Abbreviate $t=t_k$, $n=n_k$, $d=d_k$, $r=r_k$. Read $\sigma$ from left to right, choosing an increasing sequence of ordinals. A zero extends a first prefix and a one extends a second prefix. Require every extension to stay $k$-good; this is possible because each good prefix so far has length less than $L$ and unbounded good successors. Write $a'$ and $b'$ for the finished prefixes of lengths $r$ and $d$.

Choose one more entry for $a'$, above both chosen prefixes and staying good. This is the first zero after the last internal one, and $r+1\le n$. From the stationary color-$`k`$ fiber of this prefix, use Fodor's lemma finitely many times to fix all remaining entries up to length $n$. Call the resulting full prefix $a$. Let $B$ be the stationary set of color-$`k`$ vertices with prefix $a$.

There is an unbounded set $U$ of $\xi$ with $b'^\frown\xi$ good. For each $\xi\in U$ choose $\alpha_\xi$ of color $k$ with $C_{\alpha_\xi}$ extending that tuple. On a club, an ordinal $\beta$ is a limit of $U$ and $\alpha_\xi<\beta$ for every $\xi\in U\cap\beta$ (close under the map just chosen). Take any $\beta$ in this club and in $B$. For a given $\eta<\beta$, choose $\xi\in U\cap\beta$ above $\eta$ and $\max a$. For $\alpha=\alpha_\xi$, the first $d$ ones interleave with the first $r$ zeros as in $\sigma$. All other zeros of $a$ follow those first $d$ ones, and all other ones follow all entries of $a$, since they start at $\xi$. This gives exactly the stated type and tail.

## Consequences

* If the tail requirement allows either orientation, its sharp threshold in the restricted PFA models of [the original classification and preservation appendix](https://github.com/1337isnot1337/solved-conjectures/pull/1062) is **bounded depth and bounded lower reach**, even for newly named systems after any countable forcing. Sufficiency is the ZFC theorem above; necessity follows from ordinary disjoint-type guessing since every tail witness is an ordinary match.
* The same two bounds are necessary for the reverse-only clause in those models, since it also implies ordinary guessing. The proof above establishes sufficiency for that clause itself.
* The ordered version in [the separate width theorem](https://github.com/1337isnot1337/solved-conjectures/pull/1075) instead has **bounded width** as its criterion. Thus the distinction is substantive: the family $`t_k=01\,0^{k+1}1^{k+1}`$ has $d_k=r_k=1$ and widths $k+2$. It has stationary reverse-tail witnesses in ZFC but has no ordered-tail witness in the restricted PFA setting. Already the pure block family $t_k=0^{k+1}1^{k+1}$ gives a separation.
* The proof does not give the ordered witnesses used by Theorem 2.7. The late coordinate here belongs to the ladder supplying the final block of ones. The proof therefore does not solve the graph construction in the paper's Question 6.2.

The original sources and searches for the exact tail-coordinate clause, orientation reversal, and unbounded widths located no statement of this two-parameter reverse-tail criterion beyond the original bounded-width theorem. The stationary-tree starting point is the ordinary guessing proof; the additional argument uses that all terminal ones can be freed simultaneously by moving the **first** terminal one past the entire fixed zero prefix.
