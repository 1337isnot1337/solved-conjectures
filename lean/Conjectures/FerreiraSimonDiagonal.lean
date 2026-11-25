import Mathlib.Analysis.Calculus.Deriv.MeanValue
import Mathlib.Analysis.Calculus.ParametricIntegral
import Mathlib.Analysis.Calculus.SmoothSeries
import Mathlib.Analysis.SpecialFunctions.Gamma.Basic
import Mathlib.Analysis.SpecialFunctions.Log.Deriv
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Deriv
import Mathlib.MeasureTheory.Integral.IntegralEqImproper

/-!
# Ferreira–Simon's diagonal Mittag–Leffler conjecture

The paired Lamperti integral is strictly increasing on `(0, 1)`. Its equality to the
diagonal Mittag–Leffler series follows from Pollard’s one-parameter representation near one.
The representation is an explicit hypothesis of the final reduction.
-/

open MeasureTheory Set
open scoped Interval

namespace FerreiraSimonDiagonal

noncomputable def logQuantile (a u : ℝ) : ℝ :=
  (Real.log (Real.sin (Real.pi * u * a)) -
    Real.log (Real.sin (Real.pi * (1 - u) * a))) / a

noncomputable def kernel (s : ℝ) : ℝ :=
  Real.exp (s - Real.exp s)

noncomputable def pairedKernel (s : ℝ) : ℝ :=
  (kernel s + kernel (-s)) / 2

noncomputable def pairedIntegral (a : ℝ) : ℝ :=
  2 * ∫ u in Ioo (1 / 2 : ℝ) 1, pairedKernel (logQuantile a u)

private noncomputable def auxiliary (z : ℝ) : ℝ :=
  z * Real.cos z / Real.sin z - Real.log (Real.sin z)

private theorem auxiliary_hasDerivAt {z : ℝ} (h : Real.sin z ≠ 0) :
    HasDerivAt auxiliary (-z / Real.sin z ^ 2) z := by
  have hd := (((hasDerivAt_id z).mul (Real.hasDerivAt_cos z)).div
    (Real.hasDerivAt_sin z) h).sub ((Real.hasDerivAt_sin z).log h)
  convert hd using 1
  · rfl
  · simp only [id_eq, Pi.mul_apply]
    field_simp
    have hsq := congrArg (fun x : ℝ => z * x) (Real.sin_sq_add_cos_sq z)
    nlinarith

private theorem auxiliary_strictAnti : StrictAntiOn auxiliary (Ioo 0 Real.pi) := by
  apply strictAntiOn_of_deriv_neg (convex_Ioo ..)
  · intro z hz
    exact (auxiliary_hasDerivAt (Real.sin_pos_of_mem_Ioo hz).ne').continuousAt.continuousWithinAt
  · intro z hz
    rw [interior_Ioo] at hz
    rw [(auxiliary_hasDerivAt (Real.sin_pos_of_mem_Ioo hz).ne').deriv]
    exact div_neg_of_neg_of_pos (neg_neg_of_pos hz.1)
      (sq_pos_of_ne_zero (Real.sin_pos_of_mem_Ioo hz).ne')

private theorem angle_mem {a u : ℝ} (ha : a ∈ Ioo 0 1) (hu : u ∈ Ioo 0 1) :
    Real.pi * u * a ∈ Ioo 0 Real.pi :=
  ⟨mul_pos (mul_pos Real.pi_pos hu.1) ha.1,
    calc
      Real.pi * u * a < Real.pi * 1 * a :=
        mul_lt_mul_of_pos_right (mul_lt_mul_of_pos_left hu.2 Real.pi_pos) ha.1
      _ < Real.pi := by simpa using mul_lt_mul_of_pos_left ha.2 Real.pi_pos⟩

private theorem logQuantile_hasDerivAt {a u : ℝ} (ha : a ∈ Ioo 0 1) (hu : u ∈ Ioo 0 1) :
    HasDerivAt (fun b => logQuantile b u)
      ((auxiliary (Real.pi * u * a) - auxiliary (Real.pi * (1 - u) * a)) / a ^ 2) a := by
  have huv : 1 - u ∈ Ioo (0 : ℝ) 1 := ⟨by linarith [hu.2], by linarith [hu.1]⟩
  have hs := (Real.sin_pos_of_mem_Ioo (angle_mem ha hu)).ne'
  have ht := (Real.sin_pos_of_mem_Ioo (angle_mem ha huv)).ne'
  have hlog (c : ℝ) (hc : Real.sin (c * a) ≠ 0) :=
    ((Real.hasDerivAt_sin (c * a)).comp a ((hasDerivAt_id a).const_mul c)).log hc
  have hd := ((hlog (Real.pi * u) hs).sub (hlog (Real.pi * (1 - u)) ht)).div
    (hasDerivAt_id a) ha.1.ne'
  convert hd using 1
  · rfl
  · simp only [auxiliary, id_eq, Function.comp_apply, Pi.sub_apply]
    ring

private theorem logQuantile_strictAnti {u : ℝ} (hu : u ∈ Ioo (1 / 2 : ℝ) 1) :
    StrictAntiOn (fun a => logQuantile a u) (Ioo 0 1) := by
  have hu' : u ∈ Ioo (0 : ℝ) 1 := ⟨by linarith [hu.1], hu.2⟩
  have huv : 1 - u ∈ Ioo (0 : ℝ) 1 := ⟨by linarith [hu.2], by linarith [hu'.1]⟩
  apply strictAntiOn_of_deriv_neg (convex_Ioo ..)
  · intro a ha
    exact (logQuantile_hasDerivAt ha hu').continuousAt.continuousWithinAt
  · intro a ha
    rw [interior_Ioo] at ha
    rw [(logQuantile_hasDerivAt ha hu').deriv]
    apply div_neg_of_neg_of_pos _ (sq_pos_of_ne_zero ha.1.ne')
    apply sub_neg.mpr
    apply auxiliary_strictAnti (angle_mem ha huv) (angle_mem ha hu')
    exact mul_lt_mul_of_pos_right (mul_lt_mul_of_pos_left (by linarith [hu.1]) Real.pi_pos) ha.1

private theorem logQuantile_pos {a u : ℝ} (ha : a ∈ Ioo 0 1) (hu : u ∈ Ioo (1 / 2 : ℝ) 1) :
    0 < logQuantile a u := by
  have hu' : u ∈ Ioo (0 : ℝ) 1 := ⟨by linarith [hu.1], hu.2⟩
  have huv : 1 - u ∈ Ioo (0 : ℝ) 1 := ⟨by linarith [hu.2], by linarith [hu'.1]⟩
  apply div_pos _ ha.1
  apply sub_pos.mpr
  apply Real.log_lt_log (Real.sin_pos_of_mem_Ioo (angle_mem ha huv))
  rw [← sub_pos, Real.sin_sub_sin]
  have hsum : Real.pi * u * a + Real.pi * (1 - u) * a = Real.pi * a := by ring
  apply mul_pos (mul_pos (by norm_num) _) _
  · apply Real.sin_pos_of_pos_of_lt_pi
    · have h : Real.pi * (1 - u) * a < Real.pi * u * a :=
        mul_lt_mul_of_pos_right (mul_lt_mul_of_pos_left (by linarith [hu.1]) Real.pi_pos) ha.1
      linarith
    · linarith [(angle_mem ha hu').2, (angle_mem ha huv).1, Real.pi_pos]
  · rw [hsum]
    apply Real.cos_pos_of_mem_Ioo
    have h0 := mul_pos Real.pi_pos ha.1
    have h1 := mul_lt_mul_of_pos_left ha.2 Real.pi_pos
    simp only [mul_one] at h1
    constructor <;> linarith [Real.pi_pos]

private theorem kernel_hasDerivAt (s : ℝ) :
    HasDerivAt kernel (Real.exp (s - Real.exp s) * (1 - Real.exp s)) s := by
  change HasDerivAt (fun x => Real.exp (x - Real.exp x)) _ s
  simpa using ((hasDerivAt_id s).sub (Real.hasDerivAt_exp s)).exp

private theorem pairedKernel_strictAnti : StrictAntiOn pairedKernel (Ioi 0) := by
  have hd (s : ℝ) := ((kernel_hasDerivAt s).add
    ((kernel_hasDerivAt (-s)).comp s (hasDerivAt_neg s))).div_const 2
  apply strictAntiOn_of_deriv_neg (convex_Ioi ..)
  · intro s _
    exact (hd s).continuousAt.continuousWithinAt
  · intro s hs
    rw [interior_Ioi] at hs
    change 0 < s at hs
    change deriv (fun t => (kernel + kernel ∘ Neg.neg) t / 2) s < 0
    rw [(hd s).deriv]
    apply div_neg_of_neg_of_pos _ (by norm_num)
    apply add_neg
    · exact mul_neg_of_pos_of_neg (Real.exp_pos _)
        (sub_neg.mpr ((Real.one_lt_exp_iff).mpr hs))
    · exact mul_neg_of_pos_of_neg (mul_pos (Real.exp_pos _)
        (sub_pos.mpr ((Real.exp_lt_one_iff).mpr (neg_neg_of_pos hs)))) (by norm_num)

private theorem kernel_bounds (s : ℝ) : 0 ≤ kernel s ∧ kernel s ≤ 1 :=
  ⟨(Real.exp_pos _).le, Real.exp_le_one_iff.mpr (sub_nonpos.mpr (by linarith [Real.add_one_le_exp s]))⟩

private theorem measurable_logQuantile (a : ℝ) : Measurable (logQuantile a) := by
  unfold logQuantile
  fun_prop

private theorem continuous_pairedKernel : Continuous pairedKernel := by
  unfold pairedKernel kernel
  fun_prop

private theorem integrable_comp_pairedKernel (a : ℝ) :
    IntegrableOn (fun u => pairedKernel (logQuantile a u)) (Ioo (1 / 2 : ℝ) 1) := by
  apply volume.integrableOn_of_bounded (M := 1)
  · simp
  · exact (continuous_pairedKernel.measurable.comp (measurable_logQuantile a)).aestronglyMeasurable
  · filter_upwards [] with u
    have h₁ := kernel_bounds (logQuantile a u)
    have h₂ := kernel_bounds (-logQuantile a u)
    rw [Real.norm_eq_abs, pairedKernel, abs_of_nonneg (div_nonneg (add_nonneg h₁.1 h₂.1) (by norm_num))]
    linarith [h₁.2, h₂.2]

/-- The reciprocal-paired Lamperti integral increases strictly with the parameter. -/
theorem pairedIntegral_strictMono : StrictMonoOn pairedIntegral (Ioo 0 1) := by
  intro a ha b hb hab
  have hlt (u : ℝ) (hu : u ∈ Ioo (1 / 2 : ℝ) 1) :
      pairedKernel (logQuantile a u) < pairedKernel (logQuantile b u) :=
    pairedKernel_strictAnti (logQuantile_pos hb hu) (logQuantile_pos ha hu)
      (logQuantile_strictAnti hu ha hb hab)
  unfold pairedIntegral
  apply mul_lt_mul_of_pos_left _ (by norm_num)
  let μ := volume.restrict (Ioo (1 / 2 : ℝ) 1)
  have hf := integrable_comp_pairedKernel a
  have hg := integrable_comp_pairedKernel b
  rw [← sub_pos, ← integral_sub hg hf, integral_pos_iff_support_of_nonneg_ae]
  · apply pos_iff_ne_zero.mpr
    have hpos : μ (Ioo (1 / 2 : ℝ) 1) ≠ 0 := by
      simp [μ, Measure.restrict_apply, measurableSet_Ioo, Real.volume_Ioo]
      norm_num
    exact mt (measure_mono_null fun u hu => (sub_pos.mpr (hlt u hu)).ne') hpos
  · filter_upwards [ae_restrict_mem measurableSet_Ioo] with u hu using (sub_pos.mpr (hlt u hu)).le
  · exact hg.sub hf

private noncomputable def sineRatio (a u : ℝ) : ℝ :=
  Real.sin (Real.pi * u * a) / Real.sin (Real.pi * (1 - u) * a)

private theorem sineRatio_pos {a u : ℝ} (ha : a ∈ Ioo 0 1) (hu : u ∈ Ioo 0 1) :
    0 < sineRatio a u :=
  div_pos (Real.sin_pos_of_mem_Ioo (angle_mem ha hu))
    (Real.sin_pos_of_mem_Ioo (angle_mem ha ⟨by linarith [hu.2], by linarith [hu.1]⟩))

private theorem sineRatio_deriv {a u : ℝ} (ha : a ∈ Ioo 0 1) (hu : u ∈ Ioo 0 1) :
    HasDerivAt (sineRatio a)
      (Real.pi * a * Real.sin (Real.pi * a) / Real.sin (Real.pi * (1 - u) * a) ^ 2) u := by
  have hv : 1 - u ∈ Ioo (0 : ℝ) 1 := ⟨by linarith [hu.2], by linarith [hu.1]⟩
  have hp := (((hasDerivAt_id u).const_mul Real.pi).mul_const a).sin
  have hq := ((((hasDerivAt_id u).const_sub 1).const_mul Real.pi).mul_const a).sin
  convert hp.div hq (Real.sin_pos_of_mem_Ioo (angle_mem ha hv)).ne' using 1
  · rfl
  · simp only [Real.sin_add, show Real.pi * a = Real.pi * u * a + Real.pi * (1 - u) * a by ring,
      id_eq]
    congr 1
    ring

private theorem sineRatio_monotone {a : ℝ} (ha : a ∈ Ioo 0 1) :
    StrictMonoOn (sineRatio a) (Ioo 0 1) := by
  apply strictMonoOn_of_deriv_pos (convex_Ioo ..)
  · exact fun _ hu => (sineRatio_deriv ha hu).continuousAt.continuousWithinAt
  · intro u hu
    rw [interior_Ioo] at hu
    rw [(sineRatio_deriv ha hu).deriv]
    have hs := Real.sin_pos_of_mem_Ioo (angle_mem ha
      (show 1 - u ∈ Ioo (0 : ℝ) 1 from ⟨by linarith [hu.2], by linarith [hu.1]⟩))
    have hpa := Real.sin_pos_of_pos_of_lt_pi (mul_pos Real.pi_pos ha.1)
      (by simpa using mul_lt_mul_of_pos_left ha.2 Real.pi_pos)
    exact div_pos (mul_pos (mul_pos Real.pi_pos ha.1) hpa) (sq_pos_of_ne_zero hs.ne')

private theorem sineRatio_image {a : ℝ} (ha : a ∈ Ioo 0 1) :
    sineRatio a '' Ioo 0 1 = Ioi 0 := by
  refine subset_antisymm (by rintro _ ⟨u, hu, rfl⟩; exact sineRatio_pos ha hu) ?_
  intro y hy
  change 0 < y at hy
  let f := fun u : ℝ => Real.sin (Real.pi * u * a) - y * Real.sin (Real.pi * (1 - u) * a)
  have hfc : Continuous f := by fun_prop
  have hpa := Real.sin_pos_of_pos_of_lt_pi (mul_pos Real.pi_pos ha.1)
    (by simpa using mul_lt_mul_of_pos_left ha.2 Real.pi_pos)
  have hm : 0 ∈ Ioo (f 0) (f 1) := by
    simp only [f, mul_zero, zero_mul, Real.sin_zero, sub_zero, sub_self, mul_one, zero_sub]
    exact ⟨neg_neg_of_pos (mul_pos hy hpa), hpa⟩
  obtain ⟨u, hu, hu0⟩ := intermediate_value_Ioo zero_le_one hfc.continuousOn hm
  refine ⟨u, hu, (div_eq_iff ?_).mpr (sub_eq_zero.mp hu0)⟩
  exact (Real.sin_pos_of_mem_Ioo (angle_mem ha
    (show 1 - u ∈ Ioo (0 : ℝ) 1 from ⟨by linarith [hu.2], by linarith [hu.1]⟩))).ne'

private noncomputable def denominator (a y : ℝ) : ℝ :=
  y ^ 2 + 2 * Real.cos (Real.pi * a) * y + 1

private theorem denominator_ratio {a u : ℝ} (ha : a ∈ Ioo 0 1) (hu : u ∈ Ioo 0 1) :
    denominator a (sineRatio a u) =
      Real.sin (Real.pi * a) ^ 2 / Real.sin (Real.pi * (1 - u) * a) ^ 2 := by
  have hv : 1 - u ∈ Ioo (0 : ℝ) 1 := ⟨by linarith [hu.2], by linarith [hu.1]⟩
  have hs := (Real.sin_pos_of_mem_Ioo (angle_mem ha hv)).ne'
  let x := Real.pi * u * a
  let y := Real.pi * (1 - u) * a
  have hab : Real.pi * a = x + y := by dsimp [x, y]; ring
  have hsy : Real.sin y ≠ 0 := hs
  change (Real.sin x / Real.sin y) ^ 2 +
    2 * Real.cos (Real.pi * a) * (Real.sin x / Real.sin y) + 1 =
      Real.sin (Real.pi * a) ^ 2 / Real.sin y ^ 2
  have htrig : Real.sin x ^ 2 + 2 * Real.cos (Real.pi * a) * Real.sin x * Real.sin y +
      Real.sin y ^ 2 = Real.sin (Real.pi * a) ^ 2 := by
    rw [hab, Real.cos_add, Real.sin_add]
    have hx := congrArg (fun z : ℝ => z * Real.sin y ^ 2) (Real.sin_sq_add_cos_sq x)
    have hy := congrArg (fun z : ℝ => z * Real.sin x ^ 2) (Real.sin_sq_add_cos_sq y)
    nlinarith
  field_simp [hsy]
  linarith

/-- Pollard's density on the positive half-line. -/
noncomputable def density (a r : ℝ) : ℝ :=
  (Real.sin (Real.pi * a) / Real.pi) * r ^ (a - 1) / denominator a (r ^ a)

/-- The sine quantile sends the uniform integral to the integral against Pollard's density. -/
theorem integral_density_eq_quantile {a : ℝ} (ha : a ∈ Ioo 0 1) (f : ℝ → ℝ) :
    (∫ r in Ioi 0, density a r * f r) =
      ∫ u in Ioo 0 1, f (Real.exp (logQuantile a u)) := by
  let g := fun y : ℝ =>
    (Real.sin (Real.pi * a) / (Real.pi * a) / denominator a y) * f (y ^ a⁻¹)
  have hpow := integral_comp_rpow_Ioi_of_pos (g := g) ha.1
  calc
    (∫ r in Ioi 0, density a r * f r) = ∫ r in Ioi 0, (a * r ^ (a - 1)) • g (r ^ a) := by
      apply setIntegral_congr_fun measurableSet_Ioi
      intro r hr
      simp only [g, smul_eq_mul, Real.rpow_rpow_inv hr.le ha.1.ne', density]
      field_simp [ha.1.ne', Real.pi_pos.ne']
    _ = ∫ y in Ioi 0, g y := hpow
    _ = _ := by
      rw [← sineRatio_image ha, integral_image_eq_integral_deriv_smul_of_monotoneOn
        measurableSet_Ioo (fun _ hu => (sineRatio_deriv ha hu).hasDerivWithinAt)
        (sineRatio_monotone ha).monotoneOn]
      apply setIntegral_congr_fun measurableSet_Ioo
      intro u hu
      have hv : 1 - u ∈ Ioo (0 : ℝ) 1 := ⟨by linarith [hu.2], by linarith [hu.1]⟩
      have hs := (Real.sin_pos_of_mem_Ioo (angle_mem ha hv)).ne'
      have hpa := Real.sin_pos_of_pos_of_lt_pi (mul_pos Real.pi_pos ha.1)
        (by simpa using mul_lt_mul_of_pos_left ha.2 Real.pi_pos)
      have hq : (sineRatio a u) ^ a⁻¹ = Real.exp (logQuantile a u) := by
        rw [Real.rpow_def_of_pos (sineRatio_pos ha hu), logQuantile, sineRatio,
          Real.log_div (Real.sin_pos_of_mem_Ioo (angle_mem ha hu)).ne' hs, div_eq_mul_inv]
      simp only [g, smul_eq_mul, hq, denominator_ratio ha hu]
      have he : Real.pi * a * Real.sin (Real.pi * a) / Real.sin (Real.pi * (1 - u) * a) ^ 2 *
          (Real.sin (Real.pi * a) / (Real.pi * a) /
            (Real.sin (Real.pi * a) ^ 2 / Real.sin (Real.pi * (1 - u) * a) ^ 2)) = 1 := by
        have hs' : Real.sin (Real.pi * a * (1 - u)) ≠ 0 := by
          convert hs using 2
          ring
        field_simp [hs, hs', hpa.ne', ha.1.ne', Real.pi_pos.ne']
      rw [← mul_assoc, he, one_mul]

private theorem logQuantile_reflect (a u : ℝ) :
    logQuantile a (1 - u) = -logQuantile a u := by
  unfold logQuantile
  rw [sub_sub_cancel, ← neg_div, neg_sub]

private theorem integrable_kernel (a : ℝ) :
    IntegrableOn (fun u => kernel (logQuantile a u)) (Ioo 0 1) := by
  apply volume.integrableOn_of_bounded (M := 1)
  · simp
  · exact ((show Continuous kernel by unfold kernel; fun_prop).measurable.comp
      (measurable_logQuantile a)).aestronglyMeasurable
  · filter_upwards [] with u
    rw [Real.norm_eq_abs, abs_of_nonneg (kernel_bounds _).1]
    exact (kernel_bounds _).2

/-- The diagonal integral against Pollard's density agrees with the paired integral. -/
theorem densityIntegral_eq_pairedIntegral {a : ℝ} (ha : a ∈ Ioo 0 1) :
    (∫ r in Ioi 0, density a r * (r * Real.exp (-r))) = pairedIntegral a := by
  rw [integral_density_eq_quantile ha]
  simp only [← Real.exp_add, ← sub_eq_add_neg]
  change (∫ u in Ioo 0 1, kernel (logQuantile a u)) = _
  let f := fun u => kernel (logQuantile a u)
  have hfull := integrable_kernel a
  have hi₁ : IntervalIntegrable f volume 0 (1/2) :=
    (intervalIntegrable_iff_integrableOn_Ioo_of_le (by norm_num)).mpr
      (hfull.mono_set (Ioo_subset_Ioo_right (by norm_num)))
  have hi₂ : IntervalIntegrable f volume (1/2) 1 :=
    (intervalIntegrable_iff_integrableOn_Ioo_of_le (by norm_num)).mpr
      (hfull.mono_set (Ioo_subset_Ioo_left (by norm_num)))
  have href : (∫ u in 0..(1/2 : ℝ), f u) = ∫ u in (1/2 : ℝ)..1, f (1 - u) := by
    rw [intervalIntegral.integral_comp_sub_left f 1]
    norm_num
  have hf₂ : IntegrableOn f (Ioo (1/2 : ℝ) 1) :=
    (intervalIntegrable_iff_integrableOn_Ioo_of_le (by norm_num)).mp hi₂
  have hg₂ : IntegrableOn (fun u => kernel (-logQuantile a u)) (Ioo (1/2 : ℝ) 1) := by
    apply volume.integrableOn_of_bounded (M := 1)
    · simp
    · exact ((show Continuous kernel by unfold kernel; fun_prop).measurable.comp
        (measurable_logQuantile a).neg).aestronglyMeasurable
    · filter_upwards [] with u
      rw [Real.norm_eq_abs, abs_of_nonneg (kernel_bounds _).1]
      exact (kernel_bounds _).2
  change (∫ u in Ioo 0 1, f u) = _
  rw [← integral_Ioc_eq_integral_Ioo, ← intervalIntegral.integral_of_le zero_le_one,
    ← intervalIntegral.integral_add_adjacent_intervals hi₁ hi₂, href]
  simp only [intervalIntegral.integral_of_le (show (1/2 : ℝ) ≤ 1 by norm_num),
    integral_Ioc_eq_integral_Ioo, f, logQuantile_reflect, pairedIntegral, pairedKernel]
  simp_rw [div_eq_mul_inv]
  rw [integral_mul_const]
  have hsum := integral_add hf₂ hg₂
  dsimp only [f] at hsum
  have hsum' := hsum
  simp only [div_eq_mul_inv, one_mul] at hsum' ⊢
  rw [hsum']
  ring

/-- Strict monotonicity of the integral that represents the diagonal value in the analytic proof. -/
theorem densityIntegral_strictMono :
    StrictMonoOn (fun a => ∫ r in Ioi 0, density a r * (r * Real.exp (-r))) (Ioo 0 1) := by
  intro a ha b hb hab
  dsimp only
  rw [densityIntegral_eq_pairedIntegral ha, densityIntegral_eq_pairedIntegral hb]
  exact pairedIntegral_strictMono ha hb hab


/-- The real two-parameter Mittag–Leffler series. -/
noncomputable def mittagLeffler (a b z : ℝ) : ℝ :=
  ∑' n : ℕ, z ^ n / Real.Gamma (a * n + b)

private theorem gamma_lower_bound {R t : ℝ} (hR : 0 < R) (ht : 0 ≤ t) :
    Real.exp (-(R + 1)) * R ^ t ≤ Real.Gamma (t + 1) := by
  rw [Real.Gamma_eq_integral (show 0 < t + 1 by linarith), add_sub_cancel_right]
  let g := fun x : ℝ => Real.exp (-x) * x ^ t
  have hgi : IntegrableOn g (Ioi 0) := by
    simpa [g] using Real.GammaIntegral_convergent (show 0 < t + 1 by linarith)
  have hsub : Ioc R (R + 1) ⊆ Ioi 0 := fun x hx => hR.trans hx.1
  calc
    _ = ∫ _ in Ioc R (R + 1), Real.exp (-(R + 1)) * R ^ t := by
      simp
    _ ≤ ∫ x in Ioc R (R + 1), g x := by
      apply setIntegral_mono_on (integrableOn_const (by simp)) (hgi.mono_set hsub) measurableSet_Ioc
      intro x hx
      exact mul_le_mul (Real.exp_le_exp.mpr (neg_le_neg hx.2))
        (Real.rpow_le_rpow hR.le hx.1.le ht) (Real.rpow_nonneg hR.le _) (Real.exp_pos _).le
    _ ≤ ∫ x in Ioi 0, g x := by
      apply setIntegral_mono_set hgi _ hsub.eventuallyLE
      filter_upwards [ae_restrict_mem measurableSet_Ioi] with x hx
      exact mul_nonneg (Real.exp_pos _).le (Real.rpow_nonneg hx.le _)

private theorem coeff_bound {a : ℝ} (ha : 0 < a) (n : ℕ) :
    (Real.Gamma (a * n + 1))⁻¹ ≤ Real.exp ((4 : ℝ) ^ a⁻¹ + 1) * (1 / 4 : ℝ) ^ n := by
  let R := (4 : ℝ) ^ a⁻¹
  have hR : 0 < R := Real.rpow_pos_of_pos (by norm_num) _
  have hl := gamma_lower_bound hR (mul_nonneg ha.le (Nat.cast_nonneg n))
  have hp : 0 < Real.exp (-(R + 1)) * R ^ (a * n) := by positivity
  calc
    _ ≤ (Real.exp (-(R + 1)) * R ^ (a * n))⁻¹ := inv_anti₀ hp hl
    _ = _ := by
      rw [mul_inv, Real.exp_neg, inv_inv, Real.rpow_mul hR.le, show R ^ a = 4 by
        exact Real.rpow_inv_rpow (by norm_num) ha.ne', Real.rpow_natCast]
      simp [R, inv_pow, one_div]

private theorem mittagLeffler_deriv_real {a : ℝ} (ha : 0 < a) :
    HasDerivAt (mittagLeffler a 1) (mittagLeffler a a (-1) / a) (-1) := by
  let C := Real.exp ((4 : ℝ) ^ a⁻¹ + 1)
  let g := fun (n : ℕ) (x : ℝ) => x ^ n / Real.Gamma (a * n + 1)
  let g' := fun (n : ℕ) (x : ℝ) => n * x ^ (n - 1) / Real.Gamma (a * n + 1)
  have hd (n : ℕ) (x : ℝ) : HasDerivAt (g n) (g' n x) x := by
    simpa [g, g'] using ((hasDerivAt_id x).pow n).div_const (Real.Gamma (a * n + 1))
  have hu : Summable (fun n : ℕ => C * (n * (1 / 2 : ℝ) ^ n)) := by
    simpa using ((summable_norm_pow_mul_geometric_of_norm_lt_one 1
      (r := (1 / 2 : ℝ)) (by norm_num)).mul_left C)
  have hbound (n : ℕ) (x : ℝ) (hx : x ∈ Ioo (-2 : ℝ) 2) :
      ‖g' n x‖ ≤ C * (n * (1 / 2 : ℝ) ^ n) := by
    have hG := Real.Gamma_pos_of_pos (show 0 < a * n + 1 by positivity)
    have hx' : |x| ≤ 2 := abs_le.mpr ⟨hx.1.le, hx.2.le⟩
    have hbase : |x| ^ (n - 1) ≤ (2 : ℝ) ^ n :=
      (pow_le_pow_left₀ (abs_nonneg _) hx' _).trans
        (pow_le_pow_right₀ (by norm_num) (Nat.sub_le ..))
    have hprod := mul_le_mul (mul_le_mul_of_nonneg_left hbase (Nat.cast_nonneg n))
      (coeff_bound ha n) (inv_nonneg.mpr hG.le) (by positivity : 0 ≤ n * (2 : ℝ) ^ n)
    simp only [g', Real.norm_eq_abs, div_eq_mul_inv, abs_mul, Nat.abs_cast, abs_pow,
      abs_of_pos (inv_pos.mpr hG)]
    refine hprod.trans_eq ?_
    simp only [one_mul]
    rw [show (2 : ℝ)⁻¹ = 2 * (1/4) by norm_num, mul_pow]
    dsimp [C]
    ring
  have h0 : Summable (fun n : ℕ => g n 0) := by
    refine summable_of_ne_finset_zero (s := {0}) ?_
    intro n hn
    simp [g, zero_pow (by simpa using hn : n ≠ 0)]
  have hds := hasDerivAt_tsum_of_isPreconnected hu isOpen_Ioo (convex_Ioo ..).isPreconnected
    (fun n x _ => hd n x) hbound (show (0 : ℝ) ∈ Ioo (-2 : ℝ) 2 by norm_num) h0
    (show (-1 : ℝ) ∈ Ioo (-2 : ℝ) 2 by norm_num)
  have hs : Summable (fun n => g' n (-1)) :=
    .of_norm_bounded hu fun n => hbound n (-1) (by norm_num)
  have he : (∑' n, g' n (-1)) = mittagLeffler a a (-1) / a := by
    rw [hs.tsum_eq_zero_add, show g' 0 (-1) = 0 by simp [g'], zero_add]
    unfold mittagLeffler
    rw [← tsum_div_const]
    apply tsum_congr
    intro n
    have hpos : 0 < a * (n + 1 : ℕ) := mul_pos ha (by positivity)
    have hG := (Real.Gamma_pos_of_pos hpos).ne'
    simp only [g', Nat.add_sub_cancel]
    rw [show a * n + a = a * (n + 1 : ℕ) by push_cast; ring,
      Real.Gamma_add_one hpos.ne']
    field_simp [ha.ne', hG, hpos.ne']
  rw [he] at hds
  exact hds

/-- The derivative at one of the one-parameter series evaluated at the negative power. -/
theorem mittagLeffler_at_one_hasDerivAt {a : ℝ} (ha : 0 < a) :
    HasDerivAt (fun x : ℝ => mittagLeffler a 1 (-(x ^ a))) (-mittagLeffler a a (-1)) 1 := by
  have hp := (Real.hasDerivAt_rpow_const (p := a) (Or.inl (one_ne_zero : (1 : ℝ) ≠ 0))).neg
  have hp' : HasDerivAt (fun x : ℝ => -(x ^ a)) (-a) 1 := by
    change HasDerivAt (-(fun x : ℝ => x ^ a)) (-a) 1
    simpa only [Real.one_rpow, mul_one] using hp
  have hd : HasDerivAt (mittagLeffler a 1) (mittagLeffler a a (-1) / a) (-(1 : ℝ) ^ a) := by
    simpa only [Real.one_rpow] using mittagLeffler_deriv_real ha
  convert hd.comp 1 hp' using 1
  · rfl
  · field_simp [ha.ne']

private theorem quantileLaplace_deriv (a : ℝ) :
    HasDerivAt (fun x : ℝ => ∫ u in Ioo 0 1, Real.exp (-x * Real.exp (logQuantile a u)))
      (-(∫ u in Ioo 0 1, Real.exp (logQuantile a u) * Real.exp (-Real.exp (logQuantile a u)))) 1 := by
  let q := fun u => Real.exp (logQuantile a u)
  have hq : Measurable q := Real.continuous_exp.measurable.comp (measurable_logQuantile a)
  let μ := volume.restrict (Ioo (0 : ℝ) 1)
  have : IsFiniteMeasure μ := ⟨by simp [μ, Measure.restrict_apply, Real.volume_Ioo]⟩
  have h (u : ℝ) : 0 < q u := Real.exp_pos _
  have hm (x : ℝ) : Measurable (fun u => Real.exp (-x * q u)) := by fun_prop
  have hm' : Measurable (fun u => -q u * Real.exp (-(1 : ℝ) * q u)) :=
    hq.neg.mul (hm 1)
  have h₁ : Integrable (fun u => Real.exp (-(1 : ℝ) * q u)) μ := by
    refine Integrable.of_bound (hm 1).aestronglyMeasurable 1 (Filter.Eventually.of_forall ?_)
    intro u
    rw [Real.norm_eq_abs, abs_of_pos (Real.exp_pos _)]
    exact Real.exp_le_one_iff.mpr (by linarith [h u])
  have hi := (hasDerivAt_integral_of_dominated_loc_of_deriv_le
      (μ := μ) (F := fun x u => Real.exp (-x * q u))
      (F' := fun x u => -q u * Real.exp (-x * q u)) (bound := fun _ => 2)
      (s := Ioi (1 / 2 : ℝ)) (x₀ := 1) (Ioi_mem_nhds (by norm_num))
      (Filter.Eventually.of_forall fun x => (hm x).aestronglyMeasurable) h₁ hm'.aestronglyMeasurable
      ?_ (integrable_const _) ?_).2
  · convert hi using 1
    simp [μ, q, neg_mul, integral_neg]
  · filter_upwards [] with u using fun x hx => by
      rw [Real.norm_eq_abs, abs_of_nonpos (mul_nonpos_of_nonpos_of_nonneg (neg_nonpos.mpr (h u).le)
        (Real.exp_pos _).le), neg_mul, neg_neg]
      have haux := kernel_bounds (Real.log (x * q u))
      have hx' : (1/2 : ℝ) < x := hx
      have hpos : 0 < x * q u := mul_pos (by linarith) (h u)
      have hh : x * (q u * Real.exp (-x * q u)) ≤ 1 := by
        simpa [kernel, sub_eq_add_neg, Real.exp_add, Real.exp_log hpos, mul_assoc] using haux.2
      nlinarith [mul_nonneg (show 0 ≤ x - 1/2 by linarith)
        (mul_nonneg (h u).le (Real.exp_pos (-x * q u)).le)]
  · filter_upwards [] with u x _
    have hd := (((hasDerivAt_id x).neg).mul_const (q u)).exp
    simpa [mul_comm] using hd

/-- Pollard's representation near one, expressed for the one-parameter series. -/
def PollardRepresentation : Prop :=
  ∀ a ∈ Ioo (0 : ℝ) 1, ∀ᶠ x : ℝ in nhds 1,
    mittagLeffler a 1 (-(x ^ a)) = ∫ r in Ioi 0, density a r * Real.exp (-x * r)

/-- Pollard's representation, together with the checked integral comparison, implies Remark 5(b). -/
theorem diagonal_strictMono_of_pollard (pollard : PollardRepresentation) :
    StrictMonoOn (fun a => mittagLeffler a a (-1)) (Ioo 0 1) := by
  have he (a : ℝ) (ha : a ∈ Ioo 0 1) :
      mittagLeffler a a (-1) = ∫ r in Ioi 0, density a r * (r * Real.exp (-r)) := by
    have hlocal := (pollard a ha).mono fun x hx => hx.trans (integral_density_eq_quantile ha _)
    have hd := (quantileLaplace_deriv a).congr_of_eventuallyEq hlocal
    have hh := (mittagLeffler_at_one_hasDerivAt ha.1).unique hd
    rw [integral_density_eq_quantile ha]
    exact neg_injective hh
  intro a ha b hb hab
  dsimp only
  rw [he a ha, he b hb]
  exact densityIntegral_strictMono ha hb hab

end FerreiraSimonDiagonal
