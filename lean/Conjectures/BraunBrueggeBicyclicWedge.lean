import Conjectures.BraunBrueggeMinimumFacets
import Mathlib.Data.Fintype.Option

/-! One-vertex gluing of connected graphs multiplies the numbers of facets of
their symmetric edge polytopes. Both restrictions use the glued vertex as
the zero coordinate of the polar. -/

open Set

namespace BraunBruegge

variable {V W : Type*}

def wedgeLeft : Option V ↪ Option (V ⊕ W) := Function.Embedding.inl.optionMap

def wedgeRight : Option W ↪ Option (V ⊕ W) := Function.Embedding.inr.optionMap

def wedge (G : SimpleGraph (Option V)) (H : SimpleGraph (Option W)) : SimpleGraph (Option (V ⊕ W)) :=
  G.map wedgeLeft ⊔ H.map wedgeRight

@[simp] theorem wedgeLeft_none : wedgeLeft (none : Option V) = (none : Option (V ⊕ W)) := rfl

@[simp] theorem wedgeRight_none : wedgeRight (none : Option W) = (none : Option (V ⊕ W)) := rfl

@[simp] theorem wedgeLeft_some (v : V) : wedgeLeft (some v) = (some (.inl v) : Option (V ⊕ W)) := rfl

@[simp] theorem wedgeRight_some (w : W) : wedgeRight (some w) = (some (.inr w) : Option (V ⊕ W)) := rfl

theorem wedge_adj_iff {G : SimpleGraph (Option V)} {H : SimpleGraph (Option W)} {x y : Option (V ⊕ W)} :
    (wedge G H).Adj x y ↔
      (∃ u v, G.Adj u v ∧ wedgeLeft u = x ∧ wedgeLeft v = y) ∨
      (∃ u v, H.Adj u v ∧ wedgeRight u = x ∧ wedgeRight v = y) := by
  rw [wedge, SimpleGraph.sup_adj, SimpleGraph.map_adj wedgeLeft, SimpleGraph.map_adj wedgeRight]

def wedgeInl (G : SimpleGraph (Option V)) (H : SimpleGraph (Option W)) : G →g wedge G H where
  toFun := wedgeLeft
  map_rel' e := wedge_adj_iff.mpr (Or.inl ⟨_, _, e, rfl, rfl⟩)

def wedgeInr (G : SimpleGraph (Option V)) (H : SimpleGraph (Option W)) : H →g wedge G H where
  toFun := wedgeRight
  map_rel' e := wedge_adj_iff.mpr (Or.inr ⟨_, _, e, rfl, rfl⟩)

private def wedgeLeftProject : Option (V ⊕ W) → Option V
  | none => none
  | some (.inl v) => some v
  | some (.inr _) => none

private def wedgeRightProject : Option (V ⊕ W) → Option W
  | none => none
  | some (.inl _) => none
  | some (.inr w) => some w

@[simp] private theorem wedgeLeftProject_left (u : Option V) :
    wedgeLeftProject (wedgeLeft u : Option (V ⊕ W)) = u := by cases u <;> rfl

@[simp] private theorem wedgeLeftProject_right (v : Option W) :
    wedgeLeftProject (wedgeRight v : Option (V ⊕ W)) = none := by cases v <;> rfl

@[simp] private theorem wedgeRightProject_left (u : Option V) :
    wedgeRightProject (wedgeLeft u : Option (V ⊕ W)) = none := by cases u <;> rfl

@[simp] private theorem wedgeRightProject_right (v : Option W) :
    wedgeRightProject (wedgeRight v : Option (V ⊕ W)) = v := by cases v <;> rfl

private theorem reachable_map_of_adj_reachable {α β : Type*} {A : SimpleGraph α} {B : SimpleGraph β}
    (f : α → β) (h : ∀ ⦃u v⦄, A.Adj u v → B.Reachable (f u) (f v))
    {u v : α} (p : A.Reachable u v) : B.Reachable (f u) (f v) := by
  obtain ⟨w⟩ := p
  induction w with
  | nil => exact SimpleGraph.Reachable.refl _
  | cons e _ ih => exact (h e).trans ih

theorem wedge_connected_iff {G : SimpleGraph (Option V)} {H : SimpleGraph (Option W)} :
    (wedge G H).Connected ↔ G.Connected ∧ H.Connected := by
  constructor
  · intro h
    have hL {u v : Option (V ⊕ W)} (he : (wedge G H).Adj u v) :
        G.Reachable (wedgeLeftProject u) (wedgeLeftProject v) := by
      rcases wedge_adj_iff.mp he with ⟨x, y, e, rfl, rfl⟩ | ⟨x, y, _, rfl, rfl⟩
      · simpa using e.reachable
      · simp
    have hR {u v : Option (V ⊕ W)} (he : (wedge G H).Adj u v) :
        H.Reachable (wedgeRightProject u) (wedgeRightProject v) := by
      rcases wedge_adj_iff.mp he with ⟨x, y, _, rfl, rfl⟩ | ⟨x, y, e, rfl, rfl⟩
      · simp
      · simpa using e.reachable
    refine ⟨⟨fun u v => ?_⟩, ⟨fun u v => ?_⟩⟩
    · simpa using reachable_map_of_adj_reachable wedgeLeftProject (fun _ _ e => hL e) (h (wedgeLeft u) (wedgeLeft v))
    · simpa using reachable_map_of_adj_reachable wedgeRightProject (fun _ _ e => hR e) (h (wedgeRight u) (wedgeRight v))
  · rintro ⟨hG, hH⟩
    have h (v : Option (V ⊕ W)) : (wedge G H).Reachable none v := by
      rcases v with _ | (v | w)
      · exact SimpleGraph.Reachable.refl _
      · exact (hG none (some v)).map (wedgeInl G H)
      · exact (hH none (some w)).map (wedgeInr G H)
    exact ⟨fun u v => (h u).symm.trans (h v)⟩

theorem mem_polar_wedge_iff {G : SimpleGraph (Option V)} {H : SimpleGraph (Option W)}
    {f : Option (V ⊕ W) → ℝ} : f ∈ polar (wedge G H) none ↔
      f ∘ wedgeLeft ∈ polar G none ∧ f ∘ wedgeRight ∈ polar H none := by
  constructor
  · intro h
    exact ⟨⟨h.1, fun _ _ e => h.2 ((wedgeInl G H).map_adj e)⟩,
      ⟨h.1, fun _ _ e => h.2 ((wedgeInr G H).map_adj e)⟩⟩
  · rintro ⟨hG, hH⟩
    refine ⟨hG.1, ?_⟩
    intro u v he
    rcases wedge_adj_iff.mp he with ⟨x, y, e, rfl, rfl⟩ | ⟨x, y, e, rfl, rfl⟩
    · exact hG.2 e
    · exact hH.2 e

theorem tightGraph_wedge (G : SimpleGraph (Option V)) (H : SimpleGraph (Option W))
    (f : Option (V ⊕ W) → ℝ) : tightGraph (wedge G H) f =
      wedge (tightGraph G (f ∘ wedgeLeft)) (tightGraph H (f ∘ wedgeRight)) := by
  ext u v
  constructor
  · rintro ⟨he, ht⟩
    rcases wedge_adj_iff.mp he with ⟨x, y, e, rfl, rfl⟩ | ⟨x, y, e, rfl, rfl⟩
    · exact wedge_adj_iff.mpr (Or.inl ⟨x, y, ⟨e, ht⟩, rfl, rfl⟩)
    · exact wedge_adj_iff.mpr (Or.inr ⟨x, y, ⟨e, ht⟩, rfl, rfl⟩)
  · intro he
    rcases wedge_adj_iff.mp he with ⟨x, y, ⟨e, ht⟩, rfl, rfl⟩ | ⟨x, y, ⟨e, ht⟩, rfl, rfl⟩
    · exact ⟨wedge_adj_iff.mpr (Or.inl ⟨x, y, e, rfl, rfl⟩), ht⟩
    · exact ⟨wedge_adj_iff.mpr (Or.inr ⟨x, y, e, rfl, rfl⟩), ht⟩

theorem mem_extreme_wedge_iff [Fintype V] [Fintype W] {G : SimpleGraph (Option V)} {H : SimpleGraph (Option W)}
    {f : Option (V ⊕ W) → ℝ} : f ∈ (polar (wedge G H) none).extremePoints ℝ ↔
      f ∘ wedgeLeft ∈ (polar G none).extremePoints ℝ ∧ f ∘ wedgeRight ∈ (polar H none).extremePoints ℝ := by
  rw [mem_extreme_polar_iff, mem_extreme_polar_iff, mem_extreme_polar_iff, mem_polar_wedge_iff,
    tightGraph_wedge, wedge_connected_iff]
  tauto

private def joinPolar (f : Option V → ℝ) (g : Option W → ℝ) : Option (V ⊕ W) → ℝ
  | none => 0
  | some (.inl v) => f (some v)
  | some (.inr w) => g (some w)

private theorem joinPolar_left {f : Option V → ℝ} (g : Option W → ℝ) (hf : f none = 0) :
    joinPolar f g ∘ wedgeLeft = f := by
  funext v
  cases v with
  | none => exact hf.symm
  | some v => rfl

private theorem joinPolar_right (f : Option V → ℝ) {g : Option W → ℝ} (hg : g none = 0) :
    joinPolar f g ∘ wedgeRight = g := by
  funext w
  cases w with
  | none => exact hg.symm
  | some w => rfl

noncomputable def wedgePolarVerticesEquiv [Fintype V] [Fintype W]
    (G : SimpleGraph (Option V)) (H : SimpleGraph (Option W)) :
    (polar (wedge G H) none).extremePoints ℝ ≃
      ((polar G none).extremePoints ℝ) × ((polar H none).extremePoints ℝ) where
  toFun s := ⟨⟨s.val ∘ wedgeLeft, (mem_extreme_wedge_iff.mp s.property).1⟩,
    ⟨s.val ∘ wedgeRight, (mem_extreme_wedge_iff.mp s.property).2⟩⟩
  invFun p := ⟨joinPolar p.1.val p.2.val, mem_extreme_wedge_iff.mpr (by
    rw [joinPolar_left _ p.1.property.1.1, joinPolar_right _ p.2.property.1.1]
    exact ⟨p.1.property, p.2.property⟩)⟩
  left_inv s := by
    apply Subtype.ext
    funext u
    rcases u with _ | (v | w)
    · exact s.property.1.1.symm
    · rfl
    · rfl
  right_inv p := Prod.ext (Subtype.ext (joinPolar_left _ p.1.property.1.1))
    (Subtype.ext (joinPolar_right _ p.2.property.1.1))

/-- Gluing two connected graphs at their distinguished vertices multiplies
actual facet counts. The factors each have at least two vertices. -/
theorem wedge_facet_card [Fintype V] [Fintype W] [DecidableEq V] [DecidableEq W] [Nonempty V] [Nonempty W]
    {G : SimpleGraph (Option V)} {H : SimpleGraph (Option W)} (hG : G.Connected) (hH : H.Connected) :
    Nat.card {F // IsFacet (wedge G H) F} = Nat.card {F // IsFacet G F} * Nat.card {F // IsFacet H F} := by
  rw [← Nat.card_congr (polarVerticesEquivFacets (wedge_connected_iff.mpr ⟨hG, hH⟩) none),
    ← Nat.card_congr (polarVerticesEquivFacets hG none), ← Nat.card_congr (polarVerticesEquivFacets hH none),
    Nat.card_congr (wedgePolarVerticesEquiv G H), Nat.card_prod]

end BraunBruegge
