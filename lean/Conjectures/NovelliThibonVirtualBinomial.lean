module
public import Mathlib.RingTheory.Polynomial.Pochhammer
public import Mathlib.Data.Rat.Cast.Order
public import Mathlib.Tactic

@[expose] public section
namespace NovelliThibon

open Polynomial

/-- The counting polynomial for choosing (k) shifted strict labels
from an alphabet with indeterminate multiplicity. -/
noncomputable def shiftedBinomial (k weak : ℕ) : ℚ[X] :=
  (descPochhammer ℚ k).comp (X + C (weak:ℚ)) * C ((k.factorial:ℚ)⁻¹)

theorem shiftedBinomial_eval (k weak : ℕ) (x : ℚ) :
    (shiftedBinomial k weak).eval x =
      (descPochhammer ℚ k).eval (x+weak) / k.factorial := by
  simp [shiftedBinomial,div_eq_mul_inv]

theorem shiftedBinomial_eval_nat (k weak m : ℕ) :
    (shiftedBinomial k weak).eval (m:ℚ) = ((m+weak).choose k:ℚ) := by
  rw [shiftedBinomial_eval,Nat.cast_choose_eq_descPochhammer_div ℚ, Nat.cast_add]

theorem descPochhammer_eval_neg_one (k : ℕ) :
    (descPochhammer ℚ k).eval (-1) = (-1:ℚ)^k * k.factorial := by
  induction k with
  | zero => simp
  | succ k ih =>
    rw [descPochhammer_succ_eval,ih,pow_succ,Nat.factorial_succ,Nat.cast_mul,Nat.cast_succ]
    ring

/-- Continuation of the multiplicity to (-1) leaves a nonzero term
exactly when no weak boundary is allowed in the negative prefix. -/
theorem shiftedBinomial_eval_neg_one (k weak : ℕ) (hw : weak ≤ k) :
    (shiftedBinomial k weak).eval (-1) = if weak=0 then (-1:ℚ)^k else 0 := by
  by_cases h : weak=0
  · subst weak
    rw [shiftedBinomial_eval]
    simp only [Nat.cast_zero,add_zero,descPochhammer_eval_neg_one]
    exact mul_div_cancel_right₀ _ (Nat.cast_ne_zero.mpr k.factorial_ne_zero)
  · have hp : 1 ≤ weak := Nat.one_le_iff_ne_zero.mpr h
    have hs : (-1:ℚ)+(weak:ℚ) = ((weak-1:ℕ):ℚ) := by
      rw [Nat.cast_sub hp,Nat.cast_one]
      ring
    rw [shiftedBinomial_eval,hs,← Nat.cast_choose_eq_descPochhammer_div ℚ]
    rw [Nat.choose_eq_zero_of_lt (by omega),Nat.cast_zero,ite_eq_right h]

end NovelliThibon
