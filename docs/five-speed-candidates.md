# Five-speed finite classification candidates

These files are outside the accepted imports, axiom-audit roots, and replay
registration. They do not yet establish the complete five-speed classification.
Work is coordinated in [issue 7](https://github.com/1337isnot1337/solved-conjectures/issues/7).

The candidate workflow separates five source closures:

| Job | Scope |
| --- | --- |
| `relations` | All 1,225 unordered pairs from the 50 positive additive-relation forms, plus the special 134 case; exact integer projection or zero/repeated-coordinate certificates |
| `fiber-small` | The scalar table at prime 53 and all 55 affine fibers of canonical map 8 |
| `fiber-large` | The scalar table at prime 1789 and all 1,791 affine fibers of canonical map 1 |
| `mask-scan` | Soundness of removing fifth-coordinate residues with common modular multiplier witnesses |
| `projective` | Transfer from the three checked affine charts to arbitrary signed integer parameter vectors |

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

The generic linear projection core already has a local source pass, a
38-theorem axiom audit, and a stock kernel replay. The relation data and generic
case soundness also have local source passes. The complete finite relation
family, mask families, and projective adapter still require the workflow gates.

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
