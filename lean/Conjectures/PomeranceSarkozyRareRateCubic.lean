module
public import Conjectures.PomeranceSarkozyRareSlopeProfile
public import Conjectures.PomeranceSarkozyRareRateQuadratic
public import Conjectures.PomeranceSarkozyCumulantRatio
public import Mathlib.Analysis.SpecialFunctions.Sqrt
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

@[expose] public section
namespace PomeranceSarkozy

open Filter
open scoped Topology

noncomputable def rareCumulantCubicScale (t : ℝ) : ℝ := (Real.sqrt (2*t))^3/3

private theorem rareCumulantCubicScale_hasDerivAt (t : ℝ) (ht : 0<t) :
    HasDerivAt rareCumulantCubicScale (Real.sqrt (2*t)) t := by
  have hR : 0<Real.sqrt (2*t) := Real.sqrt_pos.mpr (by positivity)
  have hArg : HasDerivAt (fun t : ℝ=>2*t) 2 t := by
    simpa only [mul_one,id_eq] using (hasDerivAt_id t).const_mul (2:ℝ)
  have hSqrt := hArg.sqrt (by positivity : (2:ℝ)*t≠0)
  have hp := (hSqrt.pow 3).div_const (3:ℝ)
  convert hp using 1
  · rfl
  · norm_num only [Nat.cast_ofNat, Nat.reduceSub]
    field_simp [hR.ne']

private theorem rareCumulantCubicScale_tendsto_atTop :
    Tendsto rareCumulantCubicScale atTop atTop := by
  have hS : Tendsto (fun t : ℝ=>Real.sqrt (2*t)) atTop atTop := by
    simp_rw [Real.sqrt_eq_rpow]
    exact (tendsto_rpow_atTop (by norm_num : (0:ℝ)<1/2)).comp
      (tendsto_id.const_mul_atTop (by norm_num : (0:ℝ)<2))
  exact ((tendsto_pow_atTop (n:=3) (by norm_num)).comp hS).atTop_div_const (by norm_num)

theorem gaussianRareCumulant_over_cubic_sqrt_tendsto :
    Tendsto (fun t : ℝ=>gaussianRareCumulant t/rareCumulantCubicScale t) atTop (𝓝 1) := by
  apply real_ratio_tendsto_of_derivative_ratio gaussianRareCumulant rareCumulantCubicScale
    gaussianRareCumulantSlope (fun t=>Real.sqrt (2*t)) 0 1
  · intro t _
    exact (gaussianRareCumulant_hasDerivAt t).2
  · exact rareCumulantCubicScale_hasDerivAt
  · intro t ht
    exact Real.sqrt_pos.mpr (by positivity)
  · exact rareCumulantCubicScale_tendsto_atTop
  · exact gaussianRareCumulantSlope_over_sqrt_tendsto

private theorem gaussianRareTilt_tendsto_atTop :
    Tendsto gaussianRareTilt atTop atTop := by
  apply tendsto_atTop.2
  intro R
  filter_upwards [eventually_ge_atTop (gaussianRareCumulantSlope R)] with x hx
  apply gaussianRareCumulantSlope_strictMono.le_iff_le.mp
  rwa [gaussianRareTilt_apply]

/-- For positive displacements tending to infinity, the exact
Legendre rate divided by x³ tends to 1/6. -/
theorem gaussianRareRate_cubic_pos_tendsto :
    Tendsto (fun x : ℝ=>gaussianRareRate x/x^3) atTop (𝓝 (1/6)) := by
  let t := gaussianRareTilt
  let r (x : ℝ) := Real.sqrt (2*t x)
  let h (x : ℝ) := x/r x
  let k (x : ℝ) := gaussianRareCumulant (t x)/rareCumulantCubicScale (t x)
  have hH : Tendsto h atTop (𝓝 1) := by
    have hRaw := gaussianRareCumulantSlope_over_sqrt_tendsto.comp gaussianRareTilt_tendsto_atTop
    change Tendsto (fun x=>gaussianRareCumulantSlope (gaussianRareTilt x) /
      Real.sqrt (2*gaussianRareTilt x)) atTop (𝓝 1) at hRaw
    simpa only [h,r,t,gaussianRareTilt_apply] using hRaw
  have hK : Tendsto k atTop (𝓝 1) :=
    gaussianRareCumulant_over_cubic_sqrt_tendsto.comp gaussianRareTilt_tendsto_atTop
  have hD : Tendsto (fun x=>(1/2:ℝ)/(h x)^2-k x/(3*(h x)^3)) atTop (𝓝 (1/6)) := by
    have h1 : Tendsto (fun x=>(1/2:ℝ)/(h x)^2) atTop (𝓝 ((1/2:ℝ)/(1:ℝ)^2)) :=
      tendsto_const_nhds.div (hH.pow 2) (by norm_num)
    have h2 := hK.div ((hH.pow 3).const_mul (3:ℝ)) (by norm_num)
    convert h1.sub h2 using 1
    norm_num
  refine hD.congr' ?_
  filter_upwards [eventually_gt_atTop (0:ℝ),gaussianRareTilt_tendsto_atTop.eventually_gt_atTop (0:ℝ)] with x hx ht
  have hr : 0<r x := Real.sqrt_pos.mpr (by positivity)
  have hSq : (r x)^2=2*t x := Real.sq_sqrt (by positivity)
  rw [gaussianRareRate_eq_at_tilt x (t x) (gaussianRareTilt_apply x)]
  unfold h k rareCumulantCubicScale
  change (1/2:ℝ)/(x/r x)^2-(gaussianRareCumulant (t x)/((r x)^3/3))/(3*(x/r x)^3)=_
  rw [show t x=(r x)^2/2 from by linarith]
  field_simp [hx.ne',hr.ne']

/-- The negative-displacement coefficient is the same by exact
symmetry. This does not assert a growing-displacement arithmetic LDP. -/
theorem gaussianRareRate_cubic_neg_tendsto :
    Tendsto (fun x : ℝ=>gaussianRareRate x/|x|^3) atBot (𝓝 (1/6)) := by
  refine (gaussianRareRate_cubic_pos_tendsto.comp tendsto_neg_atBot_atTop).congr' ?_
  filter_upwards [eventually_le_atBot (0:ℝ)] with x hx
  simp only [Function.comp_apply,gaussianRareRate_even,abs_of_nonpos hx]

end PomeranceSarkozy
