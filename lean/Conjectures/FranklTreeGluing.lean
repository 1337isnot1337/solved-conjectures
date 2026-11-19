module

public import Conjectures.FranklIncidence
public import Conjectures.FranklTreeCounts
public import Mathlib.Data.Sigma.Basic

@[expose] public section

/-!
# Independent-set configurations under rooted graph gluing

The graph here joins a new root to the distinguished top of each disjoint
branch. Boundary conditions are explicit: selected and unselected vertices
must lie in their permitted sets, and a prescribed set of vertices may
already be dominated from outside. This permits fixed exterior configurations
when a finite graph is cut at the boundary of a tree ball.
-/

namespace FranklTreeGluing

open SimpleGraph

variable {ι : Type*} {V : ι → Type*}

def attachedGraph (G : ∀ i, SimpleGraph (V i)) (top : ∀ i, V i) :
    SimpleGraph (Option (Sigma V)) where
  Adj
    | none, some v => v.2 = top v.1
    | some v, none => v.2 = top v.1
    | some v, some w => ∃ i x y, v = ⟨i, x⟩ ∧ w = ⟨i, y⟩ ∧ (G i).Adj x y
    | none, none => False
  symm := ⟨by
    intro v w h
    cases v with
    | none => cases w <;> exact h
    | some v =>
        cases w with
        | none => exact h
        | some w =>
            obtain ⟨i, x, y, hv, hw, hxy⟩ := h
            exact ⟨i, y, x, hw, hv, hxy.symm⟩⟩
  loopless := ⟨by
    intro v
    cases v with
    | none => exact id
    | some v =>
        rintro ⟨i, x, y, hx, hy, hxy⟩
        exact hxy.ne (sigma_mk_injective (hx.symm.trans hy))⟩

def glueSet (rootSelected : Prop) (S : ∀ i, Set (V i)) : Set (Option (Sigma V))
  | none => rootSelected
  | some v => v.2 ∈ S v.1

def rootFreeSet (S : ∀ i, Set (V i)) : Set (Option (Sigma V)) := glueSet True S

def outsideSet (S : ∀ i, Set (V i)) : Set (Option (Sigma V)) := glueSet False S

def Dominated {W : Type*} (G : SimpleGraph W) (outside S : Set W) (v : W) : Prop :=
  v ∈ outside ∨ ∃ w ∈ S, G.Adj v w

/-- The top is the only vertex allowed to await domination by its parent. -/
structure Valid {W : Type*} (G : SimpleGraph W) (top : W)
    (outside canSelect canOmit S : Set W) : Prop where
  independent : G.IsIndepSet S
  selected_allowed : S ⊆ canSelect
  omitted_allowed : Sᶜ ⊆ canOmit
  dominates_away : ∀ v, v ≠ top → v ∉ S → Dominated G outside S v

theorem glue_independent_iff (G : ∀ i, SimpleGraph (V i)) (top : ∀ i, V i)
    (r : Prop) (S : ∀ i, Set (V i)) :
    (attachedGraph G top).IsIndepSet (glueSet r S) ↔
      (∀ i, (G i).IsIndepSet (S i)) ∧ (r → ∀ i, top i ∉ S i) := by
  constructor
  · intro h
    constructor
    · intro i x hx y hy _ hxy
      have hadj : (attachedGraph G top).Adj (some ⟨i, x⟩) (some ⟨i, y⟩) :=
        ⟨i, x, y, rfl, rfl, hxy⟩
      exact h hx hy hadj.ne hadj
    · intro hr i hi
      exact h (show none ∈ glueSet r S from hr)
        (show some ⟨i, top i⟩ ∈ glueSet r S from hi) (by simp) rfl
  · rintro ⟨hlocal, htop⟩ a ha b hb _ hadj
    cases a with
    | none =>
        cases b with
        | none => exact hadj
        | some b =>
            rcases b with ⟨i, x⟩
            change x = top i at hadj
            subst x
            exact htop ha i hb
    | some a =>
        cases b with
        | none =>
            rcases a with ⟨i, x⟩
            change x = top i at hadj
            subst x
            exact htop hb i ha
        | some b =>
            obtain ⟨i, x, y, rfl, rfl, hxy⟩ := hadj
            exact hlocal i ha hb hxy.ne hxy

theorem dominated_root_iff (G : ∀ i, SimpleGraph (V i)) (top : ∀ i, V i)
    (outside S : ∀ i, Set (V i)) (r : Prop) :
    Dominated (attachedGraph G top) (outsideSet outside) (glueSet r S) none ↔
      ∃ i, top i ∈ S i := by
  constructor
  · rintro (h | ⟨v, hv, hadj⟩)
    · exact h.elim
    · cases v with
      | none => exact hadj.elim
      | some v =>
          rcases v with ⟨i, x⟩
          change x = top i at hadj
          subst x
          exact ⟨i, hv⟩
  · rintro ⟨i, hi⟩
    exact Or.inr ⟨some ⟨i, top i⟩, hi, rfl⟩

theorem dominated_child_iff (G : ∀ i, SimpleGraph (V i)) (top : ∀ i, V i)
    (outside S : ∀ i, Set (V i)) (r : Prop) (i : ι) (v : V i) :
    Dominated (attachedGraph G top) (outsideSet outside) (glueSet r S) (some ⟨i, v⟩) ↔
      (r ∧ v = top i) ∨ Dominated (G i) (outside i) (S i) v := by
  constructor
  · rintro (h | ⟨w, hw, hadj⟩)
    · exact Or.inr (Or.inl h)
    · cases w with
      | none => exact Or.inl ⟨hw, hadj⟩
      | some w =>
          obtain ⟨j, x, y, hx, hy, hxy⟩ := hadj
          have hij := (Sigma.mk.inj_iff.mp hx).1
          subst j
          have hvx : v = x := sigma_mk_injective hx
          subst x
          subst w
          exact Or.inr (Or.inr ⟨y, hw, hxy⟩)
  · rintro (⟨hr, hv⟩ | ho | ⟨w, hw, hvw⟩)
    · exact Or.inr ⟨none, hr, hv⟩
    · exact Or.inl ho
    · exact Or.inr ⟨some ⟨i, w⟩, hw, i, v, w, rfl, rfl, hvw⟩

/-- Full graph-level validity separates into branch validity and the two
conditions across the edges from the new root to its children. -/
theorem glue_valid_iff (G : ∀ i, SimpleGraph (V i)) (top : ∀ i, V i)
    (outside canSelect canOmit S : ∀ i, Set (V i)) (r : Prop) :
    Valid (attachedGraph G top) none (outsideSet outside)
        (rootFreeSet canSelect) (rootFreeSet canOmit) (glueSet r S) ↔
      (∀ i, Valid (G i) (top i) (outside i) (canSelect i) (canOmit i) (S i)) ∧
        (r → ∀ i, top i ∉ S i) ∧
        (¬r → ∀ i, top i ∉ S i → Dominated (G i) (outside i) (S i) (top i)) := by
  classical
  constructor
  · intro h
    have hi := (glue_independent_iff G top r S).mp h.independent
    refine ⟨?_, hi.2, ?_⟩
    · intro i
      refine ⟨hi.1 i, ?_, ?_, ?_⟩
      · intro v hv
        exact h.selected_allowed (show some ⟨i, v⟩ ∈ glueSet r S from hv)
      · intro v hv
        exact h.omitted_allowed (show some ⟨i, v⟩ ∉ glueSet r S from hv)
      · intro v hvt hv
        have hd := h.dominates_away (some ⟨i, v⟩) (by simp) hv
        rcases (dominated_child_iff G top outside S r i v).mp hd with hr | hd
        · exact (hvt hr.2).elim
        · exact hd
    · intro hr i hi'
      have hd := h.dominates_away (some ⟨i, top i⟩) (by simp) hi'
      rcases (dominated_child_iff G top outside S r i (top i)).mp hd with hb | hd
      · exact (hr hb.1).elim
      · exact hd
  · rintro ⟨hlocal, htop, hdom⟩
    refine ⟨(glue_independent_iff G top r S).mpr ⟨fun i => (hlocal i).independent, htop⟩,
      ?_, ?_, ?_⟩
    · intro v hv
      cases v with
      | none => trivial
      | some v => exact (hlocal v.1).selected_allowed hv
    · intro v hv
      cases v with
      | none => trivial
      | some v => exact (hlocal v.1).omitted_allowed hv
    · intro v hne hv
      cases v with
      | none => exact (hne rfl).elim
      | some v =>
          rcases v with ⟨i, v⟩
          apply (dominated_child_iff G top outside S r i v).mpr
          by_cases hvt : v = top i
          · subst v
            by_cases hr : r
            · exact Or.inl ⟨hr, rfl⟩
            · exact Or.inr (hdom hr i hv)
          · exact Or.inr ((hlocal i).dominates_away v hvt hv)

end FranklTreeGluing
