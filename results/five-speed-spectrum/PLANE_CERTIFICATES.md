# Finite critical-plane certificates

Status: the complete matrix is pending verification. These support sources
and generated candidates are not registered in the accepted theorem root.

The finite calculation has 64 blocks. Each block fixes two of the eight
canonical five-coordinate directions obtained by repeating one coordinate
of `[1,2,3,4]` or `[1,3,4,7]`. It checks all 120 permutations and 16 sign
choices for the second direction. The first sign is positive; the later
normalization proof accounts for global sign reversal.

The complete calculation therefore has 122,880 labelled cases. Repeated
coordinates cause duplicates, which are retained in the checked enumeration.

## The proposition being checked

For each pair of canonical indices `i,j`, the generated theorem is:

```lean
theorem checkedIJ : ∀ (n : Fin 120) (mask : Fin 16),
  pairTest (canonical i) (tableCandidate j (permutationAt n) mask) = true
```

`pairTest` says that the pair either fails an admissibility test or has a
free coordinate with a critical quadruple on the remaining coordinates.
The admissibility test examines the directions obtained by setting two
coordinates equal or opposite. A tested direction with no zero coordinate
must have one of the two critical absolute supports, up to positive scaling.

The support modules define these tests, prove complete permutation coverage,
and prove the logical soundness of the certificate interface. Connecting
this finite calculation to all rational planes also requires the geometric
normalization and four-speed classification. Those are separate obligations.

## Reproduction

Generate all candidate modules from the repository root:

```bash
python3 results/five-speed-spectrum/generate_plane_certificates.py
```

The default generator uses `decide +kernel`. Lean checks each Boolean
proposition by kernel reduction. Python writes the source text.

The hosted workflow divides the calculation into eight rows. Each row
generates eight modules, compiles their exact sources, replays their compiled
proofs with the pinned `leanchecker`, and audits their transitive axioms.
The permitted axioms are `propext`, `Classical.choice`, and `Quot.sound`.

Run a row locally after installing the pinned Lean toolchain and Mathlib cache:

```bash
python3 scripts/verify_plane_certificates.py --row 0
```

Each successful row prints a `PLANE_CERTIFICATE_RECEIPT` JSON record. The
record contains the commit, generator hash, support-source hashes, and all
eight generated-source hashes. The workflow fails if any stage fails.

The matrix verifies candidates. The generated block modules join the accepted
root imports only after every row passes. A finite certificate alone does
not establish the exhaustive five-speed classification.
