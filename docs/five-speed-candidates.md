# Five-speed finite classification candidates

These files are outside the accepted imports, axiom-audit roots, and replay
registration. They do not yet establish the complete five-speed classification.
Work is coordinated in [issue 7](https://github.com/1337isnot1337/solved-conjectures/issues/7).

The candidate workflow separates these source closures:

| Job | Scope |
| --- | --- |
| `relations` | All 1,225 unordered pairs from the 50 positive additive-relation forms, plus the special 134 case; exact integer projection or zero/repeated-coordinate certificates |
| `fiber-small` | The scalar table at prime 53 and all 55 affine fibers of canonical map 8 |
| `fiber-tree-small` | Direct scalar-tree lookup and two finite proof blocks for the same prime-53 plane cover |
| `fiber-tree-large` | Direct scalar-tree lookup and 56 finite proof blocks for all 1,791 affine fibers of canonical map 1 at prime 1789 |
| `mask-scan` | Soundness of removing fifth-coordinate residues with common modular multiplier witnesses |
| `projective` | Transfer from the three checked affine charts to arbitrary signed integer parameter vectors |
| `plane-lift` | A distinct-prime product exceeding the product of explicit form bounds forces an exact integer parameter relation |
| `root-star` | The normalized root cover at prime 179, using only pair-ratio constraints incident to the coordinates 1 and b |
| `line-reduction` | All 200 parameter lines, their 164 retained maps, critical/repeated cases, and map-specific primitive-parameter cutoffs |

Each job compiles every local source in its import closure with warnings treated
as errors, audits all owned theorem declarations transitively, and runs the
unmodified pinned kernel checker on every local module. The permitted axioms
are `propext`, `Classical.choice`, and `Quot.sound`. Receipts bind the source,
configuration, checking scripts, and compiled artifacts by SHA-256.

The scalar table is checked by exact geometric-sum congruences. Fiber tokens
refer to those shared masks; the fiber checker verifies every root, inverse,
and covered residue. The largest prototype uses 10,004 multiplier tokens and
31 whole structural fibers. These are proposed certificate data until all
source, axiom, and kernel gates pass.

The relation generator searches for integer payloads. Each payload is then
checked in Lean as an explicit matrix identity. Its result preserves the
original coordinate bound through signed coordinate selectors. Python search
results and assertions are not proof premises.

At commit `06747c7`, the `fiber-small` and `mask-scan` jobs passed their complete
source, ownership-axiom, and stock-kernel gates. Every finite relation block
compiled; its aggregate needed an explicit final finite bound. That repair is
in `39cac2d`. The final signed-projective source repair in `9b93b89` compiles
locally and remains subject to its full candidate gate.

The legacy single-theorem large fiber check exhausted the kernel's 4.5 GB
memory allowance. Its source remains an unregistered historical candidate.
The replacement uses a counted scalar tree and separate 32-label checks.
Its lookup equivalence and interval assembly preserve exactly the same
`CanonicalProjectiveCover` conclusion; balanced lookup and the block size
are performance choices, not proof premises.

The root prototype uses prime 179, the smallest prime in the proposed root
prime list. Prime 53 works for the small plane case but fails the root cover.
The root checker enumerates a superset of normalized quintuples by retaining
only the pair-ratio constraints involving 1 and b. Every removed fifth
residue has a checked modular witness; each remaining residue must pass the
literal 80-form or folded-134 structural predicate. Each base-coordinate
check has its own finite theorem.

The generic linear projection and elimination cores have local source,
ownership-axiom, and stock-kernel receipts. The complete line candidate uses
166 retained occurrences representing 164 maps, 22 critical 1234 cases,
eight critical 1347 cases, and four repeated-coordinate cases. Its map
representation theorem preserves the primitive direction and the actual
loneliness value. The parameter cutoff theorem explicitly assumes
`CoordinateSubspace.FourSpeedGap`; the classification theorem must discharge
that premise before it can count as complete.

The new tree, root, plane-lift, and complete line closures are candidates.
Local source passes for some components do not establish a full gate pass.

The remaining classification work includes the normalized modular root covers,
their integer prime-product lift, the nine intermediate plane covers and their
prime-product lifts, the 200 line reductions, and the final bounded direction
certificates. The accepted five-speed cutoff and critical-plane reduction are
separate prerequisites. Li has not been started.

Run one candidate family from the repository root with:

```bash
python3 scripts/verify_five_speed_candidates.py relations
```

Use `--plan` to inspect its exact local import closure without starting Lean.
Affected families are selected by changed source dependencies, so unrelated
candidate changes do not restart all of these jobs.
