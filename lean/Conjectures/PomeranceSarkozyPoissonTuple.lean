module
public import Conjectures.PomeranceSarkozyPoissonAtom
public import Conjectures.PomeranceSarkozyCountableProduct

@[expose] public section
namespace PomeranceSarkozy

open scoped NNReal ENNReal BigOperators
open ProbabilityTheory

theorem bernoulliNatMass_nonneg {b : ℝ} (hb : 0≤b) (hb₁ : b≤1) (k : ℕ) :
    0≤bernoulliNatMass b k := by
  unfold bernoulliNatMass
  split
  · exact sub_nonneg.mpr hb₁
  · split
    · exact hb
    · rfl

theorem poissonNatMass_nonneg (b : ℝ≥0) (k : ℕ) : 0≤poissonNatMass b k := by
  unfold poissonNatMass
  rw [poissonMeasure_real_singleton]
  positivity

theorem bernoulliNatMass_atomicMass {b : ℝ} (hb : 0≤b) (hb₁ : b≤1) :
    atomicMass (bernoulliNatMass b)=1 := by
  unfold atomicMass
  rw [← ENNReal.ofReal_tsum_of_nonneg (bernoulliNatMass_nonneg hb hb₁)
    (bernoulliNatMass_hasSum b).summable, (bernoulliNatMass_hasSum b).tsum_eq,
    ENNReal.ofReal_one]

theorem poissonNatMass_atomicMass (b : ℝ≥0) : atomicMass (poissonNatMass b)=1 := by
  unfold atomicMass
  rw [← ENNReal.ofReal_tsum_of_nonneg (poissonNatMass_nonneg b)
    (poissonNatMass_hasSum b).summable, (poissonNatMass_hasSum b).tsum_eq,ENNReal.ofReal_one]

theorem bernoulli_poisson_atomicL1_le (b : ℝ≥0) :
    atomicL1 (bernoulliNatMass (b:ℝ)) (poissonNatMass b)≤ENNReal.ofReal (2*(b:ℝ)^2) := by
  unfold atomicL1
  rw [← ENNReal.ofReal_tsum_of_nonneg (fun _ => abs_nonneg _)
    (bernoulli_poisson_nat_hasSum_l1 b).summable]
  exact ENNReal.ofReal_le_ofReal (bernoulli_poisson_nat_l1_le b)

/-- Multicoordinate law comparison using the true Poisson marginals,
including all nonnegative integers in each marginal. -/
theorem bernoulli_poisson_tuple_le {n : ℕ} (b : Fin n→ℝ≥0) (hb : ∀ i,(b i:ℝ)≤1) :
    atomicL1 (realTupleMass (fun i => bernoulliNatMass (b i:ℝ)))
      (realTupleMass (fun i => poissonNatMass (b i))) ≤
      ∑ i,ENNReal.ofReal (2*(b i:ℝ)^2) :=
  (realTupleMass_atomicL1_le _ _
    (fun i => bernoulliNatMass_nonneg (b i).coe_nonneg (hb i))
    (fun i => poissonNatMass_nonneg (b i))
    (fun i => bernoulliNatMass_atomicMass (b i).coe_nonneg (hb i))
    (fun i => poissonNatMass_atomicMass (b i))).trans
      (Finset.sum_le_sum (fun i _ => bernoulli_poisson_atomicL1_le (b i)))

end PomeranceSarkozy
