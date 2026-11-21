import Conjectures.CircularIndexSubgroups
import Conjectures.CircularIndexDegree
import Conjectures.CircularIndexFinite25

/-!
# Connectivity of the actual circulants

Deleting fewer than `4*g` vertices from the infinite-family graph leaves a
connected induced graph.  Deleting fewer than eighteen vertices from the
25-vertex construction has the same property.  The proof includes the atom
and subgroup arguments; no connectivity theorem is assumed as a hypothesis.
-/

namespace CircularIndex

open Finset Connectivity

theorem graph_translationInvariant (g : ℕ) : TranslationInvariant (graph g) := by
  intro t x y
  simpa only [add_comm t x, add_comm t y] using translate_adj_iff g x y t

theorem circulant_subgroup_dominates (g : ℕ) (hg : 2 ≤ g)
    (H : AddSubgroup (ZMod (order g))) (hH : H ≠ ⊥) :
    exterior (graph g) (subgroupVertices H) = ∅ := by
  have hcard : 5 ≤ Nat.card H := cyclic_subgroup_card_ge_five H hH
    (by simp only [order]; omega) (by simp only [order]; omega)
  have hsize := Nat.mul_le_mul_left H.index hcard
  rw [cyclic_subgroup_card_product H] at hsize
  have hsize' : H.index * 5 ≤ 6 * g + 1 := hsize
  have hindex : H.index ≤ 2 * g - 1 := by omega
  apply subgroup_dominates_of_coset_steps (graph_translationInvariant g) H
  intro r hr hri
  have hs : AllowedLength g r := by simp only [AllowedLength]; omega
  refine ⟨(r : ZMod (order g)), by simp, ?_⟩
  exact ⟨(length_cast_ne_zero g r hg hs).symm, r, hs, Or.inl (by simp)⟩

theorem boundary_singleton_card {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) (x : V) :
    (boundary G {x}).card = (G.neighborSet x).ncard := by
  classical
  have heq : (↑(boundary G {x}) : Set V) = G.neighborSet x := by
    ext v
    change v ∈ boundary G {x} ↔ G.Adj x v
    rw [mem_boundary]
    constructor
    · rintro ⟨_, a, ha, hav⟩
      simpa only [mem_singleton.mp ha] using hav
    · intro hxv
      exact ⟨by simpa only [mem_singleton] using hxv.ne.symm, x, by simp, hxv⟩
  rw [← heq]
  simp

theorem circulant_boundary_lower (g : ℕ) (hg : 2 ≤ g) :
    BoundaryLowerBound (graph g) (4 * g) := by
  apply boundary_lower_of_subgroup_dominates (graph_translationInvariant g)
  · rw [boundary_singleton_card, SimpleGraph.ncard_neighborSet]
    exact circulant_degree g hg 0
  · exact circulant_subgroup_dominates g hg

theorem circulant_vertex_connected (g : ℕ) (hg : 2 ≤ g)
    (T : Finset (ZMod (order g))) (hT : T.card < 4 * g) :
    ((graph g).induce (↑T : Set (ZMod (order g)))ᶜ).Connected := by
  apply induced_connected_of_boundary_lower (circulant_boundary_lower g hg) ?_ T hT
  rw [← Nat.card_eq_fintype_card]
  have hc : Nat.card (ZMod (order g)) = order g := by
    rw [Nat.card_eq_fintype_card, ZMod.card]
  rw [hc]
  change 4 * g < 6 * g + 1
  omega

theorem graph25_translationInvariant : TranslationInvariant graph25 := by
  intro t x y
  simp only [graph25, SimpleGraph.fromRel_adj, ne_eq, add_left_cancel_iff,
    add_sub_add_left_eq_sub]

theorem graph25_subgroup_dominates (H : AddSubgroup (ZMod 25)) (hH : H ≠ ⊥) :
    exterior graph25 (subgroupVertices H) = ∅ := by
  have hcard : 5 ≤ Nat.card H := cyclic_subgroup_card_ge_five H hH (by decide) (by decide)
  have hprod := cyclic_subgroup_card_product H
  have hsize := Nat.mul_le_mul_left H.index hcard
  rw [hprod] at hsize
  have hpos := cyclic_subgroup_index_pos H
  have hcases : H.index = 1 ∨ H.index = 2 ∨ H.index = 3 ∨ H.index = 4 ∨ H.index = 5 := by
    omega
  have hindex : H.index = 1 ∨ H.index = 5 := by
    rcases hcases with h | h | h | h | h
    · exact Or.inl h
    · rw [h] at hprod; omega
    · rw [h] at hprod; omega
    · rw [h] at hprod; omega
    · exact Or.inr h
  apply subgroup_dominates_of_coset_steps graph25_translationInvariant H
  intro r hr hri
  rcases hindex with hi | hi
  · omega
  · have hcases : r = 1 ∨ r = 2 ∨ r = 3 ∨ r = 4 := by omega
    rcases hcases with rfl | rfl | rfl | rfl
    · exact ⟨1, by simp, by decide⟩
    · exact ⟨2, by simp, by decide⟩
    · exact ⟨3, by simp, by decide⟩
    · refine ⟨9, ?_, by decide⟩
      have hm := cyclic_subgroup_index_cast_mem H
      rw [hi] at hm
      convert hm using 1; norm_num

theorem graph25_boundary_lower : BoundaryLowerBound graph25 18 := by
  apply boundary_lower_of_subgroup_dominates graph25_translationInvariant
  · rw [boundary_singleton_card, SimpleGraph.ncard_neighborSet]
    exact graph25_regular 0
  · exact graph25_subgroup_dominates

theorem graph25_vertex_connected (T : Finset (ZMod 25)) (hT : T.card < 18) :
    (graph25.induce (↑T : Set (ZMod 25))ᶜ).Connected := by
  apply induced_connected_of_boundary_lower graph25_boundary_lower (by simp [ZMod.card]) T hT

end CircularIndex
