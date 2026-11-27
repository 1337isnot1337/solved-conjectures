# Henning–Joos–Löwenstein–Sasse induced cycles conjecture

**Status: open.** [Conjecture 1 of *Induced Cycles in Graphs*](https://arxiv.org/pdf/1406.0606) asks whether every finite simple cubic graph $G$ has an induced 2-regular subgraph on at least $|V(G)|/2$ vertices. This is not the separate computational-complexity conjecture. [Henning–Joos–Löwenstein–Rautenbach](https://arxiv.org/abs/1406.2438) give restricted lower bounds. [Erveš–Tepeh](https://www.sciencedirect.com/science/article/pii/S0096300325004266) study a possible link to domination. [Knor–Sedlar–Škrekovski](https://arxiv.org/abs/2608.17851) refute two domination conjectures but do not settle this one. Follow-up searches used the author names, “induced cycles vertex number,” “induced 2-regular,” and the $n/2$ bound, separately screening for proof and counterexample. Repository claim: [#933](https://github.com/1337isnot1337/solved-conjectures/issues/933).

## The bridge part is exactly a one-terminal inequality

Call $H$ a one-terminal graph if it is finite, connected, simple, and cubic except at a specified vertex $x$ of degree two. Define $a(H)$ to be the largest size of an induced 2-regular vertex set avoiding $x$, and $m(H)=c_{\rm ind}(H)$ with no restriction. Include the empty set for the calculation of these maxima.

Let $G$ have a bridge with connected sides $H,K$, rooted at the former endpoints. Every induced 2-regular set is a union of cycles, so it cannot include both bridge endpoints: the induced subgraph would use the bridge. Conversely a feasible set in each side combines to a feasible set of $G$ if at least one of the two endpoints is unselected. Therefore
```math
c_{\rm ind}(G)=\max\{a(H)+m(K),\ m(H)+a(K)\}.
```
In particular, the double $D(H)$, made with two copies of $H$ and a single edge joining their roots, satisfies $c_{\rm ind}(D(H))=a(H)+m(H)$. The bridge-containing connected case of the conjecture is equivalent to the one-terminal inequality $a(H)+m(H)\ge |V(H)|$ for all one-terminal $H$. Necessity follows by doubling. For sufficiency, average the two choices of direction in the formula for a given bridge. More explicitly,
```math
2c_{\rm ind}(G)-|V(G)|
\ \ge\ (a(H)+m(H)-|V(H)|)+(a(K)+m(K)-|V(K)|).
```
Hence every bridge in a connected counterexample has a side whose double is also a counterexample. This does not rule out bridgeless counterexamples or prove the rooted inequality.

## Exact test of the original extremal mechanism

Consider a ring of $k\ge3$ square blocks. Block $i$ has two left ports and two right ports, and all four left-to-right internal edges. Join the right ports of $i$ to the left ports of $i+1$ by any perfect matching, cyclically. This is a cubic graph on $4k$ vertices. For $k=3$ this is Figure 6 of the original paper: the figure's two hexagons and the six joining edges give three such blocks. Its optimum has the following exact extension to the entire family:
```math
c_{\rm ind}(G_k)=6\lfloor k/2\rfloor.
```

To see this, an occupied block must occupy both sides: a selected port with no internal neighbor has degree at most one. Its selected left/right counts must be one of $(1,1),(1,2),(2,1),(2,2)$. In a $(1,1)$ block, both selected ports require their outside edge, and each adjacent block must likewise have exactly one selected port on the shared side (the unused port's outside edge is incident with an unselected vertex, and a two-port side requiring outside edges cannot continue through it). More explicitly, an adjacent block with two ports on that side has either one internal neighbor per port, in which case both outside edges are required, or two internal neighbors per port, in which case neither is allowed. Neither can have precisely one outside edge. When the adjacent block has a single port on the shared side and two on the other, its single port already has degree two internally and cannot use the required link. The $(1,1)$ state therefore propagates around the entire ring and gives $2k$ selected vertices.

Otherwise, $(2,2)$ is a full square and both neighboring blocks must be empty. A $(1,2)$ block requires both external edges on the right and none on the left; its right neighbor must be $(2,1)$, and vice versa. This forms a six-vertex cycle occupying two adjacent blocks. If there are $s$ squares and $h$ such pairs, the number of empty blocks is at least $s$: assign each full square its following block, which is empty, and these assignments are distinct. Hence $2s+2h\le k$ and the total $4s+6h\le 6\lfloor k/2\rfloor$. This also bounds $2k$ for $k\ge3$.

For equality, arrange $\lfloor k/2\rfloor$ successive pairs of blocks as six-cycles, leaving one empty block when $k$ is odd. Each pair has an exposed singleton at each end, selectable independently because its blocks are complete bipartite internally. Across a boundary between two selected pairs, choose the two exposed singletons not to be matched. This is possible independently at each boundary. The resulting set therefore induces exactly the required disjoint six-cycles. The original 12-vertex example is tight, but this particular enlargement does not produce larger connected tight examples or counterexamples.
