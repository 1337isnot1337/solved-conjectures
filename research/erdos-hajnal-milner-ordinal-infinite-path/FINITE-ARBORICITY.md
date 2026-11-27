# Erdős–Hajnal–Milner’s ordinal infinite-path problem

Research record for [Erdős #601](https://www.erdosproblems.com/601) and issue #1084. This proves a structural sufficient condition at **every limit ordinal**, and gives a warning about clean-column reductions. It does not classify the ordinals for unrestricted rayless graphs.

## Finite arboricity

**Theorem.** Let \(G\) be a graph with any nonzero limit ordinal \(\alpha\) as its vertex order. If some integer \(k\) bounds \(|E(G[X])|/|X|\) over nonempty finite vertex sets \(X\), then \(G\) has an independent subset of order type \(\alpha\). The graph may contain a ray.

First consider a bipartite graph with sides \(U,W\) in which every vertex of \(W\) has at most \(d\) neighbors. Write \(\alpha\) in Cantor normal form, expanding finite coefficients into repeated terms. This gives finitely many consecutive blocks \(B_i\) of types \(\omega^{\beta_i}\). Each \(\beta_i>0\) because \(\alpha\) is a limit ordinal. Each such ordinal is indivisible for finite partitions: a finite union of subsets of strictly smaller type still has smaller type (bound the union by the natural sum of the types). Designate one of \(B_i\cap U\) and \(B_i\cap W\) of full block type.

Let \(b\) be the number of \(W\)-designated blocks. Take \(bd+1\) disjoint sets \(S_t\subseteq U\), each full in every \(U\)-designated block. In each such block this is possible by decomposing its chosen \(U\)-side into consecutive pieces of order type \(\omega\), and splitting each piece into \(bd+1\) infinite sets. The case with no \(U\)-designated blocks is immediate.

In a \(W\)-designated block, at most \(d\) values of \(t\) make
\[
 (B_i\cap W)\setminus N(S_t)
\]
shorter than \(B_i\). Otherwise take \(d+1\) such values. Each vertex of \(B_i\cap W\) lies in at least one of the residual sets, since its at most \(d\) neighbors cannot reach all \(d+1\) disjoint \(S_t\). This contradicts finite indivisibility. Thus some \(t\) has full residuals in all the \(W\)-blocks. Taking those residuals and \(S_t\) gives the required independent set.

In particular the conclusion holds for star forests. An arbitrary forest splits into two star forests: root each component and group the edges by parity of the parent's depth. The conclusion survives finite unions, by removing the edge classes one at a time on the full-order-type subset from the previous step.

To see that the numerical hypothesis suffices, assign each edge to an endpoint with at most \(k\) assignments at each vertex. On finite edge sets, this follows from Hall's theorem with \(k\) copies of each endpoint; the assumed edge bound for induced subgraphs also bounds every collection of edges by \(k\) times the size of its endpoint set. Compactness gives a global assignment. Orient each edge away from the assigned endpoint, label the outgoing edges at each vertex by distinct labels below \(k\), and split into the label classes. Each label class has outdegree at most one, so each undirected connected component has at most one cycle: two different cycles with a finite connecting path would give a finite subgraph with more edges than vertices. Deleting one edge per cyclic component leaves a forest, with the deleted edges forming a matching. This proves the theorem.

In particular, a set mapping on a limit ordinal with a uniform finite cardinality bound on its images always has a free subset of full order type: the conflict graph is the union of the pairs \(xy\) with \(y\in f(x)\) or \(x\in f(y)\), and satisfies the finite density bound. This does not say the same thing for pointwise finite images of unbounded sizes.

The limit-ordinal assumption cannot just be dropped. At a successor ordinal of infinite size, put the last vertex at the center of a star through all earlier vertices.

## A clean-column obstruction

Take a column \(B_*=\{x_n:n<\omega\}\). For each infinite \(S\subseteq\omega\) take a disjoint column
\[
 B_S=\{y_{S,n}:n\in S\},
\]
with one edge \(x_ny_{S,n}\) for each \(n\in S\) and no other edges. Give each column order type \(\omega\) and arrange the columns consecutively, with \(B_*\) first. This is a rayless star forest with continuum many columns. Each vertex has at most one neighbor in any given column (all kernels are empty in the clean-column normal form).

If an independent set meets \(B_*\) infinitely, write \(S=\{n:x_n \text{ belongs to that set}\}\). It then misses the entire column \(B_S\). Thus even a clean star forest need not allow an independent set meeting *each* column infinitely often. It still has a full-order-type independent set by the theorem, so this is not a negative example for Erdős #601.

## Literature and scope

- [Erdős–Hajnal–Milner, Set mappings and polarized partition relations (1970)](https://users.renyi.hu/~p_erdos/1970-19.pdf), Theorems 3, 5, and 7: pointwise finite mapping results and obstructions, and the unrestricted rayless positive range below \(\omega_1^{\omega+2}\).
- [Erdős, Problems and results on finite and infinite graphs (1975)](https://users.renyi.hu/~p_erdos/1975-33.pdf): historical universal conjecture. That universal formulation is no longer open, because of the following diamond counterexamples.
- [Baumgartner–Larson (1990)](https://doi.org/10.1016/0168-0072(90)90013-R): counterexamples under Jensen's diamond in the first unresolved uncountable range below \(\omega_2\). The distinction between that result and a ZFC classification matters.
- [Larson (1990)](https://doi.org/10.1016/0168-0072(90)90015-T): positive for limit ordinals below the continuum under Martin's axiom.
- [Garti, Tiltan and graphs with no infinite paths](https://arxiv.org/abs/2302.09492): a later related result on a different order; not a classification of the ordinal problem.
- [Working report on #601](https://erdosproblemaday.com/report/601), §3: finite-kernel reduction and clean columns. The obstruction above targets the auxiliary demand of retaining every clean column, not the normal form.
- Comparison: [Erdős–Hajnal–Milner, Polarized partition relations for ordinal numbers (1971)](https://users.renyi.hu/~p_erdos/1971-17.pdf), Lemmas 6–7, uses forest decomposition and four-cycle avoidance for a different polarized conclusion. Searches by the exact problem, the older papers' titles and forest/free-set terms did not locate this all-ordinal finite-density argument in those sources; no priority claim is made.
