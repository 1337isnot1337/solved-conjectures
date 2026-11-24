# Two-part residual elementary positivity for circular indifference digraphs

**Partial result.** Suppose $G$ is a circular indifference digraph with independence number $D\ge2$. Let $r\ge0$, $1\le k\le2$, and $p\ge k$. The elementary coefficient of
$$
\lambda=(r+p,r+k,r,\ldots,r)
$$
is nonnegative as a polynomial in $q$, where the displayed vector has $D$ entries and any trailing zeros are omitted. The same proof works for the hereditary orientation class in Ellzey’s Theorem 5.5. This adds a family of elementary coefficients at every independence number, but does not prove elementary unimodality or general elementary positivity.

## Reduction

Use the [circular quantum-torus identity](quantum-torus-reduction.md)
$$
[e_\lambda]X_G(x;v^2)=v^{\#\mathrm{arcs}(G)}[X_V]m_\lambda(Y).
$$
Here $X_S$ denotes the torus monomial supported on $S$ with exponent 1 at each member. The commuting elementary values $e_i(Y)=E_i$ are nonnegative Laurent sums over independent sets, and $Y$ is a formal alphabet of $D$ variables. Therefore
$$
m_\lambda(Y)=E_D^r m_{(p,k)}(Y),\qquad
m_{(p,k)}(Y)=\frac{p_p(Y)p_k(Y)-p_{p+k}(Y)}{1+[p=k]}.
$$
Only squarefree coefficients of the residual factor can contribute at $X_V$. It suffices to prove they are nonnegative for all supports $S$ of size $p+k$.

For a support $S$ and one-sink acyclic orientation $O$ of the underlying graph of $G[S]$, write $w(O)$ for the number of directed arcs of $G[S]$ agreeing with $O$. In the identity of [Ellzey, Corollary 6.6](https://arxiv.org/abs/1709.00454), the coefficient $v^{\#\mathrm{arcs}(G[S])}[X_S]p_{|S|}(Y)$ counts such orientations with weight $q^{w(O)}$. More generally $v^{\#\mathrm{arcs}(G[S])}[X_S]p_k(Y)p_p(Y)$ counts a size-$k$ first block and a size-$p$ second block partitioning $S$, each equipped with a one-sink acyclic orientation of its induced graph. Direct every edge across the blocks from first to second to obtain an acyclic orientation $O'$ of the full underlying graph; the weight of the ordered pair is $q^{w(O')}$. This follows by adding the torus cross-block skew exponent to the two within-block weights. Power sums commute in the graph alphabet, so this is the desired product regardless of the order of $p$ and $k$.

The only structural properties used below are that the underlying graph is claw-free and that a three-vertex induced path gives two consistently directed single arcs in $G$ (one enters, one leaves the middle). In Ellzey's hereditary class these follow from Lemma 5.4 (and Lemma 5.6 puts circular indifference digraphs in the class): the induced graph on the two independent color classes must be a union of directed paths and even cycles. This also handles possible bidirected edges elsewhere. In particular, it rules out both a claw, which has degree three in a two-colored component, and bidirected edges in a three-vertex path component.

## Weight-preserving injections

Fix a total order on the vertices for every choice below. For $k=1$, remove the first source of $O$ as the first block. Removing a source leaves the unique original sink: an edge leading to the source from a remaining vertex is impossible. When $|S|\ge2$ the source cannot itself be the unique sink. The original orientation is recovered by orienting every cross edge out of the singleton, without changing any edge relative to $O$.

For $k=2$ assume $p\ge2$. A two-vertex source ideal is a pair with an edge and no incoming edges from the complement. Its two vertices have a one-sink orientation. Equivalently it consists of a source $c$ and a vertex $a$ whose only immediate predecessor is $c$; immediate predecessors here mean incoming neighbors, not covers after transitive closure. If $O$ has such a pair, use the lexicographically first as the first block. Since the pair has only one outgoing direction across its boundary, its removal does not delete any outgoing edges from the complement. The original unique sink lies in the complement: a nonempty complement would otherwise contradict reachability to the sink. The pair and the two restricted orientations recover $O$ unchanged. Call this the direct image.

Now suppose $O$ has no two-vertex source ideal. Choose the first vertex $c$ minimal among nonsources in the reachability order. Every incoming neighbor is a source. There are at least two such neighbors (one would give a source ideal of size two), and at most two (three sources are pairwise nonadjacent and would induce a claw with $c$). Name the two neighbors $a,b$. Switch the directions of $a\to c$ and $b\to c$ to point from $c$ to $a,b$, obtaining $O'$. The new edges originate at the new source $c$, so no directed cycle is created. In the input digraph $G[S]$, the induced path on $a,c,b$ is consistently directed. Thus both before and after the switch, exactly one of its two edges agrees with $G[S]$. All other agreements are unchanged, so $w(O')=w(O)$.

There is at least one outgoing edge from $c$ in $O$. Otherwise $c$ was the unique sink, and only $a,b$ can reach it, since they are its only incoming neighbors and are sources. That would force $|S|=3$, excluded here. By claw-freeness, each former outneighbor $d$ of $c$ is adjacent to at least one of $a,b$. That source already pointed to $d$ in $O$, and this is not a switched edge. Consequently:
1. At least one of $a,b$ remains a nonsink in $O'$. The only possible extra sink is the other one, if it had no outgoing edge except to $c$.
2. The only outgoing neighbors of $c$ in $O'$ whose sole incoming neighbor is $c$ are $a,b$. All former outneighbors $d$ still have another incoming edge from $a$ or $b$.
3. Both $\{c,a\}$ and $\{c,b\}$ are two-vertex source ideals of $O'$.

If an extra sink arises, choose the pair consisting of $c$ and that sink as the first block. Otherwise $O'$ has one sink, and choose the first among $\{c,a\}$ and $\{c,b\}$ that is not the direct canonical choice for $O'$. In either case the second block has one sink: after removing a source ideal, no vertex in the complement loses any outgoing edge, and just the original sink remains in the complement. The resulting block orientations and cut comprise $O'$ and have the same weight as $O$.

To check injectivity, reconstruct $O'$ by adding the forward cut edges. A direct image has global unique sink and first block equal to its direct canonical pair. Every switched image fails at least one of these conditions. In a switched image, $c$ is the source of the oriented edge in the first block. The omitted member of $\{a,b\}$ is the unique other outgoing neighbor of $c$ with sole incoming neighbor $c$, by property 2. Switch these two edges back, then recover the original orientation $O$. Thus the injection is weight-preserving and one-to-one.

The product power-sum coefficient is therefore at least the single-power-sum coefficient in each degree for $k=1,2$. Division by 2 when $p=k$ preserves nonnegativity, and yields integers because it is the monomial symmetric polynomial identity. Multiplication by $E_D^r$ preserves squarefree Laurent coefficient positivity. The original elementary coefficient is polynomial in $q=v^2$, so this proves the stated result.

## Scope and sources

[Brittney Ellzey, A directed graph generalization of chromatic quasisymmetric functions](https://arxiv.org/abs/1709.00454), Conjecture 1.4 and Section 6, is the original source for the target and the one-sink orientation formula. The torus identity is credited as in the companion note. The local move is the directed-path analogue of the chromatic fork flip of [Hwang, arXiv:2208.09857](https://arxiv.org/abs/2208.09857) for natural unit interval orders; the extra argument here is the canonical, invertible choice of a size-two first block. The proof above proposes a direct coefficientwise nonnegativity argument for the stated near-rectangular elementary coefficients, including residual partition $(p,2)$ of arbitrary size; it does not claim priority or a positive formula for arbitrary residual second part. The unrestricted direct source-ideal split fails even for some acyclic orientations of a triangle with a leaf, motivating the weight-preserving switch.
