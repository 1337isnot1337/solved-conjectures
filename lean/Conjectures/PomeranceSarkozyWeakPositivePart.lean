module
public import Conjectures.PomeranceSarkozyWeakAbsoluteMoment
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

@[expose] public section
namespace PomeranceSarkozy

open Filter MeasureTheory
open scoped Topology

def shiftedPositivePart (a x : ℝ) : ℝ := max (x-a) 0

theorem shiftedPositivePart_nonneg (a x : ℝ) : 0≤shiftedPositivePart a x :=
  le_max_right _ _

private theorem shiftedPositivePart_sq_le (a x : ℝ) :
    (shiftedPositivePart a x)^2≤2*x^2+2*a^2 := by
  unfold shiftedPositivePart
  by_cases h : 0≤x-a
  · rw [max_eq_left h]
    nlinarith [sq_nonneg (x+a)]
  · rw [max_eq_right (le_of_not_ge h),zero_pow (by norm_num : (2:ℕ)≠0)]
    positivity

private theorem shiftedPositivePart_sq_integrable (a : ℝ) (μ : ProbabilityMeasure ℝ)
    (hμ : Integrable (fun x : ℝ=>x^2) (μ:Measure ℝ)) :
    Integrable (fun x=>(shiftedPositivePart a x)^2) (μ:Measure ℝ) := by
  have hu : Integrable (fun x : ℝ=>2*x^2+2*a^2) (μ:Measure ℝ) :=
    (hμ.const_mul 2).add (integrable_const _)
  refine hu.mono' (by unfold shiftedPositivePart; fun_prop) (Eventually.of_forall (fun x=>?_))
  rw [Real.norm_of_nonneg (sq_nonneg _)]
  exact shiftedPositivePart_sq_le a x

private theorem shiftedPositivePart_sq_integral_le (a : ℝ) (μ : ProbabilityMeasure ℝ)
    (hμ : Integrable (fun x : ℝ=>x^2) (μ:Measure ℝ)) (C : ℝ)
    (hC : (∫ x : ℝ,x^2 ∂(μ:Measure ℝ))≤C) :
    (∫ x,(shiftedPositivePart a x)^2 ∂(μ:Measure ℝ))≤2*C+2*a^2 := by
  have hu : Integrable (fun x : ℝ=>2*x^2+2*a^2) (μ:Measure ℝ) :=
    (hμ.const_mul 2).add (integrable_const _)
  refine (integral_mono (shiftedPositivePart_sq_integrable a μ hμ) hu
    (shiftedPositivePart_sq_le a)).trans ?_
  rw [integral_add (hμ.const_mul 2) (integrable_const _),integral_const_mul,
    integral_const,probReal_univ,one_smul]
  linarith

/-- A fixed shifted positive part has convergent expectations under
weak convergence and a uniform second-moment bound. -/
theorem weak_shiftedPositivePart_tendsto {μ : ℕ→ProbabilityMeasure ℝ}
    {ν : ProbabilityMeasure ℝ} (h : Tendsto μ atTop (𝓝 ν))
    (C : ℝ) (hC : 0≤C)
    (hν : Integrable (fun x : ℝ=>x^2) (ν:Measure ℝ))
    (hνC : (∫ x : ℝ,x^2 ∂(ν:Measure ℝ))≤C)
    (hμ : ∀ᶠ n : ℕ in atTop,
      Integrable (fun x : ℝ=>x^2) (μ n:Measure ℝ) ∧
      (∫ x : ℝ,x^2 ∂(μ n:Measure ℝ))≤C) (a : ℝ) :
    Tendsto (fun n=>∫ x,shiftedPositivePart a x ∂(μ n:Measure ℝ))
      atTop (𝓝 (∫ x,shiftedPositivePart a x ∂(ν:Measure ℝ))) := by
  let f := shiftedPositivePart a
  have hf : Continuous f := by unfold f shiftedPositivePart; fun_prop
  have hp (ρ : ProbabilityMeasure ℝ) (hi : Integrable (fun x : ℝ=>x^2) (ρ:Measure ℝ))
      (hB : (∫ x : ℝ,x^2 ∂(ρ:Measure ℝ))≤C) :
      Integrable (fun x : ℝ=>x^2) (ρ.map f:Measure ℝ) ∧
        (∫ x : ℝ,x^2 ∂(ρ.map f:Measure ℝ))≤2*C+2*a^2 := by
    change Integrable (fun x : ℝ=>x^2) ((ρ:Measure ℝ).map f) ∧ _
    constructor
    · rw [integrable_map_measure (by fun_prop) hf.measurable.aemeasurable]
      exact shiftedPositivePart_sq_integrable a ρ hi
    · change (∫ x : ℝ,x^2 ∂((ρ:Measure ℝ).map f))≤_
      rw [integral_map hf.measurable.aemeasurable (by fun_prop)]
      exact shiftedPositivePart_sq_integral_le a ρ hi C hB
  have hm (ρ : ProbabilityMeasure ℝ) :
      (∫ x : ℝ,|x| ∂(ρ.map f:Measure ℝ))=∫ x,f x ∂(ρ:Measure ℝ) := by
    change (∫ x : ℝ,|x| ∂((ρ:Measure ℝ).map f))=_
    rw [integral_map hf.measurable.aemeasurable (by fun_prop)]
    have hnon (x : ℝ) : |f x|=f x := abs_of_nonneg (shiftedPositivePart_nonneg a x)
    simp_rw [hnon]
  have ht := weak_absolute_moment_tendsto
    (ProbabilityMeasure.tendsto_map_of_tendsto_of_continuous μ ν h hf)
    (2*C+2*a^2) (by positivity) (hp ν hν hνC).1 (hp ν hν hνC).2
    (hμ.mono (fun n hn=>hp (μ n) hn.1 hn.2))
  simp_rw [hm] at ht
  exact ht

theorem shiftedPositivePart_shift_lipschitz (a b x : ℝ) :
    |shiftedPositivePart a x-shiftedPositivePart b x|≤|a-b| := by
  unfold shiftedPositivePart
  by_cases ha : 0≤x-a <;> by_cases hb : 0≤x-b
  · rw [max_eq_left ha,max_eq_left hb,show x-a-(x-b)=b-a by ring,abs_sub_comm]
  · rw [max_eq_left ha,max_eq_right (le_of_not_ge hb),sub_zero,abs_of_nonneg ha]
    linarith [neg_le_abs (a-b)]
  · rw [max_eq_right (le_of_not_ge ha),max_eq_left hb,zero_sub,abs_neg,abs_of_nonneg hb]
    linarith [le_abs_self (a-b)]
  · rw [max_eq_right (le_of_not_ge ha),max_eq_right (le_of_not_ge hb),sub_self,abs_zero]
    exact abs_nonneg _

theorem shiftedPositivePart_integrable (a : ℝ) (μ : ProbabilityMeasure ℝ)
    (hμ : Integrable (fun x : ℝ=>x^2) (μ:Measure ℝ)) :
    Integrable (shiftedPositivePart a) (μ:Measure ℝ) := by
  have hi := hμ.add (integrable_const (1+|a|))
  refine hi.mono' (by unfold shiftedPositivePart; fun_prop) (Eventually.of_forall (fun x=>?_))
  rw [Real.norm_of_nonneg (shiftedPositivePart_nonneg a x)]
  change shiftedPositivePart a x≤x^2+(1+|a|)
  have hx : |x|≤x^2+1 := by
    have h := sq_nonneg (|x|-1/2)
    rw [sub_sq,sq_abs] at h
    linarith
  unfold shiftedPositivePart
  exact max_le (by linarith [le_abs_self x,neg_le_abs a]) (by positivity)

theorem shiftedPositivePart_integral_lipschitz (a b : ℝ) (μ : ProbabilityMeasure ℝ)
    (hμ : Integrable (fun x : ℝ=>x^2) (μ:Measure ℝ)) :
    |(∫ x,shiftedPositivePart a x ∂(μ:Measure ℝ))-
      (∫ x,shiftedPositivePart b x ∂(μ:Measure ℝ))|≤|a-b| := by
  have ha := shiftedPositivePart_integrable a μ hμ
  have hb := shiftedPositivePart_integrable b μ hμ
  rw [← integral_sub ha hb]
  have h := norm_integral_le_integral_norm (μ:=(μ:Measure ℝ))
    (fun x=>shiftedPositivePart a x-shiftedPositivePart b x)
  simp only [Real.norm_eq_abs] at h
  refine h.trans ?_
  have hi : Integrable (fun x=>|shiftedPositivePart a x-shiftedPositivePart b x|) (μ:Measure ℝ) := by
    simpa only [Real.norm_eq_abs,Pi.sub_apply] using (ha.sub hb).norm
  have hl := integral_mono hi (integrable_const |a-b|) (shiftedPositivePart_shift_lipschitz a b)
  simpa only [integral_const,probReal_univ,one_smul] using hl

/-- Weak convergence plus bounded second moments also handles a shift
which itself converges. This is the exact kernel limit needed for
mesoscopic covariance, rather than a separate normal approximation. -/
theorem weak_movingPositivePart_tendsto {μ : ℕ→ProbabilityMeasure ℝ}
    {ν : ProbabilityMeasure ℝ} (h : Tendsto μ atTop (𝓝 ν))
    (C : ℝ) (hC : 0≤C)
    (hν : Integrable (fun x : ℝ=>x^2) (ν:Measure ℝ))
    (hνC : (∫ x : ℝ,x^2 ∂(ν:Measure ℝ))≤C)
    (hμ : ∀ᶠ n : ℕ in atTop,
      Integrable (fun x : ℝ=>x^2) (μ n:Measure ℝ) ∧
      (∫ x : ℝ,x^2 ∂(μ n:Measure ℝ))≤C) {a : ℝ}
    (z : ℕ→ℝ) (hz : Tendsto z atTop (𝓝 a)) :
    Tendsto (fun n=>∫ x,shiftedPositivePart (z n) x ∂(μ n:Measure ℝ))
      atTop (𝓝 (∫ x,shiftedPositivePart a x ∂(ν:Measure ℝ))) := by
  let F (n : ℕ) := ∫ x,shiftedPositivePart (z n) x ∂(μ n:Measure ℝ)
  let G (n : ℕ) := ∫ x,shiftedPositivePart a x ∂(μ n:Measure ℝ)
  have hG : Tendsto G atTop (𝓝 (∫ x,shiftedPositivePart a x ∂(ν:Measure ℝ))) :=
    weak_shiftedPositivePart_tendsto h C hC hν hνC hμ a
  have hDiff : Tendsto (fun n=>F n-G n) atTop (𝓝 0) := by
    apply tendsto_iff_dist_tendsto_zero.mpr
    simp only [Real.dist_eq,sub_zero]
    have ht := tendsto_iff_dist_tendsto_zero.mp hz
    simp only [Real.dist_eq] at ht
    refine squeeze_zero' (Eventually.of_forall (fun _=>abs_nonneg _)) ?_ ht
    exact hμ.mono (fun n hn=>shiftedPositivePart_integral_lipschitz (z n) a (μ n) hn.1)
  simpa only [sub_add_cancel,zero_add] using hDiff.add hG

end PomeranceSarkozy
