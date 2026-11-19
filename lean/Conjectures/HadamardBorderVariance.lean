import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Algebra.Order.Ring.Abs
import Mathlib.Algebra.Ring.Int.Parity
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.IntervalCases
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring
import Lean.Elab.Tactic.Omega

/-!
# Integer variance on four cosets

The variance is the sum of the six squared pairwise differences. Its zero
and three cases classify the rows needed in the fixed-border normalization.
All entries are arbitrary integers; no parity or positivity is assumed here.
-/

namespace HadamardBorderVariance

open scoped BigOperators

def variance (x : Fin 4 → ℤ) : ℤ :=
  4 * (∑ q, x q ^ 2) - (∑ q, x q) ^ 2

/-- Three equal entries and a unique exceptional entry differing by one. -/
def SingleException (x : Fin 4 → ℤ) : Prop :=
  ∃ (baseline : ℤ) (exception : Fin 4) (ε : ℤ),
    (ε = 1 ∨ ε = -1) ∧
      ∀ q, x q = baseline + if q = exception then ε else 0

theorem variance_eq_six_squares (x : Fin 4 → ℤ) :
    variance x =
      (x 0 - x 1) ^ 2 + (x 0 - x 2) ^ 2 + (x 0 - x 3) ^ 2 +
      (x 1 - x 2) ^ 2 + (x 1 - x 3) ^ 2 + (x 2 - x 3) ^ 2 := by
  simp only [variance, Fin.sum_univ_four]
  ring

theorem variance_eq_pairwise (x : Fin 4 → ℤ) :
    variance x = ∑ q : Fin 4, ∑ r : Fin 4 with q < r, (x q - x r) ^ 2 := by
  rw [variance_eq_six_squares]
  simp [Finset.sum_filter, Fin.sum_univ_four] <;> ring

theorem variance_nonneg (x : Fin 4 → ℤ) : 0 ≤ variance x := by
  rw [variance_eq_six_squares]
  nlinarith only [sq_nonneg (x 0 - x 1), sq_nonneg (x 0 - x 2),
    sq_nonneg (x 0 - x 3), sq_nonneg (x 1 - x 2),
    sq_nonneg (x 1 - x 3), sq_nonneg (x 2 - x 3)]

theorem sq_sub_le_variance (x : Fin 4 → ℤ) (q r : Fin 4) :
    (x q - x r) ^ 2 ≤ variance x := by
  rw [variance_eq_six_squares]
  have h01 := sq_nonneg (x 0 - x 1)
  have h02 := sq_nonneg (x 0 - x 2)
  have h03 := sq_nonneg (x 0 - x 3)
  have h12 := sq_nonneg (x 1 - x 2)
  have h13 := sq_nonneg (x 1 - x 3)
  have h23 := sq_nonneg (x 2 - x 3)
  fin_cases q <;> fin_cases r <;> nlinarith only [h01, h02, h03, h12, h13, h23]

theorem variance_mod_four (x : Fin 4 → ℤ) :
    variance x % 4 = 0 ∨ variance x % 4 = 3 := by
  have hs := Int.sq_emod_four (∑ q, x q)
  unfold variance
  omega

theorem variance_eq_zero_iff (x : Fin 4 → ℤ) :
    variance x = 0 ↔ ∃ baseline : ℤ, ∀ q, x q = baseline := by
  constructor
  · intro hzero
    refine ⟨x 0, ?_⟩
    intro q
    have hle := sq_sub_le_variance x q 0
    rw [hzero] at hle
    have hsq : (x q - x 0) ^ 2 = 0 :=
      le_antisymm hle (sq_nonneg (x q - x 0))
    have hsub := sq_eq_zero_iff.mp hsq
    omega
  · rintro ⟨baseline, hconstant⟩
    simp only [variance, Fin.sum_univ_four, hconstant]
    ring

private theorem int_bounds_of_square_le_three (a : ℤ) (h : a ^ 2 ≤ 3) :
    -1 ≤ a ∧ a ≤ 1 := by
  have hsq : a ^ 2 < (2 : ℤ) ^ 2 := by omega
  have habs := sq_lt_sq.mp hsq
  norm_num at habs
  have hbounds := abs_lt.mp habs
  omega

private theorem three_differences_of_variance_three (a b c : ℤ)
    (h : a ^ 2 + b ^ 2 + c ^ 2 + (a - b) ^ 2 + (a - c) ^ 2 +
      (b - c) ^ 2 = 3) :
    (a = -1 ∧ b = -1 ∧ c = -1) ∨
    (a = -1 ∧ b = 0 ∧ c = 0) ∨
    (a = 0 ∧ b = -1 ∧ c = 0) ∨
    (a = 0 ∧ b = 0 ∧ c = -1) ∨
    (a = 0 ∧ b = 0 ∧ c = 1) ∨
    (a = 0 ∧ b = 1 ∧ c = 0) ∨
    (a = 1 ∧ b = 0 ∧ c = 0) ∨
    (a = 1 ∧ b = 1 ∧ c = 1) := by
  have ha : a ^ 2 ≤ 3 := by
    nlinarith only [h, sq_nonneg b, sq_nonneg c, sq_nonneg (a - b),
      sq_nonneg (a - c), sq_nonneg (b - c)]
  have hb : b ^ 2 ≤ 3 := by
    nlinarith only [h, sq_nonneg a, sq_nonneg c, sq_nonneg (a - b),
      sq_nonneg (a - c), sq_nonneg (b - c)]
  have hc : c ^ 2 ≤ 3 := by
    nlinarith only [h, sq_nonneg a, sq_nonneg b, sq_nonneg (a - b),
      sq_nonneg (a - c), sq_nonneg (b - c)]
  obtain ⟨ha0, ha1⟩ := int_bounds_of_square_le_three a ha
  obtain ⟨hb0, hb1⟩ := int_bounds_of_square_le_three b hb
  obtain ⟨hc0, hc1⟩ := int_bounds_of_square_le_three c hc
  interval_cases a <;> interval_cases b <;> interval_cases c <;> norm_num at *

theorem variance_eq_three_iff (x : Fin 4 → ℤ) :
    variance x = 3 ↔ SingleException x := by
  constructor
  · intro hthree
    have hdiff :
        (x 1 - x 0) ^ 2 + (x 2 - x 0) ^ 2 + (x 3 - x 0) ^ 2 +
        ((x 1 - x 0) - (x 2 - x 0)) ^ 2 +
        ((x 1 - x 0) - (x 3 - x 0)) ^ 2 +
        ((x 2 - x 0) - (x 3 - x 0)) ^ 2 = 3 := by
      calc
        _ = variance x := by rw [variance_eq_six_squares]; ring
        _ = 3 := hthree
    have hcases := three_differences_of_variance_three
      (x 1 - x 0) (x 2 - x 0) (x 3 - x 0) hdiff
    rcases hcases with ⟨ha, hb, hc⟩ | ⟨ha, hb, hc⟩ | ⟨ha, hb, hc⟩ |
      ⟨ha, hb, hc⟩ | ⟨ha, hb, hc⟩ | ⟨ha, hb, hc⟩ | ⟨ha, hb, hc⟩ |
      ⟨ha, hb, hc⟩
    · refine ⟨x 0 - 1, 0, 1, Or.inl rfl, ?_⟩
      intro q
      fin_cases q <;> norm_num <;> omega
    · refine ⟨x 0, 1, -1, Or.inr rfl, ?_⟩
      intro q
      fin_cases q <;> norm_num <;> omega
    · refine ⟨x 0, 2, -1, Or.inr rfl, ?_⟩
      intro q
      fin_cases q <;> norm_num <;> omega
    · refine ⟨x 0, 3, -1, Or.inr rfl, ?_⟩
      intro q
      fin_cases q <;> norm_num <;> omega
    · refine ⟨x 0, 3, 1, Or.inl rfl, ?_⟩
      intro q
      fin_cases q <;> norm_num <;> omega
    · refine ⟨x 0, 2, 1, Or.inl rfl, ?_⟩
      intro q
      fin_cases q <;> norm_num <;> omega
    · refine ⟨x 0, 1, 1, Or.inl rfl, ?_⟩
      intro q
      fin_cases q <;> norm_num <;> omega
    · refine ⟨x 0 + 1, 0, -1, Or.inr rfl, ?_⟩
      intro q
      fin_cases q <;> norm_num <;> omega
  · rintro ⟨baseline, exception, ε, hε, hshape⟩
    rcases hε with rfl | rfl <;> fin_cases exception <;>
      simp [variance, Fin.sum_univ_four, hshape] <;> ring

theorem variance_affine (x : Fin 4 → ℤ) (a b : ℤ) :
    variance (fun q => a * x q + b) = a ^ 2 * variance x := by
  simp only [variance, Fin.sum_univ_four]
  ring

end HadamardBorderVariance
