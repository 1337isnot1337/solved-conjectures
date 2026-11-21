# Erdős 600: sparse insertion and the remaining extremality question

21 November 2026. This continues the
[target and augmentation note](target-and-augmentation.md).
It does not settle the required lower limit. The distinction between
arbitrary admissible graphs and extremizers is maintained throughout.

For fixed $`r\geq2`$, call a graph admissible if every edge belongs to between
one and $`r-1`$ triangles. Write $`F_r(n)`$ for the maximum edge count and
$`g_r(n)=F_{r+1}(n)-F_r(n)`$. For an admissible graph $`G`$, define its useful
nonedges by

```math
B_r(G)=\{uv\notin E(G):u\ne v,\quad
1\leq |N_G(u)\cap N_G(v)|\leq r\}.
\tag{1}
```

Every pair is unordered. Put $`B=|B_r(G)|`$ and $`\Delta=\Delta(G)`$.

## 1. A simultaneous insertion bound for arbitrary admissible graphs

There is a set of at least

```math
\frac{B}{2((4r+2)\Delta+1)}
\tag{2}
```

useful nonedges whose simultaneous addition gives an $`F_{r+1}`$-admissible
graph. The inequality is a real lower bound on an integer cardinality.

To prove this, choose a bipartition of the vertex set retaining at least
$`B/2`$ candidate pairs across the cut. Every selected new edge will cross
this cut, so a triangle cannot consist of three new edges.

For a candidate $`e=uv`$, its activated old-edge set is

```math
T(e)=\{uw,vw:w\in N_G(u)\cap N_G(v)\},
\qquad |T(e)|\leq2r.
\tag{3}
```

Put a conflict between two candidate pairs if either their activated
old-edge sets intersect, or their addition creates a triangle containing
two new edges and one old edge.

For a fixed old edge $`xy`$, a candidate activating it has the form $`xz`$
with $`z\in N_G(y)`$, or $`yz`$ with $`z\in N_G(x)`$. There are at most
$`d_G(x)+d_G(y)\leq2\Delta`$ such candidates. Hence a fixed candidate has
at most $`4r\Delta`$ conflicts of the first type. A conflict of the second
type with $`uv`$ has the form $`uw`$ with $`vw\in E(G)`$, or $`vw`$ with
$`uw\in E(G)`$. There are at most $`2\Delta`$ such candidates.

The conflict graph therefore has maximum degree at most
$`(4r+2)\Delta`$. Greedy independent-set selection proves (2).

For the selected family, every new triangle contains exactly one new edge:
two-new-edge triangles were declared conflicts, and three-new-edge triangles
are excluded by the cut. Each new edge consequently has exactly its
original positive codegree, at most $`r`$. Each old edge gains at most one
triangle because the activated sets are disjoint. All old triangles remain.
This verifies the admissibility assertion.

For an extremizer $`G`$ on $`n`$ vertices, (2) gives

```math
g_r(n)\geq
\frac{|B_r(G)|}{2((4r+2)\Delta(G)+1)}.
\tag{4}
```

Requiring the added edges to be a matching would give an unnecessary
denominator involving $`n`$. The bipartition and explicit two-new-edge
conflicts avoid that loss.

## 2. A degree restriction on bounded-gap extremizers

Let $`G`$ attain $`F_r(n)`$, with $`n\geq2`$. Choose a minimum-degree vertex
$`v`$ and a distinct maximum-degree vertex $`u`$; ties can be chosen to make
them distinct. Put $`\delta=\delta(G)`$ and $`\Delta=\Delta(G)`$.

Delete $`v`$ and all edges whose only common neighbor was $`v`$. As proved
in the companion note, deleting those already uncovered edges has no
cascade. There are at most $`(r-1)\delta/2`$ such edges, because
$`G[N_G(v)]`$ has maximum degree at most $`r-1`$. The edge loss is therefore
at most $`(r+1)\delta/2`$.

Vertex $`u`$ loses at most $`r`$ neighbors in this operation: at most one is
$`v`$, and the additionally removed edges incident to $`u`$ form a subset
of the edges from $`u`$ inside $`G[N_G(v)]`$, at most $`r-1`$. Clone $`u`$
in the remaining admissible graph, using one new vertex. The cloning lemma
then constructs an $`F_{r+1}`$-admissible graph on exactly $`n`$ vertices
and gives

```math
g_r(n)\geq\Delta-r-\frac{r+1}{2}\delta.
\tag{5}
```

Suppose that an infinite sequence of orders satisfies $`g_r(n)\leq K`$ for
one fixed finite $`K`$. Then every extremizer at those orders satisfies

```math
\Delta\leq\frac{r+1}{2}\delta+K+r
\leq\frac{r+1}{n}F_r(n)+K+r=o(n),
\tag{6}
```

where the last step uses the fixed-$`r`$ Ruzsa–Szemerédi upper bound. Combining
(4) and (6) gives

```math
|B_r(G)|\leq2K((4r+2)\Delta+1)=o(n).
\tag{7}
```

Thus bounded gaps require more than the absence of a large insertion
matching. They require only sublinearly many useful nonedges in the entire
extremizer, together with (6)'s degree comparability. These conclusions do
not hold for all admissible graphs without the bounded-gap hypothesis.

## 3. Disconnected extremizers cannot give a bounded-gap sequence

If an admissible graph has vertices in two different components, take a
maximum-degree vertex $`u`$ in one component and any vertex $`x`$ in another.
Add all edges from $`x`$ to $`N_G(u)`$.

For every $`y\in N_G(u)`$, its degree in the induced neighborhood is
$`b_G(uy)`$, which lies in $`[1,r-1]`$. Thus each new edge $`xy`$ is in
between one and $`r-1`$ triangles. Each old edge inside $`N_G(u)`$ gains one
triangle. All other old edges keep their booksize, since the original
components have no cross edges. The new graph is $`F_{r+1}`$-admissible and
has $`\Delta(G)`$ additional edges.

Consequently a disconnected extremizer satisfies

```math
g_r(n)\geq\Delta(G)\geq\frac{2F_r(n)}n.
\tag{8}
```

The final expression tends to infinity. A hypothetical bounded-gap sequence
therefore consists of connected extremizers for all sufficiently large
orders.

## 4. What the density distinction would have to prove

The primary Ruzsa–Szemerédi construction gives
$`F_r(n)=n^{2-o(1)}`$ for every fixed $`r\geq2`$. The required progression-free
set bound is supplied, for example, by
[Elkin's primary construction](https://arxiv.org/abs/0801.4310). Substituting
such a set in the tripartite construction of the companion note gives the
stated graph lower bound. The tensor obstruction there has a fixed
polynomial density loss. That numerical distinction alone does not exclude
a bounded-gap sequence.

The coordinator pointed out a stronger explicit obstruction to overly
optimistic density bounds. For each $`k\geq2`$, the Kneser graph $`KG(3k,k)`$
has

```math
n_k=\binom{3k}{k},\qquad d_k=\binom{2k}{k},\qquad b(e)=1.
\tag{9}
```

For distinct nonadjacent vertices $`A,B`$ with $`|A\cap B|=j\geq1`$, the
common-neighbor count is $`\binom{k+j}{k}\geq k+1\geq3`$. Thus there are no
useful nonedges for $`r=2`$. Stirling's formula gives

```math
|E(KG(3k,k))|=n_k^{1+\eta+o(1)},\qquad
\eta=\frac{\log4}{\log(27/4)}>\frac12.
\tag{10}
```

In particular an $`O(n^{3/2})`$ upper bound under absence of useful nonedges
would be false. Fixed independent blow-ups transfer the same obstruction
to every fixed $`r\geq2`$: use fiber size $`r-1`$, as in the companion note.
This family still does not have the exponent $`2-o(1)`$ of the extremizers.

The preceding arguments identify a sufficient missing structural theorem:
for every fixed $`r,K`$, no sequence of connected $`F_r`$-extremizers can
simultaneously have the near-quadratic edge count, degree relation (6), and
the useful-nonedge bound (7). A stronger theorem giving a polynomial edge
bound for all admissible graphs satisfying those restrictions would also
suffice, but no such theorem is established here.

The elementary common-neighbor moment identity

```math
\sum_{\{u,v\}\subseteq V(G)}|N_G(u)\cap N_G(v)|
=\sum_{w\in V(G)}\binom{d_G(w)}2
\tag{11}
```

does not itself place mass in the bounded positive-codegree range (1).
Large codegrees on the remaining nonedges are compatible with its terms.
Likewise, restricting to an induced subgraph can create new small
codegrees by deleting common neighbors, so simply deleting the endpoints
of the exceptional pairs does not preserve the needed condition.

Targeted literature checks used locally linear/matched graphs, unique
triangles, and restrictions on common neighbors. The returned strong
regularity, prismatic, and cycle-forbidding results impose additional
hypotheses not proved for these extremizers. No such hypothesis is imported.
The original [Erdős discussion](https://www.erdosproblems.com/forum/thread/600)
and [existing working report](https://www.erdosproblemaday.com/report/600)
already identify a growing compatible insertion family as a sufficient
route. The present bounds quantify one safe packing mechanism and the exact
remaining obstruction; they do not supply that family for extremizers.

No limit, full counterexample, accepted Lean submission, or additional
completed paid problem follows from this note.
