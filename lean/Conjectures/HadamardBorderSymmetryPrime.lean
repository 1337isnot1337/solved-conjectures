import Mathlib.Algebra.Group.Action.End
import Mathlib.Algebra.Group.Action.Units
import Mathlib.Algebra.BigOperators.Group.Finset.Piecewise
import Mathlib.Algebra.Field.ZMod
import Mathlib.Data.Int.ModEq
import Mathlib.GroupTheory.Perm.Cycle.Type
import Mathlib.Tactic.NormNum.Prime

/-!
# Order-37 multiplier symmetry on a length-149 sign row

The multiplier acts on the actual negative support. Prime-order permutation
cycles give the support cardinality modulo 37, and a nonidentity multiplier
of the field `ZMod 149` fixes precisely zero. No orbit decomposition is a
hypothesis of the fiber-sum conclusion.
-/

namespace HadamardBorderSymmetry

open scoped BigOperators

local instance symmetryPrime149Fact : Fact (Nat.Prime 149) := ⟨by norm_num⟩

/-- The cardinality of a finite prime-exponent permutation set is congruent
to its fixed-point count. -/
theorem prime_permutation_card_modEq {α : Type*} [Fintype α] [DecidableEq α]
    (σ : Equiv.Perm α) {p : ℕ} (hp : Nat.Prime p) (hσ : σ ^ p = 1) :
    Nat.ModEq p (Fintype.card α) (Fintype.card (Function.fixedPoints σ)) := by
  classical
  let : Fact (Nat.Prime p) := ⟨hp⟩
  have hsum : σ.cycleType.sum = p * σ.cycleType.card := by
    rw [Equiv.Perm.cycleType_of_pow_prime_eq_one hσ]
    simp [mul_comm]
  have hcard : Fintype.card (Function.fixedPoints σ) +
      p * σ.cycleType.card = Fintype.card α := by
    have hle := σ.sum_cycleType_le
    rw [hsum] at hle
    rw [σ.card_fixedPoints, hsum]
    omega
  rw [← hcard]
  simp [Nat.ModEq]

/-- A nonidentity multiplier of `ZMod 149` fixes only zero. -/
theorem multiplier149_fixed_iff (u : (ZMod 149)ˣ) (hu : u ≠ 1) (x : ZMod 149) :
    (u : ZMod 149) * x = x ↔ x = 0 := by
  have hv : (u : ZMod 149) ≠ 1 := fun h => hu (Units.ext h)
  constructor
  · intro h
    have hz : ((u : ZMod 149) - 1) * x = 0 := by
      rw [sub_mul, one_mul, h, sub_self]
    exact (mul_eq_zero.mp hz).resolve_left (sub_ne_zero.mpr hv)
  · rintro rfl
    exact mul_zero _

/-- An invariant support has cardinality zero or one modulo 37 according
to whether it contains zero. -/
theorem order37_support_card_modEq (D : Finset (ZMod 149))
    (u : (ZMod 149)ˣ) (hu : orderOf u = 37)
    (hinv : ∀ x, (u : ZMod 149) * x ∈ D ↔ x ∈ D) :
    Nat.ModEq 37 D.card (if 0 ∈ D then 1 else 0) := by
  classical
  let e := MulAction.toPermHom (ZMod 149)ˣ (ZMod 149)
  have he_apply (x : ZMod 149) : e u x = (u : ZMod 149) * x := rfl
  have hstable (x : ZMod 149) : (e u) x ∈ D ↔ x ∈ D := by
    rw [he_apply]
    exact hinv x
  let σ : Equiv.Perm D := (e u).subtypePerm hstable
  have hune : u ≠ 1 := by
    intro h
    rw [h, orderOf_one] at hu
    norm_num at hu
  have hupow : u ^ 37 = 1 := by
    simpa only [hu] using pow_orderOf_eq_one u
  have he : (e u) ^ 37 = 1 := by
    rw [← map_pow, hupow, map_one]
  have hσ : σ ^ 37 = 1 := by
    dsimp only [σ]
    rw [Equiv.Perm.subtypePerm_pow]
    simp only [he]
    apply Equiv.ext
    intro x
    apply Subtype.ext
    rfl
  have hfix (x : D) : σ x = x ↔ (x : ZMod 149) = 0 := by
    rw [Subtype.ext_iff]
    change (e u) (x : ZMod 149) = (x : ZMod 149) ↔ _
    rw [he_apply]
    exact multiplier149_fixed_iff u hune x
  have hfixed : Fintype.card (Function.fixedPoints σ) =
      if 0 ∈ D then 1 else 0 := by
    by_cases h0 : (0 : ZMod 149) ∈ D
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
  have hc := prime_permutation_card_modEq σ (by norm_num : Nat.Prime 37) hσ
  simpa only [Fintype.card_coe, hfixed] using hc

/-- The usual count of negative entries in an integer sign row. -/
theorem sign_sum_eq_card_sub_twice_negative {α : Type*} [Fintype α]
    (f : α → ℤ) (hsign : ∀ x, f x = 1 ∨ f x = -1) :
    (∑ x, f x) = (Fintype.card α : ℤ) -
      2 * (Finset.univ.filter (fun x => f x = -1)).card := by
  classical
  have hf (x : α) : f x = 1 - 2 * (if f x = -1 then (1 : ℤ) else 0) := by
    rcases hsign x with h | h <;> simp [h]
  have hd : (∑ x, if f x = -1 then (1 : ℤ) else 0) =
      ((Finset.univ.filter (fun x => f x = -1)).card : ℤ) := by
    rw [← Finset.sum_filter]
    simp
  calc
    (∑ x, f x) = ∑ x, (1 - 2 * (if f x = -1 then (1 : ℤ) else 0)) :=
      Finset.sum_congr rfl (fun x _ => hf x)
    _ = _ := by
      rw [Finset.sum_sub_distrib, ← Finset.mul_sum, hd]
      simp

/-- A multiplier-invariant sign row has sum congruent to its zero entry. -/
theorem order37_fiber_sum_modEq_zero (f : ZMod 149 → ℤ)
    (hsign : ∀ x, f x = 1 ∨ f x = -1)
    (u : (ZMod 149)ˣ) (hu : orderOf u = 37)
    (hinv : ∀ x, f ((u : ZMod 149) * x) = f x) :
    Int.ModEq 37 (∑ x, f x) (f 0) := by
  classical
  let D := Finset.univ.filter (fun x => f x = -1)
  have hD (x : ZMod 149) : x ∈ D ↔ f x = -1 := by
    simp only [D, Finset.mem_filter, Finset.mem_univ, true_and]
  have hc := order37_support_card_modEq D u hu (fun x => by
    rw [hD, hD, hinv x])
  simp only [hD] at hc
  have hi : Int.ModEq 37 (D.card : ℤ) ((if f 0 = -1 then 1 else 0 : ℕ) : ℤ) :=
    Int.natCast_modEq_iff.mpr hc
  have hsum : (∑ x, f x) = 149 - 2 * (D.card : ℤ) := by
    simpa only [ZMod.card, Nat.cast_ofNat] using sign_sum_eq_card_sub_twice_negative f hsign
  have hzero : (1 : ℤ) - 2 * ((if f 0 = -1 then 1 else 0 : ℕ) : ℤ) = f 0 := by
    rcases hsign 0 with h | h <;> simp [h]
  have h := (show Int.ModEq 37 149 1 by decide).sub (hi.mul_left 2)
  rwa [← hsum, hzero] at h

/-- The literal order-37 fiber congruence used in the border obstruction. -/
theorem order37_fiber_sum_modEq (f : ZMod 149 → ℤ)
    (hsign : ∀ x, f x = 1 ∨ f x = -1)
    (u : (ZMod 149)ˣ) (hu : orderOf u = 37)
    (hinv : ∀ x, f ((u : ZMod 149) * x) = f x) :
    Int.ModEq 37 (∑ x, f x) 1 ∨ Int.ModEq 37 (∑ x, f x) (-1) := by
  have h := order37_fiber_sum_modEq_zero f hsign u hu hinv
  rcases hsign 0 with h0 | h0
  · exact Or.inl (h0 ▸ h)
  · exact Or.inr (h0 ▸ h)

end HadamardBorderSymmetry
