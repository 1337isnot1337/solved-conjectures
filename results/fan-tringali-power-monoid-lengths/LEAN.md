# Fan–Tringali’s power-monoid length-set conjecture

## Complete formalized statement

The original conjecture in Section 5 of Yushuang Fan and Salvatore Tringali, *Power monoids: A bridge between factorization theory and arithmetic combinatorics*, Journal of Algebra 512 (2018), 252–294, is completely formalized. For every Dedekind-finite monoid containing an element with infinitely many distinct positive powers, and every finite nonempty set of integers at least two, one actual finite subset realizes exactly that set of atomic factorization lengths in both the ordinary and restricted finitary power monoids.

The endpoint is [`FanTringali.finite_spectrum_power_monoids`](../../lean/Conjectures/FanTringaliMonoid.lean):

```lean
variable {H : Type*} [Monoid H] [DecidableEq H]
  [IsDedekindFiniteMonoid H]

theorem finite_spectrum_power_monoids
    (hH : ∃ u : H, HasInfinitePowers u)
    (S : Finset ℕ) (hS : S.Nonempty) (hmin : ∀ n ∈ S, 2 ≤ n) :
    ∃ X : Finset H, X.Nonempty ∧ MeetsUnits X ∧
      PowerLengths X = (S : Set ℕ) ∧
      RestrictedLengths X = (S : Set ℕ)
```

`H` need not be commutative, cancellative, finite, or a group. Decidable equality is a classical representation of finite subsets, not an extra mathematical restriction. Dedekind-finiteness has its source meaning: a product equal to the identity in one order is also the identity in the reverse order.

[`HasInfinitePowers`](../../lean/Conjectures/FanTringaliMonoidBasic.lean) means that the range of `n ↦ u^(n+1)` is infinite. This matches the authors’ definition of non-torsion on printed page 4. A group-style condition that no positive power equals the identity would not suffice in a general monoid; no such substitution is made. Injectivity of the full natural-number power map is proved from the source hypothesis.

`PowerAtom`, `RestrictedAtom`, `PowerLengths`, and `RestrictedLengths` use the actual pointwise product of finite subsets and finite lists of atoms. The restricted monoid consists of the finite subsets meeting the unit group. The ordinary atom definition is proved equivalent to the nonempty finite-subset definition, and restricted/full atom and length equivalence is proved using Dedekind-finite divisor closure. Section 2.1.1 and Remark 2.3 of the primary source assign length zero only to the identity; other units have empty length sets. The literal finite-list convention matches this source convention.

## Exact reduced natural-number system

[`FanTringali.natural_length_system`](../../lean/Conjectures/FanTringaliNaturalSystem.lean) proves the complete system of atomic length sets of finite subsets of the nonnegative integers containing zero:

```math
\mathscr L(\mathcal P_{\mathrm{fin},0}(\mathbb N_0))
=\{\{0\},\{1\}\}\;\cup\;\mathcal P_{\mathrm{fin}}(\mathbb N_{\ge2}).
```

Here the last term consists of finite nonempty subsets. The proof includes the converse: every nonidentity set has an atomic factorization by induction on its maximum, and every atomic factorization length is bounded by that maximum. The identity and atom cases give exactly the two exceptional singleton length sets.

## Argument and source mapping

The construction is the existing repository [proof](PROOF.md), originally committed by Cinna Davis in [`0d5b985640ecc020f8b99b6e3b1ebc2d8a7fbbe4`](https://github.com/1337isnot1337/solved-conjectures/commit/0d5b985640ecc020f8b99b6e3b1ebc2d8a7fbbe4). The original proposers and the transfer arguments are Fan and Tringali; see their [authors’ PDF](https://imsc.uni-graz.at/tringali/docs/Fan%26Tringali_-_PMs.pdf), Proposition 3.2(iii), Theorem 3.8, Theorem 4.11(i), and Section 5. These transfers are proved in Lean; none is an unformalized hypothesis.

| Part | Modules and checked content |
| :--- | :--- |
| Reduced finite-set foundations | `FanTringaliBasic`: literal atoms/lengths and all Boolean-box divisors and factorizations. |
| Arbitrary finite graph construction | `FanTringaliGadget`, `Slices`, `Products`, `Coordinates`, `Stack`, `Graph`, `Factorizations`, `GraphLengths`: every graph quotient, uniqueness, all atom factorizations, and the exact maximal-clique length set. |
| Prescribed spectra | `FanTringaliBlocks`: disjoint cliques of arbitrary positive sizes, realizing every requested finite nonempty spectrum. |
| One-coordinate transfer | `FanTringaliRadix`, `RadixTransfer`, `Natural`: every binary divisor and every atomic factorization lifts through the no-carry encoding, in both directions. |
| Complete reduced system | `FanTringaliNaturalSystem`: atomicity, finiteness, and the converse classification. |
| Original general monoids | `FanTringaliMonoidBasic`, `MonoidNormalization`, `MonoidTransfer`, `Monoid`: noncommutative unit normalization, atom reflection/preservation, complete length-set equality, and both source power monoids. |

The finite nine-point gadget uses ordinary kernel-checked `decide`, with a proved reduction covering every possible finite quotient. It is a component of the general theorem. The graph construction always includes one full Boolean upper slice at marker zero; its proved quotient theorem shows this harmless padding adds no restriction, including when nonedges are present. The radix argument controls every possible divisor, not merely the displayed factorizations. The monoid normalization preserves the ordered product and length without assuming ambient commutativity.

## Verification and reproduction

All 18 frozen modules passed fresh Lean 4.35.0 compilation with warnings as errors, the repository all-owned/private transitive axiom audit, and stock `leanchecker` replay. The combined source checkpoint audited 432 declarations, including 350 theorems and three private declarations, and required 28 named endpoints. Only `propext`, `Classical.choice`, and `Quot.sound` are allowed. No `sorry`, `admit`, project-specific axiom, or native-computation axiom is accepted.

The [complete receipt](../../docs/verification/lean-fan-tringali-complete-20261124-162051/receipt.json) records exact source and control hashes, compiler/checker hashes, logs, declaration inventory, and the exact replayed module set. The [original combined checkpoint](../../docs/verification/lean-fan-tringali-complete-20261124-162051/checkpoint-004/receipt.json) is retained. The [statement and argument review](LEAN_REVIEW.md) separates author audits from the independent review of the monoid transfer.

From a complete pinned dependency installation, run:

```sh
cd lean
lake env python3 ../scripts/verify_fan_tringali.py
```

The [dedicated workflow](../../.github/workflows/lean-fan-tringali.yml) performs this same scoped gate. The modules and endpoints are also registered in the aggregate `scripts/verify_lean.sh` gate. Scoped success does not assert an aggregate repository pass: the local full-script attempt encounters missing dependency archive artifacts in the read-only shared Mathlib cache, tracked in [#563](https://github.com/1337isnot1337/solved-conjectures/issues/563). Hosted verification and live deployment are reported separately in [#414](https://github.com/1337isnot1337/solved-conjectures/issues/414) and the publication PR.

## Scope limits and attribution

The original 2018 conjecture and the exact reduced natural-number system are complete. The separate 2026 survey formulation using irreducibles without Dedekind-finiteness, prescribed unordered factorization multiplicities, and relative cancellativity remain unformalized supplements to the written proof. Their absence does not weaken the original quantified endpoint, and they are not counted as additional results.

The existing [source and priority record](PROOF.md#sources-and-priority) and [written-proof audit](AUDIT.md) remain in force. They credit earlier partial results and state the limits of the bounded prior-resolution search. This formalization does not establish mathematical priority or external refereeing. The campaign counts this existing entry once; the 18 supporting modules, both power monoids, and the reduced-system identity are not separate conjectures.

The earlier [two-module](https://github.com/1337isnot1337/solved-conjectures/blob/028c169ae5692b6703a23ae7f72ba9d8a92e45df/docs/verification/lean-fan-tringali-20261124-162051/receipt.json) and [nine-module](https://github.com/1337isnot1337/solved-conjectures/blob/ef2b97121a841042caf0747de3104e32465de38b/docs/verification/lean-fan-tringali-graph-20261124-162051/receipt.json) receipts remain historical partial checkpoints on the research branch. The complete receipt supersedes their scope limitations.
