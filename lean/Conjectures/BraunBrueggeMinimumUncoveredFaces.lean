import Conjectures.BraunBrueggeMinimumMatchingModel
import Conjectures.BraunBrueggeMinimumMatchingFaces

/-! Independent tight-face choices for the uncovered vertices of an
oriented maximum matching. -/

open Set

namespace BraunBruegge
namespace IndexedMatching

variable {V M : Type*} {G : SimpleGraph V} (m : IndexedMatching G M)

def Anchored (u : m.Uncovered) : Prop :=
  ∃ i j : M, G.Adj u.val (m.low i) ∧ G.Adj (m.high j) u.val ∧ Relation.ReflTransGen m.Arc i j

private def fromUnanchored (j : M) : Prop :=
  ∃ u : m.Uncovered, ¬m.Anchored u ∧ ∃ i : M, G.Adj u.val (m.low i) ∧ Relation.ReflTransGen m.Arc i j

private theorem fromUnanchored_step {i j : M} (hi : m.fromUnanchored i) (he : m.Arc i j) :
    m.fromUnanchored j := by
  obtain ⟨u, h, k, hk, hr⟩ := hi
  exact ⟨u, h, k, hk, hr.tail he⟩

private theorem fromUnanchored_trans {i j : M} (hi : m.fromUnanchored i)
    (he : Relation.ReflTransGen m.Arc i j) : m.fromUnanchored j := by
  induction he with
  | refl => exact hi
  | tail _ he ih => exact m.fromUnanchored_step ih he

private theorem not_fromUnanchored_of_adj_high [Fintype M] (hm : m.IsMaximum)
    {u : m.Uncovered} {i : M} (h : G.Adj (m.high i) u.val) : ¬m.fromUnanchored i := by
  rintro ⟨v, hv, j, he, hp⟩
  by_cases hc : v = u
  · subst v
    exact hv ⟨j, i, he, h, hp⟩
  · exact no_alternating_path_between_unmatched m hm v.property u.property
      (fun e => hc (Subtype.ext e)) he h hp

private noncomputable def shift (i : M) : ℝ := by
  classical
  exact if m.fromUnanchored i then 1 else 0

private theorem shift_bounds (i : M) : 0 ≤ m.shift i ∧ m.shift i ≤ 1 := by
  unfold shift
  split_ifs <;> norm_num

private theorem shift_mono {i j : M} (h : m.Arc i j) : m.shift i ≤ m.shift j := by
  classical
  by_cases hi : m.fromUnanchored i
  · simp [shift, hi, m.fromUnanchored_step hi h]
  · simpa [shift, hi] using (m.shift_bounds j).1

private theorem shift_high_zero [Fintype M] (hm : m.IsMaximum) {u : m.Uncovered} {i : M}
    (h : G.Adj (m.high i) u.val) : m.shift i = 0 := by
  simp [shift, m.not_fromUnanchored_of_adj_high hm h]

private theorem shift_low_one {u : m.Uncovered} (hu : ¬m.Anchored u) {i : M}
    (h : G.Adj u.val (m.low i)) : m.shift i = 1 := by
  have hreach : m.fromUnanchored i := ⟨u, hu, i, h, Relation.ReflTransGen.refl⟩
  simp [shift, hreach]

private noncomputable def uncoveredLabel (b : m.Uncovered → Bool) (u : m.Uncovered) : ℝ := by
  classical
  exact if b u then (if m.Anchored u then 1 else 2) else 0

private noncomputable def rawLabel (b : m.Uncovered → Bool) : V → ℝ := m.label m.shift (m.uncoveredLabel b)

private theorem rawLabel_matched (b : m.Uncovered → Bool) (s t : M ⊕ M)
    (h : G.Adj (m.endpoints s) (m.endpoints t)) : |m.rawLabel b (m.endpoints s) - m.rawLabel b (m.endpoints t)| ≤ 1 := by
  apply abs_le.mpr
  cases s with
  | inl i =>
    cases t with
    | inl j =>
      change -1 ≤ m.rawLabel b (m.low i) - m.rawLabel b (m.low j) ∧
        m.rawLabel b (m.low i) - m.rawLabel b (m.low j) ≤ 1
      simp only [rawLabel, label_low]
      constructor <;> linarith [(m.shift_bounds i).1, (m.shift_bounds i).2,
        (m.shift_bounds j).1, (m.shift_bounds j).2]
    | inr j =>
      change -1 ≤ m.rawLabel b (m.low i) - m.rawLabel b (m.high j) ∧
        m.rawLabel b (m.low i) - m.rawLabel b (m.high j) ≤ 1
      simp only [rawLabel, label_low, label_high]
      have hmon := m.shift_mono (i := j) (j := i) h.symm
      constructor <;> linarith [(m.shift_bounds i).2, (m.shift_bounds j).1]
  | inr i =>
    cases t with
    | inl j =>
      change -1 ≤ m.rawLabel b (m.high i) - m.rawLabel b (m.low j) ∧
        m.rawLabel b (m.high i) - m.rawLabel b (m.low j) ≤ 1
      simp only [rawLabel, label_low, label_high]
      have hmon := m.shift_mono (i := i) (j := j) h
      constructor <;> linarith [(m.shift_bounds i).1, (m.shift_bounds j).2]
    | inr j =>
      change -1 ≤ m.rawLabel b (m.high i) - m.rawLabel b (m.high j) ∧
        m.rawLabel b (m.high i) - m.rawLabel b (m.high j) ≤ 1
      simp only [rawLabel, label_high]
      constructor <;> linarith [(m.shift_bounds i).1, (m.shift_bounds i).2,
        (m.shift_bounds j).1, (m.shift_bounds j).2]

private theorem rawLabel_uncovered_matched [Fintype M] (hm : m.IsMaximum) (b : m.Uncovered → Bool)
    (u : m.Uncovered) (s : M ⊕ M) (h : G.Adj u.val (m.endpoints s)) :
    |m.rawLabel b u.val - m.rawLabel b (m.endpoints s)| ≤ 1 := by
  classical
  cases s with
  | inl i =>
    change |m.rawLabel b u.val - m.rawLabel b (m.low i)| ≤ 1
    simp only [rawLabel, label_low, label_uncovered]
    by_cases hu : m.Anchored u
    · apply abs_le.mpr
      cases hb : b u <;> simp only [uncoveredLabel, hb, hu, Bool.false_eq_true, ite_false, ite_true] <;>
        constructor <;> linarith [(m.shift_bounds i).1, (m.shift_bounds i).2]
    · rw [m.shift_low_one hu h]
      cases hb : b u <;> norm_num [uncoveredLabel, hb, hu]
  | inr i =>
    change |m.rawLabel b u.val - m.rawLabel b (m.high i)| ≤ 1
    simp only [rawLabel, label_high, label_uncovered, m.shift_high_zero hm h.symm, zero_add]
    by_cases hu : m.Anchored u <;> cases hb : b u <;> norm_num [uncoveredLabel, hb, hu]

private theorem rawLabel_edge_bound [Fintype M] (hm : m.IsMaximum) (b : m.Uncovered → Bool)
    {v w : V} (h : G.Adj v w) : |m.rawLabel b v - m.rawLabel b w| ≤ 1 := by
  obtain ⟨v, rfl⟩ := m.endpointsEquiv.surjective v
  obtain ⟨w, rfl⟩ := m.endpointsEquiv.surjective w
  rcases v with s | u <;> rcases w with t | v
  · simp only [endpointsEquiv_inl] at h ⊢
    exact m.rawLabel_matched b s t h
  · simp only [endpointsEquiv_inl, endpointsEquiv_inr] at h ⊢
    rw [abs_sub_comm]
    exact m.rawLabel_uncovered_matched hm b v s h.symm
  · simp only [endpointsEquiv_inl, endpointsEquiv_inr] at h ⊢
    exact m.rawLabel_uncovered_matched hm b u t h
  · simp only [endpointsEquiv_inr] at h
    exact (unmatched_independent m hm u.property v.property h).elim

def pairEdges : Set (V × V) := Set.range fun i : M => (m.low i, m.high i)

private def onAnchoredPath (i j : M) : Prop :=
  m.Arc i j ∧ ∃ u : m.Uncovered, ∃ a z : M, G.Adj u.val (m.low a) ∧ G.Adj (m.high z) u.val ∧
    Relation.ReflTransGen m.Arc a i ∧ Relation.ReflTransGen m.Arc j z

private def anchorEdges : Set (V × V) :=
  {e | ∃ i j, m.onAnchoredPath i j ∧ e = (m.low j, m.high i)}

private structure AnchorEnds (u : m.Uncovered) where
  start : M
  finish : M
  start_adj : G.Adj u.val (m.low start)
  finish_adj : G.Adj (m.high finish) u.val
  path : Relation.ReflTransGen m.Arc start finish

private noncomputable def chooseAnchorEnds {u : m.Uncovered} (h : m.Anchored u) : m.AnchorEnds u :=
  Classical.choice (by
    obtain ⟨i, j, h₁, h₂, h₃⟩ := h
    exact ⟨⟨i, j, h₁, h₂, h₃⟩⟩)

private theorem zero_shift_at_anchor_start [Fintype M] (hm : m.IsMaximum) {u : m.Uncovered}
    {a z : M} (he : G.Adj (m.high z) u.val) (hp : Relation.ReflTransGen m.Arc a z) : m.shift a = 0 := by
  have hnot : ¬m.fromUnanchored a := fun e =>
    m.not_fromUnanchored_of_adj_high hm he (m.fromUnanchored_trans e hp)
  simp [shift, hnot]

private theorem both_shifts_zero_on_anchor [Fintype M] (hm : m.IsMaximum) {i j : M}
    (h : m.onAnchoredPath i j) : m.shift i = 0 ∧ m.shift j = 0 := by
  obtain ⟨e, u, _, z, _, h₂, _, hp⟩ := h
  exact ⟨m.zero_shift_at_anchor_start hm h₂ ((Relation.ReflTransGen.single e).trans hp),
    m.zero_shift_at_anchor_start hm h₂ hp⟩

private noncomputable def chooseNeighbor [Fintype M] [Nontrivial V]
    (hm : m.IsMaximum) (hG : G.Connected) (u : m.Uncovered) : M ⊕ M :=
  (m.exists_matched_neighbor hm hG u).choose

private theorem chooseNeighbor_adj [Fintype M] [Nontrivial V]
    (hm : m.IsMaximum) (hG : G.Connected) (u : m.Uncovered) :
    G.Adj u.val (m.endpoints (m.chooseNeighbor hm hG u)) :=
  (m.exists_matched_neighbor hm hG u).choose_spec

private theorem neighbor_label_of_unanchored [Fintype M] (hm : m.IsMaximum) {u : m.Uncovered}
    (hu : ¬m.Anchored u) (b : m.Uncovered → Bool) (s : M ⊕ M) (hs : G.Adj u.val (m.endpoints s)) :
    m.rawLabel b (m.endpoints s) = 1 := by
  cases s with
  | inl i =>
    change m.rawLabel b (m.low i) = 1
    simp only [rawLabel, label_low, m.shift_low_one hu hs]
  | inr i =>
    change m.rawLabel b (m.high i) = 1
    simp only [rawLabel, label_high, m.shift_high_zero hm hs.symm, zero_add]

private noncomputable def selectedEdge [Fintype M] [Nontrivial V] (hm : m.IsMaximum) (hG : G.Connected)
    (b : m.Uncovered → Bool) (u : m.Uncovered) : V × V := by
  classical
  exact if hu : m.Anchored u then
    let d := m.chooseAnchorEnds hu
    if b u then (m.low d.start, u.val) else (u.val, m.high d.finish)
  else
    let w := m.endpoints (m.chooseNeighbor hm hG u)
    if b u then (w, u.val) else (u.val, w)

private theorem selectedEdge_adj [Fintype M] [Nontrivial V] (hm : m.IsMaximum) (hG : G.Connected)
    (b : m.Uncovered → Bool) (u : m.Uncovered) :
    G.Adj (m.selectedEdge hm hG b u).1 (m.selectedEdge hm hG b u).2 := by
  classical
  by_cases hu : m.Anchored u
  · cases hbit : b u
    · simpa [selectedEdge, hu, hbit] using (m.chooseAnchorEnds hu).finish_adj.symm
    · simpa [selectedEdge, hu, hbit] using (m.chooseAnchorEnds hu).start_adj.symm
  · cases hbit : b u
    · simpa [selectedEdge, hu, hbit] using m.chooseNeighbor_adj hm hG u
    · simpa [selectedEdge, hu, hbit] using (m.chooseNeighbor_adj hm hG u).symm

private theorem selectedEdge_tight [Fintype M] [Nontrivial V] (hm : m.IsMaximum) (hG : G.Connected)
    (b : m.Uncovered → Bool) (u : m.Uncovered) :
    m.rawLabel b (m.selectedEdge hm hG b u).2 - m.rawLabel b (m.selectedEdge hm hG b u).1 = 1 := by
  classical
  by_cases hu : m.Anchored u
  · let d := m.chooseAnchorEnds hu
    have hstart := m.zero_shift_at_anchor_start hm d.finish_adj d.path
    have hfinish := m.shift_high_zero hm d.finish_adj
    cases hb : b u
    · simp [selectedEdge, hu, hb, rawLabel, uncoveredLabel, hfinish, d]
    · simp [selectedEdge, hu, hb, rawLabel, uncoveredLabel, hstart, d]
  · have h := m.neighbor_label_of_unanchored hm hu b _ (m.chooseNeighbor_adj hm hG u)
    cases hb : b u
    · simp only [selectedEdge, hu, dite_false, hb, Bool.false_eq_true, ite_false, h]
      norm_num [rawLabel, uncoveredLabel, hu, hb]
    · simp only [selectedEdge, hu, dite_false, hb, ite_true, h]
      norm_num [rawLabel, uncoveredLabel, hu, hb]

def uncoveredEdges [Fintype M] [Nontrivial V] (hm : m.IsMaximum) (hG : G.Connected)
    (b : m.Uncovered → Bool) : Set (V × V) := (m.pairEdges ∪ m.anchorEdges) ∪ Set.range (m.selectedEdge hm hG b)

theorem uncoveredEdges_adj [Fintype M] [Nontrivial V] (hm : m.IsMaximum) (hG : G.Connected)
    (b : m.Uncovered → Bool) : ∀ uv ∈ m.uncoveredEdges hm hG b, G.Adj uv.1 uv.2 := by
  rintro uv ((⟨i, rfl⟩ | ⟨i, j, h, rfl⟩) | ⟨u, rfl⟩)
  · exact m.edge i
  · exact h.1.symm
  · exact m.selectedEdge_adj hm hG b u

theorem uncoveredFace_nonempty [Fintype M] [Nontrivial V] (hm : m.IsMaximum) (hG : G.Connected)
    (root : V) (b : m.Uncovered → Bool) : (orientedEdgeFace G root (m.uncoveredEdges hm hG b)).Nonempty := by
  let f (v : V) := m.rawLabel b v - m.rawLabel b root
  have hdiff (u v : V) : f u - f v = m.rawLabel b u - m.rawLabel b v := by unfold f; ring
  refine ⟨f, ⟨by simp [f], ?_⟩, ?_⟩
  · intro u v he
    rw [hdiff]
    exact m.rawLabel_edge_bound hm b he
  · rintro uv ((⟨i, rfl⟩ | ⟨i, j, h, rfl⟩) | ⟨u, rfl⟩)
    · rw [hdiff]
      simp [rawLabel]
    · rw [hdiff]
      have hs := m.both_shifts_zero_on_anchor hm h
      simp [rawLabel, hs.1, hs.2]
    · rw [hdiff]
      exact m.selectedEdge_tight hm hG b u

theorem pair_edges_tight_of_mem_uncoveredFace [Fintype M] [Nontrivial V]
    (hm : m.IsMaximum) (hG : G.Connected) {root : V} {b : m.Uncovered → Bool} {f : V → ℝ}
    (hf : f ∈ orientedEdgeFace G root (m.uncoveredEdges hm hG b)) (i : M) :
    f (m.high i) - f (m.low i) = 1 :=
  hf.2 _ (Or.inl (Or.inl ⟨i, rfl⟩))

private theorem lows_eq_of_anchor [Fintype M] [Nontrivial V]
    (hm : m.IsMaximum) (hG : G.Connected) {root : V} {b : m.Uncovered → Bool} {f : V → ℝ}
    (hf : f ∈ orientedEdgeFace G root (m.uncoveredEdges hm hG b)) {u : m.Uncovered} (d : m.AnchorEnds u) :
    f (m.low d.start) = f (m.low d.finish) := by
  suffices ∀ k, Relation.ReflTransGen m.Arc d.start k → Relation.ReflTransGen m.Arc k d.finish →
      f (m.low d.start) = f (m.low k) from this _ d.path .refl
  intro k hpath
  induction hpath with
  | refl => intro _; rfl
  | @tail i j p e ih =>
    intro htail
    have he : m.onAnchoredPath i j := ⟨e, u, d.start, d.finish, d.start_adj, d.finish_adj, p, htail⟩
    have h1 : f (m.high i) - f (m.low j) = 1 := hf.2 _ (Or.inl (Or.inr ⟨i, j, he, rfl⟩))
    have h2 := m.pair_edges_tight_of_mem_uncoveredFace hm hG hf i
    exact (ih ((Relation.ReflTransGen.single e).trans htail)).trans (by linarith)

theorem uncoveredFaces_disjoint [Fintype M] [Nontrivial V]
    (hm : m.IsMaximum) (hG : G.Connected) {root : V} {b c : m.Uncovered → Bool} {f : V → ℝ}
    (hf : f ∈ orientedEdgeFace G root (m.uncoveredEdges hm hG b))
    (hg : f ∈ orientedEdgeFace G root (m.uncoveredEdges hm hG c)) : b = c := by
  classical
  funext u
  have ha := hf.2 (m.selectedEdge hm hG b u) (Or.inr ⟨u, rfl⟩)
  have hb := hg.2 (m.selectedEdge hm hG c u) (Or.inr ⟨u, rfl⟩)
  by_cases hu : m.Anchored u
  · let d := m.chooseAnchorEnds hu
    have he := m.lows_eq_of_anchor hm hG hf d
    have h := m.pair_edges_tight_of_mem_uncoveredFace hm hG hf d.finish
    simp only [d] at he h
    cases hbit : b u <;> cases hbit' : c u <;>
      simp [selectedEdge, hu, hbit, hbit'] at ha hb ⊢ <;> linarith
  · cases hbit : b u <;> cases hbit' : c u <;>
      simp [selectedEdge, hu, hbit, hbit'] at ha hb ⊢ <;> linarith

theorem exists_vertex_with_uncovered_choices [Fintype V] [Fintype M] [Nontrivial V]
    (hm : m.IsMaximum) (hG : G.Connected) (root : V) (b : m.Uncovered → Bool) :
    ∃ f ∈ orientedEdgeFace G root (m.uncoveredEdges hm hG b), f ∈ (polar G root).extremePoints ℝ :=
  exists_polar_vertex_of_nonempty_orientedEdgeFace hG root _ (m.uncoveredEdges_adj hm hG b)
    (m.uncoveredFace_nonempty hm hG root b)

end IndexedMatching
end BraunBruegge
