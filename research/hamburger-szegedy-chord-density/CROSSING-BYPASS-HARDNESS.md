# Crossing bypass hardness

For the [Hamburger–Szegedy chord-density conjecture](https://www.erdosproblems.com/642), the [laminar bypass note](LAMINAR-BYPASS-CUT.md) optimizes deletions specified by nested or disjoint arcs. Here we delimit that method: optimization can be NP-hard for the simplest crossing permission graph. This is a result about **supplied shortcuts**, not the optimization problem over all cycles and not a resolution of the extremal conjecture.

## Problem and result

The input includes a graph, an oriented cycle, and a list of chords, each with a specified forward arc to replace. A selection is feasible if simultaneous replacement by those chords makes a simple cycle following the original order and does not delete a selected chord endpoint. In the constructions below feasibility is precisely that the chosen arcs have disjoint edge sets. Score the resulting cycle by its number of chords minus its length, counting **all** chords in the host, not just supplied ones.

For each fixed girth bound, maximization is NP-hard in bipartite subcubic graphs, even when the input choices conflict only in isolated pairs. For maximum degree five and the same girth bound, the decision problem with score threshold zero is NP-complete under the same conflict restriction. The degree-five threshold is sharp. In a host of maximum degree four, a nonnegative-score cycle must span an induced 4-regular graph. Every vertex on the cycle then uses its entire host degree on the support, so that support must be the whole connected component containing the input cycle. Since the allowed operations only delete vertices from the input cycle, the empty selection already works if any selection works. This is directly checkable.

## Reduction from Simple Max-Cut

Given a simple graph $`F`$ with $`n\ge2`$ vertices numbered in arbitrary order and maximum degree at most $`D\ge1`$, put a block of $`4D+8`$ consecutive vertices on a cycle for each vertex. Coordinates in each block run from $`0`$ through $`4D+7`$. In every block set
```math
a=0,\qquad b=2D+2,\qquad c=2D+5,\qquad d=4D+7.
```
Supply two shortcuts, $`ac`$ bypassing the forward arc from $`a`$ to $`c`$, and $`bd`$ bypassing the forward arc from $`b`$ to $`d`$. Each deletes an endpoint of the other, so at most one can be chosen. Neither interferes with a different block. The two tracks are the vertices strictly between $`a,b`$ and strictly between $`c,d`$. The $`ac`$ shortcut preserves only the right track, and $`bd`$ preserves only the left track.

For each edge # Crossing bypass hardness

For the [Hamburger–Szegedy chord-density conjecture](https://www.erdosproblems.com/642), the [laminar bypass note](LAMINAR-BYPASS-CUT.md) optimizes deletions specified by nested or disjoint arcs. Here we delimit that method: optimization can be NP-hard for the simplest crossing permission graph. This is a result about **supplied shortcuts**, not the optimization problem over all cycles and not a resolution of the extremal conjecture.

## Problem and result

The input includes a graph, an oriented cycle, and a list of chords, each with a specified forward arc to replace. A selection is feasible if simultaneous replacement by those chords makes a simple cycle following the original order and does not delete a selected chord endpoint. In the constructions below feasibility is precisely that the chosen arcs have disjoint edge sets. Score the resulting cycle by its number of chords minus its length, counting **all** chords in the host, not just supplied ones.

For each fixed girth bound, maximization is NP-hard in bipartite subcubic graphs, even when the input choices conflict only in isolated pairs. For maximum degree five and the same girth bound, the decision problem with score threshold zero is NP-complete under the same conflict restriction. The zero threshold is impossible in subcubic graphs, so the degree distinction matters.

## Reduction from Simple Max-Cut

Given a simple graph $`F`$ with $`n\ge2`$ vertices numbered in arbitrary order and maximum degree at most $`D\ge1`$, put a block of $`4D+8`$ consecutive vertices on a cycle for each vertex. Coordinates in each block run from $`0`$ through $`4D+7`$. In every block set
```math
a=0,\qquad b=2D+2,\qquad c=2D+5,\qquad d=4D+7.
```
Supply two shortcuts, $`ac`$ bypassing the forward arc from $`a`$ to $`c`$, and $`bd`$ bypassing the forward arc from $`b`$ to $`d`$. Each deletes an endpoint of the other, so at most one can be chosen. Neither interferes with a different block. The two tracks are the vertices strictly between $`a,b`$ and strictly between $`c,d`$. The $`ac`$ shortcut preserves only the right track, and $`bd`$ preserves only the left track.

ij`$ of # Crossing bypass hardness

For the [Hamburger–Szegedy chord-density conjecture](https://www.erdosproblems.com/642), the [laminar bypass note](LAMINAR-BYPASS-CUT.md) optimizes deletions specified by nested or disjoint arcs. Here we delimit that method: optimization can be NP-hard for the simplest crossing permission graph. This is a result about **supplied shortcuts**, not the optimization problem over all cycles and not a resolution of the extremal conjecture.

## Problem and result

The input includes a graph, an oriented cycle, and a list of chords, each with a specified forward arc to replace. A selection is feasible if simultaneous replacement by those chords makes a simple cycle following the original order and does not delete a selected chord endpoint. In the constructions below feasibility is precisely that the chosen arcs have disjoint edge sets. Score the resulting cycle by its number of chords minus its length, counting **all** chords in the host, not just supplied ones.

For each fixed girth bound, maximization is NP-hard in bipartite subcubic graphs, even when the input choices conflict only in isolated pairs. For maximum degree five and the same girth bound, the decision problem with score threshold zero is NP-complete under the same conflict restriction. The zero threshold is impossible in subcubic graphs, so the degree distinction matters.

## Reduction from Simple Max-Cut

Given a simple graph $`F`$ with $`n\ge2`$ vertices numbered in arbitrary order and maximum degree at most $`D\ge1`$, put a block of $`4D+8`$ consecutive vertices on a cycle for each vertex. Coordinates in each block run from $`0`$ through $`4D+7`$. In every block set
```math
a=0,\qquad b=2D+2,\qquad c=2D+5,\qquad d=4D+7.
```
Supply two shortcuts, $`ac`$ bypassing the forward arc from $`a`$ to $`c`$, and $`bd`$ bypassing the forward arc from $`b`$ to $`d`$. Each deletes an endpoint of the other, so at most one can be chosen. Neither interferes with a different block. The two tracks are the vertices strictly between $`a,b`$ and strictly between $`c,d`$. The $`ac`$ shortcut preserves only the right track, and $`bd`$ preserves only the left track.

F`$ with # Crossing bypass hardness

For the [Hamburger–Szegedy chord-density conjecture](https://www.erdosproblems.com/642), the [laminar bypass note](LAMINAR-BYPASS-CUT.md) optimizes deletions specified by nested or disjoint arcs. Here we delimit that method: optimization can be NP-hard for the simplest crossing permission graph. This is a result about **supplied shortcuts**, not the optimization problem over all cycles and not a resolution of the extremal conjecture.

## Problem and result

The input includes a graph, an oriented cycle, and a list of chords, each with a specified forward arc to replace. A selection is feasible if simultaneous replacement by those chords makes a simple cycle following the original order and does not delete a selected chord endpoint. In the constructions below feasibility is precisely that the chosen arcs have disjoint edge sets. Score the resulting cycle by its number of chords minus its length, counting **all** chords in the host, not just supplied ones.

For each fixed girth bound, maximization is NP-hard in bipartite subcubic graphs, even when the input choices conflict only in isolated pairs. For maximum degree five and the same girth bound, the decision problem with score threshold zero is NP-complete under the same conflict restriction. The zero threshold is impossible in subcubic graphs, so the degree distinction matters.

## Reduction from Simple Max-Cut

Given a simple graph $`F`$ with $`n\ge2`$ vertices numbered in arbitrary order and maximum degree at most $`D\ge1`$, put a block of $`4D+8`$ consecutive vertices on a cycle for each vertex. Coordinates in each block run from $`0`$ through $`4D+7`$. In every block set
```math
a=0,\qquad b=2D+2,\qquad c=2D+5,\qquad d=4D+7.
```
Supply two shortcuts, $`ac`$ bypassing the forward arc from $`a`$ to $`c`$, and $`bd`$ bypassing the forward arc from $`b`$ to $`d`$. Each deletes an endpoint of the other, so at most one can be chosen. Neither interferes with a different block. The two tracks are the vertices strictly between $`a,b`$ and strictly between $`c,d`$. The $`ac`$ shortcut preserves only the right track, and $`bd`$ preserves only the left track.

i\lt j`$, allocate two ports in block $`i`$, one even coordinate on each track, and two ports in $`j`$, one odd coordinate on each track. Use distinct ports for distinct incidences. Each track contains at least $`D`$ coordinates of each parity. Add two reward edges: left in $`i`$ to right in $`j`$, and right in $`i`$ to left in $`j`$. These are not supplied as shortcuts. All non-rim edges form a matching. Each joins opposite parities, since block lengths are even, so the host is bipartite and subcubic.

Fix the girth bound $`g\ge3`$. Stretch each original rim edge to a path of the same odd length $`q\ge g`$ to enforce the girth. The stretch preserves bipartiteness. Every cycle must traverse at least one of these paths, since the remaining edges form a matching. In fact the reduction also works without stretching, for $`q=1`$.

An optimum chooses one shortcut at each block. If neither is chosen, adding either deletes $`q(2D+5)-1\ge 2D+4`$ vertices and loses at most $`2D+2`$ chords: at most both reward edges per input incidence and both shortcut chords of the block. The extra reward losses bound is conservative. Thus adding the choice strictly improves the score. In a complete selection, the chosen shortcut is a cycle edge and the unused shortcut loses an endpoint. Between two blocks, precisely one reward chord survives if their choices differ and none does if they agree. The length of every complete selection is
```math
L=n\big(q(2D+3)+1\big).
```
The optimum score is therefore $`\operatorname{MaxCut}(F)-L`$. This gives the subcubic hardness via [Garey, Johnson and Stockmeyer](https://doi.org/10.1016/0304-3975%2876%2990059-1).

## Moving the threshold to zero

For the Max-Cut target $`0\le k\le e(F)`$, insert $`L-k`$ identical fixed blocks into one rim edge outside the bypass arcs. Each block uses the graph $`J`$ below, with $`p`$ vertices and $`2p+1`$ edges, minus a specified Hamilton cycle edge $`uv`$. Insert the remaining Hamilton path of $`J`$ into the edge by replacing that edge with the path and two joining edges. Do not supply any new shortcuts. Each block increases the cycle length by $`p`$ and the chord count by $`(2p+1)-p=p+1`$: the removed Hamilton edge is absent and the other $`p-1`$ Hamilton edges are cycle edges. The bipartition extends because $`u,v`$ lie on opposite shores. Nothing deleted from another block can enter these fixed blocks. The length bound on the replacement path between $`u,v`$ in $`J-uv`$ is at least $`g-1`$ by the girth of $`J`$. Any cycle that traverses the inserted block has length at least $`g`$; cycles inside the block inherit its girth. The maximum degree stays at most five, since the cut Hamilton edge frees one degree at each terminal. The new optimum score is $`\operatorname{MaxCut}(F)-k`$. A certificate is the choice of arcs; the resulting simple cycle and all its chords can be checked in polynomial time.

For completeness, to obtain $`J`$ start with a large even Hamilton cycle, and add two perfect matchings in sequence, maintaining girth at least $`g`$. The existence of such high-girth Hamiltonian bipartite regular graphs is known; see [prescribed girth and degrees](https://www.sciencedirect.com/science/article/pii/S0012365X2500487X). Here is a direct argument for the needed degrees. Let $`B`$ bound the size of a radius-$`g`$ ball in any graph of maximum degree five and start with more than $`3B`$ vertices per shore. For the current matching, add any opposite-shore unmatched pair at distance greater than $`g`$ if one exists. Otherwise the unmatched set in each shore has at most $`B`$ vertices. Pick unmatched $`a,b`$ on opposite shores and a current matching edge $`a'b'`$ avoiding the two balls centered at $`a,b`$; there are more than $`2B`$ matching edges, so one exists. Replace $`a'b'`$ by $`ab',a'b`$. A cycle of length less than $`g`$ using just one new edge would have an old path between its distant ends. With both new edges, the old paths either connect the distant regions or contain an old $`a'\text{--}b'`$ path after deletion. The latter path has length at least $`g-1`$. Thus no short cycle is created and the matching grows. After both matchings are complete, add one further edge joining any distant opposite-shore pair, obtaining exactly $`2p+1`$ edges. The construction size depends only on the fixed $`g`$.

## A parameter that retains the min-cut method

Suppose three protected rim vertices are outside all bypass interiors, and a supplied set of $`h`$ exceptional arcs can be removed to leave a laminar family. Enumerate the selected subset of exceptional arcs and keep only feasible subsets. Apply that subset first. Discard residual options that would use an already bypassed rim edge or whose endpoints were deleted. Overlap means incompatibility for distinct arcs required to be used simultaneously. Identical options can be deduplicated first. The surviving arcs are still laminar on the shortened rim, since none uses an edge removed from it. For those arcs the laminar min-cut method gives the optimum: its closure convention selects contained nodes to account for deletions, while only the maximal selected arcs are actually used. Therefore at most $`2^h`$ min-cuts suffice given the exceptional set. Without protected vertices, one can enumerate triples of vertices of the final cycle and restrict to choices preserving the triple. This is a polynomial factor in the running time. If the exceptional set is not supplied, find it as a vertex cover of the graph whose edges connect nonlaminar pairs. Branching on the two ends of any uncovered edge finds a cover of size at most # Crossing bypass hardness

For the [Hamburger–Szegedy chord-density conjecture](https://www.erdosproblems.com/642), the [laminar bypass note](LAMINAR-BYPASS-CUT.md) optimizes deletions specified by nested or disjoint arcs. Here we delimit that method: optimization can be NP-hard for the simplest crossing permission graph. This is a result about **supplied shortcuts**, not the optimization problem over all cycles and not a resolution of the extremal conjecture.

## Problem and result

The input includes a graph, an oriented cycle, and a list of chords, each with a specified forward arc to replace. A selection is feasible if simultaneous replacement by those chords makes a simple cycle following the original order and does not delete a selected chord endpoint. In the constructions below feasibility is precisely that the chosen arcs have disjoint edge sets. Score the resulting cycle by its number of chords minus its length, counting **all** chords in the host, not just supplied ones.

For each fixed girth bound, maximization is NP-hard in bipartite subcubic graphs, even when the input choices conflict only in isolated pairs. For maximum degree five and the same girth bound, the decision problem with score threshold zero is NP-complete under the same conflict restriction. The degree-five threshold is sharp. In a host of maximum degree four, a nonnegative-score cycle must span an induced 4-regular graph. Every vertex on the cycle then uses its entire host degree on the support, so that support must be the whole connected component containing the input cycle. Since the allowed operations only delete vertices from the input cycle, the empty selection already works if any selection works. This is directly checkable.

## Reduction from Simple Max-Cut

Given a simple graph $`F`$ with $`n\ge2`$ vertices numbered in arbitrary order and maximum degree at most $`D\ge1`$, put a block of $`4D+8`$ consecutive vertices on a cycle for each vertex. Coordinates in each block run from $`0`$ through $`4D+7`$. In every block set
```math
a=0,\qquad b=2D+2,\qquad c=2D+5,\qquad d=4D+7.
```
Supply two shortcuts, $`ac`$ bypassing the forward arc from $`a`$ to $`c`$, and $`bd`$ bypassing the forward arc from $`b`$ to $`d`$. Each deletes an endpoint of the other, so at most one can be chosen. Neither interferes with a different block. The two tracks are the vertices strictly between $`a,b`$ and strictly between $`c,d`$. The $`ac`$ shortcut preserves only the right track, and $`bd`$ preserves only the left track.

For each edge # Crossing bypass hardness

For the [Hamburger–Szegedy chord-density conjecture](https://www.erdosproblems.com/642), the [laminar bypass note](LAMINAR-BYPASS-CUT.md) optimizes deletions specified by nested or disjoint arcs. Here we delimit that method: optimization can be NP-hard for the simplest crossing permission graph. This is a result about **supplied shortcuts**, not the optimization problem over all cycles and not a resolution of the extremal conjecture.

## Problem and result

The input includes a graph, an oriented cycle, and a list of chords, each with a specified forward arc to replace. A selection is feasible if simultaneous replacement by those chords makes a simple cycle following the original order and does not delete a selected chord endpoint. In the constructions below feasibility is precisely that the chosen arcs have disjoint edge sets. Score the resulting cycle by its number of chords minus its length, counting **all** chords in the host, not just supplied ones.

For each fixed girth bound, maximization is NP-hard in bipartite subcubic graphs, even when the input choices conflict only in isolated pairs. For maximum degree five and the same girth bound, the decision problem with score threshold zero is NP-complete under the same conflict restriction. The zero threshold is impossible in subcubic graphs, so the degree distinction matters.

## Reduction from Simple Max-Cut

Given a simple graph $`F`$ with $`n\ge2`$ vertices numbered in arbitrary order and maximum degree at most $`D\ge1`$, put a block of $`4D+8`$ consecutive vertices on a cycle for each vertex. Coordinates in each block run from $`0`$ through $`4D+7`$. In every block set
```math
a=0,\qquad b=2D+2,\qquad c=2D+5,\qquad d=4D+7.
```
Supply two shortcuts, $`ac`$ bypassing the forward arc from $`a`$ to $`c`$, and $`bd`$ bypassing the forward arc from $`b`$ to $`d`$. Each deletes an endpoint of the other, so at most one can be chosen. Neither interferes with a different block. The two tracks are the vertices strictly between $`a,b`$ and strictly between $`c,d`$. The $`ac`$ shortcut preserves only the right track, and $`bd`$ preserves only the left track.

ij`$ of # Crossing bypass hardness

For the [Hamburger–Szegedy chord-density conjecture](https://www.erdosproblems.com/642), the [laminar bypass note](LAMINAR-BYPASS-CUT.md) optimizes deletions specified by nested or disjoint arcs. Here we delimit that method: optimization can be NP-hard for the simplest crossing permission graph. This is a result about **supplied shortcuts**, not the optimization problem over all cycles and not a resolution of the extremal conjecture.

## Problem and result

The input includes a graph, an oriented cycle, and a list of chords, each with a specified forward arc to replace. A selection is feasible if simultaneous replacement by those chords makes a simple cycle following the original order and does not delete a selected chord endpoint. In the constructions below feasibility is precisely that the chosen arcs have disjoint edge sets. Score the resulting cycle by its number of chords minus its length, counting **all** chords in the host, not just supplied ones.

For each fixed girth bound, maximization is NP-hard in bipartite subcubic graphs, even when the input choices conflict only in isolated pairs. For maximum degree five and the same girth bound, the decision problem with score threshold zero is NP-complete under the same conflict restriction. The zero threshold is impossible in subcubic graphs, so the degree distinction matters.

## Reduction from Simple Max-Cut

Given a simple graph $`F`$ with $`n\ge2`$ vertices numbered in arbitrary order and maximum degree at most $`D\ge1`$, put a block of $`4D+8`$ consecutive vertices on a cycle for each vertex. Coordinates in each block run from $`0`$ through $`4D+7`$. In every block set
```math
a=0,\qquad b=2D+2,\qquad c=2D+5,\qquad d=4D+7.
```
Supply two shortcuts, $`ac`$ bypassing the forward arc from $`a`$ to $`c`$, and $`bd`$ bypassing the forward arc from $`b`$ to $`d`$. Each deletes an endpoint of the other, so at most one can be chosen. Neither interferes with a different block. The two tracks are the vertices strictly between $`a,b`$ and strictly between $`c,d`$. The $`ac`$ shortcut preserves only the right track, and $`bd`$ preserves only the left track.

F`$ with # Crossing bypass hardness

For the [Hamburger–Szegedy chord-density conjecture](https://www.erdosproblems.com/642), the [laminar bypass note](LAMINAR-BYPASS-CUT.md) optimizes deletions specified by nested or disjoint arcs. Here we delimit that method: optimization can be NP-hard for the simplest crossing permission graph. This is a result about **supplied shortcuts**, not the optimization problem over all cycles and not a resolution of the extremal conjecture.

## Problem and result

The input includes a graph, an oriented cycle, and a list of chords, each with a specified forward arc to replace. A selection is feasible if simultaneous replacement by those chords makes a simple cycle following the original order and does not delete a selected chord endpoint. In the constructions below feasibility is precisely that the chosen arcs have disjoint edge sets. Score the resulting cycle by its number of chords minus its length, counting **all** chords in the host, not just supplied ones.

For each fixed girth bound, maximization is NP-hard in bipartite subcubic graphs, even when the input choices conflict only in isolated pairs. For maximum degree five and the same girth bound, the decision problem with score threshold zero is NP-complete under the same conflict restriction. The zero threshold is impossible in subcubic graphs, so the degree distinction matters.

## Reduction from Simple Max-Cut

Given a simple graph $`F`$ with $`n\ge2`$ vertices numbered in arbitrary order and maximum degree at most $`D\ge1`$, put a block of $`4D+8`$ consecutive vertices on a cycle for each vertex. Coordinates in each block run from $`0`$ through $`4D+7`$. In every block set
```math
a=0,\qquad b=2D+2,\qquad c=2D+5,\qquad d=4D+7.
```
Supply two shortcuts, $`ac`$ bypassing the forward arc from $`a`$ to $`c`$, and $`bd`$ bypassing the forward arc from $`b`$ to $`d`$. Each deletes an endpoint of the other, so at most one can be chosen. Neither interferes with a different block. The two tracks are the vertices strictly between $`a,b`$ and strictly between $`c,d`$. The $`ac`$ shortcut preserves only the right track, and $`bd`$ preserves only the left track.

i\lt j`$, allocate two ports in block $`i`$, one even coordinate on each track, and two ports in $`j`$, one odd coordinate on each track. Use distinct ports for distinct incidences. Each track contains at least $`D`$ coordinates of each parity. Add two reward edges: left in $`i`$ to right in $`j`$, and right in $`i`$ to left in $`j`$. These are not supplied as shortcuts. All non-rim edges form a matching. Each joins opposite parities, since block lengths are even, so the host is bipartite and subcubic.

Fix the girth bound $`g\ge3`$. Stretch each original rim edge to a path of the same odd length $`q\ge g`$ to enforce the girth. The stretch preserves bipartiteness. Every cycle must traverse at least one of these paths, since the remaining edges form a matching. In fact the reduction also works without stretching, for $`q=1`$.

An optimum chooses one shortcut at each block. If neither is chosen, adding either deletes $`q(2D+5)-1\ge 2D+4`$ vertices and loses at most $`2D+2`$ chords: at most both reward edges per input incidence and both shortcut chords of the block. The extra reward losses bound is conservative. Thus adding the choice strictly improves the score. In a complete selection, the chosen shortcut is a cycle edge and the unused shortcut loses an endpoint. Between two blocks, precisely one reward chord survives if their choices differ and none does if they agree. The length of every complete selection is
```math
L=n\big(q(2D+3)+1\big).
```
The optimum score is therefore $`\operatorname{MaxCut}(F)-L`$. This gives the subcubic hardness via [Garey, Johnson and Stockmeyer](https://doi.org/10.1016/0304-3975%2876%2990059-1).

## Moving the threshold to zero

For the Max-Cut target $`0\le k\le e(F)`$, insert $`L-k`$ identical fixed blocks into one rim edge outside the bypass arcs. Each block uses the graph $`J`$ below, with $`p`$ vertices and $`2p+1`$ edges, minus a specified Hamilton cycle edge $`uv`$. Insert the remaining Hamilton path of $`J`$ into the edge by replacing that edge with the path and two joining edges. Do not supply any new shortcuts. Each block increases the cycle length by $`p`$ and the chord count by $`(2p+1)-p=p+1`$: the removed Hamilton edge is absent and the other $`p-1`$ Hamilton edges are cycle edges. The bipartition extends because $`u,v`$ lie on opposite shores. Nothing deleted from another block can enter these fixed blocks. The length bound on the replacement path between $`u,v`$ in $`J-uv`$ is at least $`g-1`$ by the girth of $`J`$. Any cycle that traverses the inserted block has length at least $`g`$; cycles inside the block inherit its girth. The maximum degree stays at most five, since the cut Hamilton edge frees one degree at each terminal. The new optimum score is $`\operatorname{MaxCut}(F)-k`$. A certificate is the choice of arcs; the resulting simple cycle and all its chords can be checked in polynomial time.

For completeness, to obtain $`J`$ start with a large even Hamilton cycle, and add two perfect matchings in sequence, maintaining girth at least $`g`$. The existence of such high-girth Hamiltonian bipartite regular graphs is known; see [prescribed girth and degrees](https://www.sciencedirect.com/science/article/pii/S0012365X2500487X). Here is a direct argument for the needed degrees. Let $`B`$ bound the size of a radius-$`g`$ ball in any graph of maximum degree five and start with more than $`3B`$ vertices per shore. For the current matching, add any opposite-shore unmatched pair at distance greater than $`g`$ if one exists. Otherwise the unmatched set in each shore has at most $`B`$ vertices. Pick unmatched $`a,b`$ on opposite shores and a current matching edge $`a'b'`$ avoiding the two balls centered at $`a,b`$; there are more than $`2B`$ matching edges, so one exists. Replace $`a'b'`$ by $`ab',a'b`$. A cycle of length less than $`g`$ using just one new edge would have an old path between its distant ends. With both new edges, the old paths either connect the distant regions or contain an old $`a'\text{--}b'`$ path after deletion. The latter path has length at least $`g-1`$. Thus no short cycle is created and the matching grows. After both matchings are complete, add one further edge joining any distant opposite-shore pair, obtaining exactly $`2p+1`$ edges. The construction size depends only on the fixed $`g`$.

## A parameter that retains the min-cut method

Suppose three protected rim vertices are outside all bypass interiors, and a supplied set of $`h`$ exceptional arcs can be removed to leave a laminar family. Enumerate the selected subset of exceptional arcs and keep only feasible subsets. Apply that subset first. Discard residual options that would use an already bypassed rim edge or whose endpoints were deleted. Overlap means incompatibility for distinct arcs required to be used simultaneously. Identical options can be deduplicated first. The surviving arcs are still laminar on the shortened rim, since none uses an edge removed from it. For those arcs the laminar min-cut method gives the optimum: its closure convention selects contained nodes to account for deletions, while only the maximal selected arcs are actually used. Therefore at most $`2^h`$ min-cuts suffice given the exceptional set. Without protected vertices, one can enumerate triples of vertices of the final cycle and restrict to choices preserving the triple. h`$ in # Crossing bypass hardness

For the [Hamburger–Szegedy chord-density conjecture](https://www.erdosproblems.com/642), the [laminar bypass note](LAMINAR-BYPASS-CUT.md) optimizes deletions specified by nested or disjoint arcs. Here we delimit that method: optimization can be NP-hard for the simplest crossing permission graph. This is a result about **supplied shortcuts**, not the optimization problem over all cycles and not a resolution of the extremal conjecture.

## Problem and result

The input includes a graph, an oriented cycle, and a list of chords, each with a specified forward arc to replace. A selection is feasible if simultaneous replacement by those chords makes a simple cycle following the original order and does not delete a selected chord endpoint. In the constructions below feasibility is precisely that the chosen arcs have disjoint edge sets. Score the resulting cycle by its number of chords minus its length, counting **all** chords in the host, not just supplied ones.

For each fixed girth bound, maximization is NP-hard in bipartite subcubic graphs, even when the input choices conflict only in isolated pairs. For maximum degree five and the same girth bound, the decision problem with score threshold zero is NP-complete under the same conflict restriction. The degree-five threshold is sharp. In a host of maximum degree four, a nonnegative-score cycle must span an induced 4-regular graph. Every vertex on the cycle then uses its entire host degree on the support, so that support must be the whole connected component containing the input cycle. Since the allowed operations only delete vertices from the input cycle, the empty selection already works if any selection works. This is directly checkable.

## Reduction from Simple Max-Cut

Given a simple graph $`F`$ with $`n\ge2`$ vertices numbered in arbitrary order and maximum degree at most $`D\ge1`$, put a block of $`4D+8`$ consecutive vertices on a cycle for each vertex. Coordinates in each block run from $`0`$ through $`4D+7`$. In every block set
```math
a=0,\qquad b=2D+2,\qquad c=2D+5,\qquad d=4D+7.
```
Supply two shortcuts, $`ac`$ bypassing the forward arc from $`a`$ to $`c`$, and $`bd`$ bypassing the forward arc from $`b`$ to $`d`$. Each deletes an endpoint of the other, so at most one can be chosen. Neither interferes with a different block. The two tracks are the vertices strictly between $`a,b`$ and strictly between $`c,d`$. The $`ac`$ shortcut preserves only the right track, and $`bd`$ preserves only the left track.

For each edge # Crossing bypass hardness

For the [Hamburger–Szegedy chord-density conjecture](https://www.erdosproblems.com/642), the [laminar bypass note](LAMINAR-BYPASS-CUT.md) optimizes deletions specified by nested or disjoint arcs. Here we delimit that method: optimization can be NP-hard for the simplest crossing permission graph. This is a result about **supplied shortcuts**, not the optimization problem over all cycles and not a resolution of the extremal conjecture.

## Problem and result

The input includes a graph, an oriented cycle, and a list of chords, each with a specified forward arc to replace. A selection is feasible if simultaneous replacement by those chords makes a simple cycle following the original order and does not delete a selected chord endpoint. In the constructions below feasibility is precisely that the chosen arcs have disjoint edge sets. Score the resulting cycle by its number of chords minus its length, counting **all** chords in the host, not just supplied ones.

For each fixed girth bound, maximization is NP-hard in bipartite subcubic graphs, even when the input choices conflict only in isolated pairs. For maximum degree five and the same girth bound, the decision problem with score threshold zero is NP-complete under the same conflict restriction. The zero threshold is impossible in subcubic graphs, so the degree distinction matters.

## Reduction from Simple Max-Cut

Given a simple graph $`F`$ with $`n\ge2`$ vertices numbered in arbitrary order and maximum degree at most $`D\ge1`$, put a block of $`4D+8`$ consecutive vertices on a cycle for each vertex. Coordinates in each block run from $`0`$ through $`4D+7`$. In every block set
```math
a=0,\qquad b=2D+2,\qquad c=2D+5,\qquad d=4D+7.
```
Supply two shortcuts, $`ac`$ bypassing the forward arc from $`a`$ to $`c`$, and $`bd`$ bypassing the forward arc from $`b`$ to $`d`$. Each deletes an endpoint of the other, so at most one can be chosen. Neither interferes with a different block. The two tracks are the vertices strictly between $`a,b`$ and strictly between $`c,d`$. The $`ac`$ shortcut preserves only the right track, and $`bd`$ preserves only the left track.

ij`$ of # Crossing bypass hardness

For the [Hamburger–Szegedy chord-density conjecture](https://www.erdosproblems.com/642), the [laminar bypass note](LAMINAR-BYPASS-CUT.md) optimizes deletions specified by nested or disjoint arcs. Here we delimit that method: optimization can be NP-hard for the simplest crossing permission graph. This is a result about **supplied shortcuts**, not the optimization problem over all cycles and not a resolution of the extremal conjecture.

## Problem and result

The input includes a graph, an oriented cycle, and a list of chords, each with a specified forward arc to replace. A selection is feasible if simultaneous replacement by those chords makes a simple cycle following the original order and does not delete a selected chord endpoint. In the constructions below feasibility is precisely that the chosen arcs have disjoint edge sets. Score the resulting cycle by its number of chords minus its length, counting **all** chords in the host, not just supplied ones.

For each fixed girth bound, maximization is NP-hard in bipartite subcubic graphs, even when the input choices conflict only in isolated pairs. For maximum degree five and the same girth bound, the decision problem with score threshold zero is NP-complete under the same conflict restriction. The zero threshold is impossible in subcubic graphs, so the degree distinction matters.

## Reduction from Simple Max-Cut

Given a simple graph $`F`$ with $`n\ge2`$ vertices numbered in arbitrary order and maximum degree at most $`D\ge1`$, put a block of $`4D+8`$ consecutive vertices on a cycle for each vertex. Coordinates in each block run from $`0`$ through $`4D+7`$. In every block set
```math
a=0,\qquad b=2D+2,\qquad c=2D+5,\qquad d=4D+7.
```
Supply two shortcuts, $`ac`$ bypassing the forward arc from $`a`$ to $`c`$, and $`bd`$ bypassing the forward arc from $`b`$ to $`d`$. Each deletes an endpoint of the other, so at most one can be chosen. Neither interferes with a different block. The two tracks are the vertices strictly between $`a,b`$ and strictly between $`c,d`$. The $`ac`$ shortcut preserves only the right track, and $`bd`$ preserves only the left track.

F`$ with # Crossing bypass hardness

For the [Hamburger–Szegedy chord-density conjecture](https://www.erdosproblems.com/642), the [laminar bypass note](LAMINAR-BYPASS-CUT.md) optimizes deletions specified by nested or disjoint arcs. Here we delimit that method: optimization can be NP-hard for the simplest crossing permission graph. This is a result about **supplied shortcuts**, not the optimization problem over all cycles and not a resolution of the extremal conjecture.

## Problem and result

The input includes a graph, an oriented cycle, and a list of chords, each with a specified forward arc to replace. A selection is feasible if simultaneous replacement by those chords makes a simple cycle following the original order and does not delete a selected chord endpoint. In the constructions below feasibility is precisely that the chosen arcs have disjoint edge sets. Score the resulting cycle by its number of chords minus its length, counting **all** chords in the host, not just supplied ones.

For each fixed girth bound, maximization is NP-hard in bipartite subcubic graphs, even when the input choices conflict only in isolated pairs. For maximum degree five and the same girth bound, the decision problem with score threshold zero is NP-complete under the same conflict restriction. The zero threshold is impossible in subcubic graphs, so the degree distinction matters.

## Reduction from Simple Max-Cut

Given a simple graph $`F`$ with $`n\ge2`$ vertices numbered in arbitrary order and maximum degree at most $`D\ge1`$, put a block of $`4D+8`$ consecutive vertices on a cycle for each vertex. Coordinates in each block run from $`0`$ through $`4D+7`$. In every block set
```math
a=0,\qquad b=2D+2,\qquad c=2D+5,\qquad d=4D+7.
```
Supply two shortcuts, $`ac`$ bypassing the forward arc from $`a`$ to $`c`$, and $`bd`$ bypassing the forward arc from $`b`$ to $`d`$. Each deletes an endpoint of the other, so at most one can be chosen. Neither interferes with a different block. The two tracks are the vertices strictly between $`a,b`$ and strictly between $`c,d`$. The $`ac`$ shortcut preserves only the right track, and $`bd`$ preserves only the left track.

i\lt j`$, allocate two ports in block $`i`$, one even coordinate on each track, and two ports in $`j`$, one odd coordinate on each track. Use distinct ports for distinct incidences. Each track contains at least $`D`$ coordinates of each parity. Add two reward edges: left in $`i`$ to right in $`j`$, and right in $`i`$ to left in $`j`$. These are not supplied as shortcuts. All non-rim edges form a matching. Each joins opposite parities, since block lengths are even, so the host is bipartite and subcubic.

Fix the girth bound $`g\ge3`$. Stretch each original rim edge to a path of the same odd length $`q\ge g`$ to enforce the girth. The stretch preserves bipartiteness. Every cycle must traverse at least one of these paths, since the remaining edges form a matching. In fact the reduction also works without stretching, for $`q=1`$.

An optimum chooses one shortcut at each block. If neither is chosen, adding either deletes $`q(2D+5)-1\ge 2D+4`$ vertices and loses at most $`2D+2`$ chords: at most both reward edges per input incidence and both shortcut chords of the block. The extra reward losses bound is conservative. Thus adding the choice strictly improves the score. In a complete selection, the chosen shortcut is a cycle edge and the unused shortcut loses an endpoint. Between two blocks, precisely one reward chord survives if their choices differ and none does if they agree. The length of every complete selection is
```math
L=n\big(q(2D+3)+1\big).
```
The optimum score is therefore $`\operatorname{MaxCut}(F)-L`$. This gives the subcubic hardness via [Garey, Johnson and Stockmeyer](https://doi.org/10.1016/0304-3975%2876%2990059-1).

## Moving the threshold to zero

For the Max-Cut target $`0\le k\le e(F)`$, insert $`L-k`$ identical fixed blocks into one rim edge outside the bypass arcs. Each block uses the graph $`J`$ below, with $`p`$ vertices and $`2p+1`$ edges, minus a specified Hamilton cycle edge $`uv`$. Insert the remaining Hamilton path of $`J`$ into the edge by replacing that edge with the path and two joining edges. Do not supply any new shortcuts. Each block increases the cycle length by $`p`$ and the chord count by $`(2p+1)-p=p+1`$: the removed Hamilton edge is absent and the other $`p-1`$ Hamilton edges are cycle edges. The bipartition extends because $`u,v`$ lie on opposite shores. Nothing deleted from another block can enter these fixed blocks. The length bound on the replacement path between $`u,v`$ in $`J-uv`$ is at least $`g-1`$ by the girth of $`J`$. Any cycle that traverses the inserted block has length at least $`g`$; cycles inside the block inherit its girth. The maximum degree stays at most five, since the cut Hamilton edge frees one degree at each terminal. The new optimum score is $`\operatorname{MaxCut}(F)-k`$. A certificate is the choice of arcs; the resulting simple cycle and all its chords can be checked in polynomial time.

For completeness, to obtain $`J`$ start with a large even Hamilton cycle, and add two perfect matchings in sequence, maintaining girth at least $`g`$. The existence of such high-girth Hamiltonian bipartite regular graphs is known; see [prescribed girth and degrees](https://www.sciencedirect.com/science/article/pii/S0012365X2500487X). Here is a direct argument for the needed degrees. Let $`B`$ bound the size of a radius-$`g`$ ball in any graph of maximum degree five and start with more than $`3B`$ vertices per shore. For the current matching, add any opposite-shore unmatched pair at distance greater than $`g`$ if one exists. Otherwise the unmatched set in each shore has at most $`B`$ vertices. Pick unmatched $`a,b`$ on opposite shores and a current matching edge $`a'b'`$ avoiding the two balls centered at $`a,b`$; there are more than $`2B`$ matching edges, so one exists. Replace $`a'b'`$ by $`ab',a'b`$. A cycle of length less than $`g`$ using just one new edge would have an old path between its distant ends. With both new edges, the old paths either connect the distant regions or contain an old $`a'\text{--}b'`$ path after deletion. The latter path has length at least $`g-1`$. Thus no short cycle is created and the matching grows. After both matchings are complete, add one further edge joining any distant opposite-shore pair, obtaining exactly $`2p+1`$ edges. The construction size depends only on the fixed $`g`$.

## A parameter that retains the min-cut method

Suppose three protected rim vertices are outside all bypass interiors, and a supplied set of $`h`$ exceptional arcs can be removed to leave a laminar family. Enumerate the selected subset of exceptional arcs and keep only feasible subsets. Apply that subset first. Discard residual options that would use an already bypassed rim edge or whose endpoints were deleted. Overlap means incompatibility for distinct arcs required to be used simultaneously. Identical options can be deduplicated first. The surviving arcs are still laminar on the shortened rim, since none uses an edge removed from it. For those arcs the laminar min-cut method gives the optimum: its closure convention selects contained nodes to account for deletions, while only the maximal selected arcs are actually used. Therefore at most $`2^h`$ min-cuts suffice given the exceptional set. Without protected vertices, one can enumerate triples of vertices of the final cycle and restrict to choices preserving the triple. 2^h`$ times a polynomial.

## Growing girth

One can also take the prescribed girth to grow logarithmically with the output order. Choose $`g=\max\{4,\lceil\log_2 n\rceil\}`$ and the least odd $`q\ge g`$. The core has $`O(n^2\log n)`$ vertices, and $`L=O(n^2\log n)`$. The ball bound in the padding construction can be taken to be $`1+5(4^g-1)/3`$; hence one fixed block has $`O(n^2)`$ vertices. The full instance has $`N=O(n^4\log n)`$ vertices and girth at least $`g=\Omega(\log N)`$. The matching construction is polynomial in the block order: each augmentation grows a matching, and all distance and edge conditions can be found by graph searches. This proves hardness even with logarithmically growing girth, but not polynomial running time in an arbitrary girth parameter.

The Max-Cut construction came from the project's background research pass and was checked before inclusion. The sharp degree distinction and growing-girth calculation are additional observations.
