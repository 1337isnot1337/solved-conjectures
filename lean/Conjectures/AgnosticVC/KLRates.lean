module

public import Conjectures.AgnosticVC.Rates
public import Conjectures.AgnosticVC.OriginalKL
public import Conjectures.AgnosticVC.EmpiricalInfimum

/-! Both rates of the same proper learner, with information stated as Mathlib KL. -/

@[expose] public section

open MeasureTheory
open scoped ENNReal

namespace AgnosticVC

variable {n d : ℕ} {X H : Type*} [MeasurableSpace H] [MeasurableSingletonClass H]

/-- The fixed-pool KL divergence of the actual joint law from the product of its marginals. -/
noncomputable def originalPoolKL (A : (Fin n → X × Bool) → PMF H) (z : Pool n X) : ℝ≥0∞ :=
  InformationTheory.klDiv (originalPoolJoint A z).toMeasure (originalPoolMarginalProduct A z).toMeasure

/-- The proper learner simultaneously attains the empirical infimum rate and the iid Mathlib
KL rate. The output law is fixed before the population law, and its poolwise KL is finite. -/
theorem steinkeZakynthinou_kl_rates [Nonempty H] [MeasurableSpace X]
    (hd : 0 < d) (hn : d ≤ n) (predict : H → X → Bool)
    (hvc : HasVCDimensionAtMost predict d) (hsel : HasMeasurableTraceSelection predict) :
    let A := properLearner hd hn predict
    (∀ z, (∑' h : H, (A z h).toReal * empiricalError predict z h) ≤
      (⨅ h : H, empiricalError predict z h) + 583 * Real.sqrt ((d : ℝ) / n)) ∧
    (∀ z : Pool n X, originalPoolKL A z ≠ ⊤) ∧
    ∀ (D : Measure (X × Bool)) [IsProbabilityMeasure D],
      let μ := Measure.pi (fun _ : Fin n × Bool => D)
      Integrable (fun z => (originalPoolKL A z).toReal) μ ∧
      (∫ z, (originalPoolKL A z).toReal ∂μ) ≤ 19712 * d ∧
      (∫⁻ z, originalPoolKL A z ∂μ) ≤ ENNReal.ofReal (19712 * d) := by
  intro A
  have hKL (z : Pool n X) : originalPoolKL A z ≠ ⊤ ∧
      (originalPoolKL A z).toReal = poolInformation hd hn predict z :=
    poolInformation_eq_klDiv hd hn predict z
  refine ⟨properLearner_empirical_le_iInf hd hn predict hvc, fun z => (hKL z).1, ?_⟩
  intro D _ μ
  have he : (fun z => (originalPoolKL A z).toReal) = poolInformation hd hn predict :=
    funext fun z => (hKL z).2
  have hi : Integrable (fun z => (originalPoolKL A z).toReal) μ := by
    rw [he]
    exact integrable_poolInformation hd hn predict hsel μ
  have hb : (∫ z, (originalPoolKL A z).toReal ∂μ) ≤ 19712 * d := by
    rw [he]
    exact properLearner_cmi_le hd hn predict hvc hsel D
  refine ⟨hi, hb, ?_⟩
  calc
    _ = ∫⁻ z, ENNReal.ofReal (originalPoolKL A z).toReal ∂μ :=
      lintegral_congr fun z => (ENNReal.ofReal_toReal (hKL z).1).symm
    _ = ENNReal.ofReal (∫ z, (originalPoolKL A z).toReal ∂μ) :=
      (ofReal_integral_eq_lintegral_ofReal hi (Filter.Eventually.of_forall fun _ => ENNReal.toReal_nonneg)).symm
    _ ≤ _ := ENNReal.ofReal_le_ofReal hb

/-- Countable classes of measurable predictors satisfy the measurable selection hypothesis. -/
theorem steinkeZakynthinou_kl_rates_countable [Nonempty H] [Countable H] [MeasurableSpace X]
    (hd : 0 < d) (hn : d ≤ n) (predict : H → X → Bool)
    (hvc : HasVCDimensionAtMost predict d) (hmeas : ∀ h, Measurable (predict h)) :
    let A := properLearner hd hn predict
    (∀ z, (∑' h : H, (A z h).toReal * empiricalError predict z h) ≤
      (⨅ h : H, empiricalError predict z h) + 583 * Real.sqrt ((d : ℝ) / n)) ∧
    (∀ z : Pool n X, originalPoolKL A z ≠ ⊤) ∧
    ∀ (D : Measure (X × Bool)) [IsProbabilityMeasure D],
      let μ := Measure.pi (fun _ : Fin n × Bool => D)
      Integrable (fun z => (originalPoolKL A z).toReal) μ ∧
      (∫ z, (originalPoolKL A z).toReal ∂μ) ≤ 19712 * d ∧
      (∫⁻ z, originalPoolKL A z ∂μ) ≤ ENNReal.ofReal (19712 * d) :=
  steinkeZakynthinou_kl_rates hd hn predict hvc (hasMeasurableTraceSelection_of_countable predict hmeas)

end AgnosticVC
