# Lambie-Hanson and Uhrik’s regressive Hajnal–Máté problem

Research for [#1080](https://github.com/1337isnot1337/solved-conjectures/issues/1080). The exact question is [Lambie-Hanson–Uhrik, Mathematika (2024), Question 6.3](https://doi.org/10.1112/mtk.12261): if an HM graph exists, must a regressive HM graph exist? In this note, a coloring is **regressive** if it is regressive on the nonzero limit ordinals in its domain. A regressive HM graph, in the terminology of the question, is one that has **no** such proper coloring.

## Earlier-clique obstruction

**Proposition 1.** Let $G$ be a graph on $A\subseteq\omega_1$. If, for each nonzero limit $\alpha\in A$, the earlier neighborhood $N_G^-(\alpha)\cap A$ contains no infinite clique, then $G$ has a proper regressive coloring.

For each such $\alpha$, start with $F_\alpha$ empty. As long as possible, add an earlier neighbor of $\alpha$ in $A$ that is adjacent to every member of $F_\alpha$, for example the least available one. This terminates in finitely many steps because otherwise the inserted vertices form an infinite clique in the earlier neighborhood. The resulting $F_\alpha$ is a maximal finite clique in that neighborhood. If $\alpha<\beta$ are adjacent limit vertices with $F_\alpha=F_\beta=F$, then $\alpha$ is adjacent to $\beta$ and to every member of $F$. It is not in $F$, and could be added to $F_\beta$, a contradiction.

To make the finite code genuinely regressive at **every** nonzero limit: partition $\omega_1$ into the ordinal intervals $[\omega\eta,\omega(\eta+1))$. There are only countably many nonempty finite subsets of $\omega_1$ with maximum in any fixed such interval. Injectively code them by the positive even offsets in that same interval, and give the empty set code 0. The code of a finite subset of a nonzero limit $\alpha$ is below $\alpha$, since the entire interval of its maximum is below $\alpha$. Use the remaining odd offsets for pairwise distinct colors at nonlimit vertices.

In particular no triangle-free graph, and more generally no graph omitting an increasing clique of order type $\omega+1$, is a regressive HM graph. The order type here is essential: a countably infinite clique of order type $\omega$ need not give any vertex infinitely many earlier clique neighbors.

## Club and stationary strengthening for HM graphs

For an HM graph, deleting the complement of a club cannot turn a graph with no proper regressive coloring into one with such a coloring. To see this, note that every nonstationary set $B$ induces a countably chromatic graph. Choose a club $D$ disjoint from $B$ and use its consecutive intervals (including the initial interval before $\min D$) in increasing order. For each vertex in $B$ in one interval, there are finitely many neighbors in the earlier intervals by HM sparseness. Within the current countable interval, assign pairwise distinct natural numbers, avoiding for each vertex the finitely many earlier-neighbor colors. Combine this countable coloring with a given proper regressive coloring on the club using two disjoint palettes. The same interval coding works for finite tuples of ordinals, so both the palette tag and the local color can be made into one color below every nonzero limit vertex; use the remaining palette for nonlimits.

**Corollary.** For every club $D$, if $G$ is a regressive HM graph, the set of $\alpha\in D$ which are apices of increasing $\omega+1$-cliques in $G[D]$ is stationary. Otherwise restrict to the intersection of $D$ with a club avoiding the apices and apply Proposition 1, then extend over its complement. For each such clique, the sequence below its apex is cofinal in the apex: an infinite bounded earlier neighborhood is impossible in an HM graph.

## A transfinite rank reduction

**Proposition 2.** For an arbitrary graph $G$ on $\omega_1$, define $r(\alpha)$ recursively as the least $\xi\le\alpha$ such that there is no infinite clique among the neighbors $\beta<\alpha$ of $\alpha$ with $r(\beta)\ge\xi$. This is well-defined: by induction $r(\beta)\le\beta$ for all earlier $\beta$, so $\xi=\alpha$ is always eligible. Set
$$S=\{\alpha<\omega_1:r(\alpha)=\alpha\}.$$
Then $G$ has a proper regressive coloring if and only if $G[S]$ does. In particular for an HM graph with no proper regressive coloring, $S$ must be stationary.

Fix a rank level $A_\xi=\{\alpha:r(\alpha)=\xi\}$. Every earlier neighborhood within $A_\xi$ has no infinite clique by the definition of rank. Apply the finite anchor construction within the level. For a nonzero limit vertex $\alpha\notin S$, encode the rank $r(\alpha)$ and the finite anchor together, with a tag if needed. These are all strictly below $\alpha$, so the tuple can be coded below $\alpha$ via the ordinal intervals above. Equal codes imply equal rank and equal anchors and therefore nonadjacency. On $S$ use the assumed regressive coloring of $G[S]$, encoded with a distinct tag; as before nonlimit vertices get pairwise distinct colors from a separate palette. This proves the reverse implication; the forward one is restriction. The final assertion follows from the countable coloring of nonstationary sets for HM graphs.

Equivalently $r(\alpha)$ is the stage at which $\alpha$ is peeled when one repeatedly removes vertices with no infinite clique among earlier remaining neighbors, and takes intersections at limit stages. The rank uses only the well-founded ordinal orientation, not any choice of a coloring. For every $\alpha\in S$ and each $\xi<\alpha$, an earlier infinite clique incident to $\alpha$ survives through rank $\xi$. For an HM graph all these cliques are cofinal below $\alpha$.

## Scope and prior art

The lower-neighbor condition defining HM and the existence question are from the source paper. The older [Komjáth–Shelah construction](https://shelah.logic.at/files/95727/303.pdf) involves regressive auxiliary functions but is not the same vertex-coloring question. [Lambie-Hanson–Soukup](https://arxiv.org/abs/2002.02480) use regressivity for colors of pairs, also a distinct notion. The recently posted [simultaneous chromatic number manuscript](https://hexagonmath.org/pdf/2611.00585v1) uses graphs with no stationary independent set, a sufficient condition against regressive vertex colorings. This note does not assert novelty for the basic finite anchor trick; the rank and stationary localizations are worked out independently. Neither proposition proves the implication in Question 6.3; in particular a stationary $S$ does not by itself prove that $G[S]$ is regressively uncolorable.
