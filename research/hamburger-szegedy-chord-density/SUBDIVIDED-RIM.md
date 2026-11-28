# Subdivided rim obstruction

This note concerns the full [Hamburger–Szegedy conjecture](https://www.erdosproblems.com/642). It shows why an approach based only on finding complicated patterns of chord crossings cannot force a positive chord-to-length ratio. It does **not** give high-minimum-degree counterexamples.

## A count for every cycle, not just the displayed rim

Start with a cyclic list of distinct branch vertices. For each consecutive pair put in a rim path of length at least $`s\ge2`$ with private internal vertices. Add a simple graph $`F`$ on the branch vertices, with no other edges. Edges of $`F`$ are allowed between branch vertices consecutive in the abstract list, since they are not rim edges.

Let $`D`$ be any cycle, $`S`$ its set of branch vertices, $`r`$ the number of rim paths it uses and $`c`$ the number of $`F`$-edges it uses. Each rim path is traversed entirely or not at all because its internal vertices have degree two. Thus $`|S|=r+c`$ by suppressing the traversed paths in $`D`$; if there are only two branch vertices, the resulting cycle has two parallel edges, which still gives this equality. The only possible chords of $`D`$ are edges of $`F[S]`$ not used by $`D`$. In particular, writing $`\kappa`$ for the number of connected components and $`\beta`$ for the cycle-space dimension of $`F[S]`$ gives the exact identities
```math
k(D)=e(F[S])-c=r-\kappa+\beta,\qquad |D|\ge sr+c.
```

If $`F`$ is a forest, $`\beta=0`$, so every cycle has strictly fewer than $`|D|/s`$ chords. More generally, suppose every nonempty $`S`$ satisfies $`e(F[S])\le(1+\eta)(|S|-\kappa(F[S]))`$ for some $`\eta\ge0`$. Then
```math
k(D)\le (1+\eta)r+\eta c-(1+\eta)\kappa
   \lt \max\{(1+\eta)/s,\eta\}\,|D|.
```
This remains valid for cycles made entirely of $`F`$-edges. For a matching $`F`$ one has the sharper bound
```math
k(D)\le \frac{r-c}{2}\le \frac{|D|}{2s}.
```
If the matching is perfect and all rim lengths equal $`s`$, equality is attained on the rim. If the lengths are all $`s`$ or $`s+1`$, that rim has chord fraction at least $`1/(2(s+1))`$.

## Prescribing crossing structure while making every ratio small

A circle graph is the intersection graph of chords with distinct endpoints on a circle; two chords intersect when their ends alternate. Take **any nonempty circle graph** and use such a chord representation for the branch order and a perfect matching $`F`$. If the representation has only one chord, insert one additional unpaired branch vertex to make the rim list have at least three vertices. Independently for every chord, prescribe its endpoints opposite colors. For each rim path choose length $`s`$ or $`s+1`$ to match the prescribed endpoint colors: equal colors require even length and different colors require odd length. This makes the whole graph bipartite without changing the chord order. Every cycle uses a rim path, since the matching has no cycle, and consequently the girth is at least $`s+1`$.

It follows that for any prescribed circle graph, any girth lower bound and any $`\varepsilon>0`$, some bipartite host contains a cycle with exactly that chord-crossing graph, but **no** cycle with more than an $`\varepsilon`$ fraction of chords. The number of chords, clique number, and treewidth of the crossing graph therefore cannot by themselves certify even a positive chord fraction. This includes arbitrarily many pairwise interlacing chords. The host is 2-connected, since it is a spanning cycle plus a matching, but has degree-two vertices.

## Large treewidth of the host does not cure this obstruction

This conclusion can be made to coexist with arbitrarily large host treewidth. Order the cells of a $`t\times t`$ grid along a snake that traverses each row and moves to the next row through its last column in that traversal. In a second chord diagram, give each cell two consecutive branch vertices, one for its upward port and one for its downward port. Match the downward port of each cell to the upward port of the cell below it. The left-over boundary ports may remain unmatched. Insert this entire diagram into any one gap of the original chord diagram before constructing the rim paths.

Contract the rim path between the ports of each cell and the corresponding endpoints together. Between neighboring cells in the same row, the snake supplies a rim path; vertical grid edges are supplied by the matching. Delete other edges and contract the horizontal paths to obtain the whole grid as a minor. The initial circle graph still occurs as an induced subgraph of the enlarged crossing graph: adding the new branch vertices to one gap leaves the relative order of the old endpoints unchanged. For an elementary width bound, every union of a grid row with a grid column is connected and any two such unions intersect. In any tree decomposition their bag subtrees therefore have a common bag by the Helly property for subtrees. A set of fewer than $`t`$ vertices misses some row and some column, so cannot meet all those unions. Thus the grid has treewidth at least $`t-1`$, and contracting or deleting edges cannot increase treewidth.

## Consequence for the stock-preserving approach

The [chord-cut inequality](LAMINAR-BYPASS-CUT.md) improves the surplus of a sufficiently sparse chorded cycle, but the improvement can consume the available chords. The construction above rules out an upgrade that starts only from a chord-crossing pattern, even a crossing clique of unbounded size in a host of unbounded treewidth and girth. To evade it, an argument has to use more of the host, for example the high degree in the vertices outside the protected set, or quantitative bounds on the cost of routes between chord endpoints. The [constant-degree almost-linear theorem](https://arxiv.org/abs/2601.08769) does not by itself supply such a bound. No priority claim is made for the elementary counting or subdivision arguments.
