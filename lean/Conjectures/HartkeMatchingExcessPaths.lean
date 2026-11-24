import Conjectures.HartkeMatchingExcessSplit
import Mathlib.GroupTheory.Perm.Fin
import Mathlib.Order.Interval.Finset.Fin
import Lean.Elab.Tactic.Omega

/-!
# Hartke–Stolee–West–Yancey's matching-excess conjecture

Cycle-cover enumeration for the increasing-arc construction. A permutation
maps each target to its source. Away from target zero its value cannot
increase. Removing the greatest moved vertex gives an exact bijection with
the preceding path prefixes. The predicate `A` records permitted increasing
arcs, so the same recurrence handles deletion of the arc `1 → u`.
-/

namespace HartkeMatchingExcess

open Finset Equiv

variable {R : ℕ}

def UpperPermutation (σ : Equiv.Perm (Fin (R + 1))) : Prop :=
  ∀ i, i ≠ 0 → σ i ≤ i

def PathPermutation (A : Fin (R + 1) → Fin (R + 1) → Prop)
    (σ : Equiv.Perm (Fin (R + 1))) : Prop :=
  UpperPermutation σ ∧ ∀ i, i ≠ 0 → σ i ≠ i → A (σ i) i

theorem upperPermutation_fixed_above {σ : Equiv.Perm (Fin (R + 1))}
    (hσ : UpperPermutation σ) {x : Fin (R + 1)} (hx : σ 0 < x) : σ x = x := by
  classical
  have hx0 : x ≠ 0 := by
    intro he
    subst x
    exact (not_lt_of_ge (Fin.zero_le _)) hx
  have hsub : (Iio x).image σ ⊆ Iio x := by
    intro z hz
    obtain ⟨y, hy, rfl⟩ := mem_image.mp hz
    rw [mem_Iio] at hy ⊢
    by_cases hy0 : y = 0
    · simpa only [hy0] using hx
    · exact lt_of_le_of_lt (hσ y hy0) hy
  have heq : (Iio x).image σ = Iio x :=
    eq_of_subset_of_card_le hsub (by rw [card_image_of_injective _ σ.injective])
  by_contra hne
  have hlt : σ x < x := lt_of_le_of_ne (hσ x hx0) hne
  have hm : σ x ∈ (Iio x).image σ := by rw [heq]; exact mem_Iio.mpr hlt
  obtain ⟨y, hy, hxy⟩ := mem_image.mp hm
  have hyx : y = x := σ.injective hxy
  simp only [hyx, mem_Iio, lt_self_iff_false] at hy

theorem upperPermutation_zero_iff {σ : Equiv.Perm (Fin (R + 1))}
    (hσ : UpperPermutation σ) : σ 0 = 0 ↔ σ = 1 := by
  constructor
  · intro hz
    apply Equiv.ext
    intro x
    by_cases hx : x = 0
    · simpa [hx] using hz
    · exact upperPermutation_fixed_above hσ (by rw [hz]; exact Fin.pos_iff_ne_zero.mpr hx)
  · rintro rfl
    rfl

def liftReturn (σ : Equiv.Perm (Fin (R + 1))) (j : Fin (R + 1)) :
    Equiv.Perm (Fin (R + 1)) := Equiv.swap (σ 0) j * σ

@[simp] theorem liftReturn_zero (σ : Equiv.Perm (Fin (R + 1))) (j : Fin (R + 1)) :
    liftReturn σ j 0 = j := by simp [liftReturn]

theorem liftReturn_at {σ : Equiv.Perm (Fin (R + 1))} (hσ : UpperPermutation σ)
    {j : Fin (R + 1)} (hj : σ 0 < j) : liftReturn σ j j = σ 0 := by
  simp only [liftReturn, Equiv.Perm.mul_apply, upperPermutation_fixed_above hσ hj,
    Equiv.swap_apply_right]

theorem liftReturn_other {σ : Equiv.Perm (Fin (R + 1))} (hσ : UpperPermutation σ)
    {j x : Fin (R + 1)} (hj : σ 0 < j) (hx0 : x ≠ 0) (hxj : x ≠ j) :
    liftReturn σ j x = σ x := by
  apply Equiv.swap_apply_of_ne_of_ne
  · exact fun he => hx0 (σ.injective he)
  · intro he
    apply hxj
    apply σ.injective
    simpa only [upperPermutation_fixed_above hσ hj] using he

theorem liftReturn_path {A : Fin (R + 1) → Fin (R + 1) → Prop}
    {σ : Equiv.Perm (Fin (R + 1))} (hσ : PathPermutation A σ)
    {j : Fin (R + 1)} (hj : σ 0 < j) (hA : A (σ 0) j) :
    PathPermutation A (liftReturn σ j) := by
  constructor
  · intro x hx0
    by_cases hxj : x = j
    · subst x
      rw [liftReturn_at hσ.1 hj]
      exact hj.le
    · rw [liftReturn_other hσ.1 hj hx0 hxj]
      exact hσ.1 x hx0
  · intro x hx0 hxmove
    by_cases hxj : x = j
    · subst x
      simpa only [liftReturn_at hσ.1 hj] using hA
    · rw [liftReturn_other hσ.1 hj hx0 hxj] at hxmove ⊢
      exact hσ.2 x hx0 hxmove

def removeReturn (σ : Equiv.Perm (Fin (R + 1))) (j : Fin (R + 1)) :
    Equiv.Perm (Fin (R + 1)) := Equiv.swap (σ j) j * σ

theorem removeReturn_zero {σ : Equiv.Perm (Fin (R + 1))} {j : Fin (R + 1)}
    (hj : σ 0 = j) : removeReturn σ j 0 = σ j := by simp [removeReturn, hj]

@[simp] theorem removeReturn_at (σ : Equiv.Perm (Fin (R + 1))) (j : Fin (R + 1)) :
    removeReturn σ j j = j := by simp [removeReturn]

theorem removeReturn_other {σ : Equiv.Perm (Fin (R + 1))} {j x : Fin (R + 1)}
    (hj : σ 0 = j) (hx0 : x ≠ 0) (hxj : x ≠ j) : removeReturn σ j x = σ x := by
  apply Equiv.swap_apply_of_ne_of_ne
  · exact fun he => hxj (σ.injective he)
  · intro he
    apply hx0
    exact σ.injective (he.trans hj.symm)

theorem return_at_lt {σ : Equiv.Perm (Fin (R + 1))} (hσ : UpperPermutation σ)
    {j : Fin (R + 1)} (hj0 : j ≠ 0) (hj : σ 0 = j) : σ j < j := by
  apply lt_of_le_of_ne (hσ j hj0)
  intro he
  have he0 : σ j = σ 0 := he.trans hj.symm
  exact hj0 (σ.injective he0)

theorem removeReturn_path {A : Fin (R + 1) → Fin (R + 1) → Prop}
    {σ : Equiv.Perm (Fin (R + 1))} (hσ : PathPermutation A σ)
    {j : Fin (R + 1)} (hj : σ 0 = j) : PathPermutation A (removeReturn σ j) := by
  constructor
  · intro x hx0
    by_cases hxj : x = j
    · subst x; simp
    · rw [removeReturn_other hj hx0 hxj]
      exact hσ.1 x hx0
  · intro x hx0 hxmove
    by_cases hxj : x = j
    · subst x; exact False.elim (hxmove (removeReturn_at σ j))
    · rw [removeReturn_other hj hx0 hxj] at hxmove ⊢
      exact hσ.2 x hx0 hxmove

abbrev ReturnFiber (A : Fin (R + 1) → Fin (R + 1) → Prop) (j : Fin (R + 1)) :=
  {σ : Equiv.Perm (Fin (R + 1)) // PathPermutation A σ ∧ σ 0 = j}

abbrev PreviousFiber (A : Fin (R + 1) → Fin (R + 1) → Prop) (j : Fin (R + 1)) :=
  {σ : Equiv.Perm (Fin (R + 1)) // PathPermutation A σ ∧ σ 0 < j ∧ A (σ 0) j}

/-- Delete or insert the last vertex of the unique increasing nontrivial cycle. -/
def returnFiberEquiv (A : Fin (R + 1) → Fin (R + 1) → Prop)
    (j : Fin (R + 1)) (hj0 : j ≠ 0) : ReturnFiber A j ≃ PreviousFiber A j where
  toFun σ := ⟨removeReturn σ.1 j, removeReturn_path σ.2.1 σ.2.2,
    by rw [removeReturn_zero σ.2.2]; exact return_at_lt σ.2.1.1 hj0 σ.2.2,
    by
      rw [removeReturn_zero σ.2.2]
      exact σ.2.1.2 j hj0 (ne_of_lt (return_at_lt σ.2.1.1 hj0 σ.2.2))⟩
  invFun σ := ⟨liftReturn σ.1 j, liftReturn_path σ.2.1 σ.2.2.1 σ.2.2.2,
    liftReturn_zero σ.1 j⟩
  left_inv σ := by
    apply Subtype.ext
    apply Equiv.ext
    intro x
    simp only [liftReturn, removeReturn, Equiv.Perm.mul_apply,
      σ.2.2, Equiv.swap_apply_right, Equiv.swap_apply_self]
  right_inv σ := by
    apply Subtype.ext
    apply Equiv.ext
    intro x
    change Equiv.swap (liftReturn σ.1 j j) j (liftReturn σ.1 j x) = σ.1 x
    rw [liftReturn_at σ.2.1.1 σ.2.2.1]
    exact Equiv.swap_apply_self _ _ _

theorem returnFiber_card (A : Fin (R + 1) → Fin (R + 1) → Prop)
    (j : Fin (R + 1)) (hj0 : j ≠ 0) :
    Nat.card (ReturnFiber A j) = Nat.card (PreviousFiber A j) :=
  Nat.card_congr (returnFiberEquiv A j hj0)

end HartkeMatchingExcess
