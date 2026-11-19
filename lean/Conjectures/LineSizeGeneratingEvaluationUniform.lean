import Conjectures.LineSizeGeneratingEvaluation
import Mathlib.Analysis.Normed.Group.FunctionSeries

/-! The coefficient series and the sum over core lengths converge uniformly
on every closed disk of radius strictly below one. -/
noncomputable section
namespace LineSize.Generating

open Finset Filter PowerSeries

variable {K : Type*} [NormedField K] [CharZero K] [CompleteSpace K]

omit [CompleteSpace K] in
theorem norm_seriesTerm_coreTerm_le_radius (r n : ℕ) (q : K) {R : ℝ}
    (hq : ‖q‖ ≤ R) :
    ‖seriesTerm (coreTerm r) q n‖ ≤ seriesTerm (coreTerm r) R n := by
  simp only [seriesTerm,coeff_coreTerm,map_natCast,norm_mul,norm_pow]
  exact mul_le_mul (norm_natCast_le_real _)
    (pow_le_pow_left₀ (norm_nonneg q) hq n)
    (pow_nonneg (norm_nonneg q) n) (Nat.cast_nonneg _)

theorem norm_coreValue_le_radius (r : ℕ) (q : K) {R : ℝ}
    (hR : 0 ≤ R) (hR1 : R < 1) (hq : ‖q‖ ≤ R) :
    ‖coreValue r q‖ ≤ coreValue r R := by
  have hreal : ‖R‖ < 1 := by rwa [Real.norm_eq_abs,abs_of_nonneg hR]
  exact (hasSeriesValue_coreTerm r q (hq.trans_lt hR1)).hasSum.norm_le_of_bounded
    (hasSeriesValue_coreTerm r R hreal).hasSum
    (fun n => norm_seriesTerm_coreTerm_le_radius r n q hq)

theorem uniform_coreValue {R : ℝ} (hR : 0 ≤ R) (hR1 : R < 1) :
    TendstoUniformlyOn
      (fun N (q : K) => ∑ r ∈ range N, coreValue r q)
      (fun q : K => ∑' r, coreValue r q) atTop {q | ‖q‖ ≤ R} := by
  apply tendstoUniformlyOn_tsum_nat (summable_coreValue hR hR1)
  intro r q hq
  exact norm_coreValue_le_radius r q hR hR1 hq

omit [CharZero K] [CompleteSpace K] in
theorem norm_lineSizeCount_term_le_radius (n : ℕ) (q : K) {R : ℝ}
    (hq : ‖q‖ ≤ R) :
    ‖(lineSizeCount n : K)*q^n‖ ≤ (lineSizeCount n : ℝ)*R^n := by
  rw [norm_mul,norm_pow]
  exact mul_le_mul (norm_natCast_le_real _)
    (pow_le_pow_left₀ (norm_nonneg q) hq n)
    (pow_nonneg (norm_nonneg q) n) (Nat.cast_nonneg _)

omit [CharZero K] in
theorem uniform_recordGenerating {R : ℝ} (hR : 0 ≤ R) (hR1 : R < 1) :
    TendstoUniformlyOn
      (fun N (q : K) => ∑ n ∈ range N, (lineSizeCount n : K)*q^n)
      recordGenerating atTop {q | ‖q‖ ≤ R} := by
  have hreal : ‖R‖ < 1 := by rwa [Real.norm_eq_abs,abs_of_nonneg hR]
  apply tendstoUniformlyOn_tsum_nat (hasSum_lineSizeCount R hreal).summable
  intro n q hq
  exact norm_lineSizeCount_term_le_radius n q hq

end LineSize.Generating
