import Mathlib.RingTheory.PowerSeries.Exp
import Mathlib.NumberTheory.ArithmeticFunction.Misc
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Tactic

/-! The literal sigma-one D’Arcais series and the root-inequality propagation. -/

namespace OrdinaryDarcais

open Finset PowerSeries
open scoped PowerSeries

/-- The ordinary divisor-sum weight. -/
def divisorSum (n : ℕ) : ℕ := ∑ d ∈ Nat.divisors n, d

theorem divisorSum_eq_sigma_one (n : ℕ) : divisorSum n = ArithmeticFunction.sigma 1 n :=
  (ArithmeticFunction.sigma_one_apply n).symm

@[simp] theorem divisorSum_one : divisorSum 1 = 1 := by
  simp [divisorSum_eq_sigma_one, ArithmeticFunction.sigma_one]

/-- The exponent x times the ordinary divisor-sum power series. -/
noncomputable def exponentSeries (x : ℝ) : PowerSeries ℝ :=
  PowerSeries.mk (fun n => if n = 0 then 0 else x * (divisorSum n : ℝ) / n)

private theorem exponentSeries_hasSubst (x : ℝ) : PowerSeries.HasSubst (exponentSeries x) :=
  PowerSeries.HasSubst.of_constantCoeff_zero' (by simp [exponentSeries])

/-- The original ordinary D’Arcais coefficient. -/
noncomputable def darcais (x : ℝ) (n : ℕ) : ℝ :=
  PowerSeries.coeff n ((PowerSeries.exp ℝ).subst (exponentSeries x))

theorem darcais_zero (x : ℝ) : darcais x 0 = 1 := by
  rw [darcais, coeff_subst' (exponentSeries_hasSubst x)]
  rw [finsum_eq_single _ 0]
  · simp [coeff_exp]
  · intro n hn
    simp [coeff_zero_eq_constantCoeff, exponentSeries, zero_pow hn]

private theorem exponentSeries_derivative_coeff (x : ℝ) (n : ℕ) :
    coeff n (derivative (exponentSeries x)) = x * (divisorSum (n + 1) : ℝ) := by
  rw [coeff_derivative]
  simp only [exponentSeries, coeff_mk, Nat.add_one_ne_zero, ite_false]
  simp only [Nat.cast_add, Nat.cast_one]
  exact div_mul_cancel₀ _ (show (n : ℝ) + 1 ≠ 0 by positivity)

/-- Formal differentiation yields the ordinary D’Arcais recurrence. -/
theorem darcais_recurrence (x : ℝ) (n : ℕ) :
    ((n + 1 : ℕ) : ℝ) * darcais x (n + 1) =
      x * ∑ k ∈ range (n + 1), (divisorSum (k + 1) : ℝ) * darcais x (n - k) := by
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
  simpa only [Nat.cast_add, Nat.cast_one, darcais, F] using hc

theorem darcais_pos {x : ℝ} (hx : 0 < x) (n : ℕ) : 0 < darcais x n := by
  induction n using Nat.strong_induction_on with
  | h n ih =>
    cases n with
    | zero => simp [darcais_zero]
    | succ n =>
      have hn (k : ℕ) : 0 ≤ (divisorSum (k + 1) : ℝ) * darcais x (n - k) :=
        mul_nonneg (Nat.cast_nonneg _) (ih _ (by omega)).le
      have hsum : 0 < ∑ k ∈ range (n + 1), (divisorSum (k + 1) : ℝ) * darcais x (n - k) :=
        (show 0 < (divisorSum (0 + 1) : ℝ) * darcais x (n - 0) by
          simpa using ih n (Nat.lt_succ_self n)).trans_le
          (single_le_sum (fun k _ => hn k) (by simp))
      have he := darcais_recurrence x n
      have hp : 0 < ((n + 1 : ℕ) : ℝ) * darcais x (n + 1) :=
        he.symm ▸ mul_pos hx hsum
      by_contra! hn
      exact hp.not_ge (mul_nonpos_of_nonneg_of_nonpos (by positivity) hn)

/-- The power inequality stated in the ordinary root conjecture. -/
def RootDecrease (x : ℝ) (n : ℕ) : Prop :=
  darcais x (n + 1) ^ n < darcais x n ^ (n + 1)

/-- Log-concavity at the middle index of three consecutive terms. -/
def TuranAt (x : ℝ) (n : ℕ) : Prop :=
  darcais x (n - 1) * darcais x (n + 1) ≤ darcais x n ^ 2

/-- A positive centered difference of the geometrically tilted coefficients
implies the strict Turán inequality after canceling the tilt. -/
theorem strictTuran_of_tilted_center {x r c : ℝ} (hx : 0 < x) (hr : 0 < r)
    (hc : 0 < c) {n : ℕ} (hn : 0 < n)
    (h : (c * r ^ (n - 1) * darcais x (n - 1) + c * r ^ (n + 1) * darcais x (n + 1)) / 2 <
      c * r ^ n * darcais x n) :
    darcais x (n - 1) * darcais x (n + 1) < darcais x n ^ 2 := by
  let a := c * r ^ (n - 1) * darcais x (n - 1)
  let b := c * r ^ n * darcais x n
  let d := c * r ^ (n + 1) * darcais x (n + 1)
  have ha : 0 < a := mul_pos (mul_pos hc (pow_pos hr _)) (darcais_pos hx _)
  have hd : 0 < d := mul_pos (mul_pos hc (pow_pos hr _)) (darcais_pos hx _)
  change (a + d) / 2 < b at h
  have hap : 0 ≤ (a + d) / 2 := by positivity
  have hprod : a * d < b ^ 2 := by
    have hmean : a * d ≤ ((a + d) / 2) ^ 2 := by nlinarith [sq_nonneg (a - d)]
    exact hmean.trans_lt (pow_lt_pow_left₀ h hap (by decide))
  have hp : r ^ (n - 1) * r ^ (n + 1) = r ^ n * r ^ n := by
    rw [← pow_add, ← pow_add]
    congr 1
    omega
  have h₁ : a * d = (c * r ^ n) ^ 2 * (darcais x (n - 1) * darcais x (n + 1)) := by
    calc
      _ = c ^ 2 * (r ^ (n - 1) * r ^ (n + 1)) * (darcais x (n - 1) * darcais x (n + 1)) := by
        dsimp [a, d]; ring
      _ = _ := by rw [hp]; ring
  rw [h₁, show b ^ 2 = (c * r ^ n) ^ 2 * darcais x n ^ 2 by simp [b, mul_pow]] at hprod
  exact (mul_lt_mul_iff_right₀ (by positivity)).mp hprod

/-- A strict root comparison propagates across a log-concavity step. -/
theorem rootDecrease_succ {x : ℝ} (hx : 0 < x) {n : ℕ}
    (hroot : RootDecrease x n) (ht : TuranAt x (n + 1)) :
    RootDecrease x (n + 1) := by
  let p := darcais x n
  let q := darcais x (n + 1)
  let r := darcais x (n + 2)
  have hp : 0 < p := darcais_pos hx n
  have hq : 0 < q := darcais_pos hx (n + 1)
  have hr : 0 < r := darcais_pos hx (n + 2)
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

end OrdinaryDarcais
