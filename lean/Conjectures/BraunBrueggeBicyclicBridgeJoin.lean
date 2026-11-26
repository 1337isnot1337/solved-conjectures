import Conjectures.BraunBrueggeMinimumPolar

/-! The two sides of a bridge join are joined by a single prescribed edge.
Connectedness of a spanning tight graph factors across that edge. -/

namespace BraunBruegge

variable {V W : Type*}

def bridgeJoin (G : SimpleGraph V) (H : SimpleGraph W) (u : V) (v : W) (present : Prop := True) :
    SimpleGraph (V ⊕ W) where
  Adj
    | .inl a, .inl b => G.Adj a b
    | .inr a, .inr b => H.Adj a b
    | .inl a, .inr b => a = u ∧ b = v ∧ present
    | .inr a, .inl b => b = u ∧ a = v ∧ present
  symm := ⟨by rintro (a | a) (b | b) h; exacts [h.symm, h, h, h.symm]⟩
  loopless := ⟨by rintro (a | a) h; exacts [G.loopless.irrefl a h, H.loopless.irrefl a h]⟩

private theorem reach_under_projection {A : SimpleGraph V} {B : SimpleGraph W} (f : V → W)
    (h : ∀ ⦃x y⦄, A.Adj x y → B.Reachable (f x) (f y)) {x y : V} (r : A.Reachable x y) :
    B.Reachable (f x) (f y) := by
  rw [SimpleGraph.reachable_eq_reflTransGen] at r ⊢
  exact r.lift' f (fun _ _ e => (B.reachable_iff_reflTransGen _ _).mp (h e))

theorem bridgeJoin_connected_iff {G : SimpleGraph V} {H : SimpleGraph W} (u : V) (v : W) (present : Prop) :
    (bridgeJoin G H u v present).Connected ↔ G.Connected ∧ H.Connected ∧ present := by
  let J := bridgeJoin G H u v present
  constructor
  · intro hJ
    have hp : present := by
      by_contra hn
      have hstep {x y : V ⊕ W} (e : J.Adj x y) : x.isLeft = y.isLeft := by
        rcases x with x | x <;> rcases y with y | y
        · rfl
        · exact (hn e.2.2).elim
        · exact (hn e.2.2).elim
        · rfl
      have h := eq_of_reachable Sum.isLeft (fun _ _ e => hstep e) (hJ (.inl u) (.inr v))
      cases h
    let left : V ⊕ W → V := Sum.elim id (fun _ => u)
    let right : V ⊕ W → W := Sum.elim (fun _ => v) id
    have hL {x y : V ⊕ W} (e : J.Adj x y) : G.Reachable (left x) (left y) := by
      rcases x with x | x <;> rcases y with y | y
      · exact SimpleGraph.Adj.reachable e
      · have hx : x = u := e.1
        subst x
        exact SimpleGraph.Reachable.refl _
      · have hy : y = u := e.1
        subst y
        exact SimpleGraph.Reachable.refl _
      · exact SimpleGraph.Reachable.refl _
    have hR {x y : V ⊕ W} (e : J.Adj x y) : H.Reachable (right x) (right y) := by
      rcases x with x | x <;> rcases y with y | y
      · exact SimpleGraph.Reachable.refl _
      · have hy : y = v := e.2.1
        subst y
        exact SimpleGraph.Reachable.refl _
      · have hx : x = v := e.2.1
        subst x
        exact SimpleGraph.Reachable.refl _
      · exact SimpleGraph.Adj.reachable e
    let : Nonempty V := ⟨u⟩
    let : Nonempty W := ⟨v⟩
    refine ⟨⟨fun a b => ?_⟩, ⟨fun a b => ?_⟩, hp⟩
    · exact reach_under_projection left (fun _ _ e => hL e) (hJ (.inl a) (.inl b))
    · exact reach_under_projection right (fun _ _ e => hR e) (hJ (.inr a) (.inr b))
  · rintro ⟨hG, hH, hp⟩
    let l : G →g J := ⟨Sum.inl, fun e => e⟩
    let r : H →g J := ⟨Sum.inr, fun e => e⟩
    have he : J.Adj (.inl u) (.inr v) := ⟨rfl, rfl, hp⟩
    have h (z : V ⊕ W) : J.Reachable (.inl u) z := by
      rcases z with z | z
      · exact (hG u z).map l
      · exact he.reachable.trans ((hH v z).map r)
    let : Nonempty (V ⊕ W) := ⟨.inl u⟩
    exact ⟨fun x y => (h x).symm.trans (h y)⟩

end BraunBruegge
