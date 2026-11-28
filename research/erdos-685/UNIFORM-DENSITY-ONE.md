# Erdős’s binomial prime-divisor conjecture, uniformly at density one

**Theorem.** Fix $`0<\varepsilon<1`$. There is a set $`E_\varepsilon\subseteq\mathbb N`$ of natural density one such that
```math
\omega\!\left(\binom nk\right)
=(1+o(1))\,k\sum_{k\lt p\lt n}\frac1p
\quad(n\to\infty,\ n\in E_\varepsilon),
```
uniformly in *all* integers $`1\le k\le n^{1-\varepsilon}`$. In particular $`k`$ may vary arbitrarily with $`n`$, and the same exceptional set works for all such choices, including fixed $`k`$ and polylogarithmic $`k`$. This is a density-one theorem, not a proof of Erdős’s pointwise conjecture.

## 1. Prime factors as a moving average

Write $`g_y(m)=\sum_{p>y}\mathbf 1_{p\mid m}`$. Every prime $`p>k`$ divides at most one integer of $`(n-k,n]`$, and no such prime divides $`k!`$. Thus
```math
\omega\!\left(\binom nk\right)
= \sum_{n-k\lt m\le n}g_k(m)+O(\pi(k)).
\tag{1}
```
Fix a large integer $`X`$ and work with $`n\in(X,2X]`$. Set $`\mu_y=\sum_{y<p\le2X}1/p`$. Uniformly in the target range $`k\le n^{1-\varepsilon}`$, we have $`\mu_k\gg_\varepsilon1`$ by Mertens’ theorem and
```math
\left|\mu_k-\sum_{k\lt p\lt n}1/p\right|
\le \sum_{X\le p\le2X}1/p=O(1/\log X).
\tag{2}
```
We prove that for every tolerance $`\eta>0`$, the set of endpoints for which any such $`k`$ violates relative error $`\eta`$ in (1)–(2) is $`o(X)`$.

We use the one-sided discrete maximal inequality: for a finitely supported nonnegative sequence $`a`$ and $`\lambda>0`$, the number of integers $`n`$ such that some backward interval ending at $`n`$ has average of $`a`$ above $`\lambda`$ is at most $`\lambda^{-1}\sum_m a(m)`$. To prove the bound for any finite subset of bad endpoints, select a witnessing interval at the rightmost bad endpoint, remove all bad endpoints lying in it, and repeat. The selected intervals are disjoint, and their combined length bounds the number removed; it is less than $`\lambda^{-1}`$ times the total sum on the selected intervals. Taking the supremum over finite subsets proves the inequality.

## 2. Large harmonic means

There is an absolute constant $`C`$ such that uniformly in $`1\le y\le2X`$,
```math
\sum_{m\le2X}|g_y(m)-\mu_y|^2\le CX(1+\mu_y).
\tag{3}
```
An elementary proof suffices here. For $`y<p\le\sqrt{2X}`$, the centered indicator $`\mathbf 1_{p\mid m}-1/p`$ has squared sum $`O(X/p)`$. Distinct centered indicators have covariance sum $`O(1)`$, by the floor function estimate for multiples of $`p,q,pq`$. The total off-diagonal error is $`O(\pi(\sqrt{2X})^2)=O(X)`$. For $`p>\sqrt{2X}`$, an integer $`m\le2X`$ has at most one such prime factor, and the sum of $`1/p`$ over that prime range is bounded. The large-prime contribution after centering is thus pointwise $`O(1)`$, proving (3).

For $`\mu_y\ge M/2`$ with $`M\ge2`$, apply the maximal inequality to $`|g_y-\mu_y|^2`$ supported on $`[1,2X]`$. By Cauchy–Schwarz, except at $`O(X/(\delta^2\mu_y))`$ endpoints, every backward interval contained in $`[1,2X]`$ has $`g_y`$-average within $`\delta\mu_y`$ of $`\mu_y`$.

To do this simultaneously at every threshold with $`\mu_y\ge M`$, take a geometric grid in harmonic means: for each level $`M(1+\delta)^j\le\mu_1`$, choose a threshold where $`\mu_y`$ just crosses from above this level to below or equal, and include threshold $`y=1`$. Each jump is at most $`1/2`$, so if $`M\ge1/\delta`$, grid means bracket every $`\mu_y\ge M`$ to relative error $`O(\delta)`$. The sum of reciprocals of all chosen means is $`O(1/(\delta M))`$. Union bounding maximal exceptions gives $`O(X/(\delta^3 M))`$ endpoints. Outside those endpoints, monotonicity of $`g_y`$ in $`y`$ and the two bracketing thresholds show, simultaneously at all $`y`$ with $`\mu_y\ge M`$, that every allowable backward average equals $`(1+O(\delta))\mu_y`$. Also $`\pi(k)/(k\mu_k)\le 1/M`$ in this range.

## 3. Bounded harmonic means

Fix $`M`$, then choose $`\alpha\in(0,1/2)`$ small enough in terms of $`M`$ that $`\mu_y\le M`$ implies $`y\ge X^\alpha`$ for sufficiently large $`X`$ (e.g., $`\alpha=e^{-M-2}`$). On $`m\le3X`$ and $`y\ge X^\alpha`$ one has $`g_y(m)\le J`$ for a fixed $`J`$ depending only on $`\alpha`$. Choose $`J+1`$ distinct $`z\in(0,1)`$. Vandermonde interpolation expresses the function $`w\mapsto w`$ on $`\{0,\ldots,J\}`$ as one fixed real linear combination of $`w\mapsto z^w`$ for these choices. Each function $`m\mapsto z^{g_y(m)}`$ is real multiplicative and bounded by one, so the uniform [Matomäki–Radziwiłł short-interval theorem, Theorem 1](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p06-p.pdf) applies. This is the same finite-histogram mechanism as Weatherhead’s Lemma 18, not a new application at a single window length.

Let $`h_0=\lfloor X^{\alpha/2}\rfloor`$ and let
```math
A_y(m)=\frac1{h_0}\sum_{j=0}^{h_0-1}g_y(m+j).
```
Apply the theorem on each of the two dyadic ranges of starts covering $`[X/2,2X]`$, taking integer dyadic endpoints with harmless rounding. It gives, after interpolation,
```math
\sum_{X/2\le m\le2X}|A_y(m)-\mu_y|=o(X)
\tag{4}
```
uniformly in $`y\ge X^\alpha`$. Indeed, the long mean of $`g_y`$ on either dyadic range differs from $`\mu_y`$ by $`O(1/\log X)`$, by summing $`1/p`$ and an $`O(1)`$ floor error per prime. The short-interval theorem compares almost all short averages to that long mean with error tending to zero, uniformly in the finitely many bounded multiplicative functions; boundedness controls the exceptional terms in (4). Using $`h_0`$ terms rather than the theorem’s inclusive endpoints changes the averages by $`O(J/h_0)`$.

Fix a finite mesh of exponents $`\alpha=a_0<a_1<\cdots<a_s=1`$ so finely spaced that the values of $`-\log a_i`$ differ by at most $`\delta`$ across a pair of neighboring exponents. Take grid thresholds $`y_i=(2X)^{a_i}`$, and also $`y=X^\alpha`$ for the lower endpoint. By Mertens’ theorem, neighboring grid harmonic means differ by at most $`\delta+o(1)`$; the extra lower endpoint changes the mean by $`o(1)`$. For every grid threshold, apply the one-sided maximal inequality to (4), with the absolute errors supported on $`[X/2,2X]`$. Except at $`o(X)`$ endpoints, for every grid threshold and every backward interval included in that support, its $`A_y`$-average differs from $`\mu_y`$ by at most $`\delta`$.

Replacing $`A_y`$ by $`g_y`$ in the average over a length-$`h`$ interval changes it by $`O(J h_0/h)`$: for each forward shift by $`j`$ there are at most $`2j`$ boundary entries. In particular the error is $`o(1)`$ on all intervals of length $`h\ge X^\alpha`$. By monotonicity and the mesh, the same estimates give absolute error $`O(\delta)+o(1)`$ for every threshold $`y\ge X^\alpha`$. In the original problem $`h=y=k`$ in this regime, the intervals lie within $`[X/2,2X]`$ for all large $`X`$, and $`\mu_k\gg_\varepsilon1`$; thus the relative error is $`O_\varepsilon(\delta)+o(1)`$. Also $`\pi(k)/k=o(1)`$ here uniformly.

## 4. Conclude and compare with previous results

Given $`\eta>0`$, choose $`\delta>0`$ sufficiently small depending on $`\varepsilon,\eta`$. Then choose any sufficiently large fixed $`M`$. The preceding estimates and (1)–(2) show that the limsup proportion of endpoints in the dyadic block violating relative error $`\eta`$ for at least one allowed $`k`$ is $`O(\delta^{-3}/M)`$; the $`o(X)`$ from §3 is taken with $`M,\delta`$ fixed first. Letting $`M\to\infty`$ shows the bad proportion tends to zero. This implies natural density zero for each fixed $`\eta`$, by decomposing $`[1,N]`$ dyadically. Taking a sequence of decreasing tolerances and choosing cutoffs by a standard diagonal argument gives a single density-one set on which the maximum relative error tends to zero. Explicitly, at tolerance $`1/j`$ choose an increasing cutoff $`N_j`$ so above it the bad count in $`[1,N]`$ is at most $`N/j`$, and so the combined count of selected earlier exceptional pieces up to $`N_{j-1}`$ is at most $`N_j/j`$. On $`[N_j,N_{j+1})`$ remove the bad points at tolerance $`1/j`$. The removed set has density zero: below $`N_j`$ previous removed points lie in the union of pieces before $`N_{j-1}`$ and the bad set at tolerance $`1/(j-1)`$ restricted to $`[N_{j-1},N_j)`$; the latter count is at most $`N_j/(j-1)`$. The current piece up to $`N`$ contributes at most $`N/j`$.

- Erdős stated the underlying conjecture in [*Some unconventional problems in number theory*, Acta Math. Acad. Sci. Hungar. 33 (1979), §2, equation (9) and following lines](https://www.renyi.hu/~p_erdos/1979-23.pdf). The range $`n^\varepsilon<k\le n^{1-\varepsilon}`$ and prospective polylogarithmic extension are indexed as [Erdős Problem 685](https://www.erdosproblems.com/685).
- [Weatherhead, *Erdős Problem #685 at Density One: An Unconditional Proof of the Erdős–Gupta–Khare Second-Moment Conjecture* (July 2026), Theorems 1, 2, 19, 22 and Lemma 18](https://doi.org/10.13140/RG.2.2.18578.41921) gives density-one normal order along each $`k=\lfloor n^\theta\rfloor`$ and certain slowly varying subpolynomial functions (with exceptional sets allowed to depend on the function), and resolves the Erdős–Gupta–Khare second moment. Its concluding scope leaves arbitrary rapidly varying choices open. We use its bounded-threshold interpolation idea, then add maximal-function transfer at both thresholds and window lengths to obtain one exceptional set, and handle large harmonic means by a sieve-free variance and maximal argument. These statements do not resolve Erdős’s pointwise problem. The independent pointwise strip above $`n^{17/30+\delta}`$ follows from [Younis’s smooth-number theorem](https://arxiv.org/abs/2409.05761), as observed by [shoonya in the problem discussion](https://www.erdosproblems.com/forum/thread/685).

## 5. Pointwise counterexamples at a nearly logarithmic scale

The prospective polylogarithmic pointwise strengthening cannot hold for any fixed exponent $`c<1`$. More precisely, for every fixed $`\lambda>0`$ there are infinitely many pairs $`(n,k)`$ with
```math
k\sim\lambda\frac{\log n}{(\log\log n)^2}
\qquad\text{and}\qquad
\frac{\omega(\binom nk)}{k\sum_{k\lt p\lt n}1/p}\ge 1+\frac1\lambda-o(1).
\tag{5}
```
This is compatible with the original polynomial-range conjecture and with §§1–4.

Let $`k\to\infty`$, and set $`s=\lfloor\lambda^{-1}\log k\rfloor`$. Take the first $`ks`$ primes greater than $`k`$, put them in $`k`$ groups of $`s`$ primes, and write $`Q`$ for their total product. Assign the groups to $`i=0,\ldots,k-1`$. By the Chinese remainder theorem take $`0\le r<Q`$ such that all primes in group $`i`$ divide $`r-i`$. For every $`n\equiv r\pmod Q`$, all $`ks`$ assigned primes divide $`\binom nk`$, provided $`n\ge k`$.

By the prime number theorem the largest assigned prime is $`O_\lambda(k(\log k)^2)`$. Hence $`\log Q=(1+o(1))ks\log k\sim \lambda^{-1}k(\log k)^2`$. Also the sum of reciprocals of the assigned primes is $`o(1)`$ by Mertens’ theorem, since they all lie between $`k`$ and $`O_\lambda(k(\log k)^2)`$.

Set $`J=\lfloor Q^{1/\log k}\rfloor`$, and take a uniform integer $`j\in[J,2J)`$ and $`n=r+jQ`$. Then $`\log n\sim\log Q`$ uniformly in $`j`$. For each unassigned prime $`k<p\le \sqrt J`$, we have $`p\nmid Q`$; given $`i`$, the proportion of choices for which $`p\mid r+jQ-i`$ is $`p^{-1}+O(1/J)`$. For each such prime the $`k`$ divisibility events are disjoint because $`p>k`$. Consequently the expected number of these unassigned prime divisors of $`\binom nk`$ is
```math
k\sum_{\substack{k\lt p\le\sqrt J\\p\nmid Q}}\frac1p
+O\bigl(k\pi(\sqrt J)/J\bigr)
=(1+o(1))k\log k.
```
The last equality uses $`\log J\sim \lambda^{-1}k\log k`$, the $`o(1)`$ reciprocal sum of assigned primes, and Mertens’ theorem. Some $`j`$ achieves at least this expected count. For that $`j`$, add the certain $`ks`$ assigned primes. The normalization in (5) is itself $`(1+o(1))k\log k`$, since $`\log n\sim \lambda^{-1}k(\log k)^2`$. This proves (5).
