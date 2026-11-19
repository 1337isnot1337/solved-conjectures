# Frankl generating-family formalization

Work is coordinated in [issue 19](https://github.com/1337isnot1337/solved-conjectures/issues/19).
The full `k ≥ 15` theorem is checked: in every finite `k`-uniform generating family with exactly three generators through each point and pairwise intersections of size at most one, every point belongs to at least `657/1000` of the distinct unions, including the empty union. The cyclic span-four theorem and the `3 ≤ k ≤ 14` high-girth cases remain incomplete.
Li remains deferred until the other results are fully verified.

## Complete large-generator bound

The accepted theorem is `Frankl.Large.large_generator_frequency`.
For generators `G : ι → Finset α`, it assumes finite `ι`, `k ≥ 15`,
`card (G e) = k`, exactly three indexed generators through every point,
and `card (G e ∩ G f) ≤ 1` for distinct indices. It concludes

```text
657 * card (family (univ.image G))
  ≤ 1000 * card ((family (univ.image G)).filter (a ∈ ·))
```

for every ground point `a`. The family contains each distinct union once,
including the empty union. It does not weight generator representations.

The proof derives the event bound and lopsided dependence by Harris slicing,
counts the actual local selections, establishes the query independence, and
transfers the canonical selections through a proved bijection.
The exact 16-module closure passed strict source checks, all 231 theorem
declarations' transitive axiom audit, and independent pinned-kernel replay at
`663f72751f7cfb13e533050985072e59204cbd26`.
The source hashes and job link are recorded in
[the receipt](frankl-large-hosted-receipt.json).
All modules in that closure are registered; the full merged-package run is a
separate gate.

## Earlier accepted components

The six initial modules passed their exact hosted gates at
`57d699c770471fc898850079bde384a269da5d4f`.
They prove distinct-union semantics, exact local boundary fibers, the
weighted local-certificate implication, the incidence-graph bijection,
finite lopsided conditioning, and the numerical estimates.
[Initial receipt](frankl-foundations-hosted-receipt.json).

## Small-generator high-girth proof in progress

The candidate sources prove the actual radius-seven ball is a tree under
girth at least sixteen, graph-level configuration factorization, the
three-state counting recurrence, conic propagation, mixed-child root bounds,
and soundness of exact integer-span certificates.
Certificates for all twelve degrees from three through fourteen are
generated. Several already pass strict Lean checking; each remaining degree
must pass ordinary kernel computation and the complete candidate gates.

The current graph work connects actual ball decomposition, boundary
conditioning and the finite recurrence. None of these intermediate results
is being counted as the completed high-girth frequency theorem.

## Cyclic span-four proof in progress

The candidate sources prove local-certificate soundness, singleton/two-set
and two-neighbor shortcuts, finite support/core enumeration, literal cyclic
window semantics, and rank certificates for closed walks.
The finite window weights and graph reductions still need their complete
Lean checks and final assembly.

A separate finite computation checked all 38,044 eligible wrapped-window
cases for cycle lengths at most ten with the original weights. This is a
candidate route to removing the written proof's use of the published
eleven-element theorem; it is not yet an accepted Lean proof.
The three-common-point-triples theorem is being proved internally with
exact finite union-closed extension certificates. No published theorem is
silently treated as an axiom.
