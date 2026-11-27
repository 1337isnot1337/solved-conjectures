# Independent mathematical review

A separate read-only reviewer reconstructed the graph and checked
every case of 2K₂-freeness. The reviewer rederived the color-choice
bijection, checked the three deletion types, and confirmed the
path obstruction and the exact consequences for Conjectures 7.3
and 7.4. The written construction passes for all stated group
sizes, without requiring computation.

The separate implementation checked all 5,985 four-vertex sets
and 21 deletion colorings of the two-group witness. For the
four-group binary witness, it checked all 20,475 four-vertex
sets and 28 deletion colorings. Exact subset dynamic programming
also verified that the two-group witness has no spanning path.

The reviewer separately verified the attribution to
[Rzążewski, §4](https://arxiv.org/html/2608.17835v3#S4):
the independent witnesses in the two-group specialization
are each necessary for non-8-colorability. An independent
reconstruction checked all 10,000 state/witness pairs for input
groups of size ten. This confirms the earlier implicit family
at every fixed chromatic number at least nine, as discussed in
[SELECTORS.md](SELECTORS.md).

No earlier explicit resolution of the two exact statements was
found in the reviewer’s bounded search. That does not establish
priority; the earlier selector gadgets are credited in the main
audit. This review is a project audit, not journal refereeing or
author endorsement. Neither this review nor the finite replays
are a Lean formalization.
