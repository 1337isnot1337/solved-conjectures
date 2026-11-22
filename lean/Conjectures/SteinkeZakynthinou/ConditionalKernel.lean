module

public import Conjectures.SteinkeZakynthinou.JointKL
public import Mathlib.Probability.Kernel.Composition.MeasureCompProd

/-! The actual fair selector and real output form a conditional Markov law given the pool. -/

@[expose] public section

namespace SteinkeZakynthinou.Learner

open MeasureTheory ProbabilityTheory AgnosticVC
open scoped ENNReal

variable {n : ℕ} (a : Learner n)

/-- Given the pool and selector, run the learner on the selected training sample. -/
noncomputable def selectedOutputKernel : Kernel (SteinkeZakynthinou.Pool n × Selector n) ℝ :=
  a.outputKernel.comap (fun p => select p.1 p.2)
    (measurable_from_prod_countable_left measurable_select)

instance : IsMarkovKernel a.selectedOutputKernel := by
  unfold selectedOutputKernel
  infer_instance

theorem selectedOutputKernel_apply (T : SteinkeZakynthinou.Pool n) (s : Selector n) :
    a.selectedOutputKernel (T, s) = a.outputKernel (select T s) := rfl

/-- Given the pool, first draw a fair selector and then draw the real learner output. -/
noncomputable def poolJointKernel : Kernel (SteinkeZakynthinou.Pool n) (Selector n × ℝ) :=
  Kernel.const _ (fairSelectorLaw n).toMeasure ⊗ₖ a.selectedOutputKernel

instance : IsMarkovKernel a.poolJointKernel := by
  unfold poolJointKernel
  infer_instance

/-- The conditional kernel agrees with the finite law used in the KL computation. -/
theorem poolJointKernel_apply (T : SteinkeZakynthinou.Pool n) :
    a.poolJointKernel T = (a.poolJoint T).toMeasure := by
  ext B hB
  rw [poolJointKernel, Kernel.compProd_apply hB, Kernel.const_apply, lintegral_fintype]
  simp_rw [selectedOutputKernel_apply, outputKernel_apply,
    PMF.toMeasure_apply_singleton _ _ (measurableSet_singleton _)]
  rw [poolJoint, originalPoolJoint, PMF.toMeasure_bind_apply _ _ _ hB, tsum_fintype]
  simp_rw [PMF.toMeasure_map_apply _ _ _ measurable_prodMk_left hB]
  exact Finset.sum_congr rfl fun _ _ => mul_comm _ _

theorem measurable_poolJoint_toMeasure :
    Measurable (fun T => (a.poolJoint T).toMeasure) := by
  simpa only [← a.poolJointKernel_apply] using a.poolJointKernel.measurable

/-- Each selector rectangle has probability `2⁻ⁿ` times the selected sample's output law. -/
theorem poolJointKernel_apply_selector_rectangle (T : SteinkeZakynthinou.Pool n)
    (s : Selector n) (B : Set ℝ) (hB : MeasurableSet B) :
    a.poolJointKernel T ({s} ×ˢ B) = ((2 : ℝ≥0∞) ^ n)⁻¹ * a.outputKernel (select T s) B := by
  rw [poolJointKernel, Kernel.compProd_apply_prod (measurableSet_singleton s) hB,
    Kernel.const_apply, lintegral_singleton, selectedOutputKernel_apply,
    PMF.toMeasure_apply_singleton _ _ (measurableSet_singleton _), fairSelectorLaw_apply_pow,
    mul_comm]

/-- The complete experiment draws an iid pool and then the selector and threshold. -/
noncomputable def poolSelectorOutputLaw (D : Measure Observation) :
    Measure (SteinkeZakynthinou.Pool n × (Selector n × ℝ)) :=
  poolMeasure n D ⊗ₘ a.poolJointKernel

instance (D : Measure Observation) [IsProbabilityMeasure D] :
    IsProbabilityMeasure (a.poolSelectorOutputLaw D) := by
  unfold poolSelectorOutputLaw
  infer_instance

theorem poolSelectorOutputLaw_fst (D : Measure Observation) [IsProbabilityMeasure D] :
    (a.poolSelectorOutputLaw D).fst = poolMeasure n D :=
  Measure.fst_compProd _ _

/-- Drawing the selector independently of the pool and then drawing the output
gives the same joint law after reassociating the paired coordinates. -/
theorem poolSelectorOutputLaw_assoc (D : Measure Observation) [IsProbabilityMeasure D] :
    (a.poolSelectorOutputLaw D).map MeasurableEquiv.prodAssoc.symm =
      ((poolMeasure n D).prod (fairSelectorLaw n).toMeasure) ⊗ₘ a.selectedOutputKernel := by
  rw [poolSelectorOutputLaw, poolJointKernel, Measure.compProd_assoc, Measure.compProd_const]

/-- The selector and pool marginal is the product of the two independent draws. -/
theorem poolSelectorOutputLaw_map_pool_selector (D : Measure Observation) [IsProbabilityMeasure D] :
    (a.poolSelectorOutputLaw D).map (fun p => (p.1, p.2.1)) =
      (poolMeasure n D).prod (fairSelectorLaw n).toMeasure := by
  have hmap : Measurable (MeasurableEquiv.prodAssoc.symm :
      SteinkeZakynthinou.Pool n × (Selector n × ℝ) → (SteinkeZakynthinou.Pool n × Selector n) × ℝ) :=
    MeasurableEquiv.measurable _
  calc
    _ = ((a.poolSelectorOutputLaw D).map MeasurableEquiv.prodAssoc.symm).fst := by
      rw [Measure.fst, Measure.map_map measurable_fst hmap]
      rfl
    _ = _ := by rw [poolSelectorOutputLaw_assoc, Measure.fst_compProd]

end SteinkeZakynthinou.Learner
