module

public import Conjectures.AgnosticVC.CompletedFiniteGroups
public import Conjectures.AgnosticVC.IidConditionalKernel

/-! Recover the learner's completed output kernel from the ordinary
conditional selector/output law on an independent training and ghost pair. -/

@[expose] public section

namespace AgnosticVC

open MeasureTheory ProbabilityTheory Set SteinkeZakynthinou
open scoped ENNReal

variable {X H : Type*} {n : ℕ}

/-- Bundle an original sample and its independent ghost sample as one pool. -/
def interleavePool (p : (Fin n → X × Bool) × (Fin n → X × Bool)) : Pool n X :=
  fun i => bif i.2 then p.2 i.1 else p.1 i.1

theorem interleavePool_measurePreserving [MeasurableSpace X]
    (D : Measure (X × Bool)) [IsProbabilityMeasure D] :
    MeasurePreserving (interleavePool (n := n))
      ((Measure.pi fun _ : Fin n => D).prod (Measure.pi fun _ : Fin n => D))
      (Measure.pi fun _ : Fin n × Bool => D) := by
  let e : Fin n ⊕ Fin n ≃ Fin n × Bool :=
    ⟨Sum.elim (fun i => (i,false)) (fun i => (i,true)),
      (fun i => bif i.2 then .inr i.1 else .inl i.1),
      (by intro i; cases i <;> rfl), (by rintro ⟨i,b⟩; cases b <;> rfl)⟩
  have h := (measurePreserving_piCongrLeft (fun _ : Fin n × Bool => D) e).comp
    (measurePreserving_sumPiEquivProdPi_symm (fun _ : Fin n ⊕ Fin n => D))
  convert h using 1
  funext p i
  rcases i with ⟨i,b⟩
  cases b <;> rfl

/-- Literal joint law of the fair selector and a proper random output at a
fixed pool, allowing arbitrary probability measures on the hypothesis space. -/
noncomputable def conditionalSelectorOutput [MeasurableSpace H]
    (A : (Fin n → X × Bool) → Measure H) (z : Pool n X) : Measure (Selector n × H) :=
  Measure.sum fun s : Selector n => fairSelectorLaw n s • (A (fun i => z (i,s i))).map (Prod.mk s)

private theorem conditionalSelectorOutput_event [MeasurableSpace H]
    (A : (Fin n → X × Bool) → Measure H) (z : Pool n X) (s : Selector n)
    {B : Set H} (hB : MeasurableSet B) :
    conditionalSelectorOutput A z (Prod.snd ⁻¹' B ∩ Prod.fst ⁻¹' {s}) =
      fairSelectorLaw n s * (A (fun i => z (i,s i))) B := by
  classical
  let C : Set (Selector n × H) := Prod.snd ⁻¹' B ∩ Prod.fst ⁻¹' {s}
  have hC : MeasurableSet C := (measurable_snd hB).inter (measurable_fst (measurableSet_singleton s))
  change conditionalSelectorOutput A z C = _
  rw [conditionalSelectorOutput, Measure.sum_apply _ hC, tsum_eq_single s]
  · rw [Measure.smul_apply, smul_eq_mul, Measure.map_apply measurable_prodMk_left hC]
    have he : Prod.mk s ⁻¹' C = B := by
      ext h
      change (h ∈ B ∧ s ∈ ({s} : Set (Selector n))) ↔ h ∈ B
      simp
    rw [he]
  · intro t ht
    rw [Measure.smul_apply, smul_eq_mul, Measure.map_apply measurable_prodMk_left hC]
    have he : Prod.mk t ⁻¹' C = ∅ := by
      ext h
      change (h ∈ B ∧ t ∈ ({s} : Set (Selector n))) ↔ h ∈ (∅ : Set H)
      simp [ht]
    rw [he, measure_empty, mul_zero]

/-- If the conditional selector-and-output law in the original iid CMI
experiment is measurable, the same learner's output law on training samples
is measurable after completion. Agreement of the given kernel with the
actual law is needed only almost everywhere on the full experiment. -/
theorem measurable_learner_of_completed_selector_joint [MeasurableSpace X] [MeasurableSpace H]
    (D : Measure (X × Bool)) [IsProbabilityMeasure D]
    (A : (Fin n → X × Bool) → Measure H)
    (J : Kernel (NullMeasurableSpace ((Fin n → X × Bool) × (Fin n → X × Bool))
      ((Measure.pi fun _ : Fin n => D).prod (Measure.pi fun _ : Fin n => D))) (Selector n × H))
    (hJ : ∀ᵐ p ∂((Measure.pi fun _ : Fin n => D).prod (Measure.pi fun _ : Fin n => D)),
      J p = conditionalSelectorOutput A (interleavePool p)) :
    Measurable (fun z : NullMeasurableSpace (Fin n → X × Bool) (Measure.pi fun _ : Fin n => D) =>
      A z) := by
  classical
  let Z := Fin n → X × Bool
  let μ := Measure.pi fun _ : Fin n => D
  let s : Selector n := fun _ => false
  let q : ℝ≥0∞ := fairSelectorLaw n s
  have hq : q ≠ 0 := by
    rw [show q = fairSelectorLaw n s from rfl, fairSelectorLaw_apply_pow]
    simp
  have hqt : q ≠ ⊤ := PMF.apply_ne_top _ _
  apply Measure.measurable_of_measurable_coe
  intro B hB T hT
  let C : Set (Selector n × H) := Prod.snd ⁻¹' B ∩ Prod.fst ⁻¹' {s}
  have hC : MeasurableSet C := (measurable_snd hB).inter (measurable_fst (measurableSet_singleton s))
  let f (p : Z × Z) : ℝ≥0∞ := q⁻¹ * J p C
  have hf : NullMeasurable f (μ.prod μ) := by
    exact fun _ hU => (measurable_const.mul (J.measurable_coe hC)) hU
  have he : f =ᵐ[μ.prod μ] fun p => A p.1 B := by
    filter_upwards [hJ] with p hp
    change q⁻¹ * J p C = _
    rw [hp, conditionalSelectorOutput_event A _ s hB, ← mul_assoc,
      ENNReal.inv_mul_cancel hq hqt, one_mul]
    rfl
  have hpre : NullMeasurableSet ((Prod.fst : Z × Z → Z) ⁻¹'
      ((fun z : Z => A z B) ⁻¹' T)) (μ.prod μ) := (hf.congr he) hT
  change NullMeasurableSet ((fun z : Z => A z B) ⁻¹' T) μ
  exact hpre.of_preimage_fst

/-- The same implication on the original coordinate-indexed iid pool. -/
theorem measurable_learner_of_iid_selector_joint [MeasurableSpace X] [MeasurableSpace H]
    (D : Measure (X × Bool)) [IsProbabilityMeasure D]
    (A : (Fin n → X × Bool) → Measure H) (J : Kernel (IidCompletedPool n D) (Selector n × H))
    (hJ : ∀ᵐ p ∂(Measure.pi fun _ : Fin n × Bool => D), J p = conditionalSelectorOutput A p) :
    Measurable (fun z : NullMeasurableSpace (Fin n → X × Bool) (Measure.pi fun _ : Fin n => D) =>
      A z) := by
  let μ := Measure.pi fun _ : Fin n => D
  have hp := interleavePool_measurePreserving (n := n) D
  have hm : @Measurable (NullMeasurableSpace ((Fin n → X × Bool) × (Fin n → X × Bool)) (μ.prod μ))
      (IidCompletedPool n D) NullMeasurableSpace.instMeasurableSpace
      NullMeasurableSpace.instMeasurableSpace interleavePool :=
    fun _ hT => NullMeasurableSet.preimage hT hp.quasiMeasurePreserving
  exact measurable_learner_of_completed_selector_joint D A (J.comap interleavePool hm)
    (hp.quasiMeasurePreserving.ae hJ)

/-- A measurable kernel for the actual whole-output CMI experiment itself
is enough to trigger the empirical-rate counterexample. -/
theorem exists_finiteGroups_no_measurable_selector_joint_rate (c : ℝ) :
    ∃ n : ℕ, let X := Fin (n + 1) × unitInterval
      let D := (sectorLaw (n + 1) (volume : Measure unitInterval)).map (fun x => (x,true))
      let Z := Fin (n + 1) → X × Bool
      ∃ G : Set (Fin (n + 1) → unitInterval),
        let predict := groupPredict G
        IsProbabilityMeasure D ∧ Function.Injective predict ∧
        Measurable (fun p : X × (Unit ⊕ G) => predict p.2 p.1) ∧
        HasVCDimensionAtMost predict 1 ∧ ¬ HasVCDimensionAtMost predict 0 ∧
        (∀ h, {x : X | predict h x = true}.Finite) ∧
        ∀ (A : Z → Measure (Unit ⊕ G)), (∀ z, IsProbabilityMeasure (A z)) →
          ∀
          (J : Kernel (IidCompletedPool (n + 1) D) (Selector (n + 1) × (Unit ⊕ G))),
          (∀ᵐ p ∂(Measure.pi fun _ : Fin (n + 1) × Bool => D),
            J p = conditionalSelectorOutput A p) →
          ¬ ∀ z, (∫ h, empiricalError predict z h ∂A z) ≤
            (⨅ h, empiricalError predict z h) + c * Real.sqrt (1 / ((n + 1 : ℕ) : ℝ)) := by
  obtain ⟨n,G,hD,hinj,hmeas,hvc,hvc0,hfinite,hfail⟩ := exists_completed_finiteGroups_no_rate c
  refine ⟨n,G,hD,hinj,hmeas,hvc,hvc0,hfinite,?_⟩
  intro A hA J hJ
  let D := (sectorLaw (n + 1) (volume : Measure unitInterval)).map (fun x => (x,true))
  let L : Kernel (NullMeasurableSpace (Fin (n + 1) → (Fin (n + 1) × unitInterval) × Bool)
      (Measure.pi fun _ : Fin (n + 1) => D)) (Unit ⊕ G) :=
    ⟨A, measurable_learner_of_iid_selector_joint D A J hJ⟩
  let : IsMarkovKernel L := ⟨hA⟩
  exact hfail L

end AgnosticVC
