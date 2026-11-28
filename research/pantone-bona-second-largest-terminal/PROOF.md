# Pantone–Bóna's second-largest-terminal asymptotic conjecture

[Conjecture 6.3 of Bóna and Pantone, *Permutations avoiding sets of patterns with long monotone subsequences*](https://arxiv.org/html/2103.06918v2#S6.SS3) asserts that
```math
|\mathop{\mathrm{Av}}_n(12345,12453,13452,23451)|\sim C\,9^n n^{-3}
```
for some $C>0$. We prove this with $C=27\sqrt3/(32\pi)$ and give a formula at every fixed pattern length $k\ge4$. This is a different conjecture from their Conjecture 6.4 for $A_{5,5}$; the proof here uses a decreasing tail and a uniform gap estimate.

## Theorem

Fix $d\ge2$, set $k=d+2$, and let $A_{k,k-1}$ consist of the patterns of length $k$ whose first $k-1$ entries increase and whose last entry is not their second largest. Write
```math
f_m=|\mathop{\mathrm{Av}}_m(12\cdots(d+1))|,\quad
\alpha=(d^2-1)/2,\quad
f_m\sim c_d\,d^{2m}m^{-\alpha}.
```
The last asymptotic is [Regev's theorem](https://doi.org/10.1016/0001-8708(81)90012-8). Then
```math
|\mathop{\mathrm{Av}}_n(A_{k,k-1})|
\sim \frac{c_d}{d(d-1)}\,d^{2n}n^{1-\alpha}.
\tag{1}
```

## 1. A canonical split at the first entry of rank $d+1$

The rank of an entry is the maximal length of an increasing subsequence ending there. As in [Bóna–Pantone, Theorem 4.1](https://arxiv.org/html/2103.06918v2#S4), an $A_{k,k-1}$-avoider consists of a front avoiding the increasing pattern of length $d+1$, followed by a decreasing tail starting at its first rank-$`d+1`$ entry, unless no such entry exists. Indeed the increasing pattern of length $d+2$ is forbidden. Once a rank-$`d+1`$ entry has been reached, all subsequent entries lie between the largest and second-largest entries of any witnessing increasing subsequence, and hence also have rank $d+1$. Two rank-$`d+1`$ entries cannot increase.

Consider a standardized front $\sigma$ of length $m$. Call a front value a marker if the corresponding entry has rank $d$. In the numerically sorted list of front values, look at the gaps immediately after markers: a gap between consecutive markers, or the terminal gap after the last marker. It has size $g$ if it contains $g$ nonmarker values. The gap before the first marker is excluded. Let $Z_g(\sigma)$ be the number of such gaps of size $g$.

For a nonempty decreasing tail of length $r$, the split is the canonical split of an avoider if and only if all $r$ new labels are inserted into a single one of these gaps in value order. To see this, any increasing subsequence of length $d+1$ in the proposed permutation uses exactly one tail entry $t$, at its end. Such subsequences are obtained by appending $t$ to increasing subsequences of length $d$ in the front ending at marker values $y<t$. Let the maximum and minimum tail labels be $t_{\max}$ and $t_{\min}$. The first entry of the tail has rank $d+1$ exactly when some marker lies below $t_{\max}$. For $r\ge2$, the allowed relative rank of every subsequent tail entry $x<t$ requires that any marker $y<t$ be below $x$. Applying this to $t=t_{\max}$ and $x=t_{\min}$ shows all markers below $t_{\max}$ must lie below $t_{\min}$, a condition also sufficient for every pair $t>x$. Together these conditions say exactly that all new labels lie in a single gap following a marker. For $r=1$, the sole condition is that the new label lie above some marker, which is the same gap rule.

There are $\binom{g+r}{r}$ ways to interleave the new labels with the $g$ front values of the selected gap in value order. Each choice fixes the new values of every front entry by increasing relabeling, and fixes the tail by decreasing order. Let $\mathbb E_m$ denote uniform expectation over the $f_m$ possible fronts. By uniqueness of the split,
```math
|\mathop{\mathrm{Av}}_n(A_{k,k-1})|
=f_n+\sum_{r=1}^n f_{n-r}\,
 \mathbb E_{n-r}\!\left[\sum_{g\ge0} Z_g\binom{g+r}{r}\right].
\tag{2}
```
The expression with $m=0$ is zero.

## 2. Fixed gap frequencies

Let $z_1,\dots,z_m$ be the ranks of the entries of $\sigma$ in value order, and $w_1,\dots,w_m$ the ranks in position order. The pair $(w,z)$ determines $\sigma$ because entries of each rank decrease in position order. Thus a uniform front maps to a uniform subset of all independent pairs of uniform rank words in $[d]^m\times[d]^m$. The subset has probability $f_m/d^{2m}$, which by Regev is only polynomially small.

Put $q=1-1/d$. For fixed $g$, internal gaps of size $g$ are occurrences of the word pattern $d,([d-1])^g,d$ in $z$; the terminal gap changes this count by at most one. In an independent uniform rank word, the expected number of these occurrences, divided by $m$, tends to $d^{-2}q^g$. Changing one word entry changes the count by at most $g+2$. The bounded-differences inequality therefore gives probability $\exp(-\Omega_{d,g,\epsilon}(m))$ for any fixed deviation $\epsilon$ in the normalized count. This remains negligible upon conditioning on the polynomial-probability image of the front class. Since $0\le Z_g/m\le1$, it follows that
```math
\frac{\mathbb E_m[Z_g]}{m}\longrightarrow d^{-2}q^g
\qquad\text{for each fixed }g.
\tag{3}
```
For (2) we also need a bound uniform in $g$, which cannot be inferred just by conditioning the independent-word bound. The next two sections supply it.

## 3. A uniform survival bound for a tableau walk

Let $\delta=(d-1,d-2,\dots,0)$ and $D=d(d-1)/2$. A tableau row word is a walk in the strict chamber $x_1>\cdots>x_d$, starting at $\delta$ and adding one of the standard coordinate vectors at each step. We use the elementary bound
```math
\mathbb P_{h\delta}(\text{the uniform-coordinate walk survives }t\text{ steps})
\le C_d h^D (t+1)^{-D/2}
\qquad(h\in\mathbb Z_{\ge1},\ t\ge0).
\tag{4}
```

To prove (4), first Poissonize to independent coordinate increment processes of rate $1/d$. For time $T$, write $p_T(v)$ for the Poisson$`(T/d)`$ mass, extended to zero for $v<0$. For strictly decreasing integer endpoints $x,y$, the killed transition probability is
```math
\det[p_T(y_i-x_j)]_{i,j=1}^d .
```
This is the standard signed-path reflection. In discrete time the unrestricted path to an endpoint has multinomial weight; expand the determinant over permuted endpoints, and pair any colliding path with the one obtained by exchanging the two colliding coordinates after their first collision. The first colliding pair is unique because a single unit move starts the first collision from a strict chamber state. This preserves the weight and reverses the permutation sign. Only noncolliding paths to the original ordered endpoint remain. Poissonizing the number of steps cancels the multinomial factorial and gives the displayed determinant. Reversing which endpoint is permuted only transposes or reindexes the determinant, without changing the identity.

For $x=h\delta$, reverse the column order so their shifts are $0,h,\ldots,(d-1)h$, then replace columns by successive finite differences of step $h$. These are triangular column operations with diagonal one and change the determinant at most by the initial reversal sign. The $`j`$th column, counting from $j=0$, has $\ell^1(\mathbb Z)$ norm at most $`h^j\|\Delta^jp_T\|_1`$ by telescoping the step-$`h`$ difference into $h$ translates of a step-one difference. For $j\ge1$, split a Poisson variable of mean $T/d$ into $j$ independent Poissons of mean $T/(dj)$. The $`j`$th difference of their convolution is the convolution of the $j$ first differences. A Poisson mass of mean $\nu$ is unimodal, and its first difference has $\ell^1$ norm twice its maximum, which is at most $C(1+\nu)^{-1/2}$ by Stirling's formula. Thus $`\|\Delta^j p_T\|_1\le C_d(1+T)^{-j/2}`$; the $j=0$ norm is one. Expand the determinant and bound the sum of its absolute values over ordered endpoints by the sum over all integer vectors. The latter is bounded by $d!$ times the product of these column norms. Hence the total survival probability at time $T$ is at most $C_d h^D (1+T)^{-D/2}$.

For $t$ discrete steps, use $T=t/2$. The number of Poissonized steps has mean $t/2$ and is at most $t$ with probability at least $1/2$ by Markov's inequality. Survival decreases in the step count, so the discrete survival probability at $t$ is bounded by twice the Poissonized survival probability at $T$. This proves (4).

Also, when starting at $\delta$, the probability of surviving $m$ steps and ending at a specified vector is uniformly at most
```math
C_d(m+1)^{-D/2-(d-1)/2}.
\tag{5}
```
Use (4) for the first $\lfloor m/2\rfloor$ steps, and drop the survival constraint for the remainder. The maximum point mass of an unconstrained uniform-coordinate walk of $\lceil m/2\rceil$ steps is $O_d((m+1)^{-(d-1)/2})$: the multinomial probability is maximized at balanced coordinate counts, and Stirling bounds that maximum. Combining the two estimates gives (5).

## 4. No-marker intervals have uniform exponential tails

For a uniform front $\sigma$, read the inverse permutation in increasing value order. The rank of original value $v$ equals the rank of the entry $\sigma^{-1}(v)$ in this inverse permutation, because transposing the plot preserves increasing chains ending at a fixed point. Under row insertion, that rank is the column of the initial insertion in the first row: the first row maintains the smallest possible terminal value for each available increasing-subsequence length, as follows inductively from the rule replacing the first larger entry. The bumping column can only go weakly left in subsequent rows, since the entry directly below a bumped entry, if it exists, is larger. Thus if $\sigma^{-1}(v)$ has rank less than $d$, the added cell in the recording tableau has column less than $d$. Equivalently, its transpose did not add a cell in row $d$ at time $v$.

Here is a uniform bound for a fixed interval of $g$ consecutive times at which row $d$ is not used in the transposed recording tableau. Under Robinson–Schensted the inverse front corresponds to a uniform pair of tableaux of the same $d$-row shape after transposing. Equivalently, take two independent uniform-coordinate walks $P,Q$ of length $m$ from $\delta$, conditioned on the event $E_m$ that both survive and end at the same point. The event has probability $f_m/d^{2m}$, because its paths are exactly the $f_m$ pairs of tableaux.

Before conditioning, the event that $Q$ uses no row-$`d`$ step in a given block of size $g$ has probability $q^g$. Conditional on its precise extracted block, the remaining sequence $Q'$ of $m-g$ coordinate choices is still uniform and independent of $P$. Start $Q'$ at $(g+1)\delta$. If the original $Q$ survived, then so does $Q'$: before the deletion it has the additional gap $g$ between neighboring coordinates, and after the deletion, removing at most $g$ steps can decrease any such gap by at most $g$. Given the block's coordinate counts, the endpoint of $Q'$ determines a unique endpoint of $P$ that would make the original two endpoints equal. For $g\le m/2$, (4) for $Q'$ and (5) for $P$ bound the conditional probability of $E_m$ by
```math
C_d(g+1)^D (m+1)^{-D-(d-1)/2}
=C_d(g+1)^D(m+1)^{-\alpha}.
```
The bound is independent of the block and its position; averaging and dividing by $\mathbb P(E_m)$ proves the desired estimate in this range. For $g>m/2$, divide the unconditioned probability $q^g$ by $\mathbb P(E_m)\ge c'_d(m+1)^{-\alpha}$ and use $m<2g$. We have established that the chance that any specified valid interval of $g$ values has no rank-$`d`$ marker is at most
```math
C_d(g+1)^Bq^g,\qquad B=\max(D,\alpha),
```
with a constant depending only on $d$. Every eligible gap is immediately after one of the $m$ front values and contains a marker-free interval of length $g$, so this also gives
```math
\mathbb E_m[Z_g]\le C_d\,m(g+1)^Bq^g.
\tag{6}
```

## 5. Sum the tail contributions

Define $S_{m,r}=\mathbb E_m[\sum_g Z_g\binom{g+r}{r}]$. Equations (3) and (6) allow dominated convergence for each fixed $r$:
```math
\frac{S_{m,r}}m\longrightarrow d^{-2}
   \sum_{g\ge0}q^g\binom{g+r}{r}
   =d^{r-1}.
\tag{7}
```
We also need domination over $r$. Fix any $u$ with $d^{-2}<u<d^{-1}$. By (6) and the geometric generating function for the binomial coefficients,
```math
\sum_{r\ge0}u^r\,\frac{S_{m,r}}m
\le C_d \sum_{g\ge0} (g+1)^Bq^g (1-u)^{-g-1}<\infty.
```
The bound is independent of $m\ge1$, since $q<1-u$. In particular $S_{m,r}\le C_{d,u}m u^{-r}$, also trivially at $m=0$.

Normalize (2) by $d^{2n}n^{1-\alpha}$. Regev gives $f_m/d^{2m}\le C_d(m+1)^{-\alpha}$ for all $m$. For $r\le n/2$ the normalized term is bounded by a constant times $(d^{-2}/u)^r$ because $(n-r)/(n-r+1)^\alpha$ is $O_d(n^{1-\alpha})$. For $r>n/2$ it is bounded by a constant times $n^{\alpha-1}(d^{-2}/u)^r$; the sum over these $r$ tends to zero. For each fixed $r\ge1$, Regev and (7) give normalized limit $c_d d^{-r-1}$. The normalized $f_n$ term tends to zero. Summing the geometric limit gives
```math
\sum_{r\ge1}c_d d^{-r-1}=\frac{c_d}{d(d-1)},
```
which proves (1).

For $A_{5,4}$, $d=3$, $\alpha=4$ and $c_3=81\sqrt3/(16\pi)$, also recorded explicitly in [Conway–Guttmann, §5.1](https://arxiv.org/html/2306.12682v2#S5.SS1). The amplitude in (1) is therefore $27\sqrt3/(32\pi)$. $\square$

## Attribution and priority

The source already proved the exponential constant for all $A_{k,i}$ with $2\le i\le k-1$, and supplied the decreasing-tail decomposition and injective rank coding. It conjectured only the polynomial correction and existence of an asymptotic constant for $A_{5,4}$; its suggested differential equation was experimental and is not needed here. Regev's asymptotic, Robinson–Schensted, signed-path reflection and probabilistic inequalities used above are prior results. The single-gap counting formula, uniform gap estimate and resulting leading constant are the argument given here. Searches on 24 November 2026 for Conjecture 6.3, $A_{5,4}$, the four forbidden patterns, and the title and authors located the original and adjacent work, but no earlier exact asymptotic for this class. This is a bounded priority check.
