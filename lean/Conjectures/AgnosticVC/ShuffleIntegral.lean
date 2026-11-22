module

public import Conjectures.AgnosticVC.Exchangeability
public import Conjectures.AgnosticVC.OriginalInformation
public import Conjectures.AgnosticVC.Rates

@[expose] public section

/-! Transfer the deterministic shuffle bound to the actual iid information. -/

namespace AgnosticVC

open MeasureTheory
open scoped BigOperators

private theorem permMean_eq_shuffleMean {I Z : Type*} [Fintype I] [DecidableEq I]
    [MeasurableSpace Z] (f : (I → Z) → ℝ) (z : I → Z) :
    permMean f z = shuffleMean f z := by
  unfold permMean shuffleMean
  congr 1
  calc
    _ = ∑ π : Equiv.Perm I, f (z ∘ (Equiv.inv (Equiv.Perm I)) π) := by
      refine Finset.sum_congr rfl fun π _ => ?_
      congr 1
      funext i
      change MeasurableEquiv.piCongrLeft (fun _ : I => Z) π z i = z (π.symm i)
      simpa only [π.apply_symm_apply] using
        MeasurableEquiv.piCongrLeft_apply_apply (β := fun _ : I => Z) π z (π.symm i)
    _ = _ := Equiv.sum_comp (Equiv.inv (Equiv.Perm I)) (fun π => f (z ∘ π))

/-- The iid information bound for the actual returned hypothesis, assuming its scalar
pool-information statistic is integrable. -/
theorem properLearner_cmi_of_integrable {n d : ℕ} {X H : Type*} [Nonempty H]
    [MeasurableSpace X] (hd : 0 < d) (hn : d ≤ n) (predict : H → X → Bool)
    (hvc : HasVCDimensionAtMost predict d) (D : Measure (X × Bool)) [IsProbabilityMeasure D]
    (hI : Integrable (originalPoolInformation (properLearner hd hn predict))
      (Measure.pi fun _ : Fin n × Bool => D)) :
    (∫ z, originalPoolInformation (properLearner hd hn predict) z
      ∂Measure.pi (fun _ : Fin n × Bool => D)) ≤ 19712 * d := by
  apply integral_le_of_permMean_le D hI
  intro z
  rw [permMean_eq_shuffleMean, funext (originalPoolInformation_eq_poolInformation hd hn predict)]
  exact properLearner_fixedPool_information_le hd hn predict hvc z

end AgnosticVC
