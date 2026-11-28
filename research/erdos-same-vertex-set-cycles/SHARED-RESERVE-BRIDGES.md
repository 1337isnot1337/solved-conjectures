# A shared matching reserve for joining path-cycle systems

Partial work on [Erdős #585](https://www.erdosproblems.com/585). This complements the [sharp-density path-cycle relaxation](PRESCRIBED-PATH-CYCLE-SYSTEMS.md). It identifies the exact edge budget for connecting the components and exactly how many branches this creates for any fixed choice of reserve bridges.

Let $`H_1,\ldots,H_k`$ be pairwise edge-disjoint spanning systems on the same nonempty support $`S`$. Each consists of vertex-disjoint cycles and optionally one path (allow a singleton path for the connectivity statements only). Let $`R`$ be an edge reserve on $`S`$ disjoint from all systems. For each $`i`$, contract the components of $`H_i`$ to obtain a quotient with the labelled reserve edges; retain loops and parallel edges for the graphic matroid.

## Exact shared-reserve criterion

There exist pairwise edge-disjoint spanning trees on $`S`$, with tree $`i`$ using only $`H_i\cup R`$, if and only if for every list of vertex partitions $`\mathcal P_i`$ coarsening the respective component partitions of $`H_i`$,

```math
\big|\{e\in R:\ e\text{ crosses at least one }\mathcal P_i\}\big|
\ \ge\ \sum_{i=1}^k (|\mathcal P_i|-1).
```

Necessity holds because each tree requires its own $`|\mathcal P_i|-1`$ crossing reserve edges.

For sufficiency, apply the [Edmonds–Fulkerson disjoint-bases criterion](https://londmathsoc.onlinelibrary.wiley.com/doi/10.1112/jlms.70668) to the separate graphic matroids of the quotients on the common reserve. For $`X\subseteq R`$, let $`c_i(X)`$ count quotient components when using only $`X`$. The partition into these components coarsens the component partition of $`H_i`$ and no edge of $`X`$ crosses it. Hence the displayed condition implies $`|R\setminus X|\ge\sum_i(c_i(X)-1)`$. Taking $`X=R`$ gives connectivity of each quotient, and for arbitrary $`X`$ the inequality is exactly the sum of its graphic rank deficits. Thus choose edge-disjoint spanning quotient trees. Use their edges as bridges between original components; in each original cycle delete one edge, and in each original path keep all edges. This produces edge-disjoint spanning trees on $`S`$. An individually sufficient condition is $`2k`$-edge-connectivity of each reserve quotient with at least two vertices: for any list of partitions the largest crossing count is at least $`k\max_i(|\mathcal P_i|-1)`$.

## Exact branch counts for a fixed bridge tree

Suppose $`R`$ is a matching and fix a chosen bridge tree for one colour. The ends in a component of the bridges incident to it are its ports; they are distinct. If the bridge tree has $`c\ge2`$ vertices, each component has at least one port. After making one deletion from an original cycle, every port except the ports on the ends of that deleted edge has degree three. One can always heal one degree-three port; one can heal two exactly if two ports are adjacent around the cycle. Let $`A`$ count the original cycle components with such an adjacent pair. The optimal deletions on the different cycles are independent.

- If all components are cycles, there are $`2(c-1)`$ ports, of which exactly $`c+A`$ can be healed, so the minimum branch count within the single-deletion construction is $`c-2-A`$. If there is just one cycle, delete any edge and there is no branch.
- If there is one initial **nontrivial** path and $`c-1`$ cycles, let $`q\in\{0,1,2\}`$ count its endpoints that are ports. Those $`q`$ endpoints do not become branches. The minimum branch count is $`2(c-1)-(c-1)-A-q=c-1-A-q`$. If there are no cycles, keeping the initial path gives zero branches. The same formula applies to a singleton initial path if $`q`$ there is defined as the number of ports on it (zero or one).

All constructed trees are subcubic. They are paths exactly when these branch counts vanish. In particular, for a system of cycles only, this means that every quotient vertex has degree at most two and the two ports at any degree-two vertex are consecutive around that original cycle. Two cycle factors with at most two components each therefore give two Hamilton paths whenever the partition criterion passes. For a system with one initial nontrivial path and one cycle, its unique bridge must meet an endpoint of that initial path to produce a spanning path. In general the initial endpoints need not be preserved by this construction.

If all original cycles have length at least $`g`$, each output tree has at most $`|S|/g+1`$ branch vertices; the displayed formulas are sharper. This is a statement about a **specified** reserve and specified systems. The sharp-density extraction currently does not force the quotient partition inequalities or the port adjacency conditions.
