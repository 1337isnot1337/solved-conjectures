# Erdős–Sauer conjecture

**Exact bounded-face-degree result.** The conjecture holds in every ground-set order when each $r$-face lies in at most four simplices and $r\ge11$. It also holds with five simplices per face when the conflict graph has no clique on more than $r-7$ vertices. A quantitative formula applies to every face-degree bound.

Let $k=r+1\ge4$, let $\mathcal F$ be any family of $k$-sets, and call their $(k-1)$-subsets faces. Let $\nu$ count the maximum packing sharing no face and $\tau$ the minimum number of faces covering the family. Let $\omega$ be a fixed bound on the clique number of its conflict graph. The result applies to arbitrary $k$-set families, not just the families obtained from hypergraphs. For the original conjecture, deleting such a face cover leaves at most $\operatorname{ex}(n,K_{r+1}^r)$ edges; a clique decomposition can use the packed cliques and the edges left over. Consequently $\tau\le(k-1)\nu$ is sufficient.

## Face-degree recurrence

A bound $h$ on the number of members through a face bounds the maximum degree of the conflict graph by $(h-1)k$. Every adjacent pair shares exactly one face. Also every clique with at least three vertices either shares a face or consists of $k$-subsets of a single $(k+1)$-set; after choosing an adjacent pair, a third vertex without their common face has to lie in their union. A fourth vertex sharing their common face and lying outside the union could not meet that third vertex in a face. Thus one may take $\omega\le\max(h,k+1)$. The [fractional Reed inequality](https://www.combinatorics.org/ojs/index.php/eljc/article/download/v21i4p48/pdf/) then gives the order bound
\[
|\mathcal F|\le\frac{(h-1)k+1+\omega}{2}\nu.
\]

For $h=2$, take $C_2=\lceil (k+1)/2\rceil$, or use $C_2=(k+1)/2$ if $\omega\le k$. In fact, components other than $K_{k+1}$ admit a proper $k$-coloring by [Brooks’s theorem](https://doi.org/10.1017/S030500410002168X), including odd cycles since $k\ge4$. Hence they have at most $k$ times their independence number in vertices. A maximum ordinary matching pairs adjacent members, covering them by one face per pair, and its unmatched vertices form an independent set. This costs at most $(k+1)/2$ times the independence number on such a component. On $K_{k+1}$ the cost of pairing and a possible singleton is $\lceil (k+1)/2\rceil$.

For $h\ge3$, choose a maximal disjoint collection of $t$ groups of $h$ members each sharing a face. Cover these groups by their $t$ common faces. The residual family has face degree at most $h-1$, giving the bound $t+C_{h-1}\nu$. Alternatively run a maximum ordinary matching on the residual conflict graph. Its unmatched vertices form an independent set of size at most $\nu$, so this second construction costs at most
\[
t+\frac{|\mathcal F|-ht+\nu}{2}
\le\frac{(h-1)k+3+\omega}{4}\nu-\frac{h-2}{2}t.
\]
Their convex combination with weights $(h-2)/h$ and $2/h$ cancels $t$. Therefore $\tau\le C_h\nu$ with
\[
C_h=\frac{h-2}{h}C_{h-1}+\frac{(h-1)k+3+\omega}{2h}
=\frac{k(2h-1)}{12}+\frac{3+\omega}{4}
+\frac{2C_2-(k+3+\omega)/2}{h(h-1)}.
\]
For the explicit expression, multiply the recurrence by $h(h-1)$ and sum the resulting differences for indices 3 through $h$. The same global $\omega$ bounds every residual family.

## Exact regimes and exceptional faces

For $h=4$ the formula gives $C_4=5k/6+1$ for even $k$ and $5k/6+11/12$ for odd $k$, taking $\omega=k+1$. Thus $\tau\le(k-1)\nu$ for every $k\ge12$. If $\omega\le k$, use $C_4=(15k+17+5\omega)/24$. This also works at $k=11$ with no full $(k+1)$-top, at $k=10$ if $\omega\le9$, and at $k=9$ if $\omega\le8$. For $h=5$ with $\omega\le k$, one gets $C_5=(31k+29+9\omega)/40$; therefore $\omega\le k-8$ suffices.

There is also a sparse-exception version: select the $m$ faces with larger-than-$h$ degree, removing all members they cover. The independence number on the residual conflict graph is at most the original $\nu$, and $\omega$ does not increase. Therefore $\tau\le m+C_h\nu$. In particular the original decomposition bound survives as long as $m\le(k-1-C_h)\nu$. This permits high overlap on a small number of faces.

The unrestricted conjecture remains open. The $h=4$ result and coefficient cancellation came from the parallel research review; the closed form and $h=5$ criterion extend it. [Tracking issue #72](https://github.com/1337isnot1337/solved-conjectures/issues/72) · [Previous degree-three theorem](THREE-OVERLAPS.md) · [Original problem](https://www.erdosproblems.com/719).

## Fractional result in the literature

[Sichen Wang, Theorem 1](https://arxiv.org/html/2609.35836v1) proves $\tau^*\le (k+1)\nu/2$ for arbitrary families under the same codimension-one packing definitions. This is an upper bound on fractional cover in terms of integral packing, not an integral-cover rounding theorem. The arguments above concern integral cover and use the face-degree restriction; they do not claim Wang’s result.
