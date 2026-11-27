# Countable centres can all be removed

This sharpens [the infinite-link core](WEDGE-INFINITE-CORE.md) for Erdős–Galvin–Hajnal's 9/B. The lemma works in ZFC and does not use rank bounds on the countable subsets.

**Lemma.** Suppose a wedge family on ω₁ has a distinguished centre for each triple and each leaf pair has at most one centre. Then all wedges whose centre has only countably many leaves in the family form a countably chromatic subhypergraph.

Let S_a be that countable set of leaves at each such centre (empty elsewhere). Let m(b,c) be the centre of the leaf pair {b,c} when defined. Choose a continuous increasing chain of countable subsets (M_ξ:ξ<ω₁) covering ω₁, each closed under taking S_a for a∈M_ξ and under m on pairs in M_ξ. This is possible because there are only countably many closure requests from each countable set; iterate countable closure at successors and take unions at limits.

Partition into the successive difference blocks and colour each countable block injectively by naturals. In a triple with centre a in block ξ, neither leaf can be in a higher block, by closure under S_a. If both leaves were in lower blocks, they would belong to a common earlier stage, which would contain a by closure under m. Thus at least one leaf lies in the same block as a and receives a different colour. This colours the entire indicated subfamily at once. There is no uniform bound on the order types of the S_a, and no appeal to a countable product of colourings.

Combining with finite-degree peeling under RP, an uncountably chromatic 9/B counterexample can be reduced to a wedge core with all active local leaf sets S_a uncountable, each such link of infinite minimum degree on its support, and the protection “two members of S_a in a triple force centre a”. Removing every wedge of a countable centre does not change links at other centres, so no new finite-degree exception is introduced. The remaining global countable-colouring problem concerns uncountable protected blocks.
