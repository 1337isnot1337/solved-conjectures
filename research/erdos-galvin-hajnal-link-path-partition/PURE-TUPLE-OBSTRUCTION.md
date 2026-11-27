# Erdős–Galvin–Hajnal’s individual configuration avoidance problem

## The pure ordered tuple obstruction for a loose triangle

An uncountably chromatic triple system on exactly \(\omega_1\) that omits the loose triangle \(T_1\) cannot be a full finite-tuple order-type construction over \(\omega_1\). More precisely:

**Theorem.** Let \(\lambda\) be infinite, \(\kappa=\lambda^+\), and \(r\ge2\) be finite. A host has at most \(\lambda\) sorts, each consisting of **all** increasing \(m\)-tuples from \(\kappa\) for some positive finite \(m\) (tags distinguish sorts). Whether \(r\) vertices make an edge depends only on their sorts and the order type with equalities of all their coordinates. If the host has chromatic number \(>\lambda\), it contains the complete \(r\)-partite \(r\)-uniform hypergraph with \(N\) vertices per part for every finite \(N\). This holds for any collection of permitted types, not just one selected type.

Choose distinct binary codes \(u_\alpha\in 2^\lambda\) for \(\alpha<\kappa\), possible because \(2^\lambda\ge\kappa\). For each tuple \(x=(x_0,\ldots,x_{m-1})\), choose a finite \(D_x\subseteq\lambda\) such that the restrictions \(u_{x_i}\upharpoonright D_x\) are all distinct. Also fix injections \(e_\beta:\beta\to\lambda\) for \(\beta<\kappa\). Colour \(x\) by:
1. its sort;
2. \(D_x\) and its ordered list of restricted binary codes;
3. \(\big(e_{x_{m-1}}(x_i):i<m-1\big)\).

This uses at most \(\lambda\) colours. In a monochromatic edge all vertices have the same sort. First, any equality of underlying coordinates between two tuples must be **at the same position**: otherwise their common \(D_x\) and common code profile contradict within-tuple distinctness. Second, two distinct tuples cannot have the same maximum coordinate, since the common vector in item 3 and injectivity of \(e_\beta\) would make them identical. Thus the last coordinate of each of the \(r\) participating tuples is private: it occurs in no other tuple of the edge.

Now replace each of these private coordinate values by a block of \(N\) distinct values, and every other distinct coordinate value by a singleton block, using the same strict order between all blocks. This is a finite configuration, so the blocks can be placed in \(\kappa\) regardless of any gaps in the original witnessing edge. Vary the private coordinate of each tuple inside its block, leaving other coordinates fixed at their corresponding singletons. Each cross-part choice of one tuple maintains the full edge type, hence is an edge. The \(r\) collections of variants are disjoint (private coordinates lie in disjoint blocks). This proves the theorem.

For \(r=3,N=2\), the three cross-part triples
\[
 (a_0,b_0,c_0),\quad (a_0,b_1,c_1),\quad (a_1,b_0,c_1)
\]
form \(T_1\), their pairwise intersections being three distinct singleton vertices. Therefore every \(T_1\)-free triple system in this full-tuple class has a proper countable colouring when \(\kappa=\omega_1\). This does **not** establish that every \(T_1\)-free system on \(\omega_1\) is countably colourable: such a conclusion would contradict the original CH result. Hereditary subdomains of tuple sets, extra structure on coordinates, and forcing-based constructions are not subject to the full-sort cloning step.

**Context and checked distinction.** The pure-type mechanism is the natural comparison with [Erdős–Hajnal’s fixed-finite-tuple graph construction, Theorem 7.4](https://www.renyi.hu/~p_erdos/1966-07.pdf#page=16), and [the graph type framework](https://doi.org/10.1016/j.jctb.2016.10.004). Where the graph construction is used as a graph-to-hypergraph seed one can get \(T_3\)-freeness by taking directed two-paths in a triangle-free graph, but the pure-type obstruction above precludes a loose-triangle-free full-tuple witness of chromatic number \(\aleph_1\). The original [Problem 9/A](https://www.renyi.hu/~p_erdos/1975-24.pdf#page=57) separates the individual patterns. This note is a restriction on a construction method, not a resolution of the individual ZFC \(T_1\) question.
