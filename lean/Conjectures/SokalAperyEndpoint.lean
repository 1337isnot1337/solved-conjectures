import Conjectures.SokalAperyContinuation
import Mathlib.Analysis.Analytic.IsolatedZeros

/-! A lower support endpoint inside the cut prevents analytic continuation of the half transform. -/

namespace SokalApery

open Set Filter Complex MeasureTheory
open scoped Topology

private noncomputable def vertical (s y : ℝ) : ℂ := (s : ℂ) + (y : ℂ) * I

private theorem vertical_tendsto (s : ℝ) : Tendsto (vertical s) (𝓝[>] (0 : ℝ)) (𝓝 (s : ℂ)) := by
  have hc : Continuous (vertical s) := by unfold vertical; fun_prop
  have h := hc.continuousAt (x := (0 : ℝ))
  change Tendsto (vertical s) (𝓝 (0 : ℝ)) (𝓝 (vertical s 0)) at h
  rw [show vertical s 0 = (s : ℂ) by simp [vertical]] at h
  exact h.mono_left nhdsWithin_le_nhds

private theorem vertical_im (s y : ℝ) : (vertical s y).im = y := by
  simp [vertical, add_im, mul_im]

private theorem vertical_sub_kernel_limit {s t : ℝ} (hst : s ≠ t) :
    Tendsto (fun y => (vertical s y - (t : ℂ)) ^ ((-1 / 2 : ℝ) : ℂ))
      (𝓝[>] (0 : ℝ)) (𝓝 (((s - t : ℝ) : ℂ) ^ ((-1 / 2 : ℝ) : ℂ))) := by
  let c : ℂ := ((-1 / 2 : ℝ) : ℂ)
  have ht : Tendsto (fun y => vertical s y - (t : ℂ)) (𝓝[>] (0 : ℝ)) (𝓝 ((s - t : ℝ) : ℂ)) := by
    simpa only [ofReal_sub] using (vertical_tendsto s).sub_const (t : ℂ)
  have hu : ∀ᶠ y in 𝓝[>] (0 : ℝ), 0 < y := self_mem_nhdsWithin
  rcases lt_or_gt_of_ne hst with hs | hs
  · have hwithin : Tendsto (fun y => vertical s y - (t : ℂ)) (𝓝[>] (0 : ℝ))
        (𝓝[{z : ℂ | 0 ≤ z.im}] ((s - t : ℝ) : ℂ)) := by
      apply tendsto_nhdsWithin_iff.mpr
      refine ⟨ht, hu.mono fun y hy => ?_⟩
      simpa [sub_im, vertical_im] using hy.le
    have hlog := continuousWithinAt_log_of_re_neg_of_im_zero
      (z := ((s - t : ℝ) : ℂ)) (by simpa using sub_neg.mpr hs) (by simp)
    have hh := (Complex.continuous_exp.tendsto _).comp ((hlog.tendsto.comp hwithin).mul_const c)
    rw [← cpow_def_of_ne_zero (ofReal_ne_zero.mpr (sub_ne_zero.mpr hst)) c] at hh
    apply hh.congr'
    filter_upwards [hu] with y hy
    have hn : vertical s y - (t : ℂ) ≠ 0 := by
      intro he
      have hi := congrArg Complex.im he
      simp [sub_im, vertical_im, hy.ne'] at hi
    exact (cpow_def_of_ne_zero hn c).symm
  · exact (continuousAt_cpow_const (b := c) (ofReal_mem_slitPlane.mpr
      (sub_pos.mpr hs))).tendsto.comp ht

private theorem integrable_vertical_kernel (μ : Measure ℝ) [IsFiniteMeasure μ]
    {s y : ℝ} (hy : 0 < y) :
    Integrable (fun t : ℝ => (vertical s y - (t : ℂ)) ^ ((-1 / 2 : ℝ) : ℂ)) μ := by
  have ha : Continuous (fun t : ℝ => (vertical s y - (t : ℂ)) ^ ((-1 / 2 : ℝ) : ℂ)) := by
    apply continuous_iff_continuousAt.mpr
    intro t
    have h : vertical s y - (t : ℂ) ∈ slitPlane :=
      mem_slitPlane_iff.mpr (Or.inr (by simpa [sub_im, vertical_im] using hy.ne'))
    apply (continuousAt_cpow_const h).comp (f := fun t : ℝ => vertical s y - (t : ℂ))
    exact (continuous_const.sub Complex.continuous_ofReal).continuousAt
  apply Integrable.of_bound ha.aestronglyMeasurable (y ^ (-1 / 2 : ℝ))
  filter_upwards [] with t
  rw [norm_cpow_real]
  apply Real.rpow_le_rpow_of_nonpos hy _ (by norm_num)
  simpa [sub_im, vertical_im, abs_of_pos hy] using abs_im_le_norm (vertical s y - (t : ℂ))

private theorem halfTransform_tendsto_of_gap (μ : Measure ℝ) [IsFiniteMeasure μ]
    {s δ : ℝ} (hδ : 0 < δ) (hgap : ∀ᵐ t ∂μ, δ ≤ |s - t|) :
    Tendsto (fun y => halfTransform μ (vertical s y)) (𝓝[>] (0 : ℝ))
      (𝓝 (∫ t : ℝ, ((s - t : ℝ) : ℂ) ^ ((-1 / 2 : ℝ) : ℂ) ∂μ)) := by
  have hu : ∀ᶠ y in 𝓝[>] (0 : ℝ), 0 < y := self_mem_nhdsWithin
  apply tendsto_integral_filter_of_dominated_convergence (fun _ => δ ^ (-1 / 2 : ℝ))
  · exact hu.mono fun _ hy => (integrable_vertical_kernel μ (s := s) hy).aestronglyMeasurable
  · filter_upwards [] with y
    filter_upwards [hgap] with t ht
    rw [norm_cpow_real]
    apply Real.rpow_le_rpow_of_nonpos hδ _ (by norm_num)
    have he := abs_re_le_norm (vertical s y - (t : ℂ))
    have hb : |s - t| ≤ ‖vertical s y - (t : ℂ)‖ := by
      simpa [vertical, add_re, sub_re, mul_re] using he
    exact ht.trans hb
  · exact integrable_const _
  · filter_upwards [hgap] with t ht
    apply vertical_sub_kernel_limit
    intro he
    simp [he, hδ.not_ge] at ht

private theorem re_kernel_nonneg (z : ℂ) : 0 ≤ (z ^ ((-1 / 2 : ℝ) : ℂ)).re := by
  rw [cpow_ofReal_re]
  apply mul_nonneg (Real.rpow_nonneg (norm_nonneg _) _) (Real.cos_nonneg_of_mem_Icc _)
  constructor <;> linarith [arg_le_pi z, neg_pi_lt_arg z]

private theorem re_integral {μ : Measure ℝ} {f : ℝ → ℂ} (hf : Integrable f μ) :
    (∫ t, f t ∂μ).re = ∫ t, (f t).re ∂μ := (integral_re (𝕜 := ℂ) hf).symm

private theorem extension_real_left {μ : Measure ℝ} [IsFiniteMeasure μ] {H : ℂ → ℂ}
    {b s : ℝ} (hb : ∀ᵐ t ∂μ, b ≤ t) (hs : s < b) (hc : ContinuousAt H (s : ℂ))
    (hH : EqOn (halfTransform μ) H {w | 0 < w.im}) : (H (s : ℂ)).re = 0 := by
  have hgap : ∀ᵐ t ∂μ, b - s ≤ |s - t| := hb.mono fun t ht => by
    rw [abs_of_neg (by linarith)]
    linarith
  let f := fun t : ℝ => ((s - t : ℝ) : ℂ) ^ ((-1 / 2 : ℝ) : ℂ)
  have hlim := halfTransform_tendsto_of_gap μ (sub_pos.mpr hs) hgap
  have hHlim := hc.tendsto.comp (vertical_tendsto s)
  have hu : ∀ᶠ y in 𝓝[>] (0 : ℝ), 0 < y := self_mem_nhdsWithin
  have heq : (H ∘ vertical s) =ᶠ[𝓝[>] (0 : ℝ)] fun y => halfTransform μ (vertical s y) :=
    hu.mono fun y hy => (hH (x := vertical s y) (by simpa [vertical_im] using hy)).symm
  have he : (H (s : ℂ)) = ∫ t, f t ∂μ := tendsto_nhds_unique (hHlim.congr' heq) hlim
  rw [he]
  by_cases hf : Integrable f μ
  · rw [re_integral hf, integral_congr_ae (g := fun _ => (0 : ℝ)) ?_, integral_zero]
    filter_upwards [hb] with t ht
    have hh : s - t < 0 := by linarith
    dsimp only [f]
    rw [cpow_ofReal_re, arg_ofReal_of_neg hh, show Real.pi * (-1 / 2) = -(Real.pi / 2) by ring,
      Real.cos_neg, Real.cos_pi_div_two, mul_zero]
  · rw [integral_undef hf, zero_re]

private theorem extension_real_right {μ : Measure ℝ} [IsFiniteMeasure μ] {H : ℂ → ℂ}
    {b s : ℝ} (hb : μ (Iic b) ≠ 0) (hs : b < s) (hc : ContinuousAt H (s : ℂ))
    (hH : EqOn (halfTransform μ) H {w | 0 < w.im}) : 0 < (H (s : ℂ)).re := by
  let η := μ.restrict (Iic b)
  let f := fun t : ℝ => ((s - t : ℝ) : ℂ) ^ ((-1 / 2 : ℝ) : ℂ)
  have hf_pos : ∀ᵐ t ∂η, 0 < (f t).re := by
    filter_upwards [ae_restrict_mem (μ := μ) measurableSet_Iic] with t ht
    have hp : 0 < s - t := sub_pos.mpr (lt_of_le_of_lt ht hs)
    dsimp [f]
    rw [← Complex.ofReal_cpow hp.le, Complex.ofReal_re]
    exact Real.rpow_pos_of_pos hp _
  have hf : Integrable f η := by
    have hpow : AEMeasurable (fun t : ℝ => ((s - t) ^ (-1 / 2 : ℝ) : ℝ)) η := by fun_prop
    have he : f =ᵐ[η] fun t => (((s - t) ^ (-1 / 2 : ℝ) : ℝ) : ℂ) := by
      filter_upwards [ae_restrict_mem (μ := μ) measurableSet_Iic] with t ht
      exact (Complex.ofReal_cpow (sub_nonneg.mpr (ht.trans hs.le)) _).symm
    apply Integrable.congr _ he.symm
    apply Integrable.of_bound (Complex.continuous_ofReal.measurable.comp_aemeasurable hpow).aestronglyMeasurable
      ((s - b) ^ (-1 / 2 : ℝ))
    filter_upwards [ae_restrict_mem (μ := μ) measurableSet_Iic] with t ht
    have hn : 0 ≤ s - t := sub_nonneg.mpr (ht.trans hs.le)
    change ‖(((s - t) ^ (-1 / 2 : ℝ) : ℝ) : ℂ)‖ ≤ _
    rw [Complex.norm_real, Real.norm_of_nonneg (Real.rpow_nonneg hn _)]
    exact Real.rpow_le_rpow_of_nonpos (sub_pos.mpr hs) (sub_le_sub_left (mem_Iic.mp ht) s) (by norm_num)
  have hpos : 0 < (∫ t, f t ∂η).re := by
    rw [re_integral hf, integral_pos_iff_support_of_nonneg_ae (hf_pos.mono fun _ h => h.le) hf.re]
    have hn : η ≠ 0 := by
      intro he
      apply hb
      simpa [η, Measure.restrict_apply, measurableSet_Iic] using congrArg (fun ν : Measure ℝ => ν univ) he
    rw [pos_iff_ne_zero]
    intro hz
    have ha : ∀ᵐ t ∂η, t ∉ Function.support (fun t => (f t).re) := ae_iff.mpr (by simpa [Function.support] using hz)
    have hfalse : ∀ᵐ t ∂η, False := (hf_pos.and ha).mono fun _ ht => ht.2 ht.1.ne'
    exact hn (Measure.measure_univ_eq_zero.mp (by simpa [ae_iff] using hfalse))
  have hgap : ∀ᵐ t ∂η, s - b ≤ |s - t| := by
    filter_upwards [ae_restrict_mem (μ := μ) measurableSet_Iic] with t ht
    have ht' : t ≤ b := ht
    rw [abs_of_nonneg (by linarith)]
    linarith
  have hL := continuous_re.continuousAt.tendsto.comp
    (halfTransform_tendsto_of_gap η (sub_pos.mpr hs) hgap)
  have hR := continuous_re.continuousAt.tendsto.comp (hc.tendsto.comp (vertical_tendsto s))
  refine hpos.trans_le (le_of_tendsto_of_tendsto hL hR ?_)
  filter_upwards [(self_mem_nhdsWithin : ∀ᶠ y in 𝓝[>] (0 : ℝ), 0 < y)] with y hy
  change (halfTransform η (vertical s y)).re ≤ (H (vertical s y)).re
  rw [← hH (x := vertical s y) (by simpa [vertical_im] using hy), halfTransform, halfTransform,
    re_integral (integrable_vertical_kernel μ hy), re_integral (integrable_vertical_kernel η hy)]
  exact integral_mono_measure Measure.restrict_le_self
    (Eventually.of_forall fun _ => re_kernel_nonneg _) (integrable_vertical_kernel μ hy).re

/-- An isolated lower endpoint inside the cut prevents a holomorphic extension.
Every cutoff above the endpoint is required to have positive mass. -/
theorem halfTransform_no_extension_at_lower_endpoint {μ : Measure ℝ} [IsFiniteMeasure μ]
    {b : ℝ} (hb : ∀ᵐ t ∂μ, b ≤ t) (hpos : ∀ s > b, μ (Iic s) ≠ 0) :
    ¬ ∃ H : ℂ → ℂ, AnalyticAt ℂ H (b : ℂ) ∧ EqOn (halfTransform μ) H {w | 0 < w.im} := by
  rintro ⟨H, hH, he⟩
  have hc : ∀ᶠ s : ℝ in 𝓝 b, ContinuousAt H (s : ℂ) :=
    (Complex.continuous_ofReal.tendsto b).eventually hH.eventually_continuousAt
  have hl : ∀ᶠ s : ℝ in 𝓝[<] b, (H (s : ℂ)).re = 0 := by
    filter_upwards [hc.filter_mono nhdsWithin_le_nhds,
      (self_mem_nhdsWithin : ∀ᶠ s in 𝓝[<] b, s < b)] with s hs hs'
    exact extension_real_left hb hs' hs he
  have hr : ∀ᶠ s : ℝ in 𝓝[>] b, 0 < (H (s : ℂ)).re := by
    filter_upwards [hc.filter_mono nhdsWithin_le_nhds,
      (self_mem_nhdsWithin : ∀ᶠ s in 𝓝[>] b, b < s)] with s hs hs'
    have hlt : b < s := hs'
    exact extension_real_right (hpos ((s + b) / 2) (by linarith)) (by linarith) hs he
  have hz := hH.re_ofReal.frequently_zero_iff_eventually_zero.mp
    (hl.frequently.filter_mono (nhdsLT_le_nhdsNE b))
  have hfalse : ∀ᶠ s : ℝ in 𝓝[>] b, False :=
    ((hz.filter_mono (nhdsWithin_le_nhds (s := Ioi b))).and hr).mono (fun _ h => h.2.ne' h.1)
  obtain ⟨_, hf⟩ := hfalse.exists
  exact hf

end SokalApery
