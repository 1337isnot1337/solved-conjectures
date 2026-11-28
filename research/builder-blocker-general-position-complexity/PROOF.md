# Builder–Blocker general position complexity conjecture

**Theorem.** Both cardinality-threshold decision problems of the Builder–Blocker general position game are PSPACE-complete, even on graphs of diameter two. This proves [Klavžar, Tian and Tuite, published Conjecture 11](https://oro.open.ac.uk/99072/38/99072final.pdf), also Conjecture 5.5 of [arXiv:2310.19949v2](https://arxiv.org/abs/2310.19949v2). Both games start with the empty set. Builder wants the final set large and Blocker wants it small; the only difference between the games is which player starts.

Let $g_{\mathrm B}(G)$ and $g_{\mathrm B'}(G)$ denote the respective minimax final sizes. The decision problems ask whether the designated value is at least a given threshold. In a graph of diameter at most two a triple is not in general position exactly when it induces a two-edge path. We will use this elementary equivalence for all host graphs in the reductions.

## The source game and starter conventions

Use the optimization version of Node Kayles: Max and Min alternately choose vertices, preserving independence in a graph $H$, until there is no legal move. Their objective is the final size, not the parity of the last move. Write $I_{\max}(H)$ and $I_{\min}(H)$ for its value with the indicated starter. [Brosse, Martins, Nisse and Sampaio, *The Convex Set Forming Game*](https://doi.org/10.1016/j.tcs.2025.115323) prove PSPACE-completeness of the Max-start version. The Min-start hardness is also explicitly in [Araújo, Benevides, Martins, Nisse and Sampaio, FUN 2026, Theorem 3](https://drops.dagstuhl.de/storage/00lipics/lipics-vol366-fun2026/html/LIPIcs.FUN.2026.4/LIPIcs.FUN.2026.4.html); the elementary transfer needed here is as follows.

To make Min start, take the disjoint union of a Max-start instance $H$ with a star with $L>|V(H)|+1$ leaves. If Min first chooses the center the leaves cannot be selected, so the value of that branch is $1+I_{\max}(H)$. If Min first chooses a leaf, all leaves are eventually selected. If Min first chooses in $H$, Max can immediately choose a leaf and force the same outcome of at least $L$ moves. These branches are worse for Min. Thus the Min-start value is $1+I_{\max}(H)$. This preserves PSPACE-hardness using a threshold increase of one.

We may require that a Min-start instance have no isolated vertices. Replace each isolated vertex with a separate edge. The two endpoints of such an edge are interchangeable, and selecting either consumes exactly one unrestricted move and makes the other unavailable. This is exactly the same game as selecting the original isolated vertex, for either starter.

We will also use that adding an even number of unrestricted, mutually compatible one-use moves to an optimization Node Kayles position does not change the value except for adding their number. Either player can enforce their corresponding old bound by playing their old strategy on ordinary moves and replying to each opponent unrestricted move with another unrestricted move. The unrestricted choices always occur in pairs until the old position ends. If the old position ends, every unused unrestricted move is eventually taken; the final offset is fixed. Both the upper and lower minimax bounds follow.

## Builder starts

Take a nonempty Min-start source graph $H$ without isolates. Let $M>|V(H)|$ be odd and form $G=K_M\vee\overline H$, the join of a new clique of $M$ universal vertices with the complement of $H$. It has diameter two.

If Builder opens in $\overline H$ at $x$, Blocker can answer with a neighbor $y$ of $x$ in $H$. The pair is legal, since any two vertices are in general position. They are nonadjacent in $G$, so every universal vertex would be between them on a shortest two-edge path. All universal vertices are barred forever. The final size on that response is at most $|V(H)|$.

If Builder opens at a universal vertex, the remaining legal general-position sets are exactly the cliques that contain it: any nonedge among the original vertices would make a forbidden triple with the opening universal vertex, and every clique is in general position. Thus original choices form an independent set of $H$, with Blocker moving first in this residual game. The remaining $M-1$ universal vertices are an even number of unrestricted moves. By the paired-response observation, the final value of this branch is $M+I_{\min}(H)$. This exceeds the value Builder can guarantee by opening anywhere else. Therefore
```math
g_{\mathrm B}(K_M\vee\overline H)=M+I_{\min}(H).
```
Increase the source threshold by $M$.

## Blocker starts

Take a nonempty Max-start source graph $H$. Form $G$ by taking an original copy of $\overline H$, $M>|V(H)|+1$ independent new leaves, and a single vertex $u$ adjacent to all original vertices and all leaves. There are no edges between the leaves and any original vertex. This graph also has diameter two.

If Blocker starts at $u$, Builder can play an original vertex. Thereafter the leaves are forbidden: a leaf and an original vertex are nonadjacent and $u$ is between them. The residual original choices are precisely an independent-set game on $H$, with Builder the first original player. This gives final size $1+I_{\max}(H)$. Builder's alternative of taking a leaf on the second move ends the game at size two, since that leaf has no neighbor but $u$. The alternative cannot improve the value because $H$ is nonempty.

If Blocker opens at an original vertex, Builder takes any leaf. If Blocker opens at a leaf, Builder takes an original vertex. Either way the pair bars $u$. When $u$ is absent, every unselected leaf is a legal move at any current general-position set: its distance to each selected vertex is two, and the distance between the other two vertices of any triple is at least one and at most two. Thus the process cannot end before all $M$ leaves are selected. This exceeds $1+I_{\max}(H)$, so Blocker optimally opens at $u$. We have
```math
g_{\mathrm B'}(G)=1+I_{\max}(H).
```
Increase the source threshold by one.

## Membership and scope

Both constructions are polynomial in the source size. Membership in PSPACE follows by a depth-first minimax search: there are at most $|V(G)|$ moves, legality is decided by the shortest-path distance equalities on triples, and the search need only store a polynomial-size recursion stack. Thus both variants are PSPACE-complete. If the decision convention instead asks for a bound in Blocker's direction, use PSPACE closure under complement and shift the threshold by one.

The prior PSPACE result for [general-position achievement and avoidance](https://doi.org/10.1016/j.tcs.2023.114370) concerns last-move parity, not the score games. The constructions above give exact final sizes, including the starters' alternative opening moves; simply connecting a universal anchor without controlling the opening would not prove the claim. Coordination: [#916](https://github.com/1337isnot1337/solved-conjectures/issues/916).
