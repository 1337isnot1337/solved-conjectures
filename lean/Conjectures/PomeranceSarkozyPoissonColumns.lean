module
public import Conjectures.PomeranceSarkozyPoissonSums
public import Conjectures.PomeranceSarkozyPoissonTuple

@[expose] public section
namespace PomeranceSarkozy

open MeasureTheory ProbabilityTheory
open scoped NNReal BigOperators ENNReal

variable {J K : Type*} [Fintype J] [Fintype K]

noncomputable def poissonRowMeasure (b : J→ℝ≥0) : Measure (J→ℕ) :=
  Measure.pi (fun j => poissonMeasure (b j))

noncomputable instance (b : J→ℝ≥0) : IsProbabilityMeasure (poissonRowMeasure b) :=
  inferInstanceAs (IsProbabilityMeasure (Measure.pi (fun j => poissonMeasure (b j))))

noncomputable def poissonMatrixMeasure (b : J→ℝ≥0) : Measure (K→J→ℕ) :=
  Measure.pi (fun _ : K => poissonRowMeasure b)

noncomputable instance (b : J→ℝ≥0) : IsProbabilityMeasure (poissonMatrixMeasure (K:=K) b) :=
  inferInstanceAs (IsProbabilityMeasure (Measure.pi (fun _ : K => poissonRowMeasure b)))

/-- The genuine product measure has exactly the product of the Poisson
atomic masses, with one factor per offset and prime. -/
theorem poissonMatrixMeasure_singleton (b : J→ℝ≥0) (x : K→J→ℕ) :
    poissonMatrixMeasure b {x} =
      ∏ k,∏ j,ENNReal.ofReal (poissonNatMass (b j) (x k j)) := by
  unfold poissonMatrixMeasure poissonRowMeasure
  simp_rw [Measure.pi_singleton,poissonNatMass,poissonMeasure_real_singleton,poissonMeasure_singleton]

theorem poissonRow_sum_hasLaw (b : J→ℝ≥0) :
    HasLaw (fun x : J→ℕ => ∑ j,x j) (poissonMeasure (∑ j,b j)) (poissonRowMeasure b) := by
  have hcoord (j : J) : HasLaw (fun x : J→ℕ => x j) (poissonMeasure (b j)) (poissonRowMeasure b) :=
    (measurePreserving_eval (fun i => poissonMeasure (b i)) j).hasLaw
  have hind : iIndepFun (fun j (x : J→ℕ) => x j) (poissonRowMeasure b) :=
    iIndepFun_pi (X:=fun _ => id) (fun _ => measurable_id.aemeasurable)
  have h := poisson_finsetSum_hasLaw (μ:=poissonRowMeasure b) (fun j (x : J→ℕ) => x j) b
    (fun j => measurable_pi_apply j) hcoord hind Finset.univ
  have he : (∑ j : J,(fun x : J→ℕ => x j)) = fun x : J→ℕ => ∑ j,x j := by
    funext x
    simp only [Finset.sum_apply]
  rw [he] at h
  exact h

/-- Summing independently within each offset produces the exact joint
law of independent Poisson variables with the total rate. -/
theorem poisson_column_sums_hasLaw (b : J→ℝ≥0) :
    HasLaw (fun x : K→J→ℕ => fun k => ∑ j,x k j)
      (Measure.pi (fun _ : K => poissonMeasure (∑ j,b j))) (poissonMatrixMeasure b) := by
  let f (x : J→ℕ) := ∑ j,x j
  have hmeas : Measurable f := by unfold f; fun_prop
  have hX (k : K) : HasLaw (fun x : K→J→ℕ => f (x k))
      (poissonMeasure (∑ j,b j)) (poissonMatrixMeasure b) :=
    (poissonRow_sum_hasLaw b).comp (measurePreserving_eval (fun _ : K => poissonRowMeasure b) k).hasLaw
  have hind : iIndepFun (fun k (x : K→J→ℕ) => f (x k)) (poissonMatrixMeasure b) :=
    iIndepFun_pi (X:=fun _ => f) (fun _ => hmeas.aemeasurable)
  exact hind.hasLaw_pi hX

end PomeranceSarkozy
