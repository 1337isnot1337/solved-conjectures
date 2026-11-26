# The terminal set existence conjecture

Research note for [#869](https://github.com/1337isnot1337/solved-conjectures/issues/869). This proves an exact classification for finite Helly graphs and all their powers, and existence for finite weakly bridged graphs. It does not resolve the unrestricted conjecture.

## Definitions and sources

A set is in general position if none of its triples lies on a shortest path. It is terminal if, for every outside vertex $u$, there are distinct set members $x,y$ with $d(u,y)=d(u,x)+d(x,y)$. The endpoint must be the outside vertex, as in [Welton, Khudairi and Tuite, Conjecture 3.3](https://arxiv.org/abs/2404.19451). General-position components and their distance partition are from [Anand, Ullas Chandran, Changat, Klavžar and Thomas](https://doi.org/10.1016/j.amc.2019.04.064); the properties needed below are derived directly. For ball-Helly graphs, see [Chalopin, Chepoi, Genevois, Hirai and Osajda](https://msp.org/gt/2025/29-1/gt-v29-n1-p01-s.pdf), Definition 2.5. For the weakly bridged projection property see [Chepoi and Osajda](https://arxiv.org/abs/0910.5444), Section 2.2 and Theorem 3.1.

## Helly graphs: exact classification

**Theorem.** In a nonempty finite connected ball-Helly graph, the terminal sets are exactly the maximal cliques. This remains true for every graph power. In particular, the minimum and maximum terminal-set sizes in each such graph are the minimum size of a maximal clique and the clique number, respectively.

A clique is in general position. If a vertex $u$ outside a clique sees two of its members at different distances, those distances differ by one, and the two members give the required witness. Conversely, a vertex equidistant to every member has no witness. A nonmaximal clique therefore is not terminal.

Let $C$ be a maximal clique, and suppose $d(u,c)=k$ for every $c\in C$. Consider $B_{k-1}(u)$ and the balls $B_1(c)$ for $c\in C$. Any two of the latter intersect, and a shortest $u,c$ path gives a vertex in $B_{k-1}(u)\cap B_1(c)$. By the Helly property the entire family intersects. A common vertex is not in $C$ and is adjacent to every member of $C$, contradicting maximality. Thus every maximal clique is terminal.

It remains to exclude all nonclique general-position sets $S$. The components $C_1,\dots,C_m$ of $G[S]$ are cliques: a nonclique component contains an induced three-vertex path, which is a forbidden geodesic. Every outside member of $S$ sees an adjacent pair in the same component at the same distance, since otherwise the pair gives a forbidden geodesic. Thus the distance between any two distinct components is constant, say $d_{ij}\ge2$. Every triangle of distinct components satisfies the strict triangle inequalities.

Choose distinct components $C_a,C_b$ at the diameter $D$ of $S$. Fix any integer $h$ with $1\le h\le D-1$. Give the components positive integer radii $r_i$ satisfying $r_i+r_j\ge d_{ij}$ for all $i\ne j$, with $r_a=h$ and $r_b=D-h$. This is feasible with all other radii initially $D$. Take a coordinatewise minimal vector under those bounds. The two designated radii cannot decrease even if allowed to, since they sum to $D$. Thus for every $i$ with $r_i>1$ there is some $j\ne i$ with $r_i+r_j=d_{ij}$.

We claim that $|r_i-r_j|<d_{ij}$ for every $i\ne j$. Otherwise assume $r_i\ge r_j+d_{ij}$. Then $r_i>1$, so pick $\ell$ with $r_i+r_\ell=d_{i\ell}$. Here $\ell\ne j$ because $r_j>0$. The inequality $r_j+r_\ell\ge d_{j\ell}$ now gives $d_{i\ell}\ge d_{ij}+d_{j\ell}$, contradicting strictness.

Apply Helly to one ball $B_{r_i}(x)$ for each vertex $x$ in each component $C_i$. Two balls from the same component intersect because the centers are adjacent; balls from distinct components intersect by $r_i+r_j\ge d_{ij}$ and the existence of shortest paths. Let $u$ be a common vertex. For every $x\in C_a$ and $y\in C_b$, the bounds on the distances to $u$ sum to $D=d(x,y)$, so each is exact. The vertex $u$ is not in $S$: it is not in $C_a$ or $C_b$ because both designated distances are positive, and if it were in another component, it would give a forbidden triple in $S$ on a shortest $x,y$ path.

For $r_i=1$, being outside $S$ now forces $d(u,x)=1$ for every $x\in C_i$. For $r_i>1$, choose a tight partner $j$; equality in $d(x,y)\le d(x,u)+d(u,y)\le r_i+r_j=d_{ij}$ forces $d(u,x)=r_i$ for every $x\in C_i$. We have produced a vertex at constant distance within each component, and with every difference between components strictly smaller than their distance. No pair of members witnesses terminality at $u$. The argument in fact works for any chosen intercomponent pair and any positive integer split of its distance, if the other initial radii are the diameter of $S$.

Finally, if $G^p$ joins vertices whose original distance is at most $p$, then $d_{G^p}(x,y)=\lceil d_G(x,y)/p\rceil$ by partitioning an original geodesic into blocks of at most $p$ edges. Its balls are precisely original balls of radii divisible by $p$, so the Helly property persists.

## Weakly bridged graphs: every maximal clique is terminal

The flag complex of a weakly bridged graph is weakly systolic. Its simple-descent property says that if a clique $C$ is contained in the sphere at distance $k\ge1$ from $u$, then a vertex at distance $k-1$ from $u$ is adjacent to every member of $C$. Thus a maximal clique cannot lie in a sphere of an outside vertex. The clique criterion above proves terminality. This includes bridged graphs and extends the chordal case in the original paper beyond chordality and bounded diameter. This argument does not assert that all terminal sets in weakly bridged graphs are cliques.

## Priority and scope

The two graph-geometric tools above are prior results; the transfer to terminal-set existence and the exact Helly classification are the contributions of this note. Searches for the exact conjecture and for terminal sets and maximal cliques in Helly, bridged and weakly bridged graphs led to the primary conjecture paper, the general-position survey ([arXiv:2501.19385](https://arxiv.org/abs/2501.19385)), and the cited graph geometry papers. None of those states the Helly classification. This is a literature check, not a claim that no equivalent result could exist elsewhere.
