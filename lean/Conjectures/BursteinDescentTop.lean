module

public import Mathlib.Data.Fintype.Card
public import Mathlib.Data.Finset.Card
public import Mathlib.Data.List.Permutation
public import Mathlib.Data.List.Sublists

/-!
# Burstein's refined shape-Wilf conjectures

Conjectures 16 and 17 fail already with the nonempty suffix [1] and the
Ferrers board with row lengths [6, 6, 6, 6, 5, 4]. This file verifies that
single counterexample, sufficient to refute both universal statements.
It does not formalize the stronger every-suffix family of the written proof.

A traversal is recorded as its column labels in increasing row order.
For the order within a selected rectangle, positive column labels are
compared pairwise; every selected row must support every selected column.
-/

public section

namespace Conjectures.BursteinDescentTop

abbrev Board := List ℕ
abbrev Word := List ℕ

def labels (n : ℕ) : Word := List.range' 1 n

def IsFerrers (b : Board) : Prop :=
  b.Pairwise (· ≥ ·) ∧ ∀ x ∈ b, 0 < x

def Fits (b : Board) (w : Word) : Bool :=
  (w.zip b).all fun x => decide (x.1 ≤ x.2)

def Traversal (b : Board) (w : Word) : Prop :=
  w.Perm (labels b.length) ∧ Fits b w = true

/-- Every pair of positions must have the same relative order. -/
def SameOrder : Word → Word → Bool
  | [], [] => true
  | x :: xs, y :: ys =>
      ((xs.zip ys).all fun uv => decide ((x < uv.1) ↔ (y < uv.2))) &&
        SameOrder xs ys
  | _, _ => false

/-- Each selected column must fit in every selected row. -/
def RectangleFits (selection : List (ℕ × ℕ)) : Bool :=
  selection.all fun x => selection.all fun y => decide (x.1 ≤ y.2)

def HitsPattern (σ : Word) (selection : List (ℕ × ℕ)) : Bool :=
  SameOrder (selection.map Prod.fst) σ && RectangleFits selection

def Contains (b : Board) (w σ : Word) : Bool :=
  (List.sublistsLen σ.length (w.zip b)).any (HitsPattern σ)

theorem contains_iff {b : Board} {w σ : Word} :
    Contains b w σ = true ↔
      ∃ selected : List (ℕ × ℕ),
        selected.Sublist (w.zip b) ∧ selected.length = σ.length ∧
          HitsPattern σ selected = true := by
  simp only [Contains, List.any_eq_true, List.mem_sublistsLen, and_assoc]

def AllWords (n : ℕ) : Finset Word :=
  ⟨(labels n).permutations', by
    rw [Multiset.coe_nodup]
    exact (List.permutations_perm_permutations' _).nodup_iff.mp
      (List.nodup_permutations (labels n) List.nodup_range')⟩

theorem mem_allWords_iff {n : ℕ} {w : Word} :
    w ∈ AllWords n ↔ w.Perm (labels n) := by
  simp only [AllWords, Finset.mem_mk, Multiset.mem_coe, List.mem_permutations']

def Avoiders (b : Board) (σ : Word) : Finset Word :=
  (AllWords b.length).filter fun w => Fits b w = true ∧ Contains b w σ = false

theorem mem_avoiders_iff {b : Board} {σ w : Word} :
    w ∈ Avoiders b σ ↔ Traversal b w ∧ Contains b w σ = false := by
  simp only [Avoiders, Finset.mem_filter, mem_allWords_iff, Traversal, and_assoc]

/-- Equal consecutive row lengths form one block of the Ferrers separation. -/
def DescentTopsAux : List (ℕ × ℕ) → Finset ℕ
  | a :: (c :: tail) =>
      if a.2 = c.2 ∧ c.1 < a.1 then
        insert a.1 (DescentTopsAux (c :: tail))
      else DescentTopsAux (c :: tail)
  | _ => ∅

def AscentBottomsAux : List (ℕ × ℕ) → Finset ℕ
  | [] => ∅
  | [a] => {a.1}
  | a :: (c :: tail) =>
      if a.2 ≠ c.2 ∨ a.1 < c.1 then
        insert a.1 (AscentBottomsAux (c :: tail))
      else AscentBottomsAux (c :: tail)

def DescentTops (b : Board) (w : Word) : Finset ℕ :=
  DescentTopsAux (w.zip b)

def AscentBottoms (b : Board) (w : Word) : Finset ℕ :=
  AscentBottomsAux (w.zip b)

def directSum (p σ : Word) : Word :=
  p ++ σ.map (p.length + ·)

def NonemptySuffix (σ : Word) : Prop :=
  σ ≠ [] ∧ σ.Perm (labels σ.length)

/-- The universal claim, restricted to nonempty suffixes. -/
def RefinedShapeWilf (stat : Board → Word → Finset ℕ) : Prop :=
  ∀ b : Board, IsFerrers b →
    ∀ σ : Word, NonemptySuffix σ →
      ∃ e : (Avoiders b (directSum [2, 3, 1] σ)) ≃
          (Avoiders b (directSum [3, 1, 2] σ)),
        ∀ w, stat b w.1 = stat b (e w).1

def sample : Board := [6, 6, 6, 6, 5, 4]
def p : Word := directSum [2, 3, 1] [1]
def q : Word := directSum [3, 1, 2] [1]

private theorem ferrers_sample : IsFerrers sample := by
  simp [IsFerrers, sample, List.pairwise_cons]

private theorem suffix_one : NonemptySuffix [1] := by
  simp [NonemptySuffix, labels]

def Fiber {α β : Type*} [DecidableEq β] (S : Finset α)
    (stat : α → β) (target : β) : Finset α :=
  S.filter fun a => stat a = target

private def equivFiber {α β : Type*} [DecidableEq β]
    {S T : Finset α} (e : S ≃ T) (stat : α → β)
    (h : ∀ x : S, stat x.1 = stat (e x).1) (target : β) :
    (Fiber S stat target) ≃ (Fiber T stat target) where
  toFun x :=
    let hx := Finset.mem_filter.mp x.2
    let a : S := ⟨x.1, hx.1⟩
    ⟨(e a).1, Finset.mem_filter.mpr
      ⟨(e a).2, (h a).symm.trans hx.2⟩⟩
  invFun x :=
    let hx := Finset.mem_filter.mp x.2
    let a : T := ⟨x.1, hx.1⟩
    ⟨(e.symm a).1, Finset.mem_filter.mpr
      ⟨(e.symm a).2, by simpa using (h (e.symm a)).trans (by simpa using hx.2)⟩⟩
  left_inv x := by
    apply Subtype.ext
    simp
  right_inv x := by
    apply Subtype.ext
    simp

private theorem cardFiber_eq {α β : Type*} [DecidableEq β]
    {S T : Finset α} (e : S ≃ T) (stat : α → β)
    (h : ∀ x : S, stat x.1 = stat (e x).1) (target : β) :
    (Fiber S stat target).card = (Fiber T stat target).card := by
  simpa only [Fintype.card_coe] using Fintype.card_congr
    (equivFiber e stat h target)

set_option maxRecDepth 8192 in
set_option maxHeartbeats 8000000 in
theorem descent_p :
    (Fiber (Avoiders sample p) (DescentTops sample) ∅).card = 15 := by decide +kernel

set_option maxRecDepth 8192 in
set_option maxHeartbeats 8000000 in
theorem descent_q :
    (Fiber (Avoiders sample q) (DescentTops sample) ∅).card = 16 := by decide +kernel

set_option maxRecDepth 8192 in
set_option maxHeartbeats 8000000 in
theorem ascent_p :
    (Fiber (Avoiders sample p) (AscentBottoms sample) (labels 6).toFinset).card = 15 := by decide +kernel

set_option maxRecDepth 8192 in
set_option maxHeartbeats 8000000 in
theorem ascent_q :
    (Fiber (Avoiders sample q) (AscentBottoms sample) (labels 6).toFinset).card = 16 := by decide +kernel

/-- Burstein's published Conjecture 16, with the literal Ferrers separation, fails. -/
theorem not_descent_top_shape_wilf : ¬ RefinedShapeWilf DescentTops := by
  intro h
  obtain ⟨e, he⟩ := h sample ferrers_sample [1] suffix_one
  have heq := cardFiber_eq e (DescentTops sample) he ∅
  change (Fiber (Avoiders sample p) (DescentTops sample) ∅).card =
    (Fiber (Avoiders sample q) (DescentTops sample) ∅).card at heq
  rw [descent_p, descent_q] at heq
  exact (by decide : (15 : ℕ) ≠ 16) heq

/-- Burstein's published Conjecture 17 fails on the same witness. -/
theorem not_ascent_bottom_shape_wilf : ¬ RefinedShapeWilf AscentBottoms := by
  intro h
  obtain ⟨e, he⟩ := h sample ferrers_sample [1] suffix_one
  have heq := cardFiber_eq e (AscentBottoms sample) he (labels 6).toFinset
  change (Fiber (Avoiders sample p) (AscentBottoms sample) (labels 6).toFinset).card =
    (Fiber (Avoiders sample q) (AscentBottoms sample) (labels 6).toFinset).card at heq
  rw [ascent_p, ascent_q] at heq
  exact (by decide : (15 : ℕ) ≠ 16) heq

#print axioms not_descent_top_shape_wilf
#print axioms not_ascent_bottom_shape_wilf

end Conjectures.BursteinDescentTop
