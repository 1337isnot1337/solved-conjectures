module

public import Mathlib.Algebra.Polynomial.Coeff
public import Mathlib.Data.Finset.Powerset
public import Mathlib.Data.Finset.Card
public import Mathlib.Tactic

/-! Parking preference words and partial objects for the marked-excedance count. -/

@[expose] public section

namespace AlexanderssonParkingExcedance

open Finset Polynomial

/-- Preference words. Position and preference are indexed from zero. -/
abbrev Word (n : ℕ) := Fin n → Fin n

/-- The prefix-count condition equivalent to the usual sorted parking condition. -/
def IsParking {n : ℕ} (w : Word n) : Prop :=
  ∀ j : Fin n, j.val + 1 ≤ (univ.filter (fun i => w i ≤ j)).card

instance {n : ℕ} : DecidablePred (@IsParking n) := by
  intro w
  unfold IsParking
  infer_instance

/-- A strict excedance is a preference greater than its position. -/
def excedancePositions {n : ℕ} (w : Word n) : Finset (Fin n) :=
  univ.filter (fun i => i < w i)

/-- The original polynomial, summed over actual parking preference words. -/
noncomputable def polynomial (n : ℕ) : ℝ[X] := by
  classical
  exact ∑ w ∈ (univ : Finset (Word n)).filter IsParking,
    X ^ (excedancePositions w).card

private theorem sum_powerset_card_pow {ι R : Type*} [DecidableEq ι] [CommSemiring R]
    (s : Finset ι) (q : R) : (∑ t ∈ s.powerset, q ^ t.card) = (1 + q) ^ s.card := by
  induction s using Finset.induction_on with
  | empty => simp
  | @insert a s ha ih =>
    rw [sum_powerset_insert ha, card_insert_of_notMem ha, pow_succ]
    have hnew :
        (∑ t ∈ s.powerset, q ^ (insert a t).card) = (∑ t ∈ s.powerset, q ^ t.card) * q := by
      rw [sum_mul]
      refine sum_congr rfl fun t ht => ?_
      have ht' : a ∉ t := fun h => ha (mem_powerset.mp ht h)
      rw [card_insert_of_notMem ht', pow_succ]
    rw [hnew, ih, mul_add, mul_one]

/-- Expanding in powers of X−1 amounts to choosing a subset of the
strict excedance positions in each word. -/
theorem polynomial_eq_marked (n : ℕ) :
    polynomial n =
      ∑ w ∈ (univ : Finset (Word n)).filter IsParking,
        ∑ s ∈ (excedancePositions w).powerset, (X - 1) ^ s.card := by
  classical
  unfold polynomial
  apply sum_congr rfl
  intro w _
  rw [sum_powerset_card_pow]
  simp

private theorem card_first_slots {n : ℕ} (j : ℕ) (hj : j ≤ n) :
    (univ.filter (fun i : Fin n => i.val < j)).card = j := by
  let e : Fin j ↪ Fin n := ⟨Fin.castLE hj, Fin.castLE_injective hj⟩
  have he : (univ : Finset (Fin j)).map e = univ.filter (fun i : Fin n => i.val < j) := by
    ext i
    simp only [mem_map, mem_univ, true_and, mem_filter]
    constructor
    · rintro ⟨k, rfl⟩
      exact k.isLt
    · intro hi
      exact ⟨⟨i.val, hi⟩, Fin.ext rfl⟩
  rw [← he, card_map, card_univ, Fintype.card_fin]

/-- On a sorted preference word, the rank bound and the prefix-count
condition agree. The indices are zero-based in both formulations. -/
theorem isParking_sorted_iff {n : ℕ} {b : Word n} (hm : Monotone b) :
    IsParking b ↔ ∀ j : Fin n, b j ≤ j := by
  constructor
  · intro hp j
    by_contra! hj
    have hsub : (univ.filter (fun i => b i ≤ j)) ⊆
        (univ.filter (fun i : Fin n => i.val < j.val)) := by
      intro i hi
      have hi' := (mem_filter.mp hi).2
      refine mem_filter.mpr ⟨mem_univ _, ?_⟩
      by_contra! hij
      exact (not_le_of_gt hj) ((hm (show j ≤ i from hij)).trans hi')
    have hc := card_le_card hsub
    rw [card_first_slots j.val j.isLt.le] at hc
    exact (not_le_of_gt (Nat.lt_succ_self j.val)) ((hp j).trans hc)
  · intro hp j
    have hsub : (univ.filter (fun i : Fin n => i.val < j.val + 1)) ⊆
        (univ.filter (fun i => b i ≤ j)) := by
      intro i hi
      have hi' := (mem_filter.mp hi).2
      exact mem_filter.mpr ⟨mem_univ _, (hm (show i ≤ j from Nat.le_of_lt_succ hi')).trans (hp j)⟩
    have hc := card_le_card hsub
    rw [card_first_slots (j.val + 1) j.isLt] at hc
    exact hc

/-- Permuting positions preserves the number of preferences in each
initial segment, so the prefix characterization applies after sorting. -/
theorem isParking_perm {n : ℕ} (w : Word n) (σ : Equiv.Perm (Fin n)) :
    IsParking (w ∘ σ) ↔ IsParking w := by
  have hc (j : Fin n) :
      (univ.filter (fun i => (w ∘ σ) i ≤ j)).card =
        (univ.filter (fun i => w i ≤ j)).card := by
    apply card_bij (fun i _ => σ i)
    · intro i hi
      simpa using hi
    · intro i _ k _ h
      exact σ.injective h
    · intro k hk
      refine ⟨σ.symm k, ?_, by simp⟩
      simpa using hk
  constructor <;> intro h j
  · rw [← hc j]
    exact h j
  · rw [hc j]
    exact h j

theorem isParking_iff_sorted_permutation {n : ℕ} (w : Word n)
    (σ : Equiv.Perm (Fin n)) (hσ : Monotone (w ∘ σ)) :
    IsParking w ↔ ∀ j : Fin n, w (σ j) ≤ j :=
  (isParking_perm w σ).symm.trans (isParking_sorted_iff hσ)

/-- Marks use one-based preference values, with zero for a free position.
The unmarked entries retain their relative order. -/
structure Partial (n : ℕ) where
  marked : Fin n → ℕ
  unmarked : List ℕ

namespace Partial

variable {n : ℕ} (p : Partial n)

def markedPositions : Finset (Fin n) := univ.filter (fun i => p.marked i ≠ 0)

def marks : ℕ := p.markedPositions.card
def total : ℕ := p.marks + p.unmarked.length

def prefixCount (j : ℕ) : ℕ :=
  (univ.filter (fun i => 0 < p.marked i ∧ p.marked i ≤ j)).card +
    (p.unmarked.filter (· ≤ j)).length

/-- Data after processing the first j preference values. -/
def Valid (j : ℕ) : Prop :=
  (∀ i : Fin n, p.marked i ≤ j ∧ (p.marked i = 0 ∨ i.val + 1 < p.marked i)) ∧
  (∀ a ∈ p.unmarked, 0 < a ∧ a ≤ j) ∧
  p.total ≤ n ∧ ∀ d ≤ j, d ≤ p.prefixCount d

/-- Free positions eligible for marks of value j+1. -/
def eligible (j : ℕ) : Finset (Fin n) :=
  univ.filter (fun i => i.val < j ∧ p.marked i = 0)


theorem card_eligible (j : ℕ) (hj : j ≤ n) (hp : p.Valid j) :
    (p.eligible j).card = j - p.marks := by
  have he : p.eligible j =
      (univ.filter (fun i : Fin n => i.val < j)) \ p.markedPositions := by
    ext i
    simp [eligible, markedPositions]
  have hsub : p.markedPositions ⊆ univ.filter (fun i : Fin n => i.val < j) := by
    intro i hi
    simp only [markedPositions, mem_filter, mem_univ, true_and] at hi ⊢
    rcases hp.1 i with ⟨hv, h0 | hlt⟩
    · contradiction
    · omega
  rw [he, card_sdiff_of_subset hsub, card_first_slots j hj, marks]

/-- Exactly binomial many choices for the next marked positions. -/
theorem card_next_mark_sets (j s : ℕ) (hj : j ≤ n) (hp : p.Valid j) :
    ((p.eligible j).powersetCard s).card = (j - p.marks).choose s := by
  rw [card_powersetCard, p.card_eligible j hj hp]

/-- Drop all copies of the most recently processed preference. -/
def strip (j : ℕ) : Partial n :=
  ⟨fun i => if p.marked i = j + 1 then 0 else p.marked i,
    p.unmarked.filter (· ≠ j + 1)⟩

end Partial

/-- Insert copies of a single new value at the true positions of a mask.
An exhausted original list is used only outside the required length invariant. -/
def merge (v : ℕ) : List Bool → List ℕ → List ℕ
  | [], _ => []
  | true :: mask, old => v :: merge v mask old
  | false :: mask, [] => merge v mask []
  | false :: mask, a :: old => a :: merge v mask old

theorem merge_inverse (v : ℕ) (xs : List ℕ) :
    merge v (xs.map (fun x => decide (x = v))) (xs.filter (fun x => !decide (x = v))) = xs := by
  induction xs with
  | nil => rfl
  | cons a xs ih =>
    by_cases h : a = v
    · subst a
      simp [merge, ih]
    · simp [merge, h, ih]

/-- Within the mask-length invariant, both the mask and the old list can be
read back from the new list. -/
theorem merge_projections (v : ℕ) (mask : List Bool) (old : List ℕ)
    (hsize : mask.count false = old.length) (hvals : ∀ a ∈ old, a ≠ v) :
    (merge v mask old).map (fun x => decide (x = v)) = mask ∧
      (merge v mask old).filter (fun x => !decide (x = v)) = old := by
  induction mask generalizing old with
  | nil =>
    have he : old = [] := List.length_eq_zero_iff.mp (by simpa using hsize.symm)
    simp [merge, he]
  | cons b mask ih =>
    cases b with
    | true =>
      have hsize' : mask.count false = old.length := by simpa using hsize
      rcases ih old hsize' hvals with ⟨hm, hf⟩
      simp [merge, hm, hf]
    | false =>
      cases old with
      | nil => simp at hsize
      | cons a old =>
        have hne := hvals a (by simp)
        have hsize' : mask.count false = old.length := by simpa using hsize
        have hvals' : ∀ x ∈ old, x ≠ v := fun x hx => hvals x (by simp [hx])
        rcases ih old hsize' hvals' with ⟨hm, hf⟩
        simp [merge, hne, hm, hf]

end AlexanderssonParkingExcedance
