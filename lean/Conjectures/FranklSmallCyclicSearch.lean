module

public import Mathlib.Data.Finset.Card
public import Mathlib.Data.Finset.Disjoint
public import Mathlib.Data.Fintype.Powerset

@[expose] public section

/-! A finite exhaustive certificate for small cyclic generator families.

The checker splits on membership of an actual generator. Its state contains
a lower and an upper bound for the unknown generator family. Each leaf
records an elementary abundance obstruction. The soundness theorem covers
every family between the bounds, so the producer need not be trusted.
-/

namespace FranklSmallCyclic

variable {α : Type*} [DecidableEq α]

def paschBase : Finset (Finset (Fin 6)) :=
  {{0, 1, 2}, {0, 3, 4}, {2, 3, 5}, {1, 4, 5}}

abbrev TripleWitness (G : Finset (Finset α)) (A B C : Finset α) (p : α) : Prop :=
  A ∈ G ∧ B ∈ G ∧ C ∈ G ∧ A.card = 3 ∧ B.card = 3 ∧ C.card = 3 ∧
    A ≠ B ∧ A ≠ C ∧ B ≠ C ∧ p ∈ A ∧ p ∈ B ∧ p ∈ C

abbrev TwoPointWitness (lower upper : Finset (Finset α)) (g : Finset α)
    (x y : α) : Prop :=
  g ∈ lower ∧ x ∈ g ∧ y ∈ g ∧
    ∀ e ∈ upper, ¬ Disjoint e g → x ∈ e ∨ y ∈ e

abbrev PaschWitness (G : Finset (Finset α)) (f : Fin 6 → α) : Prop :=
  Function.Injective f ∧ paschBase.image (Finset.image f) ⊆ G

def Obstruction (G : Finset (Finset α)) : Prop :=
  G = ∅ ∨
    (∃ A B C p, TripleWitness G A B C p) ∨
    (∃ g x y, TwoPointWitness G G g x y) ∨
    ∃ f, PaschWitness G f

inductive SearchTree (α : Type*) where
  | empty : SearchTree α
  | triple (A B C : Finset α) (p : α) : SearchTree α
  | twoPoint (g : Finset α) (x y : α) : SearchTree α
  | pasch (f : Fin 6 → α) : SearchTree α
  | split (g : Finset α) (absent present : SearchTree α) : SearchTree α

def check (lower upper : Finset (Finset α)) : SearchTree α → Bool
  | .empty => decide (upper = ∅)
  | .triple A B C p => decide (TripleWitness lower A B C p)
  | .twoPoint g x y => decide (TwoPointWitness lower upper g x y)
  | .pasch f => decide (PaschWitness lower f)
  | .split g absent present =>
      check lower (upper.erase g) absent && check (insert g lower) upper present

omit [DecidableEq α] in
theorem tripleWitness_mono {G H : Finset (Finset α)} {A B C : Finset α} {p : α}
    (h : G ⊆ H) (hw : TripleWitness G A B C p) : TripleWitness H A B C p := by
  rcases hw with ⟨hA, hB, hC, hrest⟩
  exact ⟨h hA, h hB, h hC, hrest⟩

omit [DecidableEq α] in
theorem twoPointWitness_between {lower upper G : Finset (Finset α)}
    {g : Finset α} {x y : α} (hl : lower ⊆ G) (hu : G ⊆ upper)
    (hw : TwoPointWitness lower upper g x y) : TwoPointWitness G G g x y := by
  rcases hw with ⟨hg, hx, hy, hh⟩
  exact ⟨hl hg, hx, hy, fun e he => hh e (hu he)⟩

theorem paschWitness_mono {G H : Finset (Finset α)} {f : Fin 6 → α}
    (h : G ⊆ H) (hw : PaschWitness G f) : PaschWitness H f :=
  ⟨hw.1, hw.2.trans h⟩

/-- A successful tree proves that every family in the checked interval has
one of the explicitly recorded obstructions. There is no enumeration or
native-computation assumption in this theorem. -/
theorem check_sound (t : SearchTree α) (lower upper G : Finset (Finset α))
    (hc : check lower upper t = true) (hl : lower ⊆ G) (hu : G ⊆ upper) :
    Obstruction G := by
  induction t generalizing lower upper with
  | empty =>
      have h := of_decide_eq_true hc
      exact Or.inl (Finset.subset_empty.mp (h ▸ hu))
  | triple A B C p =>
      exact Or.inr (Or.inl ⟨A, B, C, p,
        tripleWitness_mono hl (of_decide_eq_true hc)⟩)
  | twoPoint g x y =>
      exact Or.inr (Or.inr (Or.inl ⟨g, x, y,
        twoPointWitness_between hl hu (of_decide_eq_true hc)⟩))
  | pasch f =>
      exact Or.inr (Or.inr (Or.inr ⟨f,
        paschWitness_mono hl (of_decide_eq_true hc)⟩))
  | split g absent present ihAbsent ihPresent =>
      have hab : check lower (upper.erase g) absent = true ∧
          check (insert g lower) upper present = true := by simpa only [check, Bool.and_eq_true] using hc
      obtain ⟨ha, hp⟩ := hab
      by_cases hg : g ∈ G
      · exact ihPresent (insert g lower) upper hp
          (Finset.insert_subset_iff.mpr ⟨hg, hl⟩) hu
      · apply ihAbsent lower (upper.erase g) ha hl
        intro e he
        exact Finset.mem_erase.mpr ⟨fun h => hg (h ▸ he), hu he⟩

end FranklSmallCyclic
