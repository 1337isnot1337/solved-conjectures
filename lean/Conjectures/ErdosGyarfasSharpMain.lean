import Conjectures.ErdosGyarfasSharpCertificate
import Conjectures.ErdosGyarfasSharpWitness
import Conjectures.ErdosGyarfasSharpCover
import Mathlib.Tactic.IntervalCases
import Mathlib.Tactic.NormNum

/-!
# The sharp connected 95-vertex abelian cover

The actual graph is a cyclic nineteen-sheeted cover of the displayed base graph,
is connected, has 95 vertices, and has a simple 32-cycle.
The kernel search certificates, transported by sheet translations, exclude
every actual simple cycle of length four, eight, or sixteen. Thus 32 is the
least power-of-two cycle length in this graph.
-/

namespace ErdosGyarfasSharp

/-- No simple cycle in the literal voltage graph has any of the three
forbidden lengths, regardless of its starting vertex or sheet. -/
theorem cycle_length_not_four_eight_sixteen {u : Vertex}
    (p : sharpGraph.Walk u u) (hp : p.IsCycle) :
    p.length ∉ ([4, 8, 16] : List ℕ) := by
  intro htarget
  rcases u with ⟨b, z⟩
  let e := sheetTranslation (-z)
  have hsafe : dfsSafe neighbors [4, 8, 16]
      (e (b, z)) (e (b, z)) [e (b, z)] 15 = true := by
    simpa only [e, sheetTranslation_neg_apply] using dfs_all_roots b
  have hbound : p.length - 1 ≤ 15 := by
    have hcases : p.length = 4 ∨ p.length = 8 ∨ p.length = 16 := by
      simpa using htarget
    rcases hcases with h | h | h <;> omega
  exact dfsSafe_excludes_cycle neighbors [4, 8, 16] sharpGraph
    (fun h => (adj_iff_mem_neighbors _ _).mp h) hsafe (p.map e.toHom)
    (hp.map e.injective)
    (by simpa only [SimpleGraph.Walk.length_map] using hbound)
    (by simpa only [SimpleGraph.Walk.length_map] using htarget)

/-- Every actual power-of-two cycle has length at least 32. -/
theorem power_of_two_cycle_length_ge32 {u : Vertex}
    (p : sharpGraph.Walk u u) (hp : p.IsCycle) (k : ℕ)
    (hlen : p.length = 2 ^ k) : 32 ≤ p.length := by
  by_cases hk : 5 ≤ k
  · rw [hlen]
    exact Nat.pow_le_pow_right (by decide : 0 < 2) hk
  · have hk' : k ≤ 4 := by omega
    have hmin := hp.three_le_length
    have hforbidden := cycle_length_not_four_eight_sixteen p hp
    interval_cases k <;> norm_num at hlen <;> simp_all

/-- The actual cycle lengths which are powers of two. -/
def powerOfTwoCycleLengths : Set ℕ :=
  {n | ∃ (k : ℕ) (v : Vertex) (p : sharpGraph.Walk v v),
    p.IsCycle ∧ p.length = n ∧ n = 2 ^ k}

/-- The sharpness claim is an attained minimum among actual simple cycles. -/
theorem least_power_of_two_cycle_length : IsLeast powerOfTwoCycleLengths 32 := by
  constructor
  · obtain ⟨v, p, hp, hlen⟩ := sharpGraph_has_cycle32
    exact ⟨5, v, p, hp, hlen, by decide⟩
  · rintro n ⟨k, v, p, hp, hlen, hpow⟩
    simpa only [hlen] using power_of_two_cycle_length_ge32 p hp k (hlen.trans hpow)

/-- The complete literal 95-vertex sharpness result. -/
theorem sharp95_connected_and_least_power_cycle :
    Nat.card Vertex = 95 ∧ sharpGraph.Connected ∧
      IsLeast powerOfTwoCycleLengths 32 :=
  ⟨nat_card_vertices, sharpGraph_connected, least_power_of_two_cycle_length⟩

/-- The graph belongs to the asserted cover class and attains the sharp bound. -/
theorem sharp95_cyclic_cover_and_least_power_cycle :
    SharpCyclic19Cover ∧ Nat.card Vertex = 95 ∧ sharpGraph.Connected ∧
      IsLeast powerOfTwoCycleLengths 32 :=
  ⟨sharpGraph_cyclic19_cover, sharp95_connected_and_least_power_cycle⟩

end ErdosGyarfasSharp
