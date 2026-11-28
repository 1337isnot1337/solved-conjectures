# Interlaced bridges and dense switch subtrees

A [quotient switch](MULTIPLE-QUOTIENT-SWITCHES.md) can add new copies to an already connected lift. Here a switch does something different: it joins *several disjoint* full-support cycles, using two cuts per cycle. On a supplied tree of such bridges one can optimize the edge density exactly, even when reserve edges cross distant branches.

## One bridge across disjoint cycles

Suppose several disjoint sets of seed copies already have oriented full-support cycles, using the oriented local rims of the [multiple-switch construction](MULTIPLE-QUOTIENT-SWITCHES.md). Take a new alternating quotient switch using a fresh pair of adjacent rim ports. In each visited copy the designated edge must still be intact. Suppose the switch visits each old cycle either once or twice in distinct copies; it may also visit new copies. Treat the new rims as old cycles visited once.

Write the switch's cyclic word in the names of the cycles it visits. On the set of positions let $`p`$ be the cyclic shift along the word and let $`q`$ exchange the two occurrences of each twice-visited name, fixing singletons. On cutting the old cycles and following old segments and new edges, the circuit count is exactly the cycle count of $`qp`$. An old cycle cut once returns to the same occurrence. An old cycle cut twice sends its two occurrences to one another. These first-return maps justify the formula independently of where the cuts are along the old cycles.

For the twice-visited names form the binary matrix $`A`$ with zero diagonal and an off-diagonal one when their pairs of occurrences alternate around the word. Then the count is
```math
1+\dim_{\mathbb F_2}\ker A.
```
This is the directed [Cohn–Lempel equality](https://arxiv.org/abs/0903.4405) in cycle–transposition form. Singletons can be suppressed without changing the circuit count, with the all-singleton case giving one circuit directly. In particular, two twice-visited cycles merge exactly when the four visits alternate. The order of the two cuts along either old cycle is irrelevant: its first-return map is always the transposition. More generally, any even number of twice-visited cycles can be merged when all pairs of visits alternate. The corresponding matrix has every off-diagonal entry one and is nonsingular over $`\mathbb F_2`$ in even dimension. Indeed $`Ax=0`$ means that each coordinate equals the sum of all coordinates, so that sum must be zero in even dimension.

## An edge-density optimization on a supplied tree

Suppose there are disjoint blocks of copies, each with a supplied full-support cycle. Suppose a tree on the blocks is supplied. Each tree edge has a bridge switch visiting exactly two copies in each of its two blocks, in alternate order, no copies in other blocks, and possibly some private copies outside all blocks. Private copy sets of distinct tree edges are disjoint. Assume all designated cuts at any copy are pairwise vertex-disjoint and that they lie on the oriented rim segments used by the block cycle.

For every nonempty connected vertex set of the tree, retain its blocks and all its internal tree-edge bridges. The preceding two-cycle test yields one cycle spanning this support. To prove this, start at any retained root and add one neighboring block at a time by its bridge. The two cuts in the already merged cycle and the two cuts in the new block still occur in the prescribed alternating order **along the bridge**, which is the only order that matters. Earlier modifications do not touch future cuts.

Let $`S`$ be the resulting quotient support, $`h`$ the seed order and $`k_H`$ the seed chord count. Full support gives its exact chord surplus
```math
F(S)=e_K(S)-(h-k_H)|S|,
```
where $`e_K(S)=e(K[S])`$. In particular, a spanning tree of bridges across a partition of the quotient gives a Hamilton cycle in the lift if the supplied routes satisfy the hypotheses. If the lift is regular of degree at least four, that Hamilton cycle meets the conjectured target. This can happen even when no individual block meets the target.

For a stronger selection result, fix a root block. For each nonroot block attach its private parent-edge bridge copies to that block as one atom. These atoms, with the root block as its own atom, have disjoint supports $`U_i`$. A feasible selection containing the root is precisely an ancestor-closed set of block indices. For its score give index $`i`$ the weight
```math
e_K(U_i)-(h-k_H)|U_i|
```
and for each distinct pair give a reward $`e_K(U_i,U_j)`$ if both indices are selected. That reward is nonnegative, and summing weights and rewards counts the surplus exactly. Put a directed implication from a child to its parent and a nonnegative-weight reward node with implications to its two indices. Force the root. A maximum-weight closed set realizes the optimum, since every eligible nonnegative reward can be taken. This is one [maximum-closure min-cut](https://doi.org/10.1287/mnsc.22.11.1268) per root. Enumerating roots finds the best among all nonempty connected block sets. A reserve chord between distant tree branches is counted once, without requiring it to lie on a supplied bridge.

## A full-density lift despite failure in both blocks

Let the seed be a rim of any even length $`h\ge4`$. Use the quotient $`K_{2h,2h}`$ with each shore labelled by residues modulo $`2h`$. Matching color $`t`$ joins left $`i`$ to right $`i+t`$. Colors $`0,2`$ have two alternating components, the even-labelled block and the odd-labelled block, each with $`2h`$ copies. Assign these two colors to the ends of a seed rim edge. Each separate block induces $`K_{h,h}`$ in the quotient, so has negative surplus $`h^2-2h^2=-h^2`$.

Colors $`1,1+h`$ contain 4-cycles alternating between the parity blocks, since both shifts are odd and their difference is $`h`$. Assign those two colors to the ends of a disjoint seed rim edge. One of these cycles bridges the blocks in the alternating two-plus-two pattern. Assign all other colors so each seed vertex receives two colors in total. The lift is then 4-regular. The bridge gives a Hamilton cycle whose chords equal its length. This is an example of retrieving the edge budget across blocks, not an assertion that every quotient supplies such bridges.

## Scope

The tree certificate closes the density accounting once a compatible set of bridges is supplied. It does not extract a dense tree of switches from an arbitrary graph or even from an arbitrary matching-colored quotient. The [Hamburger–Szegedy conjecture](https://www.erdosproblems.com/642) remains open. Interlacement and maximum closure are standard tools; the note applies them to full-support quotient lifts.
