# Four-speed gap theorem in Lean

For every list of four distinct positive integer speeds, loneliness below
`2/9` forces a positive scaling and permutation of one of these two lists:

- `[1,2,3,4]`;
- `[1,3,4,7]`.

Both lists have loneliness exactly `1/5`. The statement includes every speed
size and every common divisor. It is not restricted to primitive tuples or
a finite coordinate box.

## Declarations

The accepted module
[`LonelinessFourSpeedGap.lean`](../../lean/Conjectures/LonelinessFourSpeedGap.lean)
proves these endpoints in `Loneliness.CoordinateSubspace`:

| Theorem | Conclusion |
| --- | --- |
| `four_speed_gap` | The complete two-direction classification below `2/9`. |
| `four_speed_below_gap_value` | Every qualifying four-speed list has value exactly `1/5`. |
| `four_speed_lonelyRunnerBound` | Every nonempty distinct positive list of length at most four has value at least `1/5`. |

The last theorem uses the already proved one-, two-, and three-speed cases
for shorter lists. It does not introduce a published runner theorem as an axiom.

## Proof dependencies

The unconditional pigeonhole argument gives the primitive coordinate cutoff
5,832. Ten finite prime covers and their lifting trees classify all primitive
tuples within that cutoff. The scaling adapter then proves the statement for
arbitrary common divisors. The two exact-value proofs identify the resulting
loneliness as `1/5`.

The exact dependency closure has 84 project modules. Its full ownership and
transitive axiom audit checked 1,880 theorem declarations, including private
declarations. Only `propext`, `Classical.choice`, and `Quot.sound` occur.

All ten prime/lift closures passed their source, axiom, and stock kernel gates
in [run 44451283261](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44451283261).
The aggregate modules subsequently passed fresh strict source checks and
independent kernel replay. The separate classification adapter also received
a fresh standalone source check and replay. Every remaining dependency matches
an earlier accepted proof receipt by source hash.
The concurrent proof-only `HaralambisFaces` lint repair has its own fresh
source, 62-theorem axiom audit, and kernel receipt. Its public statements and
definitions are unchanged; the earlier closure audit retains its checked snapshot.

The [integration receipt](../../docs/four-speed-integration-receipt.json)
records the exact modules, source hashes, and validation scopes. Registration
adds 36 modules to the previous accepted package. Its larger combined hosted
run remains separate from these completed component checks.

## Use in the five-speed proof

The existing plane classification and coordinate-cutoff reductions take a
`FourSpeedGap` argument. `four_speed_gap` supplies that argument directly.
The bounded five-speed enumeration remains unfinished. This supporting
four-speed theorem does not establish the complete five-speed classification.

To rebuild and audit the accepted package and independently replay its proofs:

```sh
scripts/verify_lean.sh
```
