# A positive logarithmic density requires a positive translation boundary

Let $A$ satisfy the consecutive-sum restriction in [Erdős #839](https://www.erdosproblems.com/839). Write
```math
 d_X(E)=\frac{1}{\log X}\sum_{n\le X,\ n\in E}\frac1n .
```
For every fixed $q\ge1$ and $\delta>0$, there is $c(q,\delta)>0$ such that for all sufficiently large $X$, uniformly in $A$,
```math
 d_X(A)\ge\delta\quad\Longrightarrow\quad
 d_X\big(A\mathbin{\triangle}(A+q)\big)\ge c(q,\delta).
```
In particular a sequence with zero logarithmic density of changes under any fixed translation has zero logarithmic density itself. For $q=1$ this covers unions of intervals whose endpoints have zero logarithmic density, with no restriction on the locations or ratios of their scales.

## Proof

If the uniform assertion fails, there are admissible sets $A$ and cutoffs $X$ along a sequence with $X\to\infty$, $d_X(A)\ge\delta$, and $d_X(A\mathbin{\triangle}(A+q))\to0$. Both $A$ and its pattern may vary with $X$. After passing to a subsequence there is a fixed residue $b$ with $d_X(A\cap(b+q\mathbb Z))\ge\delta/q$.

For all but $o(\log X)$ harmonic mass of integers $n\le X$, the pattern of $A$ in a window of any fixed size about $n$ is periodic with period $q$ throughout that window. Each exception requires a point of the translation boundary at a bounded offset. The same statement holds for windows about $kn$ for each fixed positive integer $k$. Indeed $1/n\ll_k 1/(kn+j)$ for fixed $j$ and large $n$, and extending the cutoff from $X$ to $kX+O(1)$ adds only $O_k(1)$ harmonic mass. These statements are uniform in the varying sets.

Choose $L=1+q\mathrm{lcm}(1,\ldots,q)$ and let $k$ be any fixed positive power of $L$. At a typical $n\in A$ of residue $b$, follow the first $k$ members of $A$ starting at $n$. By local periodicity they lie within $kq$ of $n$. If one period has $s$ members, then the first $k-1$ terms make $(k-1)/s$ full periods. This number of periods is divisible by $q$. The last term is congruent to $n$ modulo $q$, so the sum of the $k$ terms is $kn+C$, where $0\le C\le k^2q$ and $C\equiv0\pmod q$. Here we used $k\equiv1\pmod q$. The sum is forbidden. By local periodicity about $kn$, all members of the class $b$ within $kq$ of $kn$ are consequently outside $A$. All windows in this argument have a size fixed before $X$ tends to infinity.

Let $E_b$ be the union of real half-open intervals $[n,n+q)$ over $n\in A$ of residue $b$. Use the normalized real measure $\mu_X(F)=(\log X)^{-1}\int_1^X 1_F(t)dt/t$. The intervals are disjoint and $\mu_X(E_b)\ge\delta-o(1)$, since integrating over one interval gives $q/n+O_q(n^{-2})$ and the upper endpoint error tends to zero. For each fixed power $k=L^j$, $j\ge1$, we have
```math
 \mu_X(E_b\cap k^{-1}E_b)=o(1).
```
Indeed for typical $n$ as above and $t\in[n,n+q)$, membership of $kt$ in $E_b$ would require an element of the class within $kq$ of $kn$. The source intervals for exceptional $n$ have total normalized measure $o(1)$.

Real logarithmic measure changes by $O_k(1/\log X)$ under dilation by any fixed $k$. Hence the sets $L^{-i}E_b$ for $0\le i<J$ all have measure at least $\delta-o(1)$ and have pairwise overlaps $o(1)$ for each fixed $J$. Their union has measure at least $J\delta-o(1)$. Taking $J>1/\delta$ contradicts $\mu_X([1,X])=1$. This proves the assertion.

The argument uses logarithmic averaging to compare all these dilates without loss of density. On one fixed-scale interval an admissible set can have positive density even when its neighboring intervals contain almost no selected integers.
