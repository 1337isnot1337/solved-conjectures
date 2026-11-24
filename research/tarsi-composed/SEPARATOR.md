# Tarsi's conjecture: independent-separator core lifting

**Status:** partial progress, not a resolution. Research date 2026-11-23; issue #301. Priority unconfirmed.

Tarsi conjectures that every graph whose edges partition into a forest and a 2-degenerate graph is 5-colorable. The more general Klein–Schönheim conjecture concerns unions of graphs of prescribed degeneracies. The following structural theorem applies to all prescribed degeneracy vectors.

## Theorem

Let \(G\) be a finite simple graph with edge partition \(E(G)=E_1\sqcup\cdots\sqcup E_t\), where \(G_j=(V(G),E_j)\) is \(d_j\)-degenerate, with \(d_j\ge1\). Call such a graph *composed*. Let \(V(G)=A\cup B\), with \(S=A\cap B\) independent, and no edge between \(A\setminus S\) and \(B\setminus S\).

Suppose \(|S|\ge2\) and \(G[A]+xy\) is not composed for every distinct \(x,y\in S\). Then the simple graph \(G[B]/S\), obtained by identifying all of \(S\) to one vertex and suppressing duplicate edges, is composed with the same degeneracy vector.

In fact each color class in the restricted decomposition on \(B\) remains \(d_j\)-degenerate after identification, even before arbitrarily assigning multiply occurring image edges to just one color.

### Proof

Fix a color \(j\), abbreviate \(d=d_j\), and use \(R=G_j[A]\), \(T=G_j[B]\). Since \(R\) is \(d\)-degenerate but \(G[A]+xy\) is not composed, \(R+xy\) cannot be \(d\)-degenerate. Otherwise put the new edge into color \(j\) and retain the original decomposition of \(G[A]\).

Thus for every pair \(x,y\in S\), \(R+xy\) contains a subgraph of minimum degree at least \(d+1\). This subgraph must contain the added edge \(xy\), because \(R\) is \(d\)-degenerate. Removing \(xy\) produces a subgraph \(K_{xy}\) of \(R\), containing both endpoints, in which every vertex except \(x,y\) has degree at least \(d+1\), and each of \(x,y\) has degree at least \(d\).

Let \(z\) denote the image of \(S\) in the quotient \(T/S\). Suppose \(T/S\) contains a subgraph \(L\) of minimum degree at least \(d+1\). It must contain \(z\), since otherwise it is already a subgraph of \(T\).

Lift \(L\) to a subgraph \(L'\) of \(T\) by replacing \(z\) with all vertices of \(S\) which have a color-\(j\) edge to some neighbor of \(z\) in \(L\). For each edge from \(z\) retain all its preimages, and retain the original edges between vertices of \(L-z\). Write \(U\subseteq S\) for the set of these active terminals. Every vertex outside \(U\) has degree at least \(d+1\) in \(L'\), since any original edge incident to \(z\) lifts to at least one edge. Each vertex of \(U\) has positive degree. The set \(U\) is nonempty, and if \(|U|=1\), \(L'\) itself has minimum degree at least \(d+1\), contradicting the degeneracy of \(T\).

If \(|U|\ge2\), choose a family of unordered pairs from \(U\) covering all vertices of \(U\), for example a star centered at one vertex. For each chosen pair \(x,y\), include the graph \(K_{xy}\). Let
\[
K=L'\cup\bigcup_{\{x,y\}\text{ chosen}}K_{xy}.
\]
All these are subgraphs of the same original color \(G_j\). Each active terminal has degree at least \(d\) in an included \(K_{xy}\) and at least one in \(L'\). The incident edges counted in the two sides are distinct: \(S\) is independent and the interiors of the two sides are disjoint. Every other vertex has degree at least \(d+1\) in whichever included subgraph contains it (only active terminals can be exceptions in the \(K_{xy}\)). Hence \(K\) has minimum degree at least \(d+1\), contradicting \(d\)-degeneracy of \(G_j\).

This contradiction proves that the simple image of every color class on \(B\) is \(d_j\)-degenerate. If an image edge belongs to multiple colors, retain it in just one. Degeneracy is hereditary under edge deletion, so the resulting edge partition certifies that \(G[B]/S\) is composed. QED.

## Consequences

### 1. Closure under Ore composition

Take two non-composed graphs \(G_1,G_2\). Delete an edge \(xy\) in \(G_1\). Split a vertex \(z\) in \(G_2\) into two nonadjacent vertices, distributing the incident edges between them, and identify the split vertices with \(x,y\). This is the ordinary Ore composition (edge-side and split-side); the theorem also allows shared neighbors of the split vertices.

If the resulting graph \(G\) were composed, use the theorem with \(A\) the edge-side vertices, \(B\) the split-side vertices, \(S=\{x,y\}\). The hypothesis \(G[A]+xy=G_1\) is non-composed. The theorem makes \(G[B]/S=G_2\) composed, a contradiction.

In particular every \(6\)-Ore graph is non-\((1,2)\)-composed: the starting graph \(K_6\) has 15 edges, whereas a forest and a 2-degenerate graph on six vertices together have at most \(5+9=14\). Induction proves the assertion for all iterated Ore compositions. By Kostochka–Yancey's characterization of equality in their critical-graph density theorem, all extremal 6-critical graphs with
\[
|E|=(28|V|-18)/10
\]
are thereby excluded. This does not exclude every sparse non-Ore critical graph.

### 2. Minimal counterexample is 3-connected

Suppose Tarsi's conjecture is false. Choose a counterexample \(G\) minimizing first the number of vertices and then the number of edges. A forest admits a 2-coloring and a 2-degenerate graph a 3-coloring, so \(G\) is 6-colorable by their product; it is not 5-colorable. Composedness is hereditary, so minimality implies \(G\) is 6-critical. It is connected and has no cut vertex, since 5-colorings of proper sides could be glued by renaming colors.

Suppose a separating pair \(x,y\) exists. Choose a partition into nonempty sides with intersection exactly \(\{x,y\}\) and no edges between the interiors. Both induced sides have 5-colorings by minimality. If \(xy\) is an edge, the endpoints have distinct colors on both sides and the colorings can be glued. Thus \(xy\) is not an edge.

On each side consider the nonempty set of realizable relations between the colors of \(x,y\): equal or distinct. If the two sets intersect, rename the colors on one side and glue to produce a 5-coloring of \(G\). They must therefore be disjoint singletons. Relabel the sides so that all 5-colorings of \(G[A]\) give \(x,y\) equal colors and all 5-colorings of \(G[B]\) give them distinct colors.

Then \(G[A]+xy\) is not 5-colorable, and it has fewer vertices than \(G\), hence is not composed. The theorem implies \(G[B]/\{x,y\}\) is composed. This quotient is smaller, so it is 5-colorable by minimality. Pulling back its coloring gives a 5-coloring of \(G[B]\) with equal endpoint colors, contradiction. Therefore \(G\) is 3-connected.

### 3. Arbitrary forced-monochromatic independent separators

More generally, a smallest counterexample cannot have a proper separation as in the theorem with all 5-colorings of \(G[A]\) monochromatic on the independent separator \(S\). For each pair \(x,y\in S\), \(G[A]+xy\) is a smaller non-5-colorable graph, hence non-composed. The theorem yields a composed smaller quotient \(G[B]/S\), which admits a 5-coloring. Its pullback is monochromatic on \(S\) and can be glued to any 5-coloring of \(G[A]\).

The statement extends to minimal counterexamples to any proposed universal coloring bound on a composed class, with the appropriate number of colors. In particular this excludes an entire class of critical-graph constructions based on attaching a clique gadget to terminals forced to share one color.

## Literature and audit

- R. Klein, *On the colorability of m-composed graphs*, Discrete Mathematics 133 (1994), 181–190, [DOI](https://doi.org/10.1016/0012-365X(94)90025-6). Attributes the (1,2) case to Tarsi.
- R. Klein and J. Schönheim, *On the colorability of graphs decomposable into degenerate graphs with specified degeneracy*, Australasian Journal of Combinatorics 12 (1995), 201–208, [paper](https://ajc.maths.uq.edu.au/pdf/12/ajc-v12-p201.pdf). Theorems 2–8 prove non-composedness under Hajós conjunctions and certain restricted mergers. Ore's alpha-mergers in their terminology are Hajós conjunctions followed by additional identifications; the edge-side/split-side Ore composition above is the modern critical-graph operation. The paper does not state the general independent-separator quotient lemma proved here.
- A. Kostochka and M. Yancey, *A Brooks-type result for sparse critical graphs*, [arXiv:1408.0482](https://arxiv.org/abs/1408.0482), characterizes equality in their density bound and constructs 3-connected sparse critical graphs. Thus the connectivity reduction is not in itself sufficient for a full proof.
- [Open Problem Garden statement](https://www.openproblemgarden.org/op/coloring_the_union_of_degenerate_graphs). Current targeted primary-source search found no earlier complete resolution, nor a clear earlier statement of the independent-separator lemma. Priority remains provisional, especially for the two-terminal corollary.

Audit: the argument relies solely on the elementary equivalence of degeneracy and absence of a subgraph of larger minimum degree. It handles repeated quotient edges explicitly and does not assume that identifying arbitrary vertices preserves degeneracy. All contractions are of independent sets. The proof of the minimal-counterexample result uses vertex minimality for both sides and quotients; it does not assume a coloring extension theorem. No numerical cases count as solutions.

**Remaining gap:** 3-connected critical graphs whose separator color constraints do not force monochromaticity, including those with larger connectivity. The theorem supplies structural progress, not a full resolution of Tarsi's conjecture. No Lean verification or external review is claimed.
