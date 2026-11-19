module

public import Conjectures.FranklLargeIncidence
public import Mathlib.Data.Fintype.Powerset

/-! Literal unions, canonical selections, and locality of the omitted but
covered generator events. -/

@[expose] public section

namespace Frankl.Large

open Finset

variable {α ι : Type*} [DecidableEq α]

def generated (G : ι → Finset α) (s : Finset ι) : Finset α := s.biUnion G

@[simp] theorem mem_generated (G : ι → Finset α) (s : Finset ι) (a : α) :
    a ∈ generated G s ↔ ∃ e ∈ s, a ∈ G e := by simp [generated]

theorem generated_mono (G : ι → Finset α) {s t : Finset ι} (hst : s ⊆ t) :
    generated G s ⊆ generated G t := by
  intro a ha
  obtain ⟨e, he, hae⟩ := (mem_generated G s a).mp ha
  exact (mem_generated G t a).mpr ⟨e, hst he, hae⟩

theorem generator_subset_generated (G : ι → Finset α) {s : Finset ι} {e : ι}
    (he : e ∈ s) : G e ⊆ generated G s := by
  intro a ha
  exact (mem_generated G s a).mpr ⟨e, he, ha⟩

/-- The event that a generator was omitted but all its points were covered. -/
def Bad (G : ι → Finset α) (e : ι) (s : Finset ι) : Prop :=
  e ∉ s ∧ G e ⊆ generated G s

instance [DecidableEq ι] (G : ι → Finset α) (e : ι) (s : Finset ι) : Decidable (Bad G e s) :=
  inferInstanceAs (Decidable (_ ∧ _))

/-- The selected indices are exactly the generators contained in their union. -/
def canonical (G : ι → Finset α) (s : Finset ι) : Prop :=
  ∀ e, e ∈ s ↔ G e ⊆ generated G s

theorem canonical_iff_no_bad (G : ι → Finset α) (s : Finset ι) :
    canonical G s ↔ ∀ e, ¬ Bad G e s := by
  classical
  constructor
  · intro h e hb
    exact hb.1 ((h e).mpr hb.2)
  · intro h e
    constructor
    · exact generator_subset_generated G
    · intro hcovered
      by_contra hnot
      exact h e ⟨hnot, hcovered⟩

variable [Fintype ι] [DecidableEq ι]

def badEvent (G : ι → Finset α) (e : ι) : Finset (Finset ι) :=
  univ.filter (Bad G e)

@[simp] theorem mem_badEvent (G : ι → Finset α) (e : ι) (s : Finset ι) :
    s ∈ badEvent G e ↔ Bad G e s := by simp [badEvent]

omit [DecidableEq ι] in
theorem point_absent_iff (G : ι → Finset α) (s : Finset ι) (a : α) :
    a ∉ generated G s ↔ Disjoint s (incident G a) := by
  rw [Finset.disjoint_left]
  simp only [mem_generated, not_exists, mem_incident, not_and]

omit [Fintype ι] in
theorem bad_of_enlargement (G : ι → Finset α) {s t : Finset ι} {e : ι}
    (hst : s ⊆ t) (henew : e ∉ t \ s) (hbad : Bad G e s) : Bad G e t := by
  constructor
  · intro het
    exact henew (mem_sdiff.mpr ⟨het, hbad.1⟩)
  · exact hbad.2.trans (generated_mono G hst)

/-- Agreement on the actual dependency support completely determines a bad
event, with no regularity or linearity assumptions. -/
theorem bad_iff_of_agree_on_support (G : ι → Finset α) (e : ι)
    {s t : Finset ι}
    (hagree : ∀ f ∈ eventSupport G e, f ∈ s ↔ f ∈ t) :
    Bad G e s ↔ Bad G e t := by
  have hsupp (a : α) (ha : a ∈ G e) (f : ι) (haf : a ∈ G f) :
      f ∈ eventSupport G e := by
    by_cases hfe : f = e
    · exact (mem_eventSupport G e f).mpr (Or.inl hfe)
    · exact (mem_eventSupport G e f).mpr
        (Or.inr ((mem_neighbors G e f).mpr ⟨hfe, a, mem_inter.mpr ⟨ha, haf⟩⟩))
  have hcover : G e ⊆ generated G s ↔ G e ⊆ generated G t := by
    constructor
    · intro hs a ha
      obtain ⟨f, hf, haf⟩ := (mem_generated G s a).mp (hs ha)
      exact (mem_generated G t a).mpr ⟨f, (hagree f (hsupp a ha f haf)).mp hf, haf⟩
    · intro ht a ha
      obtain ⟨f, hf, haf⟩ := (mem_generated G t a).mp (ht ha)
      exact (mem_generated G s a).mpr ⟨f, (hagree f (hsupp a ha f haf)).mpr hf, haf⟩
  have he := hagree e ((mem_eventSupport G e e).mpr (Or.inl rfl))
  exact and_congr (not_congr he) hcover

/-- Adding a generator outside an event's support leaves that event unchanged. -/
theorem bad_insert_outside (G : ι → Finset α) (e f : ι) (s : Finset ι)
    (hf : f ∉ eventSupport G e) : Bad G e (insert f s) ↔ Bad G e s := by
  apply bad_iff_of_agree_on_support
  intro j hj
  have hjf : j ≠ f := fun h => hf (h ▸ hj)
  simp [hjf]

/-- Nonneighbor-event avoidance decreases as the central event's neighbor
bits are switched on. This gives the lower families in the Harris slices. -/
theorem no_bad_antitone_on_neighbors (G : ι → Finset α) (e : ι) (T : Finset ι)
    (hT : Disjoint T (neighbors G e)) {s t : Finset ι}
    (hst : s ⊆ t) (hnew : t \ s ⊆ neighbors G e)
    (ht : ∀ f ∈ T, ¬ Bad G f t) : ∀ f ∈ T, ¬ Bad G f s := by
  intro f hf hb
  apply ht f hf
  apply bad_of_enlargement G hst ?_ hb
  intro hfn
  exact disjoint_left.mp hT hf (hnew hfn)

/-- The same nonneighbor avoidance is independent of the central generator's
own bit. -/
theorem no_bad_insert_center (G : ι → Finset α) (e : ι) (T s : Finset ι)
    (he : e ∉ T) (hT : Disjoint T (neighbors G e)) :
    (∀ f ∈ T, ¬ Bad G f (insert e s)) ↔ ∀ f ∈ T, ¬ Bad G f s := by
  have hfoutside (f : ι) (hf : f ∈ T) : e ∉ eventSupport G f := by
    intro hef
    rcases (mem_eventSupport G f e).mp hef with hef | hef
    · exact he (hef.symm ▸ hf)
    · exact disjoint_left.mp hT hf ((neighbors_symm G f e).mp hef)
  constructor
  · intro h f hf hb
    exact h f hf ((bad_insert_outside G f e s (hfoutside f hf)).mpr hb)
  · intro h f hf hb
    exact h f hf ((bad_insert_outside G f e s (hfoutside f hf)).mp hb)

end Frankl.Large
