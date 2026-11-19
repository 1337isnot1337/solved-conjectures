module

public import Conjectures.FranklBasic

@[expose] public section

/-! A union-closed family contains every nonempty generated union of its
members. This permits finite certificates to use the nonempty union closure
of a displayed base without requiring the empty set in the ambient family. -/

namespace Frankl

variable {α β : Type*} [DecidableEq α] [DecidableEq β]

theorem generatedUnion_mem_of_nonempty {family H : Finset (Finset α)}
    (hu : UnionClosed family) (hH : H ⊆ family) (hn : H.Nonempty) :
    generatedUnion H ∈ family := by
  revert hH hn
  induction H using Finset.induction_on with
  | empty =>
      intro _ hn
      obtain ⟨A, hA⟩ := hn
      exact False.elim (Finset.notMem_empty A hA)
  | @insert A H _ ih =>
      intro hH _
      have hA : A ∈ family := hH (Finset.mem_insert_self A H)
      by_cases hzero : H = ∅
      · subst H
        simpa [generatedUnion] using hA
      · have hsub : H ⊆ family := fun B hB => hH (Finset.mem_insert_of_mem hB)
        have hrest := ih hsub (Finset.nonempty_iff_ne_empty.mpr hzero)
        have h := hu A hA (generatedUnion H) hrest
        simpa only [generatedUnion, Finset.biUnion_insert, id_eq] using h

theorem generatedUnions_mem_of_ne_empty {family base : Finset (Finset α)}
    {U : Finset α} (hu : UnionClosed family) (hb : base ⊆ family)
    (hU : U ∈ generatedUnions base) (hne : U ≠ ∅) : U ∈ family := by
  obtain ⟨H, hH, rfl⟩ := mem_generatedUnions.mp hU
  have hn : H.Nonempty := by
    by_contra h
    have hzero : H = ∅ := Finset.not_nonempty_iff_eq_empty.mp h
    subst H
    exact hne (by simp)
  exact generatedUnion_mem_of_nonempty hu (hH.trans hb) hn

theorem image_generatedUnion (f : α → β) (H : Finset (Finset α)) :
    (generatedUnion H).image f = generatedUnion (H.image (Finset.image f)) := by
  simp only [generatedUnion, Finset.biUnion_image, Finset.image_biUnion, id_eq]

theorem image_mem_generatedUnions (f : α → β) {base : Finset (Finset α)}
    {U : Finset α} (hU : U ∈ generatedUnions base) :
    U.image f ∈ generatedUnions (base.image (Finset.image f)) := by
  obtain ⟨H, hH, rfl⟩ := mem_generatedUnions.mp hU
  apply mem_generatedUnions.mpr
  exact ⟨H.image (Finset.image f), Finset.image_subset_image hH,
    (image_generatedUnion f H).symm⟩

theorem embedded_nonempty_generated_mem (f : α → β)
    {family : Finset (Finset β)} {base : Finset (Finset α)} {U : Finset α}
    (hu : UnionClosed family) (hb : base.image (Finset.image f) ⊆ family)
    (hU : U ∈ generatedUnions base) (hne : U ≠ ∅) : U.image f ∈ family := by
  apply generatedUnions_mem_of_ne_empty hu hb (image_mem_generatedUnions f hU)
  intro h
  exact hne (Finset.image_eq_empty.mp h)

end Frankl
