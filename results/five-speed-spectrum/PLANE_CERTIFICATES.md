# Finite critical-plane certificates

The complete finite matrix passed source compilation, separate kernel replay,
and the transitive axiom audit in [run 44446557652](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44446557652).
Every checked source hash matched the local proof sources. The exact receipts
are in [plane-certificate-receipts.json](plane-certificate-receipts.json).
The full finite calculation and its geometric composition are registered in
the accepted root. The plane theorem retains `FourSpeedGap` as an explicit
input; this is not the full five-speed classification. See
[the geometric reduction](PLANE_REDUCTION_LEAN.md).

The finite calculation has 64 blocks. Each block fixes two of the eight
canonical five-coordinate directions obtained by repeating one coordinate
of `[1,2,3,4]` or `[1,3,4,7]`. It checks all 120 permutations and 16 sign
choices for the second direction. The first sign is positive; the later
normalization proof accounts for global sign reversal.

The complete calculation therefore has 122,880 labelled cases. Repeated
coordinates cause duplicates, which are retained in the checked enumeration.

## The proposition being checked

For each pair of canonical indices `i,j`, the generated theorem is:

**Lean excerpt**

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
and prove the logical soundness of the certificate interface. The accepted
geometric normalization connects the finite calculation to every rational
plane under the explicit `FourSpeedGap` hypothesis.

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

Every row passed, and all generated block modules are now included in the
accepted root imports and kernel replay list. The exhaustive classification
of the original five-speed vectors is a separate remaining obligation.

[Run 44447687031](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44447687031)
repeated the same checks and retained the generated sources, compiled Lean
imports, and row receipts as workflow artifacts. The imported artifacts were
checked against GitHub's ZIP digests and the previously verified source hashes.
