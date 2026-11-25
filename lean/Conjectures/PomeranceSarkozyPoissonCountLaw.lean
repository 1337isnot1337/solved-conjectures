module
public import Conjectures.PomeranceSarkozyMatrixComparison
public import Conjectures.PomeranceSarkozyMeasurePush

@[expose] public section
namespace PomeranceSarkozy

open MeasureTheory ProbabilityTheory
open scoped NNReal ENNReal BigOperators

variable {J K : Type*} [Fintype J] [Fintype K]

theorem poisson_matrix_real_singleton (b : J→ℝ≥0) (x : K→J→ℕ) :
    (poissonMatrixMeasure b).real {x} =
      realMatrixMass (fun j => poissonNatMass (b j)) x := by
  rw [measureReal_def,poissonMatrixMeasure_singleton]
  unfold realMatrixMass
  simp_rw [ENNReal.toReal_prod,ENNReal.toReal_ofReal (poissonNatMass_nonneg _ _)]

theorem poisson_count_push_eq_joint_law (b : J→ℝ≥0) (x : K→ℕ) :
    atomicPush sumMatrix (realMatrixMass (fun j => poissonNatMass (b j))) x =
      (Measure.pi (fun _ : K => poissonMeasure (∑ j,b j))).real {x} := by
  let p (j : J) := poissonNatMass (b j)
  have hpos (a : K→J→ℕ) : 0≤realMatrixMass p a := by
    unfold realMatrixMass
    exact Finset.prod_nonneg fun _ _ => Finset.prod_nonneg fun _ _ => poissonNatMass_nonneg _ _
  have hmass := realMatrixMass_atomicMass (K:=K) p (fun j => poissonNatMass_nonneg (b j))
    (fun j => poissonNatMass_atomicMass (b j))
  have hs := atomicMass_summable_of_ne_top hpos (by rw [hmass]; simp)
  have hm : (fun y : K→J→ℕ => (poissonMatrixMeasure b).real {y})=realMatrixMass p :=
    funext (poisson_matrix_real_singleton b)
  have hX : Measurable (sumMatrix (K:=K) (J:=J)) := by unfold sumMatrix; fun_prop
  have he := atomicPush_eq_measure_map_real (poissonMatrixMeasure (K:=K) b) sumMatrix hX
    (by rw [hm]; exact hs) x
  have hmap : (poissonMatrixMeasure (K:=K) b).map sumMatrix =
      Measure.pi (fun _ : K => poissonMeasure (∑ j,b j)) :=
    (poisson_column_sums_hasLaw (K:=K) b).map_eq
  rw [hm,hmap] at he
  exact he

/-- The Bernoulli offset sum law compared to the actual independent
Poisson count vector on the full, untruncated natural-number support. -/
theorem bernoulli_to_joint_poisson_counts_le (b : J→ℝ≥0) (hb : ∀ j,(b j:ℝ)≤1) :
    atomicL1 (atomicPush (sumMatrix (K:=K)) (realMatrixMass (fun j => bernoulliNatMass (b j:ℝ))))
      (fun x : K→ℕ => (Measure.pi (fun _ : K => poissonMeasure (∑ j,b j))).real {x})
      ≤ ∑ _k : K,∑ j,ENNReal.ofReal (2*(b j:ℝ)^2) := by
  rw [← funext (poisson_count_push_eq_joint_law b)]
  exact bernoulli_poisson_offset_sums_le b hb

end PomeranceSarkozy
