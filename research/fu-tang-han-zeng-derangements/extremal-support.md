# Fu–Tang–Han–Zeng conjecture: exact support and Catalan extreme coefficients

**Partial result only.** Let $G_n(t)$ be the excedance enumerator of $123$-avoiding derangements of length $n$, as in [Fu–Tang–Han–Zeng, Conjecture 5.11](https://arxiv.org/html/1805.08945v2#S5). This note determines its exact support, and determines the first and last coefficients when $3\mid n$. It does not establish general gamma-nonnegativity or strictly positive central gamma coefficients. In particular, positivity of a coefficient of $G_n(t)$ alone does not imply central gamma-positivity.

**Theorem.** For $n\ge1$,
$$
[t^k]G_n(t)>0\quad\Longleftrightarrow\quad
\left\lceil\frac n3\right\rceil\le k\le
\left\lfloor\frac{2n}3\right\rfloor.
$$
For $m\ge1$,
$$
[t^m]G_{3m}(t)=[t^{2m}]G_{3m}(t)
=\frac{1}{m+1}\binom{2m}{m}.
$$

## Proof

Draw the permutation as a union of directed cycles with arrows $i\to\pi(i)$. The upward arrows are exactly the excedances, and no arrow is a loop. Delete the upward arrows. Each cycle had at least one upward arrow, so this leaves disjoint descending paths, including isolated vertices. If there were $k$ upward arrows, the number of paths is $k$, since their total vertex count is $n$ and their total arrow count is $n-k$.

Three consecutive arrows $d\to c\to b\to a$, with $a<b<c<d$, would exhibit the forbidden pattern: $\pi(b)=a<\pi(c)=b<\pi(d)=c$ at increasing positions $b<c<d$. Thus each descending path has at most three vertices, and $n\le3k$. Reverse-complement preserves $123$-avoidance and swaps upward and downward arrows, so $n\le3(n-k)$ as well.

Now suppose $n=3m$ and $k=m$. Every path has the form $B\to C\to A$ with $A<C<B$; use $A,B,C$ also for the sets of labels occupying these three roles. The points $(C,A)$, $(B,C)$ are an increasing pair. In a $123$-avoider the first member of any increasing pair must be a left-to-right minimum: any earlier smaller value forms a $123$ with the pair. The second member must be a right-to-left maximum by the same argument. Consequently $\pi:C\to A$ and $\pi:B\to C$ are decreasing bijections. Hence $\min C$ maps to $\max A$; its arrow is descending, so $\max A<\min C$. Likewise $\min B$ maps to $\max C$, which gives $\max C<\min B$.

Thus $A=[m]$, $C=[m+1,2m]$ and $B=[2m+1,3m]$, with the maps on $C$ and $B$ forced. The restriction $\pi:A\to B$ is a bijection. It can be any standardization of a $123$-avoiding permutation of length $m$: the initial block of positions $A$ has values larger than every value in the other two blocks, and the other two blocks are individually decreasing, so there is no further source of a $123$. Conversely, such a choice gives a derangement with exactly $m$ excedances. The Catalan enumeration of $123$-avoiders gives the stated lower extreme; reverse-complement gives the upper one.

Finally, the empty permutation is allowed as an auxiliary construction, and placing a new outer transposition transforms a permutation $\pi$ of length $\ell$ into
$$
(\ell+2,\pi(1)+1,\ldots,\pi(\ell)+1,1).
$$
Neither new endpoint can appear in an increasing triple. This preserves being a derangement and adds exactly one excedance and two positions. For any $k$ with $\lceil n/3\rceil\le k\le\lfloor n/2\rfloor$, set $m=n-2k$ and $r=3k-n$. Start with $m$ excedances on $3m$ positions (empty if $m=0$), then apply the construction $r$ times. The result has $m+r=k$ excedances on $3m+2r=n$ positions. Reverse-complement fills the rest of the asserted support. $\square$

This also determines the first potentially nonzero gamma index: if $g_{n,j}$ denotes the coefficient in the basis $t^j(1+t)^{n-2j}$, then $g_{n,j}=0$ for $j<\lceil n/3\rceil$, $g_{n,\lceil n/3\rceil}>0$ whenever $n\ge2$, and $g_{3m,m}=C_m$. This follows by triangularity at the lowest exponent; it asserts nothing about signs at larger indices.

## Prior-work and scope notes

The original paper lists rows only through $n=10$ after Conjecture 5.11. They agree with the first nontrivial Catalan-edge coefficients $1,2,5$ but do not state the support theorem or the general Catalan-edge formula there. [Vatter, *An assortment of problems in permutation patterns*, §4](https://arxiv.org/html/2602.16355v2#S4) cites the signed part of Conjecture 5.11 and the reverse-complement parity argument but does not state these extremal formulas. Elizalde's fixed-point results cited there and [Li's two-fixed-point distance, position and excedance formulas](https://doi.org/10.5281/zenodo.22369862) concern different counts (with two fixed points in the latter's joint statistic), not the general derangement excedance support. Targeted searches combining “123-avoiding derangements” with “minimum number of excedances”, “n/3”, “3n”, and “Catalan” did not locate this exact result. Priority beyond these checked sources is not asserted.

The companion [check.py](check.py) computes all coefficients for any size using the standard increasing-chain encoding of $321$-avoiders and a two-ended scan across the antidiagonal; its arithmetic is exact. Numerical agreement is a check, not part of the theorem's proof.
