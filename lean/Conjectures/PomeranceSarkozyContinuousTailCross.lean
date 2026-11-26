module
public import Mathlib.MeasureTheory.Measure.Lebesgue.Basic
public import Mathlib.MeasureTheory.Measure.Prod
public import Mathlib.MeasureTheory.Integral.Lebesgue.Basic
public import Mathlib.Analysis.SpecialFunctions.Pow.Real

@[expose] public section
namespace PomeranceSarkozy

open MeasureTheory Set
open scoped ENNReal

/-- Continuous counterpart of the shifted atom identity: the
tail-product kernel integrates to the positive difference minus a
fixed separation. The identity is valid before assuming Gaussianity. -/
theorem continuous_shifted_tail_cross (μ ν : Measure ℝ) [SFinite μ] [SFinite ν] (d : ℝ) :
    (∫⁻ s : ℝ,(μ (Set.Ioi (s+d)))*(ν (Set.Iic s))) =
      ∫⁻ z : ℝ×ℝ,ENNReal.ofReal (z.1-z.2-d) ∂(μ.prod ν) := by
  let A : Set (ℝ×(ℝ×ℝ)) := {p | p.2.2≤p.1 ∧ p.1+d<p.2.1}
  let f : ℝ×(ℝ×ℝ)→ℝ≥0∞ := A.indicator (fun _=>1)
  have hA : MeasurableSet A := by
    unfold A
    have h₀ : Measurable (fun p : ℝ×(ℝ×ℝ)=>p.2.2) := by fun_prop
    have h₁ : Measurable (fun p : ℝ×(ℝ×ℝ)=>p.1) := by fun_prop
    have h₂ : Measurable (fun p : ℝ×(ℝ×ℝ)=>p.1+d) := by fun_prop
    have h₃ : Measurable (fun p : ℝ×(ℝ×ℝ)=>p.2.1) := by fun_prop
    exact (measurableSet_le h₀ h₁).inter (measurableSet_lt h₂ h₃)
  have hf : Measurable f := measurable_const.indicator hA
  have h₁ (s : ℝ) : (∫⁻ z : ℝ×ℝ,f (s,z) ∂(μ.prod ν))=
      (μ (Set.Ioi (s+d)))*(ν (Set.Iic s)) := by
    have h : (fun z : ℝ×ℝ=>f (s,z))=((Set.Ioi (s+d))×ˢ(Set.Iic s)).indicator (fun _=>1) := by
      funext z
      unfold f A
      by_cases h₁ : z.2≤s <;> by_cases h₂ : s+d<z.1 <;>
        simp [h₁,h₂,Set.mem_prod]
    rw [h,lintegral_indicator (measurableSet_Ioi.prod measurableSet_Iic),lintegral_const,
      Measure.restrict_apply MeasurableSet.univ,Set.univ_inter,one_mul,Measure.prod_prod]
  have h₂ (z : ℝ×ℝ) : (∫⁻ s : ℝ,f (s,z))=ENNReal.ofReal (z.1-z.2-d) := by
    have h : (fun s : ℝ=>f (s,z))=(Set.Ico z.2 (z.1-d)).indicator (fun _=>1) := by
      funext s
      unfold f A
      have he : s+d<z.1 ↔ s<z.1-d := lt_sub_iff_add_lt.symm
      by_cases hz : z.2≤s <;> by_cases hs : s<z.1-d <;>
        simp [he,hz,hs,Set.mem_Ico]
    rw [h,lintegral_indicator measurableSet_Ico,lintegral_const,
      Measure.restrict_apply MeasurableSet.univ,Set.univ_inter,one_mul,Real.volume_Ico]
    congr 1
    ring
  calc
    _ = ∫⁻ s : ℝ,∫⁻ z : ℝ×ℝ,f (s,z) ∂(μ.prod ν) := by simp_rw [h₁]
    _ = ∫⁻ z : ℝ×ℝ,(∫⁻ s : ℝ,f (s,z) ∂volume) ∂(μ.prod ν) :=
      lintegral_lintegral_swap (f:=fun s z=>f (s,z)) (μ:=volume) (ν:=μ.prod ν) hf.aemeasurable
    _ = _ := by simp_rw [h₂]

end PomeranceSarkozy
