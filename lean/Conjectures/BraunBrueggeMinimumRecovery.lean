import Conjectures.BraunBrueggeMinimumCrossing
import Mathlib.Combinatorics.SimpleGraph.Bipartite

/-! A strong matching orientation in a nonbipartite graph has two ways to
flip one endpoint and still obtain a connected binary crossing graph. -/

open Set

namespace BraunBruegge

variable {V M : Type*} {G : SimpleGraph V}

namespace IndexedMatching

variable (m : IndexedMatching G M)

structure RecoveryColor (s : M ⊕ M) where
  color : V → Bool
  agrees : m.AgreesOutside color s
  flips : color (m.endpoints s) ≠ endpointSide s
  connected : (crossingGraph G color).Connected

private noncomputable def putColors (a : M ⊕ M → Bool) (b : m.Uncovered → Bool) : V → Bool :=
  Sum.elim a b ∘ m.endpointsEquiv.symm

@[simp] private theorem putColors_endpoint (a : M ⊕ M → Bool) (b : m.Uncovered → Bool)
    (t : M ⊕ M) : m.putColors a b (m.endpoints t) = a t := by
  rw [← m.endpointsEquiv_inl t]
  simp only [putColors, Function.comp_apply, Equiv.symm_apply_apply, Sum.elim_inl]

@[simp] private theorem putColors_uncovered (a : M ⊕ M → Bool) (b : m.Uncovered → Bool)
    (u : m.Uncovered) : m.putColors a b u.val = b u := by
  rw [← m.endpointsEquiv_inr u]
  simp only [putColors, Function.comp_apply, Equiv.symm_apply_apply, Sum.elim_inr]

private noncomputable def flippedSide (s : M ⊕ M) (t : M ⊕ M) : Bool := by
  classical
  exact if t = s then !endpointSide t else endpointSide t

private theorem agrees_putColors_flipped (s : M ⊕ M) (b : m.Uncovered → Bool) :
    m.AgreesOutside (m.putColors (flippedSide s) b) s := by
  intro t ht
  simp [flippedSide, ht]

private theorem flips_putColors_flipped (s : M ⊕ M) (b : m.Uncovered → Bool) :
    m.putColors (flippedSide s) b (m.endpoints s) ≠ endpointSide s := by
  rw [putColors_endpoint]
  cases h : endpointSide s <;> simp [flippedSide, h]

private theorem connected_of_reaches_survivor (hs : m.Strong) {s : M ⊕ M} {b : V → Bool}
    (hb : m.AgreesOutside b s)
    (he : (crossingGraph G b).Reachable (m.endpoints s) (m.endpoints (oppositeEndpoint s)))
    (hu : ∀ u : m.Uncovered, ∃ t, (crossingGraph G b).Adj u.val (m.endpoints t)) :
    (crossingGraph G b).Connected := by
  classical
  have hr (t : M ⊕ M) : (crossingGraph G b).Reachable (m.endpoints t) (m.endpoints (oppositeEndpoint s)) := by
    by_cases h : t = s
    · simpa only [h] using he
    · exact m.reaches_opposite_of_agreesOutside hs hb t h
  have hreach (v : V) : (crossingGraph G b).Reachable v (m.endpoints (oppositeEndpoint s)) := by
    obtain ⟨(t | u), rfl⟩ := m.endpointsEquiv.surjective v
    · exact hr t
    · obtain ⟨t, ht⟩ := hu u
      exact ht.reachable.trans (hr t)
  let : Nonempty V := ⟨m.endpoints s⟩
  exact ⟨fun v w => (hreach v).trans (hreach w).symm⟩

private noncomputable def matchedNeighbor [Fintype M] [Nontrivial V]
    (hm : m.IsMaximum) (hG : G.Connected) (u : m.Uncovered) : M ⊕ M :=
  (m.exists_matched_neighbor hm hG u).choose

private theorem matchedNeighbor_adj [Fintype M] [Nontrivial V]
    (hm : m.IsMaximum) (hG : G.Connected) (u : m.Uncovered) :
    G.Adj u.val (m.endpoints (m.matchedNeighbor hm hG u)) :=
  (m.exists_matched_neighbor hm hG u).choose_spec

private theorem recover_from_same_side_edge [Fintype M] [Nontrivial V]
    (hm : m.IsMaximum) (hG : G.Connected) (hs : m.Strong) {s t : M ⊕ M}
    (he : G.Adj (m.endpoints s) (m.endpoints t)) (hc : endpointSide s = endpointSide t) :
    Nonempty (m.RecoveryColor s) := by
  have hne : t ≠ s := fun h => he.ne (congrArg m.endpoints h.symm)
  let c (u : m.Uncovered) : Bool := !flippedSide s (m.matchedNeighbor hm hG u)
  let b := m.putColors (flippedSide s) c
  have ha : m.AgreesOutside b s := m.agrees_putColors_flipped s c
  have hf : b (m.endpoints s) ≠ endpointSide s := m.flips_putColors_flipped s c
  have ht : (crossingGraph G b).Adj (m.endpoints s) (m.endpoints t) :=
    ⟨he, by
      rw [ha t hne, ← hc]
      exact hf⟩
  refine ⟨⟨b, ha, hf, m.connected_of_reaches_survivor hs ha
    (ht.reachable.trans (m.reaches_opposite_of_agreesOutside hs ha t hne)) ?_⟩⟩
  intro u
  refine ⟨m.matchedNeighbor hm hG u, m.matchedNeighbor_adj hm hG u, ?_⟩
  change m.putColors (flippedSide s) c u.val ≠ m.putColors (flippedSide s) c (m.endpoints _)
  simp only [putColors_endpoint, putColors_uncovered, c]
  cases flippedSide s (m.matchedNeighbor hm hG u) <;> decide

private theorem exists_uncovered_both_sides [Fintype M] (hm : m.IsMaximum)
    (hG : ¬G.IsBipartite)
    (ha : ∀ s t : M ⊕ M, G.Adj (m.endpoints s) (m.endpoints t) → endpointSide s ≠ endpointSide t) :
    ∃ u : m.Uncovered, ∀ c : Bool, ∃ t : M ⊕ M, G.Adj u.val (m.endpoints t) ∧ endpointSide t = c := by
  classical
  by_contra! hn
  let c (u : m.Uncovered) : Bool := (hn u).choose
  have hc (u : m.Uncovered) (t : M ⊕ M) (he : G.Adj u.val (m.endpoints t)) : endpointSide t ≠ c u :=
    (hn u).choose_spec t he
  let b := m.putColors endpointSide c
  apply hG
  refine ⟨finTwoEquiv.symm ∘ b, fun {v w} e eq => ?_⟩
  have heb : b v = b w := finTwoEquiv.symm.injective eq
  obtain ⟨(s | u), rfl⟩ := m.endpointsEquiv.surjective v <;>
    obtain ⟨(t | z), rfl⟩ := m.endpointsEquiv.surjective w
  · exact ha s t e (by simpa [b] using heb)
  · exact hc z s e.symm (by simpa [b] using heb)
  · exact hc u t e (by simpa [b] using heb.symm)
  · exact unmatched_independent m hm u.property z.property e

private theorem recover_from_uncovered [Fintype M] [Nontrivial V]
    (hm : m.IsMaximum) (hG : G.Connected) (hs : m.Strong) (u : m.Uncovered) {s t : M ⊕ M}
    (h₁ : G.Adj u.val (m.endpoints s)) (h₂ : G.Adj u.val (m.endpoints t))
    (hc : endpointSide t ≠ endpointSide s) : Nonempty (m.RecoveryColor s) := by
  classical
  have hne : t ≠ s := fun e => hc (congrArg endpointSide e)
  let c (w : m.Uncovered) : Bool := if w = u then endpointSide s else !flippedSide s (m.matchedNeighbor hm hG w)
  let b := m.putColors (flippedSide s) c
  have ha : m.AgreesOutside b s := m.agrees_putColors_flipped s c
  have hf : b (m.endpoints s) ≠ endpointSide s := m.flips_putColors_flipped s c
  have hu : b u.val = endpointSide s := by simp [b, c]
  have hsu : (crossingGraph G b).Adj (m.endpoints s) u.val := ⟨h₁.symm, hu.symm ▸ hf⟩
  have hut : (crossingGraph G b).Adj u.val (m.endpoints t) := ⟨h₂, by
    rw [hu, ha t hne]
    exact hc.symm⟩
  have hreach := hsu.reachable.trans (hut.reachable.trans (m.reaches_opposite_of_agreesOutside hs ha t hne))
  refine ⟨⟨b, ha, hf, m.connected_of_reaches_survivor hs ha hreach ?_⟩⟩
  intro w
  by_cases hw : w = u
  · subst w
    exact ⟨t, hut⟩
  · refine ⟨m.matchedNeighbor hm hG w, m.matchedNeighbor_adj hm hG w, ?_⟩
    change m.putColors (flippedSide s) c w.val ≠ m.putColors (flippedSide s) c (m.endpoints _)
    simp only [putColors_endpoint, putColors_uncovered, c, hw, ite_false]
    cases flippedSide s (m.matchedNeighbor hm hG w) <;> decide

theorem exists_two_recovery_colors [Fintype M] [Nontrivial V]
    (hm : m.IsMaximum) (hG : G.Connected) (hn : ¬G.IsBipartite) (hs : m.Strong) :
    ∃ s t : M ⊕ M, s ≠ t ∧ Nonempty (m.RecoveryColor s) ∧ Nonempty (m.RecoveryColor t) := by
  classical
  by_cases he : ∃ s t : M ⊕ M, G.Adj (m.endpoints s) (m.endpoints t) ∧ endpointSide s = endpointSide t
  · obtain ⟨s, t, h, hc⟩ := he
    exact ⟨s, t, fun e => h.ne (congrArg m.endpoints e),
      m.recover_from_same_side_edge hm hG hs h hc, m.recover_from_same_side_edge hm hG hs h.symm hc.symm⟩
  · push Not at he
    obtain ⟨u, hu⟩ := m.exists_uncovered_both_sides hm hn he
    obtain ⟨s, h₁, e₁⟩ := hu false
    obtain ⟨t, h₂, e₂⟩ := hu true
    have hc : endpointSide s ≠ endpointSide t := by rw [e₁, e₂]; decide
    exact ⟨s, t, fun e => hc (congrArg endpointSide e),
      m.recover_from_uncovered hm hG hs u h₁ h₂ hc.symm, m.recover_from_uncovered hm hG hs u h₂ h₁ hc⟩

end IndexedMatching
end BraunBruegge
