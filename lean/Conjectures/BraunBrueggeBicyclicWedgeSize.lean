import Conjectures.BraunBrueggeBicyclicWedge

/-! The two sides of a graph wedge share a vertex and have disjoint edge sets. -/

open Set
open scoped Sym2

namespace BraunBruegge

variable {V W : Type*}

private theorem wedgeImages_eq_only_at_none {v : Option V} {w : Option W}
    (h : wedgeLeft v = wedgeRight w) : v = none ∧ w = none := by
  cases v <;> cases w <;> simp_all

private def leftWedgeEdge (G : SimpleGraph (Option V)) (H : SimpleGraph (Option W)) (e : G.edgeSet) :
    (wedge G H).edgeSet :=
  ⟨e.val.map wedgeLeft, by
    obtain ⟨⟨u, v⟩, he⟩ := e
    exact (wedgeInl G H).map_adj he⟩

private def rightWedgeEdge (G : SimpleGraph (Option V)) (H : SimpleGraph (Option W)) (e : H.edgeSet) :
    (wedge G H).edgeSet :=
  ⟨e.val.map wedgeRight, by
    obtain ⟨⟨u, v⟩, he⟩ := e
    exact (wedgeInr G H).map_adj he⟩

private theorem wedge_edge_images_disjoint (G : SimpleGraph (Option V)) (H : SimpleGraph (Option W))
    (e : G.edgeSet) (f : H.edgeSet) : leftWedgeEdge G H e ≠ rightWedgeEdge G H f := by
  obtain ⟨⟨u, v⟩, he⟩ := e
  obtain ⟨⟨x, y⟩, hf⟩ := f
  intro h
  have h' : s(wedgeLeft u, wedgeLeft v) = s(wedgeRight x, wedgeRight y) := congrArg Subtype.val h
  have hG : G.Adj u v := he
  rcases Sym2.eq_iff.mp h' with ⟨h₁, h₂⟩ | ⟨h₁, h₂⟩
  · exact hG.ne ((wedgeImages_eq_only_at_none h₁).1.trans (wedgeImages_eq_only_at_none h₂).1.symm)
  · exact hG.ne ((wedgeImages_eq_only_at_none h₁).1.trans (wedgeImages_eq_only_at_none h₂).1.symm)

noncomputable def wedgeEdgesEquiv (G : SimpleGraph (Option V)) (H : SimpleGraph (Option W)) :
    G.edgeSet ⊕ H.edgeSet ≃ (wedge G H).edgeSet := by
  let f : G.edgeSet ⊕ H.edgeSet → (wedge G H).edgeSet := Sum.elim (leftWedgeEdge G H) (rightWedgeEdge G H)
  apply Equiv.ofBijective f
  constructor
  · rintro (a | a) (b | b) he
    · have h : a.val.map wedgeLeft = b.val.map wedgeLeft := congrArg Subtype.val he
      have e : a = b := Subtype.ext ((Sym2.map.injective wedgeLeft.injective) h)
      exact congrArg Sum.inl e
    · exact (wedge_edge_images_disjoint G H a b he).elim
    · exact (wedge_edge_images_disjoint G H b a he.symm).elim
    · have h : a.val.map wedgeRight = b.val.map wedgeRight := congrArg Subtype.val he
      have e : a = b := Subtype.ext ((Sym2.map.injective wedgeRight.injective) h)
      exact congrArg Sum.inr e
  · rintro ⟨e, he⟩
    induction e using Sym2.inductionOn with
    | hf u v =>
      have h : (wedge G H).Adj u v := he
      rcases wedge_adj_iff.mp h with ⟨a, b, hab, rfl, rfl⟩ | ⟨a, b, hab, rfl, rfl⟩
      · exact ⟨.inl ⟨s(a, b), hab⟩, rfl⟩
      · exact ⟨.inr ⟨s(a, b), hab⟩, rfl⟩

theorem wedge_edge_card [Fintype V] [Fintype W] (G : SimpleGraph (Option V)) (H : SimpleGraph (Option W)) :
    Nat.card (wedge G H).edgeSet = Nat.card G.edgeSet + Nat.card H.edgeSet := by
  rw [← Nat.card_congr (wedgeEdgesEquiv G H), Nat.card_sum]

theorem wedge_vertex_card_add_one [Fintype V] [Fintype W] :
    Fintype.card (Option (V ⊕ W)) + 1 = Fintype.card (Option V) + Fintype.card (Option W) := by
  simp only [Fintype.card_option, Fintype.card_sum]
  omega

end BraunBruegge
