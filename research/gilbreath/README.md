# Gilbreath’s conjecture

**Status** · Open for the primes. This note proves a theorem for a sieved random sequence and an unconditional restriction on blocks of actual prime gaps. [Issue #513](https://github.com/1337isnot1337/solved-conjectures/issues/513)

## Statement and source audit

Let $`D(b)_j=|b_{j+1}-b_j|`$. For the sequence $`p`$ of all primes in increasing order the conjecture is $`D^kp_1=1`$ for every $`k\ge1`$. Proth gave the statement in 1878. He included 1 in his starting sequence, so the second oblique column in his table is the modern left diagonal. On p. 237 he reduced it to the third oblique column taking values 0 and 2. Gilbreath rediscovered the conjecture in 1958. [Proth, pp. 236–240](https://gdz.sub.uni-goettingen.de/download/pdf/PPN598948236_0004/LOG_0088.pdf), [Chase on attribution and the original text](https://doi.org/10.1007/s00208-023-02579-w)

The 2026-11-24 search located finite computations, exact extension-set structure, and probabilistic and deterministic partial results. Colonna reports verification through the primes below $`1.5\times10^{15}`$. Muney studies valid extensions of general Gilbreath sequences. Chase, Hunter and Tao prove an independent-gap model and identify deterministic obstructions for the primes. No resolution of the prime statement was found. The sieve in the model below is in the spirit of Granville. Searches combining Gilbreath with sieved Cramér and Granville models found no prior proof of the theorem below. Priority remains provisional. [Colonna](https://www.lactamme.polytechnique.fr/descripteurs/Proth_Gilbreath_Conjecture.01.Ang.html), [Muney, v2](https://arxiv.org/abs/2606.23721v2), [Chase, Hunter and Tao, v1](https://arxiv.org/abs/2607.08712v1), [Granville](https://dms.umontreal.ca/~andrew/PDF/cramer.pdf)

## A sieved random model

Use coordinates $`x\ge0`$ for the odd integers $`2x+3`$ and force a mark at 0. All logarithms are natural. Write

```math
L(x)=\log(1000+x),\qquad
w(x)=\max\{3,\lfloor\exp(\sqrt{\log L(x)}/100)\rfloor\},\qquad
q_s(w)=\prod_{3\le p\le w}\left(1-\frac{s}{p}\right)\quad(s=1,2),
```

where the products are over primes. At each integer $`x>0`$, independently put a mark with probability

```math
\lambda_x=\min\left\{\frac12,\frac{2}{q_1(w(x))L(x)}\right\}
```

if $`2x+3`$ avoids all the odd prime divisors up to $`w(x)`$, and with probability zero otherwise. For the increasing marked coordinates $`0=x_0<x_1<x_2<\cdots`$, set $`a_j=x_j-x_{j-1}-1`$ and $`A_n=(D^{n-1}a)_1`$. The varying sieve and the location of the current mark enter the conditional law of the next gap.

**Theorem.** Almost surely the marks are infinite and their count through coordinate $`X`$ is asymptotic to $`2X/\log X`$. The normalized diagonal has $`A_n\in\{0,1\}`$ for all sufficiently large $`n`$ and $`A_n=1`$ infinitely often. Consequently the sequence $`2,3,2x_1+3,2x_2+3,\ldots`$ has leftmost difference entry 1 in every sufficiently deep row.

### Sieve counts in short intervals

For $`s=1,2`$, call a start $`t`$ admissible at cutoff $`w`$ when all $`s`$ integers $`2(t+i)+3`$, $`0\le i<s`$, avoid all odd prime divisors up to $`w`$. Uniformly over integer intervals of $`H\ge c\log X`$ starts and cutoffs $`3\le w\le W=w(X)+1`$, with fixed $`c>0`$ and $`X\to\infty`$, the number of admissible starts is

```math
Hq_s(w)(1+o(1)).
```

Indeed each prime rules out $`s`$ distinct residue classes. For a squarefree product $`d`$ of the sieving primes, the simultaneous ruled-out events occupy $`s^{\omega(d)}`$ classes modulo $`d`$ by the Chinese remainder theorem. Their count in the interval is $`Hs^{\omega(d)}/d+O(s^{\omega(d)})`$. Take the two Bonferroni truncations at the even order $`r=2\lceil50\log(W+1)\rceil`$ and at $`r+1`$. The total residue-count error is $`O((2W)^{r+2})=O((\log X)^{1/10})`$ for all sufficiently large $`X`$. For the main terms, the omitted absolute sum is bounded by $`\sum_{j>r}(2\log W)^j/j!\ll W^{-10}`$. The inequality $`j!\ge(j/e)^j`$ and the ratio bound $`2\log W/(r+1)<1/40`$ for large $`W`$ give this tail estimate. Finally $`q_1(w)\ge2/w`$ and $`q_2(w)\ge2/(w(w-1))`$ by extending the products to all integers from 3 to $`w`$. Both errors are $`o(Hq_s(w))`$ uniformly because $`W=(\log X)^{o(1)}`$.

The cutoff changes by at most one integer at large $`X`$ across each of $`[X/2,X]`$, $`[X/(\log X)^2,X]`$, and a window of radius $`O(\log X)`$ about $`X`$. To see this, write the unrounded cutoff as $`g(L)=\exp(\sqrt{\log L}/100)`$. Its derivative is $`g(L)/(200L\sqrt{\log L})`$, and across these intervals $`L`$ changes by at most $`O(\log\log X)`$ with $`L\sim\log X`$. Thus the unrounded cutoff changes by $`o(1)`$. In each case the extreme $`q_1`$ factors have ratio $`1+o(1)`$, since at most one prime is added and its size tends to infinity. The probability formula is uncapped at large $`x`$ since $`q_1(w(x))\ge2/w(x)`$.

For the mark count, apply the uniform sieve estimate at the minimum and maximum cutoffs of $`[X/(\log X)^2,X]`$. The logarithmic denominators are all asymptotic to $`\log X`$ and the two sieving densities have ratio $`1+o(1)`$. Therefore the expected marks on the interval are asymptotic to $`2X/\log X`$. Earlier coordinates contribute at most $`X/(\log X)^2+1`$. A Chernoff bound for independent Bernoulli variables makes the probability of any fixed relative deviation summable over positive integers $`X`$. Apply Borel–Cantelli for each positive rational relative deviation. This gives the asserted count and infinitude.

### Two estimates for a scan from a mark

Scan from a coordinate $`x`$ in either direction for its first selected site, using only coordinates on the unexplored side. For a scan to the left in the actual sequence, it can end at the forced mark 0. Call a set of integers 2-separated if it contains no two consecutive integers. There are constants $`c_0>0`$ and $`x_*>0`$ such that for any $`x\ge x_*`$ and any 2-separated set $`S`$,

```math
\Pr(\text{distance to first mark}-1\notin S\mid\text{history through }x)
\ \ge\ \frac{c_0}{w(x+\lfloor L(x)\rfloor)}.
```

The history here consists only of the sites already scanned in the chosen direction, including the starting coordinate where relevant. To prove the bound, look at the first $`H=\lfloor L(x)\rfloor`$ sites. Write $`w_-`$ and $`w_+`$ for their extreme cutoffs. The candidates at the minimum cutoff contain all actual eligible sites. There are $`O(Hq_1(w_-))`$ of them, and each selection probability is at most $`C/(q_1(w_-)L(x))`$ by the density comparison. The total selection hazard in the interval is bounded by an absolute constant. Because each probability is at most $`1/2`$, survival through any subset of earlier sites has probability at least $`\exp(-2\sum\lambda_t)\gg1`$, summing here over eligible sites.

At the maximum cutoff there are $`\gg Hq_2(w_+)`$ adjacent eligible pairs entirely in the window. They are disjoint, since three consecutive sites cannot all avoid the divisor 3. At least one distance minus 1 in each pair is outside $`S`$. Its probability of being the first marked site is at least $`c/(q_1(w_-)L(x))`$, by the survival lower bound and its eligibility. These first-mark events are disjoint over different sites. Summing and using

```math
\frac{q_2(w_+)}{q_1(w_+)}=\prod_{3\le p\le w_+}\frac{p-2}{p-1}\ge \frac1{w_+-1}
```

proves the bound in either direction. The backward argument uses the same adjacent pairs in reversed order. Its window stays above the forced site 0.

For the second estimate take $`D_n=\lceil C_1(\log n)^2\rceil`$ and $`K_n=n(D_n+1)`$. Choose an absolute $`C_1`$ sufficiently large. Uniformly for $`0\le x\le K_n`$, the probability of finding no mark in the next $`D_n`$ sites is at most $`n^{-10}`$ for large $`n`$. Put $`X=x+D_n`$. The last half of the interval lies in $`[X/2,X]`$, has length $`\asymp D_n`$, and contains $`\gg D_n q_1(w(X))`$ sites admissible at the maximum cutoff. At every such site the selection probability is $`\gg 1/(q_1(w(X))\log X)`$. The total hazard is $`\gg D_n/\log X\gg C_1\log n`$ since $`X\le K_n+D_n`$. Independence gives the tail bound. At the first index $`j\le n`$ with $`a_j>D_n`$, the preceding coordinate satisfies $`x_{j-1}\le K_n`$. The conditional tail estimate and a union bound give

```math
\Pr(\max_{j\le n} a_j>D_n)\le n^{-9}.
```

### Apply the tower argument with dependent gaps

Use the difference-array towers of Chase, Hunter and Tao. Their Lemmas 3.13 and 3.14 give the following deterministic implication. If all $`n`$ initial gaps are in $`[0,D_n]`$ and $`A_n>1`$, there is a tower of triangles whose entries each belong to one of the alphabets $`\{0,d\}`$ with $`d\ge2`$. Each of the $`n`$ initial positions is the leftmost or rightmost input coordinate of at least one entry constrained by the tower. Lemma 4.4 bounds the number of towers by $`2^{D_n}\binom{n+D_n}{D_n}^{2}`$. In particular this number has logarithm $`O(D_n\log n)`$. [Chase, Hunter and Tao, Definition 3.12 and Lemmas 3.13, 3.14 and 4.4](https://arxiv.org/html/2607.08712v1)

For a fixed tower, assign each initial position to one witnessing entry and to its orientation as an endpoint. At least $`n/2`$ positions share an orientation. Disregard indices $`j<j_*`$ for a fixed $`j_*>x_*+1`$. A right endpoint constraint at $`j`$ can be tested after the earlier gaps are known. A left endpoint constraint can be tested after the later gaps are known. With the other inputs fixed, changing the unknown endpoint gap by 1 changes the constrained entry by exactly 1 in absolute value. Indeed each step along the edge of the input triangle applies a map $`u\mapsto |u-v|`$ with fixed integer $`v`$, which sends adjacent integers to adjacent integers. Thus the set of allowed endpoint gaps is 2-separated, as in their Lemma 3.11. [Chase, Hunter and Tao, Lemma 3.11](https://arxiv.org/html/2607.08712v1)

For right endpoint constraints scan the marks forward from 0. For left endpoint constraints, fix a prospective final coordinate $`y=x_n`$ and scan backward from $`y`$. The event with $`x_n=y`$ is contained in the event that this backward scan passes the constraints, with no need to condition on $`y`$ being the $`n`$th mark. Previously exposed site indicators lie on the other side of the current scan coordinate. For either direction stop if a required gap cannot be read, or if at a test the starting coordinate is outside $`[x_*,K_n]`$. Such stops exclude none of the target configurations since, on the gap cap, $`j-1\le x_{j-1}<x_j\le K_n`$ for each selected $`j`$. By the first-scan estimate, the conditional probability of passing a test is at most $`1-\epsilon_n`$ with $`\epsilon_n=c_0/w(K_n+\lfloor L(K_n)\rfloor)`$. Between tests the scan can read unrestricted gaps. Sequential conditioning bounds the probability of passing the tests by $`(1-\epsilon_n)^{n/2-j_*}`$ for each fixed start and orientation.

On the gap cap there are at most $`K_n`$ possible $`y`$. Thus, even allowing this factor in both orientations, the probability that any tower is attained on the gap cap is at most

```math
K_n\,2^{D_n}\binom{n+D_n}{D_n}^{2}\,(1-\epsilon_n)^{n/2-j_*}.
```

Its positive logarithmic terms are $`O((\log n)^3)`$, while $`n\epsilon_n=n/(\log n)^{o(1)}`$ up to an absolute constant. This is summable over $`n`$. Together with the gap tail and Borel–Cantelli, it gives $`A_n\in\{0,1\}`$ eventually almost surely.

To see infinitely many ones, condition on the forward scan through $`x_{n-1}`$. The previous gaps fix $`A_n\bmod2`$ up to the parity of $`a_n`$, since absolute differences reduce to sums modulo two and the rightmost input has coefficient one. For large $`n`$ on $`x_{n-1}\le K_n`$, both parity choices have conditional probability at least $`\epsilon_n`$ by the scan estimate. The event that $`A_n`$ is odd or $`x_{n-1}>K_n`$ therefore has conditional probability at least $`\epsilon_n`$. Since $`\sum_n\epsilon_n=\infty`$, sequential conditioning on any interval of indices bounds the probability of seeing no such event by the product of $`1-\epsilon_n`$, which tends to zero. The gap tail makes $`x_{n-1}>K_n`$ occur only finitely often. Hence $`A_n`$ is odd infinitely often, which gives infinitely many ones.

In the ordinary array starting with $`2,3,2x_1+3,\ldots`$, the leftmost entry is odd after the first row, while the other entries are even. From the second difference row on, the immediate neighbor of the leftmost entry is $`2A_n`$ in the row of index $`n\ge2`$, with the starting row indexed 0. Indeed the first interior row consists of $`2(a_j+1)`$, and its next difference removes the constant shift. Thus eventually every leftmost transition applies $`u\mapsto|u-r|`$ with $`r\in\{0,2\}`$ and $`r=2`$ infinitely often. An odd $`u>1`$ drops by 2 at each such step, and 1 is then fixed. This proves the theorem.

## An unconditional prime-gap restriction

**Proposition.** Suppose an increasing block of primes all exceeding 3 has all its gaps in $`\{h,k\}`$, for positive even integers $`h,k`$, and at least one of $`h,k`$ is nonzero modulo 3. The block has $`O(\log(2+h+k))`$ gaps with an absolute constant. Consecutivity in the full sequence of primes is optional.

If both gap residues are the same nonzero residue modulo 3, two steps force some prime to be divisible by 3, so there is at most one gap. If the residues are opposite and nonzero, the allowed transitions on $`\{1,2\}`$ alternate. Taking every other prime then gives a prime arithmetic progression of step $`h+k`$. If one residue is zero and one is nonzero, the nonzero residue is allowed to occur at most once, since its transition on $`\{1,2\}`$ is one-way. The other gaps form at most two constant-step runs.

A prime arithmetic progression of step $`b`$ has fewer than $`2\ell`$ terms for any prime $`\ell\nmid b`$. Each run of $`\ell`$ terms includes a multiple of $`\ell`$, and only one prime term can equal $`\ell`$. The least prime missing from $`b`$ is $`O(\log(2+b))`$ by Chebyshev’s bound for the sum of logarithms of primes. Each of the runs just described has the claimed logarithmic bound, proving the proposition.

For the normalized prime gaps $`(p_{j+2}-p_{j+1})/2-1`$, any top-row $`\{0,d\}`$ block beyond the prime 3 therefore has length $`O(\log(2+d))`$, since its gap of length 2 represents a nonzero residue. At depth one, suppose a $`\{0,d\}`$ block comes from normalized gaps in $`[0,D]`$ with $`D<2d`$. Its parents have one common residue modulo $`d`$, so they take at most two values $`r,r+d`$. A block of length greater than $`C\log(2+D)`$ then forces both actual gap sizes to be divisible by 3. In particular $`3\mid d`$ and the primes in its input block all lie in a single residue class modulo 3. If the parents take only one value, the arithmetic-progression bound already applies. This restricts two of the shallow regimes in the deterministic criterion of Chase, Hunter and Tao. [Chase, Hunter and Tao, Theorem 1.6](https://arxiv.org/html/2607.08712v1)

## Audit and scope

The site model uses independent Bernoulli marks throughout. The tower estimate permits history-dependent gaps by revealing sites in the required order. The backward bound sums over deterministic final coordinates and avoids conditioning the site law on an order statistic. The cutoff is smaller than that used in some Cramér–Granville models. The proof leaves the full conjecture for the primes, including possible higher-row blocks and long zero blocks, open.

Run `python3 research/gilbreath/verify.py` from the repository root for exact controls of the residue counts, the two directions of first-mark testing across a sieve change, and the last step from the normalized to the ordinary array. These finite controls accompany the analytic proof. This is AI-assisted research. Independent review and priority are pending.
