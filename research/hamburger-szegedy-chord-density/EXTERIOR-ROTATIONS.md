# Exterior rotations on alternating paths

This note studies an asymmetric concentration step for the [Hamburger–Szegedy chord-density conjecture](https://www.erdosproblems.com/642). It preserves the full degrees of one endpoint set and of its initially exterior neighbors. It does not force the resulting support onto a cycle.

## Two kinds of rotation

Let $`G=(X,Y;E)`$ be simple and bipartite. Fix $`a\in X`$ and take a longest simple path starting at $`a`$ and ending in $`X`$. Assume it has at least one link vertex, and write it as
```math
P=x_0y_1x_1\cdots y_mx_m,\qquad x_0=a.
```
The $`x_i`$ are core vertices; the $`y_i`$ are link vertices. At moving end $`u=x_m`$ allow these two operations:

- If $`uy_i`$ is an edge, follow the old prefix to $`x_{i-1}y_i`$, go to $`u`$, and reverse the suffix of core vertices until $`x_i`$. This replaces the link incidence at $`x_i`$ but keeps $`y_i`$. When $`i=m`$ it is the identity.
- If an unused $`y\in Y`$ is adjacent to $`u`$ and $`x_{i-1}`$ for some $`1\le i\le m`$, do the same with $`y`$ in place of $`y_i`$, omitting $`y_i`$ entirely.

In both cases the new endpoint is $`x_i`$. The core support and the length do not change. Both operations are reversible. In hypergraph language the two operations are used-edge and unused-edge Berge-path rotations; these are not new. See [Pósa-type resilience for Hamilton Berge cycles](https://arxiv.org/html/2611.08525v1), Section 2.2, including its discussion of earlier work and its neighborhood bound. We apply the operations to the incidence pairs of the current problem, rather than asserting a new rotation method.

## Two-level concentration

Let $`R\subseteq X`$ be all moving endpoints reachable from $`P`$ using both operations, and $`r=|R|`$. In the original core order, let $`R^-`$ and $`R^+`$ be the predecessors and successors of $`R`$. Set
```math
S=R\cup R^-\cup R^+,\quad I=N_G(R)\cap V(P),\quad
J=N_G(R)\setminus V(P).
```
Then $`|S|\le3r-1`$ and $`|I|\le2r-1`$, and **every** neighbor of every vertex in $`J`$ belongs to $`S`$. The statements hold when rebased at any reachable path, since the rotations are reversible.

To prove the assertions, call an original labelled link passive if both adjacent core vertices lie outside $`R`$. Each passive link persists with its original label and both incidences on every reachable path. Indeed, its first change would delete a link and make one of its adjacent core vertices an endpoint, putting that core vertex in $`R`$. If an original passive label had a neighbor in $`R`$, use a path ending at that neighbor and make a used-link rotation; it would change the passive link. Thus each label in $`I`$ is originally adjacent along the path to $`R`$. The original moving end contributes at most one such label, giving the bound on $`I`$. It also has no successor, giving the bound on $`S`$.

For a label $`y\in J`$, choose a reachable path ending at a neighbor of $`y`$. If $`y`$ is unused on that path, use that path. If it is used, trace the rotations until immediately before its first insertion. In both cases we obtain a reachable path on which $`y`$ is unused and neighbors the moving end. Every neighbor of $`y`$ is on the core support, or the path would extend by two edges. From the moving end, rotate through $`y`$ at any of its other core neighbors $`x`$. If $`x\notin S`$, every original link incident with $`x`$ is passive and persists. In the current path the link immediately after $`x`$ is one of these original links: $`x`$ is not the moving end, and at the fixed end there is only one original link. The unused-link rotation would remove a passive link. This contradiction gives $`N_G(y)\subseteq S`$.

There is a useful certificate when root $`a`$ neighbors a member $`y`$ of $`J`$. The path just constructed for that $`y`$ closes through $`y`$ to a cycle containing the full core support and all its link vertices. There is no guarantee that this root adjacency exists. Indeed, in a connected host, if a globally longest core-to-core path closes on its full core support, then it already spans $`X`$. Otherwise some label meets the cycle's core and an outside core vertex: if the label belongs to the cycle, open the cycle at that label and append the outside vertex; if it is exterior, delete one entire link incident with its cycle neighbor and extend through the exterior label. Either case produces a longer core-to-core path.

## Incidence bounds with bounded codegree

Suppose every pair in $`X`$ has at most $`\mu\ge1`$ common neighbors and all relevant labels have degree at least $`b\ge2`$. On a fixed reachable path $`Q`$ ending at $`u`$, there is the inequality
```math
d_G(u)+(b-2)|N_G(u)\setminus V(Q)|\le\mu r.
```
For each used label that neighbors $`u`$, charge its preceding core vertex in the orientation of $`Q`$; for each unused label neighboring $`u`$, charge every one of its neighbors other than $`u`$. Each charged core vertex has a successor in the core order, and that successor lies in $`R`$ by the corresponding rotation. Distinct charged core vertices have distinct successors. Each is charged at most $`\mu`$ times because it and $`u`$ share at most $`\mu`$ labels. The used terminal label just charges the predecessor of $`u`$ and returns $`u`$ by the identity rotation.

For each original exterior label, all its neighbors lie in $`S`$. Under the same codegree bound, pair counting gives
```math
|J|\binom b2\le\mu\binom{|S|}2,\qquad
|N_G(u)\cap J|(b-1)\le\mu(|S|-1)\quad (u\in R).
```
The latter inequality holds for every endpoint $`u`$ relative to the **same** original path, regardless of which path represents it. In particular a $`C_4`$-free host gives $`\mu=1`$.

## What is and is not retained

The smaller incidence patch induced by $`S\cup I\cup J`$ retains all degrees of $`R`$ and of the labels in $`J`$. If the two minimum degrees on $`X,Y`$ are $`d,b>0`$, writing $`j=|J|`$ shows that this patch contains at least $`\max\{dr,bj\}`$ edges on at most $`5r+j`$ vertices. It has average degree at least $`2db/(5b+d)`$ by minimizing this ratio over $`j/r\ge0`$. The observation is asymmetric: it says nothing about retained degrees at $`S\setminus R`$ or at the used labels $`I`$. Iteration on this patch does not automatically preserve either minimum-degree hypothesis.

If a reachable path does close on its full support, rebase at that path before applying the second pair bound. Its cycle contains all $`R`$ and its used labels. Thus it has at least
```math
\sum_{u\in R}d_G(u)- \frac{\mu r(3r-2)}{b-1}-2r
```
chords, rounding up if needed. Indeed only the incidences at originally unused labels were subtracted before closing, and at most $`2r`$ retained incidences are cycle edges. This is a conditional count; it does not establish closure or force a fixed chord fraction in arbitrary high-degree hosts.
