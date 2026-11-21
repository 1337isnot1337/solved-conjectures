import Conjectures.CircularIndexConnected
import Conjectures.CircularIndexFinite31
import Conjectures.CircularIndexFinite33
import Mathlib.Tactic.IntervalCases

/-!
# Connectivity of the two additional regular circulants

The prime-order graph has only the trivial subgroup obstruction.  For the
33-vertex graph, the possible nontrivial subgroup indices are one, three,
and eleven, and the listed generators meet every required coset.
-/

namespace CircularIndex

open Finset Connectivity

theorem graph31_translationInvariant : TranslationInvariant graph31 := by
  intro t x y
  simp only [graph31, SimpleGraph.fromRel_adj, ne_eq, add_left_cancel_iff,
    add_sub_add_left_eq_sub]

theorem graph31_subgroup_dominates (H : AddSubgroup (ZMod 31)) (hH : H ≠ ⊥) :
    exterior graph31 (subgroupVertices H) = ∅ := by
  have hprod := cyclic_subgroup_card_product H
  have hdvd : H.index ∣ 31 := ⟨Nat.card H, hprod.symm⟩
  have hone : Nat.card H ≠ 1 := fun h => hH (AddSubgroup.card_eq_one.mp h)
  have hindex : H.index = 1 := by
    rcases (Nat.dvd_prime (by decide : Nat.Prime 31)).mp hdvd with h | h
    · exact h
    · rw [h] at hprod
      omega
  apply subgroup_dominates_of_coset_steps graph31_translationInvariant H
  intro r hr hri
  omega

theorem graph31_boundary_lower : BoundaryLowerBound graph31 18 := by
  apply boundary_lower_of_subgroup_dominates graph31_translationInvariant
  · rw [boundary_singleton_card, SimpleGraph.ncard_neighborSet]
    exact graph31_regular 0
  · exact graph31_subgroup_dominates

theorem graph31_vertex_connected (T : Finset (ZMod 31)) (hT : T.card < 18) :
    (graph31.induce (↑T : Set (ZMod 31))ᶜ).Connected := by
  apply induced_connected_of_boundary_lower graph31_boundary_lower (by simp [ZMod.card]) T hT

theorem graph33_translationInvariant : TranslationInvariant graph33 := by
  intro t x y
  simp only [graph33, SimpleGraph.fromRel_adj, ne_eq, add_left_cancel_iff,
    add_sub_add_left_eq_sub]

theorem factor_thirty_three (a b : ℕ) (ha : 0 < a) (hb : 2 ≤ b) (h : a * b = 33) :
    a = 1 ∨ a = 3 ∨ a = 11 := by
  have hbound := Nat.mul_le_mul_left a hb
  rw [h] at hbound
  have ha16 : a ≤ 16 := by omega
  interval_cases a <;> omega

theorem graph33_subgroup_dominates (H : AddSubgroup (ZMod 33)) (hH : H ≠ ⊥) :
    exterior graph33 (subgroupVertices H) = ∅ := by
  have hprod := cyclic_subgroup_card_product H
  have hpos : 0 < Nat.card H := Nat.card_pos
  have hone : Nat.card H ≠ 1 := fun h => hH (AddSubgroup.card_eq_one.mp h)
  have hcard : 2 ≤ Nat.card H := by omega
  have hindex := factor_thirty_three H.index (Nat.card H) (cyclic_subgroup_index_pos H) hcard hprod
  apply subgroup_dominates_of_coset_steps graph33_translationInvariant H
  intro r hr hri
  rcases hindex with hi | hi | hi
  · omega
  · have hcases : r = 1 ∨ r = 2 := by omega
    rcases hcases with rfl | rfl
    · exact ⟨1, by simp, by decide⟩
    · exact ⟨2, by simp, by decide⟩
  · have hrange : r ≤ 10 := by omega
    by_cases hr5 : r ≤ 5
    · refine ⟨(r : ZMod 33), by simp, ?_⟩
      interval_cases r <;> first | omega | decide
    · refine ⟨(r : ZMod 33) - 11, ?_, ?_⟩
      · have hm := H.neg_mem (cyclic_subgroup_index_cast_mem H)
        rw [hi] at hm
        convert hm using 1; abel
      · interval_cases r <;> first | omega | decide

theorem graph33_boundary_lower : BoundaryLowerBound graph33 24 := by
  apply boundary_lower_of_subgroup_dominates graph33_translationInvariant
  · rw [boundary_singleton_card, SimpleGraph.ncard_neighborSet]
    exact graph33_regular 0
  · exact graph33_subgroup_dominates

theorem graph33_vertex_connected (T : Finset (ZMod 33)) (hT : T.card < 24) :
    (graph33.induce (↑T : Set (ZMod 33))ᶜ).Connected := by
  apply induced_connected_of_boundary_lower graph33_boundary_lower (by simp [ZMod.card]) T hT

theorem graph31_complete :
    graph31.IsRegularOfDegree 18 ∧
    (∀ T : Finset (ZMod 31), T.card < 18 →
      (graph31.induce (↑T : Set (ZMod 31))ᶜ).Connected) ∧
    circularChromaticIndex graph31 = 93 / 5 :=
  ⟨graph31_regular, graph31_vertex_connected, graph31_circularChromaticIndex⟩

theorem graph33_complete :
    graph33.IsRegularOfDegree 24 ∧
    (∀ T : Finset (ZMod 33), T.card < 24 →
      (graph33.induce (↑T : Set (ZMod 33))ᶜ).Connected) ∧
    circularChromaticIndex graph33 = 99 / 4 :=
  ⟨graph33_regular, graph33_vertex_connected, graph33_circularChromaticIndex⟩

end CircularIndex
