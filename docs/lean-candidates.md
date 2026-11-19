# Candidate Lean checks

The `Lean candidate proofs` workflow checks new proof modules separately from
the accepted root imports. A candidate is not a completed collection result.
Acceptance also requires exact statement review, registration in `Conjectures`,
required endpoint checks in `ProofAudit`, and the ordinary kernel-recheck gate.

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
| `four-17` through `four-61` | Ten prime residue covers and their exhaustive lifting trees |
| `four-assembly` | Primitive four-speed classification up to 5832; scaling reduction with the global cutoff still an explicit hypothesis |
| `kz-9` through `kz-13` | Exact subset certificates for the five product problems |
| `kz-assembly` | Product minimization under the stated positive prefix-sum and adjacent-ratio constraints |

The KZ arithmetic theorem does not supply the separate lattice-geometric
existence and distance bounds. The higher-speed example and family theorems do
not establish that all possible configurations are listed.

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
