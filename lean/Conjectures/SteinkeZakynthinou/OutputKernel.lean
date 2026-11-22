module

public import Conjectures.SteinkeZakynthinou.Pool
public import Mathlib.Probability.Kernel.Basic
public import Mathlib.Probability.ProbabilityMassFunction.Integrals

@[expose] public section

open MeasureTheory ProbabilityTheory
open scoped BigOperators ENNReal

namespace SteinkeZakynthinou

/-- The empirical loss is jointly Borel in the sample and the threshold. -/
theorem measurable_empiricalLoss {n : ℕ} :
    Measurable (fun p : Sample n × ℝ => empiricalLoss p.1 p.2) := by
  unfold empiricalLoss totalLoss
  apply Measurable.div_const
  apply Finset.measurable_sum
  intro i _
  have hi : Measurable (fun p : Sample n × ℝ => p.1 i) :=
    (measurable_pi_apply i).comp measurable_fst
  have hle : MeasurableSet {p : Sample n × ℝ | p.2 ≤ (p.1 i).1} :=
    measurableSet_le measurable_snd (measurable_fst.comp hi)
  have hpred : Measurable (fun p : Sample n × ℝ => decide (p.2 ≤ (p.1 i).1)) := by
    have h : Measurable (fun p : Sample n × ℝ => if p.2 ≤ (p.1 i).1 then true else false) :=
      Measurable.ite hle measurable_const measurable_const
    convert h using 1
    funext p
    by_cases hp : p.2 ≤ (p.1 i).1 <;> simp [hp]
  exact Measurable.ite (measurableSet_eq_fun hpred (measurable_snd.comp hi))
    measurable_const measurable_const

namespace Learner

variable {n : ℕ} (a : Learner n)

/-- The finite probability law of the learner's outcome index. -/
noncomputable def outcomePMF (z : Sample n) : PMF (Fin a.outcomes) :=
  PMF.ofFintype (fun i => ENNReal.ofReal (a.weight z i)) (by
    rw [← ENNReal.ofReal_sum_of_nonneg (fun i _ => a.weight_nonneg z i), a.weight_sum z,
      ENNReal.ofReal_one])

/-- The law of the returned real threshold, combining indices that return the same value. -/
noncomputable def outputPMF (z : Sample n) : PMF ℝ :=
  (a.outcomePMF z).map (a.threshold z)

theorem outputPMF_apply (z : Sample n) (t : ℝ) :
    a.outputPMF z t = ENNReal.ofReal (a.mass z t) := by
  classical
  have h (i : Fin a.outcomes) : 0 ≤ if a.threshold z i = t then a.weight z i else 0 := by
    split_ifs
    · exact a.weight_nonneg z i
    · exact le_rfl
  rw [outputPMF, PMF.map_apply, tsum_fintype, mass, ENNReal.ofReal_sum_of_nonneg (fun i _ => h i)]
  apply Finset.sum_congr rfl
  intro i _
  by_cases ht : a.threshold z i = t
  · rw [ite_eq_left ht.symm, ite_eq_left ht]
    rfl
  · rw [ite_eq_right (Ne.symm ht), ite_eq_right ht, ENNReal.ofReal_zero]

theorem outputPMF_support_finite (z : Sample n) : (a.outputPMF z).support.Finite := by
  rw [outputPMF, PMF.support_map]
  exact (Set.toFinite _).image _

open scoped Classical in
theorem outputPMF_toMeasure_apply (z : Sample n) (B : Set ℝ) (hB : MeasurableSet B) :
    (a.outputPMF z).toMeasure B = ∑ i,
      if a.threshold z i ∈ B then ENNReal.ofReal (a.weight z i) else 0 := by
  classical
  rw [outputPMF, PMF.toMeasure_map_apply _ _ _ (measurable_of_countable _) hB, outcomePMF,
    PMF.toMeasure_ofFintype_apply _ _ ((measurable_of_countable (a.threshold z)) hB), tsum_fintype]
  rfl

theorem measurable_outputPMF_toMeasure :
    Measurable (fun z => (a.outputPMF z).toMeasure) := by
  classical
  apply Measure.measurable_of_measurable_coe
  intro B hB
  simp_rw [a.outputPMF_toMeasure_apply _ B hB]
  exact Finset.measurable_sum _ fun i _ => Measurable.ite (a.measurable_threshold i hB)
    (ENNReal.measurable_ofReal.comp (a.measurable_weight i)) measurable_const

/-- The finite randomized learner as a Borel Markov kernel. -/
noncomputable def outputKernel : Kernel (Sample n) ℝ where
  toFun z := (a.outputPMF z).toMeasure
  measurable' := a.measurable_outputPMF_toMeasure

instance : IsMarkovKernel a.outputKernel where
  isProbabilityMeasure z := inferInstanceAs (IsProbabilityMeasure (a.outputPMF z).toMeasure)

theorem outputKernel_apply (z : Sample n) :
    a.outputKernel z = (a.outputPMF z).toMeasure := rfl

theorem outputKernel_apply_singleton (z : Sample n) (t : ℝ) :
    a.outputKernel z {t} = ENNReal.ofReal (a.mass z t) := by
  rw [outputKernel_apply, PMF.toMeasure_apply_singleton _ _ (measurableSet_singleton _),
    outputPMF_apply]

theorem integrable_empiricalLoss_outputKernel (z : Sample n) :
    Integrable (empiricalLoss z) (a.outputKernel z) := by
  have ht : Measurable (a.threshold z) := measurable_of_countable _
  have hl : Measurable (empiricalLoss z) := measurable_empiricalLoss.comp measurable_prodMk_left
  rw [outputKernel_apply, outputPMF, ← PMF.toMeasure_map _ _ ht]
  exact (integrable_map_measure hl.aestronglyMeasurable ht.aemeasurable).2 .of_finite

theorem integral_empiricalLoss_outputKernel (z : Sample n) :
    (∫ t, empiricalLoss z t ∂a.outputKernel z) = a.expectedLoss z := by
  have ht : Measurable (a.threshold z) := measurable_of_countable _
  have hl : Measurable (empiricalLoss z) := measurable_empiricalLoss.comp measurable_prodMk_left
  rw [outputKernel_apply, outputPMF, ← PMF.toMeasure_map _ _ ht, integral_map ht.aemeasurable
    hl.aestronglyMeasurable, PMF.integral_eq_sum, expectedLoss]
  simp only [outcomePMF, PMF.ofFintype_apply, ENNReal.toReal_ofReal (a.weight_nonneg z _),
    smul_eq_mul]

end Learner
end SteinkeZakynthinou
