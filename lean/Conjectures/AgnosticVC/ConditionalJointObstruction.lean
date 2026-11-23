module

public import Conjectures.AgnosticVC.BorelExample
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

/-- The canonical inclusion of proper outputs in the full space of tuple codes. -/
def groupOutputCode {m : ℕ} (G : Set (Fin m → unitInterval)) :
    Unit ⊕ G → Unit ⊕ (Fin m → unitInterval) :=
  Sum.map id Subtype.val

theorem measurable_groupOutputCode {m : ℕ} (G : Set (Fin m → unitInterval)) :
    Measurable (groupOutputCode G) :=
  measurable_id.sumMap measurable_subtype_coe

private theorem measurableSet_groupOutputCode_preimage {m : ℕ}
    {G : Set (Fin m → unitInterval)} {B : Set (Unit ⊕ G)} (hB : MeasurableSet B) :
    ∃ C : Set (Unit ⊕ (Fin m → unitInterval)), MeasurableSet C ∧ groupOutputCode G ⁻¹' C = B := by
  obtain ⟨hleft, hright⟩ := measurableSet_sum_iff.mp hB
  obtain ⟨C, hC, he⟩ : ∃ C : Set (Fin m → unitInterval), MeasurableSet C ∧
      Subtype.val ⁻¹' C = Sum.inr ⁻¹' B := hright
  let U : Set (Unit ⊕ (Fin m → unitInterval)) := Sum.inl '' (Sum.inl ⁻¹' B) ∪ Sum.inr '' C
  refine ⟨U, hleft.inl_image.union hC.inr_image, ?_⟩
  ext a
  cases a with
  | inl a =>
    change Sum.inl a ∈ U ↔ Sum.inl a ∈ B
    constructor
    · rintro (⟨b,hb,hba⟩ | ⟨b,_,hba⟩)
      · change Sum.inl b ∈ B at hb
        exact Sum.inl_injective hba ▸ hb
      · cases hba
    · intro ha
      exact Or.inl ⟨a,ha,rfl⟩
  | inr a =>
    have ha : (a : Fin m → unitInterval) ∈ C ↔ Sum.inr a ∈ B := by
      change a ∈ Subtype.val ⁻¹' C ↔ a ∈ Sum.inr ⁻¹' B
      rw [he]
    simpa [U, groupOutputCode] using ha

/-- The same disproof when the conditional law is taken on the ambient
standard Borel space of codes, and properness still restricts each output to
the prescribed subclass. The subclass itself has the trace sigma-algebra. -/
theorem exists_finiteGroups_no_measurable_ambient_joint_rate (c : ℝ) :
    ∃ n : ℕ, let X := Fin (n + 1) × unitInterval
      let D := (sectorLaw (n + 1) (volume : Measure unitInterval)).map (fun x => (x,true))
      let Z := Fin (n + 1) → X × Bool
      let K := Unit ⊕ (Fin (n + 1) → unitInterval)
      ∃ G : Set (Fin (n + 1) → unitInterval),
        let predict := groupPredict G
        StandardBorelSpace K ∧ IsProbabilityMeasure D ∧ Function.Injective predict ∧
        Measurable (fun p : X × (Unit ⊕ G) => predict p.2 p.1) ∧
        HasVCDimensionAtMost predict 1 ∧ ¬ HasVCDimensionAtMost predict 0 ∧
        (∀ h, {x : X | predict h x = true}.Finite) ∧
        ∀ (A : Z → Measure (Unit ⊕ G)), (∀ z, IsProbabilityMeasure (A z)) →
          ∀ (J : Kernel (IidCompletedPool (n + 1) D) (Selector (n + 1) × K)),
          (∀ᵐ p ∂(Measure.pi fun _ : Fin (n + 1) × Bool => D),
            J p = conditionalSelectorOutput (fun z => (A z).map (groupOutputCode G)) p) →
          ¬ ∀ z, (∫ h, empiricalError predict z h ∂A z) ≤
            (⨅ h, empiricalError predict z h) + c * Real.sqrt (1 / ((n + 1 : ℕ) : ℝ)) := by
  obtain ⟨n,G,hD,hinj,hmeas,hvc,hvc0,hfinite,hfail⟩ := exists_completed_finiteGroups_no_rate c
  refine ⟨n,G,standardBorelSpace_sum,hD,hinj,hmeas,hvc,hvc0,hfinite,?_⟩
  intro A hA J hJ
  let D := (sectorLaw (n + 1) (volume : Measure unitInterval)).map (fun x => (x,true))
  have hcode := measurable_learner_of_iid_selector_joint D
    (fun z => (A z).map (groupOutputCode G)) J hJ
  let Train := NullMeasurableSpace (Fin (n + 1) → (Fin (n + 1) × unitInterval) × Bool)
      (Measure.pi fun _ : Fin (n + 1) => D)
  let L : Kernel Train (Unit ⊕ G) := ⟨A, by
    apply Measure.measurable_of_measurable_coe
    intro B hB
    obtain ⟨C, hC, rfl⟩ := measurableSet_groupOutputCode_preimage hB
    have h := (Measure.measurable_coe hC).comp hcode
    change Measurable (fun z : Train => ((A z).map (groupOutputCode G)) C) at h
    simpa only [Measure.map_apply (measurable_groupOutputCode G) hC] using h⟩
  let : IsMarkovKernel L := ⟨hA⟩
  exact hfail L

variable {Ω K : Type*}

/-- Arrange the independent training and ghost columns, selector and private seed
with the seed adjacent to the training column. -/
private def selectFromSplitExperiment (p : ((Fin n → X × Bool) × Ω) × ((Fin n → X × Bool) × Selector n)) :
    (Fin n → X × Bool) × Ω :=
  (fun i => bif p.2.2 i then p.2.1 i else p.1.1 i, p.1.2)

private theorem nullMeasurable_seed_rule_of_split_experiment [MeasurableSpace X] [MeasurableSpace Ω]
    [MeasurableSpace K] (D : Measure (X × Bool)) [IsProbabilityMeasure D]
    (ν : Measure Ω) [IsProbabilityMeasure ν] (f : ((Fin n → X × Bool) × Ω) → K)
    (hf : let μ := Measure.pi fun _ : Fin n => D
      NullMeasurable (f ∘ selectFromSplitExperiment) ((μ.prod ν).prod (μ.prod (fairSelectorLaw n).toMeasure))) :
    NullMeasurable f ((Measure.pi fun _ : Fin n => D).prod ν) := by
  let μ := Measure.pi fun _ : Fin n => D
  let s : Selector n := fun _ => false
  let t : Set ((Fin n → X × Bool) × Selector n) := univ ×ˢ {s}
  have hm : MeasurableSet t := MeasurableSet.univ.prod (measurableSet_singleton _)
  have ht : (μ.prod (fairSelectorLaw n).toMeasure) t ≠ 0 := by
    change (μ.prod (fairSelectorLaw n).toMeasure) (univ ×ˢ {s}) ≠ 0
    rw [Measure.prod_prod, measure_univ, one_mul,
      PMF.toMeasure_apply_singleton _ _ (measurableSet_singleton s), fairSelectorLaw_apply_pow]
    simp
  intro B hB
  have hpre := (hf hB).inter ((measurable_snd hm).nullMeasurableSet
    (μ := (μ.prod ν).prod (μ.prod (fairSelectorLaw n).toMeasure)))
  have he : (f ⁻¹' B) ×ˢ t = (f ∘ selectFromSplitExperiment) ⁻¹' B ∩ Prod.snd ⁻¹' t := by
    ext p
    change (f p.1 ∈ B ∧ p.2 ∈ t) ↔ (f (selectFromSplitExperiment p) ∈ B ∧ p.2 ∈ t)
    by_cases h : p.2 ∈ t
    · have hs : p.2.2 = s := h.2
      have hp : selectFromSplitExperiment p = p.1 := by
        simp [selectFromSplitExperiment, hs, s]
      simp [hp]
    · simp [h]
  rw [← he] at hpre
  exact hpre.left_of_prod ht

/-- Rebracketing the source experiment leaves its iid pool, fair selector,
and private seed independent. -/
theorem nullMeasurable_seed_rule_of_iid_pool [MeasurableSpace X] [MeasurableSpace Ω]
    [MeasurableSpace K] (D : Measure (X × Bool)) [IsProbabilityMeasure D]
    (ν : Measure Ω) [IsProbabilityMeasure ν] (f : ((Fin n → X × Bool) × Ω) → K)
    (hf : let μ := Measure.pi fun _ : Fin n × Bool => D
      NullMeasurable (fun p : (Pool n X × Selector n) × Ω =>
        f ((fun i => p.1.1 (i,p.1.2 i)), p.2)) ((μ.prod (fairSelectorLaw n).toMeasure).prod ν)) :
    NullMeasurable f ((Measure.pi fun _ : Fin n => D).prod ν) := by
  let μ := Measure.pi fun _ : Fin n => D
  let σ := (fairSelectorLaw n).toMeasure
  have h₁ := measurePreserving_prodAssoc μ ν (μ.prod σ)
  have h₂ := (MeasurePreserving.id μ).prod (Measure.measurePreserving_swap (μ := ν) (ν := μ.prod σ))
  have h₃ := (measurePreserving_prodAssoc μ (μ.prod σ) ν).symm MeasurableEquiv.prodAssoc
  have h₄ := ((measurePreserving_prodAssoc μ μ σ).symm MeasurableEquiv.prodAssoc).prod
    (MeasurePreserving.id ν)
  have h₅ := ((interleavePool_measurePreserving (n := n) D).prod (MeasurePreserving.id σ)).prod
    (MeasurePreserving.id ν)
  have h := h₅.comp (h₄.comp (h₃.comp (h₂.comp h₁)))
  apply nullMeasurable_seed_rule_of_split_experiment D ν f
  have hh := hf.comp_quasiMeasurePreserving h.quasiMeasurePreserving
  convert hh using 1
  ext p
  rfl

private theorem countablyGenerated_groupTrace {m : ℕ} (G : Set (Fin m → unitInterval)) :
    MeasurableSpace.CountablyGenerated (Unit ⊕ G) := by
  let : StandardBorelSpace (Unit ⊕ (Fin m → unitInterval)) := standardBorelSpace_sum
  have he : (inferInstance : MeasurableSpace (Unit ⊕ G)) =
      MeasurableSpace.comap (groupOutputCode G) inferInstance := by
    ext B
    exact ⟨measurableSet_groupOutputCode_preimage, fun ⟨C, hC, hpre⟩ =>
      hpre ▸ measurable_groupOutputCode G hC⟩
  exact (congrArg (@MeasurableSpace.CountablyGenerated (Unit ⊕ G)) he.symm).mp
    (MeasurableSpace.CountablyGenerated.comap (groupOutputCode G))

private theorem measurable_empiricalLoss_joint {H : Type*} [MeasurableSpace X] [MeasurableSpace H]
    (predict : H → X → Bool) (hpred : Measurable (fun p : X × H => predict p.2 p.1)) :
    Measurable (fun p : (Fin n → X × Bool) × H => empiricalError predict p.1 p.2) := by
  simp only [empiricalError_eq_zeroOne]
  apply Measurable.div_const
  apply Finset.measurable_sum
  intro i _
  have hi := (measurable_pi_apply i).comp
    (measurable_fst : Measurable (Prod.fst : (Fin n → X × Bool) × H → _))
  have hbool := hpred.comp ((measurable_fst.comp hi).prodMk measurable_snd)
  exact Measurable.ite (measurableSet_eq_fun hbool (measurable_snd.comp hi))
    measurable_const measurable_const

universe u

/-- The ordinary seeded experiment cannot even produce a completed-measurable
ambient output random variable while meeting the proposed pointwise loss rate. -/
theorem exists_finiteGroups_no_measurable_seeded_pool_output_rate (c : ℝ) :
    ∃ n : ℕ, let X := Fin (n + 1) × unitInterval
      let D := (sectorLaw (n + 1) (volume : Measure unitInterval)).map (fun x => (x,true))
      let Z := Fin (n + 1) → X × Bool
      let μ := Measure.pi fun _ : Fin (n + 1) × Bool => D
      ∃ G : Set (Fin (n + 1) → unitInterval),
        let predict := groupPredict G
        StandardBorelSpace (Unit ⊕ (Fin (n + 1) → unitInterval)) ∧
        IsProbabilityMeasure D ∧ Function.Injective predict ∧
        Measurable (fun p : X × (Unit ⊕ G) => predict p.2 p.1) ∧
        HasVCDimensionAtMost predict 1 ∧ ¬ HasVCDimensionAtMost predict 0 ∧
        (∀ h, {x : X | predict h x = true}.Finite) ∧
        ∀ (Ω : Type u) [MeasurableSpace Ω] (ν : Measure Ω) [IsProbabilityMeasure ν]
          (A : Z → Ω → Unit ⊕ G),
          NullMeasurable (fun p : (Pool (n + 1) X × Selector (n + 1)) × Ω =>
            groupOutputCode G (A (fun i => p.1.1 (i,p.1.2 i)) p.2))
              ((μ.prod (fairSelectorLaw (n + 1)).toMeasure).prod ν) →
          (∀ z, AEMeasurable (fun ω => empiricalError predict z (A z ω)) ν) →
          ¬ ∀ z, (∫ ω, empiricalError predict z (A z ω) ∂ν) ≤
            (⨅ h, empiricalError predict z h) + c * Real.sqrt (1 / ((n + 1 : ℕ) : ℝ)) := by
  obtain ⟨n,G,hD,hinj,hmeas,hvc,hvc0,hfinite,hfail⟩ :=
    exists_finiteGroups_no_jointly_measurable_loss_learner.{u} c
  refine ⟨n,G,standardBorelSpace_sum,hD,hinj,hmeas,hvc,hvc0,hfinite,?_⟩
  intro Ω _ ν _ A hA hSections
  let X := Fin (n + 1) × unitInterval
  let D := (sectorLaw (n + 1) (volume : Measure unitInterval)).map (fun x => (x,true))
  let : IsProbabilityMeasure D := hD
  let μ := Measure.pi fun _ : Fin (n + 1) => D
  have hcode := nullMeasurable_seed_rule_of_iid_pool D ν
    (fun p : (Fin (n + 1) → X × Bool) × Ω => groupOutputCode G (A p.1 p.2)) hA
  have hproper : NullMeasurable (fun p : (Fin (n + 1) → X × Bool) × Ω => A p.1 p.2)
      (μ.prod ν) := by
    intro B hB
    obtain ⟨C, hC, rfl⟩ := measurableSet_groupOutputCode_preimage hB
    exact hcode hC
  let := countablyGenerated_groupTrace G
  have hrealized := (measurable_empiricalLoss_joint (groupPredict G) hmeas).comp_aemeasurable
    (measurable_fst.aemeasurable.prodMk hproper.aemeasurable)
  exact hfail Ω ν A hrealized hSections

end AgnosticVC
