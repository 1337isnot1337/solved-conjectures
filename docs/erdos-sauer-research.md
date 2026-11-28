# Erdős–Sauer conjecture

For an $r$-uniform hypergraph $G$ on $n$ vertices let $K=K_{r+1}^{(r)}$ and let $\nu(G)$ denote the maximum number of edge-disjoint copies of $`K`$. The smallest number of pieces in a partition of $E(G)$ into copies of $`K`$ and single edges is
```math
D(G)=|E(G)|-r\nu(G).
```
The conjecture is $D(G)\le\mathop{\mathrm{ex}}\nolimits_r(n,K)$ for every $r\ge2$ and every $n$. The original paper places the conjecture immediately after the Erdős–Goodman–Pósa theorem, which gives $r=2$. This is the hypergraph decomposition question in Section IV.3, p. 8. [Erdős, Combinatorica 1981](https://www.renyi.hu/~p_erdos/1981-16.pdf) · [Erdős Problem 719](https://www.erdosproblems.com/719) · [Research issue](https://github.com/1337isnot1337/solved-conjectures/issues/72)

Searches by author, title, problem number and the packing and covering formulations found no proof of the exact unrestricted statement. The July 2026 working report proves a range near $n=r$ by complementing edges and identifies a connection to the Aharoni–Zerbib conjecture. Pikhurko and Sousa establish an asymptotic decomposition theorem for ordinary graphs with a fixed piece graph. The argument below obtains a hypergraph bound with a strict saving proportional to the clique packing number before the approximation error. [Problem 719 working report](https://www.erdosproblemaday.com/report/719) · [Pikhurko–Sousa](https://opikhurko.warwick.ac.uk/E/PikhurkoSousa07jctb.pdf) · [Parker on generalized Tuza](https://doi.org/10.37236/13355)

## The asymptotic bound and stability

**Theorem.** Fix $r\ge3$. Define $\gamma_3=20/7$ and $\gamma_r=r-1$ for $r\ge4$. Uniformly over $n$-vertex $r$-graphs,
```math
D(G)\ \le\ \mathop{\mathrm{ex}}\nolimits_r(n,K)-(r-\gamma_r)\nu(G)+o(n^r).
```
Consequently the maximum decomposition number is $\mathop{\mathrm{ex}}\nolimits_r(n,K)+o(n^r)$. Every sequence attaining that value to within $o(n^r)$ is within $o(n^r)$ edge deletions of a $`K`$-free sequence with $\mathop{\mathrm{ex}}\nolimits_r(n,K)-o(n^r)$ edges. For any fixed $\epsilon\gt0$, the exact conjectured bound holds for sufficiently large $n$ if $|E(G)|\ge\mathop{\mathrm{ex}}\nolimits_r(n,K)+\epsilon n^r$.

Let $\tau_K(G)$ denote the minimum number of edges whose removal makes $G$ $`K`$-free. Write $`\nu^*(G)`$ for the fractional packing number, which by linear programming duality equals the minimum total edge weight of a fractional $`K`$-cover. Theorem 1.1 of Rödl, Schacht, Siggers and Tokushige gives $`\nu^*(G)-\nu(G)=o(n^r)`$ uniformly. We show below that $`\tau_K(G)\le\gamma_r\nu^*(G)`$. Since deleting a cover leaves at most $\mathop{\mathrm{ex}}\nolimits_r(n,K)$ edges,
```math
|E(G)|-r\nu(G)\le\mathop{\mathrm{ex}}\nolimits_r(n,K)+\gamma_r\nu^*(G)-r\nu(G),
```
which proves the estimate. An extremal $`K`$-free graph supplies the matching leading-order lower bound. Near equality forces $\nu(G)=o(n^r)$, and deleting all the edges in a maximum packing makes the graph $`K`$-free and deletes $(r+1)\nu(G)$ edges. For the last assertion, the same deletion gives $\nu(G)\ge\epsilon n^r/(r+1)$, and $r-\gamma_r\gt0$ absorbs the approximation error. [Rödl–Schacht–Siggers–Tokushige, Theorem 1.1](https://www.math.uni-hamburg.de/home/schacht/2007/frac_packings.pdf)

## Fractional covering with a saving

The following argument works for an arbitrary family $\mathcal F$ of $(r+1)$-sets, with integral and fractional covers by $r$-sets and fractional matchings using capacity one at each $r$-set. We adapt the support rounding of Basit, McGinnis, Simmons, Sinnwell and Zerbib to the complete $r$-graph on $r+1$ vertices with **one edge removed**. [Basit et al., Theorem 1.10 and Section 4](https://doi.org/10.37236/10829)

Suppose there is a random $r$-graph $A$ on the ground set such that every $(r+1)$-set contains at most $r-1$ edges of $A$, and every $r$-set belongs to $A$ with probability at least $a$. Set
```math
\gamma=\max\{r-1,(r+1)(1-a)\}.
```
Take an optimal fractional cover $x$ with support $U$ and an optimal fractional matching $y$. Every $u\in U$ has load $\sum_{F\supset u}y_F=1$ by complementary slackness. Counting incidences of $U$ with members of $\mathcal F$ therefore gives $|U|\le(r+1)\sum_F y_F$.

Use induction on $|\mathcal F|$. If some $x_u\ge1/\gamma$, put $u$ in the integral cover and remove all sets containing it. The remaining fractional cover costs at most $\sum_v x_v-x_u$, so the induction bound pays for the edge just added. Otherwise every $F\in\mathcal F$ contains at least $r$ supported $r$-sets, because $\gamma\ge r-1$ and the cover weights on $F$ sum to at least one. Thus $U\setminus A$ meets every $F$. Its expected size is at most $(1-a)|U|\le\gamma\sum_F y_F$. Some realization is an integral cover of the required size.

For $r=3$, use the six-vertex $3$-graph $`H_6`$ of the Frankl–Füredi construction. It consists of a cyclically ordered five-set and a sixth vertex, with five triples formed by the sixth vertex and two consecutive cycle vertices, and five triples of cycle vertices inducing exactly one cycle edge. Each four-set has at most two triples. Assign independent infinite sequences of uniform six-colour labels to the vertices. Include a triple if at its first nonconstant coordinate its three labels form a triple of $`H_6`$. For a four-set, inspect its first nonconstant coordinate. If there are four distinct labels, use the $`H_6`$ condition. With three distinct labels, at most the two triples with distinct labels can be selected. With two distinct labels, only a triple in a class of three can be selected later. The inclusion probability for each triple is $(10\cdot 3!/6^3)/(1-6^{-2})=2/7$. This gives $\gamma_3=20/7$. [Frankl–Füredi construction](https://www.combinatorics.org/ojs/index.php/eljc/article/download/v19i3p40/pdf/) for $`H_6`$.

For $r\ge4$, use independent infinite sequences of fair bits. Include an $r$-set if its number of ones at the first nonconstant coordinate belongs to one fixed parity of $`\{2,\ldots,r-2\}`$. On any $(r+1)$-set, let $j$ be its number of ones at the first nonconstant coordinate. When $j=1$ or $j=r$, at most the single monochromatic $r$-subset can be included later. For $2\le j\le r-1$ the $r$-subsets have counts $j-1$ and $j$, with multiplicities $j$ and $r+1-j$. At most one of the counts is selected, so at most $r-1$ subsets are included. The inclusion probability is the binomial mass of the chosen counts divided by $1-2^{1-r}$. For $r=4$ use count two, giving $a=3/7$. For $r=5$ use count two, giving $a=1/3$. For $r\ge6$ choose the parity with the larger mass, which even without the denominator gives $a\ge(1-2(r+1)2^{-r})/2\ge25/64$. Thus $a\ge2/(r+1)$ and $\gamma_r=r-1$ for every $r\ge4$.

## Exact bound when each edge belongs to at most two cliques

Suppose $r\ge3$ and every edge of $G$ lies in at most two copies of $`K`$. Form the graph $J$ whose vertices are the copies and whose edges correspond to shared $r$-edges. Then $\nu(G)=\alpha(J)$ and $\Delta(J)\le r+1$. A maximum matching of $J$ gives a cover of the copies by the shared edges of its matching pairs and one arbitrary edge from each unmatched copy. There are at most $\alpha(J)$ unmatched copies, since they form an independent set in $J$. Also $|V(J)|\le(r+2)\alpha(J)$ by greedy proper colouring. Hence
```math
\tau_K(G)\le\frac{|V(J)|+\alpha(J)}{2}
\le\frac{r+3}{2}\nu(G)
\le r\nu(G).
```
This establishes $D(G)\le\mathop{\mathrm{ex}}\nolimits_r(n,K)$ in this class, at every order. The general case close to the Turán threshold with unrestricted clique overlaps remains open.
