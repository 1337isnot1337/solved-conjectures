import Mathlib.Combinatorics.SimpleGraph.Connectivity.Connected
import Mathlib.Data.Nat.Find

/-! A proper embedded subgraph of a connected bridgeless graph has an ear:
an edge between existing vertices or a path whose interior is outside
the given vertex set. The path may return to its starting vertex. -/

open scoped Sym2

namespace BraunBruegge

variable {V W : Type*}

/-- An ear joining two vertices of an embedded graph. A closed ear has at
least three edges, and a one-edge ear is an edge outside the embedded graph. -/
structure GraphEar (G C : SimpleGraph V) (S : Set V) where
  start : V
  finish : V
  start_mem : start ∈ S
  finish_mem : finish ∈ S
  length : ℕ
  positive : 0 < length
  vertex : ℕ → V
  vertex_zero : vertex 0 = start
  vertex_last : vertex length = finish
  step_adj : ∀ ⦃i⦄, i < length → G.Adj (vertex i) (vertex (i + 1))
  interior_outside : ∀ ⦃i⦄, 0 < i → i < length → vertex i ∉ S
  interior_injective : Set.InjOn vertex {i | 0 < i ∧ i < length}
  closed_length : start = finish → 3 ≤ length
  single_edge_new : length = 1 → ¬C.Adj start finish

/-- Find an ear of a proper embedded graph by following the first return
after crossing its vertex boundary. If it is spanning, use a missing edge. -/
theorem exists_graph_ear [Nonempty W] {A : SimpleGraph W} {G : SimpleGraph V}
    (f : W ↪ V) (hG : G.Connected) (hle : A.map f ≤ G) (hne : A.map f ≠ G)
    (hNoBridge : ∀ e ∈ G.edgeSet, ¬G.IsBridge e) :
    Nonempty (GraphEar G (A.map f) (Set.range f)) := by
  classical
  let S := Set.range f
  change Nonempty (GraphEar G (A.map f) S)
  by_cases hSpan : S = Set.univ
  · obtain ⟨e, he, hnew⟩ := Set.exists_of_ssubset
      (SimpleGraph.edgeSet_strict_mono (lt_of_le_of_ne hle hne))
    induction e using Sym2.inductionOn with
    | hf a b =>
      have hab : G.Adj a b := he
      refine ⟨{
        start := a
        finish := b
        start_mem := by simp [hSpan]
        finish_mem := by simp [hSpan]
        length := 1
        positive := by omega
        vertex := fun i => if i = 0 then a else b
        vertex_zero := by simp
        vertex_last := by simp
        step_adj := fun {i} hi => by
          have hi' : i = 0 := by omega
          simpa [hi'] using hab
        interior_outside := fun {i} hi hlt => by omega
        interior_injective := fun _ ha _ _ => (Nat.not_lt_of_ge ha.1 ha.2).elim
        closed_length := fun ha => (hab.ne ha).elim
        single_edge_new := fun _ h => hnew h }⟩
  · obtain ⟨x, hx⟩ : ∃ x, x ∉ S := by simpa [Set.eq_univ_iff_forall] using hSpan
    let t := f (Classical.choice (inferInstance : Nonempty W))
    have ht : t ∈ S := Set.mem_range_self _
    obtain ⟨p⟩ := hG.preconnected t x
    obtain ⟨d, _, hd, hOut⟩ := p.exists_boundary_dart S ht hx
    have hAdj : G.Adj d.fst d.snd := d.adj
    have hDelete := hG.preconnected.connected_deleteEdges_of_not_isBridge
      (hNoBridge s(d.fst, d.snd) hAdj)
    obtain ⟨q, hq⟩ := hDelete.exists_isPath d.snd d.fst
    have hFound : ∃ k, q.getVert k ∈ S ∧ k ≤ q.length :=
      ⟨q.length, q.getVert_length.symm ▸ hd, le_rfl⟩
    let k := Nat.find hFound
    have hk := Nat.find_spec hFound
    have hkBound : k ≤ q.length := hk.2
    have hkPos : 0 < k := by
      by_contra! hz
      have hz' : k = 0 := by omega
      have hmem : q.getVert k ∈ S := hk.1
      rw [hz', q.getVert_zero] at hmem
      exact hOut hmem
    have hBefore (i : ℕ) (hi : i < k) : q.getVert i ∉ S := fun h =>
      Nat.find_min hFound hi ⟨h, hi.le.trans hkBound⟩
    let v (i : ℕ) := if i = 0 then d.fst else q.getVert (i - 1)
    refine ⟨{
      start := d.fst
      finish := q.getVert k
      start_mem := hd
      finish_mem := hk.1
      length := k + 1
      positive := by omega
      vertex := v
      vertex_zero := by simp [v]
      vertex_last := by simp [v]
      step_adj := ?_
      interior_outside := ?_
      interior_injective := ?_
      closed_length := ?_
      single_edge_new := by omega }⟩
    · intro i hi
      rcases i with _ | i
      · simp [v]
      · have hlt : i < q.length := by omega
        simpa [v, Nat.succ_eq_add_one, Nat.add_assoc] using
          (SimpleGraph.deleteEdges_adj.mp (q.adj_getVert_succ hlt)).1
    · intro i hi hlt
      simpa [v, hi.ne'] using hBefore (i - 1) (by omega)
    · intro i hi j hj h
      change 0 < i ∧ i < k + 1 at hi
      change 0 < j ∧ j < k + 1 at hj
      have hh : q.getVert (i - 1) = q.getVert (j - 1) := by
        simpa [v, hi.1.ne', hj.1.ne'] using h
      have hij := hq.getVert_injOn (x₁ := i - 1) (x₂ := j - 1)
        (show i - 1 ≤ q.length by omega) (show j - 1 ≤ q.length by omega) hh
      omega
    · intro hc
      by_contra! hs
      have hkOne : k = 1 := by omega
      have hstep : 0 < q.length := by omega
      have hside := (SimpleGraph.deleteEdges_adj.mp (q.adj_getVert_succ hstep)).2
      have hEnd : q.getVert 1 = d.fst := hkOne ▸ hc.symm
      rw [q.getVert_zero, hEnd, Sym2.eq_swap] at hside
      exact hside (Set.mem_singleton _)

end BraunBruegge
