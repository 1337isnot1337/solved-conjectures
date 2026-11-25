module

public import Mathlib.Data.List.Forall2
public import Mathlib.Data.Finset.Image
public import Mathlib.Algebra.BigOperators.Group.Finset.Basic
public import Mathlib.Tactic

@[expose] public section
namespace McNamaraSteingrimsson
open scoped BigOperators

/-- A layer of size one or two; a true letter denotes a layer of size two. -/
def layerSize (b : Bool) : ℕ := if b then 2 else 1

/-- Literal increasing-position matching with host layer sizes at least as large. -/
abbrev LayerSubword := List.SublistForall₂ (fun a b => layerSize a≤layerSize b)

theorem subword_tail {a : Bool} {u v : List Bool} (h : LayerSubword (a::u) v) :
    LayerSubword u v := by
  generalize hu : a::u = w at h
  induction h with
  | nil => contradiction
  | cons hab hv _ =>
    cases hu
    exact .cons_right hv
  | cons_right hv ih =>
    exact .cons_right (ih hu)

theorem subword_cons_of_fits {a b : Bool} {u v : List Bool} (hab : layerSize a≤layerSize b) :
    LayerSubword (a::u) (b::v) ↔ LayerSubword u v := by
  constructor
  · intro h
    cases h with
    | cons _ h => exact h
    | cons_right h => exact subword_tail h
  · exact .cons hab

theorem subword_cons_of_not_fits {a b : Bool} {u v : List Bool}
    (hab : ¬layerSize a≤layerSize b) :
    LayerSubword (a::u) (b::v) ↔ LayerSubword (a::u) v := by
  constructor
  · intro h
    cases h with
    | cons h _ => exact (hab h).elim
    | cons_right h => exact h
  · exact .cons_right

def prefixEmbed (b : Bool) : List Bool ↪ List Bool :=
  ⟨List.cons b, fun _ _ h => (List.cons.inj h).2⟩

/-- The second component retains all the nonempty accepted words starting in
a size-two letter. This permits a structurally recursive greedy enumerator. -/
def layerWordsState : List Bool → Finset (List Bool) × Finset (List Bool)
  | [] => ({[]},∅)
  | b::v =>
    let s := layerWordsState v
    let t := if b then s.1.map (prefixEmbed true) else s.2
    (insert [] (s.1.map (prefixEmbed false) ∪ t),t)

def layerWords (v : List Bool) : Finset (List Bool) := (layerWordsState v).1

theorem mem_layerWordsState (v : List Bool) :
    (∀ u, u ∈ (layerWordsState v).1 ↔ LayerSubword u v) ∧
    (∀ u, u ∈ (layerWordsState v).2 ↔ ∃ w, u=true::w ∧ LayerSubword u v) := by
  induction v with
  | nil =>
    constructor
    · intro u
      cases u with
      | nil => simp [layerWordsState, List.SublistForall₂.nil]
      | cons a u =>
        simp only [layerWordsState, Finset.mem_singleton, List.cons_ne_nil,false_iff]
        intro h
        cases h
    · intro u
      simp only [layerWordsState,Finset.notMem_empty,false_iff]
      rintro ⟨w,rfl,h⟩
      cases h
  | cons b v ih =>
    have htwo (u : List Bool) :
        u ∈ (layerWordsState (b::v)).2 ↔ ∃ w, u=true::w ∧ LayerSubword u (b::v) := by
      cases b with
      | false =>
        simp only [layerWordsState,Bool.false_eq_true,ite_false,ih.2]
        constructor <;> rintro ⟨w,rfl,h⟩ <;> use w <;> refine ⟨rfl,?_⟩
        · exact .cons_right h
        · exact (subword_cons_of_not_fits (a := true) (b := false) (by decide)).mp h
      | true =>
        simp only [layerWordsState,ite_true,Finset.mem_map]
        constructor
        · rintro ⟨w,hw,rfl⟩
          exact ⟨w,rfl,.cons (by decide) ((ih.1 w).mp hw)⟩
        · rintro ⟨w,rfl,hw⟩
          exact ⟨w,(ih.1 w).mpr ((subword_cons_of_fits (by decide)).mp hw),rfl⟩
    refine ⟨?_,htwo⟩
    intro u
    change u ∈ insert [] ((layerWordsState v).1.map (prefixEmbed false) ∪
        (layerWordsState (b::v)).2) ↔ LayerSubword u (b::v)
    rw [Finset.mem_insert,Finset.mem_union,htwo,Finset.mem_map]
    cases u with
    | nil =>
      exact iff_of_true (Or.inl rfl) .nil
    | cons a u =>
      cases a with
      | false =>
        simp only [List.cons_ne_nil,false_or]
        constructor
        · rintro (⟨w,hw,he⟩|⟨w,he,_⟩)
          · have he' : w=u := (List.cons.inj he).2
            subst w
            exact .cons (by cases b <;> decide) ((ih.1 u).mp hw)
          · cases he
        · intro h
          exact Or.inl ⟨u,(ih.1 u).mpr
            ((subword_cons_of_fits (a := false) (by cases b <;> decide)).mp h),rfl⟩
      | true =>
        constructor
        · rintro (h|⟨w,_,h⟩|⟨_,_,h⟩)
          · cases h
          · change false::w=true::u at h
            cases h
          · exact h
        · intro h
          exact Or.inr (Or.inr ⟨u,rfl,h⟩)

theorem mem_layerWords {u v : List Bool} : u ∈ layerWords v ↔ LayerSubword u v :=
  (mem_layerWordsState v).1 u

end McNamaraSteingrimsson
