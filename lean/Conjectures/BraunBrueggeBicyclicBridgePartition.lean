import Conjectures.BraunBrueggeBicyclicBridgeJoin

/-! Deleting a bridge in a connected graph gives two induced connected
components. The original graph is isomorphic to their bridge join. -/

open Set SimpleGraph
open scoped Sym2

namespace BraunBruegge

variable {V : Type*} {G : SimpleGraph V} {u v : V}

abbrev bridgeDeletion (G : SimpleGraph V) (u v : V) := G.deleteEdges {s(u, v)}

abbrev bridgeLeft (G : SimpleGraph V) (u v : V) := (bridgeDeletion G u v).connectedComponentMk u
abbrev bridgeRight (G : SimpleGraph V) (u v : V) := (bridgeDeletion G u v).connectedComponentMk v

def bridgeLeftRoot (G : SimpleGraph V) (u v : V) : bridgeLeft G u v := ⟨u, rfl⟩
def bridgeRightRoot (G : SimpleGraph V) (u v : V) : bridgeRight G u v := ⟨v, rfl⟩

private theorem reach_either_among_bridgeDeletion {a b : V} (p : G.Walk a b)
    (ha : (bridgeDeletion G u v).Reachable u a ∨ (bridgeDeletion G u v).Reachable v a) :
    (bridgeDeletion G u v).Reachable u b ∨ (bridgeDeletion G u v).Reachable v b := by
  induction p with
  | nil => exact ha
  | @cons a c b e p ih =>
    apply ih
    by_cases hex : s(a, c) = s(u, v)
    · rcases Sym2.eq_iff.mp hex with ⟨_, rfl⟩ | ⟨_, rfl⟩
      · exact Or.inr (SimpleGraph.Reachable.refl _)
      · exact Or.inl (SimpleGraph.Reachable.refl _)
    · have h : (bridgeDeletion G u v).Adj a c := SimpleGraph.deleteEdges_adj.mpr ⟨e, by simpa using hex⟩
      exact ha.imp (fun r => r.trans h.reachable) (fun r => r.trans h.reachable)

private theorem bridgeComponents_cover (hG : G.Connected) (x : V) :
    x ∈ bridgeLeft G u v ∨ x ∈ bridgeRight G u v := by
  obtain ⟨p⟩ := hG u x
  have h := reach_either_among_bridgeDeletion (u := u) (v := v) p (Or.inl (SimpleGraph.Reachable.refl _))
  exact h.imp (fun r => ConnectedComponent.sound r.symm) (fun r => ConnectedComponent.sound r.symm)

private theorem bridgeComponents_disjoint (h : G.IsBridge s(u, v)) {x : V}
    (h₁ : x ∈ bridgeLeft G u v) (h₂ : x ∈ bridgeRight G u v) : False := by
  exact (isBridge_iff.mp h) (ConnectedComponent.exact (h₁.symm.trans h₂))

noncomputable def bridgePartitionEquiv (hG : G.Connected) (hb : G.IsBridge s(u, v)) :
    (bridgeLeft G u v ⊕ bridgeRight G u v) ≃ V := by
  let f : bridgeLeft G u v ⊕ bridgeRight G u v → V := Sum.elim Subtype.val Subtype.val
  apply Equiv.ofBijective f
  constructor
  · rintro (x | x) (y | y) h
    · exact congrArg Sum.inl (Subtype.ext h)
    · change x.val = y.val at h
      exact (bridgeComponents_disjoint hb x.property (h.symm ▸ y.property)).elim
    · change x.val = y.val at h
      exact (bridgeComponents_disjoint hb y.property (h ▸ x.property)).elim
    · exact congrArg Sum.inr (Subtype.ext h)
  · intro x
    rcases bridgeComponents_cover (u := u) (v := v) hG x with h | h
    · exact ⟨.inl ⟨x, h⟩, rfl⟩
    · exact ⟨.inr ⟨x, h⟩, rfl⟩

private theorem adj_within_bridgeComponent (hb : G.IsBridge s(u, v))
    (C : (bridgeDeletion G u v).ConnectedComponent) (a b : C) : G.Adj a.val b.val ↔ C.toSimpleGraph.Adj a b := by
  change G.Adj a.val b.val ↔ (bridgeDeletion G u v).Adj a.val b.val
  rw [SimpleGraph.deleteEdges_adj]
  refine ⟨fun h => ⟨h, ?_⟩, And.left⟩
  intro he
  have hd : s(a.val, b.val) = s(u, v) := Set.mem_singleton_iff.mp he
  have hr := C.reachable_of_mem_supp a.property b.property
  rcases Sym2.eq_iff.mp hd with ⟨h₁, h₂⟩ | ⟨h₁, h₂⟩
  · rw [h₁, h₂] at hr
    exact (isBridge_iff.mp hb) hr
  · rw [h₁, h₂] at hr
    exact (isBridge_iff.mp hb) hr.symm

private theorem adj_across_bridgeComponents (hv : G.Adj u v) (hb : G.IsBridge s(u, v))
    (a : bridgeLeft G u v) (b : bridgeRight G u v) :
    G.Adj a.val b.val ↔ a = bridgeLeftRoot G u v ∧ b = bridgeRightRoot G u v ∧ True := by
  constructor
  · intro he
    have hd : s(a.val, b.val) = s(u, v) := by
      by_contra hn
      have h : (bridgeDeletion G u v).Adj a.val b.val := SimpleGraph.deleteEdges_adj.mpr ⟨he, by simpa using hn⟩
      exact bridgeComponents_disjoint hb ((bridgeLeft G u v).mem_supp_of_adj_mem_supp a.property h) b.property
    rcases Sym2.eq_iff.mp hd with ⟨h₁, h₂⟩ | ⟨h₁, _⟩
    · exact ⟨Subtype.ext h₁, Subtype.ext h₂, trivial⟩
    · exact (bridgeComponents_disjoint hb a.property (h₁.symm ▸ (bridgeRightRoot G u v).property)).elim
  · rintro ⟨rfl, rfl, _⟩
    exact hv

noncomputable def bridgePartitionGraphIso (hG : G.Connected) (hv : G.Adj u v) (hb : G.IsBridge s(u, v)) :
    bridgeJoin (bridgeLeft G u v).toSimpleGraph (bridgeRight G u v).toSimpleGraph
      (bridgeLeftRoot G u v) (bridgeRightRoot G u v) ≃g G where
  toEquiv := bridgePartitionEquiv hG hb
  map_rel_iff' := by
    rintro (a | a) (b | b)
    · exact adj_within_bridgeComponent hb _ a b
    · exact adj_across_bridgeComponents hv hb a b
    · exact ⟨fun h => (adj_across_bridgeComponents hv hb b a).mp h.symm,
        fun h => ((adj_across_bridgeComponents hv hb b a).mpr h).symm⟩
    · exact adj_within_bridgeComponent hb _ a b

end BraunBruegge
