# Candidate Lean checks

The `Lean candidate proofs` workflow checks new proof modules separately from
the accepted root imports. A candidate is not a completed collection result.
Acceptance also requires exact statement review, registration in `Conjectures`,
required endpoint checks in `ProofAudit`, and the ordinary kernel-recheck gate.

The `base`, `product`, deterministic `hyperplane`, and complete `four-*` scopes
have since been registered in the accepted package. The separate jobs remain available to
check changes to those components. The other lanes retain their candidate
status unless the accepted-scope report records a later registration.

Each job builds its project dependencies in order, audits all imported project
theorems, including private declarations, for the three allowed standard axioms,
rejects project axiom declarations, and independently replays those
modules with `leanchecker`. The only allowed axioms are `propext`,
`Classical.choice`, and `Quot.sound`. No native-computation axiom is allowed.

The candidate lanes are:

| Lane | Scope |
| --- | --- |
| `base` | Graffiti.pc318 and its sharpness example; consecutive families, higher-speed examples, exceptional eight-speed families, prefix-product bounds, modular search helpers |
| `product` | Classification and values within the three stated eight-speed product families |
| `hyperplane` | Exact shifted maximum over the containing real hyperplane, attainment, and the bound for orthogonal integer velocities |
| `hyperplane-haar` | Distribution of the predicted hyperplane maximum under Haar-uniform shifts; uniform finite-character approximation on compact subsets of the torus |
| `modular-closed` | Closed-threshold binary search soundness, with the lower-dimensional runner bound and finite certificate explicit |
| `nearest-plane` | Euclidean rounding to an actual integer combination, with the squared Gram–Schmidt error bound |
| `primitive-basis` | Completion of a primitive integer vector to an integer basis |
| `small-kz` | Exact subset-product arithmetic for the smaller-speed norm cutoffs, with geometric inputs explicit |
| `four-17` through `four-61` | Ten prime residue covers and their exhaustive lifting trees |
| `four-assembly` | Primitive four-speed classification up to 5832, the independent all-size cutoff, and the resulting unconditional four-speed gap theorem |
| `kz-9` through `kz-13` | Exact subset certificates for the five product problems |
| `kz-assembly` | Product minimization under the stated positive prefix-sum and adjacent-ratio constraints |

The KZ arithmetic theorem does not supply the separate lattice-geometric
existence and distance bounds. The higher-speed example and family theorems do
not establish that all possible configurations are listed. The hyperplane lane
does not prove the finite-exception, probability, distribution, or counting
assertions in that result.

The workflow selects lanes by the changed files and each lane's full project
dependency closure. Changes to the checker, workflow, toolchain, or package
configuration run every lane. This avoids restarting unrelated finite tables
when another proof worker adds a module. Manual dispatch also runs every lane.

Run one lane locally with:

```sh
python3 scripts/verify_lean_candidate.py base
python3 scripts/verify_lean_candidate.py four-17
python3 scripts/verify_lean_candidate.py kz-9
```

Use `--plan` to inspect the module dependency order without running Lean.
Assembly jobs reuse only artifacts uploaded after all three checks succeeded in
the same workflow run. The receipt checks the commit, every project source hash,
the pinned package configuration, and every reused artifact hash. Lake then
checks its normal dependency traces; the assembly job also repeats the axiom
audit and independent kernel replay.

The ordinary accepted-proof workflow remains unchanged. Li is still deferred
until the other collection results are complete.
