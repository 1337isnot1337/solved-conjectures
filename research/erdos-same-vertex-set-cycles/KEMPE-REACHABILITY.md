# Two-colour swaps cannot always reach a Hamilton decomposition

Partial work on [Erdős #585](https://www.erdosproblems.com/585). This addresses an algorithm that changes **both halves** of the two factors, but does so only through two-colour matching swaps. It differs from the earlier [fixed-half obstruction](FIXED-MATCHING-PARITY.md).

**Theorem.** For every girth threshold, a simple bipartite 4-regular graph has a Hamilton decomposition and also a decomposition into four perfect matchings from which no sequence of two-colour Kempe switches can reach a Hamilton decomposition, even if the four colours may be paired differently at the end. In these examples a single simultaneous recolouring of three colour classes suffices. The result concerns reachability, not absence of cycle pairs.

## Invariant and local parity formula

Number the two sides of a bipartite graph independently. To a proper four-edge-colouring $`F`$ of a quartic graph associate $`\varepsilon(F)`$, the product of the signs of its four matching bijections. A two-colour Kempe switch exchanges the two matchings along one alternating component. Both signs change by the same factor $`(-1)^{\ell-1}`$, where $`2\ell`$ is the component length. So $`\varepsilon(F)`$ is invariant under every sequence of such switches. These are the usual edge-Kempe moves; see [Belcastro and Haas, Switching 3-edge-colorings of cubic graphs](https://doi.org/10.1016/j.disc.2022.112830) and [the study of perfect pairs in 5-regular graphs](https://doi.org/10.1016/j.jctb.2021.04.005) for related reconfiguration questions. Only the elementary sign calculation is needed here.

If two matchings form a Hamilton cycle on $`2n`$ vertices, their sign product is $`(-1)^{n-1}`$, the sign of their relative permutation. Thus any pairing into two Hamilton cycles requires $`\varepsilon(F)=+1`$, independent of $`n`$ or ordering of the vertex labels. Equivalently, for any two prescribed pairs of colours whose cycle counts are $`c_1,c_2`$, the sign product is $`(-1)^{c_1+c_2}`$.

There is also a local expression for an arbitrary change of factorization. At vertex $`v`$, let $`\pi_v`$ send the old colour of each incident edge to its new colour. Then the sign ratio is $`\prod_v\operatorname{sgn}(\pi_v)`$. Indeed, view a factorization as the permutation from (left vertex, colour) to (right vertex, colour) determined by its edges. After both copies of the pairs are ordered by colour first, its sign is exactly the product of matching signs. When updating the factorization, first convert new colours to old colours locally at the left endpoints, run the old permutation, then convert old colours to new colours locally on the right. This gives the stated ratio and identifies exactly what a multi-colour trade must change to escape the invariant.

## High-girth family with a three-colour escape

Use the bipartite graph $`K_{5,5}`$ minus the identity matching. The following rows list right partners of left indices $`0,1,2,3,4`$. The two decompositions share their first matching.
 
| Class | Negative sign product | Positive sign product |
|---|---|---|
| 1 | 1, 0, 3, 4, 2 | 1, 0, 3, 4, 2 |
| 2 | 2, 3, 4, 0, 1 | 2, 3, 4, 1, 0 |
| 3 | 3, 4, 1, 2, 0 | 3, 4, 0, 2, 1 |
| 4 | 4, 2, 0, 1, 3 | 4, 2, 1, 0, 3 |

Every row is a permutation and both sets of rows give four matchings partitioning the graph. Pair rows 1–2 and 3–4 on each side of the table. The negative column has cycle counts two and one, and the positive column has one and one. These counts follow from the cycles of the relative permutations.

Apply [the overlapping-cycle lift theorem](OVERLAPPING-CYCLE-LIFTS.md) to all five cycles involved, so each has a connected preimage in the same cover, of arbitrarily large girth. The two factorizations lift to factorizations of the same graph, still sharing their first matching; the cycle counts are preserved. Thus the first cannot reach the second, or any Hamilton decomposition, by two-colour switches. The second is reached by a simultaneous change confined to colour classes 2, 3 and 4. Changing only two classes, even all at once, is not enough to escape the invariant, since in these two classes every alternate factorization is a choice of components of their alternating union.

Finally, in a proper recolouring using the same number of perfect matching classes, the subgraph of changed edges has minimum degree at least two on its nonempty vertex set: no local permutation of colours can change exactly one edge. The change therefore contains a cycle and uses at least the girth many edges. In this family a successful recolouring may need a move on both **three colour classes** and **arbitrarily many edges** if it is to escape the sign obstruction without extra temporary classes. This does not forbid more general approaches that use a spare colour, change support, or leave the fixed regular host.
