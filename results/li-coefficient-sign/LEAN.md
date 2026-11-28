# Lean formalization: Li's coefficient-sign counterexample

**Accepted proof scope:** the explicit counterexample in the 44-module
closure below, with 71 required theorem endpoints. All strict source
checks, 25 literal contracts, the complete owned and reachable raw-proof-
occurrence audits, and 44 exact stock-kernel replays passed. The original
artifacts were authenticated and independently reviewed before this
registration. This record concerns the stated Li result; the repository-
wide formalization campaign remains incomplete.

The original 38-module formalization is by
[aadrianvv](https://github.com/aadrianvv), contributed in
[PR #35](https://github.com/1337isnot1337/solved-conjectures/pull/35), at original
head `fb700255fed86b6ac29b4980ff4704fa46adab63`. Compatibility repairs,
verification, and the six additional modules are coordinated in
[issue #39](https://github.com/1337isnot1337/solved-conjectures/issues/39),
[#40](https://github.com/1337isnot1337/solved-conjectures/issues/40), and
[#41](https://github.com/1337isnot1337/solved-conjectures/issues/41).

## Mathematical scope

The tree `Li.T` has vertex type `Fin 31` and the literal edges listed in
[`README.md`](README.md). The development proves that it is a tree, has maximum
degree 4, has exactly one degree-4 vertex, has every connected partition type,
and is neither a spider nor a caterpillar. Its degree-4 vertex has exactly one
leaf neighbour. The coefficient and partition-count conclusions are

```math
[e_2^{14}e_3]X_T=29,
\qquad b_{(3,2^{14})}(T)=8,
\qquad [e_2^8e_3^5]X_T=-6304.
```

Thus the numerical coefficient contradicts Li's strict-negativity prediction
in Problem 4.9, and the leaf count contradicts the first question in Problem
4.6. The count 8 also contradicts the informal prediction
`b_(3,2^14)(T)=1`. This last prediction concerns the number of connected
partitions of that type. The tree retains a unique degree-4 vertex, so it does
not refute the separate second question in Problem 4.6.

### Actual finite proper-colouring polynomials

For a finite colour type `σ`, the formal polynomial is

```math
X_{T,\sigma}=\sum_{\substack{\kappa:V(T)\to\sigma
\\ u\sim v\Rightarrow\kappa(u)\ne\kappa(v)}}
\prod_{v\in V(T)}x_{\kappa(v)}.
```

This is `LiFull.fullChromPolyOn (σ := σ) Li.T`, an element of
`MvPolynomial σ ℚ`. Its symmetry is proved. Its elementary coordinates are
the result of applying the inverse of `MvPolynomial.esymmAlgEquiv` to that
symmetric polynomial. They are not defined by the numerical answers.

If `n = Fintype.card σ`, the coordinate polynomial has variables indexed by
`Fin n`. Coordinate `i` represents the elementary symmetric polynomial
`e_(i+1)`. Consequently
`Finsupp.single 1 a + Finsupp.single 2 b` denotes the coefficient of
`e₂^a e₃^b`.

The full coefficient theorems quantify over every finite colour type of
cardinality at least 31. They include both adding colours and changing their
labels. The restriction and renaming proofs identify the intended stable
coefficients of the chromatic symmetric function. The development does not
construct a separate infinite-variable symmetric-function ring.

The threshold 31 is the degree bound used for these full-coordinate transfer
theorems. It is not a claim that 31 colours are necessary for the particular
`e₂,e₃` coefficients.

### Genuine connected vertex partitions

`LiCounterexample.ConnectedPartitionOfType p` means that there is a finite
family of nonempty, pairwise disjoint vertex blocks covering all 31 vertices,
every block is connected by walks entirely within that block, and the
multiset of block cardinalities is `p`.

The certificate checker initially returns sizes of components of a spanning
subgraph obtained by selecting tree edges. `LiFinal.sizes_eq_components`
identifies those computed sizes with actual `SimpleGraph.ConnectedComponent`
sizes. `LiCounterexample.connectedPartitionType_blocks` then constructs the
vertex blocks. In particular, the all-types theorem is about connected
vertex partitions, rather than only a successful list or mask computation.

The triple-plus-pairs count uses the same walk-inside-block connectivity
predicate. A proved bijection connects those partitions to connected triples
whose complements have perfect matchings. Matching uniqueness and the exact
classification of eight such triples establish the cardinality 8.

A further equivalence identifies every subset of deleted tree edges with its
actual connected vertex partition. The inverse retains exactly the tree
edges whose endpoints share a block. The forest edge-recovery lemma proves
the inverse law: an ambient tree edge between vertices connected in a
spanning subgraph must itself be present in that subgraph. This gives exactly
`2^30` connected vertex partitions in total, with no restriction on block
sizes. The number 6,842 counts the canonical block-size types instead.

## Main declarations

| Conclusion | Declaration |
| --- | --- |
| Combined tree, degree, leaf, partition-type, positive-coefficient and triple-count facts | `LiCounterexample.counterexample` |
| Every integer partition of 31 is realized by actual connected vertex blocks | `LiCounterexample.all_partition_types` |
| Exactly 6,842 canonical partition types are realized | `LiCounterexample.card_connected_partition_types` |
| Exactly 6,842 integer partitions of 31 | `LiFinal.card_partitions_31` |
| Exactly eight connected partitions of type `(3,2^14)` | `Li.LiFinal325.b_triple_pairs` |
| Exact classification of the admissible triples | `Li.LiFinal325.goodTripleData_iff` |
| No degree-4 vertex has two leaf neighbours | `LiCounterexample.no_degree_four_two_leaf_neighbors` |
| The actual full coefficient is positive | `LiCounterexample.coefficient_eq`, `LiCounterexample.coefficient_positive` |
| Full coefficient `e₂¹⁴e₃ = 29`, all finite colour types with cardinality at least 31 | `Li.full_li_coefficient_of_card` |
| All five full `e₂,e₃` coefficients, all such colour types | `Li.full_e2e3_coefficients_of_card` |
| Full coefficient `e₂⁸e₃⁵ = −6304`, all such colour types | `Li.full_negative_coefficient_of_card` |
| Failure of coefficientwise nonnegativity in the full elementary coordinates | `Li.not_elementary_positive_of_card` |
| Bijection between deleted-edge subsets and all connected vertex partitions | `LiConnectedPartitions.cutPartitionEquiv` |
| Exactly `2^30 = 1,073,741,824` connected vertex partitions in total | `LiConnectedPartitions.connected_partitions_card` |
| Exactly `2^30` subsets of the tree's edge set | `LiCounterexample.edge_cut_choices_card` |

The five possible degree-31 monomials involving only `e₂` and `e₃` have the
following coefficients. The table does not describe the entire elementary
expansion of `X_T`.

| Exponent of `e₂` | Exponent of `e₃` | Full coefficient |
| ---: | ---: | ---: |
| 14 | 1 | 29 |
| 11 | 3 | 83 |
| 8 | 5 | −6304 |
| 5 | 7 | −6800 |
| 2 | 9 | −8384 |

For example, the negative-coefficient theorem literally has the form

**Lean excerpt**

```lean
theorem Li.full_negative_coefficient_of_card
    {σ : Type*} [Fintype σ] [DecidableEq σ]
    (hσ : 31 ≤ Fintype.card σ) :
    ((MvPolynomial.esymmAlgEquiv σ ℚ (n := Fintype.card σ) rfl).symm
      ⟨LiFull.fullChromPolyOn (σ := σ) Li.T,
        LiFull.fullChromPolyOn_isSymmetric Li.T⟩).coeff
      (Finsupp.single (⟨1, by omega⟩ : Fin (Fintype.card σ)) 8 +
        Finsupp.single (⟨2, by omega⟩ : Fin (Fintype.card σ)) 5) = -6304
```

The formal non-positivity conclusion is the negation of nonnegative
coefficients for this entire elementary-coordinate polynomial. It does not
merely say that a specialized numerical evaluation is negative.

## Proof structure and limits

The original `+29` calculation uses dual numbers, weighted homogeneity, and a
30-step leaf-elimination proof. A separate chain evaluates the actual
three-colour polynomial at five rational colour assignments, proves the
interpolation matrix identity, and obtains all five coefficients. The
full-coordinate restriction and renaming theorems carry these coefficients
to arbitrary finite colour sets of cardinality at least 31.

For partition-type coverage, fourteen data modules supply one cut witness
for each of the 6,842 integer partitions of 31. The checker, its connection
to graph components, enumeration completeness, and enumeration cardinality
are part of the proof. The count of eight is the cardinality of genuine
partitions proved through a bijection, not just the length of a candidate
list.

The bipartition cardinalities 16 and 15 are proved in `LiBasic`. The listed
rank parity is a proper two-colouring. The development does not separately
export an equality identifying `rankOf` with graph distance.

The Python dynamic program and the vertex-deletion proof in
[`PROOF.md`](PROOF.md) are alternative arguments. The development does not prove
the Python implementations correct, the general edge-cut dynamic-program
recurrence, or the listed vertex-deletion contributions. It does prove the
cut/partition bijection and the total connected-partition count for this
particular tree. The all-types, exact-eight, and coefficient conclusions also
have their own formal proofs in the accepted development.

Historical priority, the older spider examples, and the literature search
are documented in [`NOVELTY.md`](NOVELTY.md). They are not Lean claims.

## Module map

All paths below are relative to `lean/Conjectures/`.

| Modules | Content |
| --- | --- |
| `LiBasic.lean` | Explicit tree, structural facts, and bipartition |
| `LiChromatic.lean` | Three-colour proper-colouring polynomial, symmetry, homogeneity, and evaluation |
| `LiEliminate.lean`, `LiBridge.lean` | Leaf elimination and its link to actual polynomial evaluation |
| `LiDualFull.lean`, `LiDualTrunc.lean`, `LiTrunc.lean` | Dual-number algebra and truncation |
| `LiWeighted.lean`, `LiWeighted2.lean` | Weighted homogeneity in elementary coordinates |
| `LiMonomial.lean`, `LiEmapFinal.lean` | Monomial coefficient extraction and elementary-symmetric evaluations |
| `LiCompute.lean`, `LiSpecFinal.lean`, `LiMain.lean` | Exact `+29` computation and three-variable coefficient theorem |
| `LiFullCoeff.lean`, `LiFullCoeffTrunc.lean` | Full coefficients, restriction, and independence of finite colour labels and cardinality above the bound |
| `LiTriples2.lean`, `LiTriplesBridge.lean`, `LiTriplesFinal.lean` | Connected triples, matchings, genuine partitions, and the exact count eight |
| `LiPartitionsFinalCore.lean`, `LiPartitionsGraph.lean` | Cut checker and correspondence with graph components |
| `LiPartitionsFinalEnum.lean` | Complete enumeration of integer partitions of 31 |
| `LiPartitionsFinalData00.lean` through `LiPartitionsFinalData13.lean` | The 6,842 cut witnesses |
| `LiPartitionsFinal.lean`, `LiPartitionsCount.lean` | Complete type coverage and exact enumeration cardinality |
| `LiCoefficientExtraction.lean` | Exhaustive degree-31 `e₂,e₃` monomial classification and five-term evaluation identity |
| `LiEvaluationData.lean` | Five exact proper-colouring evaluations using leaf elimination |
| `LiCoefficientInterpolation.lean` | Exact matrix identity and recovery of the five coefficients |
| `LiNegativeCoefficient.lean` | All five full coefficients and failure of coefficientwise nonnegativity |
| `LiCounterexample.lean` | Transport to connected vertex blocks and the assembled counterexample |
| `LiConnectedPartitions.lean` | Deleted-edge/connected-partition equivalence and total connected-partition count |

The first 38 modules come from aadrianvv's PR. The coefficient-extraction and
negative-coefficient extensions are coordinated in issue #39; the evaluation
and interpolation extensions in issue #40; and the connected-block assembly
and the total connected-partition bijection in issue #41. The integration retains the individual source
commits and the original PR head as a merge parent, preserving aadrianvv's
author attribution.

## Reproduce the complete check

The development uses Lean 4.35.0 and Mathlib revision
`56a005855ea17e0b0958f73ec801ae140b0a1679`, pinned in
[`lean/lake-manifest.json`](../../lean/lake-manifest.json). With that Lean
toolchain installed, run from the repository root:

```sh
cd lean
lake exe cache get
cd ..
python3 scripts/verify_li_exact.py --plan
python3 scripts/verify_li_exact.py --artifact-dir .candidate-artifacts/li-exact
```

`--plan` reports the inventory; it does not run verification. The full command
checks the sealed inventory of 44 project modules and 71 required theorem
endpoints, compiles fresh project objects
with warnings treated as errors, checks literal mathematical contracts,
audits all declarations owned by the closure including private declarations,
and runs the stock kernel checker on every project module as an exact target.
The permitted axiom closure is limited to `propext`, `Classical.choice`, and
`Quot.sound`. Acceptance requires every stage to pass for unchanged source,
object, compiler, configuration, and verifier hashes.

The axiom audit above checks the body selected by the imported environment
for each owned declaration name, including private names. The stock checker
can skip duplicate theorem bodies with matching names and types. A separate
occurrence scan and, when needed, raw-body checks must therefore cover any
differing serialized proof bodies before acceptance. This supplementary
evidence must bind the same unchanged object files.

The hosted equivalent is
[`.github/workflows/lean-li-exact.yml`](../../.github/workflows/lean-li-exact.yml).
The source inventory is
[`docs/li-exact-sources.json`](../../docs/li-exact-sources.json). A successful
run writes a machine-readable `receipt.json` and detailed logs into the
artifact directory. Importing a previously built object or running
`#print axioms` only on a few public endpoints is not the complete check.

The supplementary workflow is
[`.github/workflows/lean-li-hosted44-raw.yml`](../../.github/workflows/lean-li-hosted44-raw.yml).
It downloads the exact original baseline archive, authenticates every member,
rechecks the 25 contracts, and audits every reachable serialized occurrence
against the same compiled objects. It preserves that original archive in a
second artifact. To reproduce the supplement locally, download baseline
artifact `14568527194` as `li-exact-original.zip`, then run:

```sh
python3 scripts/authenticate_li_hosted44.py --archive li-exact-original.zip --output-dir .candidate-artifacts/li-hosted44-original
python3 scripts/verify_li_hosted44_raw.py --artifact-dir .candidate-artifacts/li-hosted44-original/original --stage .candidate-artifacts/li-hosted44-raw
```

The output directories must be fresh. The authenticator checks the frozen
archive and git snapshots without invoking Lean. The supplementary runner
checks the literal statements and raw occurrence graph; it retains the
original baseline source-build and stock-replay evidence.

## Acceptance record

The records below bind the accepted source bytes to the original hosted
source-build gate and the later raw-occurrence supplement. The source
snapshot precedes registration; the registration adds imports and
required names without changing any of the 44 proof sources.

The repository preserves the [original source-gate evidence](../../docs/verification/li-exact-44599210697/README.md)
and the [raw-occurrence evidence](../../docs/verification/li-hosted44-raw-44606051622/README.md).
Receipts and small logs remain byte for byte. The complete raw inventory
and audit log are stored as gzip plus base64 with hashes for the original,
compressed and encoded bytes, and commands to verify their recovery.

| Field | Status |
| --- | --- |
| Previous 43-module candidate inspected | `918a0f17095dd660bf5cd89f77e76b864c0570c6` |
| Expanded 44-module source candidate | `20e0e95eb421cf8ea728d34aa29a6d0eb1137789` |
| Added connected-partition source SHA-256 | `15da52c038057d94211228d82b11f94bbf6080a42c8a865ef994ce72ea2c33f4` |
| Accepted source snapshot | `20e0e95eb421cf8ea728d34aa29a6d0eb1137789`; all 44 source hashes unchanged at registration |
| Successful baseline workflow and artifact | [Run 44599210697 / job 135825706963](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44599210697/job/135825706963), artifact `14568527194` |
| Original baseline receipt SHA-256 | `da585dbd99530825af7bac8c4730c1a6666bfa151ce98ad4c6f52b9d537aa09d` |
| Strict source checks for all 44 modules | Passed; exact source/object/import receipts authenticated |
| Required theorem inventory, all 71 endpoints | Passed; every required declaration is a theorem |
| All 25 literal contracts | Passed against the exact 44 imported objects |
| All-owned name axiom audit | Passed: 1,247 declarations, 932 theorems, 95 private names; only the three permitted axioms |
| Serialized proof-occurrence coverage | Passed: 1,247 owned occurrences; closed graph of 17,647 nodes and 316,338 edges; no reachable differing body; trust-zero negative control rejected |
| Successful raw supplement and artifact | [Run 44606051622 / job 135849912826](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44606051622/job/135849912826), artifact `14569498196` |
| Raw supplement receipt SHA-256 | `8cb7e81896bc67b3c68ed976f256e6894b6c52318063ab0894360fed1d0a8b46` |
| Stock kernel replay of all 44 modules | Passed; fresh process and exact singleton target per module |
| Accepted registries | This registration adds the exact 44 imports, 44 prebuild/replay entries, and 71 required theorem names |
| PR #35 ancestry | Original aadrianvv head `fb700255fed86b6ac29b4980ff4704fa46adab63` retained as a merge parent |

The separate `LiStructure` graph-distance and branching source added after
the checked snapshot is outside this 44-module scope. Its dedicated
two-module verification closure includes `LiBasic`. It retains candidate
status and does not change this acceptance inventory.

The original [run 44599210697, job 135825706963](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44599210697/job/135825706963)
produced artifact `14568527194`, ZIP SHA-256
`281b57fd87cf7d6123cdcabff4a5803f3d426116dbb4a9aa01370318b2a138ed`.
The unchanged receipt SHA-256 is
`da585dbd99530825af7bac8c4730c1a6666bfa151ce98ad4c6f52b9d537aa09d`.
All 272 original members, source/object/direct-import bindings, process
logs and profiles, original git controls, and compiler/checker pins have
been authenticated. The artifact authentication SHA-256 is
`cc956d198ed081f35fb7ea35ff22aaf9bbec7b3ce2138519c43db53d778fef29`;
the independent root review SHA-256 is
`9de0d30a11a09d0c54bfdd76358f6ef2e3abdcc07254c314af520bbfbd04361b`.

The [raw-occurrence supplement, run 44606051622 / job 135849912826](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44606051622/job/135849912826)
passed at `26ef845d1ec4adb15e0c87c9264905baeb69491f` against the exact original
44 compiled objects. It rechecked all 25 literal contracts and traversed
17,647 dependency nodes and 316,338 edges from all 1,247 owned declarations.
The scan indexed 22 differing theorem bodies across the imported environment;
none was reachable from those roots, so no extra variant alias checks were
needed. The trust-zero checked-kernel negative control was rejected. The
only transitive axioms were `propext`, `Classical.choice`, and `Quot.sound`.

The raw artifact is `14569498196`, ZIP SHA-256
`7ea288555021d503775aa3886fc59edc65ae9a096ca26bb9add7e9950b1e1489`,
with receipt SHA-256
`8cb7e81896bc67b3c68ed976f256e6894b6c52318063ab0894360fed1d0a8b46`.
The preserved baseline backup is artifact `14569584489`, ZIP SHA-256
`dfbb03a7571256df786f9c28f45b306cb924f89403ba403d81063072e6f1eb2f`;
its inner archive equals the original baseline ZIP byte for byte.
The raw-artifact authentication SHA-256 is
`6abda54c54c591fef864220fd7624374ad25af865a94989204969305eecb0610`;
the independent review SHA-256 is
`8f14f2f5844973ea3d432b741185e01a8385841fc0d8f8b90e7181e88f5d6aee`.
The supplement retains the original source-build and stock-replay evidence;
it does not claim to have repeated those stages.
