module

public import Conjectures.FranklSmallCyclicFinite
public import Conjectures.FranklSmallCyclicPasch
public import Conjectures.FranklSpanFourReduction
public import Conjectures.FranklFCVaughan

@[expose] public section

/-! Frankl abundance for every nontrivial cyclic span-four generator family
on at most six sites. Every distinct generated union is counted once.
The proof combines the exhaustive finite tree with the proved elementary,
three-triple, and Pasch abundance theorems. -/

namespace FranklSmallCyclic

open Frankl FranklSpanFour

variable {α : Type*} [DecidableEq α]

theorem abundant_of_obstruction {G : Finset (Finset α)} (hG : G.Nonempty)
    (ho : Obstruction G) : ∃ x, Abundant (generatedUnions G) x := by
  rcases ho with hempty | htriple | htwo | hpasch
  · exact False.elim (hG.ne_empty hempty)
  · obtain ⟨A, B, C, p, hA, hB, hC, hcA, hcB, hcC,
      hAB, hAC, hBC, hpA, hpB, hpC⟩ := htriple
    obtain ⟨x, _, hx⟩ := Vaughan.three_generator_triples_abundant
      hA hB hC hcA hcB hcC hAB hAC hBC hpA hpB hpC
    exact ⟨x, hx⟩
  · obtain ⟨g, x, y, hg, hx, hy, hh⟩ := htwo
    rcases two_neighbor_generator_abundant hg hx hy hh with hab | hab
    · exact ⟨x, hab⟩
    · exact ⟨y, hab⟩
  · obtain ⟨f, hf⟩ := hpasch
    obtain ⟨i, hi⟩ := pasch_generators_abundant hf
    exact ⟨f i, hi⟩

theorem large_generator_abundance_le_six {n : ℕ} [NeZero n] (hn : n ≤ 6)
    {G : Finset (Finset (Fin n))} (hG : G.Nonempty)
    (hspan : CyclicSpanFour G) (hlarge : ∀ g ∈ G, 3 ≤ g.card) :
    ∃ x, Abundant (generatedUnions G) x :=
  abundant_of_obstruction hG (obstruction_le_six hn hspan hlarge)

/-- The literal small-cycle theorem, with no size restriction or minimality
assumption on its generators. Nontriviality excludes the family containing
only the empty union. -/
theorem cyclic_abundance_le_six {n : ℕ} [NeZero n] (hn : n ≤ 6)
    {G : Finset (Finset (Fin n))} (hspan : CyclicSpanFour G)
    (hG : ∃ g ∈ G, g.Nonempty) : ∃ x, Abundant (generatedUnions G) x := by
  classical
  by_contra hnot
  have hno : ∀ x, ¬ Abundant (generatedUnions G) x := fun x hx => hnot ⟨x, hx⟩
  obtain ⟨H, _, hfamily, _, hspanH, hlarge⟩ :=
    irredundant_large_cyclic_reduction G hspan hno
  have hH : H.Nonempty := by
    obtain ⟨g, hg, hgn⟩ := hG
    have hgf : g ∈ generatedUnions H := by
      rw [hfamily]
      exact generator_mem_generatedUnions hg
    by_contra h
    have he : H = ∅ := Finset.not_nonempty_iff_eq_empty.mp h
    have hzero : g = ∅ := by simpa [he, generatedUnions] using hgf
    exact hgn.ne_empty hzero
  obtain ⟨x, hx⟩ := large_generator_abundance_le_six hn hH hspanH hlarge
  rw [hfamily] at hx
  exact hno x hx

end FranklSmallCyclic
