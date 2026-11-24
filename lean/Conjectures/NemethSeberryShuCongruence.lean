import Mathlib.GroupTheory.PGroup
import Mathlib.LinearAlgebra.Matrix.Permanent
import Mathlib.Data.ZMod.Basic
import Mathlib.Tactic.Abel

/-!
# Németh–Seberry–Shu conjecture

This file verifies the exact combinatorial input in §3 of
`results/nemeth-seberry-shu/PROOF.md`: the binary case of the
Brualdi–Newman permanent congruence.  It is a supporting theorem, not a
formalization of the asymptotic disproof.  The Fourier-profile and uniform
permanent-asymptotic inputs remain separate obligations.

The binary circulant has the source convention `C i j = 1` iff `j - i ∈ S`.
The permanent is Mathlib's actual `Matrix.permanent`, rather than a new
unconnected counting definition.
-/

namespace NemethSeberryShu

open scoped BigOperators

variable {p : ℕ}

/-- The binary circulant with row support `S`, using the source's orientation. -/
def binaryCirculant (S : Finset (ZMod p)) : Matrix (ZMod p) (ZMod p) ℕ :=
  fun i j ↦ if j - i ∈ S then 1 else 0

/-- Permutations contributing a one to the binary-circulant permanent. -/
def SupportedPerm (S : Finset (ZMod p)) :=
  {σ : Equiv.Perm (ZMod p) // ∀ i, i - σ i ∈ S}

noncomputable instance [NeZero p] (S : Finset (ZMod p)) : Fintype (SupportedPerm S) := by
  classical
  unfold SupportedPerm
  infer_instance

/-- Simultaneous translation of the rows and columns of a permutation. -/
def translateConjugate (c : ZMod p) (σ : Equiv.Perm (ZMod p)) : Equiv.Perm (ZMod p) :=
  (Equiv.addLeft (-c)).trans (σ.trans (Equiv.addLeft c))

@[simp] theorem translateConjugate_apply (c : ZMod p) (σ : Equiv.Perm (ZMod p))
    (i : ZMod p) : translateConjugate c σ i = c + σ (i - c) := by
  simp [translateConjugate, sub_eq_add_neg, add_comm]

theorem translateConjugate_supported (S : Finset (ZMod p)) (c : ZMod p)
    (σ : SupportedPerm S) : ∀ i, i - translateConjugate c σ.val i ∈ S := by
  intro i
  rw [translateConjugate_apply]
  have he : i - (c + σ.val (i - c)) = (i - c) - σ.val (i - c) := by abel
  rw [he]
  exact σ.property (i - c)

noncomputable instance supportedPermAction (S : Finset (ZMod p)) :
    MulAction (Multiplicative (ZMod p)) (SupportedPerm S) where
  smul c σ := ⟨translateConjugate c.toAdd σ.val, translateConjugate_supported S c.toAdd σ⟩
  one_smul σ := by
    apply Subtype.ext
    ext i
    change translateConjugate 0 σ.val i = σ.val i
    simp
  mul_smul c d σ := by
    apply Subtype.ext
    ext i
    change translateConjugate (c.toAdd + d.toAdd) σ.val i =
      translateConjugate c.toAdd (translateConjugate d.toAdd σ.val) i
    simp [sub_sub, add_assoc]

@[simp] theorem supported_smul_apply (S : Finset (ZMod p))
    (c : Multiplicative (ZMod p)) (σ : SupportedPerm S) (i : ZMod p) :
    (c • σ).val i = c.toAdd + σ.val (i - c.toAdd) := by
  change translateConjugate c.toAdd σ.val i = _
  exact translateConjugate_apply _ _ _

/-- A fixed admissible permutation is a translation. -/
theorem fixed_perm_apply (S : Finset (ZMod p))
    (σ : MulAction.fixedPoints (Multiplicative (ZMod p)) (SupportedPerm S))
    (i : ZMod p) : σ.val.val i = i + σ.val.val 0 := by
  have h := MulAction.mem_fixedPoints.mp σ.property (Multiplicative.ofAdd i)
  have hi := congrArg (fun τ : SupportedPerm S ↦ τ.val i) h
  simpa using hi.symm

/-- The support element labeling a fixed permutation. -/
def fixedPermToSupport (S : Finset (ZMod p))
    (σ : MulAction.fixedPoints (Multiplicative (ZMod p)) (SupportedPerm S)) : S :=
  ⟨-σ.val.val 0, by simpa using σ.val.property 0⟩

/-- A support element gives the constant-displacement permutation. -/
def supportToFixedPerm (S : Finset (ZMod p)) (s : S) :
    MulAction.fixedPoints (Multiplicative (ZMod p)) (SupportedPerm S) := by
  refine ⟨⟨Equiv.addRight (-s.val), ?_⟩, ?_⟩
  · intro i
    simp
  · apply MulAction.mem_fixedPoints.mpr
    intro c
    apply Subtype.ext
    ext i
    change translateConjugate c.toAdd (Equiv.addRight (-s.val)) i = i + -s.val
    simp [sub_eq_add_neg, add_comm, add_left_comm]

/-- Fixed points of simultaneous translation are exactly the `|S|` translations. -/
def fixedPermEquivSupport (S : Finset (ZMod p)) :
    MulAction.fixedPoints (Multiplicative (ZMod p)) (SupportedPerm S) ≃ S where
  toFun := fixedPermToSupport S
  invFun := supportToFixedPerm S
  left_inv σ := by
    apply Subtype.ext
    apply Subtype.ext
    ext i
    simp [supportToFixedPerm, fixedPermToSupport, fixed_perm_apply S σ i]
  right_inv s := by
    apply Subtype.ext
    simp [fixedPermToSupport, supportToFixedPerm]

variable [NeZero p]

/-- The actual permanent counts precisely the admissible permutations. -/
theorem permanent_eq_card_supported (S : Finset (ZMod p)) :
    (binaryCirculant S).permanent = Nat.card (SupportedPerm S) := by
  classical
  simp only [Matrix.permanent, binaryCirculant, Finset.prod_boole, Finset.mem_univ,
    forall_const]
  simp [SupportedPerm, Nat.card_eq_fintype_card, Fintype.card_subtype]

/-- Brualdi–Newman, Theorem 3.2, for a binary circulant of prime order. -/
theorem permanent_modEq_card (hp : p.Prime) (S : Finset (ZMod p)) :
    (binaryCirculant S).permanent ≡ S.card [MOD p] := by
  let : Fact p.Prime := ⟨hp⟩
  have hG : IsPGroup p (Multiplicative (ZMod p)) := by
    apply IsPGroup.of_card (n := 1)
    simp
  have h := hG.card_modEq_card_fixedPoints (SupportedPerm S)
  rw [Nat.card_congr (fixedPermEquivSupport S)] at h
  simpa [permanent_eq_card_supported, Nat.card_eq_fintype_card] using h

/-- Distinct proper row sums cannot produce the same permanent. -/
theorem card_eq_of_permanent_eq (hp : p.Prime) (S T : Finset (ZMod p))
    (hS : S.card < p) (hT : T.card < p)
    (h : (binaryCirculant S).permanent = (binaryCirculant T).permanent) :
    S.card = T.card := by
  have hs := permanent_modEq_card hp S
  rw [h] at hs
  exact (hs.symm.trans (permanent_modEq_card hp T)).eq_of_lt_of_lt hS hT

/-- The finite set of all binary-circulant permanent values at this order. -/
noncomputable def permanentValues (p : ℕ) [NeZero p] : Finset ℕ :=
  Finset.univ.image fun S : Finset (ZMod p) ↦ (binaryCirculant S).permanent

theorem permanent_mem_values (S : Finset (ZMod p)) :
    (binaryCirculant S).permanent ∈ permanentValues p := by
  classical
  exact Finset.mem_image.mpr ⟨S, Finset.mem_univ S, rfl⟩

/-- The exact cross-row-sum counting step of the written NSS disproof.

The hypotheses concern genuine circulant supports, with `M` distinct values
for every row sum in `K`.  The row sums have to be strictly less than `p`:
the empty and full supports have the same residue modulo `p`.
-/
theorem row_family_count (hp : p.Prime) (K : Finset ℕ) (M : ℕ)
    (hK : ∀ k ∈ K, k < p)
    (S : K → Fin M → Finset (ZMod p))
    (hcard : ∀ k j, (S k j).card = k.val)
    (hsep : ∀ k, Function.Injective fun j ↦ (binaryCirculant (S k j)).permanent) :
    M * K.card ≤ (permanentValues p).card := by
  classical
  let f : K × Fin M → permanentValues p := fun t ↦
    ⟨(binaryCirculant (S t.1 t.2)).permanent, permanent_mem_values _⟩
  have hf : Function.Injective f := by
    rintro ⟨k, i⟩ ⟨l, j⟩ hij
    have he : (binaryCirculant (S k i)).permanent =
        (binaryCirculant (S l j)).permanent := congrArg Subtype.val hij
    have hk : k = l := by
      apply Subtype.ext
      have hs := card_eq_of_permanent_eq hp (S k i) (S l j)
        (by rw [hcard]; exact hK k.val k.property)
        (by rw [hcard]; exact hK l.val l.property) he
      simpa only [hcard] using hs
    subst l
    have hi := hsep k he
    subst j
    rfl
  have hc := Fintype.card_le_of_injective f hf
  simpa [mul_comm] using hc

end NemethSeberryShu
