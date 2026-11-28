# Long pairs in the lattice formulation

Let $S$ be an $N$-avoiding set in [Koizumi's formulation of Erdős problem 352](https://jkoizumi144.com/notes/erdos352.pdf). Thus every triangle, including degenerate ones, has its area at distance greater than its diameter from $N$. Write $n=|S|$. For $N\ge1$ and $1/N\le a\le1$, the number of ordered pairs satisfies
```math
 \#\{(p,q)\in S^2:|p-q|\ge aN\}
 \le C Nn\bigl(1+\log(1/a)\bigr)^2 .
```
In particular, if a fixed positive fraction of the pairs have separation at least a fixed positive multiple of $N$, then $n=O(N)$ as required by the original conjecture. The constants in this implication depend only on those two fractions. Merely having one long pair does not give the hypothesis.

## A bound for points with clearance

Let $A$ be bounded, open and avoid unit-area triangles. Write $M=|A|$ and let $B$ consist of the points of $A$ at distance greater than $r>0$ from its complement. For $0<b\le1$ we claim
```math
 \int_B\int_B 1_{\{|x-y|\ge b/r\}}\,dx\,dy
 \le CM\bigl(1+\log(1/b)\bigr)^2 .
```
Two points of $B$ cannot be at distance $d>2/r$. The perpendicular displacement $2/d$ of either endpoint from their line stays inside the disk of radius $r$ about that endpoint and gives a third vertex of the forbidden area.

Use [the line coordinates and fractional Poincaré inequality](logarithmic-bound.md). At a fixed direction let $P$ be the section length of $A$ and $G_B(s,d)$ the overlap for $B$ on the line of normal coordinate $s$ at displacement $d$. If $G_B(s,d)>0$, translating the two endpoints together by any normal displacement of absolute value below $r$ leaves them in $A$. Hence every line with normal coordinate in $(s+2/d-r,s+2/d+r)$ is disjoint from $A$.

Fix $D$ between $b/r$ and $2/r$ and set $L=1/D$. Partition the axis into intervals $J=[jL,(j+1)L)$. If some $s\in J$ has $G_B(s,d)>0$ for a $d\in[D,2D]$, the interval $I_J=[jL,(j+4)L]$ contains a zero interval of $P$ of length at least $\min(r,L)$. Indeed $s+2/d$ lies between $(j+1)L$ and $(j+3)L$. The one-dimensional inequality and bounded overlap give
```math
 \sum_{J\ {\rm active}}\int_J P^2
 \le C L\bigl(1+\log^+(1/(rD))\bigr)E_{\mathbb R}(P).
```
Here $\log^+(v)=\max(0,\log v)$. On each line the integral of $dG_B(s,d)$ over this bin is at most $DP(s)^2$, because the integral of the overlap over all positive displacements is half the squared section length of $B$. Sum the dyadic bins starting at $b/r$. There are $O(1+\log(1/b))$ bins before $2/r$. The polar pair identity for $B$ and the angular energy identity for $A$ now give the claim.

## Lattice consequence

Take the open disks of radius $1/(3\sqrt N)$ centered at $q/\sqrt N$ for $q\in S$. Their union $A$ avoids area one by Koizumi's perturbation estimate. They are disjoint. With $r=1/(6\sqrt N)$ their concentric open disks of radius $r$ constitute $B$. A lattice pair at distance at least $aN$ supplies a product of two inner disks on which every distance is at least
```math
 a\sqrt N-2r\ge a\sqrt N/2 ,
```
using $aN\ge1$. Take $b=a/12$. Each ordered pair contributes $(\pi r^2)^2$ and $M=4\pi r^2n$, which yields the stated inequality. Consequently some point of $S$ has all but at most $CN(1+\log(1/a))^2$ points within distance $aN$, by averaging over centers. This concentration estimate still permits sets supported on successively smaller spatial scales.
