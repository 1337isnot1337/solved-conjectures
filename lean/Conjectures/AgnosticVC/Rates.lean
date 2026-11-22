module

public import Conjectures.AgnosticVC.DeletionSum
public import Conjectures.AgnosticVC.FixedPool
public import Conjectures.AgnosticVC.ProjectionWeightIntegral
public import Conjectures.AgnosticVC.VCAccuracy
public import Conjectures.AgnosticVC.VCMeasurability

/-! Both rates of the proposed general proper learner. The permutation theorem
is purely combinatorial on arbitrary types. The iid theorem uses measurable
trace coding to form the integral of the exact finite-channel information. -/

@[expose] public section

open scoped BigOperators
open MeasureTheory

namespace AgnosticVC

variable {n d : ℕ} {X H : Type*} [Nonempty H] [TraceOrder H]

theorem blockDeletion_sum_le (hd : 0 < d) (hn : d ≤ n) (predict : H → X → Bool)
    (hvc : HasVCDimensionAtMost predict d) (T : Fin (n+1) → X × Bool) :
    ∑ i, blockDeletionCharge (schedule n d) predict T i ≤ 4928 * d :=
  deletion_sum_le_of_loss_integral hd hn (Nat.le_succ n)
    (fun j => (schedule_size_le hd hn j).trans_lt (Nat.lt_succ_self _)) predict hvc T
    (traceLaw_remove_loss_integral_le hd hn
      ((schedule_size_le hd hn (Fin.last (depth n d))).trans_lt (Nat.lt_succ_self _))
      (by have := hd.trans_le hn; omega) predict (fun i => (T i).1) (fun i => (T i).2)
      (sampleFamily_vcDim_le hvc _))

/-- For any fixed labeled pool, condition on its order when measuring information
and then average over the uniform order. No population measurability is required. -/
theorem properLearner_fixedPool_information_le (hd : 0 < d) (hn : d ≤ n) (predict : H → X → Bool)
    (hvc : HasVCDimensionAtMost predict d) (z : Pool n X) :
    shuffleMean (poolInformation hd hn predict) z ≤ 19712 * d := by
  have h := shuffleMean_le_of_blockCharges hd hn predict (blockDeletion_sum_le hd hn predict hvc) z
  linarith

/-- The information in the whole hypothesis, in nats, for any iid labeled distribution. -/
theorem properLearner_cmi_le (hd : 0 < d) (hn : d ≤ n) [MeasurableSpace X] (predict : H → X → Bool)
    (hvc : HasVCDimensionAtMost predict d) (hsel : HasMeasurableTraceSelection predict)
    (D : Measure (X × Bool)) [IsProbabilityMeasure D] :
    (∫ z, poolInformation hd hn predict z ∂Measure.pi (fun _ : Fin n × Bool => D)) ≤ 19712 * d := by
  have h := cmi_le_of_blockCharges hd hn predict D
    (integrable_poolInformation hd hn predict hsel _)
    (fun i => integrable_blockDeletionCharge (schedule n d) predict hsel i _)
    (blockDeletion_sum_le hd hn predict hvc)
  linarith

end AgnosticVC
