# Pantone–Bóna's second-smallest-terminal asymptotic conjecture

[Bóna and Pantone, *Permutations avoiding sets of patterns with long monotone subsequences*, Conjecture 6.1](https://arxiv.org/html/2103.06918v2#S6.SS1) asks for a positive constant $C$ such that
```math
|\operatorname{Av}_n(A_{5,2})|
=|\operatorname{Av}_n(12345,12354,12453,23451)|
\sim C\,9^n n^{-3}.
```
We prove this with $C=9\sqrt3/(16\pi)$. The missing pattern is $13452$: a length-five subsequence whose first four entries increase is allowed only if its last value has rank two in that subsequence.

We use two lemmas proved in the companion notes on Conjectures 6.2 and 6.3. First, conditional on a fixed final Robinson–Schensted shape, the shape of a contiguous input interval has the same distribution as that of the initial interval of the same length; this follows from jeu-de-taquin deletion and Littlewood–Richardson commutativity ([Conjecture 6.2 proof, §1](../pantone-bona-third-largest-terminal/PROOF.md)). Second, the Poissonized chamber-walk survival and deletion method ([Conjecture 6.3 proof, §§3–4](../pantone-bona-second-largest-terminal/PROOF.md)) gives the rank-marker bound. We record the exact required extension to that method below.

## 1. Bounds for value intervals

Put $f_m=|\operatorname{Av}_m(1234)|$, so by [Regev's theorem](https://doi.org/10.1016/0001-8708(81)90012-8),
```math
f_m\sim c_3\,9^m m^{-4},\qquad c_3=81\sqrt3/(16\pi).
```
There are constants $C,B$ such that for $b=1,2$, any specified interval of $g$ consecutive values in a uniform member of $\operatorname{Av}_m(1234)$ has internal longest increasing subsequence length at most $b$ with probability at most
```math
C(g+1)^B(b/3)^g.
\tag{1}
```
To check the extension, pass to the inverse, so the value interval is a contiguous input interval. The companion location-invariance lemma allows replacing it by the first $g$ input positions. If their increasing subsequence length is at most $b$, then in the transposed recording tableau the first $g$ steps all use rows in $\{1,\ldots,b\}$. Before conditioning the pair of chamber walks on survival and a common endpoint, those steps lie in these rows with probability $(b/3)^g$. Conditional on the removed block, every subsequent estimate in the companion deletion argument is independent of its exact letters: broaden the initial staircase by factor $g+1$, retain the survival probability for the shortened walk, and use the uniform killed endpoint bound for the unmodified walk. For $g\le m/2$, these give an upper bound $C(g+1)^B(m+1)^{-4}$ on the conditioning event given the extracted block; its unconditional probability is $f_m/9^m\ge c(m+1)^{-4}$. For $g>m/2$, just divide the independent-word probability by this unconditional probability and absorb $(m+1)^4$ into a polynomial in $g+1$. This is (1). In particular, a decreasing value interval has exponential rate $1/3$, whereas an interval lacking a length-three witness has the weaker rate $2/3$.

## 2. Canonical cut and a decreasing band

An avoider with no increasing subsequence of length four contributes $f_n$. Otherwise cut at the first entry $x$ that ends an increasing subsequence of length four. The standardized front $\sigma$ has size $m=n-r$ and avoids $1234$, where $r\ge1$ counts the positions from $x$ to the end. Fix such a front, and let $s$ be the number of its labels smaller than $x$; in standardized front coordinates they are $1,\ldots,s$. A witness is a length-three increasing sequence $(a_1,a_2,a_3)$ in these labels, so $x$ can have rank four if and only if a witness exists.

For $r\ge2$, every later tail value must lie between $a_1$ and $a_2$ for every witness. Define the common band by
```math
L_s=\max_{\text{witnesses}}a_1,\qquad U_s=\min_{\text{witnesses}}a_2.
```
Call $s$ viable if there is a witness and $L_s<U_s$, and set $g_s=U_s-L_s-1$. The $r-1$ later tail values must be interleaved with these $g_s$ front values, giving at most $\binom{g_s+r-1}{r-1}$ choices. All later tail values are smaller than $x$, so this choice also fixes the rank of $x$ relative to the entire front and tail.

**The band subword of the front is decreasing.** Fix one witness $(a_1,a_2,a_3)$. A band value $y$ lies between $a_1$ and $a_2$ in value, since $a_1\le L_s<y<U_s\le a_2$. If $y$ were earlier than $a_2$ in position, then $(y,a_2,a_3)$ would itself be a witness starting above $L_s$, a contradiction. Hence every band value comes after $a_2$, and in particular after $a_1$. If two band values $y_1<y_2$ occurred in that order, then $(a_1,y_1,y_2)$ would be a witness with second value below $U_s$, also a contradiction. This stronger structure is needed: the weaker event of no length-three increasing subsequence does not give the exponential rate required below.

The later tail, with $x$ removed, avoids $A_{4,1}=\{1234,1243,1342\}$. Indeed $a_1$ lies below all its values and precedes them. If an increasing triple in this tail were followed by any value larger than its first member, prepend $a_1$ to the triple; the subsequent value would not have the required rank two in the resulting length-five sequence. This gives the stated $A_{4,1}$ avoidance. The known exponential growth of this class is $2+\sqrt5<5$, as recorded by [Bóna–Pantone, §1](https://arxiv.org/html/2103.06918v2#S1) from the Callan–Mansour generating function. Thus the number of orders of the $r-1$ later tail values is at most $C\,5^{r-1}$ (after increasing $C$ for finitely many sizes).

## 3. Tails of length at least two are lower order

If both the first and the last intervals of $\lfloor s/2\rfloor$ values among $1,\ldots,s$ contain witnesses, the first value of the high witness is larger than the second of the low witness, contradicting $L_s<U_s$. Applying (1) with $b=2$ shows
```math
\mathbb P(s\text{ viable})\le C(s+1)^B(2/3)^{\lfloor s/2\rfloor}.
\tag{2}
```
On the other hand, viability with $g_s\ge g$ exhibits a decreasing length-$g$ contiguous value interval within $1,\ldots,s$. There are at most $s+1$ such candidate intervals; (1) with $b=1$ gives
```math
\mathbb P(s\text{ viable},g_s\ge g)\le C(s+1)(g+1)^B(1/3)^g.
\tag{3}
```
For fixed $0<\epsilon<1$, the smaller of the two bounds (2), (3) is at most the first to power $\epsilon$ times the second to power $1-\epsilon$. Summing over $s$, the polynomial factor in $s$ is summable against $(2/3)^{\epsilon\lfloor s/2\rfloor}$. Therefore the expected number of viable $s$ with $g_s=g$, uniformly over the front size $m$, is bounded by
```math
C_\epsilon(g+1)^B(1/3)^{(1-\epsilon)g}.
```
Choose $\epsilon>0$ small enough that $5/9<1-(1/3)^{1-\epsilon}$, and choose $u$ strictly between these two numbers. The identity $\sum_{t\ge0}u^t\binom{g+t}t=(1-u)^{-g-1}$, summed with the last gap bound, shows that the expected total number of label placements for a tail of size $r$ is at most $C_u u^{-(r-1)}$. Including tail order and the number of fronts, the number with $r\ge2$ is bounded above by
```math
C_u f_{n-r}(5/u)^{r-1}.
```
Since $5/(9u)<1$, summing over $2\le r\le n/2$ gives $O(9^n n^{-4})$ by Regev's uniform upper bound $f_m\le C\,9^m(m+1)^{-4}$. Summing over $r>n/2$ is exponentially smaller, even dropping the factor $(n-r+1)^{-4}$. Thus all tails of length at least two are lower order.

## 4. The main term

A canonical tail of length one is admissible exactly when some length-three witness lies below its value $x$, since every four-term increasing subsequence then ends at the last position. For a standardized front of size $n-1$, if the smallest value ending a length-three witness is $T$ (take $T=n$ if absent), the number of such placements is $n-T$. By (1) with $b=2$ for an initial value interval, $\mathbb P(T>g)\le C(g+1)^B(2/3)^g$ for $g<n$, so $\mathbb E T=O(1)$ uniformly. Hence the number with tail length one is $f_{n-1}(n-O(1))\sim n f_{n-1}$. The no-tail contribution is $f_n$ and all longer tails were bounded above, so the claimed leading constant is $c_3/9=9\sqrt3/(16\pi)$. $\square$

## Attribution and priority

Bóna–Pantone already obtained exponential growth $9$ for this basis and conjectured the stated subexponential scale. The small-tail growth rate is the prior Callan–Mansour result used in their introduction. The new input for this basis is the decreasing-band restriction and its stronger exponential interval bound. Search on 24 November 2026 by the original title, precise Conjecture 6.1, basis members and proposed asymptotic did not locate an earlier proof, subject to bounded coverage.
