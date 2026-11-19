# Frankl generating-family formalization

Work is coordinated in [issue 19](https://github.com/1337isnot1337/solved-conjectures/issues/19) and [issue 20](https://github.com/1337isnot1337/solved-conjectures/issues/20).
The full `k ≥ 15` theorem is checked: in every finite `k`-uniform generating family with exactly three generators through each point and pairwise intersections of size at most one, every point belongs to at least `657/1000` of the distinct unions, including the empty union. The full high-girth bound is also checked for every `k ≥ 3`: every point has frequency at least `518208/1000000` when the incidence graph has no cycle shorter than sixteen. The cyclic span-four theorem remains incomplete.
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

## Complete Frankl high-girth frequency theorem

`FranklHighGirth.high_girth_generator_frequency` proves the full
`518208/1000000` bound for every point of a finite `k`-uniform generating
family, for every `k ≥ 3`, with exactly three indexed generators through each
point and no incidence cycle shorter than sixteen. The counted family
contains each distinct union once, including the empty union. Finite ground
is derived from the stated regularity assumptions. The small-degree cases
use all twelve checked K03–K14 cone certificates and actual graph-ball
configuration counts; the large-degree case derives linearity from the
girth assumption and applies the accepted `657/1000` bound.

The graph proof identifies the radius-seven incidence ball with its recursive
tree, transports actual boundary-conditioned independent-set configurations,
and averages the finite fiber bounds. There is no unproved recurrence,
counting identity, finite-certificate assertion, or numerical bound in the
final theorem's hypotheses. The `girth` and extended-`egirth` formulations
and the frequency bound after removing the empty union are also checked.

At source commit `f421f4434ffc8117a57a14b99c19818e76dcfd8e`, all 64 project
modules passed fresh strict compilation. The explicit import-all audit
covered 1,363 owned declarations, including 909 theorems, and all 35 required
endpoints. Exact replay with the pinned, unchanged stock checker passed in
72.750 seconds, with peak RSS 12,834,268 KiB. Every recorded source, object
facet, compiler, checker, and gate hash was unchanged after checking.

[Original receipt](verification/frankl-components-44516856625/high-girth-theorem.json) ·
[Hosted run](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44516856625).
The original receipt SHA-256 is
`e872e48c8199c0c713d6a9cbc50e3d9ef42d8e32ed62e418ddcd282e104f65cf`.
All modules in this theorem's closure are registered in the shared package. Its full merged-package build and replay are a separate gate.
The cyclic span-four theorem remains incomplete, so the Frankl result entry
remains partial. Li remains last.

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
