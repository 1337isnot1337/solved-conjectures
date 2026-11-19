# Finite classification of rational planes

This development reduces the classification of low-value rational planes in
five coordinates to a finite, exact certificate. The mathematical input is
the four-speed gap, stated as an explicit hypothesis. The plane reduction,
normalization, finite tests, and conversion to the five-speed spectrum are
proved separately.

## Statements

For a rational subspace `E` of `ℚ⁵`, let `realSpan E` be its span in `ℝ⁵`.
Its value is the supremum, over all points `x` in that real span, of

\[
  \min_{0\le i<5}\operatorname{dist}(x_i,\mathbb Z).
\]

`CoordinateFree E` means that each coordinate is nonzero at some point of
`E`. Different coordinates may use different witnesses.

`FourSpeedGap` states the following. If four distinct positive integer
speeds have value strictly below `2/9`, their list is a permutation of a
positive integer multiple of either

\[
  (1,2,3,4) \qquad\text{or}\qquad (1,3,4,7).
\]

This predicate is a hypothesis of the plane theorem. It is neither an axiom
declaration nor a result asserted by the development.

The main plane theorem, `critical_product_of_low_value`, has these inputs:

- `FourSpeedGap`;
- a coordinate-free rational subspace `E` of `ℚ⁵`;
- `dim E = 2`;
- `spaceValue (realSpan E) < 2/9`.

It proves that a signed coordinate permutation sends `E` to

\[
  \operatorname{span}_{\mathbb Q}\{q,e_j\},
\]

where `e_j` is the `j`th coordinate axis and the four coordinates of `q`
outside `j` are exactly one of the two critical quadruples. Thus those four
coordinates lie on one critical line, and coordinate `j` is free.

The theorem `spectrum_in_critical_product` supplies the next step. If an
integer vector `w` belongs to such a product plane, every coordinate of
`w` is nonzero, and its speed value is below `1/5`, then

\[
  \operatorname{value}(w)=\frac{s}{5s+1}
  \qquad\text{for some integer }s\ge1.
\]

The speed list for an integer vector uses its distinct absolute
coordinates. The proof also uses the full five-entry list, including
repetitions, when applying the verified critical-family theorem.

## Two integer directions in the plane

The starting point is coordinate coalescence. A coordinate-free rational
plane contains an integer direction whose coordinates are all nonzero
and whose absolute coordinates have at most four distinct values.

The strengthened coalescence theorem constructs a second such direction
outside the first direction's line. It does this by choosing a hyperplane
of the exact form

\[
  x_a=\varepsilon x_b,\qquad \varepsilon\in\{-1,1\},
\]

whose restriction to the plane remains coordinate-free and which avoids
a prescribed vector with all coordinates nonzero. Clearing denominators
gives the second integer vector. Both vectors lie exactly in the original
rational plane, and they span it over `ℚ`.

The avoiding condition comes from fixing the functional used to normalize
the coordinate forms: evaluate each form at the prescribed vector.
Orient the selected forms so their evaluations are positive. Their signed
sum then has positive evaluation, so its kernel avoids that vector.
An ordering argument selects two forms whose signed sum is not parallel
to any original coordinate form. Its kernel therefore remains
coordinate-free. The resulting coordinate coefficients are exactly
`1` and `-1`; normalization is used to select the pair, not to replace
those coefficients by arbitrary weights.

The verified lower bound for at most three distinct positive speeds is
`1/4`. Each direction in a plane of value below `2/9` therefore has
exactly four distinct absolute speeds. Applying `FourSpeedGap` makes
both directions critical.

## Complete normalization

There are eight positive canonical five-coordinate patterns:

| Critical support | Repeated coordinate | Pattern |
|---|---:|---|
| `1,2,3,4` | 1 | `1,1,2,3,4` |
| `1,2,3,4` | 2 | `1,2,2,3,4` |
| `1,2,3,4` | 3 | `1,2,3,3,4` |
| `1,2,3,4` | 4 | `1,2,3,4,4` |
| `1,3,4,7` | 1 | `1,1,3,4,7` |
| `1,3,4,7` | 3 | `1,3,3,4,7` |
| `1,3,4,7` | 4 | `1,3,4,4,7` |
| `1,3,4,7` | 7 | `1,3,4,7,7` |

`critical_direction_normalization` proves that every critical integer
direction with five nonzero coordinates is a positive integer dilation
of a signed permutation of one of these patterns. The proof derives the
single repeated coordinate from list length and support; it does not
assume that repeated coordinates have been placed in a particular order.

Apply one signed coordinate permutation to make the first direction a
positive canonical pattern, after removing its scalar. Transform the
second direction by the same map. Its absolute speed support is unchanged.
Normalize its positive scalar and its overall sign so its first coordinate
is positive. Its four remaining signs are encoded by a number from `0`
through `15`.

`normalized_low_plane` proves that this procedure covers every plane in
the theorem. The normalized pair spans the transformed plane exactly.
Signed coordinate permutations preserve the actual supremum defining
the plane value.

## The finite test

Write the normalized directions as `q` and `c`. For every pair `a < b`
and every sign `ε = ±1`, form the integer vector

\[
  u_k=(q_a-\varepsilon q_b)c_k
       -(c_a-\varepsilon c_b)q_k.
\]

This vector belongs to the plane and satisfies `u_a = ε u_b`. If every
coordinate of `u` is nonzero, its distinct absolute speeds number at
most four. The actual low-value plane hypothesis and `FourSpeedGap`
therefore force its absolute support to be a positive multiple of one
of the two critical quadruples.

The Boolean support test computes the smallest absolute coordinate `m`
and checks equality of supports with `m * [1,2,3,4]` or
`m * [1,3,4,7]`. It checks both inclusions. A line with a zero coordinate
is skipped. `admissibleTest_of_low_plane` proves that every plane under
the theorem's hypotheses passes this precise Boolean test.

The conclusion of each finite test is a free coordinate `j` for which:

1. deleting coordinate `j` from `q` leaves one critical quadruple;
2. every two-coordinate minor outside `j` vanishes:
   `q_i * c_k = q_k * c_i` for `i,k ≠ j`.

The certificate covers eight choices for `q`, eight patterns for `c`,
all 120 coordinate permutations, and all 16 sign masks. This gives
122,880 indexed cases. The repeated coordinate makes each distinct
second direction occur twice, so there are 61,440 distinct ordered
vector pairs.

The 120-entry permutation table is proved equal to Mathlib's complete
permutation enumeration. A separate coverage theorem applies the table
to every coordinate permutation. Sign coverage is also proved in Lean.
The finite check therefore has no unverified normalization or coverage
step.

## From accepted minors to the spectrum

Vanishing minors show that all four coordinates outside `j` are
proportional to the corresponding coordinates of `q`. Hence the plane
lies in `span {q,e_j}`. Both spaces have dimension two, so they are equal.
`canonical_product_structure` proves this equality.

For an integer vector in this product plane, choose the coordinate of the
critical quadruple that equals `1`. Its integer value determines the
common scalar on the other three critical coordinates. Taking absolute
values gives a positive integer dilation of the entire critical
quadruple in the five-entry speed list. The already verified
critical-family classification then gives `s/(5s+1)` below `1/5`.
Signed permutation invariance transfers the result to the original
integer vector.

## Modules

| Module | Role |
|---|---|
| `LonelinessCoalescenceAvoiding` | Coalescence avoiding a prescribed vector |
| `LonelinessTwoDirections` | Concrete coordinate hyperplane with avoidance |
| `LonelinessPlaneDirections` | Two integer directions spanning the plane |
| `LonelinessPlaneGap` | Exact four-speed input and its use on both directions |
| `LonelinessCriticalNormalization` | Eight-pattern classification of directions |
| `LonelinessSignedCoordinates` | Signed permutation and value invariance |
| `LonelinessPlaneNormalization` | Complete normalized input domain |
| `LonelinessPlaneCertificateDefs` | Exact Boolean tests |
| `LonelinessPlanePermutationTable` | Complete permutation table |
| `LonelinessPlaneWitness` | Optional short rejection witnesses |
| `LonelinessPlaneWitnessSoundness` | Test soundness and table coverage |
| `LonelinessPlaneCertificate00` through `77` | The 64 complete finite blocks |
| `LonelinessPlaneCertificate` | Universal finite-pair theorem |
| `LonelinessPlaneAdmissibility` | Actual plane hypothesis implies test acceptance |
| `LonelinessPlaneProduct` | Accepted test implies the product plane structure |
| `LonelinessPlaneClassificationCore` | Classification with exact finite coverage as a parameter |
| `LonelinessPlaneClassification` | Low-value plane classification |
| `LonelinessProductSpectrum` | Spectrum of integer directions in product planes |

`generate_plane_certificates.py` writes the 64 finite blocks. Its default
output asks Lean to reduce each complete block in the kernel. The optional
`--rows` form proposes shorter rejecting-line witnesses and checks each
row separately. Correctness depends on the Lean proofs, including
coverage, rather than on the Python generator.

The semantic composition is separated from the generated evidence.
`CandidatePairsChecked` is the exact proposition that all normalized
candidate pairs pass `pairTest`. The core classification takes this
proposition as an explicit parameter. The final classification supplies
it using the complete 64-block theorem. No assertion of finite coverage
is introduced as an axiom or left implicit.

## Verification status

All four support modules and all 64 finite blocks passed source checking,
stock `leanchecker` replay, and the transitive logical-axiom whitelist in
[hosted run 44446557652](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44446557652)
at commit `bac947b`. All eight row receipts were retrieved. The 64 source
hashes, generator hash, and four support hashes match the local files.

The geometric normalization, admissibility, product semantics, and
explicit-coverage proof cores also passed source checks, the
53-declaration transitive axiom audit, and separate stock kernel replays.
The final aggregate and classification wrappers passed source checking,
their seven-declaration audit, and separate kernel replays against the
imported, hash-verified certificate artifacts. These checks allow only
`propext`, `Classical.choice`, and `Quot.sound`.

`FourSpeedGap` remains an explicit mathematical input. The finite plane
reduction is complete under that hypothesis. The full five-speed result
also requires the four-speed classification and the remaining finite
classification of the original speed vectors.
