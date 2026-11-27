# Arbitrarily large two-token counterexamples

The [counterexample](PROOF.md) rules out not only an exception at one
size: there are arbitrarily large non-complete graphs of both parities
for which the two-token chromatic number is one smaller.

## Join construction

Let $`m\ge2`$ be even and let $`G_1,\ldots,G_m`$ each have chromatic
number $`c\ge2`$ and two-token chromatic number $`c-1`$. Their complete
join $`J`$ adds all edges between different summands. The ordinary
chromatic number of $`J`$ is $`mc`$: proper palettes of different
summands must be disjoint, and disjoint optimal palettes suffice.

Color configurations with both tokens in the same summand using
one common palette of $`c-1`$ colors. Configurations internal to
different summands are disjoint, so they are never adjacent.
For cross-summand configurations, take a decomposition of
the complete graph on the even number $`m`$ of summand indices
into $`m-1`$ perfect matchings. This can be obtained by the
round-robin schedule: use indices consisting of one distinguished
symbol and the residues modulo $`m-1`$. For matching $`t`$, pair
the distinguished symbol with $`t`$ and pair all other residues
whose sum is $`2t`$ modulo $`m-1`$. Every index pair is in exactly
one matching.

Give each matching its own disjoint palette of $`c`$ colors,
also disjoint from the internal palette. For a cross-summand
configuration, use its matching palette and the sum modulo
$`c`$ of the endpoint labels in fixed proper $`c`$-colorings
of the individual summands. Distinct index pairs in a matching
share no index, so their configurations are disjoint. If two
adjacent configurations have the same index pair, then the
changed token stays within one summand and changes its label
along an edge there. The sum changes modulo $`c`$.
The palettes therefore give a proper coloring with
$`(c-1)+(m-1)c=mc-1`$ colors. Conversely, fixing one token
embeds $`J-v`$, which has chromatic number at least $`mc-1`$.
So $`\chi(F_2(J))=mc-1`$.

Take $`c=6`$. Both the eleven-vertex example and the complete
graph $`K_6`$ drop from six to five; for the latter, a perfect
matching decomposition gives the five-coloring of its pairs.
For even $`m`$ and $`1\le j\le m`$, join $`j`$ copies of the example
and $`m-j`$ copies of $`K_6`$. The order is $`6m+5j`$ and the
chromatic numbers are $`6m`$ and $`6m-1`$. With $`j=1`$ the orders
are odd and all missing edges stay in one fixed eleven-vertex
block. With $`j=2`$ the orders are even. Every family member
is non-complete.

This supplementary corollary was found during the independent
internal review. It makes no separate claim of literature
priority for the join lemma.
