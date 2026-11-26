module
public import Conjectures.PomeranceSarkozyRareSlopeTop
public import Conjectures.PomeranceSarkozyRareGaussianTailBounds
public import Conjectures.PomeranceSarkozyTailVarianceDominance
public import Mathlib.MeasureTheory.Measure.Haar.NormedSpace
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

@[expose] public section
namespace PomeranceSarkozy

open Filter MeasureTheory Set
open scoped Topology

noncomputable def rareSlopeProfile (t u : ℝ) : ℝ :=
  gaussianRareFirstIntegrand t (Real.sqrt (2*t)*u)

private theorem square_rare_coordinate (t u : ℝ) (ht : 0≤t) :
    (Real.sqrt (2*t)*u)^2/2=t*u^2 := by
  rw [mul_pow,Real.sq_sqrt (by positivity : 0≤2*t)]
  ring

private theorem rare_slope_denominator_ge_one {p t : ℝ} (hp : 0≤p) (ht : 0≤t) :
    1≤bernoulliExponentialDenominator p t := by
  unfold bernoulliExponentialDenominator
  exact le_add_of_nonneg_right (mul_nonneg (sub_nonneg.mpr (Real.one_le_exp_iff.mpr ht)) hp)

private theorem rare_slope_tilt_le_one (p t : ℝ) (h0 : 0≤p) (h1 : p≤1) :
    bernoulliTiltedProbability p t≤1 := by
  unfold bernoulliTiltedProbability
  refine (div_le_iff₀ (bernoulliExponentialDenominator_pos h0 h1 t)).mpr ?_
  unfold bernoulliExponentialDenominator
  linarith

private theorem rare_slope_profile_nonneg (t u : ℝ) (ht : 0≤t) : 0≤rareSlopeProfile t u := by
  unfold rareSlopeProfile gaussianRareFirstIntegrand
  obtain ⟨h₀,h₁⟩ := normalTailProbability_mem_Icc (Real.sqrt (2*t)*u)
  rw [bernoulliTiltedProbability_sub_parameter _ _ h₀ h₁]
  have he := Real.one_le_exp_iff.mpr ht
  exact div_nonneg (by positivity) (bernoulliExponentialDenominator_pos h₀ h₁ t).le

private theorem rare_slope_profile_le_one (t u : ℝ) : rareSlopeProfile t u≤1 := by
  unfold rareSlopeProfile gaussianRareFirstIntegrand
  obtain ⟨h₀,h₁⟩ := normalTailProbability_mem_Icc (Real.sqrt (2*t)*u)
  linarith [rare_slope_tilt_le_one _ t h₀ h₁]

private theorem rare_slope_profile_left (t u : ℝ) (ht : 0≤t) (hu : u≤0) :
    rareSlopeProfile t u≤Real.exp (-t*u^2) := by
  let s := Real.sqrt (2*t)*u
  let p := normalTailProbability s
  obtain ⟨h₀,h₁⟩ := normalTailProbability_mem_Icc s
  have hs : 0≤ -s := neg_nonneg.mpr (mul_nonpos_of_nonneg_of_nonpos (Real.sqrt_nonneg _) hu)
  have hU := normalTailProbability_gaussian_upper (-s) hs
  rw [normalTailProbability_neg,neg_sq,show -s^2/2= -(t*u^2) by
    rw [neg_div,square_rare_coordinate t u ht]] at hU
  change bernoulliTiltedProbability p t-p≤_
  have hb := rare_slope_tilt_le_one p t h₀ h₁
  rw [neg_mul]
  exact (sub_le_sub_right hb p).trans hU

private theorem rare_slope_profile_right (t u : ℝ) (ht : 0≤t) (hu : 0≤u) :
    rareSlopeProfile t u≤Real.exp (-(u^2-1)*t) := by
  let s := Real.sqrt (2*t)*u
  let p := normalTailProbability s
  obtain ⟨h₀,_⟩ := normalTailProbability_mem_Icc s
  have hs : 0≤ s := mul_nonneg (Real.sqrt_nonneg _) hu
  have hp : p≤Real.exp (-(t*u^2)) := by
    have h := normalTailProbability_gaussian_upper s hs
    rw [neg_div,square_rare_coordinate t u ht] at h
    exact h
  change bernoulliTiltedProbability p t-p≤_
  have hQ : bernoulliTiltedProbability p t≤p*Real.exp t := by
    unfold bernoulliTiltedProbability
    exact div_le_self (mul_nonneg h₀ (Real.exp_pos _).le) (rare_slope_denominator_ge_one h₀ ht)
  calc
    _ ≤ p*Real.exp t := (sub_le_self _ h₀).trans hQ
    _ ≤ Real.exp (-(t*u^2))*Real.exp t := mul_le_mul_of_nonneg_right hp (Real.exp_pos _).le
    _ = _ := by rw [← Real.exp_add]; congr 1; ring

private theorem rare_slope_profile_growth (u : ℝ) (h0 : 0<u) (h1 : u<1) :
    Tendsto (fun t : ℝ=>normalTailProbability (Real.sqrt (2*t)*u)*Real.exp t) atTop atTop := by
  let a := (1-u^2)/2
  have ha : 0<a := by
    unfold a
    nlinarith [mul_pos (sub_pos.mpr h1) (by linarith : 0<1+u)]
  have hSq : Tendsto (fun t : ℝ=>Real.sqrt (2*t)) atTop atTop := by
    simp_rw [Real.sqrt_eq_rpow]
    exact (tendsto_rpow_atTop (by norm_num : (0:ℝ)<1/2)).comp (tendsto_id.const_mul_atTop (by norm_num : (0:ℝ)<2))
  have hA : Tendsto (fun t : ℝ=>a*t-1/2) atTop atTop := by
    simpa only [sub_eq_add_neg,id_eq] using
      tendsto_atTop_add_const_right atTop (-(1/2:ℝ)) (tendsto_id.const_mul_atTop ha)
  have hLow : Tendsto (fun t : ℝ=>standardGaussianNorm*Real.exp (a*t-1/2)) atTop atTop :=
    (Real.tendsto_exp_atTop.comp hA).const_mul_atTop standardGaussianNorm_pos
  refine tendsto_atTop_mono' atTop ?_ hLow
  filter_upwards [eventually_ge_atTop (0:ℝ),hSq.eventually_ge_atTop (2*u/a)] with t ht hR
  let r := Real.sqrt (2*t)
  have hS : r^2=2*t := Real.sq_sqrt (by positivity)
  have hr : 0≤r := Real.sqrt_nonneg _
  have hU : r*u≤a*t := by
    have h := mul_le_mul_of_nonneg_right ((div_le_iff₀ ha).mp hR) hr
    nlinarith [congrArg (fun z : ℝ=>a*z) hS]
  have he : a*t-1/2≤ -((r*u+1)^2)/2+t := by
    have h := square_rare_coordinate t u ht
    change (r*u)^2/2=t*u^2 at h
    unfold a at hU ⊢
    nlinarith
  calc
    _ ≤ standardGaussianNorm*Real.exp (-((r*u+1)^2)/2+t) :=
      mul_le_mul_of_nonneg_left (Real.exp_le_exp.mpr he) standardGaussianNorm_pos.le
    _ = standardGaussianNorm*Real.exp (-((r*u+1)^2)/2)*Real.exp t := by rw [Real.exp_add,mul_assoc]
    _ ≤ _ := mul_le_mul_of_nonneg_right (normalTailProbability_gaussian_lower _ (mul_nonneg hr h0.le)) (Real.exp_pos _).le

private theorem rare_slope_profile_inside (u : ℝ) (h0 : 0<u) (h1 : u<1) :
    Tendsto (fun t=>rareSlopeProfile t u) atTop (𝓝 1) := by
  let p (t : ℝ) := normalTailProbability (Real.sqrt (2*t)*u)
  have hP : Tendsto p atTop (𝓝 0) := by
    have hE : Tendsto (fun t : ℝ=>Real.exp (-(u^2)*t)) atTop (𝓝 0) :=
      Real.tendsto_exp_atBot.comp (tendsto_id.const_mul_atTop_of_neg (neg_neg_of_pos (sq_pos_of_pos h0)))
    refine squeeze_zero' (Filter.Eventually.of_forall (fun _=>(normalTailProbability_mem_Icc _).1)) ?_ hE
    filter_upwards [eventually_ge_atTop (0:ℝ)] with t ht
    have h := normalTailProbability_gaussian_upper (Real.sqrt (2*t)*u) (by positivity)
    rw [neg_div,square_rare_coordinate t u ht,show -(t*u^2)=-(u^2)*t by ring] at h
    exact h
  have hInv : Tendsto (fun t=>(p t*Real.exp t)⁻¹) atTop (𝓝 0) :=
    tendsto_inv_atTop_zero.comp (rare_slope_profile_growth u h0 h1)
  have hConst : Tendsto (fun _ : ℝ=>(1:ℝ)) atTop (𝓝 1) := tendsto_const_nhds
  have h : Tendsto (fun t=>1-p t-(p t*Real.exp t)⁻¹) atTop (𝓝 1) := by
    simpa only [sub_zero] using (hConst.sub hP).sub hInv
  refine tendsto_of_tendsto_of_tendsto_of_le_of_le' h tendsto_const_nhds ?_
    (Filter.Eventually.of_forall (fun t=>rare_slope_profile_le_one t u))
  filter_upwards [] with t
  have hp : 0<p t := (normalTailProbability_strict _).1
  have hp1 : p t≤1 := (normalTailProbability_mem_Icc _).2
  let D := bernoulliExponentialDenominator (p t) t
  have hD := bernoulliExponentialDenominator_pos hp.le hp1 t
  have hN : 0<p t*Real.exp t := mul_pos hp (Real.exp_pos _)
  have hLE : p t*Real.exp t≤D := by unfold D bernoulliExponentialDenominator; linarith
  have hf : 1-bernoulliTiltedProbability (p t) t=(1-p t)/D := by
    unfold bernoulliTiltedProbability D
    field_simp
    unfold bernoulliExponentialDenominator
    ring
  have hb : (1-p t)/D≤(p t*Real.exp t)⁻¹ := by
    calc
      _ ≤ 1/D := div_le_div_of_nonneg_right (by linarith) hD.le
      _ ≤ _ := by rw [one_div]; exact inv_anti₀ hN hLE
  change 1-p t-(p t*Real.exp t)⁻¹≤bernoulliTiltedProbability (p t) t-p t
  linarith [hf.trans_le hb]

private theorem rareSlopeProfile_tendsto (u : ℝ) (h0 : u≠0) (h1 : u≠1) :
    Tendsto (fun t=>rareSlopeProfile t u) atTop
      (𝓝 ((Ioo (0:ℝ) 1).indicator (fun _=>(1:ℝ)) u)) := by
  by_cases hu : u<0
  · rw [indicator_of_notMem (show u∉Ioo (0:ℝ) 1 from fun h=>hu.not_gt h.1)]
    have h : Tendsto (fun t : ℝ=>Real.exp (-(u^2)*t)) atTop (𝓝 0) :=
      Real.tendsto_exp_atBot.comp (tendsto_id.const_mul_atTop_of_neg (neg_neg_of_pos (sq_pos_of_ne_zero h0)))
    refine squeeze_zero' ?_ ?_ h
    · filter_upwards [eventually_ge_atTop (0:ℝ)] with t ht
      exact rare_slope_profile_nonneg t u ht
    · filter_upwards [eventually_ge_atTop (0:ℝ)] with t ht
      simpa only [neg_mul,mul_comm t] using rare_slope_profile_left t u ht hu.le
  · have hU : 0<u := lt_of_le_of_ne (le_of_not_gt hu) (Ne.symm h0)
    by_cases hU' : u<1
    · rw [indicator_of_mem (show u∈Ioo (0:ℝ) 1 from ⟨hU,hU'⟩)]
      exact rare_slope_profile_inside u hU hU'
    · have hlt : 1<u := lt_of_le_of_ne (le_of_not_gt hU') (Ne.symm h1)
      rw [indicator_of_notMem (show u∉Ioo (0:ℝ) 1 from fun h=>hlt.not_gt h.2)]
      have hN : 0<u^2-1 := by nlinarith [mul_pos (sub_pos.mpr hlt) (show 0<u+1 by linarith)]
      have h : Tendsto (fun t : ℝ=>Real.exp (-(u^2-1)*t)) atTop (𝓝 0) :=
        Real.tendsto_exp_atBot.comp (tendsto_id.const_mul_atTop_of_neg (neg_neg_of_pos hN))
      refine squeeze_zero' ?_ ?_ h
      · filter_upwards [eventually_ge_atTop (0:ℝ)] with t ht
        exact rare_slope_profile_nonneg t u ht
      · filter_upwards [eventually_ge_atTop (0:ℝ)] with t ht
        exact rare_slope_profile_right t u ht hU.le

private theorem rare_slope_profile_envelope (t u : ℝ) (ht : 1≤t) :
    ‖rareSlopeProfile t u‖≤2/(1+u^2) := by
  have hT : 0≤t := zero_le_one.trans ht
  rw [Real.norm_eq_abs,abs_of_nonneg (rare_slope_profile_nonneg t u hT)]
  by_cases hu : u^2≤1
  · exact (rare_slope_profile_le_one t u).trans ((le_div_iff₀ (by positivity)).mpr (by linarith))
  · have hU : 1≤u^2 := le_of_not_ge hu
    have h : rareSlopeProfile t u≤Real.exp (-(u^2-1)*t) := by
      rcases le_total 0 u with h|h
      · exact rare_slope_profile_right t u hT h
      · exact (rare_slope_profile_left t u hT h).trans (Real.exp_le_exp.mpr (by linarith))
    have hExp : -(u^2-1)*t≤ -(u^2-1) := by
      exact (mul_le_mul_of_nonpos_left ht (neg_nonpos.mpr (sub_nonneg.mpr hU))).trans_eq (mul_one _)
    refine h.trans ((Real.exp_le_exp.mpr hExp).trans ?_)
    rw [Real.exp_neg]
    have hE : u^2≤Real.exp (u^2-1) := by linarith [Real.add_one_le_exp (u^2-1)]
    refine (inv_anti₀ (by positivity : 0<u^2) hE).trans ?_
    rw [inv_eq_one_div,div_le_div_iff₀ (by positivity) (by positivity)]
    linarith

/-- The tilted slope integrand after scaling has a unit-height
front on (0,1). Dominated convergence gives the exact coefficient. -/
theorem gaussianRareCumulantSlope_over_sqrt_tendsto :
    Tendsto (fun t : ℝ=>gaussianRareCumulantSlope t/Real.sqrt (2*t)) atTop (𝓝 1) := by
  let f := (Ioo (0:ℝ) 1).indicator (fun _=>(1:ℝ))
  have hF : (∫ u : ℝ,f u)=1 := by
    unfold f
    rw [integral_indicator measurableSet_Ioo,setIntegral_const,Real.volume_real_Ioo,sub_zero,smul_eq_mul]
    norm_num
  have hL : Tendsto (fun t=>∫ u,rareSlopeProfile t u) atTop (𝓝 (∫ u,f u)) := by
    apply tendsto_integral_filter_of_dominated_convergence (bound:=fun u=>2/(1+u^2))
    · refine Filter.Eventually.of_forall (fun t=>?_ )
      have hMeas : Measurable (gaussianRareFirstIntegrand t) := by
        unfold gaussianRareFirstIntegrand bernoulliTiltedProbability bernoulliExponentialDenominator
        have h := normalTailProbability_measurable
        fun_prop
      exact (hMeas.comp (measurable_const.mul measurable_id)).aestronglyMeasurable
    · filter_upwards [eventually_ge_atTop (1:ℝ)] with t ht
      exact Filter.Eventually.of_forall (fun u=>rare_slope_profile_envelope t u ht)
    · exact cauchy_tail_envelope_integrable
    · have hNe (a : ℝ) : ∀ᵐ u ∂(volume : Measure ℝ),u≠a := by
        simp [ae_iff,measure_singleton]
      filter_upwards [hNe 0,hNe 1] with u h0 h1
      exact rareSlopeProfile_tendsto u h0 h1
  rw [hF] at hL
  refine hL.congr' ?_
  filter_upwards [eventually_gt_atTop (0:ℝ)] with t ht
  unfold rareSlopeProfile gaussianRareCumulantSlope
  rw [Measure.integral_comp_mul_left,abs_of_pos (by positivity),smul_eq_mul,div_eq_mul_inv,mul_comm]

end PomeranceSarkozy
