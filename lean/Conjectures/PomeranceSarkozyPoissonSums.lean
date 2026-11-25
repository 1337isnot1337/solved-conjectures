module
public import Mathlib

@[expose] public section
namespace PomeranceSarkozy

open MeasureTheory ProbabilityTheory
open scoped NNReal BigOperators

theorem poissonMeasure_zero_eq_dirac : poissonMeasure 0=Measure.dirac (0:ℕ) := by
  apply Measure.ext_of_singleton
  intro k
  cases k <;> simp [poissonMeasure_singleton,Measure.dirac_apply',Set.mem_singleton_iff]

/-- A sum over any finite family of independent Poisson coordinates
is Poisson with the sum of the rates. -/
theorem poisson_finsetSum_hasLaw {ι Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsProbabilityMeasure μ] (X : ι→Ω→ℕ) (b : ι→ℝ≥0)
    (hX : ∀ i,Measurable (X i)) (hLaw : ∀ i,HasLaw (X i) (poissonMeasure (b i)) μ)
    (hInd : iIndepFun X μ) (S : Finset ι) :
    HasLaw (∑ i ∈ S,X i) (poissonMeasure (∑ i ∈ S,b i)) μ := by
  classical
  induction S using Finset.induction_on with
  | empty =>
    simp only [Finset.sum_empty,poissonMeasure_zero_eq_dirac]
    apply hasLaw_dirac_of_ae_eq
    exact Filter.Eventually.of_forall fun _ => rfl
  | @insert i S hi ih =>
    rw [Finset.sum_insert hi,Finset.sum_insert hi]
    exact (hInd.indepFun_finsetSum_of_notMem hX hi).symm.hasLaw_add_poissonMeasure (hLaw i) ih

end PomeranceSarkozy
