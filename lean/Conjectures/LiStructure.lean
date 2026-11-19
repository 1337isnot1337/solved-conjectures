import Conjectures.LiBasic
import Mathlib.Combinatorics.SimpleGraph.Metric

/-!
# Distances and branch vertices of Li's counterexample

The tabulated ranks in `LiBasic` equal the graph distance from vertex `0`.
Consequently, its two bipartition classes are the actual odd-distance and
even-distance classes. The complete set of vertices of degree greater than
two is `{0, 8}`, and vertex `8` has degree three.
-/

open SimpleGraph

namespace Li

private theorem rank_le_rank_add_walk_length {u v : Fin 31} (p : T.Walk u v) :
    rankOf u ≤ rankOf v + p.length := by
  induction p with
  | nil => simp
  | cons hadj p ih =>
    have hstep := rank_change _ _ hadj
    simp only [SimpleGraph.Walk.length_cons]
    omega

private theorem dist_zero_le_rank (v : Fin 31) : T.dist v 0 ≤ rankOf v := by
  have aux : ∀ n, ∀ v : Fin 31, rankOf v = n → T.dist v 0 ≤ rankOf v := by
    intro n
    induction n using Nat.strong_induction_on with
    | _ n ih =>
      intro v hv
      by_cases h0 : v = 0
      · subst v
        simp
      · have hlt := par_rank_all v h0
        have hp := ih (rankOf (parOf v)) (by omega) (parOf v) rfl
        have hstep := rank_change v (parOf v) (par_adj_all v h0)
        have hadj : T.dist v (parOf v) = 1 :=
          SimpleGraph.dist_eq_one_iff_adj.mpr (par_adj_all v h0)
        have htriangle := T_connected.dist_triangle (u := v) (v := parOf v) (w := 0)
        omega
  exact aux (rankOf v) v rfl

/-- The stored rank of each vertex is its actual graph distance from `0`. -/
theorem rankOf_eq_dist (v : Fin 31) : rankOf v = T.dist 0 v := by
  obtain ⟨p, hp⟩ := (reachable_zero v).exists_walk_length_eq_dist
  have hlower := rank_le_rank_add_walk_length p
  have hzero : rankOf (0 : Fin 31) = 0 := rfl
  rw [hzero, Nat.zero_add, hp] at hlower
  calc
    rankOf v = T.dist v 0 := Nat.le_antisymm hlower (dist_zero_le_rank v)
    _ = T.dist 0 v := SimpleGraph.dist_comm

/-- Vertex `8` has degree three. -/
theorem degree_eight : T.degree (8 : Fin 31) = 3 := by decide

/-- The only vertices of degree greater than two are `0` and `8`. -/
theorem branch_vertex_iff (v : Fin 31) : 2 < T.degree v ↔ v = 0 ∨ v = 8 := by
  revert v
  decide

/-- The complete branch-vertex set is `{0, 8}`. -/
theorem branch_vertices :
    (Finset.univ.filter (fun v : Fin 31 => 2 < T.degree v)) = {0, 8} := by
  ext v
  simp [branch_vertex_iff]

/-- Membership in side `A` means actual odd distance from `0`. -/
theorem mem_sideA_iff_dist_odd (v : Fin 31) : v ∈ sideA ↔ T.dist 0 v % 2 = 1 := by
  rw [mem_sideA_iff, rankOf_eq_dist]

/-- Membership in side `B` means actual even distance from `0`. -/
theorem mem_sideB_iff_dist_even (v : Fin 31) : v ∈ sideB ↔ T.dist 0 v % 2 = 0 := by
  rw [mem_sideB_iff, rankOf_eq_dist]

/-- The vertices at odd graph distance from `0`. -/
noncomputable def oddDistanceVertices : Finset (Fin 31) := by
  classical
  exact Finset.univ.filter (fun v => T.dist 0 v % 2 = 1)

/-- The vertices at even graph distance from `0`. -/
noncomputable def evenDistanceVertices : Finset (Fin 31) := by
  classical
  exact Finset.univ.filter (fun v => T.dist 0 v % 2 = 0)

/-- The odd-distance vertices are precisely the original side `A`. -/
theorem oddDistanceVertices_eq_sideA : oddDistanceVertices = sideA := by
  classical
  ext v
  simp [oddDistanceVertices, mem_sideA_iff_dist_odd]

/-- The even-distance vertices are precisely the original side `B`. -/
theorem evenDistanceVertices_eq_sideB : evenDistanceVertices = sideB := by
  classical
  ext v
  simp [evenDistanceVertices, mem_sideB_iff_dist_even]

/-- Exactly sixteen vertices are at odd distance from `0`. -/
theorem card_oddDistanceVertices : oddDistanceVertices.card = 16 := by
  rw [oddDistanceVertices_eq_sideA, card_sideA]

/-- Exactly fifteen vertices are at even distance from `0`. -/
theorem card_evenDistanceVertices : evenDistanceVertices.card = 15 := by
  rw [evenDistanceVertices_eq_sideB, card_sideB]

end Li
