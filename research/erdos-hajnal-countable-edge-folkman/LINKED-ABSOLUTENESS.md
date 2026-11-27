# Linked-forcing absoluteness

For μ infinite and finite 3≤t<s, consider the assertion that some K_s-free graph G arrows K_t under μ edge colours. It is invariant under any forcing which is the union of μ many families in each of which every at most binom(s,2) conditions have a common extension. In particular the [Erdős–Hajnal countable edge Folkman problem](https://www.erdosproblems.com/595) cannot be changed by σ-6-linked forcing. This includes any σ-centred forcing, such as adding one Cohen real. This is an absoluteness theorem, not a construction of a ZFC witness.

## Upward: preserve each old witness

Suppose G is a ground witness and p forces that a named μ-edge-colouring avoids monochromatic K_t. For each edge e choose p_e≤p deciding its colour n_e and choose an index i_e of a linked family containing p_e. Colour the ground edge e by (i_e,n_e), using μ colours. In a ground monochromatic K_t the corresponding conditions all belong to the same family and there are at most binom(s,2) of them. Their common extension forces a monochromatic K_t of the named colouring, contradicting p. K_s-freeness of a fixed ground graph is absolute because a finite clique is a finite tuple of ground vertices.

This direction only needs linkage for binom(t,2) conditions.

## Downward: extract a ground witness from any forced one

Work below p forcing a K_s-free witness on a fixed ordinal θ (relabel in the extension and strengthen to decide its vertex-set size). For each pair e of elements of θ that can be forced to be an edge, choose one condition p_e≤p forcing it. For each linked family i, use the ground graph G_i on θ containing the pairs for which the associated condition was assigned index i. Each G_i is K_s-free: a forbidden clique would give binom(s,2) linked conditions whose common extension forces this clique.

If every G_i has an avoiding μ-colouring c_i, in the extension colour each edge of the witness by (i,c_i(e)), using its ground assigned i. Every actual edge is among the possible edges, hence has an assignment; it does not matter if the chosen p_e is in the generic filter. A monochromatic K_t would lie wholly in one G_i and be monochromatic for c_i. This contradicts the forced arrow. Therefore some G_i is a ground witness.

The downward proof only needs a linked cover of the particular family of chosen conditions p_e, not of the whole forcing. In the finite palette version one must keep the product of the palette sizes; the conclusion above uses μ·μ=μ.

[#1090](https://github.com/1337isnot1337/solved-conjectures/issues/1090)
