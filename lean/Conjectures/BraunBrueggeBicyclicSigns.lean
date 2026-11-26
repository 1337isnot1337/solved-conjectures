import Mathlib.Data.Finset.Powerset
import Mathlib.Data.Fintype.Pi
import Mathlib.SetTheory.Cardinal.Finite
import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Tactic

/-! A sign word with prescribed total is counted by its set of positive
positions. This count applies to cycle and theta path increments. -/

open Finset

namespace BraunBruegge

variable {I : Type*}

def stepSign (b : Bool) : ℤ := if b then 1 else -1

@[simp] theorem stepSign_false : stepSign false = -1 := rfl
@[simp] theorem stepSign_true : stepSign true = 1 := rfl

@[simp] theorem stepSign_ne_zero (b : Bool) : stepSign b ≠ 0 := by
  cases b <;> decide

@[simp] theorem abs_stepSign (b : Bool) : |stepSign b| = 1 := by
  cases b <;> decide

theorem stepSign_injective : Function.Injective stepSign := by
  intro a b
  cases a <;> cases b <;> decide

theorem stepSign_test_of_unit_of_ne_zero {z : ℤ} (hb : |z| ≤ 1) (hn : z ≠ 0) :
    stepSign (decide (z = 1)) = z := by
  have he := abs_le.mp hb
  have h : z = -1 ∨ z = 1 := by omega
  rcases h with rfl | rfl <;> decide

abbrev SignsWithTotal (I : Type*) [Fintype I] (r : ℤ) := {b : I → Bool // ∑ i, stepSign (b i) = r}

private theorem sum_signs [Fintype I] (b : I → Bool) :
    ∑ i, stepSign (b i) = 2 * ((Finset.univ.filter fun i => b i).card : ℤ) - Fintype.card I := by
  calc
    ∑ i, stepSign (b i) = ∑ i, (2 * (if b i then 1 else 0 : ℤ) - 1) := by
      apply Finset.sum_congr rfl
      intro i _
      cases b i <;> decide
    _ = _ := by rw [Finset.sum_sub_distrib, ← Finset.mul_sum, Finset.sum_boole]; simp

noncomputable def signsWithTotalEquivSubsets [Fintype I] [DecidableEq I] (k : ℕ) :
    SignsWithTotal I (2 * (k : ℤ) - Fintype.card I) ≃ (Finset.univ : Finset I).powersetCard k where
  toFun b := ⟨Finset.univ.filter (fun i => b.val i), by
    have h := b.property
    rw [sum_signs] at h
    exact Finset.mem_powersetCard.mpr ⟨Finset.subset_univ _, by omega⟩⟩
  invFun s := ⟨fun i => decide (i ∈ s.val), by
    have hs := (Finset.mem_powersetCard.mp s.property).2
    have he : Finset.univ.filter (fun i => decide (i ∈ s.val)) = s.val := by ext; simp
    rw [sum_signs, he, hs]⟩
  left_inv b := by
    apply Subtype.ext
    funext i
    change decide (i ∈ Finset.univ.filter (fun j => b.val j)) = b.val i
    cases h : b.val i <;> simp [h]
  right_inv s := by
    apply Subtype.ext
    ext i
    change i ∈ Finset.univ.filter (fun j => decide (j ∈ s.val)) ↔ i ∈ s.val
    simp

theorem card_signsWithTotal_of_eq [Fintype I] (k : ℕ) (r : ℤ)
    (h : r = 2 * (k : ℤ) - Fintype.card I) : Nat.card (SignsWithTotal I r) = (Fintype.card I).choose k := by
  classical
  subst r
  rw [Nat.card_congr (signsWithTotalEquivSubsets (I := I) k), Nat.card_eq_fintype_card,
    Fintype.card_coe, Finset.card_powersetCard, Finset.card_univ]

theorem card_signsWithTotal_zero_of_even [Fintype I] (h : Even (Fintype.card I)) :
    Nat.card (SignsWithTotal I 0) = (Fintype.card I).choose (Fintype.card I / 2) := by
  obtain ⟨k, hk⟩ := h
  apply card_signsWithTotal_of_eq
  omega

theorem card_signsWithTotal_zero_of_odd [Fintype I] (h : Odd (Fintype.card I)) :
    Nat.card (SignsWithTotal I 0) = 0 := by
  apply Nat.card_eq_zero.mpr
  refine Or.inl ⟨fun b => ?_⟩
  have hb := b.property
  rw [sum_signs] at hb
  obtain ⟨k, hk⟩ := h
  omega

/-- The number of sign words of length `n` with integer total `r`. -/
def binomialSignCount (n : ℕ) (r : ℤ) : ℕ :=
  if 0 ≤ r + (n : ℤ) ∧ (r + (n : ℤ)) % 2 = 0 then
    n.choose ((r + (n : ℤ)) / 2).toNat
  else 0

theorem signsWithTotal_parity [Fintype I] {r : ℤ} (b : SignsWithTotal I r) :
    r % 2 = (Fintype.card I : ℤ) % 2 := by
  have h := b.property
  rw [sum_signs] at h
  omega

theorem card_signsWithTotal [Fintype I] (r : ℤ) :
    Nat.card (SignsWithTotal I r) = binomialSignCount (Fintype.card I) r := by
  unfold binomialSignCount
  split_ifs with h
  · apply card_signsWithTotal_of_eq
    omega
  · apply Nat.card_eq_zero.mpr
    refine Or.inl ⟨fun b => ?_⟩
    have e := b.property
    rw [sum_signs] at e
    exact h (by omega)

end BraunBruegge
