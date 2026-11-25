import Conjectures.BraunBrueggeMinimumPolar

/-! For bipartite graphs every edge is tight at a normalized polar
vertex. This is the parity input for the equality case. -/

namespace BraunBruegge

variable {V : Type*} [Fintype V]

theorem tightGraph_eq_of_bipartition {G : SimpleGraph V} {root : V}
    (color : V → Bool) (hcolor : ∀ ⦃u v⦄, G.Adj u v → color u ≠ color v)
    {f : V → ℝ} (hf : f ∈ (polar G root).extremePoints ℝ) : tightGraph G f = G := by
  classical
  obtain ⟨hmem, hconnected⟩ := mem_extreme_polar_iff.mp hf
  choose z hz using int_label_of_mem_extreme_polar hf
  let parity (v : V) : ℤ := (z v + (if color v then 1 else 0)) % 2
  have hzedge {u v : V} (h : (tightGraph G f).Adj u v) : z u - z v = 1 ∨ z u - z v = -1 := by
    have he : |f u - f v| = 1 := h.2
    rw [hz u, hz v] at he
    by_cases hp : (0 : ℝ) ≤ (z u : ℝ) - z v
    · left
      rw [abs_of_nonneg hp] at he
      exact_mod_cast he
    · right
      rw [abs_of_neg (lt_of_not_ge hp)] at he
      have he' : (z u : ℝ) - z v = -1 := by linarith
      exact_mod_cast he'
  have hstep {u v : V} (he : (tightGraph G f).Adj u v) : parity u = parity v := by
    have hne := hcolor he.1
    have hdiff := hzedge he
    cases hu : color u <;> cases hv : color v <;> simp [hu, hv, parity] at hne ⊢ <;> omega
  ext u v
  constructor
  · exact fun h => h.1
  · intro he
    have hs := eq_of_reachable (G := tightGraph G f) parity (fun _ _ h => hstep h) (hconnected u v)
    have hne := hcolor he
    have hneq : z u ≠ z v := by
      intro heq
      cases hu : color u <;> cases hv : color v <;> simp [hu, hv, parity, heq] at hne hs <;> omega
    obtain ⟨hlo, hhi⟩ := abs_le.mp (hmem.2 he)
    rw [hz u, hz v] at hlo hhi
    have hlo' : (-1 : ℤ) ≤ z u - z v := by exact_mod_cast hlo
    have hhi' : z u - z v ≤ 1 := by exact_mod_cast hhi
    have hd : z u - z v = 1 ∨ z u - z v = -1 := by omega
    refine ⟨he, ?_⟩
    rw [hz u, hz v, ← Int.cast_sub]
    rcases hd with h | h <;> rw [h] <;> norm_num

end BraunBruegge
