module
public import Mathlib.Probability.Distributions.Poisson.Basic
public import Mathlib.Probability.Independence.CharacteristicFunction
public import Mathlib.Analysis.SpecialFunctions.Trigonometric.Deriv
public import Mathlib.Probability.Distributions.Gaussian.Real
public import Mathlib.MeasureTheory.Measure.LevyConvergence
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Ring

@[expose] public section
namespace PomeranceSarkozy

open Filter MeasureTheory ProbabilityTheory
open scoped NNReal Topology ProbabilityTheory

/-- The actual product of the two Poisson draws, pushed forward
by their real difference. -/
noncomputable def poissonDifferenceLaw (b : ℝ≥0) : Measure ℝ :=
  (Po(ℝ,b).prod Po(ℝ,b)).map (fun x : ℝ×ℝ => x.1-x.2)

theorem poissonDifferenceLaw_isProbabilityMeasure (b : ℝ≥0) :
    IsProbabilityMeasure (poissonDifferenceLaw b) := by
  unfold poissonDifferenceLaw
  exact (Measure.isProbabilityMeasure_map_iff (by fun_prop)).2 inferInstance

theorem charFun_poissonDifferenceLaw (b : ℝ≥0) (t : ℝ) :
    charFun (poissonDifferenceLaw b) t=
      Complex.exp (↑(2*(b:ℝ)*(Real.cos t-1)) : ℂ) := by
  let μ := Po(ℝ,b)
  let μp := μ.prod μ
  let A (x : ℝ×ℝ) := x.1
  let B (x : ℝ×ℝ) := -x.2
  have hAB : A ⟂ᵢ[μp] B := indepFun_prod measurable_id (by fun_prop)
  have hA : μp.map A=μ := measurePreserving_fst.map_eq
  have hB : μp.map B=μ.map ((-1:ℝ)*·) := by
    have hm : MeasurePreserving (Prod.snd : ℝ×ℝ→ℝ) μp μ := measurePreserving_snd
    change μp.map (fun x : ℝ×ℝ => -x.2)=_
    simp_rw [← neg_one_mul (Prod.snd _)]
    rw [show (fun x : ℝ×ℝ => (-1:ℝ)*x.2)=((-1:ℝ)*·)∘Prod.snd from rfl,
      ← Measure.map_map (by fun_prop) measurable_snd,hm.map_eq]
  unfold poissonDifferenceLaw
  change charFun (μp.map (fun x => A x+B x)) t=_
  rw [hAB.charFun_map_fun_add_eq_mul (by fun_prop) (by fun_prop),Pi.mul_apply,hA,hB,charFun_map_mul]
  simp only [μ,neg_one_mul,charFun_map_cast_poissonMeasure,← Complex.exp_add]
  congr 1
  push_cast
  have hc := Complex.two_cos (t:ℂ)
  rw [← Complex.ofReal_cos] at hc
  rw [← Complex.ofReal_cos]
  calc
    _ = (b:ℂ)*(Complex.exp ((t:ℂ)*Complex.I)+Complex.exp (-(t:ℂ)*Complex.I)-2) := by ring
    _ = _ := by rw [← hc]; ring

/-- On the natural square-root scale, the Poisson difference
characteristic functions converge to those of variance two. -/
theorem poissonDifference_charFun_tendsto (b : ℕ→ℝ≥0)
    (hb : Tendsto (fun n => (b n:ℝ)) atTop atTop) (t : ℝ) :
    Tendsto (fun n => charFun ((poissonDifferenceLaw (b n)).map
      (fun x => (Real.sqrt (b n:ℝ))⁻¹*x)) t) atTop
      (𝓝 (Complex.exp (↑(-t^2):ℂ))) := by
  simp_rw [charFun_map_mul,charFun_poissonDifferenceLaw]
  have hs : Tendsto (fun n => Real.sqrt (b n:ℝ)) atTop atTop := by
    simp_rw [Real.sqrt_eq_rpow]
    exact (tendsto_rpow_atTop (by norm_num : (0:ℝ)<1/2)).comp hb
  by_cases ht : t=0
  · subst t
    simp
  let u (n : ℕ) := (Real.sqrt (b n:ℝ))⁻¹*t/2
  have hu : Tendsto u atTop (𝓝 0) := by
    unfold u
    simpa only [zero_mul,zero_div,Function.comp_apply] using
      ((tendsto_inv_atTop_zero.comp hs).mul_const t).div_const 2
  have hun : Tendsto u atTop (𝓝[≠] 0) := by
    rw [nhdsWithin]
    refine tendsto_inf.2 ⟨hu,?_⟩
    rw [tendsto_principal]
    filter_upwards [hb.eventually_gt_atTop (0:ℝ)] with n hn
    change u n≠0
    unfold u
    exact div_ne_zero (mul_ne_zero (inv_ne_zero (Real.sqrt_ne_zero'.mpr hn)) ht) (by norm_num)
  have hr := Real.tendsto_sin_div_nhdsNE_zero.comp hun
  have hlim : Tendsto (fun n => -t^2*(Real.sin (u n)/u n)^2) atTop (𝓝 (-t^2)) := by
    simpa only [one_pow,mul_one,Function.comp_apply] using (hr.pow 2).const_mul (-t^2)
  have hlim' : Tendsto (fun n => 2*(b n:ℝ)*(Real.cos ((Real.sqrt (b n:ℝ))⁻¹*t)-1))
      atTop (𝓝 (-t^2)) := by
    refine hlim.congr' ?_
    filter_upwards [hb.eventually_gt_atTop (0:ℝ)] with n hn
    let s := Real.sqrt (b n:ℝ)
    have hsne : s≠0 := (Real.sqrt_pos.mpr hn).ne'
    have hsq : s^2=(b n:ℝ) := Real.sq_sqrt hn.le
    have harg : (Real.sqrt (b n:ℝ))⁻¹*t=2*u n := by unfold u; ring
    rw [harg,Real.cos_two_mul_eq_one_sub,← hsq]
    change -t^2*(Real.sin (u n)/(s⁻¹*t/2))^2=_
    field_simp
    ring
  exact (Complex.continuous_exp.tendsto _).comp ((Complex.continuous_ofReal.tendsto _).comp hlim')

noncomputable def normalizedPoissonDifference (b : ℝ≥0) : ProbabilityMeasure ℝ :=
  letI := poissonDifferenceLaw_isProbabilityMeasure b
  ⟨(poissonDifferenceLaw b).map (fun x => (Real.sqrt (b:ℝ))⁻¹*x),
    (Measure.isProbabilityMeasure_map_iff (by fun_prop)).2 inferInstance⟩

/-- The exact normalized difference converges weakly to N(0,2). -/
theorem normalizedPoissonDifference_tendsto (b : ℕ→ℝ≥0)
    (hb : Tendsto (fun n => (b n:ℝ)) atTop atTop) :
    Tendsto (fun n => normalizedPoissonDifference (b n)) atTop
      (𝓝 (⟨gaussianReal 0 2,inferInstance⟩ : ProbabilityMeasure ℝ)) := by
  refine ProbabilityMeasure.tendsto_iff_tendsto_charFun.2 (fun t => ?_)
  change Tendsto (fun n => charFun ((poissonDifferenceLaw (b n)).map
    (fun x => (Real.sqrt (b n:ℝ))⁻¹*x)) t) atTop (𝓝 (charFun (gaussianReal 0 2) t))
  convert poissonDifference_charFun_tendsto b hb t using 2
  rw [charFun_gaussianReal]
  push_cast
  ring

end PomeranceSarkozy
