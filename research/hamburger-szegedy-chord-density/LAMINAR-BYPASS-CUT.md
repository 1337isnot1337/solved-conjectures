# Discarding cycle vertices by a minimum cut

A shortening rule for the [Hamburger–Szegedy conjecture](README.md), [Erdős #642](https://www.erdosproblems.com/642). Unlike the shortcut notes, this rule can discard vertices of the original dense patch. It accounts for every chord lost in doing so.

## An exact deletion objective

Fix a simple cycle $`C`$ and let $`H=G[V(C)]`$. The chord surplus of a cycle with vertex set $`S`$ is $`e(G[S])-2|S|`$. A nonnegative surplus is precisely the desired witness. If a shortcut deletes a vertex set $`X`$ and adds no new vertices, the gain in surplus is
```math
2|X|-e_H(X,V(C)\setminus X)-e_H(X)
=\sum_{v\in X}(2-d_H(v))+e_H(X).
```
In particular two disjoint deletions have a positive interaction: their gains add, plus the number of edges of $`H`$ between the two deleted sets. A chord touching both deleted sets must be charged just once.

Choose three protected vertices of $`C`$. A bypass arc is a path along $`C`$ of length at least two whose endpoints are joined by a chord and whose interior contains no protected vertex. A family is laminar if the rim-edge sets of any two arcs are disjoint or one contains the other. For a selected subfamily, replace only its inclusion-maximal arcs by their corresponding chords. Those arcs are edge-disjoint; they may meet at endpoints, but no endpoint is in another interior. The result is a simple cycle, because it follows the original circular order of the remaining vertices and at least three protected vertices survive. The discarded set is the union of the interiors of the selected arcs.

## Optimize all choices in a supplied laminar family

Make the inclusion forest of the supplied arcs. If an arc is selected, require that every descendant is selected. This loses no possible deletion: descendants of a selected outer arc add no vertices to the removed set. For arc $`i`$ put $`D_i`$ equal to its interior minus the interiors of its children. These atom sets are disjoint, even when two sibling arcs share an endpoint. For a descendant-closed choice of arcs, the removed set is exactly the union of its selected atoms.

Give node $`i`$ weight
```math
w_i=\sum_{v\in D_i}(2-d_H(v))+e_H(D_i).
```
For each pair of distinct atoms that has edges between them, add a bonus node of weight $`e_H(D_i,D_j)`$. It can be selected only if both $`i`$ and $`j`$ are selected. Give each arc node implications to its children. For any feasible arc choice, selecting all eligible bonus nodes gives exactly its surplus gain. Conversely, any closed set of nodes gives a feasible deletion with gain at least its weight. Thus the optimal gain equals the maximum weight of a closed set.

This is a single instance of [Picard's maximum-closure reduction](https://doi.org/10.1287/mnsc.22.11.1268): source arcs have capacities equal to positive weights, sink arcs have capacities equal to magnitudes of negative weights, and implication arcs have capacity exceeding the sum of the absolute weights. A minimum cut gives the exact optimum. There is no search over nested choices. If the optimum gain plus the original surplus is nonnegative, its shortened cycle solves the fixed-host instance.

The same construction gives a guaranteed gain for supplied exterior bypass paths, rather than chords. Require their interiors to be pairwise disjoint and outside the original cycle. For a selected arc whose substitute has length $`l\ge2`$, count the $`l`$ new path edges and the $`l-1`$ new vertices. Add a contribution $`2-l`$ to the gain. To account for the rule that only maximal selected arcs are replaced, charge $`2-l_i`$ to node $`i`$ and subtract the sum of the children’s own contributions from each node's weight. These charges telescope on each selected subtree. Additional edges touching new vertices were not counted, so the maximum closure gives a lower bound rather than the exact gain for exterior paths.

## A charging certificate at an optimal cycle

Let $`C`$ maximize chord surplus over all cycles of its graph. For any edge-disjoint family of bypass arcs as above, it is possible to allocate $`|X_i|-1`$ distinct chords of $`C`$ to every interior $`X_i`$, each chord touching its assigned interior. No chord is allocated twice.

In fact, for any subfamily with union of interiors $`X`$, exactly $`|X|+k`$ rim edges touch $`X`$, where $`k`$ is the size of the subfamily. Every interior is a nonempty contiguous block, and distinct such blocks are separated by a surviving endpoint. The surplus gain is therefore $`|X|-k`$ minus the number of chords touching $`X`$. Maximality of the original surplus makes that gain nonpositive. Give each arc $`|X_i|-1`$ demand copies, all with the same neighbors in the chord set. The inequalities for all subfamilies are Hall's condition for a matching saturating the demand copies. A partial collection of copies cannot have a larger demand than taking all copies of the represented arcs.

Conversely, for a fixed edge-disjoint family this charging certificate guarantees that none of its subfamilies improves the surplus. This is stronger than having one valid charge for each arc considered separately. A chord can otherwise be reused in conflicting charges.

## A dichotomy after cutting at a chord

Let a cycle have $`n_C`$ vertices and $`k_C>0`$ chords. A chord $`uv`$ cuts it into two smaller cycles. Let $`x(uv)`$ count the chords with one endpoint in the interior of each $`u,v`$ arc. The total lengths of the two smaller cycles add to $`n_C+2`$. Their chord counts add to $`k_C-1-x(uv)`$: the splitting chord becomes a rim edge in both, and no chord crossing the split survives. Thus their total surplus is the original surplus minus $`3+x(uv)`$.

If neither child improves the original surplus, then
```math
x(uv)\ge n_C-k_C-3 .
```
Since $`x(uv)\le k_C-1`$, every chord of any cycle with $`2k_C<n_C-2`$ gives a strictly improving child. Quantitatively, a child has surplus at least the original surplus plus $`(n_C-2-2k_C)/2`$, so the integer gain is at least its ceiling.

In particular a global surplus-maximizer is either chordless or has at least $`(n_C-2)/2`$ chords. Iterating the improving cut from any given cycle terminates at one of these two alternatives without decreasing the surplus. If the starting cycle is chorded and has deficit $`n_C-k_C\le g`$ in a graph of girth $`g`$, the chordless alternative is impossible whenever a strict improving step is made. Every chordless cycle has deficit at least $`g`$. If no step is made, the starting cycle already has the stated half-linear number of chords.

A variant preserves a fixed chord-count threshold $`q>0`$. Choose a surplus-maximizer among cycles with at least $`q`$ chords. If its count is less than $`(n_C-2)/2`$, then every chord splits off a child with fewer than $`q`$ chords. Otherwise both children belong to the optimization class, contradicting the strict improvement. This provides a concrete structural condition on a cycle that maximizes surplus while keeping a prescribed stock of chords.

## Limit

The optimization is exact for a supplied laminar family of chord bypasses, not for every choice of crossing shortcuts. It also gives necessary conditions on a globally surplus-maximal cycle. A high minimum degree does not yet force a laminar family with enough removable vertices left uncharged. The unrestricted density conjecture remains open.
