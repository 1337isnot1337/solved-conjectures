# Finite FC certificates and small cyclic cases

These modules prove dependencies of the cyclic span-four result.
They do not establish the complete span-four theorem.
The candidate workflow records source checks, the axiom audit, and independent kernel replay for each exact import closure.
The FC and small cyclic packet is registered in the accepted package.
Its [hosted receipt](verification/frankl-fc-packet-6544adcc.json) records the exact 53-module check at `6544adcc`.
The full merged-package gate remains separate.

## Mathematical scope

The Vaughan endpoint is `Frankl.Vaughan.three_triples_abundant` in
[`FranklFCVaughan.lean`](../lean/Conjectures/FranklFCVaughan.lean).
It concerns every finite union-closed family that contains three distinct triples through one point.
Its conclusion gives an abundant point in the union of those triples.
The ambient ground set has no size restriction.
The family need not contain the empty set.

The proof classifies the three pairs left after removal of the common point.
There are five configurations: a triangle, a star, a path, a path with a separate edge, and three separate edges.
Each configuration has a finite weighted certificate.
The finite-support embedding transfers each certificate into an arbitrary ambient family.

| Configuration | Ground size | Weights, in point order | Search nodes | Integer transfers |
| --- | ---: | --- | ---: | ---: |
| Triangle | 4 | `1,1,1,1` | 7 | 6 |
| Star | 5 | `3,3,2,2,2` | 27 | 103 |
| Path | 5 | `6,3,5,5,3` | 21 | 87 |
| Path and separate edge | 6 | `12,7,9,7,6,6` | 97 | 1,138 |
| Three separate edges | 7 | `2,1,1,1,1,1,1` | 367 | 5,799 |
| Pasch configuration | 6 | `1,1,1,1,1,1` | 15 | 89 |

The table describes the generated certificates.
A certificate contributes a theorem only after its Lean checks pass.
The Pasch certificate supplies a separate shortcut for the small cyclic cases.

## Small cyclic scope

[`FranklSmallCyclicResults.lean`](../lean/Conjectures/FranklSmallCyclicResults.lean)
collects three results with different hypotheses.

| Endpoint | Checked mathematical scope |
| --- | --- |
| `FranklSmallCyclic.cyclic_abundance_le_six_zmod` | Every nontrivial cyclic span-four generator family on at most six sites has an abundant point. |
| `FranklSmallCyclic.residual_period_seven`, `residual_period_eight`, `residual_period_ten` | Every periodic word whose windows belong to the specified 35-edge residual graph is zero. |
| `FranklSmallCyclic.residual_nine_abundant` | Every nonzero period-nine word in that residual graph generates a family with an abundant point. |

The first theorem permits arbitrary generator sizes and arbitrary cyclic overlaps.
Its finite search reduces every family to a two-point shortcut, Vaughan's theorem, or a Pasch configuration.
The six-site search contains 227 nodes.

The period-nine proof checks 63 nonzero candidates with exact union masks.
Its mask theorem proves equality with the actual family of distinct unions before transferring frequency counts.
It has no supplied counting assumption.

The seven-through-ten-site results retain the residual-graph hypothesis.
The reduction from arbitrary families to this graph still requires the local certificates and graph rank proof.
These results therefore do not yet prove the complete theorem for every family on at most ten sites.

## Proof construction

For a pattern `S`, its share is twice its weight minus the total weight of the finite support.
A nonnegative total share forces an abundant point with positive weight.
Exterior fibers reduce this statement to families of patterns on the finite support.
The reduction preserves the number of distinct sets in each fiber.

The search tree splits on membership of one pattern.
Each node records forced members and excluded members.
A present branch also forces unions with the base generators and known members.
Every branch receives a proof of soundness from `FranklShareSearch` and `FranklShareFlow`.

A leaf records nonnegative integer transfers between patterns.
Membership of the source must force membership of the target.
The transfer theorem bounds the total share of every compatible family.
The kernel then checks the remaining finite lower bound.
The maximum-flow search proposes these transfers, but its correctness is not a premise of the Lean theorem.

Natural-number masks encode the patterns in the generated files.
`FranklFCBitCode` proves injectivity, coverage of every subset, and preservation of union for every support size.
`FranklFCFiniteDomain` transfers the encoded certificate to actual finite sets.
The pointwise evaluator has a proved equality with the original transfer evaluator.

The [FC-family formalization paper](https://arxiv.org/abs/1207.3604)
describes the closed-extension and share method that underlies this search.

## Local maximal-cover checker

[`FranklLocalMaximalCover.lean`](../lean/Conjectures/FranklLocalMaximalCover.lean)
provides a separate checker for the remaining local weight certificates.
Let `S` be an inside pattern and let `M ⊆ E` be subsets of the boundary.
Let `C` be the union of all local generators contained in `S ∪ E`.
The file proves that `S` is compatible exactly when `C ∩ W = S` and `M ⊆ C ∖ W`.

This equivalence uses the existing `localPart` and `compatible` definitions.
The checker tests inside patterns without enumerating every local union.
Its final theorem transfers a successful check to abundance in the actual family of distinct unions.
No finite window certificate is asserted by this helper alone.

The integer checker and maximal-cover helper are registered in the accepted package.
The [hosted receipt](verification/frankl-maximal-cover-ad07e385.json)
records five strict source checks, the 66-theorem axiom audit, and independent kernel replay.
A separate [local receipt](verification/frankl-maximal-cover-local.json) records the earlier isolated check.
The full merged-package check remains separate.

Run its separate candidate gate with:

```sh
python3 scripts/verify_frankl_local_candidate.py maximal-cover
```

## Local mask checker and domains

[`FranklLocalMaskCertificate.lean`](../lean/Conjectures/FranklLocalMaskCertificate.lean)
proves the exact relation between natural-number masks and compatible inside sets.
It caches the maximal cover for each inside/exterior pair and checks the integer weight sum.
The generator masks may describe an actual quotient ground.
The proof assumes no injective map from an unwrapped interval.

[`FranklLocalMaskDomains.lean`](../lean/Conjectures/FranklLocalMaskDomains.lean)
constructs the inside and boundary domains from all submasks.
It proves code bounds, exact decoded powerset coverage, and distinct inside codes.
The two modules are registered after their
[ten-module hosted gate](verification/frankl-mask-domains-a632fc82.json).
That gate checked 163 project theorems, 38 required endpoints, and every module with the stock kernel.

```sh
python3 scripts/verify_frankl_local_candidate.py mask-domains
```

The [candidate input](../results/frankl-generator-families/width_four_weight_candidates.json)
contains all 9,088 original width-four rows in their reproduced order.
The [provenance manifest](../results/frankl-generator-families/width_four_weight_candidates_manifest.json)
records the source and input hashes.
The independent literal replay checks actual distinct local unions at periods seven, eight and nine.
Its 27,264 row-period checks are computational evidence; they are not a full-data Lean proof.

## Checks

The candidate gate requires all of these checks:

1. Every project source in the import closure compiles with warnings treated as errors.
2. Every required endpoint is an actual theorem declaration.
3. Every project theorem, including private helper theorems, uses only the three standard permitted axioms.
4. The unchanged pinned kernel checker replays the exact project closure, including private object facets.
5. Source and gate hashes remain unchanged during the checks.

The permitted axioms are `propext`, `Classical.choice`, and `Quot.sound`.
The finite checks use ordinary kernel reduction.
They use no `sorry`, extra axiom, or native-computation axiom.

## Reproduce the checks

From the repository root, run the combined candidate gate:

```sh
python3 scripts/verify_frankl_fc_candidate.py packet
```

Its root imports the Vaughan theorem, shared-family adapter, and all small cyclic components.
For the Vaughan theorem alone, run:

```sh
python3 scripts/verify_frankl_fc_candidate.py vaughan
```

For a separate configuration, run its named gate:

```sh
python3 scripts/verify_frankl_fc_candidate.py vaughan-matching
```

To regenerate a mask certificate, run its deterministic producer:

```sh
python3 results/frankl-generator-families/generate_lean_fc_masks.py matching
```

The producer uses the Python standard library.
Its output must pass the Lean gate before acceptance.

The candidate workflow selects the largest affected import closure.
It retains the required theorem checks from every contained task.
This avoids repeated checks of the same large certificate within one workflow run.

## Coordination

[Issue 20](https://github.com/1337isnot1337/solved-conjectures/issues/20)
records this certificate lane and the small cyclic cases.
[Issue 19](https://github.com/1337isnot1337/solved-conjectures/issues/19)
records the other Frankl lane, including the large-generator theorem and the tree bounds.
The `FranklFCVaughan` filename avoids the other lane's independent `FranklVaughan` implementation.
The shared-family adapter proves literal equality of the distinct-union and abundance definitions.

The full cyclic proof still requires the finite window and graph certificates, their schedule interpretation, and the small-cycle assembly.
Li remains outside this work until the other results are complete.
