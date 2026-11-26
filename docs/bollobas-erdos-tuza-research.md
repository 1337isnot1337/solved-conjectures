# Earlier transversal bounds for the Bollobás–Erdős–Tuza conjecture

The [recursive construction and induced-biclique theorem](../results/erdos-611-clique-transversals/) strengthen the lower bound below and give another class with a sublinear transversal.

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
By the lower bound on $p|R|$, we have $`\max\{0,\log(\ell_j/(p|R|))\}\le j+B`$. The displayed probability is therefore at least $s^{-A-2\lambda\kappa}\ge s^{-1/2}$. The $s^2/4$ candidate vertices have independent indicators, so their mean count is at least $s^{3/2}/4$. The probability they give fewer than $\eta s$ successes is $\exp(-\Omega(s^{3/2}))$. There are at most $r2^s\sum_{u\le t}\binom{KM}{u}=\exp(O_c(s(\log s)^2))$ choices in property 2. This proves the simultaneous claim.

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

## A constant upper bound for bounded modular width

The conjecture holds with a constant upper bound for graphs of bounded modular width. Here a graph has modular width at most $k\ge2$ if it can be built from single vertices by substitution into quotient graphs on at most $k$ vertices. Substitution replaces each quotient vertex by a nonempty graph, with all edges between two substituted graphs precisely when their quotient vertices are adjacent. Arbitrary disjoint unions and joins can be built using binary substitutions. This agrees with the convention of bounding the arity of the prime nodes in a modular decomposition. [Maximal clique decompositions by modular width, Section 6.2](https://doi.org/10.3390/math14183352)

**Theorem.** Write $i(G)$ for the minimum size of a maximal independent set. Every nonempty graph $G$ of modular width at most $k\ge2$ satisfies
```math
\tau(G)\le \left(\frac{|V(G)|}{i(G)}\right)^{4k+1}.
```
In particular, $\tau(G)\le c^{-(4k+1)}$ for every $c$-hollow graph in this class, with no bound on the number of substitution levels. Cooper–Hollars give the sharper estimate $\tau(G)\le 1/c$ for cographs. [Cooper–Hollars, Section 5](https://arxiv.org/abs/2607.15486)

**Packing lemma.** For at most $k$ items of weights $w_j\in(0,1)$ there is a random subset of total weight strictly below $1$ with inclusion probabilities at least $1-w_j^{1/(4k)}$.

Set $a=1/(4k)$ and call an item large if its weight is at least $1/2$. Give each large item $v$ a disjoint interval inside $[0,1]$ of length $e_v=1-w_v^a$. The intervals fit because $e_v\le a\log 2$ and their total length $b$ is at most $1/4$. Choose a uniform point in $[0,1]$. If it belongs to the interval for $v$, take $v$ and every small item of weight strictly below $(1-w_v)/k$. This subset has weight strictly below $1$. The unconditional probability $A_j$ that a small item $j$ is omitted in the union of the intervals satisfies
```math
A_j\le \min\{b,2ak^2w_j\}.
```
Indeed, omission from the subset in the interval of $v$ requires $1-w_v\le kw_j$, and $1-w_v^a\le 2a(1-w_v)$ by the mean value theorem on $[1/2,1]$. Thus $A_j\le w_j^a$. For $w_j\ge 1/(2k)$ this follows from $b\le 1/4$ and $(2k)^{-a}\ge 1/2$. For $w_j\le 1/(2k)$ it follows from the comparison at $1/(2k)$ and from the fact that $w_j^{1-a}$ is increasing.

On the complement of those intervals, use only the small items with conditional inclusion probabilities
```math
z_j=\frac{\max\{0,\,1-w_j^a-b+A_j\}}{1-b}.
```
These numbers lie in $[0,1]$ and ensure the required total probabilities. The conditional expected weight satisfies
```math
L=\sum_j w_jz_j
\le \frac{a}{1-b}\sum_j w_j\log(1/w_j)
\le \frac13.
```
To realize the prescribed probabilities, decompose $(z_j)_j$ into extreme points of the polytope $0\le y_j\le1$, $\sum_j w_jy_j=L$. Each extreme point has at most one fractional coordinate, since two such coordinates could move in opposite weighted directions. Sample an extreme point according to the decomposition and round its fractional coordinate up with probability equal to its value. The resulting subset has weight at most $L+1/2\lt1$. This completes the proof of the packing lemma.

**Weighted transversal lemma.** Let $\mathcal F$ be a nonempty family of nonempty subsets on at most $k$ indices. Suppose $x_j,q_j\gt0$, that $\sum_{j\in F}x_j\ge1$ for every $F\in\mathcal F$, and that $\sum_j q_j=1$. For $p=4k+1$, there is a transversal $T$ with
```math
\sum_{j\in T}(q_j/x_j)^p\le1.
```
Set $r_j=q_j/x_j$. If every $r_j\ge1$, then $1\le\sum_j x_j\le\sum_j q_j=1$. All ratios equal one and every member of $\mathcal F$ contains every index. A singleton suffices. Otherwise apply the packing lemma to the weights $r_j^p$ for indices with $r_j\lt1$. This gives a random set $T$ of cost less than one. For each of those indices the omission probability is at most $r_j^{p/(4k)}\lt r_j$. At the other indices the omission probability is $1\le r_j$. Hence the expected $x$-weight of the indices outside $T$ is strictly below $\sum_j x_jr_j=1$. Some outcome leaves outside weight below one, so its $T$ hits every member of $\mathcal F$.

**Substitution.** For a quotient $Q$ with substituted graphs $G_j$, the maximal independent sets of the result $G$ are precisely the unions of maximal independent sets of the $G_j$ over a maximal independent set of $Q$. The occupied modules must be independent and maximal in the quotient, and the chosen sets within them must be maximal there. Conversely those two properties dominate every vertex of $G$ outside the union. Put $n_j=|V(G_j)|$, $i_j=i(G_j)$, $n=\sum_j n_j$ and $m=i(G)=\min_{S\in\mathop{\mathrm{MIS}}(Q)}\sum_{j\in S} i_j$. Take $q_j=n_j/n$ and $x_j=i_j/m$. The weighted transversal lemma supplies a set $T$ of quotient vertices hitting all its maximal independent sets. The union of transversals in modules indexed by $T$ hits every maximal independent set of $G$. By induction from a single vertex, its size is at most
```math
\sum_{j\in T}(n_j/i_j)^p
=\left(\frac{n}{m}\right)^p \sum_{j\in T}(q_j/x_j)^p
\le \left(\frac{n}{m}\right)^p.
```

The same proof gives $h(G)\le (|V(G)|/\alpha(G))^{4k+1}$ for the maximum-independent-set conjecture, where $h$ is the minimum size of a transversal of all maximum independent sets. In this case the quotient family consists of maximum-weight independent sets, with module weights $\alpha(G_j)$, and the chosen sets inside the occupied modules must be maximum independent sets there.
