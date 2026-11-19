# Cyclic weight certificates and transport

The full span-four theorem remains conditional on finite certificate inputs.
This work reduces the remaining weight calculations and supplies checked
transport theorems. It does not establish the full weight table.

## Candidate data

The original width-four input has 9,088 rows. Its canonical SHA256 is
`5594610818abd7f41c76121924259bd1a9a1f86417da91dce2c0f8171bcceb6a`.
The original input and literal pilot are unchanged.

The orbit producer handles each row at the actual periods seven, eight and
nine. It compares the local generator family and its distinguished core,
after reducing coordinates modulo the actual period. It uses bijections of
their finite supports. It does not collapse boundary points.

| Quantity | Count |
| --- | ---: |
| Original row and period pairs | 27,264 |
| Representative classes | 9,448 |
| Classes with an existing pilot representative | 42 |
| Representatives still needing arithmetic proofs | 9,406 |
| Target weight vectors changed by transport | 6,618 |

Weights are transported from each representative. The target theorem needs
a successful weight witness; it does not require the finder's original
vector. The candidate artifact records every replacement explicitly.
Transport does not prove that each original vector succeeds.

The producer, compressed candidate data, manifest, and independent replay
script are in `results/frankl-generator-families/`:

- `generate_small_cyclic_weight_orbits.py`
- `small_cyclic_weight_orbits.json.gz`
- `small_cyclic_weight_orbits_manifest.json`
- `replay_small_cyclic_weight_orbits.py`

Two generations with different Python hash seeds produced identical bytes.
An independent literal-set replay checked all 27,264 records. Those checks
are computational evidence. Lean must still check the finite arithmetic,
maps, and complete coverage used by the final theorem.

## Checked transport theorem

`FranklLocalMaskEquivalence` proves exact equality between the mask checker
and the local certificate checker under their stated domain conditions.
It also proves transport under an injective map of the actual finite local
support. No injectivity assumption is made outside that support.

`FranklSmallCyclicWeightTransport.transportCheck` checks both periods,
entry well-formedness, exact map keys, injectivity, the local-generator image,
the core image, and the transported weights. Point pairs run from the
representative to the target.

`transportCheck_sound` converts the source's successful window check into
the target's successful window check. Its only finite premises are the
transport check and the source check. Diagnostic examples reuse the period
eight pilot to prove period seven row 23 and row 540. Row 540 uses the explicit
replacement vector `[0,0,0,1]`.

The semantic helper passed strict source checks, an explicit `import all`
axiom audit, and exact stock-kernel replay. The gate included 28 modules,
377 project theorems, and the eight reused private pilot chunks. The public
helper itself has a 22-module dependency closure. Diagnostic probes are not
public proof sources.

`FranklSmallCyclicMaskTransport.maskTransportCheck` performs the same
transport checks with natural-number masks. Its soundness theorem implies
the semantic checker above. Three diagnostic maps took 97, 142, and 289
milliseconds of type checking, compared with 352, 346, and 855 milliseconds
for the semantic checks. The complete 31-module diagnostic gate audited 386
theorems and replayed the exact closure. This speed comparison does not
replace Lean proofs for the full map table.

## Checked cached evaluator

`FranklLocalMaskCached` computes the local generators and inside imbalances
once before iterating over boundary pairs. `cachedCheck_eq` proves equality
with the original mask checker for every input.

Its complete local gate checked ten modules and 155 project theorems, then
replayed all ten modules with the unchanged pinned stock checker. On the
same two difficult period-nine rows, the measured source time fell from
8.80 to 6.48 seconds and stock replay from 10.76 to 9.19 seconds. These are
two-row measurements, not a timing guarantee for the full table.

The local-candidate workflow independently rebuilds the complete selected
closure, audits every owned theorem, requires each object facet, and checks
the exact reported replay set. It records source, object, configuration,
gate, and checker hashes. Only `propext`, `Classical.choice`, and `Quot.sound`
are permitted axioms.

## Hosted pilot evidence

The unchanged literal pilot at commit
`77fa9a758cb5753693e66c78f8cde44a09fb4a24` passed the hosted source,
all-declaration audit, and stock-kernel gates:

- [Literal pilot: 25 modules and 24 private chunks](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44492632854/job/135451901956)
- [Word coverage: one module and 22 theorems](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44492632854/job/135451901879)

The pilot checks 16 original rows at each of three periods. Word coverage
proves a generic overlap enumeration theorem. Neither result supplies the
remaining full arithmetic table or the initial graph and rank data.
