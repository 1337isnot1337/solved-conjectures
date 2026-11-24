# Hajós’ cycle decomposition conjecture

**Status** · Open. This note proves a four-edge-cut reduction. The general conjecture remains open. [Issue #501](https://github.com/1337isnot1337/solved-conjectures/issues/501)

## Target and sources

Every nonempty finite simple even graph on $n$ vertices should admit an edge partition into at most $\lfloor(n-1)/2\rfloor$ simple cycles. Here even means every vertex has even degree. The connected and disconnected formulations are equivalent by taking the union of the component decompositions, since the sum of the component budgets is at most the budget of the full graph.

Lovász recorded Hajós’ original bound $\lfloor n/2\rfloor$ in *On covering of graphs* (1968), pp. 231–236. The equivalence with the sharp formulation is due to Dean. In the only differing case, a counterexample at order $2k$ to the sharp bound would require at least $k$ cycles. Identify one vertex in two disjoint copies. Every simple cycle lies in one copy, so the resulting graph on $4k-1$ vertices would require at least $2k$ cycles and violate the original bound. [Lovász](https://www.researchgate.net/publication/268652766_On_covering_of_graphs), [Dean](https://doi.org/10.1002/jgt.3190100307), [Fuchs, Gellert and Heinrich, §1](https://doi.org/10.1002/jgt.22516)

Fan and Xu proved the projective-planar and $K_6^-$-minor-free cases and developed a reduction for a weighted multigraph formulation. Xu proved a connectivity restriction for counterexamples minimal under those reductions. Kim’s October 2026 preprint on Erdős–Gallai yields $O(n)$ cycles for these graphs. Searches on 2026-11-24 for the sharp bound, minimum counterexamples, and four-edge cuts found no full resolution or earlier proof of the reduction below. Priority remains provisional. [Fan and Xu](https://doi.org/10.1016/S0012-365X(01)00290-4), [Xu](https://sysmath.cjoe.ac.cn/jssc/CN/lexeme/showArticleByLexeme.do?articleID=44766), [Kim, v2](https://arxiv.org/abs/2610.07840v2)

## Four-edge-cut reduction

For a loopless multigraph $H$, let $m(H)$ be the sum of $k-1$ over its unordered vertex pairs of positive edge multiplicity $k$. Define $w(H)=|V(H)|+m(H)$ and $f(r)=\lfloor(r-1)/2\rfloor$. A cycle has distinct vertices apart from closure and may have length two when it uses two different parallel edges. Subdividing all but one edge of each parallel class gives a simple graph of order $w(H)$ with the same minimum cycle count. Every cycle survives subdivision, and every cycle of the simple graph uses both edges at each subdivision vertex it visits and suppresses back to a cycle. Thus the generalized bound $f(w(H))$ is equivalent to the simple conjecture. This equivalence is part of the Fan–Xu framework. [Fuchs, Gellert and Heinrich, Observation 20](https://doi.org/10.1002/jgt.22516)

**Theorem.** Let $G$ be an even loopless multigraph. Assume that every nonempty even loopless multigraph of weight strictly less than $w(G)$ satisfies the generalized bound. If a cut of size four has at least three distinct endpoints on each side, then $G$ satisfies the bound.

Write $X,Y$ for the subgraphs induced by the two sides, and $w_X,w_Y$ for their weights. Both weights are at least three and $w(G)\ge w_X+w_Y$. Label the four cut edges $1,2,3,4$. On a given side each label designates its endpoint there. The four labels represent either four distinct vertices or three distinct vertices with one repeated. Let $b_i=\lfloor w_i/2\rfloor$ for $i=X,Y$ and let $\epsilon_X$ be one for odd $w_X$ and zero for even $w_X$. The parity identity for $f(w_X+w_Y)$ gives

```math
b_X+\epsilon_X+b_Y-1\le f(w_X+w_Y),\qquad
b_X+f(w_Y)\le f(w_X+w_Y).
```

**Splicing.** A pairing of the four labels on a side can be realized by two edge-disjoint simple paths, allowing a path of length zero when its endpoints designate the same vertex. The other edges on that side will already be partitioned into cycles. If both sides realize the same pairing, join corresponding paths by their two cut edges to get two cycles. Each uses just one path per side, so the two paths on one side may meet without introducing a repetition within either cycle. The two new cycles partition the path edges and the cut. If the pairings differ and the two paths are vertex-disjoint on each side, the union of the two pairings is a four-cycle on the labels. Joining along all four cut edges gives one cycle, simple because the paths on each side are vertex-disjoint. A length-zero path contributes its vertex just once to this cycle.

**A first pairing on $X$.** Add a new vertex adjacent by one edge to the endpoint of each label. The result is even, and its weight is at most $w_X+2$ because there is at most one repeated endpoint. This is smaller than $w(G)$. There is a decomposition with at most $f(w_X+2)=b_X+\epsilon_X$ cycles. Exactly two cycles use the new vertex, since it has degree four and any cycle through it uses two incident edges. Cut out that vertex and its edges in those cycles. The two residual paths on $X$ specify a pairing $P$. A cycle of length two at the new vertex yields the length-zero path at the repeated endpoint.

**Try $P$ on $Y$.** For each pair with distinct endpoints we need to toggle parity at its ends. The nontrivial pairs have distinct unordered endpoint pairs. At least one pair is nontrivial since there are at least three endpoint vertices.

- If some nontrivial pair is a nonedge, add an artificial edge for each such pair and remove and reserve one real edge for each remaining nontrivial pair.
- If every nontrivial pair is already adjacent, add one artificial parallel edge for one of them and remove and reserve one real edge for each other nontrivial pair.
- A pair at a repeated vertex requires no change and gives a length-zero path.

These operations make $Y$ even since their parity changes cancel the cut incidences. The weight is at most $w_Y+1$, so a decomposition exists with at most $f(w_Y+1)=b_Y$ cycles. There is at least one artificial edge. If the artificial edges lie in distinct cycles, cut them out to obtain the corresponding paths and use the reserved original edges as the other nontrivial paths. This realizes $P$. The splice uses at most $b_X+\epsilon_X+b_Y-1$ cycles, since it consumes two cycles on $X$ and at least one on $Y$ and introduces two.

Otherwise there are two artificial edges in a single cycle. This can occur only in the first construction with both desired edges absent, so the weight was $w_Y$ and at most $f(w_Y)-1$ cycles remain after removing that cycle. Deleting its two artificial edges gives two vertex-disjoint paths with a pairing $Q$ different from $P$. For disjoint artificial edges these are the two complementary segments of a simple cycle. For incident artificial edges the common vertex is a length-zero path and the rest of the cycle connects the other two endpoints while avoiding that vertex.

**Try $Q$ on $X$.** Start afresh on $X$. For every nontrivial pair of $Q$ add an artificial edge, permitting a parallel edge when necessary. This even completion has strictly smaller weight than $G$ because it adds weight at most two. There are three possibilities.

- With one artificial edge the weight is at most $w_X+1$, so there are at most $b_X$ cycles. Remove the cycle containing that edge and recover the path and the length-zero path. Use the same-pairing splice. The total is at most $(b_X-1)+(f(w_Y)-1)+2=b_X+f(w_Y)$.
- With two artificial edges in separate cycles there are at most $b_X+\epsilon_X$ cycles before removing the two cycles to recover the paths. Use the same-pairing splice. The total is at most $(b_X+\epsilon_X-2)+(f(w_Y)-1)+2$.
- With two artificial edges in one cycle, cut out both edges. The two paths on $X$ are vertex-disjoint and realize a different pairing from $Q$. Use the distinct-pairing splice. The total is at most $(b_X+\epsilon_X-1)+(f(w_Y)-1)+1$.

Both of the last two totals are at most $b_X+\epsilon_X+b_Y-1$. Every splice partitions all the original edges with the cycles kept on both sides. All totals are within $f(w(G))$, proving the theorem.

## Consequence for a minimum counterexample

**Corollary.** If Hajós’ conjecture fails, take a counterexample to the generalized bound minimizing $(w(G),|E(G)|)$ lexicographically. Every cut with at least two vertices on each side in this $G$ has size at least six. A cut of size four, if present, isolates the unique possible degree-four vertex. The graph is 6-edge-connected if it has a parallel pair or if its weight is odd.

The ordinary cycle deletion, isolated vertex deletion, degree-two suppression and degree-four splitting reductions of Fan and Xu strictly decrease the lexicographic rank. The first two cannot increase weight and reduce the edge count or vertex count, respectively. A suppression loses one vertex, adds at most one excess parallel edge, and decreases the edge count. A degree-four split at four distinct neighbors loses a vertex, adds at most one excess parallel edge by the hypothesis on the split, and loses two edges. Thus every proper reduction satisfies the generalized bound. Xu’s connectivity theorem makes $G$ 3-vertex-connected. Fan and Xu’s reduction theorem gives $m(G)$ plus the number of vertices of degree less than six at most one, since any strictly smaller reduction satisfies the bound. [Xu, journal record](https://sysmath.cjoe.ac.cn/jssc/CN/lexeme/showArticleByLexeme.do?articleID=44766), [Lai and Liu, Theorems 3.4 and 3.7](https://archive.ymsc.tsinghua.edu.cn/pacm_download/168/4692-cycle.pdf), [Fan and Xu](https://doi.org/10.1016/S0012-365X(01)00290-4), [Fuchs, Gellert and Heinrich, Theorem 21](https://doi.org/10.1002/jgt.22516)

All cut sizes are even and 3-vertex-connectivity implies edge-connectivity at least three. For a four-edge cut with both sides of size at least two, a side of size two has internal multiplicity at most two because $m(G)\le1$. Its two degrees then sum to at most $2\cdot 2+4=8$. Both degrees are even and at least four, so both would be four, contrary to the degree restriction. Each side therefore has size at least three. At most two cut endpoint vertices on a side could then be deleted to disconnect the rest of that side from the other side, contradicting 3-vertex-connectivity. The theorem applies and gives the contradiction.

If a parallel pair is present, the Fan–Xu bound excludes degree four. If $w(G)$ is odd and $G$ is simple, its order is odd. In this case Lemma 9 of Fuchs, Gellert and Heinrich excludes degree four by vertex minimality among simple graphs. Every auxiliary graph required by that lemma has one fewer vertex and is even. These observations give the last claim. [Fuchs, Gellert and Heinrich, Lemma 9](https://doi.org/10.1002/jgt.22516)

## Audit and scope

The proof works with edge identities, so an artificial parallel edge and its original counterpart are distinguishable. Paths from one side may have other boundary endpoints as internal vertices. The same-pairing splice uses one path from each side per cycle and tolerates this. The distinct-pairing splice uses both paths on each side and depends on the stronger vertex-disjointness given by cutting two edges from a single simple cycle.

Run `python3 research/hajos-cycle-decomposition/verify.py` from the repository root to replay two exact edge partitions. One exercises the distinct-pairing splice with a repeated endpoint on both sides. The other exercises the same-pairing splice and a parallel artificial edge when both weights are odd and the cycle bound is attained by the construction. The script checks these examples and the parity inequalities. The proof above supplies the unbounded result.

This is AI-assisted research with a direct proof and exact controls. The reduction leaves the high-connectivity case open. Independent review and priority for the four-edge-cut argument are pending.
