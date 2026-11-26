import Conjectures.BraunBrueggeBicyclicFiniteCorrect
import Conjectures.BraunBrueggeBicyclicFiniteRows
import Conjectures.BraunBrueggeBicyclicMixedLarge
import Conjectures.BraunBrueggeBicyclicSameParity
import Conjectures.BraunBrueggeBicyclicThetaSize
import Conjectures.BraunBrueggeBicyclicWedgeAttainment

/-! The full mixed-parity comparison, including the exact finite base,
and the sharp benchmark witnesses. -/

open Finset

namespace BraunBruegge

theorem mixed_theta_facets_le_wedge (a b c : ℕ)
    (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) (hmin : 5 ≤ a + b + c)
    (hab : (a : ℤ) % 2 = (b : ℤ) % 2) (hac : (a : ℤ) % 2 ≠ (c : ℤ) % 2) :
    Nat.card {F // IsFacet (thetaGraph (thetaLengths a b c)) F} ≤ wedgeBenchmark (a + b + c) := by
  by_cases h : 144 ≤ a + b + c
  · exact (mixed_theta_facets_lt_wedge_large a b c ha hb hc h hab hac).le
  let l := a + b + c
  have hrow := mixedRows_checked l hmin (by omega)
  have hA : a + b < l := by omega
  have he : l - a - b = c := by omega
  have hp : a % 2 ≠ (l - a - b) % 2 := by rw [he]; omega
  have hc' := checkMixedAtTotal_sound l a b hrow ha hb hA (by omega) hp
  rwa [he, computedMixedFacetCount_eq a b c ha hb hc hab hac, computedWedgeCount_eq] at hc'

private theorem theta_short_lengths_pairwise (a b c : ℕ)
    (hs : ∀ i j, thetaLengths a b c i = 1 → thetaLengths a b c j = 1 → i = j) :
    ¬(a = 1 ∧ b = 1) ∧ ¬(a = 1 ∧ c = 1) ∧ ¬(b = 1 ∧ c = 1) := by
  exact ⟨fun h => (by decide : (0 : Fin 3) ≠ 1) (hs 0 1 h.1 h.2),
    fun h => (by decide : (0 : Fin 3) ≠ 2) (hs 0 2 h.1 h.2),
    fun h => (by decide : (1 : Fin 3) ≠ 2) (hs 1 2 h.1 h.2)⟩

theorem theta_facets_le_wedge_of_pair_parity (a b c : ℕ)
    (ha : 0 < a) (hb : 0 < b) (hc : 0 < c)
    (hshort : ∀ i j, thetaLengths a b c i = 1 → thetaLengths a b c j = 1 → i = j)
    (hab : (a : ℤ) % 2 = (b : ℤ) % 2) :
    Nat.card {F // IsFacet (thetaGraph (thetaLengths a b c)) F} ≤ wedgeBenchmark (a + b + c) := by
  obtain ⟨h₁, h₂, h₃⟩ := theta_short_lengths_pairwise a b c hshort
  by_cases hac : (a : ℤ) % 2 = (c : ℤ) % 2
  · exact (same_parity_theta_facets_lt_wedge a b c ha hb hc (by omega) hab hac).le
  · exact mixed_theta_facets_le_wedge a b c ha hb hc (by omega) hab hac

theorem theta_diamond_facet_card :
    Nat.card {F // IsFacet (thetaGraph (thetaLengths 2 2 1)) F} = 12 := by
  have he := computedMixedFacetCount_eq 2 2 1 (by decide) (by decide) (by decide) (by decide) (by decide)
  exact he.symm.trans (by decide +kernel)

theorem wedgeBenchmark_attained_all (l : ℕ) (hl : 5 ≤ l) :
    ∃ G : SimpleGraph (Fin (l - 1)), G.Connected ∧ Nat.card G.edgeSet = l ∧
      Nat.card {F // IsFacet G F} = wedgeBenchmark l := by
  by_cases h : 6 ≤ l
  · exact wedgeBenchmark_attained l h
  have he : l = 5 := by omega
  subst l
  let length := thetaLengths 2 2 1
  let G := thetaGraph length
  have hpos : ∀ i, 0 < length i := by decide +revert
  have hshort : ∀ i j, length i = 1 → length j = 1 → i = j := by decide +revert
  have hv : Fintype.card (ThetaVertex length) = 5 - 1 := by
    have hcard := theta_vertex_card_add_one hpos
    rw [Fin.sum_univ_three] at hcard
    change Fintype.card (ThetaVertex length) + 1 = 5 at hcard
    omega
  have hG : G.Connected := thetaGraph_connected hpos
  have hE : Nat.card G.edgeSet = 5 := by
    change Nat.card (thetaGraph length).edgeSet = 5
    rw [theta_edge_card hshort, Fin.sum_univ_three]
    rfl
  have hF : Nat.card {F // IsFacet G F} = wedgeBenchmark 5 := by
    change Nat.card {F // IsFacet (thetaGraph (thetaLengths 2 2 1)) F} = _
    rw [theta_diamond_facet_card, ← computedWedgeCount_eq]
    decide +kernel
  let : Nontrivial (ThetaVertex length) := ⟨⟨thetaStart, thetaFinish, by simp [thetaStart, thetaFinish]⟩⟩
  exact transport_attainment G hG _ _ _ hv hE hF

end BraunBruegge
