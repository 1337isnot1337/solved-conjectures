module

public import Conjectures.AgnosticVC.ShuffleIntegral

@[expose] public section

namespace AgnosticVC

open MeasureTheory
open scoped BigOperators

/-- The information of the full named output has finite range on the deterministic pools. -/
theorem originalPoolInformation_finite_range {H X : Type*} [Nonempty H] {n d : ℕ}
    (hd : 0 < d) (hn : d ≤ n) (predict : H → X → Bool) :
    (Set.range (originalPoolInformation (properLearner hd hn predict))).Finite := by
  rw [show originalPoolInformation (properLearner hd hn predict) = poolInformation hd hn predict
    from funext (originalPoolInformation_eq_poolInformation hd hn predict)]
  exact poolInformation_finite_range hd hn predict

/-- For a finite measure on the pools, almost-everywhere measurability of the exact
information statistic suffices for integrability. -/
theorem integrable_originalPoolInformation_of_aemeasurable {H X : Type*} [Nonempty H]
    [MeasurableSpace X] {n d : ℕ} (hd : 0 < d) (hn : d ≤ n) (predict : H → X → Bool)
    (μ : Measure (Pool n X)) [IsFiniteMeasure μ]
    (hm : AEMeasurable (originalPoolInformation (properLearner hd hn predict)) μ) :
    Integrable (originalPoolInformation (properLearner hd hn predict)) μ := by
  classical
  let f := originalPoolInformation (properLearner hd hn predict)
  let S := (originalPoolInformation_finite_range hd hn predict).toFinset
  apply Integrable.of_bound hm.aestronglyMeasurable (∑ v ∈ S, |v|)
  filter_upwards with z
  rw [Real.norm_eq_abs]
  have h : f z ∈ S := (originalPoolInformation_finite_range hd hn predict).mem_toFinset.mpr (Set.mem_range_self z)
  exact Finset.single_le_sum (fun v _ => abs_nonneg v) h

/-- The iid information bound uses only almost-everywhere measurability of the exact
information statistic. It follows from the permutation-averaged fixed-pool bound. -/
theorem properLearner_original_cmi_le_of_aemeasurable {H X : Type*} [Nonempty H]
    [MeasurableSpace X] {n d : ℕ} (hd : 0 < d) (hn : d ≤ n) (predict : H → X → Bool)
    (hvc : HasVCDimensionAtMost predict d) (D : Measure (X × Bool)) [IsProbabilityMeasure D]
    (hm : AEMeasurable (originalPoolInformation (properLearner hd hn predict))
      (Measure.pi fun _ : Fin n × Bool => D)) :
    (∫ z, originalPoolInformation (properLearner hd hn predict) z
      ∂Measure.pi (fun _ : Fin n × Bool => D)) ≤ 19712 * d := by
  exact properLearner_cmi_of_integrable hd hn predict hvc D
    (integrable_originalPoolInformation_of_aemeasurable hd hn predict _ hm)

/-- An iid pool from a countably supported law inherits a countable full-measure set,
so any real-valued pool statistic is almost-everywhere measurable. -/
theorem aemeasurable_pool_of_countably_supported {X : Type*} [MeasurableSpace X]
    [MeasurableSingletonClass X] {n : ℕ} (D : Measure (X × Bool)) [IsProbabilityMeasure D]
    {S : Set (X × Bool)} (hS : S.Countable) (hae : ∀ᵐ x ∂D, x ∈ S) (f : Pool n X → ℝ) :
    AEMeasurable f (Measure.pi fun _ : Fin n × Bool => D) := by
  classical
  let μ := Measure.pi fun _ : Fin n × Bool => D
  let T := Set.pi Set.univ (fun _ : Fin n × Bool => S)
  have hc : T.Countable := Set.countable_univ_pi fun _ => hS
  have hcoord (i : Fin n × Bool) : ∀ᵐ z ∂μ, z i ∈ S :=
    (measurePreserving_eval (fun _ : Fin n × Bool => D) i).quasiMeasurePreserving.ae hae
  have hfull : ∀ᵐ z ∂μ, z ∈ T := by
    filter_upwards [ae_all_iff.mpr hcoord] with z hz
    exact fun i _ => hz i
  have hm : Measurable (T.indicator f) := by
    apply measurable_of_measurable_on_compl_countable T hc
    have he : Tᶜ.domRestrict (T.indicator f) = fun _ => (0 : ℝ) := by
      funext z
      exact Set.indicator_of_notMem z.property _
    rw [he]
    exact measurable_const
  apply hm.aemeasurable.congr
  filter_upwards [hfull] with z hz
  exact Set.indicator_of_mem hz _

/-- The iid information inequality for countably supported labeled source laws,
with arbitrary hypothesis classes. -/
theorem properLearner_original_cmi_le_of_countably_supported {H X : Type*} [Nonempty H]
    [MeasurableSpace X] [MeasurableSingletonClass X] {n d : ℕ}
    (hd : 0 < d) (hn : d ≤ n) (predict : H → X → Bool) (hvc : HasVCDimensionAtMost predict d)
    (D : Measure (X × Bool)) [IsProbabilityMeasure D] {S : Set (X × Bool)}
    (hS : S.Countable) (hae : ∀ᵐ x ∂D, x ∈ S) :
    (∫ z, originalPoolInformation (properLearner hd hn predict) z
      ∂Measure.pi (fun _ : Fin n × Bool => D)) ≤ 19712 * d :=
  properLearner_original_cmi_le_of_aemeasurable hd hn predict hvc D
    (aemeasurable_pool_of_countably_supported D hS hae _)

end AgnosticVC
