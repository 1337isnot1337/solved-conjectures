import Conjectures.BraunBrueggeBicyclicEar
import Conjectures.BraunBrueggeBicyclicRank
import Conjectures.BraunBrueggeBicyclicThetaEmbedding
import Conjectures.BraunBrueggeBicyclicThetaReindex

/-! An open ear on a cycle gives the third path of a theta graph. The two
arcs of the cycle and the ear have disjoint interiors. -/

open scoped Fin.NatCast

namespace BraunBruegge

variable {V : Type*} {n : ℕ}

private def rotatedCycleLabel (f : Fin (n + 3) ↪ V) (r : Fin (n + 3)) (i : ℕ) : V :=
  f (r + (i : Fin (n + 3)))

private theorem rotatedCycleLabel_injective (f : Fin (n + 3) ↪ V) (r : Fin (n + 3))
    {i j : ℕ} (hi : i < n + 3) (hj : j < n + 3)
    (he : rotatedCycleLabel f r i = rotatedCycleLabel f r j) : i = j := by
  have hc := congrArg Fin.val (add_left_cancel (f.injective he))
  simpa only [Fin.val_natCast, Nat.mod_eq_of_lt hi, Nat.mod_eq_of_lt hj] using hc

private theorem rotatedCycleLabel_step (f : Fin (n + 3) ↪ V) (r : Fin (n + 3)) (i : ℕ) :
    ((SimpleGraph.cycleGraph (n + 3)).map f).Adj
      (rotatedCycleLabel f r i) (rotatedCycleLabel f r (i + 1)) := by
  unfold rotatedCycleLabel
  rw [Nat.cast_add, Nat.cast_one, ← add_assoc]
  exact (SimpleGraph.Embedding.map f _).map_rel_iff.mpr (cycle_next_adj _)

private def earThetaPaths {G : SimpleGraph V}
    (f : Fin (n + 3) ↪ V) (hF : (SimpleGraph.cycleGraph (n + 3)).map f ≤ G)
    (ear : GraphEar G ((SimpleGraph.cycleGraph (n + 3)).map f) (Set.range f))
    (hOpen : ear.start ≠ ear.finish) (r s : Fin (n + 3))
    (hr : f r = ear.start) (hs : f s = ear.finish) :
    ThetaPathWords G (thetaLengths (s - r).val (n + 3 - (s - r).val) ear.length) := by
  let N := n + 3
  let d := (s - r).val
  let length := thetaLengths d (N - d) ear.length
  let rot := rotatedCycleLabel f r
  have hd : d < N := (s - r).isLt
  have hdPos : 0 < d := by
    by_contra! hn
    have hZero : s - r = 0 := Fin.ext (by exact Nat.eq_zero_of_le_zero hn)
    have hEq : s = r := sub_eq_zero.mp hZero
    exact hOpen (hr.symm.trans (congrArg f hEq.symm) |>.trans hs)
  have hr0 : rot 0 = ear.start := by simpa [rot, rotatedCycleLabel] using hr
  have hrN : rot N = ear.start := by simpa [rot, rotatedCycleLabel, N] using hr
  have hrd : rot d = ear.finish := by
    simpa [rot, rotatedCycleLabel, d, add_comm r] using hs
  have hRange (i : ℕ) : rot i ∈ Set.range f := Set.mem_range_self _
  have hInj {i j : ℕ} (hi : i < N) (hj : j < N) (he : rot i = rot j) : i = j :=
    rotatedCycleLabel_injective f r hi hj he
  let word (p : Fin 3) (i : ℕ) := if p = 0 then rot i else if p = 1 then rot (N - i) else ear.vertex i
  refine {
    start := ear.start
    finish := ear.finish
    endpoints_ne := hOpen
    label := word
    label_zero := ?_
    label_last := ?_
    step_adj := ?_
    interior_ne_endpoints := ?_
    interior_injective := ?_ }
  · intro p
    fin_cases p
    · exact hr0
    · change rot (N - 0) = ear.start
      simpa only [Nat.sub_zero] using hrN
    · exact ear.vertex_zero
  · intro p
    fin_cases p
    · exact hrd
    · change rot (N - (N - d)) = ear.finish
      rw [show N - (N - d) = d by omega]
      exact hrd
    · exact ear.vertex_last
  · intro p i hi
    fin_cases p
    · exact hF (rotatedCycleLabel_step f r i)
    · change i < N - d at hi
      change G.Adj (rot (N - i)) (rot (N - (i + 1)))
      have he : N - (i + 1) + 1 = N - i := by omega
      rw [← he]
      exact (hF (rotatedCycleLabel_step f r (N - (i + 1)))).symm
    · exact ear.step_adj hi
  · intro p i hi hj
    fin_cases p
    · change i < d at hj
      change rot i ≠ ear.start ∧ rot i ≠ ear.finish
      rw [← hr0, ← hrd]
      exact ⟨fun h => by have := hInj (by omega) (by omega) h; omega,
        fun h => by have := hInj (by omega) hd h; omega⟩
    · change i < N - d at hj
      change rot (N - i) ≠ ear.start ∧ rot (N - i) ≠ ear.finish
      rw [← hr0, ← hrd]
      exact ⟨fun h => by have := hInj (by omega) (by omega) h; omega,
        fun h => by have := hInj (by omega) hd h; omega⟩
    · change i < ear.length at hj
      change ear.vertex i ≠ ear.start ∧ ear.vertex i ≠ ear.finish
      exact ⟨fun h => ear.interior_outside hi hj (h.symm ▸ ear.start_mem),
        fun h => ear.interior_outside hi hj (h.symm ▸ ear.finish_mem)⟩
  · intro p q i j hi hi' hj hj' he
    fin_cases p <;> fin_cases q
    · change i < d at hi'
      change j < d at hj'
      exact ⟨rfl, hInj (by omega) (by omega) he⟩
    · change i < d at hi'
      change j < N - d at hj'
      have h : i = N - j := hInj (by omega) (by omega) he
      omega
    · change rot i = ear.vertex j at he
      exact (ear.interior_outside hj hj' (he ▸ hRange i)).elim
    · change i < N - d at hi'
      change j < d at hj'
      have h : N - i = j := hInj (by omega) (by omega) he
      omega
    · change i < N - d at hi'
      change j < N - d at hj'
      have h : N - i = N - j := hInj (by omega) (by omega) he
      exact ⟨rfl, by omega⟩
    · change rot (N - i) = ear.vertex j at he
      exact (ear.interior_outside hj hj' (he ▸ hRange (N - i))).elim
    · change ear.vertex i = rot j at he
      exact (ear.interior_outside hi hi' (he.symm ▸ hRange j)).elim
    · change ear.vertex i = rot (N - j) at he
      exact (ear.interior_outside hi hi' (he.symm ▸ hRange (N - j))).elim
    · exact ⟨rfl, ear.interior_injective ⟨hi, hi'⟩ ⟨hj, hj'⟩ he⟩

/-- An open ear and the original cycle account for every vertex and edge
of a bridgeless bicyclic graph, which therefore obeys the theta bound. -/
theorem open_ear_bicyclic_facet_bound [Fintype V] [DecidableEq V] [Nontrivial V]
    {G : SimpleGraph V} (hG : G.Connected) (hRank : Nat.card G.edgeSet = Nat.card V + 1)
    (hNoBridge : ∀ e ∈ G.edgeSet, ¬G.IsBridge e)
    (f : Fin (n + 3) ↪ V) (hF : (SimpleGraph.cycleGraph (n + 3)).map f ≤ G)
    (ear : GraphEar G ((SimpleGraph.cycleGraph (n + 3)).map f) (Set.range f))
    (hOpen : ear.start ≠ ear.finish) :
    Nat.card {F // IsFacet G F} ≤ wedgeBenchmark (Nat.card G.edgeSet) := by
  classical
  obtain ⟨r, hr⟩ := ear.start_mem
  obtain ⟨s, hs⟩ := ear.finish_mem
  let N := n + 3
  let d := (s - r).val
  let length := thetaLengths d (N - d) ear.length
  let rot := rotatedCycleLabel f r
  have hd : d < N := (s - r).isLt
  have hdPos : 0 < d := by
    by_contra! hn
    have hZero : s - r = 0 := Fin.ext (by exact Nat.eq_zero_of_le_zero hn)
    have hEq : s = r := sub_eq_zero.mp hZero
    exact hOpen (hr.symm.trans (congrArg f hEq.symm) |>.trans hs)
  have hPositive (p : Fin 3) : 0 < length p := by
    fin_cases p
    · exact hdPos
    · change 0 < N - d
      omega
    · exact ear.positive
  have hrd : rot d = ear.finish := by
    simpa [rot, rotatedCycleLabel, d, add_comm r] using hs
  have hr0 : rot 0 = ear.start := by simpa [rot, rotatedCycleLabel] using hr
  have hrN : rot N = ear.start := by simpa [rot, rotatedCycleLabel, N] using hr
  have hNoShortA (h : d = 1) (he : ear.length = 1) : False := by
    have e := rotatedCycleLabel_step f r 0
    change ((SimpleGraph.cycleGraph (n + 3)).map f).Adj (rot 0) (rot 1) at e
    rw [hr0, ← h, hrd] at e
    exact ear.single_edge_new he e
  have hNoShortB (h : N - d = 1) (he : ear.length = 1) : False := by
    have e := rotatedCycleLabel_step f r d
    change ((SimpleGraph.cycleGraph (n + 3)).map f).Adj (rot d) (rot (d + 1)) at e
    rw [show d + 1 = N by omega, hrd, hrN] at e
    exact ear.single_edge_new he e.symm
  have hShort (p q : Fin 3) (hp : length p = 1) (hq : length q = 1) : p = q := by
    fin_cases p <;> fin_cases q
    · rfl
    · change d = 1 at hp
      change N - d = 1 at hq
      dsimp [N] at *
      omega
    · exact (hNoShortA hp hq).elim
    · change N - d = 1 at hp
      change d = 1 at hq
      dsimp [N] at *
      omega
    · rfl
    · exact (hNoShortB hp hq).elim
    · exact (hNoShortA hq hp).elim
    · exact (hNoShortB hq hp).elim
    · rfl
  let words := earThetaPaths f hF ear hOpen r s hr hs
  have hTheta := thetaGraph_connected hPositive
  have hCardV := theta_vertex_card_add_one hPositive
  have hCardE := theta_edge_card hShort
  rw [← Nat.card_eq_fintype_card, Fin.sum_univ_three] at hCardV
  rw [Fin.sum_univ_three] at hCardE
  change Nat.card (ThetaVertex length) + 1 = d + (N - d) + ear.length at hCardV
  change Nat.card (thetaGraph length).edgeSet = d + (N - d) + ear.length at hCardE
  have hModelRank : Nat.card (thetaGraph length).edgeSet + Nat.card V =
      Nat.card G.edgeSet + Nat.card (ThetaVertex length) := by omega
  let iso := iso_of_equal_rank_of_no_bridges hG hTheta words.embedding words.embedding_le hModelRank hNoBridge
  let _ : Nontrivial (ThetaVertex length) := ⟨⟨thetaStart, thetaFinish, by simp [thetaStart, thetaFinish]⟩⟩
  rw [← facet_card_relabel iso hTheta thetaStart, ← Nat.card_congr iso.mapEdgeSet, hCardE]
  exact theta_facets_le_wedge d (N - d) ear.length (hPositive 0) (hPositive 1) ear.positive hShort

end BraunBruegge
