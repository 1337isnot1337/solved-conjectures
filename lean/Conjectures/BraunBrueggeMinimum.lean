import Conjectures.BraunBrueggeMinimumNonbipartite

/-! The global minimum and the unique isomorphism class of minimizers in
Braun–Bruegge, Conjecture 2(3)–(4). -/

open Set

namespace BraunBruegge

variable {V W : Type*} {G : SimpleGraph V} {H : SimpleGraph W}

private theorem polar_vertex_relabel [Fintype V] [Fintype W] (e : G ≃g H) {root : V} {f : V → ℝ}
    (hf : f ∈ (polar G root).extremePoints ℝ) : f ∘ e.symm ∈ (polar H (e root)).extremePoints ℝ := by
  obtain ⟨hp, ht⟩ := mem_extreme_polar_iff.mp hf
  refine mem_extreme_polar_iff.mpr ⟨⟨?_, ?_⟩, ?_⟩
  · simpa only [Function.comp_apply, RelIso.symm_apply_apply] using hp.1
  · intro u v he
    exact hp.2 (e.symm.map_rel_iff.mpr he)
  · let i : tightGraph G f ≃g tightGraph H (f ∘ e.symm) := {
      toEquiv := e.toEquiv
      map_rel_iff' := by
        intro u v
        change H.Adj (e u) (e v) ∧ |f (e.symm (e u)) - f (e.symm (e v))| = 1 ↔
          G.Adj u v ∧ |f u - f v| = 1
        rw [e.map_rel_iff, e.symm_apply_apply, e.symm_apply_apply] }
    exact i.connected_iff.mp ht

noncomputable def polarVerticesRelabel [Fintype V] [Fintype W] (e : G ≃g H) (root : V) :
    (polar G root).extremePoints ℝ ≃ (polar H (e root)).extremePoints ℝ where
  toFun f := ⟨f.val ∘ e.symm, polar_vertex_relabel e f.property⟩
  invFun f := ⟨f.val ∘ e, by
    simpa only [RelIso.symm_apply_apply, RelIso.symm_symm] using polar_vertex_relabel e.symm f.property⟩
  left_inv f := by
    apply Subtype.ext
    funext v
    simp [Function.comp_apply]
  right_inv f := by
    apply Subtype.ext
    funext v
    simp [Function.comp_apply]

theorem facet_card_relabel [Fintype V] [Fintype W] [DecidableEq V] [DecidableEq W]
    [Nontrivial V] [Nontrivial W] (e : G ≃g H) (hG : G.Connected) (root : V) :
    Nat.card {F // IsFacet G F} = Nat.card {F // IsFacet H F} := by
  rw [← Nat.card_congr (polarVerticesEquivFacets hG root),
    ← Nat.card_congr (polarVerticesEquivFacets (e.connected_iff.mp hG) (e root))]
  exact Nat.card_congr (polarVerticesRelabel e root)

def balancedCompleteBipartite (n : ℕ) : SimpleGraph (Fin (n / 2) ⊕ Fin ((n + 1) / 2)) :=
  completeBipartiteGraph _ _

theorem balancedCompleteBipartite_connected (n : ℕ) (hn : 2 ≤ n) : (balancedCompleteBipartite n).Connected := by
  let : Nonempty (Fin ((n + 1) / 2)) := ⟨⟨0, by omega⟩⟩
  exact complete_bipartite_connected ⟨0, by omega⟩

theorem card_balancedCompleteBipartite_facets (n : ℕ) (hn : 2 ≤ n) :
    Nat.card {F // IsFacet (balancedCompleteBipartite n) F} = balancedFacetMinimum n := by
  let : Nonempty (Fin ((n + 1) / 2)) := ⟨⟨0, by omega⟩⟩
  change Nat.card {F // IsFacet (completeBipartiteGraph (Fin (n / 2)) (Fin ((n + 1) / 2))) F} =
    2 ^ (n / 2) + 2 ^ ((n + 1) / 2) - 2
  simpa only [Fintype.card_fin] using
    (card_complete_bipartite_facets (R := Fin ((n + 1) / 2)) (⟨0, by omega⟩ : Fin (n / 2)))

private def completeBipartiteSwap (L R : Type*) : completeBipartiteGraph L R ≃g completeBipartiteGraph R L where
  toEquiv := Equiv.sumComm L R
  map_rel_iff' := by
    rintro (u | u) (v | v) <;> simp [completeBipartiteGraph]

private theorem bipartite_minimum_and_class [Fintype V] [DecidableEq V] [Nontrivial V]
    (hG : G.Connected) (hB : G.IsBipartite) (root : V) :
    balancedFacetMinimum (Fintype.card V) ≤ Nat.card {F // IsFacet G F} ∧
      (balancedFacetMinimum (Fintype.card V) = Nat.card {F // IsFacet G F} →
        Nonempty (G ≃g balancedCompleteBipartite (Fintype.card V))) := by
  classical
  obtain ⟨c, hc⟩ := hB
  let b : V → Bool := finTwoEquiv ∘ c
  let L := {v : V // b v = true}
  let R := {v : V // b v ≠ true}
  let E : L ⊕ R ≃ V := Equiv.sumCompl (fun v => b v = true)
  let K := G.comap E
  let iso : K ≃g G := SimpleGraph.Iso.comap E G
  have adj_ne {u v : V} (e : G.Adj u v) : b u ≠ b v := fun he => hc e (finTwoEquiv.injective he)
  obtain ⟨v, hv⟩ := hG.preconnected.exists_adj_of_nontrivial root
  have hl : Nonempty L := by
    cases h : b root
    · exact ⟨⟨v, by simpa [h] using (adj_ne hv).symm⟩⟩
    · exact ⟨⟨root, h⟩⟩
  let : Nonempty R := by
    cases h : b root
    · exact ⟨⟨root, by simp [h]⟩⟩
    · exact ⟨⟨v, h ▸ (adj_ne hv).symm⟩⟩
  obtain ⟨a⟩ := hl
  let : Fintype L := Fintype.ofFinite _
  let : Fintype R := Fintype.ofFinite _
  let : Nontrivial (L ⊕ R) := ⟨⟨.inl a, .inr (Classical.choice ‹Nonempty R›), Sum.inl_ne_inr⟩⟩
  have hK : K ≤ completeBipartiteGraph L R := by
    intro x y he
    have h := adj_ne (show G.Adj (E x) (E y) from he)
    cases x with
    | inl x =>
      cases y with
      | inl y => exact False.elim (h (x.property.trans y.property.symm))
      | inr y => simp [completeBipartiteGraph]
    | inr x =>
      cases y with
      | inl y => simp [completeBipartiteGraph]
      | inr y =>
        have hx : b x.val = false := Bool.eq_false_iff.mpr x.property
        have hy : b y.val = false := Bool.eq_false_iff.mpr y.property
        exact False.elim (h (hx.trans hy.symm))
  have h := balanced_complete_bipartite_minimum (iso.connected_iff.mpr hG) hK a
  dsimp only at h
  have hn : Fintype.card L + Fintype.card R = Fintype.card V := by
    rw [← Fintype.card_sum]
    exact Fintype.card_congr E
  have hcard := facet_card_relabel iso (iso.connected_iff.mpr hG) (.inl a)
  rw [hn, hcard] at h
  refine ⟨h.1, fun he => ?_⟩
  obtain ⟨hk, hab, hba⟩ := h.2.mp he
  have hsort : (Fintype.card L = Fintype.card V / 2 ∧ Fintype.card R = (Fintype.card V + 1) / 2) ∨
      (Fintype.card R = Fintype.card V / 2 ∧ Fintype.card L = (Fintype.card V + 1) / 2) := by omega
  have hk' : K = completeBipartiteGraph L R := hk
  have j : G ≃g completeBipartiteGraph L R := by
    rw [← hk']
    exact iso.symm
  rcases hsort with ⟨hl, hr⟩ | ⟨hr, hl⟩
  · exact ⟨j.trans (SimpleGraph.completeBipartiteGraphCongr (Fintype.equivFinOfCardEq hl) (Fintype.equivFinOfCardEq hr))⟩
  · exact ⟨(j.trans (completeBipartiteSwap L R)).trans
      (SimpleGraph.completeBipartiteGraphCongr (Fintype.equivFinOfCardEq hr) (Fintype.equivFinOfCardEq hl))⟩

/-- Every finite connected graph on at least two vertices has at least as
many facets as the balanced complete bipartite graph, with equality precisely
for that graph up to isomorphism. -/
theorem braun_bruegge_minimum_facets [Fintype V] [DecidableEq V]
    (hG : G.Connected) (hn : 2 ≤ Fintype.card V) :
    balancedFacetMinimum (Fintype.card V) ≤ Nat.card {F // IsFacet G F} ∧
      (balancedFacetMinimum (Fintype.card V) = Nat.card {F // IsFacet G F} ↔
        Nonempty (G ≃g balancedCompleteBipartite (Fintype.card V))) := by
  classical
  let : Nontrivial V := Fintype.one_lt_card_iff_nontrivial.mp (by omega)
  let root : V := Classical.choice hG.nonempty
  have hforward : balancedFacetMinimum (Fintype.card V) ≤ Nat.card {F // IsFacet G F} ∧
      (balancedFacetMinimum (Fintype.card V) = Nat.card {F // IsFacet G F} →
        Nonempty (G ≃g balancedCompleteBipartite (Fintype.card V))) := by
    by_cases hB : G.IsBipartite
    · exact bipartite_minimum_and_class hG hB root
    · have h := balancedFacetMinimum_lt_nonbipartite hG hB root
      exact ⟨h.le, fun he => (h.ne he).elim⟩
  refine ⟨hforward.1, hforward.2, ?_⟩
  rintro ⟨e⟩
  let : Nontrivial (Fin (Fintype.card V / 2) ⊕ Fin ((Fintype.card V + 1) / 2)) :=
    ⟨⟨.inl ⟨0, by omega⟩, .inr ⟨0, by omega⟩, Sum.inl_ne_inr⟩⟩
  rw [facet_card_relabel e hG root, card_balancedCompleteBipartite_facets _ hn]

end BraunBruegge
