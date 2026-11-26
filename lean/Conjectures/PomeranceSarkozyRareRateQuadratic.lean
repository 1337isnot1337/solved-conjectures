module
public import Conjectures.PomeranceSarkozyRareRateProperties
public import Mathlib.Analysis.Calculus.Deriv.Inverse
public import Mathlib.Analysis.Calculus.Deriv.Slope
public import Mathlib.Topology.Order.MonotoneContinuity
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Ring

@[expose] public section
namespace PomeranceSarkozy

open Filter Set
open scoped Topology

noncomputable def gaussianRareTilt (x : ℝ) : ℝ :=
  Classical.choose (exists_unique_gaussianRareCumulant_tilt x)

theorem gaussianRareTilt_apply (x : ℝ) :
    gaussianRareCumulantSlope (gaussianRareTilt x)=x :=
  (Classical.choose_spec (exists_unique_gaussianRareCumulant_tilt x)).1

theorem gaussianRareTilt_slope (t : ℝ) :
    gaussianRareTilt (gaussianRareCumulantSlope t)=t :=
  gaussianRareCumulantSlope_strictMono.injective (gaussianRareTilt_apply _)

theorem gaussianRareTilt_zero : gaussianRareTilt 0=0 :=
  gaussianRareCumulantSlope_strictMono.injective ((gaussianRareTilt_apply 0).trans gaussianRareCumulantSlope_zero.symm)

theorem continuous_gaussianRareTilt : Continuous gaussianRareTilt := by
  apply Monotone.continuous_of_surjective
  · intro x y hxy
    exact gaussianRareCumulantSlope_strictMono.le_iff_le.mp (by
      rw [gaussianRareTilt_apply,gaussianRareTilt_apply]; exact hxy)
  · exact fun t=>⟨gaussianRareCumulantSlope t,gaussianRareTilt_slope t⟩

theorem gaussianRareTilt_zero_deriv : HasDerivAt gaussianRareTilt (Real.sqrt Real.pi) 0 := by
  have hs : 0<Real.sqrt Real.pi := Real.sqrt_pos.mpr Real.pi_pos
  have hd : HasDerivAt gaussianRareCumulantSlope (1/Real.sqrt Real.pi) (gaussianRareTilt 0) := by
    rw [gaussianRareTilt_zero]
    exact gaussianRareCumulantSlope_zero_deriv
  have h := HasDerivAt.of_local_left_inverse continuous_gaussianRareTilt.continuousAt hd
    (one_div_ne_zero hs.ne') (Filter.Eventually.of_forall gaussianRareTilt_apply)
  simpa only [one_div,inv_inv] using h

private theorem gaussianRareTilt_over_argument_tendsto :
    Tendsto (fun x=>gaussianRareTilt x/x) (𝓝[≠] (0:ℝ)) (𝓝 (Real.sqrt Real.pi)) := by
  have h := gaussianRareTilt_zero_deriv.tendsto_slope_zero
  simpa only [zero_add,sub_zero,gaussianRareTilt_zero,smul_eq_mul,div_eq_mul_inv,mul_comm] using h

private theorem gaussianRareCumulant_over_sq_tendsto :
    Tendsto (fun t=>gaussianRareCumulant t/t^2) (𝓝[≠] (0:ℝ)) (𝓝 ((1/Real.sqrt Real.pi)/2)) := by
  let α := 1/Real.sqrt Real.pi
  let f (t : ℝ) := Real.exp (3*|t|)*|t| * α/6
  have hF : Continuous f := by unfold f; fun_prop
  have hZ : f 0=0 := by unfold f; simp
  have h : Tendsto f (𝓝 (0:ℝ)) (𝓝 (f 0)) := hF.continuousAt
  rw [hZ] at h
  apply tendsto_iff_norm_sub_tendsto_zero.mpr
  refine squeeze_zero' (Filter.Eventually.of_forall (fun _=>norm_nonneg _)) ?_ (h.mono_left nhdsWithin_le_nhds)
  filter_upwards [self_mem_nhdsWithin] with t ht
  have ht' : t≠0 := ht
  have hPos := sq_pos_of_ne_zero ht'
  have hE := gaussianRareCumulant_quadratic_error t
  change |gaussianRareCumulant t-α*t^2/2|≤_ at hE
  have hS : |t|^2=t^2 := sq_abs _
  have hA : gaussianRareCumulant t/t^2-α/2=(gaussianRareCumulant t-α*t^2/2)/t^2 := by
    rw [sub_div]
    field_simp
  rw [Real.norm_eq_abs,hA,abs_div,abs_of_pos hPos]
  refine (div_le_div_of_nonneg_right hE hPos.le).trans_eq ?_
  unfold f α
  rw [← hS,show |t|^3=|t| * |t|^2 by ring]
  have hT : |t|≠0 := abs_ne_zero.mpr ht'
  field_simp

/-- The exact small-displacement asymptotic of the Legendre rate,
including the written coefficient sqrt(pi)/2. -/
theorem gaussianRareRate_quadratic_tendsto :
    Tendsto (fun x=>gaussianRareRate x/x^2) (𝓝[≠] (0:ℝ)) (𝓝 (Real.sqrt Real.pi/2)) := by
  have hθ : Tendsto gaussianRareTilt (𝓝[≠] (0:ℝ)) (𝓝[≠] 0) := by
    apply tendsto_nhdsWithin_iff.2
    refine ⟨?_,?_⟩
    · have hz : Tendsto gaussianRareTilt (𝓝 (0:ℝ)) (𝓝 (gaussianRareTilt 0)) :=
        continuous_gaussianRareTilt.continuousAt
      rw [gaussianRareTilt_zero] at hz
      exact hz.mono_left nhdsWithin_le_nhds
    · filter_upwards [self_mem_nhdsWithin] with x hx
      intro h
      have ht := gaussianRareTilt_apply x
      rw [h,gaussianRareCumulantSlope_zero] at ht
      exact hx ht.symm
  let a := Real.sqrt Real.pi
  have ha : 0<a := Real.sqrt_pos.mpr Real.pi_pos
  have hQ := gaussianRareTilt_over_argument_tendsto
  have hΛ := gaussianRareCumulant_over_sq_tendsto.comp hθ
  have h := hQ.sub (hΛ.mul (hQ.pow 2))
  rw [show a-((1/a)/2)*a^2=a/2 by field_simp; ring] at h
  refine h.congr' ?_
  filter_upwards [self_mem_nhdsWithin] with x hx
  have hx' : x≠0 := hx
  let q := gaussianRareTilt x
  have hq : q≠0 := by
    intro hz
    have he := gaussianRareTilt_apply x
    change gaussianRareCumulantSlope q=x at he
    rw [hz,gaussianRareCumulantSlope_zero] at he
    exact hx' he.symm
  change q/x-(gaussianRareCumulant q/q^2)*(q/x)^2=gaussianRareRate x/x^2
  rw [gaussianRareRate_eq_at_tilt x q (gaussianRareTilt_apply x)]
  field_simp

end PomeranceSarkozy
