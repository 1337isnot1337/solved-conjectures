# Cyclic order, not just connectivity, decides a reserve switch

Partial work on [Erdős #585](https://www.erdosproblems.com/585). It explains why the [bridge-tree data](SHARED-RESERVE-BRIDGES.md) and the [parity test](FIXED-MATCHING-PARITY.md) do not determine whether a cycle cover can merge.

## Exact face-count formula

Take pairwise edge-disjoint perfect matchings $`M,N,R`$ in a bipartite graph on equal sides. Use $`M`$ to identify both sides with $`n`$ labels, then write $`p`$ for the permutation of $`N`$ under this identification. Choose some alternating components of $`N\cup R`$, switching $`N`$ to $`R`$ on those components only. The new matching has permutation $`p\tau`$, where $`\tau`$ is the product of the relative cycles of the chosen switches and fixes all other labels.

Form a bipartite ribbon graph whose black vertices are the cycles of $`p`$, white vertices the cycles of $`\tau`$ (including fixed points), and edges the labels $`1,\ldots,n`$, joining the two cycles containing each label. The rotation at a black or white vertex is the corresponding permutation order. By the standard permutation model for orientable ribbon graphs, its boundary walks correspond to the cycles of $`p\tau`$: starting from a black dart, two successive vertex/edge steps enact the two cyclic orders. Let $`q`$ be its number of connected components and $`g_{\mathrm{rib}}`$ the sum of the genera of the connected surfaces obtained by capping its boundary circles. Then the Euler characteristic gives

```math
c(p\tau)=2q+n-c(p)-c(\tau)-2g_{\mathrm{rib}} .
```

Here $`c(\pi)`$ counts all cycles of a permutation, including fixed points. Thus the new factor is Hamiltonian exactly when the ribbon graph is connected and its first Betti number $`n-c(p)-c(\tau)+1`$ equals $`2g_{\mathrm{rib}}`$. A tree is sufficient; connected incidence with even excess need not suffice. This is an application of the standard ribbon construction, related to [circuit-nullity formulas](https://arxiv.org/abs/0903.4405), not a new topological identity.

For example, with two old cycles and one switch meeting each of them twice, ignore the fixed-point leaves. On the four selected labels the first-return permutation of the old factor is $`(a\,a')(b\,b')`$. A switch of cyclic order $`(a\,b\,a'\,b')`$ gives one cycle, whereas order $`(a\,a'\,b\,b')`$ gives three. Deleting the fixed-point labels from this calculation does not change the count within affected cycles: each gap just names an unchanged segment of the original permutation.

## Positive and negative instances with the same quotient data

For every girth threshold, there exist two simple bipartite cubic graphs with matchings $`M,N,R`$, identical old cycle lengths, identical reserve quotient (including loops and multiplicities) and one even-half-length alternating switch. In one graph the switch joins the two old cycles; in the other it yields three cycles. Thus the difference is not detected by quotient connectivity or by the necessary parity change.

For an explicit seed, index both sides by $`0,\ldots,5`$, take $`M`$ the identity and $`N=(1,0,3,4,5,2)`$ in list notation, then use the respective reserve list
- $`R_+=(2,3,1,5,0,4)`$;
- $`R_-=(2,4,0,5,1,3)`$.

In either graph the three matchings are pairwise edge-disjoint; $`M\cup N`$ is the union of cycles of lengths four and eight; $`N\cup R_\pm`$ is a single 12-cycle. The reserve has four edges crossing between those two old components and two within the larger one. But the permutation of $`R_+`$ is a 6-cycle and the permutation of $`R_-`$ consists of three 2-cycles. Accordingly $`M\cup R_+`$ is Hamiltonian and $`M\cup R_-`$ consists of three cycles.

In each graph, use the [overlapping-cycle lift lemma](OVERLAPPING-CYCLE-LIFTS.md) with all the designated cycles: those of $`M\cup N`$, the cycle $`N\cup R_\pm`$, and those of $`M\cup R_\pm`$. Choose the same sufficiently large prime sheet number $`s`$ for both graphs. Every designated cycle has a connected preimage in its own lift, and the girth can be arbitrarily high. The old cycle lengths in each lift are $`4s,8s`$; the single switch has half-length $`6s`$; there are $`4s`$ crossing reserve edges and $`2s`$ loops at the same quotient vertex. Nevertheless the only nonempty switch selection merges in one case and splits into three in the other.

The examples concern a prescribed perfect-matching switch. They do not say that replacing edges from both halves, or finding cycles on a different support, is impossible.

## A sufficient tree of long switches

This version permits several contacts in each old cycle, rather than requiring a switch to touch each cycle once. Choose distinct alternating components of $`N\cup R`$, with disjoint contact sets, and let each selected switch meet exactly two old $`p`$-cycles. Regard it as an edge between those two cycles. Suppose:

1. These edges form a tree on the old cycles.
2. For each switch $`e`$, the first-return permutation of its two endpoint cycles on the contacts of $`e`$, multiplied by $`\tau_e`$ on those contacts, is a single cycle.
3. At every old cycle, the contact sets of incident switches appear as consecutive blocks in the cyclic order restricted to all selected contacts.

Then performing all selected switches gives a single cycle. For the proof, eliminate a leaf and its incident switch. In the leaf there are no contacts for other remaining switches. In the neighbour, all remaining contacts lie in one gap between contacts of this switch, by the block condition. The switch only changes successor edges at its own contacts. Condition 2 merges the two current cycles, while the unchanged gap keeps the original cyclic order of every surviving contact at the neighbour. Thus one may regard the merged cycle as the neighbour and continue inductively. The switches on distinct contact sets commute as relative permutations, so the final factor is independent of the chosen leaf order. More generally, it is enough that the single-gap property hold for the remaining contacts at every step of some leaf order; the original block condition is a convenient sufficient test.

Condition 2 can allow arbitrarily many contacts. For instance, let the two first-return cycles be $`A_0,\ldots,A_{m-1}`$ and $`B_0,\ldots,B_{m-1}`$ with cyclic successor $`+1`$ in each, and let the switch order be $`A_0,B_0,A_1,B_1,\ldots,A_{m-1},B_{m-1}`$. The product maps $`A_i`$ to $`B_{i+1}`$ and $`B_j`$ to $`A_{j+2}`$, with indices modulo $`m`$. On the $`A`$-labels its square adds three, so the product is one cycle whenever $`\gcd(m,3)=1`$, including arbitrarily large $`m`$.

For two initial edge-disjoint factors, apply this separately with different matching reserves, or with switches using disjoint reserve edges. Both outputs are then spanning cycles on the same support, with disjoint edges. The contact and block conditions are not known to follow from ordinary quotient connectivity or from the log-log density assumption.
