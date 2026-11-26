# Oriented general position spectrum nonconstancy conjecture

## Statement

Let $G$ be a finite simple graph. An orientation $D$ of $G$ assigns exactly one direction to each edge. Write $g(D)$ for the largest cardinality of a set of vertices such that no directed shortest path contains three of them. Write $g_-(G)$ and $g_+(G)$ for the minimum and maximum of $g(D)$ over all orientations, respectively.

**Theorem.** If $G$ is connected and has at least three vertices, then $g_-(G)<g_+(G)$. More generally, the spectrum is a singleton exactly for graphs of maximum degree at most one.

This is [Conjecture 4.3](https://arxiv.org/html/2604.15909v1#S4.SS1) of Chandran, Di Stefano, Erskine, Haritha, Thomas and Tuite. It does not decide whether the spectrum has gaps.

## Proof

If a vertex has two neighbors, start with the three-vertex path through that vertex. An edge joining the endpoints does not matter: the path need not be induced.

Extend the path at either endpoint whenever there is a neighbor not already on it. When neither endpoint can be extended, remove all its vertices. Start from any remaining vertex and repeat until no vertices remain. This partitions the vertices into paths $P_1,\ldots,P_k$, with $P_1$ containing at least three vertices. A singleton is allowed. For each $P_i$, select both endpoints, counting a singleton once. Let $S$ be their union and set $b=|S|$.

**Low orientation.** Orient each path forward along its listed order. Orient every other edge within that path backward. Orient every edge between paths from the earlier path to the later path. This is the path-cover orientation of [Lemma 4.9 in the original paper](https://arxiv.org/html/2604.15909v1#S4.SS1). A directed walk between two vertices of $P_i$ cannot leave $P_i$ and return, since the path-block index increases strictly on every cross-block arc. Within $P_i$ every arc advances the path index by at most one. Thus the forward segment between any two vertices of $P_i$ is a shortest directed path between them. Every general position set takes at most two vertices of each nonsingleton path and at most one of each singleton. It follows that $g_-(G)\le b$.

**High orientation.** No chosen endpoint of $P_i$ has a neighbor on any later path: at the time of removal, such a neighbor would extend $P_i$. So $G[S]$ has maximum degree at most one. Take an internal vertex $v$ of $P_1$, and obtain $T$ by adding $v$ to $S$. Orient edges at $v$ in $G[T]$ away from $v$. If an edge in $G[S]$ has exactly one endpoint adjacent to $v$, orient it toward that endpoint. Orient all other edges of $G[S]$ arbitrarily. Any directed two-edge path in $G[T]$ must start at $v$. Its last vertex is also adjacent to $v$ by the rule for edges of $G[S]$, so a direct arc shortcuts this path.

Extend the orientation to $G$ by orienting all edges between $T$ and its complement into $T$, with arbitrary directions elsewhere. A directed path starting in $T$ cannot leave it. A directed shortest path containing at least three vertices of $T$ would therefore contain a two-edge segment in $T$ with a direct shortcut. This is impossible. Hence $T$ is a general position set and $g_+(G)\ge b+1$.

Combining the orientations gives $g_-(G)\le b<b+1\le g_+(G)$. Every connected graph of order at least three has a vertex of degree at least two, so this proves the conjecture. If instead every vertex has degree at most one, every orientation has no directed path of length two and its entire vertex set is in general position. This proves the singleton characterization as well. ∎

## Algorithmic consequence

The two orientations, the separating integer $b$, and their elementary certificates can be constructed without finding a longest path or optimizing either general position number. With adjacency lists, scan a vertex's neighbors when it is an endpoint and keep a cursor while it remains one. A skipped occupied vertex never becomes free again. Each vertex becomes an endpoint at most once, and the two endpoint roles for an initial singleton can share a cursor. Path assignment and both orientations can therefore be built in time linear in the number of vertices and edges.
