import Conjectures.OrdinaryDarcaisCentral
import Conjectures.HeimNeuhauserPlanePartition

/-! The central Fourier contribution for the divisor-square saddle, including
the variance threshold 251 and the remaining tail threshold two fifths. -/

namespace PlanePartition

open Real Finset Set
open scoped Interval
open OrdinaryDarcais (normalizedIntegrand)

noncomputable def mainLower (u : ℝ) : ℝ :=
  (73 / 81) * (1 - 1 / 753) * (u ^ 2 / 2) * exp (-(u ^ 2 / 2))

theorem central_lower_integral :
    (2 / 5 : ℝ) < ∫ u in (0 : ℝ)..2, mainLower u := by
  let c : ℝ := ((73 / 81) * (1 - 1 / 753)) / ((239 / 288) * (1 - 1 / 1503))
  have h (u : ℝ) : mainLower u = c * OrdinaryDarcais.mainLower u := by
    unfold mainLower OrdinaryDarcais.mainLower c
    ring
  simp_rw [h, intervalIntegral.integral_const_mul]
  exact lt_trans (by norm_num [c] : (2 / 5 : ℝ) < c * (19 / 50))
    (mul_lt_mul_of_pos_left OrdinaryDarcais.central_lower_integral (by norm_num [c]))

/-- Integrating the cubic lower bound for sine gives the quartic lower bound. -/
theorem cosineDefect_lower {t : ℝ} (ht : 0 ≤ t) :
    t ^ 2 / 2 - t ^ 4 / 24 ≤ 1 - cos t := by
  have h := intervalIntegral.integral_mono_on (μ := MeasureTheory.volume) (a := (0 : ℝ)) (b := t) ht
    ((show Continuous (fun s : ℝ => s - s ^ 3 / 6) by fun_prop).intervalIntegrable ..)
    (continuous_sin.intervalIntegrable ..)
    (fun s hs => (lt_or_eq_of_le hs.1).elim (fun h => (sin_gt_sub_cube h).le) (fun h => by simp [← h]))
  rw [intervalIntegral.integral_sub (f := fun s : ℝ => s) (g := fun s => s ^ 3 / 6) (continuous_id.intervalIntegrable ..)
    ((show Continuous (fun s : ℝ => s ^ 3 / 6) by fun_prop).intervalIntegrable ..),
    integral_id, intervalIntegral.integral_div, integral_pow, integral_sin, cos_zero] at h
  norm_num at h
  linarith

private theorem mainLower_le {V u : ℝ} {A θ : ℝ → ℝ} (hV : 251 ≤ V)
    (hu : 0 ≤ u) (hu' : u ≤ 2) (hA : A (u / sqrt V) ≤ u ^ 2 / 2)
    (hθ : |θ (u / sqrt V)| ≤ (1 / 3) * u ^ 3 / 6) :
    mainLower u ≤ normalizedIntegrand V A θ u := by
  have hV₀ : 0 < V := by linarith
  have hs : 0 < sqrt V := sqrt_pos.mpr hV₀
  have ht : 0 ≤ u / sqrt V := div_nonneg hu hs.le
  have hsq : u ^ 2 ≤ 4 := by nlinarith [mul_nonneg hu (sub_nonneg.mpr hu')]
  have htsq : (u / sqrt V) ^ 2 ≤ 4 / 251 := by
    rw [div_pow, sq_sqrt hV₀.le, div_le_div_iff₀ hV₀ (by norm_num : (0 : ℝ) < 251)]
    linarith
  have hdef : (u ^ 2 / 2) * (1 - 1 / 753) ≤ V * (1 - cos (u / sqrt V)) := by
    have htV : V * (u / sqrt V) ^ 2 = u ^ 2 := by
      rw [div_pow, sq_sqrt hV₀.le, mul_div_cancel₀ _ hV₀.ne']
    have h := mul_le_mul_of_nonneg_left (cosineDefect_lower ht) hV₀.le
    have h₁ := mul_le_mul_of_nonneg_left htsq (sq_nonneg u)
    rw [show V * ((u / sqrt V) ^ 2 / 2 - (u / sqrt V) ^ 4 / 24) =
      (V * (u / sqrt V) ^ 2) / 2 - (V * (u / sqrt V) ^ 2) * (u / sqrt V) ^ 2 / 24 by ring,
      htV] at h
    linarith
  have hcub : u ^ 3 ≤ 8 := by nlinarith [mul_nonneg (sq_nonneg u) (sub_nonneg.mpr hu')]
  have habs : |θ (u / sqrt V)| ≤ 4 / 9 := by linarith
  have hθsq : (θ (u / sqrt V)) ^ 2 ≤ (4 / 9 : ℝ) ^ 2 := by
    rw [← sq_abs (θ (u / sqrt V))]
    exact pow_le_pow_left₀ (abs_nonneg _) habs 2
  have hcos : (73 / 81 : ℝ) ≤ cos (θ (u / sqrt V)) := by
    linarith [one_sub_sq_div_two_le_cos (x := θ (u / sqrt V))]
  have hexp : exp (-(u ^ 2 / 2)) ≤ exp (-A (u / sqrt V)) := exp_le_exp.mpr (neg_le_neg hA)
  have hh := mul_le_mul hdef hexp (exp_pos _).le
    (mul_nonneg hV₀.le (sub_nonneg.mpr (cos_le_one _)))
  have hh' := mul_le_mul hh hcos (by norm_num : (0 : ℝ) ≤ 73 / 81)
    (mul_nonneg (mul_nonneg hV₀.le (sub_nonneg.mpr (cos_le_one _))) (exp_pos _).le)
  simpa only [mainLower, normalizedIntegrand, mul_assoc, mul_left_comm, mul_comm] using hh'

/-- Under the variance and centered exponent bounds, the normalized Fourier
integral on `[0,2]` exceeds the threshold used by the written proof. -/
theorem central_fourier_bound {V : ℝ} {A θ : ℝ → ℝ} (hV : 251 ≤ V)
    (hAcont : Continuous A) (hθcont : Continuous θ)
    (hA : ∀ u ∈ Set.Icc (0 : ℝ) 2, A (u / sqrt V) ≤ u ^ 2 / 2)
    (hθ : ∀ u ∈ Set.Icc (0 : ℝ) 2, |θ (u / sqrt V)| ≤ (1 / 3) * u ^ 3 / 6) :
    (2 / 5 : ℝ) < ∫ u in (0 : ℝ)..2, normalizedIntegrand V A θ u := by
  refine central_lower_integral.trans_le (intervalIntegral.integral_mono_on (by norm_num) ?_ ?_ ?_)
  · exact (show Continuous mainLower by unfold mainLower; fun_prop).intervalIntegrable ..
  · exact (show Continuous (normalizedIntegrand V A θ) by unfold normalizedIntegrand; fun_prop).intervalIntegrable ..
  · exact fun u hu => mainLower_le hV hu.1 hu.2 (hA u hu) (hθ u hu)

/-- The centered phase bound and a tail lower bound give a positive normalized
Fourier integral. The applied saddle estimates are supplied as hypotheses. -/
theorem normalized_fourier_pos_of_tail {V b : ℝ} {A θ : ℝ → ℝ} (hV : 251 ≤ V)
    (hAcont : Continuous A) (hθcont : Continuous θ)
    (hA : ∀ u ∈ Set.Icc (0 : ℝ) 2, A (u / sqrt V) ≤ u ^ 2 / 2)
    (hθ : ∀ u ∈ Set.Icc (0 : ℝ) (3), |θ (u / sqrt V)| ≤ (1 / 3) * u ^ 3 / 6)
    (htail : -(2 / 5 : ℝ) ≤ ∫ u in (3 : ℝ)..b, normalizedIntegrand V A θ u) :
    0 < ∫ u in (0 : ℝ)..b, normalizedIntegrand V A θ u := by
  let f := normalizedIntegrand V A θ
  have hcont : Continuous f := by unfold f normalizedIntegrand; fun_prop
  have hcentral := central_fourier_bound hV hAcont hθcont hA
    (fun u hu => hθ u ⟨hu.1, hu.2.trans (by norm_num)⟩)
  have hmiddle : 0 ≤ ∫ u in (2 : ℝ)..(3 : ℝ), f u := by
    apply intervalIntegral.integral_nonneg (by norm_num)
    intro u hu
    have hu₀ : 0 ≤ u := by linarith [hu.1]
    have huc := pow_le_pow_left₀ hu₀ hu.2 3
    have hphase := hθ u ⟨hu₀, hu.2⟩
    have hcos : 0 ≤ cos (θ (u / sqrt V)) := by
      apply cos_nonneg_of_mem_Icc
      apply abs_le.mp
      norm_num at huc
      linarith [pi_gt_d2]
    have hdef : 0 ≤ 1 - cos (u / sqrt V) := sub_nonneg.mpr (cos_le_one _)
    exact mul_nonneg (mul_nonneg (mul_nonneg (by linarith) hdef) (exp_pos _).le) hcos
  change 0 < ∫ u in (0 : ℝ)..b, f u
  rw [← intervalIntegral.integral_add_adjacent_intervals
    (hcont.intervalIntegrable 0 (3)) (hcont.intervalIntegrable (3) b),
    ← intervalIntegral.integral_add_adjacent_intervals
      (hcont.intervalIntegrable 0 2) (hcont.intervalIntegrable 2 (3))]
  change 2 / 5 < ∫ u in (0 : ℝ)..2, f u at hcentral
  change -(2 / 5 : ℝ) ≤ ∫ u in (3 : ℝ)..b, f u at htail
  linarith

end PlanePartition
