# A gain above the half-interval extension bound

Let $A\subseteq[1,N]$ be a nonempty Sidon set of size $k$. There exist arbitrarily large $M$ and Sidon extensions $D\subseteq[1,M]$ with $D\cap[1,N]=A$ such that
```math
 \frac{|D|}{\sqrt M}\ge\frac1{\sqrt2}+\frac{c}{k}-o_{A,N}(1)
```
for an absolute $c>0$. [Erdős #44](https://www.erdosproblems.com/44) asks for every coefficient below one, for each prescribed prefix. The [earlier half-interval construction](https://erdosproblems.ai/wiki/problems/additive_bases/E0044) has coefficient $1/\sqrt2$. The gain here decreases with the size of the prefix.

Take a cyclic Sidon set $S$ of size $(1+o(1))\sqrt L$ in a cyclic group of order $L\to\infty$, for example a [Singer difference set](https://doi.org/10.1090/S0002-9947-1938-1501951-4). Fix $0<\delta<1/10$. A translate, represented in $[0,L-1]$, has at most $10\delta |S|$ points in the union of its first and last $2\delta L+O(N+1)$ integers. Indeed its average count under uniform translation is $(4\delta+o(1))|S|$. Fix such a translate $B$.

Choose an integer shift $m$ uniformly from $[(1-2\delta)L,(1-\delta)L]$. A collision $a+(m+z)=(m+x)+(m+y)$ requires $m=a+z-x-y$. Here $a\in A$ and $x,y,z\in B$. Thus $x,y\le2\delta L+N$ and $z\ge(1-2\delta)L-N$. All three belong to the counted ends. Each ordered quadruple forbids only one value of $m$. The expected number of these collisions is at most
```math
 \frac{k(10\delta|S|)^3}{\delta L+O(1)}
 \le 1100k\delta^2\sqrt L
```
for all sufficiently large $L$. Fix a shift with at most this many collisions. Remove one participating new element per collision. Two mixed sums $a+(m+x)$ and $a'+(m+y)$ can coincide only through a prescribed nonzero difference of the old elements. Each such difference is represented at most once in the whole cyclic Sidon set, so another $O(k^2)$ deletions suffice. Old sums are below all the other sums for large $L$. Each single block is Sidon, and deletions do not create collisions.

We may take $M=m+L\le(2-\delta)L$. The resulting lower coefficient is at least $(1-1100k\delta^2)/\sqrt{2-\delta}$ in the limit inferior. For example take $\delta=1/(20000k)$. Since $(1-\delta/2)^{-1/2}\ge1+\delta/4$ and $1100k\delta^2\le0.055\delta$, this proves the claim with $c=1/200000$. Taking $L$ arbitrarily large gives arbitrarily large extensions. The proof counts precisely the collisions involving three new points that were identified in the [problem discussion](https://www.erdosproblems.com/forum/thread/44).
