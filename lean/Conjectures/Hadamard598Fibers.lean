import Conjectures.HadamardBorderSymmetryPrime
import Mathlib.Tactic.NormNum
import Lean.Elab.Tactic.Omega

/-!
# Actual order-eleven symmetry on a 23-point sign fibre

Prime-exponent permutation cycles give the negative-support cardinality
modulo eleven. Since the fibre has 23 points, the invariant sign sum is its
zero entry plus 22 times an integer in {-1,0,1}. No orbit decomposition or
list of possible compressed values is assumed.
-/

namespace Hadamard598

open scoped BigOperators
open HadamardBorderSymmetry

local instance hadamard598Prime23Fact : Fact (Nat.Prime 23) := ⟨by norm_num⟩

/-- A nonidentity multiplier of `ZMod 23` fixes only zero. -/
theorem multiplier23_fixed_iff (u : (ZMod 23)ˣ) (hu : u ≠ 1) (x : ZMod 23) :
    (u : ZMod 23) * x = x ↔ x = 0 := by
  have hv : (u : ZMod 23) ≠ 1 := fun h => hu (Units.ext h)
  constructor
  · intro h
    have hz : ((u : ZMod 23) - 1) * x = 0 := by
      rw [sub_mul, one_mul, h, sub_self]
    exact (mul_eq_zero.mp hz).resolve_left (sub_ne_zero.mpr hv)
  · rintro rfl
    exact mul_zero _

/-- An invariant support has cardinality zero or one modulo 11 according
to whether it contains zero. -/
theorem order11_support_card_modEq (D : Finset (ZMod 23))
    (u : (ZMod 23)ˣ) (hu : orderOf u = 11)
    (hinv : ∀ x, (u : ZMod 23) * x ∈ D ↔ x ∈ D) :
    Nat.ModEq 11 D.card (if 0 ∈ D then 1 else 0) := by
  classical
  let e := MulAction.toPermHom (ZMod 23)ˣ (ZMod 23)
  have he_apply (x : ZMod 23) : e u x = (u : ZMod 23) * x := rfl
  have hstable (x : ZMod 23) : (e u) x ∈ D ↔ x ∈ D := by
    rw [he_apply]
    exact hinv x
  let σ : Equiv.Perm D := (e u).subtypePerm hstable
  have hune : u ≠ 1 := by
    intro h
    rw [h, orderOf_one] at hu
    norm_num at hu
  have hupow : u ^ 11 = 1 := by
    simpa only [hu] using pow_orderOf_eq_one u
  have he : (e u) ^ 11 = 1 := by
    rw [← map_pow, hupow, map_one]
  have hσ : σ ^ 11 = 1 := by
    dsimp only [σ]
    rw [Equiv.Perm.subtypePerm_pow]
    simp only [he]
    apply Equiv.ext
    intro x
    apply Subtype.ext
    rfl
  have hfix (x : D) : σ x = x ↔ (x : ZMod 23) = 0 := by
    rw [Subtype.ext_iff]
    change (e u) (x : ZMod 23) = (x : ZMod 23) ↔ _
    rw [he_apply]
    exact multiplier23_fixed_iff u hune x
  have hfixed : Fintype.card (Function.fixedPoints σ) =
      if 0 ∈ D then 1 else 0 := by
    by_cases h0 : (0 : ZMod 23) ∈ D
    · simp only [h0, ite_true]
      apply Fintype.card_eq_one_iff.mpr
      refine ⟨⟨⟨0, h0⟩, (hfix ⟨0, h0⟩).mpr rfl⟩, ?_⟩
      intro x
      apply Subtype.ext
      apply Subtype.ext
      exact (hfix x.val).mp x.property
    · simp only [h0, ite_false]
      apply Fintype.card_eq_zero_iff.mpr
      refine ⟨fun x => ?_⟩
      have hx := (hfix x.val).mp x.property
      exact h0 (hx ▸ x.val.property)
  have hc := prime_permutation_card_modEq σ (by norm_num : Nat.Prime 11) hσ
  simpa only [Fintype.card_coe, hfixed] using hc

/-- A multiplier-invariant sign row has sum congruent to its zero entry. -/
theorem order11_fiber_sum_modEq_zero (f : ZMod 23 → ℤ)
    (hsign : ∀ x, f x = 1 ∨ f x = -1)
    (u : (ZMod 23)ˣ) (hu : orderOf u = 11)
    (hinv : ∀ x, f ((u : ZMod 23) * x) = f x) :
    Int.ModEq 11 (∑ x, f x) (f 0) := by
  classical
  let D := Finset.univ.filter (fun x => f x = -1)
  have hD (x : ZMod 23) : x ∈ D ↔ f x = -1 := by
    simp only [D, Finset.mem_filter, Finset.mem_univ, true_and]
  have hc := order11_support_card_modEq D u hu (fun x => by
    rw [hD, hD, hinv x])
  simp only [hD] at hc
  have hi : Int.ModEq 11 (D.card : ℤ) ((if f 0 = -1 then 1 else 0 : ℕ) : ℤ) :=
    Int.natCast_modEq_iff.mpr hc
  have hsum : (∑ x, f x) = 23 - 2 * (D.card : ℤ) := by
    simpa only [ZMod.card, Nat.cast_ofNat] using sign_sum_eq_card_sub_twice_negative f hsign
  have hzero : (1 : ℤ) - 2 * ((if f 0 = -1 then 1 else 0 : ℕ) : ℤ) = f 0 := by
    rcases hsign 0 with h | h <;> simp [h]
  have h := (show Int.ModEq 11 23 1 by decide).sub (hi.mul_left 2)
  rwa [← hsum, hzero] at h

/-- Sign-valuedness alone bounds the actual fibre sum. -/
theorem fiber_sum_bounds (f : ZMod 23 → ℤ)
    (hsign : ∀ x, f x = 1 ∨ f x = -1) :
    -23 ≤ (∑ x, f x) ∧ (∑ x, f x) ≤ 23 := by
  have hlo (x : ZMod 23) : (-1 : ℤ) ≤ f x := by
    rcases hsign x with h | h <;> omega
  have hhi (x : ZMod 23) : f x ≤ (1 : ℤ) := by
    rcases hsign x with h | h <;> omega
  constructor
  · have h := Finset.sum_le_sum (fun x (_ : x ∈ Finset.univ) => hlo x)
    norm_num only [Finset.sum_const, Finset.card_univ, ZMod.card, nsmul_eq_mul] at h
    exact h
  · have h := Finset.sum_le_sum (fun x (_ : x ∈ Finset.univ) => hhi x)
    norm_num only [Finset.sum_const, Finset.card_univ, ZMod.card, nsmul_eq_mul] at h
    exact h

theorem order11_fiber_sum_mod22 (f : ZMod 23 → ℤ)
    (hsign : ∀ x, f x = 1 ∨ f x = -1)
    (u : (ZMod 23)ˣ) (hu : orderOf u = 11)
    (hinv : ∀ x, f ((u : ZMod 23) * x) = f x) :
    Int.ModEq 22 (∑ x, f x) (f 0) := by
  classical
  have hmod := order11_fiber_sum_modEq_zero f hsign u hu hinv
  have hsum : (∑ x, f x) = 23 -
      2 * ((Finset.univ.filter (fun x => f x = -1)).card : ℤ) := by
    simpa only [ZMod.card, Nat.cast_ofNat] using
      sign_sum_eq_card_sub_twice_negative f hsign
  change (∑ x, f x) % 22 = f 0 % 22
  change (∑ x, f x) % 11 = f 0 % 11 at hmod
  rcases hsign 0 with hzero | hzero <;> omega

/-- The exceptional coefficient is determined by the actual row, not chosen. -/
def fiberException (f : ZMod 23 → ℤ) : ℤ := ((∑ x, f x) - f 0) / 22

theorem order11_fiber_sum_decomposition (f : ZMod 23 → ℤ)
    (hsign : ∀ x, f x = 1 ∨ f x = -1)
    (u : (ZMod 23)ˣ) (hu : orderOf u = 11)
    (hinv : ∀ x, f ((u : ZMod 23) * x) = f x) :
    (∑ x, f x) = f 0 + 22 * fiberException f ∧
      (fiberException f = -1 ∨ fiberException f = 0 ∨ fiberException f = 1) := by
  have hmod := order11_fiber_sum_mod22 f hsign u hu hinv
  have hbounds := fiber_sum_bounds f hsign
  change (∑ x, f x) % 22 = f 0 % 22 at hmod
  unfold fiberException
  rcases hsign 0 with hzero | hzero <;> omega

end Hadamard598
