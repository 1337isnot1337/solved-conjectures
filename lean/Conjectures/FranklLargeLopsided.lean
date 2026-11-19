module

public import Conjectures.FranklLargeNeighbors
public import Conjectures.FranklLopsided
public import Conjectures.FranklLopsidedCoordinates

/-! The lopsided dependency property for the actual omitted but covered
generator events, derived from Harris-Kleitman and an explicit coordinate
bijection. -/

@[expose] public section

namespace Frankl.Large

open Finset

variable {α ι : Type*} [DecidableEq α] [Fintype ι] [DecidableEq ι]

def avoidingNeighbors (G : ι → Finset α) (e : ι) (T : Finset ι)
    (o : Finset (Lopsided.Coordinates.Exterior e (neighbors G e))) :
    Finset (Finset (Lopsided.Coordinates.Local (neighbors G e))) :=
  univ.filter fun n => ∀ f ∈ T,
    ¬ Bad G f (Lopsided.Coordinates.join e (neighbors G e) ⟨o, false, n⟩)

theorem coveringNeighbors_isUpper (G : ι → Finset α) (e : ι) :
    IsUpperSet (coveringNeighbors G e : Set (Finset _)) := by
  intro n m hnm hn
  simp only [coveringNeighbors, mem_coe, mem_filter, mem_univ, true_and] at hn ⊢
  exact hn.trans (generated_mono G (map_subset_map.mpr hnm))

theorem avoidingNeighbors_isLower (G : ι → Finset α) (e : ι) (T : Finset ι)
    (hT : Disjoint T (neighbors G e))
    (o : Finset (Lopsided.Coordinates.Exterior e (neighbors G e))) :
    IsLowerSet (avoidingNeighbors G e T o : Set (Finset _)) := by
  intro n m hnm hm
  simp only [avoidingNeighbors, mem_coe, mem_filter, mem_univ, true_and] at hm ⊢
  apply no_bad_antitone_on_neighbors G e T hT ?_ ?_ hm
  · change o.map _ ∪ n.map _ ⊆ o.map _ ∪ m.map _
    exact union_subset_union Subset.rfl (map_subset_map.mpr hnm)
  · intro f hf
    obtain ⟨hft, hfs⟩ := mem_sdiff.mp hf
    change f ∈ o.map _ ∪ m.map _ at hft
    rcases mem_union.mp hft with hfo | hfm
    · exact False.elim (hfs (mem_union_left _ hfo))
    · exact property_of_mem_map_subtype m hfm

theorem bad_join_iff (G : ι → Finset α) (e : ι)
    (z : Lopsided.Coordinates.Slice e (neighbors G e)) :
    Bad G e (Lopsided.Coordinates.join e (neighbors G e) z) ↔
      z.2.1 = false ∧ z.2.2 ∈ coveringNeighbors G e := by
  rcases z with ⟨o, b, n⟩
  cases b with
  | false =>
    have hen : e ∉ localSelection G e n :=
      notMem_map_subtype_of_not_property _ (self_not_mem_neighbors G e)
    have hagree : ∀ f ∈ eventSupport G e,
        f ∈ Lopsided.Coordinates.join e (neighbors G e) ⟨o, false, n⟩ ↔
          f ∈ localSelection G e n := by
      intro f hf
      have hfo : f ∉ o.map (Function.Embedding.subtype _) := by
        intro h
        exact property_of_mem_map_subtype o h hf
      simp only [Lopsided.Coordinates.join, Bool.false_eq_true, if_false,
        mem_union, hfo, false_or, localSelection]
    have h := bad_iff_of_agree_on_support G e hagree
    simpa only [Bad, hen, not_false_eq_true, true_and, coveringNeighbors,
      mem_filter, mem_univ] using h
  | true =>
    have hei := (Lopsided.Coordinates.center_mem_join e (neighbors G e)
      (self_not_mem_neighbors G e) ⟨o, true, n⟩).mpr rfl
    simp [Bad, hei]

theorem avoids_join_iff (G : ι → Finset α) (e : ι) (T : Finset ι)
    (he : e ∉ T) (hT : Disjoint T (neighbors G e))
    (z : Lopsided.Coordinates.Slice e (neighbors G e)) :
    (∀ f ∈ T, ¬ Bad G f (Lopsided.Coordinates.join e (neighbors G e) z)) ↔
      z.2.2 ∈ avoidingNeighbors G e T z.1 := by
  rcases z with ⟨o, b, n⟩
  cases b with
  | false => simp [avoidingNeighbors]
  | true =>
    simpa [Lopsided.Coordinates.join, avoidingNeighbors] using
      no_bad_insert_center G e T
        (o.map (Function.Embedding.subtype _) ∪ n.map (Function.Embedding.subtype _)) he hT

theorem map_badEvent (G : ι → Finset α) (e : ι) :
    (badEvent G e).map
        (Lopsided.Coordinates.equiv e (neighbors G e) (self_not_mem_neighbors G e)).toEmbedding =
      Lopsided.sliceBad (β := Finset (Lopsided.Coordinates.Exterior e (neighbors G e)))
        (coveringNeighbors G e) := by
  ext z
  rw [mem_map_equiv, mem_badEvent]
  change Bad G e (Lopsided.Coordinates.join e (neighbors G e) z) ↔ _
  rw [bad_join_iff]
  rcases z with ⟨o, b, n⟩
  simp [Lopsided.sliceBad]

theorem map_nonneighbor_avoid (G : ι → Finset α) (e : ι) (T : Finset ι)
    (he : e ∉ T) (hT : Disjoint T (neighbors G e)) :
    (Lopsided.avoid (badEvent G) T).map
        (Lopsided.Coordinates.equiv e (neighbors G e) (self_not_mem_neighbors G e)).toEmbedding =
      Lopsided.sliceAvoid (avoidingNeighbors G e T) := by
  ext z
  simp only [mem_map_equiv, Lopsided.mem_avoid, mem_badEvent]
  change (∀ f ∈ T, ¬ Bad G f (Lopsided.Coordinates.join e (neighbors G e) z)) ↔ _
  rw [avoids_join_iff G e T he hT]
  rcases z with ⟨o, b, n⟩
  simp [Lopsided.sliceAvoid]

/-- The full nonneighbor-conditioning inequality, with a literal count of
local covering selections in its coefficient. -/
theorem nonneighbor_harris_card (G : ι → Finset α) (e : ι) (T : Finset ι)
    (he : e ∉ T) (hT : Disjoint T (neighbors G e)) :
    (2 * 2 ^ (neighbors G e).card) *
        (badEvent G e ∩ Lopsided.avoid (badEvent G) T).card ≤
      (coveringNeighbors G e).card * (Lopsided.avoid (badEvent G) T).card := by
  have h := Lopsided.sliced_harris_lopsided (coveringNeighbors G e)
    (avoidingNeighbors G e T) (coveringNeighbors_isUpper G e)
    (avoidingNeighbors_isLower G e T hT)
  have hbad := map_badEvent G e
  have hav := map_nonneighbor_avoid G e T he hT
  have hi : (badEvent G e ∩ Lopsided.avoid (badEvent G) T).card =
      (Lopsided.sliceBad (coveringNeighbors G e) ∩
        Lopsided.sliceAvoid (avoidingNeighbors G e T)).card := by
    rw [← hbad, ← hav, ← map_inter, card_map]
  have ha : (Lopsided.avoid (badEvent G) T).card =
      (Lopsided.sliceAvoid (avoidingNeighbors G e T)).card := by
    rw [← hav, card_map]
  simpa only [Lopsided.Coordinates.Local, Fintype.card_coe, ← hi, ← ha] using h

end Frankl.Large
