import Conjectures.KovalevZeroFreeTransport
import Conjectures.KovalevZeroFreeRemainder

/-!
# Kovalev's square-root Taylor-section zero-free conjecture

Comparison of the actual beta remainders, obtained by integration of the
proved pointwise disk bound along the proved beta transport. This is the
square-root instance of equations (7) and (8) of the recorded argument.
-/

namespace Conjectures.KovalevZeroFree

open MeasureTheory ProbabilityTheory Set

noncomputable section

theorem odds_oddsScale {v t : ℝ} (hv : 0 < v) (ht : t ∈ Ioo (0 : ℝ) 1) :
    odds (oddsScale v t) = v * odds t := by
  have hd := (oddsScale_den_pos hv ht).ne'
  have h1 := (sub_pos.mpr (oddsScale_mem hv ht).2).ne'
  have ht1 := (sub_pos.mpr ht.2).ne'
  unfold odds
  apply (div_eq_iff h1).mpr
  unfold oddsScale
  field_simp
  ring

theorem resolvent_linear_comparison {z : ℂ} {v s : ℝ}
    (hz : ‖z‖ ≤ 1) (hv0 : 0 ≤ v) (hv1 : v ≤ 1) (hs : 0 ≤ s) :
    ‖((2 - v : ℝ) : ℂ) * resolvent z s - resolvent z (v * s)‖ ≤ 1 - v := by
  have hw : 0 ≤ ((1 - z) * (s : ℂ)).re := by
    simp only [Complex.mul_re, Complex.sub_re, Complex.one_re, Complex.ofReal_re,
      Complex.sub_im, Complex.one_im, Complex.ofReal_im, mul_zero, sub_zero]
    exact mul_nonneg (sub_nonneg.mpr ((Complex.re_le_norm z).trans hz)) hs
  have h := inverse_sqrt_linear_comparison hv0 hv1 hw
  convert h using 1
  unfold resolvent
  congr 3
  push_cast
  ring

theorem beta_product_ae_mem {a b c : ℝ}
    (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) :
    ∀ᵐ p : ℝ × ℝ ∂(betaMeasure a b).prod (betaMeasure (a + b) c),
      p.1 ∈ Ioo (0 : ℝ) 1 ∧ p.2 ∈ Ioo (0 : ℝ) 1 := by
  let := isProbabilityMeasureBeta ha hb
  let := isProbabilityMeasureBeta (add_pos ha hb) hc
  apply (Measure.ae_prod_iff_ae_ae (measurableSet_Ioo.prod measurableSet_Ioo)).mpr
  filter_upwards [beta_ae_mem a b] with v hv
  filter_upwards [beta_ae_mem (a + b) c] with t ht
  exact ⟨hv, ht⟩

theorem integral_beta_two_sub {a b : ℝ} (ha : 0 < a) (hb : 0 < b) :
    ∫ v, 2 - v ∂betaMeasure a b = 1 + b / (a + b) := by
  let := isProbabilityMeasureBeta ha hb
  rw [integral_sub (integrable_const _) (beta_integrable_id ha hb),
    integral_beta_id ha hb]
  have htwo : ∫ v, (2 : ℝ) ∂betaMeasure a b = 2 := by simp
  rw [htwo]
  field_simp
  ring

theorem beta_resolvent_comparison {a b : ℝ} {z : ℂ}
    (ha : 0 < a) (hb : 0 < b) (hz : ‖z‖ ≤ 1) :
    ‖((1 + b / (a + b) : ℝ) : ℂ) *
        (∫ t, resolvent z (odds t) ∂betaMeasure (a + b) (1 / 2)) -
      (∫ t, resolvent z (odds t) ∂betaMeasure a (1 / 2))‖ ≤ b / (a + b) := by
  let := isProbabilityMeasureBeta ha hb
  let := isProbabilityMeasureBeta (add_pos ha hb) (show 0 < (1 / 2 : ℝ) by norm_num)
  let μ := (betaMeasure a b).prod (betaMeasure (a + b) (1 / 2))
  let A : ℝ × ℝ → ℂ := fun p => ((2 - p.1 : ℝ) : ℂ) * resolvent z (odds p.2)
  let B : ℝ × ℝ → ℂ := fun p => resolvent z (odds (oddsScale p.1 p.2))
  have hs : ∀ᵐ p ∂μ, p.1 ∈ Ioo (0 : ℝ) 1 ∧ p.2 ∈ Ioo (0 : ℝ) 1 :=
    beta_product_ae_mem ha hb (by norm_num)
  have hAm : Measurable A := by dsimp [A]; fun_prop
  have hBm : Measurable B := by dsimp [B]; fun_prop
  have hAi : Integrable A μ := by
    apply (integrable_const (2 : ℝ)).mono' hAm.aestronglyMeasurable
    filter_upwards [hs] with p hp
    dsimp [A]
    rw [norm_mul, Complex.norm_real, Real.norm_eq_abs,
      abs_of_pos (show 0 < 2 - p.1 by linarith [hp.1.2])]
    calc
      _ ≤ 2 - p.1 := mul_le_of_le_one_right (by linarith [hp.1.2])
        (resolvent_norm_le_one hz (odds_pos hp.2).le)
      _ ≤ 2 := by linarith [hp.1.1]
  have hBi : Integrable B μ := by
    apply (integrable_const (1 : ℝ)).mono' hBm.aestronglyMeasurable
    filter_upwards [hs] with p hp
    exact resolvent_norm_le_one hz (odds_pos (oddsScale_mem hp.1.1 hp.2)).le
  have hgi : Integrable (fun p : ℝ × ℝ => 1 - p.1) μ := by
    apply (integrable_const (1 : ℝ)).mono' (by fun_prop)
    filter_upwards [hs] with p hp
    rw [Real.norm_eq_abs, abs_of_pos (sub_pos.mpr hp.1.2)]
    linarith [hp.1.1]
  have hpoint : ∀ᵐ p ∂μ, ‖A p - B p‖ ≤ 1 - p.1 := by
    filter_upwards [hs] with p hp
    dsimp [A, B]
    rw [odds_oddsScale hp.1.1 hp.2]
    exact resolvent_linear_comparison hz hp.1.1.le hp.1.2.le (odds_pos hp.2).le
  have hbound : ‖∫ p, A p - B p ∂μ‖ ≤ ∫ p, 1 - p.1 ∂μ :=
    (norm_integral_le_integral_norm _).trans (integral_mono_ae (hAi.sub hBi).norm hgi hpoint)
  have hA : ∫ p, A p ∂μ = ((1 + b / (a + b) : ℝ) : ℂ) *
      (∫ t, resolvent z (odds t) ∂betaMeasure (a + b) (1 / 2)) := by
    change (∫ p : ℝ × ℝ, ((2 - p.1 : ℝ) : ℂ) * resolvent z (odds p.2)
      ∂(betaMeasure a b).prod (betaMeasure (a + b) (1 / 2))) = _
    rw [integral_prod_mul (fun v : ℝ => ((2 - v : ℝ) : ℂ))
      (fun t => resolvent z (odds t)), integral_complex_ofReal, integral_beta_two_sub ha hb]
  have hB : ∫ p, B p ∂μ = ∫ t, resolvent z (odds t) ∂betaMeasure a (1 / 2) := by
    exact integral_oddsScale_beta ha hb (by norm_num) _
      ((measurable_resolvent z).comp measurable_odds)
  have hg : ∫ p : ℝ × ℝ, 1 - p.1 ∂μ = b / (a + b) := by
    change (∫ p : ℝ × ℝ, 1 - p.1
      ∂(betaMeasure a b).prod (betaMeasure (a + b) (1 / 2))) = _
    rw [integral_fun_fst, integral_beta_one_sub ha hb]
    have hprob : (betaMeasure (a + b) (1 / 2)).real univ = 1 := by
      rw [measureReal_def, measure_univ, ENNReal.toReal_one]
    rw [hprob, one_smul]
  rw [integral_sub hAi hBi, hA, hB, hg] at hbound
  exact hbound

/-- Comparison for every pair of distinct section degrees. -/
theorem remainder_comparison {M n : ℕ} (hMn : M < n) {z : ℂ} (hz : ‖z‖ ≤ 1) :
    ‖((1 + ((n - M : ℕ) : ℝ) / ((n : ℝ) + 1) : ℝ) : ℂ) * remainder n z -
      remainder M z‖ ≤ ((n - M : ℕ) : ℝ) / ((n : ℝ) + 1) := by
  have ha : 0 < (M : ℝ) + 1 := by positivity
  have hb : 0 < ((n - M : ℕ) : ℝ) := by exact_mod_cast Nat.sub_pos_of_lt hMn
  have he : (M : ℝ) + 1 + ((n - M : ℕ) : ℝ) = (n : ℝ) + 1 := by
    rw [Nat.cast_sub hMn.le]
    ring
  have h := beta_resolvent_comparison ha hb hz
  rw [he] at h
  exact h

end

end Conjectures.KovalevZeroFree
