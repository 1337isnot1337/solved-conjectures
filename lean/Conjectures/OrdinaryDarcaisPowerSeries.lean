import Conjectures.OrdinaryDarcaisPhase
import Conjectures.HeimNeuhauserPlanePartitionPowerSeries

/-! The ordinary coefficients in the convergent exponential power series. -/

namespace OrdinaryDarcais

open Finset PowerSeries
open PlanePartition (weightedCoefficient)
open scoped PowerSeries

theorem exponentSeries_coeff_nonneg {x : ℝ} (hx : 0 ≤ x) (k : ℕ) :
    0 ≤ coeff k (exponentSeries x) := by
  simp only [exponentSeries, coeff_mk]
  split <;> positivity

theorem exponentSeries_pow_coeff_nonneg {x : ℝ} (hx : 0 ≤ x) (m n : ℕ) :
    0 ≤ coeff n (exponentSeries x ^ m) := by
  induction m generalizing n with
  | zero => simp only [pow_zero, coeff_one]; split <;> positivity
  | succ m ih =>
    rw [pow_succ, coeff_mul]
    exact sum_nonneg (fun p _ => mul_nonneg (ih p.1) (exponentSeries_coeff_nonneg hx p.2))

theorem darcais_tsum_coeff (x : ℝ) (n : ℕ) :
    darcais x n = ∑' m : ℕ, (m.factorial : ℝ)⁻¹ * coeff n (exponentSeries x ^ m) := by
  have hc : PowerSeries.HasSubst (exponentSeries x) :=
    PowerSeries.HasSubst.of_constantCoeff_zero' (by simp [exponentSeries])
  rw [darcais, coeff_subst' hc, ← tsum_eq_finsum (L := .unconditional ℕ) (coeff_subst_finite' hc (PowerSeries.exp ℝ) n)]
  simp [coeff_exp]

theorem exponent_weighted_nonneg {x r : ℝ} (hx : 0 ≤ x) (hr : 0 ≤ r) (m n : ℕ) :
    0 ≤ weightedCoefficient (exponentSeries x ^ m) r n :=
  mul_nonneg (exponentSeries_pow_coeff_nonneg hx m n) (pow_nonneg hr _)

end OrdinaryDarcais
