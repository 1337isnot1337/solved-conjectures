module

public import Conjectures.AgnosticVC.EmpiricalInfimum
public import Conjectures.AgnosticVC.Kernel
public import Conjectures.AgnosticVC.MeasurableInformation
public import Conjectures.AgnosticVC.Rates

/-! Steinke–Zakynthinou, COLT 2020, Conjecture 6. The same distribution-independent
proper learner supplies both estimates. The first statement uses arbitrary fixed pools.
The second spells out the measurable-selection convention for population sampling. -/

@[expose] public section

open scoped BigOperators
open MeasureTheory

namespace AgnosticVC

universe u v

/-- The two rates on arbitrary sets, averaging over bijections of a fixed pool of labeled positions. -/
theorem steinkeZakynthinou_fixedPool {X : Type u} {H : Type v} [Nonempty H] [TraceOrder H]
    {n d : ℕ} (hd : 0 < d) (hn : d ≤ n) (predict : H → X → Bool)
    (hvc : HasVCDimensionAtMost predict d) :
    ∃ A : (Fin n → X × Bool) → PMF H,
      (∀ z : Pool n X, shuffleMean (originalPoolInformation A) z ≤ 19712 * d) ∧
      ∀ z, (∑' h : H, (A z h).toReal * empiricalError predict z h) ≤
        (⨅ h : H, empiricalError predict z h) + 583 * Real.sqrt ((d : ℝ) / n) := by
  refine ⟨properLearner hd hn predict, ?_, properLearner_empirical_le_iInf hd hn predict hvc⟩
  intro z
  rw [show originalPoolInformation (properLearner hd hn predict) = poolInformation hd hn predict
    from funext (originalPoolInformation_eq_poolInformation hd hn predict)]
  exact properLearner_fixedPool_information_le hd hn predict hvc z

/-- Across arbitrary hypothesis sets, both guarantees hold for every iid law under which
the actual whole-output information statistic is almost everywhere measurable. Its
integrability follows in the proof. No measurable representative selection is assumed. -/
theorem steinkeZakynthinou_measurableInformation {X : Type u} {H : Type v} [Nonempty H] [TraceOrder H]
    [MeasurableSpace X] {n d : ℕ} (hd : 0 < d) (hn : d ≤ n) (predict : H → X → Bool)
    (hvc : HasVCDimensionAtMost predict d) :
    ∃ A : (Fin n → X × Bool) → PMF H,
      (∀ (D : Measure (X × Bool)) [IsProbabilityMeasure D],
        let μ := Measure.pi (fun _ : Fin n × Bool => D)
        AEMeasurable (originalPoolInformation A) μ →
          Integrable (originalPoolInformation A) μ ∧
          (∫ z, originalPoolInformation A z ∂μ) ≤ 19712 * d) ∧
      ∀ z, (∑' h : H, (A z h).toReal * empiricalError predict z h) ≤
        (⨅ h : H, empiricalError predict z h) + 583 * Real.sqrt ((d : ℝ) / n) := by
  refine ⟨properLearner hd hn predict, ?_, properLearner_empirical_le_iInf hd hn predict hvc⟩
  intro D _ μ hm
  exact ⟨integrable_originalPoolInformation_of_aemeasurable hd hn predict μ hm,
    properLearner_original_cmi_le_of_aemeasurable hd hn predict hvc D hm⟩

/-- A single absolute constant works for every dimension, sample size and class satisfying
the measurable-selection convention. The learner is chosen before the iid population law.
The information uses the complete returned hypothesis and a fair selector, in nats. -/
def AgnosticVCProblem : Prop :=
  ∃ C : ℝ, 0 ≤ C ∧ ∀ (X : Type u) (H : Type v) [MeasurableSpace X] [MeasurableSpace H]
    [Nonempty H] (order : TraceOrder H) (predict : H → X → Bool) (d n : ℕ),
    letI := order
    0 < d → d ≤ n →
    HasVCDimensionAtMost predict d → HasMeasurableCanonicalRepresentatives predict →
    ∃ A : (Fin n → X × Bool) → PMF H,
      Measurable (fun z => (A z).toMeasure) ∧
      (∀ (D : Measure (X × Bool)) [IsProbabilityMeasure D],
        Integrable (originalPoolInformation A) (Measure.pi fun _ : Fin n × Bool => D) ∧
        (∫ z, originalPoolInformation A z ∂Measure.pi (fun _ : Fin n × Bool => D)) ≤ C * d) ∧
      ∀ z, (∑' h : H, (A z h).toReal * empiricalError predict z h) ≤
        (⨅ h : H, empiricalError predict z h) + C * Real.sqrt ((d : ℝ) / n)

/-- Conjecture 6 with explicit measurable representatives. For countable measurable
classes this hypothesis is supplied by `hasMeasurableCanonicalRepresentatives_of_countable`. -/
theorem steinkeZakynthinou_conjecture6 : AgnosticVCProblem.{u,v} := by
  refine ⟨19712, by norm_num, ?_⟩
  intro X H _ _ _ order predict d n
  let : TraceOrder H := order
  intro hd hn hvc hsel
  refine ⟨properLearner hd hn predict, measurable_properLearner_toMeasure hd hn predict hsel, ?_, ?_⟩
  · intro D _
    rw [show originalPoolInformation (properLearner hd hn predict) = poolInformation hd hn predict
      from funext (originalPoolInformation_eq_poolInformation hd hn predict)]
    exact ⟨integrable_poolInformation hd hn predict hsel.toHasMeasurableTraceSelection _,
      properLearner_cmi_le hd hn predict hvc hsel.toHasMeasurableTraceSelection D⟩
  · intro z
    apply (properLearner_empirical_le_iInf hd hn predict hvc z).trans
    linarith [Real.sqrt_nonneg ((d : ℝ) / n)]

end AgnosticVC
