module

public import Conjectures.FranklAbundance
public import Conjectures.FranklSpanFourShapes

/-! Reduction to an irredundant normalized generator collection. -/
@[expose] public section

namespace FranklSpanFour

open Frankl

variable {α : Type*} [DecidableEq α]

/-- Every retained generator is needed to generate the same family. -/
def Irredundant (G : Finset (Finset α)) : Prop :=
  ∀ g ∈ G, g ∉ generatedUnions (G.erase g)

theorem generatedUnions_subset_of_generators {G H : Finset (Finset α)}
    (h : G ⊆ generatedUnions H) : generatedUnions G ⊆ generatedUnions H := by
  intro U hU
  obtain ⟨K, hK, rfl⟩ := mem_generatedUnions.mp hU
  exact generatedUnion_mem_of_unionClosed (generatedUnions_union_closed H)
    (empty_mem_generatedUnions H) (hK.trans h)

theorem generatedUnions_erase_redundant {G : Finset (Finset α)} {g : Finset α}
    (hg : g ∈ generatedUnions (G.erase g)) :
    generatedUnions (G.erase g) = generatedUnions G := by
  apply Finset.Subset.antisymm (generatedUnions_mono (Finset.erase_subset _ _))
  apply generatedUnions_subset_of_generators
  intro A hA
  by_cases hAg : A = g
  · simpa only [hAg] using hg
  · exact generator_mem_generatedUnions (Finset.mem_erase.mpr ⟨hAg, hA⟩)

theorem exists_irredundant (G : Finset (Finset α)) :
    ∃ H ⊆ G, generatedUnions H = generatedUnions G ∧ Irredundant H := by
  classical
  refine Finset.strongInductionOn G ?_
  intro G ih
  by_cases hirr : Irredundant G
  · exact ⟨G, Finset.Subset.refl _, rfl, hirr⟩
  · have hex : ∃ g ∈ G, g ∈ generatedUnions (G.erase g) := by
      simpa only [Irredundant, not_forall, not_not, exists_prop] using hirr
    obtain ⟨g, hg, hred⟩ := hex
    obtain ⟨H, hHG, hH, hI⟩ := ih (G.erase g) (Finset.erase_ssubset hg)
    exact ⟨H, hHG.trans (Finset.erase_subset _ _),
      hH.trans (generatedUnions_erase_redundant hred), hI⟩

theorem irredundant_nonempty_generators {G : Finset (Finset α)}
    (hirr : Irredundant G) {g : Finset α} (hg : g ∈ G) : g.Nonempty := by
  by_contra hempty
  have heq : g = ∅ := Finset.not_nonempty_iff_eq_empty.mp hempty
  exact hirr g hg (heq ▸ empty_mem_generatedUnions (G.erase ∅))

theorem two_triples_cover_four {A B g : Finset α}
    (hA : A.card = 3) (hB : B.card = 3) (hg : g.card = 4)
    (hAB : A ≠ B) (hAg : A ⊆ g) (hBg : B ⊆ g) : A ∪ B = g := by
  have hnot : ¬ B ⊆ A := by
    intro hBA
    exact hAB (Finset.eq_of_subset_of_card_le hBA (by omega)).symm
  have hstrict : A ⊂ A ∪ B := by
    exact ssubset_iff_subset_not_subset.mpr
      ⟨Finset.subset_union_left, fun h => hnot (Finset.subset_union_right.trans h)⟩
  have hlt := Finset.card_lt_card hstrict
  exact Finset.eq_of_subset_of_card_le (Finset.union_subset hAg hBg) (by omega)

theorem irredundant_no_two_triples_in_four {G : Finset (Finset α)}
    (hirr : Irredundant G) {A B g : Finset α}
    (hAG : A ∈ G) (hBG : B ∈ G) (hgG : g ∈ G)
    (hA : A.card = 3) (hB : B.card = 3) (hg : g.card = 4)
    (hAB : A ≠ B) (hAg : A ⊆ g) (hBg : B ⊆ g) : False := by
  have hAne : A ≠ g := by intro h; rw [h] at hA; omega
  have hBne : B ≠ g := by intro h; rw [h] at hB; omega
  have hAF := generator_mem_generatedUnions (Finset.mem_erase.mpr ⟨hAne, hAG⟩)
  have hBF := generator_mem_generatedUnions (Finset.mem_erase.mpr ⟨hBne, hBG⟩)
  have hUF := generatedUnions_union_closed (G.erase g) A hAF B hBF
  rw [two_triples_cover_four hA hB hg hAB hAg hBg] at hUF
  exact hirr g hgG hUF

theorem small_generator_abundant {G : Finset (Finset α)} {g : Finset α}
    (hg : g ∈ G) (hne : g.Nonempty) (hsmall : g.card ≤ 2) :
    ∃ x ∈ g, Abundant (generatedUnions G) x := by
  have hpos := Finset.card_pos.mpr hne
  have hcases : g.card = 1 ∨ g.card = 2 := by omega
  rcases hcases with hcard | hcard
  · obtain ⟨x, rfl⟩ := Finset.card_eq_one.mp hcard
    exact ⟨x, Finset.mem_singleton_self _, singleton_generator_abundant hg⟩
  · obtain ⟨x, y, _, rfl⟩ := Finset.card_eq_two.mp hcard
    rcases pair_generator_abundant hg with hx | hy
    · exact ⟨x, Finset.mem_insert_self _ _, hx⟩
    · exact ⟨y, by simp, hy⟩

section Cycle

variable {n : ℕ} [NeZero n]

theorem cyclicSpanFour_mono {G H : Finset (Finset (Fin n))}
    (hG : CyclicSpanFour G) (hHG : H ⊆ G) : CyclicSpanFour H :=
  fun g hg => hG g (hHG hg)

/-- The same generated family has an irredundant cyclic generator set. -/
theorem irredundant_cyclic_reduction (G : Finset (Finset (Fin n)))
    (hspan : CyclicSpanFour G) :
    ∃ H ⊆ G, generatedUnions H = generatedUnions G ∧
      Irredundant H ∧ CyclicSpanFour H ∧ ∀ h ∈ H, h.Nonempty := by
  obtain ⟨H, hHG, hfamily, hirr⟩ := exists_irredundant G
  exact ⟨H, hHG, hfamily, hirr, cyclicSpanFour_mono hspan hHG,
    fun h hh => irredundant_nonempty_generators hirr hh⟩

theorem irredundant_large_cyclic_reduction (G : Finset (Finset (Fin n)))
    (hspan : CyclicSpanFour G)
    (hno : ∀ x, ¬ Abundant (generatedUnions G) x) :
    ∃ H ⊆ G, generatedUnions H = generatedUnions G ∧
      Irredundant H ∧ CyclicSpanFour H ∧ ∀ h ∈ H, 3 ≤ h.card := by
  obtain ⟨H, hHG, hfamily, hirr, hspanH, hnonempty⟩ :=
    irredundant_cyclic_reduction G hspan
  refine ⟨H, hHG, hfamily, hirr, hspanH, ?_⟩
  intro h hh
  by_contra hsmall
  obtain ⟨x, _, hx⟩ := small_generator_abundant hh (hnonempty h hh) (by omega)
  rw [hfamily] at hx
  exact hno x hx

end Cycle

end FranklSpanFour
