module
public import Mathlib.MeasureTheory.Measure.ProbabilityMeasure
public import Mathlib.MeasureTheory.Integral.BoundedContinuousFunction
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

@[expose] public section
namespace PomeranceSarkozy

open Filter MeasureTheory
open scoped Topology BoundedContinuousFunction

private noncomputable def clippedAbs (M : ℝ) (hM : 0≤M) : ℝ →ᵇ ℝ :=
  BoundedContinuousFunction.mkOfBound
    ⟨fun x => min |x| M,continuous_abs.min continuous_const⟩ (2*M) (by
      intro x y
      rw [Real.dist_eq]
      have hx₀ : 0≤min |x| M := le_min (abs_nonneg _) hM
      have hy₀ : 0≤min |y| M := le_min (abs_nonneg _) hM
      have hx₁ : min |x| M≤M := min_le_right _ _
      have hy₁ : min |y| M≤M := min_le_right _ _
      change |min |x| M-min |y| M|≤2*M
      exact abs_le.mpr ⟨by linarith,by linarith⟩)

private theorem clippedAbs_error (μ : ProbabilityMeasure ℝ) (M : ℝ) (hM : 0<M)
    (h₂ : Integrable (fun x : ℝ=>x^2) (μ:Measure ℝ)) :
    |(∫ x : ℝ,|x| ∂(μ:Measure ℝ))-(∫ x,clippedAbs M hM.le x ∂(μ:Measure ℝ))|≤
      (∫ x : ℝ,x^2 ∂(μ:Measure ℝ))/M := by
  let f := clippedAbs M hM.le
  have hf : Integrable f (μ:Measure ℝ) := f.integrable (μ:Measure ℝ)
  have h₁ : Integrable (fun x : ℝ=>|x|) (μ:Measure ℝ) := by
    apply (h₂.add (integrable_const (1:ℝ))).mono' (by fun_prop)
    filter_upwards [] with x
    rw [Real.norm_of_nonneg (abs_nonneg _)]
    change |x|≤x^2+1
    have hx := sq_nonneg (|x| - 1/2)
    rw [sub_sq,sq_abs] at hx
    linarith
  have hdiff : 0≤(∫ x : ℝ,|x| ∂(μ:Measure ℝ))-(∫ x,f x ∂(μ:Measure ℝ)) := by
    apply sub_nonneg.mpr (integral_mono hf h₁ ?_)
    intro x
    exact min_le_left _ _
  change |(∫ x : ℝ,|x| ∂(μ:Measure ℝ))-(∫ x,f x ∂(μ:Measure ℝ))|≤_
  rw [abs_of_nonneg hdiff,← integral_sub h₁ hf,← integral_div]
  apply integral_mono (h₁.sub hf) (h₂.div_const M)
  intro x
  change |x|-min |x| M≤x^2/M
  by_cases h : |x|≤M
  · rw [min_eq_left h,sub_self]
    positivity
  · rw [min_eq_right (le_of_not_ge h)]
    have hh := mul_le_mul_of_nonneg_left (le_of_not_ge h) (abs_nonneg x)
    rw [← sq_abs x]
    apply (le_div_iff₀ hM).mpr
    nlinarith [sq_nonneg M]

/-- Bounded second moments upgrade weak convergence to convergence of
absolute first moments, by clipping and an explicit reciprocal tail bound. -/
theorem weak_absolute_moment_tendsto {μ : ℕ→ProbabilityMeasure ℝ} {ν : ProbabilityMeasure ℝ}
    (h : Tendsto μ atTop (𝓝 ν)) (C : ℝ) (hC : 0≤C)
    (hν : Integrable (fun x : ℝ=>x^2) (ν:Measure ℝ))
    (hνC : (∫ x : ℝ,x^2 ∂(ν:Measure ℝ))≤C)
    (hμ : ∀ᶠ n : ℕ in atTop,
      Integrable (fun x : ℝ=>x^2) (μ n:Measure ℝ) ∧
      (∫ x : ℝ,x^2 ∂(μ n:Measure ℝ))≤C) :
    Tendsto (fun n => ∫ x : ℝ,|x| ∂(μ n:Measure ℝ)) atTop
      (𝓝 (∫ x : ℝ,|x| ∂(ν:Measure ℝ))) := by
  apply Metric.tendsto_nhds.2
  intro ε hε
  let M := 1+8*(C+1)/ε
  have hM : 0<M := by dsimp [M]; positivity
  have ht : C/M<ε/4 := by
    apply (div_lt_iff₀ hM).mpr
    have hMe : (ε/4)*M=ε/4+2*(C+1) := by unfold M; field_simp; ring
    rw [hMe]
    linarith
  let f := clippedAbs M hM.le
  have hf := (ProbabilityMeasure.tendsto_iff_forall_integral_tendsto.mp h) f
  filter_upwards [hμ,(Metric.tendsto_nhds.1 hf) (ε/4) (by positivity)] with n hn hn'
  rw [Real.dist_eq] at hn' ⊢
  have h₁ := (clippedAbs_error (μ n) M hM hn.1).trans
    (div_le_div_of_nonneg_right hn.2 hM.le)
  have h₃ := (clippedAbs_error ν M hM hν).trans
    (div_le_div_of_nonneg_right hνC hM.le)
  have ha := abs_sub_le (∫ x : ℝ,|x| ∂(μ n:Measure ℝ)) (∫ x,f x ∂(μ n:Measure ℝ))
    (∫ x : ℝ,|x| ∂(ν:Measure ℝ))
  have hb := abs_sub_le (∫ x,f x ∂(μ n:Measure ℝ)) (∫ x,f x ∂(ν:Measure ℝ))
    (∫ x : ℝ,|x| ∂(ν:Measure ℝ))
  rw [abs_sub_comm (∫ x,f x ∂(ν:Measure ℝ)) (∫ x : ℝ,|x| ∂(ν:Measure ℝ))] at hb
  change |(∫ x : ℝ,|x| ∂(μ n:Measure ℝ))-(∫ x,f x ∂(μ n:Measure ℝ))|≤C/M at h₁
  change |(∫ x : ℝ,|x| ∂(ν:Measure ℝ))-(∫ x,f x ∂(ν:Measure ℝ))|≤C/M at h₃
  linarith

end PomeranceSarkozy
