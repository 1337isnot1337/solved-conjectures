module

public import Conjectures.FranklCyclicGenerators
public import Conjectures.FranklFamilyShortcuts

/-! Generator deletion and normalization in the shared family API. -/
@[expose] public section

namespace FranklSpanFour

open FranklLocal FranklCyclic

variable {α : Type*} [DecidableEq α]

def NeededGenerators (G : Finset (Finset α)) : Prop :=
  ∀ g ∈ G, g ∉ family (G.erase g)

theorem family_subset_of_generator_unions {G H : Finset (Finset α)}
    (h : G ⊆ family H) : family G ⊆ family H := by
  intro U hU
  apply mem_family_iff_covered.mpr
  intro x hx
  obtain ⟨g, hg, hgU, hxg⟩ := mem_family_iff_covered.mp hU x hx
  obtain ⟨A, hA, hAg, hxA⟩ := mem_family_iff_covered.mp (h hg) x hxg
  exact ⟨A, hA, hAg.trans hgU, hxA⟩

theorem family_erase_generated {G : Finset (Finset α)} {g : Finset α}
    (hg : g ∈ family (G.erase g)) : family (G.erase g) = family G := by
  apply Finset.Subset.antisymm (family_mono (Finset.erase_subset _ _))
  apply family_subset_of_generator_unions
  intro A hA
  by_cases hAg : A = g
  · simpa only [hAg] using hg
  · exact generator_mem_family (Finset.mem_erase.mpr ⟨hAg, hA⟩)

theorem exists_needed_generators (G : Finset (Finset α)) :
    ∃ H ⊆ G, family H = family G ∧ NeededGenerators H := by
  classical
  refine Finset.strongInductionOn G ?_
  intro G ih
  by_cases hneed : NeededGenerators G
  · exact ⟨G, Finset.Subset.refl _, rfl, hneed⟩
  · have hex : ∃ g ∈ G, g ∈ family (G.erase g) := by
      simpa only [NeededGenerators, not_forall, not_not, exists_prop] using hneed
    obtain ⟨g, hg, hred⟩ := hex
    obtain ⟨H, hHG, hH, hneedH⟩ := ih (G.erase g) (Finset.erase_ssubset hg)
    exact ⟨H, hHG.trans (Finset.erase_subset _ _),
      hH.trans (family_erase_generated hred), hneedH⟩

theorem needed_generator_nonempty {G : Finset (Finset α)}
    (hneed : NeededGenerators G) {g : Finset α} (hg : g ∈ G) : g.Nonempty := by
  by_contra hempty
  have heq : g = ∅ := Finset.not_nonempty_iff_eq_empty.mp hempty
  exact hneed g hg (heq ▸ empty_mem_family (G.erase ∅))

theorem distinct_triples_cover_four {A B g : Finset α}
    (hA : A.card = 3) (hB : B.card = 3) (hg : g.card = 4)
    (hAB : A ≠ B) (hAg : A ⊆ g) (hBg : B ⊆ g) : A ∪ B = g := by
  have hnot : ¬ B ⊆ A := by
    intro hBA
    exact hAB (Finset.eq_of_subset_of_card_le hBA (by omega)).symm
  have hstrict : A ⊂ A ∪ B := ssubset_iff_subset_not_subset.mpr
    ⟨Finset.subset_union_left, fun h => hnot (Finset.subset_union_right.trans h)⟩
  have hlt := Finset.card_lt_card hstrict
  exact Finset.eq_of_subset_of_card_le (Finset.union_subset hAg hBg) (by omega)

theorem needed_four_contains_at_most_one_triple {G : Finset (Finset α)}
    (hneed : NeededGenerators G) {A B g : Finset α}
    (hAG : A ∈ G) (hBG : B ∈ G) (hgG : g ∈ G)
    (hA : A.card = 3) (hB : B.card = 3) (hg : g.card = 4)
    (hAg : A ⊆ g) (hBg : B ⊆ g) : A = B := by
  by_contra hAB
  have hAne : A ≠ g := by intro h; rw [h] at hA; omega
  have hBne : B ≠ g := by intro h; rw [h] at hB; omega
  have hAF := generator_mem_family (Finset.mem_erase.mpr ⟨hAne, hAG⟩)
  have hBF := generator_mem_family (Finset.mem_erase.mpr ⟨hBne, hBG⟩)
  have hUF := union_mem_family hAF hBF
  rw [distinct_triples_cover_four hA hB hg hAB hAg hBg] at hUF
  exact hneed g hgG hUF

theorem small_generator_family_abundant {G : Finset (Finset α)} {g : Finset α}
    (hg : g ∈ G) (hne : g.Nonempty) (hsmall : g.card ≤ 2) :
    ∃ x ∈ g, Abundant (family G) x := by
  have hpos := Finset.card_pos.mpr hne
  have hcases : g.card = 1 ∨ g.card = 2 := by omega
  rcases hcases with hcard | hcard
  · obtain ⟨x, rfl⟩ := Finset.card_eq_one.mp hcard
    exact ⟨x, Finset.mem_singleton_self _, singleton_generator_abundant hg⟩
  · obtain ⟨x, y, _, rfl⟩ := Finset.card_eq_two.mp hcard
    rcases two_set_generator_abundance hg with hx | hy
    · exact ⟨x, Finset.mem_insert_self _ _, hx⟩
    · exact ⟨y, by simp, hy⟩

section Cycle

variable {n : ℕ} [NeZero n]

def SpanFourGenerators (G : Finset (Finset (ZMod n))) : Prop :=
  ∀ g ∈ G, ∃ p : ZMod n, ∃ R : Finset (Fin 4), tile p R = g

/-- After the singleton and pair shortcuts, every counterexample would have
an irredundant schedule in the four-shape alphabet and the same distinct unions. -/
theorem needed_normalized_schedule (G : Finset (Finset (ZMod n)))
    (hspan : SpanFourGenerators G) (hno : ∀ x, ¬ Abundant (family G) x) :
    ∃ H ⊆ G, family H = family G ∧ NeededGenerators H ∧
      (∀ h ∈ H, 3 ≤ h.card) ∧ generatedTiles (scheduleFor H) = H := by
  obtain ⟨H, hHG, hfamily, hneed⟩ := exists_needed_generators G
  have hlarge : ∀ h ∈ H, 3 ≤ h.card := by
    intro h hh
    by_contra hsmall
    obtain ⟨x, _, hx⟩ := small_generator_family_abundant hh
      (needed_generator_nonempty hneed hh) (by omega)
    rw [hfamily] at hx
    exact hno x hx
  refine ⟨H, hHG, hfamily, hneed, hlarge, ?_⟩
  exact generatedTiles_scheduleFor H (fun g hg => hspan g (hHG hg)) hlarge

end Cycle

end FranklSpanFour
