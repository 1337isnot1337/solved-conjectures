import Conjectures.BraunBrueggeBicyclicEar
import Conjectures.BraunBrueggeBicyclicRank
import Conjectures.BraunBrueggeBicyclicCycleProducts
import Conjectures.BraunBrueggeBicyclicWedgeSize
import Conjectures.BraunBrueggeMinimum
import Mathlib.Logic.Equiv.Option

/-! A closed ear on a cycle embeds a wedge of two cycles. If the ambient
graph is bridgeless and bicyclic, the embedding is an isomorphism. -/

namespace BraunBruegge

variable {V W X : Type*}

private def closedEarEmbedding {G C : SimpleGraph V} {S : Set V} (ear : GraphEar G C S)
    {m : ℕ} (hm : m + 3 = ear.length) : Fin (m + 3) ↪ V where
  toFun i := ear.vertex i.val
  inj' := by
    intro i j h
    apply Fin.ext
    change ear.vertex i.val = ear.vertex j.val at h
    have hi : i.val < ear.length := hm ▸ i.isLt
    have hj : j.val < ear.length := hm ▸ j.isLt
    rcases Nat.eq_zero_or_pos i.val with hzero | hpos
    · rcases Nat.eq_zero_or_pos j.val with hz | hp
      · exact hzero.trans hz.symm
      · have hmem : ear.vertex i.val ∈ S := by simpa only [hzero, ear.vertex_zero] using ear.start_mem
        exact (ear.interior_outside hp hj (h ▸ hmem)).elim
    · rcases Nat.eq_zero_or_pos j.val with hz | hp
      · have hmem : ear.vertex j.val ∈ S := by simpa only [hz, ear.vertex_zero] using ear.start_mem
        exact (ear.interior_outside hpos hi (h.symm ▸ hmem)).elim
      · exact ear.interior_injective ⟨hpos, hi⟩ ⟨hp, hj⟩ h

private theorem closedEarEmbedding_step {G C : SimpleGraph V} {S : Set V} (ear : GraphEar G C S)
    {m : ℕ} (hm : m + 3 = ear.length) (hClosed : ear.start = ear.finish) (i : Fin (m + 3)) :
    G.Adj (closedEarEmbedding ear hm i) (closedEarEmbedding ear hm (i + 1)) := by
  change G.Adj (ear.vertex i.val) (ear.vertex (i + 1).val)
  have hi : i.val < ear.length := hm ▸ i.isLt
  have hs := ear.step_adj hi
  by_cases h : i.val + 1 < m + 3
  · rwa [Fin.val_add_one_of_lt' h]
  · have he : i.val + 1 = ear.length := by omega
    have hLast : i = Fin.last (m + 2) := Fin.ext (by simp; omega)
    rw [he, ear.vertex_last, ← hClosed] at hs
    simpa only [hLast, Fin.val_add_one, ite_true, ear.vertex_zero] using hs

private theorem closedEarEmbedding_le {G C : SimpleGraph V} {S : Set V} (ear : GraphEar G C S)
    {m : ℕ} (hm : m + 3 = ear.length) (hClosed : ear.start = ear.finish) :
    (SimpleGraph.cycleGraph (m + 3)).map (closedEarEmbedding ear hm) ≤ G := by
  intro a b hab
  obtain ⟨i, j, hij, rfl, rfl⟩ :=
    (SimpleGraph.map_adj (closedEarEmbedding ear hm) _ a b).mp hab
  rcases cycle_adj_step.mp hij with rfl | rfl
  · exact closedEarEmbedding_step ear hm hClosed i
  · exact (closedEarEmbedding_step ear hm hClosed j).symm

private def joinedWedgeEmbedding (f : Option W ↪ V) (g : Option X ↪ V)
    (hroot : f none = g none) (hsep : ∀ w x, f (some w) ≠ g (some x)) :
    Option (W ⊕ X) ↪ V where
  toFun
    | none => f none
    | some (.inl w) => f (some w)
    | some (.inr x) => g (some x)
  inj' := by
    rintro (_ | (w | x)) (_ | (w' | x')) h
    · rfl
    · have h' : f none = f (some w') := h
      cases f.injective h'
    · have h' : f none = g (some x') := h
      rw [hroot] at h'
      cases g.injective h'
    · have h' : f (some w) = f none := h
      cases f.injective h'
    · have h' : f (some w) = f (some w') := h
      simpa using f.injective h'
    · exact (hsep w x' h).elim
    · have h' : g (some x) = f none := h
      rw [hroot] at h'
      cases g.injective h'
    · exact (hsep w' x h.symm).elim
    · have h' : g (some x) = g (some x') := h
      simpa using g.injective h'

private theorem joinedWedgeEmbedding_le {G : SimpleGraph V} {A : SimpleGraph (Option W)}
    {B : SimpleGraph (Option X)} {f : Option W ↪ V} {g : Option X ↪ V}
    (hroot : f none = g none) (hsep : ∀ w x, f (some w) ≠ g (some x))
    (hA : A.map f ≤ G) (hB : B.map g ≤ G) :
    (wedge A B).map (joinedWedgeEmbedding f g hroot hsep) ≤ G := by
  let e := joinedWedgeEmbedding f g hroot hsep
  have hL (x : Option W) : e (wedgeLeft x) = f x := by cases x <;> rfl
  have hR (x : Option X) : e (wedgeRight x) = g x := by
    cases x
    · exact hroot
    · rfl
  intro a b hab
  obtain ⟨x, y, hxy, rfl, rfl⟩ := (SimpleGraph.map_adj e _ a b).mp hab
  rcases wedge_adj_iff.mp hxy with ⟨u, v, huv, rfl, rfl⟩ | ⟨u, v, huv, rfl, rfl⟩
  · rw [hL, hL]
    exact hA ((SimpleGraph.Embedding.map f A).map_rel_iff.mpr huv)
  · rw [hR, hR]
    exact hB ((SimpleGraph.Embedding.map g B).map_rel_iff.mpr huv)

private abbrev CycleRest {n : ℕ} (r : Fin (n + 3)) := {i : Fin (n + 3) // i ≠ r}

private def rootedCycleAt {n : ℕ} (r : Fin (n + 3)) : SimpleGraph (Option (CycleRest r)) :=
  (SimpleGraph.cycleGraph (n + 3)).comap (Equiv.optionSubtypeNe r)

private def rootedCycleAtIso {n : ℕ} (r : Fin (n + 3)) :
    rootedCycleAt r ≃g SimpleGraph.cycleGraph (n + 3) :=
  SimpleGraph.Iso.comap (Equiv.optionSubtypeNe r) _

private theorem rootedCycleAtCard {n : ℕ} (r : Fin (n + 3)) :
    Nat.card (Option (CycleRest r)) = n + 3 ∧
    Nat.card (rootedCycleAt r).edgeSet = n + 3 := by
  constructor
  · rw [Nat.card_congr (rootedCycleAtIso r).toEquiv, Nat.card_fin]
  · rw [Nat.card_congr (rootedCycleAtIso r).mapEdgeSet, cycle_edge_card]

private theorem rootedCycleAtConnected {n : ℕ} (r : Fin (n + 3)) : (rootedCycleAt r).Connected :=
  (rootedCycleAtIso r).connected_iff.mpr SimpleGraph.connected_cycleGraph_add_one

private theorem rootedCycleAt_facets {n : ℕ} (r : Fin (n + 3)) [Nonempty (CycleRest r)] :
    Nat.card {F // IsFacet (rootedCycleAt r) F} = cycleFacetNumber (n + 3) := by
  classical
  rw [facet_card_relabel (rootedCycleAtIso r) (rootedCycleAtConnected r) none]
  exact cycle_facets_eq_number _ (by omega)

/-- A closed ear on an embedded cycle accounts for the whole bridgeless
bicyclic graph and gives its exact two-cycle product facet count. -/
theorem closed_ear_bicyclic_facet_card [Fintype V] [DecidableEq V] [Nontrivial V] {G : SimpleGraph V}
    (hG : G.Connected) (hRank : Nat.card G.edgeSet = Nat.card V + 1)
    (hNoBridge : ∀ e ∈ G.edgeSet, ¬G.IsBridge e)
    {n : ℕ} (f : Fin (n + 3) ↪ V) (hF : (SimpleGraph.cycleGraph (n + 3)).map f ≤ G)
    (ear : GraphEar G ((SimpleGraph.cycleGraph (n + 3)).map f) (Set.range f))
    (hClosed : ear.start = ear.finish) : ∃ m : ℕ,
      Nat.card G.edgeSet = n + 3 + (m + 3) ∧
      Nat.card {F // IsFacet G F} = cycleFacetNumber (n + 3) * cycleFacetNumber (m + 3) := by
  classical
  let c := SimpleGraph.cycleGraph (n + 3)
  let m := ear.length - 3
  have hLength : m + 3 = ear.length := by
    have := ear.closed_length hClosed
    dsimp [m]
    omega
  obtain ⟨r, hr⟩ := ear.start_mem
  let L := rootedCycleAt r
  let R := rootedCycleAt (0 : Fin (m + 3))
  let lf := (rootedCycleAtIso r).toEquiv.toEmbedding.trans f
  let rf := (rootedCycleAtIso (0 : Fin (m + 3))).toEquiv.toEmbedding.trans (closedEarEmbedding ear hLength)
  have hroot : lf none = rf none := by
    change f r = ear.vertex 0
    rw [hr, ear.vertex_zero]
  have hsep (u : CycleRest r) (v : CycleRest (0 : Fin (m + 3))) : lf (some u) ≠ rf (some v) := by
    change f u.val ≠ ear.vertex v.val.val
    have hv : 0 < v.val.val := Nat.pos_of_ne_zero (fun h => v.property (Fin.ext h))
    have hv' : v.val.val < ear.length := hLength ▸ v.val.isLt
    exact fun h => ear.interior_outside hv hv' ⟨u.val, h⟩
  have hL : L.map lf ≤ G := by
    intro a b h
    obtain ⟨u, v, huv, rfl, rfl⟩ := (SimpleGraph.map_adj lf L a b).mp h
    exact hF ((SimpleGraph.Embedding.map f c).map_rel_iff.mpr ((rootedCycleAtIso r).map_rel_iff.mpr huv))
  have hR : R.map rf ≤ G := by
    intro a b h
    obtain ⟨u, v, huv, rfl, rfl⟩ := (SimpleGraph.map_adj rf R a b).mp h
    exact closedEarEmbedding_le ear hLength hClosed
      ((SimpleGraph.Embedding.map (closedEarEmbedding ear hLength) (SimpleGraph.cycleGraph (m + 3))).map_rel_iff.mpr
        ((rootedCycleAtIso (0 : Fin (m + 3))).map_rel_iff.mpr huv))
  have hLC := rootedCycleAtConnected r
  have hRC := rootedCycleAtConnected (0 : Fin (m + 3))
  have hWC := wedge_connected_iff.mpr ⟨hLC, hRC⟩
  obtain ⟨hlv, hle⟩ := rootedCycleAtCard r
  obtain ⟨hrv, hre⟩ := rootedCycleAtCard (0 : Fin (m + 3))
  have hWV := wedge_vertex_card_add_one (V := CycleRest r) (W := CycleRest (0 : Fin (m + 3)))
  simp only [← Nat.card_eq_fintype_card, hlv, hrv] at hWV
  have hWE := wedge_edge_card L R
  change Nat.card L.edgeSet = n + 3 at hle
  change Nat.card R.edgeSet = m + 3 at hre
  have hModelRank : Nat.card (wedge L R).edgeSet + Nat.card V =
      Nat.card G.edgeSet + Nat.card (Option (CycleRest r ⊕ CycleRest (0 : Fin (m + 3)))) := by omega
  let iso := iso_of_equal_rank_of_no_bridges hG hWC _
    (joinedWedgeEmbedding_le hroot hsep hL hR) hModelRank hNoBridge
  let _ : Nonempty (CycleRest r) := ⟨⟨(exists_ne r).choose, (exists_ne r).choose_spec⟩⟩
  let _ : Nonempty (CycleRest (0 : Fin (m + 3))) :=
    ⟨⟨(exists_ne (0 : Fin (m + 3))).choose, (exists_ne (0 : Fin (m + 3))).choose_spec⟩⟩
  refine ⟨m, ?_, ?_⟩
  · rw [← Nat.card_congr iso.mapEdgeSet, hWE, hle, hre]
  · rw [← facet_card_relabel iso hWC none, wedge_facet_card hLC hRC, rootedCycleAt_facets, rootedCycleAt_facets]

end BraunBruegge
