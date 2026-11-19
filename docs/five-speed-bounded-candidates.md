# Five-speed bounded and semantic candidates

These candidates extend the five-speed classification pipeline. The concrete
exhaustion theorem remains unfinished. Accepted project roots do not import
these files yet.

## Checked generic reductions

The five root-semantic modules normalize arbitrary modular coordinates, carry
the two-relation and folded `{1,3,4}` alternatives through signs and
permutations, and return an unrestricted modular cover from a normalized
cover. All five sources, the 76-theorem axiom audit, and five separate stock
kernel replays passed locally. Their exact statements and source hashes are
in [ROOT_SEMANTICS_LEAN.md](../results/five-speed-spectrum/ROOT_SEMANTICS_LEAN.md).
A concrete normalized cover remains an explicit input.

`BoundedSlope` and `BoundedSlopeRecovery` reduce a bounded primitive parameter
pair `(x,y)`, with `x > 0`, to its slope modulo a prime. If `2*K < p`, there
is at most one signed representative of `x*r` with absolute value at most
`K`. Both modules passed source compilation, the transitive axiom audit, and
separate stock-kernel replays. The source hashes are:

| Module | SHA256 |
| --- | --- |
| `BoundedSlope` | `fd5d181339d26db98f45941439d0d347f3f508e36b7d11ca0b7b1924b836e54a` |
| `BoundedSlopeRecovery` | `16bce98947ab52954f2b4fc9ffff55f89f619223852ecefe4f6c1e7abd8a8feb` |

`BoundedCheckDefs` combines this recovery with two modular witness tests.
It checks the first modulus on every slope. Every surviving slope is then
checked at each positive bounded first parameter. The terminal alternatives
are a zero coordinate, repeated absolute coordinates, a critical quadruple,
or membership of the primitive direction in an explicit candidate list.
The soundness theorem excludes the first three alternatives under the actual
nondegeneracy and noncriticality hypotheses.

These finite checks use `Modular.absoluteSpeeds`, a computable list. Proved
membership and witness equivalences connect that list to the semantic
`integerSpeeds` definition. No noncomputable finite-set enumeration is used
as an executable checker. The terminal calculation uses structural insertion
sort, with a proved equality to the semantic merge sort. The original merge
sort did not reduce inside the kernel for the bounded prototypes.

## Finite candidates

`BoundedCandidates` contains 407 literal primitive directions. For 395
entries, Lean checks an explicit rational witness giving value at least
`1/5`. The other twelve entries are the proposed sporadic directions.
`candidateTuples_low` therefore reduces a low-value member of this list to
one of those twelve. This theorem does not assert that the list contains
every bounded input. The candidate-table sources compile locally; their
separate hosted axiom and kernel gates are scheduled with the bounded core.

The first bounded-map prototypes are maps 24 and 63 in the exact 164-map
catalogue. Map 63 has the largest row bound, `L = 17`; the parameter bound
is `23*L`. Both prototypes use primes 1009 and 1013. The scalar tables,
all-slope checks, bounded-pair checks, and semantic conclusions are included
in their full hosted dependency checks. Generation alone is not a proof.

The root prototype splits the third coordinate into explicit intervals and
combines those checks by a proved append rule. It tests the folded pattern
before counting zero forms. A bounded binary search selects witness bits;
their bounds and actual membership are checked before any candidate is removed.
This avoids computing `Nat.log2` on a large mask. Equality with the original structural predicate
is proved. The generic block source and the first block at prime 179 compile
locally. This single block does not establish the complete root cover.

## Semantic assembly and distance graphs

The semantic candidates preserve value, critical status, bounds, and primitive
directions through the signed canonical map reductions. They also connect the
twelve exact sporadic values to the spectrum statement. The classification
and triangle-free five-distance conclusions take an explicit
`SporadicExhaustion` proof as an argument. That argument remains to be supplied.

The distance-coloring bridge states that attained circular clearance at least
`1/q` gives a proper `q`-coloring of the integer distance graph. The proposed
color is the interval index of the fractional phase. The triangle-free
consequence also uses the proved absence of an additive relation `a+b=c`.
These new semantic and graph sources remain candidates while their source,
axiom, and independent-kernel gates run.

The accepted unconditional theorem
`Loneliness.CoordinateSubspace.four_speed_gap` supplies the four-speed gap
input for the eventual concrete five-speed cutoff and line reduction.

## Verification tasks

The task registry is `scripts/five_speed_candidate_tasks.json`. Each selected
task recompiles its complete local dependency closure, checks every owned
theorem against the three-axiom whitelist, and independently replays every
local module with the unmodified pinned kernel checker. Receipts include the
registry, verifier, workflow, source, and artifact hashes.

Changes to a task's targets or required declarations select that task even
when its source files are unchanged. Changes to a dependency select every
affected task. Changes to the checker infrastructure select all tasks.
The registry permits later task additions without rerunning unrelated
families solely because the registry changed.
