module
public import Conjectures.PomeranceSarkozyBoundedArray
public import Mathlib.Probability.Independence.CharacteristicFunction
public import Mathlib.Probability.Distributions.Gaussian.Real
public import Mathlib.MeasureTheory.Measure.LevyConvergence
import Mathlib.Tactic.Ring

@[expose] public section
namespace PomeranceSarkozy

open Filter MeasureTheory ProbabilityTheory
open scoped Topology NNReal BigOperators

noncomputable def independentArrayScaledLaw {Ω : ℕ → Type*}
    [∀ n,MeasurableSpace (Ω n)] {ι : ℕ → Type*} (S : (n : ℕ) → Finset (ι n))
    (P : (n : ℕ) → Measure (Ω n)) [∀ n,IsProbabilityMeasure (P n)]
    (X : (n : ℕ) → ι n → Ω n → ℝ) (hX : ∀ n i,Measurable (X n i))
    (a : ℕ → ℝ) (n : ℕ) : ProbabilityMeasure ℝ :=
  ⟨(P n).map (fun ω => (a n)⁻¹*(∑ i∈S n,X n i ω)),
    (Measure.isProbabilityMeasure_map_iff (by
      exact (Measurable.const_mul (Finset.measurable_sum _ (fun i _ => hX n i)) _).aemeasurable)).2 inferInstance⟩

/-- Distributional CLT for a centered, uniformly bounded independent
array on the actual row spaces. The variance may be zero. -/
theorem independent_bounded_array_law_tendsto {Ω : ℕ → Type*}
    [∀ n,MeasurableSpace (Ω n)] {ι : ℕ → Type*} (S : (n : ℕ) → Finset (ι n))
    (P : (n : ℕ) → Measure (Ω n)) [∀ n,IsProbabilityMeasure (P n)]
    (X : (n : ℕ) → ι n → Ω n → ℝ) (hX : ∀ n i,Measurable (X n i))
    (hInd : ∀ n,iIndepFun (X n) (P n))
    (M : ℝ) (hM : 0 ≤ M)
    (hBound : ∀ n i,i ∈ S n → ∀ᵐ ω ∂P n,|X n i ω| ≤ M)
    (hMean : ∀ n i,i ∈ S n → (∫ ω,X n i ω ∂P n) = 0)
    (a : ℕ → ℝ) (ha : Tendsto a atTop atTop) (v : ℝ≥0)
    (hv : Tendsto (fun n => (∑ i∈S n,∫ ω,X n i ω^2 ∂P n)/(a n)^2) atTop (𝓝 (v:ℝ))) :
    Tendsto (independentArrayScaledLaw S P X hX a) atTop
      (𝓝 (⟨gaussianReal 0 v,inferInstance⟩ : ProbabilityMeasure ℝ)) := by
  let σ (n : ℕ) (i : ι n) : ProbabilityMeasure ℝ :=
    ⟨(P n).map (X n i),(Measure.isProbabilityMeasure_map_iff (hX n i).aemeasurable).2 inferInstance⟩
  have hBound' (n : ℕ) (i : ι n) (hi : i∈S n) :
      ∀ᵐ x ∂(σ n i:Measure ℝ),|x| ≤ M := by
    change ∀ᵐ x ∂(P n).map (X n i), |x| ≤ M
    exact (ae_map_iff (hX n i).aemeasurable (measurableSet_le (by fun_prop) measurable_const)).mpr
      (hBound n i hi)
  have hMean' (n : ℕ) (i : ι n) (hi : i∈S n) :
      (∫ x : ℝ,x ∂(σ n i:Measure ℝ)) = 0 := by
    change (∫ x : ℝ,x ∂(P n).map (X n i)) = 0
    rw [integral_map (hX n i).aemeasurable (by fun_prop)]
    exact hMean n i hi
  have hVar (n : ℕ) (i : ι n) : (∫ x : ℝ,x^2 ∂(σ n i:Measure ℝ)) = ∫ ω,X n i ω^2 ∂P n := by
    change (∫ x : ℝ,x^2 ∂(P n).map (X n i)) = _
    rw [integral_map (hX n i).aemeasurable (by fun_prop)]
  have hv' : Tendsto (fun n => (∑ i∈S n,∫ x : ℝ,x^2 ∂(σ n i:Measure ℝ))/(a n)^2)
      atTop (𝓝 (v:ℝ)) := by simpa only [hVar] using hv
  apply ProbabilityMeasure.tendsto_iff_tendsto_charFun.mpr
  intro t
  have h := bounded_centered_array_charFun_tendsto S σ M hM hBound' hMean' a ha hv' t
  have hlim : charFun (gaussianReal 0 v) t = Complex.exp (↑(-(t^2*(v:ℝ)/2):ℝ):ℂ) := by
    rw [charFun_gaussianReal]
    congr 1
    push_cast
    ring
  change Tendsto (fun n => charFun (independentArrayScaledLaw S P X hX a n : Measure ℝ) t)
    atTop (𝓝 (charFun (gaussianReal 0 v) t))
  rw [hlim]
  refine h.congr (fun n => ?_)
  have hSum : Measurable (fun ω : Ω n => ∑ i∈S n,X n i ω) :=
    Finset.measurable_sum _ (fun i _ => hX n i)
  change _ = charFun ((P n).map (fun ω => (a n)⁻¹*(∑ i∈S n,X n i ω))) t
  rw [charFun_map_mul_comp hSum.aemeasurable,
    (hInd n).restrict (S n) |>.charFun_map_fun_finsetSum_eq_prod (fun i _ => (hX n i).aemeasurable)]
  rw [Finset.prod_apply,div_eq_inv_mul]
  rfl

end PomeranceSarkozy
