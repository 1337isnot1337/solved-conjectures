import Conjectures.FeldheimWeightedTailAnalysis
import Conjectures.FeldheimWeightedTailProbability

/-!
# Feldheim–Feldheim’s weighted tail conjecture

The final contradiction in §4, with all analytic and product-measure
bridges instantiated. This intermediate lemma exposes only the atom-safe
log-tail integral inequality, which the Stieltjes module proves for the
actual law before the final unconditional theorem invokes this reduction.
-/

open Set MeasureTheory ProbabilityTheory Filter
open scoped Topology

namespace Conjectures.FeldheimWeightedTail

noncomputable section

theorem exists_large_tailRatio_of_log_integral (μ ν : Measure ℝ)
    [IsProbabilityMeasure μ] [IsProbabilityMeasure ν]
    (hμ : UnboundedLaw μ) (hν : UnboundedLaw ν)
    (hIntegral : ∀ a b : ℝ, a < b →
      logTail μ b-logTail μ a ≤ ∫ x in Ioc a b, (survival μ x)⁻¹ ∂μ)
    {t : ℝ} (ht : 0 < t) (ht1 : t < 1) (C M : ℝ) :
    ∃ m : ℝ, M ≤ m ∧ C < tailRatio μ ν t m := by
  by_contra hnot
  push Not at hnot
  let D := max C 1
  have hD1 : 1 ≤ D := le_max_right C 1
  have hD : 0 < D := lt_of_lt_of_le zero_lt_one hD1
  have hL : 0 ≤ Real.log D := Real.log_nonneg hD1
  have hbound (m : ℝ) (hm : M ≤ m) :
      weightedTail μ ν t m ≤ D*survival μ m*survival ν m := by
    have hh : tailRatio μ ν t m ≤ D := (hnot m hm).trans (le_max_left C 1)
    have hh' := (div_le_iff₀ (mul_pos (hμ m) (hν m))).mp hh
    simpa only [mul_assoc] using hh'
  have hR := rectangleBound_of_probability_bound μ ν hμ hν ht ht1 hD hbound
  obtain ⟨E,hE,hwin⟩ := monotone_rectangle_windows ht ht1 hL
    (logTail_monotone μ hμ) (logTail_monotone ν hν)
    (logTail_nonneg μ) (logTail_nonneg ν)
    (logTail_right_continuous μ hμ) (logTail_right_continuous ν hν)
    (logTail_tendsto_atTop μ hμ) hR
  let P := 2*E+Real.log D
  let η := min t (1-t)
  have hη : 0 < η := lt_min ht (sub_pos.mpr ht1)
  have he : 0 < Real.exp (-(2*P)) := Real.exp_pos _
  obtain ⟨j,hj⟩ := exists_nat_gt
    (max 1 ((D+Real.exp (-(2*P))*P)/(Real.exp (-(2*P))*η)))
  have hj1 : 1 ≤ j := by
    have hh : (1 : ℝ) < j := (le_max_left _ _).trans_lt hj
    have hh' : (1 : ℝ) ≤ j := hh.le
    exact_mod_cast hh'
  have hlarge : D < Real.exp (-(2*P))*(η*(j : ℝ)-P) := by
    have hh := (le_max_right 1 ((D+Real.exp (-(2*P))*P)/(Real.exp (-(2*P))*η))).trans_lt hj
    have hh' := (div_lt_iff₀ (mul_pos he hη)).mp hh
    nlinarith only [hh']
  obtain ⟨m,d,s,c,hd,hfar,hrise,hH⟩ := hwin j hj1 M
  have hmM : M ≤ m := by
    have hh := (le_max_left M M).trans_lt hfar
    linarith
  have hRw : RectangleBoundOn (logTail μ) (logTail ν) (Icc (m-d) (m+d)) t (Real.log D) := by
    intro x hx y hy
    exact hR x ((le_max_left M M).trans (hfar.le.trans hx.1))
      y ((le_max_left M M).trans (hfar.le.trans hy.1))
  have hest := weighted_window_estimates ht ht1 hd hrise hRw hH
  have hlower := tailRatio_lower_integral μ ν hμ hν ht1
    (a := m-sliceWidth t d) (m := m) (B := 2*P) (by
      intro x hx
      exact hest.1 x ⟨hx.1.le,hx.2⟩)
  have hint := hIntegral (m-sliceWidth t d) m
    (sub_lt_self m (sliceWidth_pos ht ht1 hd))
  have hinc : η*(j : ℝ)-P ≤ ∫ x in Ioc (m-sliceWidth t d) m, (survival μ x)⁻¹ ∂μ :=
    hest.2.trans hint
  have hcomp := (mul_le_mul_of_nonneg_left hinc he.le).trans hlower
  have hbounded : tailRatio μ ν t m ≤ D := (hnot m hmM).trans (le_max_left C 1)
  exact (not_lt_of_ge (hcomp.trans hbounded)) hlarge

end

end Conjectures.FeldheimWeightedTail
