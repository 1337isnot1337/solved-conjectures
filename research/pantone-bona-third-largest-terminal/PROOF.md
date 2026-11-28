# Pantone–Bóna's third-largest-terminal asymptotic conjecture

[Bóna and Pantone, Conjecture 6.2](https://arxiv.org/html/2103.06918v2#S6.SS2) asks for a positive constant $C$ such that
```math
|\mathop{\mathrm{Av}}_n(12345,12354,13452,23451)|
\sim C\,9^n n^{-3}.
```
We prove this with $C=9\sqrt3/(16\pi)$, and prove the analogous asymptotic for every fixed pattern length $k\ge5$. The proof uses the uniform marker-free interval estimate for bounded-LIS permutations established in Sections 3–4 of the [companion proof of Conjecture 6.3](../pantone-bona-second-largest-terminal/PROOF.md). No conjectural generating function is used.

## Statement

Fix $d\ge3$, put $k=d+2$, and let $A_{k,k-2}$ contain all patterns of length $k$ whose first $k-1$ entries increase except the one whose last entry is their third largest. Thus a forbidden occurrence consists of an increasing sequence of length $d+1$, followed by a value not strictly between the last two values of its first $d$ entries.

Write
```math
f_m=|\mathop{\mathrm{Av}}_m(12\cdots(d+1))|,\qquad
\alpha=(d^2-1)/2.
```
With $f_m\sim c_d d^{2m}m^{-\alpha}$ as in [Regev's theorem](https://doi.org/10.1016/0001-8708(81)90012-8), we prove
```math
|\mathop{\mathrm{Av}}_n(A_{k,k-2})|
\sim \frac{c_d}{d^2}\,d^{2n}n^{1-\alpha}.
\tag{1}
```

## 1. The location-invariant witness estimate

For a permutation $\sigma$ of length $m$ with longest increasing subsequence length at most $d$, a rank-$`d`$ marker is a value ending an increasing sequence of length $d$. Put $q=1-1/d$. The companion marker estimate states that, under the uniform law on these permutations, any specified interval of $g$ consecutive values contains no marker with probability at most $C_d(g+1)^Bq^g$, where $C_d,B$ depend only on $d$. We need the following related bound:
```math
\mathbb P(\text{a specified interval of }g\text{ consecutive values has no internal increasing sequence of length }d)
\le C_d(g+1)^B q^g.
\tag{2}
```
Here internal means that all $d$ values of the sequence are in the interval. It is a stronger requirement on the proof: a noninitial interval may have markers whose witnessing subsequences start below it.

We use a location-invariance fact about Robinson–Schensted shapes. Under the uniform law on permutations of length $m$ with a prescribed final Robinson–Schensted shape $\lambda$, the shape of the standardized contiguous subword of length $g$ beginning after position $a$ has a law depending only on $g$, not on $a$. In fact the recording tableau of the subword is the rectification of the skew subtableau containing the recording labels $a+1,\ldots,a+g$. To see this, first cut the recording tableau off after label $a+g$ (this truncates the input prefix); then apply the classical fact that removing the first input position corresponds to removing the smallest recording label and sliding by jeu de taquin, iterated $a$ times. See [Romik–Śniady, *Jeu de taquin dynamics on infinite Young tableaux and second class particles*, §2](https://www.math.ucdavis.edu/~romik/data/uploads/papers/plancherel.pdf) for the finite remove-first identity.

Let $\mu,\eta$ be the shapes after the first $a$ and $a+g$ recording steps, and let $\nu$ be the rectified shape of the interval. The number of possible recording tableaux with this $\nu$ is
```math
f^\nu\sum_{\mu,\eta} f^\mu c_{\mu,\nu}^{\eta} f^{\lambda/\eta}
=f^\nu [s_\lambda]\big(p_1^a s_\nu p_1^{m-a-g}\big)
=f^\nu f^{\lambda/\nu}.
\tag{3}
```
Here $c_{\mu,\nu}^\eta$ is a Littlewood–Richardson coefficient, counted by skew tableaux rectifying to any fixed straight standard tableau of shape $\nu$, and $p_1=s_{(1)}$. The first coefficient identity follows from the Littlewood–Richardson rule and the one-box Pieri rule, and the second by commutativity followed by repeated one-box Pieri. As usual an uncontained skew shape counts zero. Conditional on $\lambda$, the recording tableau is uniform, so (3) proves the location-invariance. It remains true under any mixture of final shapes, in particular under the longest-increasing-subsequence restriction.

Now pass to $\sigma^{-1}$, which is also uniform with the same restriction. The subpermutation cut out by an interval of $g$ values of $\sigma$ is, after inversion and standardization, the contiguous block of $g$ positions of $\sigma^{-1}$; inversion preserves the longest increasing subsequence. By location-invariance, the shape of this block is distributed as the shape associated with the first $g$ positions of $\sigma^{-1}$, hence as that of the subpermutation on the smallest $g$ values of $\sigma$. This initial interval has no internal increasing sequence of length $d$ precisely when it contains no rank-$`d`$ marker: any increasing sequence ending at a value at most $g$ uses only such values, and all ranks are at most $d$. The companion estimate now proves (2).

## 2. Canonical first high entry and the shared value band

For a permutation, call the longest increasing subsequence length ending at a given entry its rank. An $A_{k,k-2}$-avoiding permutation with no entry of rank $d+1$ contributes $f_n$. Otherwise cut it at its first such entry $x$. Its standardized front $\sigma$ has length $m=n-r$ and longest increasing subsequence length at most $d$, where $r\ge1$ is the tail size including $x$. This split is unique, and the increasing pattern of length $d+2$ is forbidden.

Let $s$ be the number of front labels smaller than $x$, so in the standardized front they are precisely $1,\ldots,s$. Let a witness be a length-$`d`$ increasing sequence $(a_1,\ldots,a_d)$ among those labels. At least one witness must exist because $x$ has rank $d+1$. If $r=1$, this is the only condition: every increasing sequence of length $d+1$ ends at the last position and has no entry after it. For a fixed front, each valid $s$ determines a unique relabeling and hence an avoiding permutation.

For $r\ge2$, every later tail value has relative rank $d$ among the $d+2$ entries when placed after any witness and $x$. Thus it is smaller than $x$ and must lie between $a_{d-1}$ and $a_d$ for **every** witness. In standardized front coordinates let
```math
L_s=\max_{\text{witnesses}} a_{d-1},\qquad
U_s=\min_{\text{witnesses}} a_d.
```
We call $s$ viable if there is a witness and $L_s<U_s$. For a viable $s$, the later tail values must lie strictly between the front labels $L_s,U_s$ when interleaved with the front labels, and the band contains exactly $g_s=U_s-L_s-1$ existing front labels. Once $s$ and the number $r-1$ of later tail labels are fixed, there are at most $\binom{g_s+r-1}{r-1}$ ways to select the relative values: interleave the new labels with the $g_s$ front labels in that band, and place $x$ immediately after the first $s$ front labels and all $r-1$ new labels in value order. Conditions on the order of the selected later tail values can only decrease this bound.

For such a viable split the later tail, without $x$, avoids both $123$ and $132$. Fix a witness. Its first $d-1$ entries are below every later tail entry and occur before all of them. If the later tail had an increasing pair followed by an entry larger than the first of the pair, prepend these $d-1$ witness entries to the pair to obtain an increasing sequence of length $d+1$. The subsequent entry would then be larger than that sequence's $`d`$th value, a forbidden final rank. This proves the avoidance property. The number of $123,132$-avoiders of length $t\ge1$ is $2^{t-1}$: the first entry must be one of the two largest (otherwise two greater entries follow and one of the two patterns results), and this condition recursively suffices. Consequently there are at most $2^{r-1}$ orders for the $r-1$ later tail labels. This deliberately overcounts but is sufficient.

## 3. The long-tail sum is lower order

Uniformly over fronts of length $m$, viability at a specified $s$ is exponentially rare as $s$ increases. Take the first and last $\lfloor s/2\rfloor$ intervals among $1,\ldots,s$ (disregard the single middle value if $s$ is odd). If each has a witness, the second-to-last value in the high witness is larger than the last value in the low witness, so $L_s>U_s$. By (2), the probability of viability is at most
```math
C_d (s+1)^B q^{\lfloor s/2\rfloor}.
\tag{4}
```
For very small $s$ the bound is still valid after adjusting the constant, and no witness exists for $s<d$.

Also, a viable band of size at least $g$ contains a length-$`g`$ interval with no internal length-$`d`$ increasing sequence. Otherwise its last value would be less than $U_s$ and supply a witness contradicting the minimality of $U_s$. There are at most $s+1$ candidate intervals within the first $s$ labels, including the harmless $g=0$ case. By (2),
```math
\mathbb P(s\text{ viable and }g_s\ge g)
\le C_d (s+1)(g+1)^Bq^g.
\tag{5}
```

For any fixed $0<\epsilon<1$, a number bounded by $A$ and $B'$ is at most $A^\epsilon (B')^{1-\epsilon}$. Apply this to (4) and (5) and sum over all $s$. The polynomial in $s$ is summable against $q^{\epsilon\lfloor s/2\rfloor}$. It follows that, for some constant and exponent depending only on $d,\epsilon$, the expected number of viable $s$ with band size exactly $g$ is at most
```math
C_{d,\epsilon}(g+1)^B q^{(1-\epsilon)g}.
\tag{6}
```

Choose $\epsilon>0$ small enough that $2/d^2<1-q^{1-\epsilon}$, possible since $d\ge3$ and $1-q=1/d$. Fix $u$ strictly between those two quantities. From (6) and $\sum_{t\ge0}\binom{g+t}{t}u^t=(1-u)^{-g-1}$, the expected (over uniform fronts) sum over viable $s$ of $\binom{g_s+r-1}{r-1}$ is bounded by $C_{d,u}u^{-(r-1)}$. Indeed the sum of this generating series over all $g$ converges, because $q^{1-\epsilon}<1-u$. Multiplying by the tail order bound from Section 2, the number of avoiders with canonical tail size $r\ge2$ is at most
```math
C_{d,u} f_{n-r}(2/u)^{r-1}.
\tag{7}
```
This also holds when $n-r=0$, since then no witnesses exist.

For $r\le n/2$, Regev's upper bound $f_m\le C_d d^{2m}(m+1)^{-\alpha}$ gives (7) at most a constant times $d^{2n}n^{-\alpha}(2/(ud^2))^r$. For $r>n/2$ the factor $(m+1)^{-\alpha}$ can be dropped and summing the geometric factor is exponentially small. As $2/(ud^2)<1$, all tails of size at least two together contribute $O_{d}(d^{2n}n^{-\alpha})$.

## 4. The leading term

In a front of size $m$, let $T$ be its smallest rank-$`d`$ marker value, or $m+1$ if none exists. Precisely $m+1-T$ cuts $s$ admit a witness below their first-tail value. By the companion estimate the probability $T>g$ is at most $C_d(g+1)^Bq^g$ for $0\le g\le m$. Thus $\mathbb E T=O_d(1)$, uniformly in $m$. The exact number with canonical tail length one is
```math
f_{n-1}\big(n-\mathbb E_{n-1}T\big)\sim n f_{n-1}.
```
The front-only contribution $f_n$ and all longer tails are lower order by the preceding section. This proves (1). At $d=3$, [Regev's constant](https://arxiv.org/html/2306.12682v2#S5.SS1) is $c_3=81\sqrt3/(16\pi)$, giving $c_3/9=9\sqrt3/(16\pi)$ as claimed. $\square$

## Attribution and priority

The conjecture and exponential growth were given in the original Bóna–Pantone paper; its proof of the growth rate already used the positional rank of the first highest-rank entry. Robinson–Schensted, the finite jeu-de-taquin deletion identity and the Littlewood–Richardson rule are classical. The proof here combines the interval witness estimate with a common-band restriction to isolate the entire leading single-entry-tail contribution. Searches on 24 November 2026 for the original title, Conjecture 6.2, $A_{5,3}$, its four forbidden patterns and the asymptotic did not locate an earlier resolution. This is a bounded priority search, not a claim of worldwide absence.
