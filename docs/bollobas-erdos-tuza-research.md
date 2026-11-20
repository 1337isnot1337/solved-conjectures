# Bollobás–Erdős–Tuza conjecture

A graph on $n$ vertices is $c$-hollow if every inclusion-maximal independent set has size at least $cn$. Write $\tau(G)$ for the smallest size of a vertex set meeting all maximal independent sets. The conjecture says $\tau(G)=o(n)$ for each fixed $0\lt c\lt1$. Taking graph complements gives the first question in Erdős Problem 611. [Erdős–Gallai–Tuza, Problem 2](https://doi.org/10.1016/0012-365X(92)90681-5) · [Erdős Problems wiki](https://erdosproblems.ai/problems/611) · [Research issue](https://github.com/1337isnot1337/solved-conjectures/issues/71)

Cooper and Hollars give $c$-hollow graphs requiring $\Omega_c(n^{1/3}/\log n)$ vertices in a transversal. Their conjecture concerns all maximal independent sets. The separate Bollobás–Erdős–Tuza conjecture concerning only maximum independent sets has a weaker hypothesis on the independence number and uses different methods. Searches by both formulations, the problem number and the authors' names found no resolution of the maximal version or prior occurrence of the lower bound below. [Cooper–Hollars, Conjectures 1.1 and 1.2 and Theorem 1.7](https://arxiv.org/abs/2607.15486) · [Bai–Chang–Yan on maximum independent sets](https://arxiv.org/abs/2608.18963)

## A lower bound of order the square root of n log n

**Theorem.** For each fixed $0\lt c\lt1$, there exist $c$-hollow graphs on arbitrarily large numbers $n$ of vertices with $\tau(G)=\Omega_c(\sqrt{n\log n})$.

**Construction.** Fix an integer $K\ge1$ and $0\lt\lambda\lt1/4$ such that $e^{-\lambda}K/(K+1)\gt c$. Set $\eta=\lambda/16$, $A=1/8$, and take a fixed $\kappa\gt0$ small enough that, with $B=1+\log(4/(\kappa\lambda))$,
```math
A+2\lambda\kappa\le \tfrac12,\qquad
\frac{4\kappa(1+B)}{A}\lt\tfrac18 .
```
All logarithms in this proof are natural. Take a sufficiently large multiple $s$ of four. Set $t=\lfloor\kappa s\log s\rfloor$ and $r=\lceil2t/(\eta s)\rceil$. Let $H$ be the join of $r$ parts, each a disjoint union of $s$ cliques of size $s$. Thus between distinct parts all edges are present, while within a part only edges of its constituent cliques are present. Let $M=rs^2=|V(H)|$ and add an independent set $I$ of size $KM$. Connect each pair in $V(H)\times I$ independently with probability $p=\lambda/s$. The resulting graph $G$ has order $n=(K+1)rs^2$.

**All maximal independent sets are large.** Each maximal independent set $J$ of $H$ takes one vertex from each clique of one part. For fixed $J$, the number of vertices of $I$ with no neighbour in $J$ is binomial with mean $KM(1-p)^s$. Since $K(1-p)^s\to Ke^{-\lambda}\gt c(K+1)$, the probability that this count is below $cn$ is $\exp(-\Omega_c(M))$ by a binomial lower-tail bound. There are $r s^s$ choices for $J$. Consequently with probability tending to one every such $J$ leaves at least $cn$ nonneighbours in $I$. Any independent subset of $H$ extends to such a $J$, so the same bound on nonneighbours holds for every independent subset of $H$. In a maximal independent set of $G$, all nonneighbours in $I$ of its intersection with $H$ must be included. Thus $G$ is $c$-hollow.

**Adjacencies in a part.** Reserve half the cliques of each part for matching, and use the other half for greedy choices. We prove that with probability tending to one the following hold in every part at once.

1. For every $Z\subseteq I$ with $1\le z=|Z|\le s/4$, and any $z-1$ of the matching cliques, at least $\eta s$ vertices in the remaining matching cliques have a neighbour in $Z$.
2. For every $R\subseteq I$ with $s/4\lt |R|\le t$, let $j\ge0$ be the index with $2^{-j-1}t\lt |R|\le2^{-j}t$ and put $\ell_j=\lfloor A\log s/(j+B)\rfloor$. Among any $s/4$ of the greedy cliques, at least $\eta s$ vertices have at least $\ell_j$ neighbours in $R$.

For property 1 there are at least $s^2/4$ candidate vertices. The probability that a candidate has a neighbour in $Z$ is $1-(1-p)^z\ge \lambda z/(2s)$, using $pz\le1$ and $1-e^{-x}\ge x/2$ on $[0,1]$. The candidate indicators are independent. Their mean sum is at least $\lambda sz/8\ge2\eta s$. The failure probability for fixed $Z$ and excluded cliques is at most $\exp(-\lambda sz/64)$. Over all parts the number of choices for order $z$ is at most $r(KM)^z s^{z-1}$, so the sum of the failure bounds tends to zero.

For property 2 we have $j=O(\log\log s)$ and hence $\ell_j\ge1$ for large $s$. Also
```math
\frac{\lambda\kappa}{4}\,2^{-j}\log s\le p|R|\le\lambda\kappa\log s.
```
For one vertex the binomial mass at $\ell_j$, using $\binom{u}{v}\ge(u/v)^v$ and $(1-p)^{|R|}\ge e^{-2p|R|}$, is at least
```math
\left(\frac{p|R|}{\ell_j}\right)^{\ell_j} e^{-2p|R|}.
```
By the lower bound on $p|R|$, we have $\max\{0,\log(\ell_j/(p|R|))\}\le j+B$. The displayed probability is therefore at least $s^{-A-2\lambda\kappa}\ge s^{-1/2}$. The $s^2/4$ candidate vertices have independent indicators, so their mean count is at least $s^{3/2}/4$. The probability they give fewer than $\eta s$ successes is $\exp(-\Omega(s^{3/2}))$. There are at most $r2^s\sum_{u\le t}\binom{KM}{u}=\exp(O_c(s(\log s)^2))$ choices in property 2. This proves the simultaneous claim.

**Avoiding a proposed transversal.** Fix an outcome with the preceding properties and a vertex set $T$ of size at most $t$. Some part of $H$ contains at most $t/r\le\eta s/2$ vertices of $T$. Work in that part, removing its vertices in $T$ from consideration. Start with $R=T\cap I$. While $|R|\gt s/4$, choose a vertex from an unused greedy clique with at least $\ell_j$ neighbours in $R$, and remove those neighbours from $R$. For large $s$ we have $\ell_j\ge A\log s/(2(j+B))$ for every relevant $j$. At scale $j$ there are at most $1+2^{-j}t/\ell_j$ greedy choices, so in total there are at most
```math
O(\log\log s)+\frac{2\kappa s}{A}\sum_{j\ge0}2^{-j}(j+B)
=O(\log\log s)+\frac{4\kappa(1+B)}{A}s\lt s/4 .
```
Thus at every step at least $s/4$ greedy cliques are unused. Property 2 provides the required choice even after the deletions.

After this process $|R|\le s/4$. Match $R$ to distinct matching cliques, joining a vertex of $R$ to a clique if it has a neighbour among its unremoved vertices. If a nonempty set $Z\subseteq R$ had at most $|Z|-1$ adjacent cliques, we could exclude $|Z|-1$ matching cliques containing all of them. Property 1 would then give at least $\eta s$ candidate neighbours in the remaining cliques, more than were removed. Hall's theorem therefore gives the matching. Use one neighbour from each matched clique and fill all other unused cliques with any unremoved vertex. Together with the greedy choices this gives a maximal independent set $J$ of $H$ disjoint from $T$. Every vertex in $T\cap I$ is adjacent to $J$. Add to $J$ all vertices of $I$ with no neighbour in $J$. The result is a maximal independent set of $G$ disjoint from $T$.

This proves $\tau(G)\gt t$. Since $r=\Theta_c(\log s)$ and $n=(K+1)rs^2$, we have $t=\Theta_c(\sqrt{n\log n})$, as claimed.

## Limit of the random construction

More generally, suppose each of the $r$ joined parts of $H$ consists of $s$ cliques of size $b$ and the independent set $I$ still has size $Krsb$. Each maximal independent set of $G$ is determined by its intersection with $H$. This intersection is empty or comes from one part, with at most one vertex per clique. Thus there are at most $1+r(b+1)^s$ maximal independent sets. If $G$ is $c$-hollow, a uniform random sample hits them all with positive probability once its size is $O_c(s\log(b+1)+\log(r+1))$. With independent cross-edge probability $\lambda/s$, a vertex in $I$ has expected degree $\lambda r b$. With probability at least $1-2^{-|I|}$ some vertex in $I$ has degree at most $2\lambda r b$. Its closed neighbourhood meets every maximal independent set. On this event the two bounds give
```math
\tau(G)
=O_c\!\left(\min\{rb,s\log(b+1)+\log(r+1)\}\right)
=O_c(\sqrt{n\log n}).
```
The final estimate follows by bounding the minimum of $rb$ and $s\log(b+1)$ by their geometric mean, and using $n=(K+1)rsb$. The construction attains this order for every fixed $c$. The conjectured sublinear upper bound for arbitrary $c$-hollow graphs remains open.
