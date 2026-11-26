import Conjectures.OrdinaryDarcaisPowerSeries
import Mathlib.Analysis.SpecialFunctions.Exponential

/-! Absolute evaluation of the original exponential generating product at every
complex point in the open unit disk. -/

namespace OrdinaryDarcais

open PlanePartition (weightedCoefficient weightedCoefficient_pow)

open PowerSeries

theorem weighted_exponent (x r : ℝ) (n : ℕ) :
    weightedCoefficient (exponentSeries x) r n = intensity x r n := by
  by_cases hn : n = 0
  · simp [weightedCoefficient, exponentSeries, intensity, hn]
  · simp [weightedCoefficient, exponentSeries, intensity, hn]
    ring

private theorem norm_pow_weight {x : ℝ} (hx : 0 ≤ x) (z : ℂ) (m n : ℕ) :
    ‖weightedCoefficient (exponentSeries x ^ m) z n‖ =
      weightedCoefficient (exponentSeries x ^ m) ‖z‖ n := by
  simp [weightedCoefficient, norm_pow, Complex.norm_real, Real.norm_eq_abs,
    abs_of_nonneg (exponentSeries_pow_coeff_nonneg hx m n)]

private theorem norm_exponent_weight {x : ℝ} (hx : 0 ≤ x) (z : ℂ) (n : ℕ) :
    ‖weightedCoefficient (exponentSeries x) z n‖ = intensity x ‖z‖ n := by
  simpa only [pow_one, weighted_exponent] using norm_pow_weight hx z 1 n

private theorem real_exponent_summable {x r : ℝ} (hx : 0 ≤ x) (hr : 0 ≤ r) (hr' : r < 1) :
    Summable fun n => ‖weightedCoefficient (exponentSeries x) r n‖ := by
  have hi (k : ℕ) : 0 ≤ intensity x r k := by unfold intensity; positivity
  simpa only [weighted_exponent, Real.norm_eq_abs, abs_of_nonneg (hi _)] using intensity_summable hx hr hr'

private noncomputable def majorant (x r : ℝ) (p : ℕ × ℕ) : ℝ :=
  weightedCoefficient (exponentSeries x ^ p.1) r p.2 / p.1.factorial

private theorem majorant_summable {x r : ℝ} (hx : 0 ≤ x) (hr : 0 ≤ r) (hr' : r < 1) :
    Summable (majorant x r) := by
  have hs := weightedCoefficient_pow (exponentSeries x) r (real_exponent_summable hx hr hr')
  apply (summable_prod_of_nonneg (f := majorant x r) (fun p =>
    div_nonneg (exponent_weighted_nonneg hx hr p.1 p.2) (by positivity))).2
  constructor
  · intro m
    change Summable (fun n => weightedCoefficient (exponentSeries x ^ m) r n / (m.factorial : ℝ))
    exact ((hs m).1.of_norm).div_const (m.factorial : ℝ)
  · change Summable (fun m : ℕ => ∑' n, weightedCoefficient (exponentSeries x ^ m) r n / (m.factorial : ℝ))
    simp only [tsum_div_const, (hs _).2]
    exact (NormedSpace.expSeries_div_hasSum_exp _).summable

private noncomputable def complexTerm (x : ℝ) (z : ℂ) (m n : ℕ) : ℂ :=
  weightedCoefficient (exponentSeries x ^ m) z n / m.factorial

private theorem complexTerm_summable {x : ℝ} (hx : 0 ≤ x) {z : ℂ} (hz : ‖z‖ < 1) :
    Summable (Function.uncurry (complexTerm x z)) := by
  apply Summable.of_norm
  have h := majorant_summable hx (norm_nonneg z) hz
  convert h using 1
  funext p
  simp only [Function.uncurry, complexTerm, norm_div, Complex.norm_natCast, norm_pow_weight hx,
    majorant]

private theorem complexTerm_coeff (x : ℝ) (z : ℂ) (n : ℕ) :
    ∑' m : ℕ, complexTerm x z m n = (darcais x n : ℂ) * z ^ n := by
  rw [darcais_tsum_coeff, Complex.ofReal_tsum, ← tsum_mul_right]
  congr 1
  funext m
  simp [complexTerm, weightedCoefficient, div_eq_mul_inv]
  ring

/-- The formal coefficients and the analytic exponential agree throughout the unit disk. -/
theorem darcais_hasSum {x : ℝ} (hx : 0 ≤ x) {z : ℂ} (hz : ‖z‖ < 1) :
    HasSum (fun n => (darcais x n : ℂ) * z ^ n)
      (Complex.exp (∑' n, weightedCoefficient (exponentSeries x) z n)) := by
  have h := complexTerm_summable hx hz
  have hbase : Summable fun n => ‖weightedCoefficient (exponentSeries x) z n‖ := by
    simpa only [norm_exponent_weight hx] using intensity_summable hx (norm_nonneg z) hz
  have hs := weightedCoefficient_pow (exponentSeries x) z hbase
  have hrow (m : ℕ) : ∑' n, complexTerm x z m n =
      (∑' n, weightedCoefficient (exponentSeries x) z n) ^ m / m.factorial := by
    simp only [complexTerm, tsum_div_const, (hs m).2]
  have hconv : Summable (fun n => (darcais x n : ℂ) * z ^ n) := by
    have hh : Summable fun n => ∑' m, complexTerm x z m n := h.prod_symm.prod
    simpa only [complexTerm_coeff] using hh
  apply hconv.hasSum_iff.mpr
  simp_rw [← complexTerm_coeff, h.tsum_comm, hrow]
  rw [Complex.exp_eq_exp_ℂ]
  exact (NormedSpace.expSeries_div_hasSum_exp _).tsum_eq

end OrdinaryDarcais
