import Conjectures.RectangleBasel
import Mathlib.Analysis.SpecialFunctions.ImproperIntegrals
import Mathlib.MeasureTheory.Integral.DominatedConvergence
import Mathlib.Analysis.Convex.Deriv

/-! The literal saddle-profile functions for the line-size asymptotic.
All derivative and monotonicity statements in this file have their positive
domain stated explicitly. The value assigned to `log 0` is never used as a
continuity assertion at the singular endpoint. -/
namespace LineSize.Profile

open Real Set Filter MeasureTheory
open scoped Topology

noncomputable def f (x : ℝ) : ℝ := -Real.log (1-Real.exp (-x))
noncomputable def u0 : ℝ := Real.log 2
noncomputable def A : ℝ := Real.pi^2/12+(Real.log 2)^2/2
noncomputable def I (u : ℝ) : ℝ := ∫ x in 0..u, f x
noncomputable def Phi (u : ℝ) : ℝ := u*Real.log 2-u^2+I u
noncomputable def meanKernel (x : ℝ) : ℝ := x/(Real.exp x-1)
noncomputable def varianceKernel (x : ℝ) : ℝ :=
  x^2*Real.exp x/(Real.exp x-1)^2
noncomputable def M (u : ℝ) : ℝ := u^2+∫ x in 0..u, meanKernel x
noncomputable def V (u : ℝ) : ℝ := ∫ x in 0..u, varianceKernel x
noncomputable def PhiPrime (u : ℝ) : ℝ := Real.log 2-2*u+f u

theorem u0_pos : 0<u0 := Real.log_pos (by norm_num)

theorem exp_u0 : Real.exp u0=2 := Real.exp_log (by norm_num)

theorem exp_neg_u0 : Real.exp (-u0)=1/2 := by
  rw [Real.exp_neg,exp_u0]
  norm_num

theorem exp_sub_one_pos {x : ℝ} (hx : 0<x) : 0<Real.exp x-1 :=
  RectangleEuler.exp_sub_one_pos hx

theorem one_sub_exp_neg_pos {x : ℝ} (hx : 0<x) : 0<1-Real.exp (-x) := by
  have h := Real.exp_lt_one_iff.mpr (neg_neg_of_pos hx)
  linarith

@[simp] theorem f_zero : f 0=0 := by simp [f]
@[simp] theorem I_zero : I 0=0 := by simp [I]
@[simp] theorem Phi_zero : Phi 0=0 := by simp [Phi]
@[simp] theorem M_zero : M 0=0 := by simp [M]
@[simp] theorem V_zero : V 0=0 := by simp [V]

theorem f_pos {x : ℝ} (hx : 0<x) : 0<f x := by
  unfold f
  have h := Real.log_neg (one_sub_exp_neg_pos hx)
    (by linarith [Real.exp_pos (-x)] : 1-Real.exp (-x)<1)
  linarith

theorem f_involution {x : ℝ} (hx : 0<x) : f (f x)=x := by
  have he : Real.exp (-f x)=1-Real.exp (-x) := by
    simp only [f,neg_neg,Real.exp_log (one_sub_exp_neg_pos hx)]
  rw [f,he]
  simp only [sub_sub_cancel,Real.log_exp,neg_neg]

theorem f_u0 : f u0=u0 := by
  rw [f,exp_neg_u0]
  norm_num only [show (1:ℝ)-1/2=1/2 by norm_num]
  rw [Real.log_div (by norm_num) (by norm_num),Real.log_one]
  simp [u0]

theorem hasDerivAt_f {x : ℝ} (hx : 0<x) :
    HasDerivAt f (-(1/(Real.exp x-1))) x := by
  have h := (((hasDerivAt_id x).neg.exp).const_sub 1).log
    (ne_of_gt (one_sub_exp_neg_pos hx))
  convert h.neg using 1
  · rfl
  · simp only [Pi.neg_apply,id_eq,mul_neg_one,neg_neg]
    have he : Real.exp x≠0 := ne_of_gt (Real.exp_pos x)
    have hd : Real.exp x-1≠0 := ne_of_gt (exp_sub_one_pos hx)
    rw [Real.exp_neg]
    field_simp

theorem continuousAt_f {x : ℝ} (hx : 0<x) : ContinuousAt f x :=
  (hasDerivAt_f hx).continuousAt

theorem continuousOn_f : ContinuousOn f (Ioi 0) :=
  fun _ hx => (continuousAt_f hx).continuousWithinAt

theorem measurable_f : Measurable f := by
  unfold f
  fun_prop

theorem f_strictAntiOn : StrictAntiOn f (Ioi 0) := by
  intro x hx y hy hxy
  have harg : 1-Real.exp (-x)<1-Real.exp (-y) := by
    have h := Real.exp_lt_exp.mpr (neg_lt_neg hxy)
    linarith
  have hlog := Real.log_lt_log (one_sub_exp_neg_pos hx) harg
  unfold f
  linarith

theorem f_le_geom {x : ℝ} (hx : 0<x) :
    f x≤Real.exp (-x)/(1-Real.exp (-x)) := by
  have hp := one_sub_exp_neg_pos hx
  have h := Real.log_le_sub_one_of_pos (inv_pos.mpr hp)
  rw [Real.log_inv] at h
  calc
    f x≤(1-Real.exp (-x))⁻¹-1 := h
    _=Real.exp (-x)/(1-Real.exp (-x)) := by field_simp; ring

theorem f_le_two_exp {x : ℝ} (hx : u0≤x) : f x≤2*Real.exp (-x) := by
  have hx0 : 0<x := u0_pos.trans_le hx
  have he : Real.exp (-x)≤1/2 := by
    calc
      _≤Real.exp (-u0) := Real.exp_le_exp.mpr (neg_le_neg hx)
      _=1/2 := exp_neg_u0
  have hp := one_sub_exp_neg_pos hx0
  apply (f_le_geom hx0).trans
  apply (div_le_iff₀ hp).2
  nlinarith [Real.exp_pos (-x)]

theorem tendsto_f_atTop : Tendsto f atTop (𝓝 0) := by
  have harg : Tendsto (fun x : ℝ => 1-Real.exp (-x)) atTop (𝓝 1) := by
    simpa using Real.tendsto_exp_neg_atTop_nhds_zero.const_sub 1
  have h := (Real.continuousAt_log (by norm_num : (1:ℝ)≠0)).tendsto.comp harg
  change Tendsto (fun x : ℝ => -Real.log (1-Real.exp (-x))) atTop (𝓝 0)
  simpa only [Real.log_one,neg_zero,Function.comp_def] using h.neg

theorem tendsto_mul_f_atTop : Tendsto (fun x : ℝ => x*f x) atTop (𝓝 0) := by
  have hbound : Tendsto (fun x : ℝ => 2*(x*Real.exp (-x))) atTop (𝓝 0) := by
    simpa using (Real.tendsto_pow_mul_exp_neg_atTop_nhds_zero 1).const_mul 2
  apply squeeze_zero' _ _ hbound
  · filter_upwards [eventually_ge_atTop u0] with x hx
    exact mul_nonneg (u0_pos.trans_le hx).le (f_pos (u0_pos.trans_le hx)).le
  · filter_upwards [eventually_ge_atTop u0] with x hx
    have h := mul_le_mul_of_nonneg_left (f_le_two_exp hx) (u0_pos.trans_le hx).le
    nlinarith

theorem meanKernel_nonneg {x : ℝ} (hx : 0≤x) : 0≤meanKernel x := by
  exact div_nonneg hx (sub_nonneg.mpr (Real.one_le_exp_iff.mpr hx))

theorem meanKernel_le_one {x : ℝ} (hx : 0≤x) : meanKernel x≤1 := by
  rcases eq_or_lt_of_le hx with rfl | hx
  · simp [meanKernel]
  · apply (div_le_iff₀ (exp_sub_one_pos hx)).2
    linarith [Real.add_one_le_exp x]

theorem varianceKernel_eq (x : ℝ) :
    varianceKernel x=(meanKernel x)^2*Real.exp x := by
  simp only [varianceKernel,meanKernel,div_pow]
  ring

theorem varianceKernel_nonneg (x : ℝ) : 0≤varianceKernel x := by
  rw [varianceKernel_eq]
  positivity

theorem varianceKernel_pos {x : ℝ} (hx : 0<x) : 0<varianceKernel x := by
  unfold varianceKernel
  exact div_pos (mul_pos (sq_pos_of_pos hx) (Real.exp_pos x))
    (sq_pos_of_pos (exp_sub_one_pos hx))

theorem varianceKernel_le_exp {x u : ℝ} (hx : 0≤x) (hxu : x≤u) :
    varianceKernel x≤Real.exp u := by
  have hm0 := meanKernel_nonneg hx
  have hm1 := meanKernel_le_one hx
  have hm2 : meanKernel x^2≤1 := by nlinarith
  rw [varianceKernel_eq]
  calc
    _≤1*Real.exp x := mul_le_mul_of_nonneg_right hm2 (Real.exp_pos x).le
    _≤Real.exp u := by simpa using Real.exp_le_exp.mpr hxu

theorem continuousAt_meanKernel {x : ℝ} (hx : 0<x) : ContinuousAt meanKernel x := by
  exact continuousAt_id.div (Real.continuous_exp.continuousAt.sub continuousAt_const)
    (ne_of_gt (exp_sub_one_pos hx))

theorem continuousAt_varianceKernel {x : ℝ} (hx : 0<x) :
    ContinuousAt varianceKernel x := by
  rw [show varianceKernel=(fun y => meanKernel y^2*Real.exp y) from
    funext varianceKernel_eq]
  convert ((continuousAt_meanKernel hx).pow 2).mul Real.continuous_exp.continuousAt using 1

theorem measurable_meanKernel : Measurable meanKernel := by
  unfold meanKernel
  fun_prop

theorem measurable_varianceKernel : Measurable varianceKernel := by
  unfold varianceKernel
  fun_prop

end LineSize.Profile
