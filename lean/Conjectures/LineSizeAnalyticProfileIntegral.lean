import Conjectures.LineSizeAnalyticProfileBasic

/-! Integrability at the singular endpoint, the complete integral, and the
primitive's endpoint limits. The Basel value is obtained by integrating an
absolutely summable exponential series, not supplied as a hypothesis. -/
namespace LineSize.Profile

open Real Set Filter MeasureTheory
open scoped Topology

noncomputable def seriesTerm (m : ℕ) (x : ℝ) : ℝ :=
  Real.exp (-((m:ℝ)+1)*x)/((m:ℝ)+1)

theorem seriesTerm_pos (m : ℕ) (x : ℝ) : 0<seriesTerm m x := by
  unfold seriesTerm
  positivity

theorem f_hasSum {x : ℝ} (hx : 0<x) :
    HasSum (fun m : ℕ => seriesTerm m x) (f x) := by
  have h : HasSum (fun m : ℕ => Real.exp (-x)^(m+1)/((m:ℝ)+1)) (f x) := by
    apply Real.hasSum_pow_div_log_of_abs_lt_one
    rw [abs_of_pos (Real.exp_pos _)]
    exact Real.exp_lt_one_iff.mpr (by linarith)
  convert h using 1
  funext m
  unfold seriesTerm
  congr 1
  rw [← Real.exp_nat_mul]
  congr 1
  push_cast
  ring

theorem integrableOn_seriesTerm (m : ℕ) : IntegrableOn (seriesTerm m) (Ioi 0) := by
  exact (integrableOn_exp_mul_Ioi
    (neg_neg_of_pos (show 0<((m:ℝ)+1) by positivity)) 0).div_const ((m:ℝ)+1)

theorem integral_seriesTerm (m : ℕ) :
    (∫ x in Ioi (0:ℝ), seriesTerm m x)=1/((m:ℝ)+1)^2 := by
  unfold seriesTerm
  rw [integral_div,integral_exp_mul_Ioi
    (neg_neg_of_pos (show 0<((m:ℝ)+1) by positivity))]
  simp only [mul_zero,Real.exp_zero,neg_div_neg_eq]
  rw [div_div,pow_two]

theorem integral_f_Ioi : (∫ x in Ioi (0:ℝ), f x)=Real.pi^2/6 := by
  have hnorm : ∀ m x, ‖seriesTerm m x‖=seriesTerm m x :=
    fun m x => Real.norm_of_nonneg (seriesTerm_pos m x).le
  have hs : Summable (fun m : ℕ => ∫ x in Ioi (0:ℝ), ‖seriesTerm m x‖) := by
    simp_rw [hnorm,integral_seriesTerm]
    exact RectangleEuler.basel_summable
  have hint := integral_tsum_of_summable_integral_norm integrableOn_seriesTerm hs
  have hae : (fun x : ℝ => ∑' m, seriesTerm m x)=ᵐ[volume.restrict (Ioi 0)] f := by
    filter_upwards [ae_restrict_mem measurableSet_Ioi] with x hx
    exact (f_hasSum hx).tsum_eq
  calc
    (∫ x in Ioi (0:ℝ), f x)=(∫ x in Ioi (0:ℝ), ∑' m, seriesTerm m x) :=
      integral_congr_ae hae.symm
    _=∑' m, (∫ x in Ioi (0:ℝ), seriesTerm m x) := hint.symm
    _=RectangleEuler.basel := by simp only [integral_seriesTerm,RectangleEuler.basel]
    _=Real.pi^2/6 := RectangleEuler.basel_eq_pi_sq_div_six

theorem integrableOn_f : IntegrableOn f (Ioi 0) := by
  by_contra h
  have hz := integral_undef h
  rw [integral_f_Ioi] at hz
  have hp : 0<Real.pi^2/6 := div_pos (sq_pos_of_pos Real.pi_pos) (by norm_num)
  linarith

theorem intervalIntegrable_f {u : ℝ} (hu : 0≤u) : IntervalIntegrable f volume 0 u := by
  apply (intervalIntegrable_iff_integrableOn_Ioc_of_le hu).2
  exact integrableOn_f.mono_set Ioc_subset_Ioi_self

theorem hasDerivAt_I {u : ℝ} (hu : 0<u) : HasDerivAt I (f u) u := by
  exact intervalIntegral.integral_hasDerivAt_right (intervalIntegrable_f hu.le)
    measurable_f.stronglyMeasurable.stronglyMeasurableAtFilter (continuousAt_f hu)

theorem continuousWithinAt_I_zero : ContinuousWithinAt I (Ici 0) 0 := by
  have hc := intervalIntegral.continuousWithinAt_primitive
    (f:=f) (a:=0) (b₁:=0) (b₂:=1) (b₀:=0) (μ:=volume)
    (by simp) (by simpa using intervalIntegrable_f (u:=1) (by norm_num))
  change Tendsto I (𝓝[Icc 0 1] 0) (𝓝 (I 0)) at hc
  rw [nhdsWithin_Icc_eq_nhdsGE (by norm_num : (0:ℝ)<1)] at hc
  exact hc

theorem tendsto_I_zero : Tendsto I (𝓝[>] 0) (𝓝 0) := by
  have h := continuousWithinAt_I_zero.mono Ioi_subset_Ici_self
  change Tendsto I (𝓝[>] 0) (𝓝 (I 0)) at h
  simpa only [I_zero] using h

theorem tendsto_I_atTop : Tendsto I atTop (𝓝 (Real.pi^2/6)) := by
  have h := intervalIntegral_tendsto_integral_Ioi 0 integrableOn_f tendsto_id
  change Tendsto (fun u : ℝ => ∫ x in 0..u, f x) atTop (𝓝 (Real.pi^2/6))
  simpa only [integral_f_Ioi,id_eq] using h

theorem mul_f_le_I {u : ℝ} (hu : 0<u) : u*f u≤I u := by
  have h := intervalIntegral.integral_mono_on_of_le_Ioo hu.le
    (intervalIntegrable_const (c:=f u)) (intervalIntegrable_f hu.le)
    (fun x hx => (f_strictAntiOn hx.1 hu hx.2).le)
  simpa only [intervalIntegral.integral_const,sub_zero,smul_eq_mul,I] using h

theorem tendsto_mul_f_zero : Tendsto (fun x : ℝ => x*f x) (𝓝[>] 0) (𝓝 0) := by
  apply squeeze_zero' _ _ tendsto_I_zero
  · filter_upwards [self_mem_nhdsWithin] with x hx
    exact mul_nonneg hx.le (f_pos hx).le
  · filter_upwards [self_mem_nhdsWithin] with x hx
    exact mul_f_le_I hx

theorem integrableOn_meanKernel {u : ℝ} : IntegrableOn meanKernel (Icc 0 u) := by
  have hc : IntegrableOn (fun _ : ℝ => (1:ℝ)) (Icc 0 u) :=
    integrableOn_const isCompact_Icc.measure_lt_top.ne
  apply hc.mono' measurable_meanKernel.aestronglyMeasurable
  filter_upwards [ae_restrict_mem measurableSet_Icc] with x hx
  rw [Real.norm_eq_abs,abs_of_nonneg (meanKernel_nonneg hx.1)]
  exact meanKernel_le_one hx.1

theorem intervalIntegrable_meanKernel {u : ℝ} (hu : 0≤u) :
    IntervalIntegrable meanKernel volume 0 u :=
  (intervalIntegrable_iff_integrableOn_Icc_of_le hu).2 integrableOn_meanKernel

theorem integrableOn_varianceKernel {u : ℝ} : IntegrableOn varianceKernel (Icc 0 u) := by
  have hc : IntegrableOn (fun _ : ℝ => Real.exp u) (Icc 0 u) :=
    integrableOn_const isCompact_Icc.measure_lt_top.ne
  apply hc.mono' measurable_varianceKernel.aestronglyMeasurable
  filter_upwards [ae_restrict_mem measurableSet_Icc] with x hx
  rw [Real.norm_eq_abs,abs_of_nonneg (varianceKernel_nonneg x)]
  exact varianceKernel_le_exp hx.1 hx.2

theorem intervalIntegrable_varianceKernel {u : ℝ} (hu : 0≤u) :
    IntervalIntegrable varianceKernel volume 0 u :=
  (intervalIntegrable_iff_integrableOn_Icc_of_le hu).2 integrableOn_varianceKernel

theorem V_pos {u : ℝ} (hu : 0<u) : 0<V u :=
  intervalIntegral.intervalIntegral_pos_of_pos_on (intervalIntegrable_varianceKernel hu.le)
    (fun _x hx => varianceKernel_pos hx.1) hu

end LineSize.Profile
