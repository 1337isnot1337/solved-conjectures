# A parity barrier to merging cycles through one reserve matching

Partial work on [Erdős #585](https://www.erdosproblems.com/585). This rules out a particular conversion of cycle covers to spanning cycles, even when the [shared-reserve bridge criterion](SHARED-RESERVE-BRIDGES.md) gives path seeds.

Let the perfect matchings $`M,N,R`$ of a simple bipartite graph be pairwise edge-disjoint. Keep $`M`$ fixed and try to merge the cycles of $`M\cup N`$ by replacing $`N`$ with another perfect matching using only $`N\cup R`$. Each alternating component of $`N\cup R`$ offers the choice to keep its $`N`$-edges or take its $`R`$-edges. Identify both bipartition classes by $`M`$, so the other matchings are permutations on one class. If a switched alternating component has $`2\ell`$ vertices, its switch changes the permutation sign by $`(-1)^{\ell-1}`$, because the relative permutation on its $`\ell`$ domain vertices is one cycle. In particular, if **all** alternating components have odd $`\ell`$, then every switch selection preserves the parity of the number of cycles in the factor with $`M`$: a permutation on $`n`$ symbols with $`c`$ cycles has sign $`(-1)^{n-c}`$. If the original factor has even $`c`$, no such selection can make it Hamiltonian.

## Example in any girth and with arbitrarily many reserve bridges

For every girth threshold, there is a simple bipartite 5-regular graph with two designated disjoint spanning 2-factors and a reserve matching such that:
- The first factor $`M\cup N`$ has two components, the second factor is a Hamilton cycle, and the reserve joins the two components of the first factor with arbitrarily many edges.
- Neither keeping $`N`$ nor making any valid replacement for it from $`N\cup R`$ makes the first factor Hamiltonian while keeping all of $`M`$.

To construct it, start with $`K_{5,5}`$ indexed on both sides by $`0,1,2,3,4`$, writing each matching as the list of right partners of the left vertices in order. Use
- $`M=(0,1,2,3,4)`$, $`N=(1,0,3,4,2)`$, $`R=(2,3,4,1,0)`$;
- $`A=(3,4,0,2,1)`$, $`B=(4,2,1,0,3)`$.

The five rows give perfect matchings and partition the edges. The two components of $`M\cup N`$ have index sets $`\{0,1\}`$ and $`\{2,3,4\}`$ on each side. The permutation $`N^{-1}R`$ is $` (0,4,1,2,3)`$ in cycle notation, and $`A^{-1}B`$ is $` (0,1,3,2,4)`$ in cycle notation; thus $`N\cup R`$ and $`A\cup B`$ are Hamilton cycles. The matching $`R`$ has four edges crossing between the two components of $`M\cup N`$.

Use the [overlapping-cycle lift lemma](OVERLAPPING-CYCLE-LIFTS.md) to take a cover of arbitrarily large odd prime sheet number $`s`$ and of any prescribed girth, in which each of these four base cycles (two from $`M\cup N`$ and the two specified Hamilton cycles) has a connected preimage. This is valid even though the selected cycles can share edges. Every base matching lifts to a perfect matching, denoted by the same label. The reserve quotient for the first factor now has two vertices and $`4s`$ crossing edges. The other factor is still Hamiltonian and has only one quotient vertex. In particular the disjoint-bridge-tree criterion passes: it requires one edge in the first quotient and none in the second. The graph genuinely has two common-support paths by the bridge lemma.

But the only alternate choice for $`N`$ is $`R`$ itself, since $`N\cup R`$ remains one alternating cycle. Its half-length is $`5s`$, which is odd. The parity barrier therefore keeps the number of components even in the first factor. This example does not say that the graph lacks all spanning cycle pairs, or that modifying both halves of the first factor cannot work. It shows that arbitrary quotient reserve connectivity and a path seed cannot justify a proof that keeps one entire matching fixed and switches only through one reserve matching.
