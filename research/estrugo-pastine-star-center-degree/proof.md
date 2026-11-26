# Degree of a maximum star center

For a finite simple graph $G$, write $s_r(v)$ for the number of independent sets of size $r$ containing $v$. A maximum $r$-center is a vertex maximizing $s_r(v)$. Hurlbert and Kamat attribute to Estrugo and Pastine the question whether every graph has a maximum $r$-center of degree $\delta(G)+o(|V(G)|)$. The answer is negative. The first construction gives trees with a unique maximizing vertex. The second works for every fixed $r\ge3$ and has degree gap asymptotic to the entire graph order. [Hurlbert–Kamat, last paragraph of §4](https://glennhurlbert.github.io/Papers/IFISTpub.pdf) · [Estrugo–Pastine](https://doi.org/10.1016/j.dam.2021.03.013)

## A unique maximum center of linear degree in a tree

**Theorem.** For every integer $d\ge3$ there is a tree $T_d$ on $22d+1$ vertices with minimum degree one and no vertices of degree two. Its unique maximum $(15d-1)$-center has degree $d$.

Start with a root $x$. Give $x$ exactly $d$ children, give each of these children three children, give each grandchild of $x$ two children, and attach two leaves to each of those last vertices. The five levels have sizes $1,d,3d,6d,12d$. Call their even levels $A$ and their odd levels $B$. Thus $a=|A|=1+15d$. The vertices in $B$ have degree four at level one and degree three at level three.

For nonempty $U\subseteq B$, let $N(U)$ be its set of neighbors in $A$ and let $c$ be the number of components of the forest induced by $U\cup N(U)$. Counting its edges by degrees on one side and then by components gives

```math
|N(U)|-|U|=c+\sum_{u\in U}(\deg(u)-2).
```

An independent set that uses exactly $U$ on side $B$ has size at most $a-|N(U)|+|U|$. For nonempty $U$, the displayed difference is at least two. It equals two exactly when $U$ consists of a single level-three vertex. Indeed, a level-one vertex contributes two to the sum, and any two vertices contribute at least two, in both cases in addition to $c\ge1$. A single degree-three vertex has three distinct neighbors and gives equality.

Consequently $A$ is the unique maximum independent set. The independent sets of size $a-2$ are exactly

- the sets obtained by deleting two vertices from $A$, and
- the $6d$ sets $(A\setminus N(b))\cup\{b\}$, one for each level-three vertex $b$.

In the first class each vertex of $A$ occurs $\binom{a-1}{2}$ times. All $6d$ additional sets contain $x$. Each level-two vertex misses two additional sets, and each leaf misses one. Every level-three vertex occurs in exactly one set and every level-one vertex in zero. Hence $x$ is the unique maximizer. Its excess degree divided by the order is $(d-1)/(22d+1)$, which tends to $1/22$. This proves the theorem.

## A fixed rank with degree gap asymptotic to the order

**Theorem.** Fix $r\ge3$. There exist connected graphs $G$ of arbitrarily large order $n$ such that the degree of every maximum $r$-center exceeds $\delta(G)$ by $n-o(n)$. Every maximal independent set in these graphs has size at least $2r+1$.

For a large integer $N$ set $s=\lfloor N^{3/4}\rfloor$. Construct the complement $H$ of $G$ as the disjoint union of a clique $K_s$ and a graph made by joining a clique $K_{2r}$ to $N$ mutually nonadjacent vertices. Thus $n=N+2r+s$. In $G$ the two components of $H$ are completely joined, so $G$ is connected. Its maximal independent sets are maximal cliques of $H$, of sizes $s$ and $2r+1$.

Counting independent $r$-sets through a vertex of $G$ amounts to counting $r$-cliques through that vertex in $H$. These counts are

| Vertex in $H$ | Count |
| --- | --- |
| In the separate $K_s$ | $\binom{s-1}{r-1}$ |
| In the $K_{2r}$ | $\binom{2r-1}{r-1}+N\binom{2r-1}{r-2}$ |
| In the independent $N$-set | $\binom{2r}{r-1}$ |

For fixed $r\ge3$ the first count is of order $N^{3(r-1)/4}$, which grows faster than $N$. Thus exactly the vertices of the separate clique are maximum $r$-centers for all sufficiently large $N$. Their degree in $G$ is $n-s$. The vertices of the $K_{2r}$ have degree $s$ in $G$, and the remaining vertices have degree $n-1-2r$, so $\delta(G)=s$ for large $N$. The gap is $n-2s=n-o(n)$, as asserted. At ranks one and two a minimum-degree vertex always maximizes the star, since $s_1(v)=1$ and $s_2(v)=n-1-\deg(v)$.
