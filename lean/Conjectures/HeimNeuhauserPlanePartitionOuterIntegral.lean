import Conjectures.HeimNeuhauserPlanePartitionMiddleIntegral

/-! The Gaussian and large-angle estimates on the rest of the normalized Fourier integral. -/

namespace PlanePartition

open Real MeasureTheory
open scoped Interval
open OrdinaryDarcais (normalizedIntegrand)

private theorem exp_interval {R : ℝ} : (∫ u in (12 : ℝ)..R, exp (-(u-12))) ≤ 1 := by
  have hd (u : ℝ) : HasDerivAt (fun s : ℝ => -exp (-(s-12))) (exp (-(u-12))) u := by
    convert (((hasDerivAt_id u).sub_const 12).neg.exp.neg) using 1 <;> simp
    rfl
  rw [intervalIntegral.integral_eq_sub_of_hasDerivAt (fun u _ => hd u)
    ((show Continuous (fun u : ℝ => exp (-(u-12))) by fun_prop).intervalIntegrable ..)]
  simp
  positivity

private theorem defect_integral {V : ℝ} (hp : 0 < V) :
    (∫ u in (0 : ℝ)..(π*sqrt V), (1-cos (u/sqrt V))) = π*sqrt V := by
  have hs := sqrt_pos.mpr hp
  have he := intervalIntegral.integral_comp_div (a := (0 : ℝ)) (b := π*sqrt V) (fun t : ℝ => 1-cos t) hs.ne'
  simp only [zero_div, mul_div_cancel_right₀ _ hs.ne', smul_eq_mul] at he
  rw [he, intervalIntegral.integral_sub (continuous_const.intervalIntegrable ..) (continuous_cos.intervalIntegrable ..)]
  simp [integral_cos, mul_comm]

theorem far_integral_bound {x r : ℝ} (hx : 1 ≤ x) (hr : r ∈ Set.Ioo (0 : ℝ) 1)
    (hn : 251 ≤ x*moment 0 r) (h : TailParameters x r) :
    -(1/10 : ℝ) ≤ ∫ u in (12 : ℝ)..(π*sqrt (variance x r)),
      normalizedIntegrand (variance x r) (damping x r) (phase x r) u := by
  let V := variance x r
  let R := π*sqrt V
  let w := envelopeB x r * outerMultiplier r
  let f := normalizedIntegrand V (damping x r) (phase x r)
  let g (u : ℝ) := (1/100)*exp (-(u-12))
  let k (u : ℝ) := V*(1-cos (u/sqrt V))*exp (-w)
  have hx₀ : 0 ≤ x := by linarith
  have hr₀ := hr.1
  have hV : 251 ≤ V := saddle_variance_lower hx hr hn
  have hp : 0 < V := by linarith
  have hs := sqrt_pos.mpr hp
  have hR : 12 ≤ R := by
    have h₄ : 4 ≤ sqrt V := (le_sqrt (by norm_num) hp.le).mpr (by linarith)
    dsimp [R]
    nlinarith only [mul_le_mul (by linarith [pi_gt_three] : (3 : ℝ) ≤ π) h₄ (by norm_num) pi_pos.le]
  have hf : Continuous f := normalized_continuous hx₀ hr
  have hg : Continuous g := by unfold g; fun_prop
  have hk : Continuous k := by unfold k; fun_prop
  have hB₀ : 0 ≤ envelopeB x r := by unfold envelopeB; positivity
  have hscale : π*V*sqrt V*exp (-w) ≤ 9/100 :=
    outer_exponential_bound hp.le hB₀ (saddle_variance_upper hx hr hn) (outerMultiplier_ge hr.1.le) h.outer
  have hpoint (u : ℝ) (hu : u ∈ Set.Icc 12 R) : -f u ≤ g u + k u := by
    let t := u/sqrt V
    have hu₀ : 0 ≤ u := by linarith [hu.1]
    have ht : 0 ≤ t := div_nonneg hu₀ hs.le
    have htπ : t ≤ π := (div_le_iff₀ hs).mpr hu.2
    have hdef : 0 ≤ 1-cos t := sub_nonneg.mpr (cos_le_one _)
    have hg₀ : 0 ≤ g u := by unfold g; positivity
    have hk₀ : 0 ≤ k u := mul_nonneg (mul_nonneg hp.le hdef) (exp_pos _).le
    apply (negative_integrand_le hp.le ..).trans
    by_cases hangle : t ≤ 1-r
    · have hA : u^2/16 ≤ damping x r t := by
        have h' := small_angle_damping hx₀ hr ht hangle
        have he : V*t^2 = u^2 := by dsimp [t]; rw [div_pow, sq_sqrt hp.le]; field_simp
        change V*t^2/16 ≤ _ at h'
        rwa [he] at h'
      have hm := mul_le_mul (normalizedDefect_upper hp u) (exp_le_exp.mpr (neg_le_neg hA))
        (exp_pos _).le (by positivity)
      exact (hm.trans (gaussian_far_bound hu.1)).trans (le_add_of_nonneg_right hk₀)
    · have hA := damping_ge_outer hx₀ hr.1 hr.2 (not_le.mp hangle).le htπ
      have hm := mul_le_mul_of_nonneg_left (exp_le_exp.mpr (neg_le_neg hA)) (mul_nonneg hp.le hdef)
      exact hm.trans (le_add_of_nonneg_left hg₀)
  have hGI : (∫ u in (12 : ℝ)..R, g u) ≤ 1/100 := by
    unfold g
    rw [intervalIntegral.integral_const_mul]
    simpa only [mul_one] using mul_le_mul_of_nonneg_left (exp_interval (R := R)) (by norm_num : (0 : ℝ) ≤ 1/100)
  have hKI : (∫ u in (12 : ℝ)..R, k u) ≤ 9/100 := by
    have hz : 0 ≤ ∫ u in (0 : ℝ)..12, k u := intervalIntegral.integral_nonneg (by norm_num)
      (fun u _ => mul_nonneg (mul_nonneg hp.le (sub_nonneg.mpr (cos_le_one _))) (exp_pos _).le)
    have hfull : (∫ u in (0 : ℝ)..R, k u) ≤ 9/100 := by
      unfold k
      rw [intervalIntegral.integral_mul_const, intervalIntegral.integral_const_mul, defect_integral hp]
      convert hscale using 1; ring
    rw [← intervalIntegral.integral_add_adjacent_intervals (hk.intervalIntegrable ..) (hk.intervalIntegrable ..) (b := (12 : ℝ))] at hfull
    linarith
  have hbound := intervalIntegral.integral_mono_on (μ := volume) hR (hf.neg.intervalIntegrable ..)
    ((hg.add hk).intervalIntegrable ..) hpoint
  change (∫ u in (12 : ℝ)..R, -f u) ≤ ∫ u in (12 : ℝ)..R, g u + k u at hbound
  rw [intervalIntegral.integral_neg, intervalIntegral.integral_add (hg.intervalIntegrable ..) (hk.intervalIntegrable ..)] at hbound
  change -(1/10 : ℝ) ≤ ∫ u in (12 : ℝ)..R, f u
  linarith

end PlanePartition
