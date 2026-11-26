# Sonntag–Teichert conjecture

A set of vertices of an oriented graph is dominating if every vertex outside the set receives an arc from it. The domination hypergraph has the inclusion-minimal dominating sets as its edges. We prove Sonntag and Teichert's conjecture that the domination hypergraph of any tournament has at most one nontrivial connected component. Equivalently, after isolated vertices are discarded, the hypergraph is connected. [Original conjecture, p. 182](https://doi.org/10.7494/OpMath.2010.30.2.179)

## The tournament case

For a vertex $v$, write $`I(v)=\{v\}\cup N^-(v)`$ for its closed in-neighbourhood. Let $\mathcal C$ be the inclusion-minimal members of the family of all $I(v)$, and let $\mathcal D$ be the family of inclusion-minimal dominating sets. A set dominates precisely when it meets every member of $\mathcal C$. Conversely, a set meets every member of $\mathcal D$ precisely when it contains some $I(v)$. Indeed, if it contains none, its complement meets every $I(v)$ and therefore contains a minimal dominating set. It follows that $\mathcal C$ is also the family of minimal sets meeting every member of $\mathcal D$.

Suppose there are two nontrivial components of the domination hypergraph. A singleton dominating set would consist of a source that beats every other vertex, so every dominating set would contain that source and $\mathcal D$ would have just the singleton edge. Thus all edges of $\mathcal D$ have size at least two.

Split the vertex set into two sides $X,Y$ so each edge of $\mathcal D$ belongs to a side and both sides contain an edge. Let $A_1,\ldots,A_p\subseteq X$ be the minimal sets meeting every edge on side $X$, and $B_1,\ldots,B_q\subseteq Y$ the corresponding sets on side $Y$. A minimal set meeting all edges is exactly the union of a minimal choice from each side. Therefore
```math
\mathcal C=\{A_i\cup B_j:1\le i\le p,\ 1\le j\le q\}.
```
Both $p$ and $q$ are at least two. For example, if $A_1$ were the sole minimal choice on side $X$, each singleton $`\{x\}`$ with $x\in A_1$ would meet every member of $\mathcal C$ and be a dominating set.

For each pair $(i,j)$ let $w_{ij}$ be a vertex with $I(w_{ij})=A_i\cup B_j$. The vertices $w_{ij}$ are distinct. A row $i$ can contain at most one representative from $A_i$. Two such representatives would belong to each other's closed in-neighbourhoods, forcing opposite arcs between them. A column $j$ likewise contains at most one representative from $B_j$. Each representative belongs to its row set or its column set, so
```math
pq\le p+q.
```
As $p,q\ge2$, we have $p=q=2$. The sets $A_1,A_2$ are disjoint, since any common vertex would meet every member of $\mathcal C$ and dominate by itself. The same applies to $B_1,B_2$. Now $A_1\cup B_1$ and $A_2\cup B_2$ are disjoint. In a tournament the closed in-neighbourhoods of two vertices always intersect, since the tail of the arc between them belongs to both. This proves the conjecture.

## Disconnected domination hypergraphs of oriented graphs

Allow pairs with no arc, retaining the rule that a pair cannot carry opposite arcs. We show that the domination hypergraph on its nonisolated vertices is either connected or the disjoint union of two stars, and every such union occurs. A single edge counts as a star.

The proof up to the disjointness of $A_1,A_2,B_1,B_2$ applies to an arbitrary oriented graph. A set meets all four members of $\mathcal C$ exactly when it meets both $A_i$ or both $B_j$. Thus the domination hypergraph consists of the complete bipartite graphs with parts $(A_1,A_2)$ and $(B_1,B_2)$, together with isolated vertices.

Equality in $pq\le p+q$ forces each row to have exactly one representative from its row set and each column exactly one from its column set. After relabelling, write the four representatives as
```math
a_1=w_{11}\in A_1,\quad b_2=w_{12}\in B_2,\quad
a_2=w_{22}\in A_2,\quad b_1=w_{21}\in B_1.
```
For $`x\in A_1\setminus\{a_1\}`$, the arcs from $x$ to $a_1$ and $b_2$ exclude those two representatives from $I(x)$. The only member of $\mathcal C$ avoiding both is $A_2\cup B_1$, which must therefore lie in $I(x)$. Likewise, every nonrepresentative in $A_2$ has $A_1\cup B_2$ in its closed in-neighbourhood. If both $A_1$ and $A_2$ had a nonrepresentative, the two would have arcs in both directions. Thus one of $A_1,A_2$ is a singleton. Applying the argument to $B_1,B_2$ shows that one of them is also a singleton.

For the converse, start with any four disjoint nonempty sets $A_1,A_2,B_1,B_2$ with a singleton in each pair of parts. Designate the four representatives as above and give each exactly its prescribed closed in-neighbourhood. The arcs between representatives form the directed cycle $a_1\to b_2\to a_2\to b_1\to a_1$. For other vertices prescribe predecessors by the following table.

| Vertex belongs to | Required predecessors |
| --- | --- |
| $`A_1\setminus\{a_1\}`$ | $A_2\cup B_1$ |
| $`A_2\setminus\{a_2\}`$ | $A_1\cup B_2$ |
| $`B_1\setminus\{b_1\}`$ | $A_2\cup B_2$ |
| $`B_2\setminus\{b_2\}`$ | $A_1\cup B_1$ |

For a nonrepresentative $x$, the required predecessors exclude the two representatives to which $x$ sends arcs. The only possible opposite-arc conflicts between nonrepresentatives would require one in each of $A_1,A_2$ or one in each of $B_1,B_2$. The singleton assumptions exclude both. Use only the prescribed arcs. Any extra isolated vertices of the domination hypergraph can be realized by adding vertices that receive arcs from every vertex in the four parts. Each closed in-neighbourhood then contains some $A_i\cup B_j$, and all four of these incomparable sets occur exactly. The resulting domination hypergraph has the two desired stars.
