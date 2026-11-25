import Conjectures.BraunBrueggeBicyclicCycleGeometry
import Conjectures.BraunBrueggeMinimumFacets

/-! A facet of the actual cycle polytope is a cyclic integer step sequence
with zero sum, unit bounds and at most one zero. -/

open Finset Set
open Fin.NatCast

namespace BraunBruegge

variable {n : ℕ}

@[ext]
structure CycleSteps (n : ℕ) where
  step : Fin (n + 3) → ℤ
  bound : ∀ i, |step i| ≤ 1
  sum_zero : ∑ i, step i = 0
  one_slack : ∀ i j, step i = 0 → step j = 0 → i = j

private theorem cycle_cast_value (i : Fin (n + 3)) : (Nat.cast i.val : Fin (n + 3)) = i := by
  apply Fin.ext
  rw [Fin.val_natCast, Nat.mod_eq_of_lt i.isLt]

private def CycleSteps.prefix (d : CycleSteps n) (k : ℕ) : ℤ :=
  ∑ j ∈ Finset.range k, d.step (Nat.cast j : Fin (n + 3))

@[simp] private theorem CycleSteps.prefix_zero (d : CycleSteps n) : d.prefix 0 = 0 := by
  simp [CycleSteps.prefix]

private theorem CycleSteps.prefix_full (d : CycleSteps n) : d.prefix (n + 3) = 0 := by
  rw [CycleSteps.prefix, ← Fin.sum_univ_eq_sum_range]
  simp only [cycle_cast_value]
  exact d.sum_zero

private theorem CycleSteps.prefix_step (d : CycleSteps n) (i : Fin (n + 3)) :
    d.prefix (i + 1).val - d.prefix i.val = d.step i := by
  have h : d.prefix (i.val + 1) = d.prefix i.val + d.step i := by
    simp only [CycleSteps.prefix, Finset.sum_range_succ, cycle_cast_value]
  by_cases hi : i.val + 1 < n + 3
  · rw [Fin.val_add_one_of_lt' hi, h, add_sub_cancel_left]
  · have he : i.val + 1 = n + 3 := by omega
    have hz : (i + 1).val = 0 := by rw [Fin.val_add, Fin.val_one, he, Nat.mod_self]
    rw [he, CycleSteps.prefix_full] at h
    rw [hz, CycleSteps.prefix_zero]
    omega

private noncomputable def CycleSteps.potential (d : CycleSteps n) (i : Fin (n + 3)) : ℝ :=
  d.prefix i.val

private theorem CycleSteps.potential_step (d : CycleSteps n) (i : Fin (n + 3)) :
    d.potential (i + 1) - d.potential i = d.step i := by
  unfold potential
  exact_mod_cast d.prefix_step i

private theorem CycleSteps.potential_vertex (d : CycleSteps n) :
    d.potential ∈ (polar (SimpleGraph.cycleGraph (n + 3)) 0).extremePoints ℝ := by
  apply mem_extreme_polar_iff.mpr
  refine ⟨⟨by simp [potential], ?_⟩, (tight_cycle_connected_iff d.potential).mpr ?_⟩
  · intro u v he
    rcases cycle_adj_step.mp he with he | he
    · subst v
      rw [abs_sub_comm, potential_step]
      exact_mod_cast d.bound u
    · subst u
      rw [potential_step]
      exact_mod_cast d.bound v
  · have hz (i : Fin (n + 3)) (h : |d.potential (i + 1) - d.potential i| ≠ 1) : d.step i = 0 := by
      rw [potential_step, ← Int.cast_abs] at h
      have hb := abs_le.mp (d.bound i)
      rcases (show d.step i = -1 ∨ d.step i = 0 ∨ d.step i = 1 by omega) with he | he | he
      · exact (h (by norm_num [he])).elim
      · exact he
      · exact (h (by norm_num [he])).elim
    exact fun i j hi hj => d.one_slack i j (hz i hi) (hz j hj)

private abbrev CycleVertices (n : ℕ) := (polar (SimpleGraph.cycleGraph (n + 3)) 0).extremePoints ℝ

private noncomputable def cycleIntegerLabel (f : CycleVertices n) (i : Fin (n + 3)) : ℤ :=
  (int_label_of_mem_extreme_polar f.property i).choose

private theorem cycleIntegerLabel_spec (f : CycleVertices n) (i : Fin (n + 3)) :
    (cycleIntegerLabel f i : ℝ) = f.val i :=
  (int_label_of_mem_extreme_polar f.property i).choose_spec.symm

private noncomputable def cycleVertexSteps (f : CycleVertices n) : CycleSteps n where
  step i := cycleIntegerLabel f (i + 1) - cycleIntegerLabel f i
  bound i := by
    have h := f.property.1.2 (cycle_next_adj i).symm
    rw [← cycleIntegerLabel_spec f (i + 1), ← cycleIntegerLabel_spec f i] at h
    exact_mod_cast h
  sum_zero := by
    let e : Fin (n + 3) ≃ Fin (n + 3) :=
      ⟨fun i => i + 1, fun i => i - 1, by intro i; simp, by intro i; simp⟩
    rw [Finset.sum_sub_distrib]
    exact sub_eq_zero.mpr (Equiv.sum_comp e (cycleIntegerLabel f))
  one_slack i j hi hj := by
    apply (tight_cycle_connected_iff f.val).mp (mem_extreme_polar_iff.mp f.property).2 i j
    · rw [← cycleIntegerLabel_spec f (i + 1), ← cycleIntegerLabel_spec f i, ← Int.cast_sub, hi]
      norm_num
    · rw [← cycleIntegerLabel_spec f (j + 1), ← cycleIntegerLabel_spec f j, ← Int.cast_sub, hj]
      norm_num

private theorem cycleVertexSteps_cast (f : CycleVertices n) (i : Fin (n + 3)) :
    ((cycleVertexSteps f).step i : ℝ) = f.val (i + 1) - f.val i := by
  simp [cycleVertexSteps, cycleIntegerLabel_spec]

noncomputable def cyclePolarVerticesEquivSteps (n : ℕ) : CycleVertices n ≃ CycleSteps n := by
  apply Equiv.ofBijective cycleVertexSteps
  refine ⟨?_, ?_⟩
  · intro f g he
    have hstep (i : Fin (n + 3)) : f.val (i + 1) - f.val i = g.val (i + 1) - g.val i := by
      rw [← cycleVertexSteps_cast f, ← cycleVertexSteps_cast g, he]
    have hadj {u v : Fin (n + 3)} (h : (SimpleGraph.cycleGraph (n + 3)).Adj u v) :
        f.val u - g.val u = f.val v - g.val v := by
      rcases cycle_adj_step.mp h with he | he
      · subst v
        linarith [hstep u]
      · subst u
        linarith [hstep v]
    apply Subtype.ext
    funext v
    have h := eq_of_reachable (fun i => f.val i - g.val i) (fun _ _ e => hadj e)
      (SimpleGraph.connected_cycleGraph_add_one (n := n + 2) 0 v)
    rw [f.property.1.1, g.property.1.1, sub_self] at h
    linarith
  · intro d
    let f : CycleVertices n := ⟨d.potential, d.potential_vertex⟩
    refine ⟨f, CycleSteps.ext ?_⟩
    funext i
    apply Int.cast_inj (α := ℝ).mp
    rw [cycleVertexSteps_cast]
    exact d.potential_step i

theorem cycle_facet_card_eq_steps (n : ℕ) :
    Nat.card {F // IsFacet (SimpleGraph.cycleGraph (n + 3)) F} = Nat.card (CycleSteps n) := by
  have hn : Nontrivial (Fin (n + 3)) := Fintype.one_lt_card_iff_nontrivial.mp (by simp)
  rw [← Nat.card_congr (polarVerticesEquivFacets (SimpleGraph.connected_cycleGraph_add_one (n := n + 2)) 0)]
  exact Nat.card_congr (cyclePolarVerticesEquivSteps n)

end BraunBruegge
