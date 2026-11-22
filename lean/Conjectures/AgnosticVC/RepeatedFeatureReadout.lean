module

public import Conjectures.AgnosticVC.FiniteSupportUniform

/-! For iid data, a learner restricted to repeated features has a countable
measurable version. The learner itself is independent of the data law. -/

@[expose] public section

namespace AgnosticVC

open MeasureTheory Set

variable {X : Type*} [MeasurableSpace X] [MeasurableEq X]
  {Y : Type*} [MeasurableSpace Y] {n : ℕ}

/-- Retain a labeled row precisely when its feature occurs on another row. -/
noncomputable def repeatedFeatureSample (z : Fin n → X × Bool) (i : Fin n) : Option (X × Bool) := by
  classical
  exact if ∃ j : Fin n, i ≠ j ∧ (z i).1 = (z j).1 then some (z i) else none

/-- If all repeated features are atoms almost surely, every function of the
masked data has an iid measurable version. The hypothesis about repeats
comes from independence and the measurable diagonal. -/
private theorem aemeasurable_repeatedFeature_readout_of_atoms
    (D : Measure (X × Bool)) [IsProbabilityMeasure D]
    (hno : ∀ᵐ z ∂(Measure.pi fun _ : Fin n => D), ∀ i j : Fin n, i ≠ j →
      (D.map Prod.fst) {(z i).1} = 0 → (z i).1 ≠ (z j).1)
    (f : (Fin n → Option (X × Bool)) → Y) :
    AEMeasurable (fun z => f (repeatedFeatureSample z)) (Measure.pi fun _ => D) := by
  classical
  let M := D.map Prod.fst
  have hM : IsProbabilityMeasure M :=
    (Measure.isProbabilityMeasure_map_iff measurable_fst.aemeasurable).mpr inferInstance
  let B := {x : X | 0 < M {x}}
  have hB : B.Countable := Measure.countable_meas_pos_of_disjoint_iUnion
    (fun x : X => measurableSet_singleton x)
    (fun _ _ h => Set.disjoint_singleton.mpr h)
  let : Countable B := hB.to_subtype
  let C := Option (B × Bool)
  let : MeasurableSpace C := ⊤
  let : MeasurableSingletonClass C := ⟨fun _ => trivial⟩
  let R (i : Fin n) := {z : Fin n → X × Bool | ∃ j : Fin n, i ≠ j ∧ (z i).1 = (z j).1}
  have hR (i : Fin n) : MeasurableSet (R i) := by
    rw [show R i = ⋃ j : Fin n, {z : Fin n → X × Bool | i ≠ j} ∩ {z | (z i).1 = (z j).1} by
      ext z; simp [R]]
    exact MeasurableSet.iUnion fun j => (MeasurableSet.const _).inter
      (measurableSet_eq_fun (measurable_fst.comp (measurable_pi_apply i))
        (measurable_fst.comp (measurable_pi_apply j)))
  let code (z : Fin n → X × Bool) (i : Fin n) : C :=
    if h : (z i).1 ∈ B ∧ z ∈ R i then some (⟨(z i).1,h.1⟩,(z i).2) else none
  let decode (c : C) : Option (X × Bool) := c.map fun p => (p.1.val, p.2)
  have hcode (i : Fin n) : Measurable (fun z => code z i) := by
    apply measurable_to_countable'
    intro c
    cases c with
    | none =>
      rw [show (fun z => code z i) ⁻¹' {none} =
          ((fun z : Fin n → X × Bool => (z i).1) ⁻¹' B ∩ R i)ᶜ by
        ext z
        by_cases h : (z i).1 ∈ B ∧ z ∈ R i <;> simp [code, h]]
      exact (((measurable_fst.comp (measurable_pi_apply i)) hB.measurableSet).inter (hR i)).compl
    | some p =>
      rw [show (fun z => code z i) ⁻¹' {some p} =
          ((fun z : Fin n → X × Bool => z i) ⁻¹' {((p.1 : X),p.2)}) ∩ R i by
        ext z
        by_cases h : (z i).1 ∈ B ∧ z ∈ R i
        · simp only [mem_preimage, mem_singleton_iff, code, mem_inter_iff, h.1, h.2, and_true,
            dite_eq_left (show True from trivial)]
          rw [Option.some.injEq, Prod.ext_iff, Prod.ext_iff, Subtype.ext_iff]
        · constructor
          · simp [code, h]
          · rintro ⟨he,hr⟩
            have hp : z i = ((p.1 : X),p.2) := he
            exact (h ⟨by rw [hp]; exact p.1.property,hr⟩).elim]
      have hm : MeasurableSet ({((p.1 : X),p.2)} : Set (X × Bool)) := by
        rw [← singleton_prod_singleton]
        exact (measurableSet_singleton _).prod (measurableSet_singleton _)
      exact ((measurable_pi_apply i) hm).inter (hR i)
  let g (u : Fin n → C) := f (fun i => decode (u i))
  have hg : Measurable g := measurable_of_countable _
  have hcg : Measurable (g ∘ code) := hg.comp (Measurable.of_eval hcode)
  apply hcg.aemeasurable.congr
  filter_upwards [hno] with z hz
  apply congrArg f
  funext i
  unfold repeatedFeatureSample
  by_cases hr : z ∈ R i
  · have ha : (z i).1 ∈ B := by
      obtain ⟨j,hij,he⟩ := hr
      exact pos_iff_ne_zero.mpr (fun hn => hz i j hij hn he)
    have he : ∃ j : Fin n, i ≠ j ∧ (z i).1 = (z j).1 := hr
    simp [decode, code, ha, hr, he]
  · have hn : ¬ ∃ j : Fin n, i ≠ j ∧ (z i).1 = (z j).1 := hr
    simp [decode, code, hr, hn]

/-- Every readout of repeated labeled features is measurable after completion
under each iid law, using the same pointwise readout on every sample. -/
theorem aemeasurable_repeatedFeature_readout (D : Measure (X × Bool)) [IsProbabilityMeasure D]
    (f : (Fin n → Option (X × Bool)) → Y) :
    AEMeasurable (fun z => f (repeatedFeatureSample z)) (Measure.pi fun _ => D) :=
  aemeasurable_repeatedFeature_readout_of_atoms D (iid_no_repeat_at_null_singletons D n) f

omit [MeasurableEq X] in
/-- A fixed iid experiment cannot produce more hits on a null finite support
than its cardinality, simultaneously for every support. -/
private theorem iid_null_finiteSupport_hits_le_of_atoms {H : Type*} [DecidableEq X] (S : H → Finset X)
    (D : Measure (X × Bool))
    (hno : ∀ᵐ z ∂(Measure.pi fun _ : Fin n => D), ∀ i j : Fin n, i ≠ j →
      (D.map Prod.fst) {(z i).1} = 0 → (z i).1 ≠ (z j).1) :
    ∀ᵐ z ∂(Measure.pi fun _ : Fin n => D), ∀ h : H,
      (D.map Prod.fst) (S h : Set X) = 0 →
      (Finset.univ.filter (fun i : Fin n => (z i).1 ∈ S h)).card ≤ (S h).card := by
  classical
  filter_upwards [hno] with z hz
  intro h hh
  let I := Finset.univ.filter (fun i : Fin n => (z i).1 ∈ S h)
  have hinj : Set.InjOn (fun i : Fin n => (z i).1) (I : Set (Fin n)) := by
    intro i hi j hj he
    by_contra hij
    have hmem : (z i).1 ∈ S h := (Finset.mem_filter.mp hi).2
    have hnull := measure_mono_null
      (Set.singleton_subset_iff.mpr (show (z i).1 ∈ (S h : Set X) from hmem)) hh
    exact hz i j hij hnull he
  rw [← Finset.card_image_of_injOn hinj]
  apply Finset.card_le_card
  intro x hx
  obtain ⟨i, hi, rfl⟩ := Finset.mem_image.mp hx
  exact (Finset.mem_filter.mp hi).2

/-- Almost surely under an iid law, every null finite support is hit at most
as often as its cardinality, even for an uncountable family of supports. -/
theorem iid_null_finiteSupport_hits_le {H : Type*} [DecidableEq X] (S : H → Finset X)
    (D : Measure (X × Bool)) [IsProbabilityMeasure D] :
    ∀ᵐ z ∂(Measure.pi fun _ : Fin n => D), ∀ h : H,
      (D.map Prod.fst) (S h : Set X) = 0 →
      (Finset.univ.filter (fun i : Fin n => (z i).1 ∈ S h)).card ≤ (S h).card :=
  iid_null_finiteSupport_hits_le_of_atoms S D (iid_no_repeat_at_null_singletons D n)

end AgnosticVC
