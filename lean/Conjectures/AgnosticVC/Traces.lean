module

public import Mathlib.Combinatorics.SetFamily.Shatter
public import Mathlib.SetTheory.Cardinal.Order

/-! Realized traces of an arbitrary hypothesis class on sampled positions.
The positions may repeat the same feature. All representatives use one well-order. -/

@[expose] public section

namespace AgnosticVC

variable {H X I K : Type*} [Fintype I]

/-- The one-positions of a prediction trace. -/
noncomputable def sampleTrace (predict : H → X → Bool) (x : I → X) (h : H) : Finset I :=
  Finset.univ.filter (fun i => predict h (x i) = true)

@[simp] theorem mem_sampleTrace (predict : H → X → Bool) (x : I → X) (h : H) (i : I) :
    i ∈ sampleTrace predict x h ↔ predict h (x i) = true := by simp [sampleTrace]

/-- The family is finite regardless of the cardinality of the hypothesis class. -/
noncomputable def sampleFamily (predict : H → X → Bool) (x : I → X) : Finset (Finset I) := by
  classical
  exact Finset.univ.filter (fun v => ∃ h, sampleTrace predict x h = v)

theorem mem_sampleFamily {predict : H → X → Bool} {x : I → X} {v : Finset I} :
    v ∈ sampleFamily predict x ↔ ∃ h, sampleTrace predict x h = v := by
  classical
  simp [sampleFamily]

theorem sampleTrace_mem (predict : H → X → Bool) (x : I → X) (h : H) :
    sampleTrace predict x h ∈ sampleFamily predict x := mem_sampleFamily.mpr ⟨h, rfl⟩

/-- Usual upper bound on the VC dimension on the feature space itself. -/
def HasVCDimensionAtMost (predict : H → X → Bool) (d : ℕ) : Prop :=
  ∀ S : Finset X,
    (∀ t : Finset X, t ⊆ S → ∃ h, ∀ x ∈ S, predict h x = true ↔ x ∈ t) →
    S.card ≤ d

private theorem realizes_on [DecidableEq I] {predict : H → X → Bool} {x : I → X}
    {s : Finset I} (hs : (sampleFamily predict x).Shatters s) {t : Finset I} (ht : t ⊆ s) :
    ∃ h, ∀ i ∈ s, predict h (x i) = true ↔ i ∈ t := by
  obtain ⟨v, hv, hst⟩ := hs ht
  obtain ⟨h, rfl⟩ := mem_sampleFamily.mp hv
  refine ⟨h, fun i hi => ?_⟩
  rw [← hst, Finset.mem_inter, mem_sampleTrace, and_iff_right hi]

/-- A shattered set of sampled positions injects into the feature space. -/
theorem injOn_shattered_positions [DecidableEq I] {predict : H → X → Bool} {x : I → X}
    {s : Finset I} (hs : (sampleFamily predict x).Shatters s) : Set.InjOn x s := by
  intro i hi j hj hx
  obtain ⟨h, hh⟩ := realizes_on hs (Finset.singleton_subset_iff.mpr hi)
  have hp := (hh i hi).2 (Finset.mem_singleton_self i)
  rw [hx] at hp
  exact (Finset.mem_singleton.mp ((hh j hj).1 hp)).symm

theorem sampleFamily_vcDim_le [DecidableEq I] {predict : H → X → Bool}
    {d : ℕ} (hd : HasVCDimensionAtMost predict d) (x : I → X) :
    (sampleFamily predict x).vcDim ≤ d := by
  classical
  apply Finset.sup_le
  intro s hs
  have hsh := Finset.mem_shatterer.mp hs
  rw [← Finset.card_image_of_injOn (injOn_shattered_positions hsh)]
  apply hd
  intro t _
  let u := s.filter (fun i => x i ∈ t)
  obtain ⟨h, hh⟩ := realizes_on hsh (Finset.filter_subset _ s : u ⊆ s)
  refine ⟨h, ?_⟩
  intro y hy
  obtain ⟨i, hi, rfl⟩ := Finset.mem_image.mp hy
  simpa [u, hi] using hh i hi

/-- First actual hypothesis (in the fixed global well-order) realizing a trace. -/
noncomputable def canonicalRep (predict : H → X → Bool) (x : I → X)
    (v : {v // v ∈ sampleFamily predict x}) : H :=
  (WellOrderingRel.isWellOrder (α := H)).wf.min
    {h | sampleTrace predict x h = v.val} (mem_sampleFamily.mp v.property)

theorem canonicalRep_trace (predict : H → X → Bool) (x : I → X)
    (v : {v // v ∈ sampleFamily predict x}) :
    sampleTrace predict x (canonicalRep predict x v) = v.val :=
  (WellOrderingRel.isWellOrder (α := H)).wf.min_mem
    {h | sampleTrace predict x h = v.val} (mem_sampleFamily.mp v.property)

theorem canonicalRep_injective (predict : H → X → Bool) (x : I → X) :
    Function.Injective (canonicalRep predict x) := by
  intro v w hvw
  apply Subtype.ext
  rw [← canonicalRep_trace predict x v, ← canonicalRep_trace predict x w, hvw]

private theorem restrict_trace_eq [Fintype K] {predict : H → X → Bool} {x : I → X}
    {a b : H} (hab : sampleTrace predict x a = sampleTrace predict x b) (e : K → I) :
    sampleTrace predict (x ∘ e) a = sampleTrace predict (x ∘ e) b := by
  ext j
  simpa only [mem_sampleTrace, Function.comp_apply] using
    (show e j ∈ sampleTrace predict x a ↔ e j ∈ sampleTrace predict x b from hab ▸ Iff.rfl)

/-- Each canonical hypothesis on any sub-block also represents its full-block trace.
In particular dropping an example can only remove existing output names. -/
theorem canonicalRep_refinement [Fintype K] (predict : H → X → Bool) (x : I → X)
    (e : K → I) (v : {v // v ∈ sampleFamily predict (x ∘ e)}) :
    let h := canonicalRep predict (x ∘ e) v
    canonicalRep predict x ⟨sampleTrace predict x h, sampleTrace_mem predict x h⟩ = h := by
  let h := canonicalRep predict (x ∘ e) v
  change canonicalRep predict x ⟨sampleTrace predict x h, _⟩ = h
  apply (WellOrderingRel.isWellOrder (α := H)).wf.min_eq_of_forall_not_lt
    (s := {a | sampleTrace predict x a = sampleTrace predict x h}) (m := h) rfl
  intro a ha
  apply (WellOrderingRel.isWellOrder (α := H)).wf.not_lt_min
    {a | sampleTrace predict (x ∘ e) a = v.val}
  exact (restrict_trace_eq ha e).trans (canonicalRep_trace predict (x ∘ e) v)

end AgnosticVC
