module

public import Mathlib.MeasureTheory.Constructions.UnitInterval
public import Mathlib.MeasureTheory.Measure.Regular
public import Mathlib.Topology.GDelta.Basic

import Mathlib.Order.Zorn

/-! A chain of null `Gδ` sets whose union has positive outer measure. -/

@[expose] public section

open MeasureTheory Set TopologicalSpace
open scoped ENNReal

namespace AgnosticVC

variable {X : Type*}

section Chain

variable [TopologicalSpace X] [MeasurableSpace X]

private theorem exists_nullGdelta_hull (μ : Measure X) [Measure.OuterRegular μ]
    {s : Set X} (hs : μ s = 0) : ∃ t, s ⊆ t ∧ IsGδ t ∧ μ t = 0 := by
  classical
  have hopen (n : ℕ) : ∃ u, s ⊆ u ∧ IsOpen u ∧ μ u < (n : ℝ≥0∞)⁻¹ :=
    s.exists_isOpen_lt_of_lt _ (by simp [hs])
  choose u hsu huopen hu using hopen
  refine ⟨⋂ n, u n, subset_iInter hsu, IsGδ.iInter_of_isOpen huopen, ?_⟩
  by_contra hne
  obtain ⟨n, hn⟩ := ENNReal.exists_inv_nat_lt hne
  exact (not_lt_of_ge (measure_mono (iInter_subset u n))) ((hu n).trans hn)

/-- A maximal chain of null `Gδ` sets cannot have null union. A null hull of
the union together with any point outside it would extend the chain. -/
theorem exists_nullGdelta_chain (μ : Measure X) [Measure.OuterRegular μ]
    [IsProbabilityMeasure μ] [NullSingletonClass μ] :
    ∃ C : Set (Set X), IsChain (· ⊆ ·) C ∧ (∀ s ∈ C, IsGδ s ∧ μ s = 0) ∧
      ∅ ∈ C ∧ μ (⋃₀ C) ≠ 0 := by
  classical
  let NullGδ := {s : Set X // IsGδ s ∧ μ s = 0}
  let empty : NullGδ := ⟨∅, IsGδ.empty, measure_empty⟩
  obtain ⟨F, hempty⟩ := Flag.exists_mem empty
  let C : Set (Set X) := Subtype.val '' (F : Set NullGδ)
  refine ⟨C, ?_, ?_, ⟨empty, hempty, rfl⟩, ?_⟩
  · rintro s ⟨a, ha, rfl⟩ t ⟨b, hb, rfl⟩ _
    exact F.chain_le.total ha hb
  · rintro _ ⟨s, _, rfl⟩
    exact s.property
  · intro hU
    have hproper : ⋃₀ C ≠ univ := by
      intro heq
      simp [heq] at hU
    obtain ⟨x, hx⟩ : ∃ x, x ∉ ⋃₀ C := by
      by_contra! h
      exact hproper (eq_univ_of_forall h)
    obtain ⟨t, hst, htG, ht0⟩ := exists_nullGdelta_hull μ
      (measure_union_null hU (measure_singleton x))
    let b : NullGδ := ⟨t, htG, ht0⟩
    have hb : ∀ a ∈ (F : Set NullGδ), a ≤ b := by
      intro a ha
      change a.val ⊆ t
      have haC : a.val ∈ C := ⟨a, ha, rfl⟩
      exact (subset_sUnion_of_mem haC).trans (subset_union_left.trans hst)
    have heq : (F : Set NullGδ) = insert b (F : Set NullGδ) :=
      F.max_chain' (F.chain_le.insert fun a ha _ => Or.inr (hb a ha)) (subset_insert _ _)
    have hbF : b ∈ (F : Set NullGδ) := heq.symm ▸ mem_insert b _
    have hxt : x ∈ t := hst (Or.inr (mem_singleton x))
    exact hx (mem_sUnion_of_mem hxt ⟨b, hbF, rfl⟩)

/-- The chain construction for uniform probability on the unit interval. -/
theorem exists_unitInterval_nullGdelta_chain :
    ∃ C : Set (Set unitInterval), IsChain (· ⊆ ·) C ∧
      (∀ s ∈ C, IsGδ s ∧ volume s = 0) ∧ ∅ ∈ C ∧ volume (⋃₀ C) ≠ 0 :=
  exists_nullGdelta_chain (volume : Measure unitInterval)

end Chain

variable {C : Set (Set X)}

section Coding

variable [TopologicalSpace X]

/-- Chosen sequence of open sets whose intersection is the hypothesis set. -/
noncomputable def nullChainOpen (hC : ∀ s ∈ C, IsGδ s) (h : C) : ℕ → Set X :=
  (hC h.val h.property).eq_iInter_nat.choose

private theorem isOpen_gdeltaOpen (hC : ∀ s ∈ C, IsGδ s) (h : C) (n : ℕ) :
    IsOpen (nullChainOpen hC h n) :=
  (hC h.val h.property).eq_iInter_nat.choose_spec.1 n

private theorem eq_iInter_gdeltaOpen (hC : ∀ s ∈ C, IsGδ s) (h : C) :
    h.val = ⋂ n, nullChainOpen hC h n :=
  (hC h.val h.property).eq_iInter_nat.choose_spec.2

/-- A code records the basis sets contained in each open set of the chosen sequence. -/
noncomputable def nullChainCode [SecondCountableTopology X] (hC : ∀ s ∈ C, IsGδ s)
    (h : C) (n : ℕ) (b : countableBasis X) : Bool := by
  classical
  exact decide (b.val ⊆ nullChainOpen hC h n)

private theorem mem_iff_nullChainCode [SecondCountableTopology X]
    (hC : ∀ s ∈ C, IsGδ s) (h : C) (x : X) :
    x ∈ h.val ↔ ∀ n : ℕ, ∃ b : countableBasis X, nullChainCode hC h n b = true ∧ x ∈ b.val := by
  classical
  nth_rw 1 [eq_iInter_gdeltaOpen hC h]
  simp only [mem_iInter]
  apply forall_congr'
  intro n
  constructor
  · intro hx
    obtain ⟨b, hb, hxb, hbo⟩ :=
      (isBasis_countableBasis X).exists_subset_of_mem_open hx (isOpen_gdeltaOpen hC h n)
    exact ⟨⟨b, hb⟩, by simp [nullChainCode, hbo], hxb⟩
  · rintro ⟨b, hb, hx⟩
    exact (show b.val ⊆ nullChainOpen hC h n by simpa [nullChainCode] using hb) hx

theorem injective_nullChainCode [SecondCountableTopology X] (hC : ∀ s ∈ C, IsGδ s) :
    Function.Injective (nullChainCode hC) := by
  intro h g heq
  apply Subtype.ext
  ext x
  rw [mem_iff_nullChainCode hC h, mem_iff_nullChainCode hC g, heq]

/-- The sigma-algebra on a family of `Gδ` sets induced by their chosen countable codes. -/
@[instance_reducible] noncomputable def nullChainMeasurableSpace [SecondCountableTopology X]
    (hC : ∀ s ∈ C, IsGδ s) :
    MeasurableSpace C :=
  MeasurableSpace.comap (nullChainCode hC) inferInstance

theorem measurableSingletonClass_nullChain [SecondCountableTopology X] (hC : ∀ s ∈ C, IsGδ s) :
    letI := nullChainMeasurableSpace hC
    MeasurableSingletonClass C := by
  let _ := nullChainMeasurableSpace hC
  refine ⟨fun h => ?_⟩
  have heq : nullChainCode hC ⁻¹' {nullChainCode hC h} = {h} := by
    ext g
    simp [(injective_nullChainCode hC).eq_iff]
  rw [← heq]
  exact (comap_measurable _) (measurableSet_singleton _)

end Coding

/-- The predictor associated to a set in the family is its Boolean indicator. -/
noncomputable def nullChainPredict (h : C) (x : X) : Bool := by
  classical
  exact decide (x ∈ h.val)

@[simp] theorem nullChainPredict_eq_true (h : C) (x : X) :
    nullChainPredict h x = true ↔ x ∈ h.val := by
  classical
  simp [nullChainPredict]

theorem injective_nullChainPredict : Function.Injective (nullChainPredict (C := C)) := by
  intro h g heq
  apply Subtype.ext
  ext x
  rw [← nullChainPredict_eq_true h x, ← nullChainPredict_eq_true g x, heq]

/-- Evaluation is jointly measurable on the feature space and the coded family. -/
theorem measurable_nullChainPredict [TopologicalSpace X] [SecondCountableTopology X]
    [MeasurableSpace X] [BorelSpace X]
    (hC : ∀ s ∈ C, IsGδ s) :
    letI := nullChainMeasurableSpace hC
    Measurable (fun p : X × C => nullChainPredict p.2 p.1) := by
  classical
  let _ := nullChainMeasurableSpace hC
  apply measurable_to_bool
  have event_eq : (fun p : X × C => nullChainPredict p.2 p.1) ⁻¹' {true} =
      ⋂ n : ℕ, ⋃ b : countableBasis X,
        {p : X × C | nullChainCode hC p.2 n b = true} ∩ Prod.fst ⁻¹' b.val := by
    ext p
    change nullChainPredict p.2 p.1 = true ↔ _
    rw [nullChainPredict_eq_true, mem_iff_nullChainCode hC]
    simp only [mem_iInter, mem_iUnion, mem_inter_iff, mem_ofPred_eq, mem_preimage]
  rw [event_eq]
  refine MeasurableSet.iInter fun n => MeasurableSet.iUnion fun b => ?_
  apply MeasurableSet.inter
  · have hcode : Measurable (nullChainCode hC) := comap_measurable _
    have hcoordinate : Measurable (fun p : X × C => nullChainCode hC p.2 n b) :=
      ((measurable_pi_apply b).comp (measurable_pi_apply n)).comp
      (hcode.comp measurable_snd)
    exact hcoordinate (measurableSet_singleton true)
  · exact measurable_fst (isOpen_of_mem_countableBasis b.property).measurableSet

end AgnosticVC
