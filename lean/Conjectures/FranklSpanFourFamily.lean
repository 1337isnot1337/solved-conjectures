module

public import Conjectures.FranklAbundance
public import Conjectures.FranklFCClosure
public import Conjectures.FranklLocalWeights

/-! Relate a union-closed family, which may omit the empty set, to the
family of all unions of its chosen generators. -/
@[expose] public section

namespace FranklSpanFour

open FranklLocal

variable {α : Type*} [DecidableEq α]

theorem generated_family_eq_insert_empty {F G : Finset (Finset α)}
    (hu : Frankl.UnionClosed F) (hG : G ⊆ F) (hcover : F ⊆ family G) :
    family G = insert ∅ F := by
  ext U
  constructor
  · intro hU
    by_cases hz : U = ∅
    · exact Finset.mem_insert.mpr (Or.inl hz)
    · exact Finset.mem_insert_of_mem
        (Frankl.generatedUnions_mem_of_ne_empty hu hG hU hz)
  · intro hU
    rcases Finset.mem_insert.mp hU with rfl | hU
    · exact empty_mem_family G
    · exact hcover hU

theorem generated_family_eq_insert_empty_of_representations {F G : Finset (Finset α)}
    (hu : Frankl.UnionClosed F) (hG : G ⊆ F)
    (hcover : ∀ U ∈ F, ∃ H ⊆ G, unionOf H = U) :
    family G = insert ∅ F := by
  apply generated_family_eq_insert_empty hu hG
  intro U hU
  obtain ⟨H, hHG, hHU⟩ := hcover U hU
  exact Finset.mem_image.mpr ⟨H, Finset.mem_powerset.mpr hHG, hHU⟩

theorem nonempty_generator_of_nonempty_member {G : Finset (Finset α)} {U : Finset α}
    (hU : U ∈ family G) (hnonempty : U.Nonempty) : ∃ g ∈ G, g.Nonempty := by
  obtain ⟨x, hx⟩ := hnonempty
  obtain ⟨g, hg, _, hxg⟩ := mem_family_iff_covered.mp hU x hx
  exact ⟨g, hg, x, hxg⟩

/-- Adding the empty member changes the denominator but no point frequency;
an abundance witness for the larger family therefore works for the input. -/
theorem abundant_of_generated_eq_insert_empty {F G : Finset (Finset α)} {x : α}
    (hfamily : family G = insert ∅ F) (hx : Abundant (family G) x) : Abundant F x := by
  have hx' : Frankl.Abundant (insert ∅ F) x := by
    rw [← hfamily]
    exact hx
  exact Frankl.abundant_of_insert_empty hx'

end FranklSpanFour
