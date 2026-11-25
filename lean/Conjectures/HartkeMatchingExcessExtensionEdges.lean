import Conjectures.HartkeMatchingExcessExtension
import Conjectures.HartkeMatchingExcessIsomorphism
import Conjectures.HartkeMatchingExcessGadgets

/-!
# Hartke–Stolee–West–Yancey's matching-excess conjecture

The two-vertex extension adds exactly |V|+1 unordered edges. Relabeling
returns to the canonical even vertex set and preserves the integer excess.
-/

namespace HartkeMatchingExcess

open SimpleGraph

variable {V : Type*} {G : SimpleGraph V}

def extendEmbedding (G : SimpleGraph V) : G ↪g extendGraph G where
  toFun := Sum.inl
  inj' := Sum.inl_injective
  map_rel_iff' := by intros; rfl

def extensionEdgeMap (G : SimpleGraph V) : G.edgeSet ⊕ Option V → (extendGraph G).edgeSet
  | .inl e => (extendEmbedding G).mapEdgeSet e
  | .inr none => ⟨s(Sum.inr false, Sum.inr true), by change false ≠ true; decide⟩
  | .inr (some v) => ⟨s(Sum.inl v, Sum.inr false), rfl⟩

theorem extensionEdgeMap_old_ne_new (G : SimpleGraph V) (e : G.edgeSet) (o : Option V) :
    extensionEdgeMap G (.inl e) ≠ extensionEdgeMap G (.inr o) := by
  rcases e with ⟨⟨v,w⟩, hvw⟩
  cases o with
  | none =>
    intro h
    have he := congrArg Subtype.val h
    change s(Sum.inl v, Sum.inl w) = s(Sum.inr false, Sum.inr true) at he
    simp at he
  | some u =>
    intro h
    have he := congrArg Subtype.val h
    change s(Sum.inl v, Sum.inl w) = s(Sum.inl u, Sum.inr false) at he
    simp at he

theorem extensionEdgeMap_injective (G : SimpleGraph V) :
    Function.Injective (extensionEdgeMap G) := by
  intro p q h
  cases p with
  | inl e =>
    cases q with
    | inl f =>
      have he : e = f := (extendEmbedding G).mapEdgeSet.injective h
      exact congrArg Sum.inl he
    | inr o => exact False.elim (extensionEdgeMap_old_ne_new G e o h)
  | inr o =>
    cases q with
    | inl e => exact False.elim (extensionEdgeMap_old_ne_new G e o h.symm)
    | inr p =>
      cases o with
      | none =>
        cases p with
        | none => rfl
        | some v =>
          have he := congrArg Subtype.val h
          change s(Sum.inr false, Sum.inr true) = s(Sum.inl v, Sum.inr false) at he
          simp at he
      | some v =>
        cases p with
        | none =>
          have he := congrArg Subtype.val h
          change s(Sum.inl v, Sum.inr false) = s(Sum.inr false, Sum.inr true) at he
          simp at he
        | some w =>
          have he := congrArg Subtype.val h
          change s(Sum.inl v, Sum.inr false) = s(Sum.inl w, Sum.inr false) at he
          have hvw : v = w := by simpa [Sym2.eq_iff] using he
          subst w
          rfl

theorem extensionEdgeMap_surjective (G : SimpleGraph V) :
    Function.Surjective (extensionEdgeMap G) := by
  rintro ⟨⟨x,y⟩, hxy⟩
  cases x with
  | inl v =>
    cases y with
    | inl w => exact ⟨.inl ⟨s(v,w), hxy⟩, rfl⟩
    | inr b =>
      change b = false at hxy
      subst b
      exact ⟨.inr (some v), rfl⟩
  | inr a =>
    cases y with
    | inl w =>
      change a = false at hxy
      subst a
      exact ⟨.inr (some w), Subtype.ext Sym2.eq_swap⟩
    | inr b =>
      change a ≠ b at hxy
      cases a <;> cases b
      · exact False.elim (hxy rfl)
      · exact ⟨.inr none, rfl⟩
      · exact ⟨.inr none, Subtype.ext Sym2.eq_swap⟩
      · exact False.elim (hxy rfl)

theorem extendGraph_edge_card [Fintype V] (G : SimpleGraph V) :
    Nat.card (extendGraph G).edgeSet = Nat.card G.edgeSet + Fintype.card V + 1 := by
  have he := Nat.card_congr (Equiv.ofBijective (extensionEdgeMap G)
    ⟨extensionEdgeMap_injective G, extensionEdgeMap_surjective G⟩)
  simpa [Nat.card_sum, Nat.card_eq_fintype_card, Nat.add_assoc] using he.symm

theorem extend_canonical_witness (n : ℕ) (G : SimpleGraph (Fin n ⊕ Fin n)) :
    ∃ H : SimpleGraph (Fin (n + 1) ⊕ Fin (n + 1)),
      perfectMatchingCount H = perfectMatchingCount G ∧ graphExcess (n + 1) H = graphExcess n G := by
  classical
  let e : ((Fin n ⊕ Fin n) ⊕ Bool) ≃ (Fin (n + 1) ⊕ Fin (n + 1)) :=
    Fintype.equivOfCardEq (by simp; omega)
  let H := (extendGraph G).comap e.symm
  let iso : H ≃g extendGraph G := SimpleGraph.Iso.comap e.symm (extendGraph G)
  refine ⟨H, (perfectMatchingCount_iso iso).trans (perfectMatchingCount_extendGraph G), ?_⟩
  have he : Nat.card H.edgeSet = Nat.card G.edgeSet + 2 * n + 1 := by
    rw [edge_card_iso iso, extendGraph_edge_card]
    simp
    omega
  unfold graphExcess
  rw [he]
  push_cast
  ring

theorem extend_witness_to (n m : ℕ) (hnm : n ≤ m) (G : SimpleGraph (Fin n ⊕ Fin n)) :
    ∃ H : SimpleGraph (Fin m ⊕ Fin m),
      perfectMatchingCount H = perfectMatchingCount G ∧ graphExcess m H = graphExcess n G := by
  induction m, hnm using Nat.le_induction with
  | base => exact ⟨G, rfl, rfl⟩
  | succ m _ ih =>
    obtain ⟨H, hp, he⟩ := ih
    obtain ⟨H', hp', he'⟩ := extend_canonical_witness m H
    exact ⟨H', hp'.trans hp, he'.trans he⟩

end HartkeMatchingExcess
