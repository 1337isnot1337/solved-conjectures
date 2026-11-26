import Mathlib.RingTheory.PowerSeries.Exp
import Mathlib.NumberTheory.ArithmeticFunction.Misc
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Tactic

/-! Plane-partition coefficients with the divisor-square weight of Heim, Neuhauser and Tröger. -/

namespace PlanePartition

open Finset PowerSeries
open scoped PowerSeries

/-- The divisor-square weight. -/
def divisorSquareSum (n : ℕ) : ℕ := ∑ d ∈ Nat.divisors n, d ^ 2

theorem divisorSquareSum_eq_sigma_two (n : ℕ) : divisorSquareSum n = ArithmeticFunction.sigma 2 n :=
  ArithmeticFunction.sigma_apply.symm

@[simp] theorem divisorSquareSum_one : divisorSquareSum 1 = 1 := by
  simp [divisorSquareSum_eq_sigma_two, ArithmeticFunction.sigma_one]

/-- The exponent x times the divisor-square power series. -/
noncomputable def exponentSeries (x : ℝ) : PowerSeries ℝ :=
  PowerSeries.mk (fun n => if n = 0 then 0 else x * (divisorSquareSum n : ℝ) / n)

private theorem exponentSeries_hasSubst (x : ℝ) : PowerSeries.HasSubst (exponentSeries x) :=
  PowerSeries.HasSubst.of_constantCoeff_zero' (by simp [exponentSeries])

/-- The original plane-partition coefficient. -/
noncomputable def planePartition (x : ℝ) (n : ℕ) : ℝ :=
  PowerSeries.coeff n ((PowerSeries.exp ℝ).subst (exponentSeries x))

theorem planePartition_zero (x : ℝ) : planePartition x 0 = 1 := by
  rw [planePartition, coeff_subst' (exponentSeries_hasSubst x)]
  rw [finsum_eq_single _ 0]
  · simp [coeff_exp]
  · intro n hn
    simp [coeff_zero_eq_constantCoeff, exponentSeries, zero_pow hn]

private theorem exponentSeries_derivative_coeff (x : ℝ) (n : ℕ) :
    coeff n (derivative (exponentSeries x)) = x * (divisorSquareSum (n + 1) : ℝ) := by
  rw [coeff_derivative]
  simp only [exponentSeries, coeff_mk, Nat.add_one_ne_zero, ite_false]
  simp only [Nat.cast_add, Nat.cast_one]
  exact div_mul_cancel₀ _ (show (n : ℝ) + 1 ≠ 0 by positivity)

/-- Formal differentiation gives the defining recurrence for the plane-partition polynomials. -/
theorem planePartition_recurrence (x : ℝ) (n : ℕ) :
    ((n + 1 : ℕ) : ℝ) * planePartition x (n + 1) =
      x * ∑ k ∈ range (n + 1), (divisorSquareSum (k + 1) : ℝ) * planePartition x (n - k) := by
  let F := (PowerSeries.exp ℝ).subst (exponentSeries x)
  have hd : derivative F = derivative (exponentSeries x) * F := by
    dsimp [F]
    rw [derivative_subst (exponentSeries_hasSubst x), derivative_exp, mul_comm]
  have hc := congrArg (coeff n) hd
  rw [coeff_derivative, coeff_mul] at hc
  rw [Nat.sum_antidiagonal_eq_sum_range_succ
    (fun i j => coeff i (derivative (exponentSeries x)) * coeff j F)] at hc
  simp_rw [exponentSeries_derivative_coeff, mul_assoc, ← Finset.mul_sum] at hc
  rw [mul_comm]
  simpa only [Nat.cast_add, Nat.cast_one, planePartition, F] using hc

theorem planePartition_pos {x : ℝ} (hx : 0 < x) (n : ℕ) : 0 < planePartition x n := by
  induction n using Nat.strong_induction_on with
  | h n ih =>
    cases n with
    | zero => simp [planePartition_zero]
    | succ n =>
      have hn (k : ℕ) : 0 ≤ (divisorSquareSum (k + 1) : ℝ) * planePartition x (n - k) :=
        mul_nonneg (Nat.cast_nonneg _) (ih _ (by omega)).le
      have hsum : 0 < ∑ k ∈ range (n + 1), (divisorSquareSum (k + 1) : ℝ) * planePartition x (n - k) :=
        (show 0 < (divisorSquareSum (0 + 1) : ℝ) * planePartition x (n - 0) by
          simpa using ih n (Nat.lt_succ_self n)).trans_le
          (single_le_sum (fun k _ => hn k) (by simp))
      have he := planePartition_recurrence x n
      have hp : 0 < ((n + 1 : ℕ) : ℝ) * planePartition x (n + 1) :=
        he.symm ▸ mul_pos hx hsum
      by_contra! hn
      exact hp.not_ge (mul_nonpos_of_nonneg_of_nonpos (by positivity) hn)

/-- The power inequality stated in the plane-partition root conjecture. -/
def RootDecrease (x : ℝ) (n : ℕ) : Prop :=
  planePartition x (n + 1) ^ n < planePartition x n ^ (n + 1)

/-- Log-concavity at the middle index of three consecutive terms. -/
def TuranAt (x : ℝ) (n : ℕ) : Prop :=
  planePartition x (n - 1) * planePartition x (n + 1) ≤ planePartition x n ^ 2

/-- The endpoint at five for the first pair is exact. -/
theorem rootDecrease_one_iff (x : ℝ) (hx : 0 < x) : RootDecrease x 1 ↔ 5 < x := by
  have h₁ := planePartition_recurrence x 0
  have h₂ := planePartition_recurrence x 1
  have hs : divisorSquareSum 2 = 5 := by decide +kernel
  norm_num [Finset.sum_range_succ, planePartition_zero, hs] at h₁ h₂
  unfold RootDecrease
  norm_num only [Nat.reduceAdd, pow_one]
  rw [h₁] at h₂ ⊢
  constructor
  · intro h
    by_contra! h'
    nlinarith only [h, h₂, mul_nonneg hx.le (sub_nonneg.mpr h')]
  · intro h
    nlinarith only [h₂, mul_pos hx (sub_pos.mpr h)]

theorem rootDecrease_succ {x : ℝ} (hx : 0 < x) {n : ℕ}
    (hroot : RootDecrease x n) (ht : TuranAt x (n + 1)) :
    RootDecrease x (n + 1) := by
  let p := planePartition x n
  let q := planePartition x (n + 1)
  let r := planePartition x (n + 2)
  have hp : 0 < p := planePartition_pos hx n
  have hq : 0 < q := planePartition_pos hx (n + 1)
  have hr : 0 < r := planePartition_pos hx (n + 2)
  have ha : (n : ℝ) * Real.log q < ((n : ℝ) + 1) * Real.log p := by
    have h := Real.log_lt_log (pow_pos hq n) hroot
    simpa only [RootDecrease, p, q, Real.log_pow, Nat.cast_add, Nat.cast_one] using h
  have hb : Real.log p + Real.log r ≤ 2 * Real.log q := by
    change p * r ≤ q ^ 2 at ht
    have h := Real.log_le_log (mul_pos hp hr) ht
    simpa [Real.log_mul hp.ne' hr.ne', Real.log_pow] using h
  have hc : ((n : ℝ) + 1) * Real.log r < ((n : ℝ) + 2) * Real.log q := by
    nlinarith only [ha, mul_le_mul_of_nonneg_left hb (show 0 ≤ (n : ℝ) + 1 by positivity)]
  apply (Real.log_lt_log_iff (pow_pos hr _) (pow_pos hq _)).mp
  simpa [p, q, r, Real.log_pow, Nat.cast_add, add_assoc] using hc

theorem rootDecrease_of_logConcave {x : ℝ} (hx : 0 < x) {b : ℕ}
    (hbase : RootDecrease x b) (ht : ∀ n, b < n → TuranAt x n) :
    ∀ n, b ≤ n → RootDecrease x n := by
  intro n hn
  induction n, hn using Nat.le_induction with
  | base => exact hbase
  | succ n hn ih => exact rootDecrease_succ hx ih (ht _ (Nat.lt_succ_of_le hn))

end PlanePartition
