# A parity barrier to merging cycles through one reserve matching

Partial work on [Erdős #585](https://www.erdosproblems.com/585). This rules out a particular conversion of cycle covers to spanning cycles, even when the [shared-reserve bridge criterion](SHARED-RESERVE-BRIDGES.md) gives path seeds.

Let the perfect matchings $`M,N,R`$ of a simple bipartite graph be pairwise edge-disjoint. Keep $`M`$ fixed and try to merge the cycles of $`M\cup N`$ by replacing $`N`$ with another perfect matching using only $`N\cup R`$. Each alternating component of $`N\cup R`$ offers the choice to keep its $`N`$-edges or take its $`R`$-edges. Identify both bipartition classes by $`M`$, so the other matchings are permutations on one class. If a switched alternating component has $`2\ell`$ vertices, its switch changes the permutation sign by $`(-1)^{\ell-1}`$, because the relative permutation on its $`\ell`$ domain vertices is one cycle. In particular, if **all** alternating components have odd $`\ell`$, then every switch selection preserves the parity of the number of cycles in the factor with $`M`$: a permutation on $`n`$ symbols with $`c`$ cycles has sign $`(-1)^{n-c}`$. If the original factor has even $`c`$, no such selection can make it Hamiltonian.

## Example in any girth with arbitrary reserve connectivity in both colours

For every girth threshold, there is a simple bipartite 5-regular graph with two designated disjoint spanning 2-factors and a reserve matching such that:
- Each factor has exactly two components, and the reserve joins those two components with arbitrarily many edges in each factor's quotient.
- In **neither** factor can one reach a Hamilton cycle by keeping its designated half fixed and replacing the other half from its union with the reserve.

To construct it, index both sides by $`0,1,\ldots,6`$, writing each matching as the list of right partners of the left vertices in order. Use
- $`M=(0,1,2,3,4,5,6)`$, $`N=(1,0,3,4,5,6,2)`$, $`R=(3,5,0,2,6,4,1)`$;
- $`A=(2,4,5,6,3,1,0)`$, $`B=(6,3,1,5,0,2,4)`$.

The five rows are pairwise edge-disjoint perfect matchings of the resulting graph. The cycle partitions on the left of $`M\cup N`$ and $`A\cup B`$ come from the permutations $`M^{-1}N=(0,1)(2,3,4,5,6)`$ and $`A^{-1}B=(0,3,2,5)(1,4,6)`$. Moreover $`N^{-1}R=(0,2,1,4,5,3,6)`$ and $`B^{-1}R=(0,1,3,5,6,2,4)`$, so $`N\cup R`$ and $`B\cup R`$ are both Hamilton cycles. The reserve has four edges crossing the first component partition and six crossing the second. These counts compare the colour-component labels of the left endpoint $`i`$ and the left preimage of the right endpoint $`R(i)`$ under $`M`$, respectively under $`A`$.

Use the [overlapping-cycle lift lemma](OVERLAPPING-CYCLE-LIFTS.md) to take a cover of arbitrarily large odd prime sheet number $`s`$ and of any prescribed girth, in which each of the six base cycles just specified has a connected preimage. This is valid even though the selected cycles can share edges. Every base matching lifts to a perfect matching. Each quotient still has two vertices, and the reserve has $`4s`$ or $`6s`$ crossing edges, respectively. The disjoint-bridge-tree criterion passes: choose a bridge for the first factor and a distinct one for the second. The graph genuinely has two common-support paths by the bridge lemma.

But the only alternate choice for $`N`$ from $`N\cup R`$ is $`R`$ itself, since this union remains one alternating cycle. That cycle has odd half-length $`7s`$, so the parity barrier keeps the number of components even in the first factor. The same argument applies to $`B\cup R`$ in the second factor. This example does not say that the graph lacks all spanning cycle pairs, or that modifying both halves of a factor cannot work. It shows that arbitrary quotient reserve connectivity and a path seed do not justify a proof that keeps one entire matching fixed and switches only through one reserve matching.
