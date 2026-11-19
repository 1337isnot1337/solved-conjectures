import Conjectures.LineSizeCore
import Mathlib.Data.Finset.Sort
import Mathlib.Data.Finset.Powerset

/-! Canonical decreasing tuples of line sizes and their finite cost count.
The geometric realization of these tuples is handled separately. -/
namespace LineSize

open Finset

def tupleValues (S : Finset ℕ) : List ℕ := S.sort (· ≥ ·)

def tupleAt (S : Finset ℕ) (i : ℕ) : ℕ := (tupleValues S).getD i 0

def tupleCost (S : Finset ℕ) : ℕ := pointCost (tupleAt S) S.card

@[simp] theorem tupleValues_length (S : Finset ℕ) : (tupleValues S).length=S.card := by
  simp [tupleValues]

@[simp] theorem mem_tupleValues (S : Finset ℕ) (s : ℕ) : s ∈ tupleValues S ↔ s ∈ S := by
  simp [tupleValues]

@[simp] theorem tupleValues_toFinset (S : Finset ℕ) : (tupleValues S).toFinset=S := by
  simp [tupleValues]

theorem tupleAt_eq_getElem (S : Finset ℕ) (i : ℕ) (hi : i < S.card) :
    tupleAt S i=(tupleValues S)[i]'(by simpa only [tupleValues_length] using hi) := by
  exact (List.getElem_eq_getD 0).symm

theorem tupleAt_decreasing (S : Finset ℕ) : Decreasing (tupleAt S) S.card := by
  intro i j hij hj
  have hi : i < S.card := by omega
  have hi' : i < (tupleValues S).length := by simpa only [tupleValues_length] using hi
  have hj' : j < (tupleValues S).length := by simpa only [tupleValues_length] using hj
  rw [tupleAt_eq_getElem S i hi,tupleAt_eq_getElem S j hj]
  exact List.Pairwise.rel_getElem_of_lt hi' hj' (S.sortedGT_sort.pairwise) hij

theorem tupleAt_mem (S : Finset ℕ) (i : ℕ) (hi : i < S.card) : tupleAt S i ∈ S := by
  rw [tupleAt_eq_getElem S i hi]
  apply (mem_tupleValues S _).mp
  exact List.get_mem (tupleValues S) ⟨i,by simpa only [tupleValues_length] using hi⟩

theorem mem_iff_tupleAt (S : Finset ℕ) (s : ℕ) :
    s ∈ S ↔ ∃ i < S.card, tupleAt S i=s := by
  constructor
  · intro hs
    obtain ⟨i,hi,hvalue⟩ := List.mem_iff_getElem.mp ((mem_tupleValues S s).mpr hs)
    have hi' : i < S.card := by simpa only [tupleValues_length] using hi
    exact ⟨i,hi',(tupleAt_eq_getElem S i hi').trans hvalue⟩
  · rintro ⟨i,hi,rfl⟩
    exact tupleAt_mem S i hi

theorem tupleAt_eq_zero_of_ge (S : Finset ℕ) (i : ℕ) (hi : S.card ≤ i) :
    tupleAt S i=0 := by
  have hnone : (tupleValues S)[i]?=none :=
    List.getElem?_eq_none (by simpa only [tupleValues_length] using hi)
  simp only [tupleAt,List.getD_eq_getElem?_getD,hnone,Option.getD_none]

theorem tupleAt_injective (S : Finset ℕ) (i j : ℕ)
    (hi : i < S.card) (hj : j < S.card) (heq : tupleAt S i=tupleAt S j) : i=j := by
  by_contra hne
  rcases lt_or_gt_of_ne hne with hij | hji
  · have := tupleAt_decreasing S i j hij hj
    omega
  · have := tupleAt_decreasing S j i hji hi
    omega

theorem tupleAt_image_range (S : Finset ℕ) : (range S.card).image (tupleAt S)=S := by
  ext s
  constructor
  · intro hs
    obtain ⟨i,hi,rfl⟩ := mem_image.mp hs
    exact tupleAt_mem S i (mem_range.mp hi)
  · intro hs
    obtain ⟨i,hi,hvalue⟩ := (mem_iff_tupleAt S s).mp hs
    exact mem_image.mpr ⟨i,mem_range.mpr hi,hvalue⟩

theorem tupleAt_ge_three (S : Finset ℕ) (hS : ∀ s ∈ S, 3 ≤ s)
    (i : ℕ) (hi : i < S.card) : 3 ≤ tupleAt S i := hS _ (tupleAt_mem S i hi)

theorem tupleAt_zero_le_cost (S : Finset ℕ) (hS : 0 < S.card) :
    tupleAt S 0 ≤ tupleCost S := by
  have hsum : tupleAt S 0-0 ≤ ∑ i ∈ range S.card, (tupleAt S i-i) :=
    single_le_sum (fun i _ => Nat.zero_le (tupleAt S i-i)) (mem_range.mpr hS)
  simpa only [Nat.sub_zero,tupleCost,pointCost] using hsum

theorem tupleAt_le_cost (S : Finset ℕ) (i : ℕ) (hi : i < S.card) :
    tupleAt S i ≤ tupleCost S := by
  have hhead : tupleAt S i ≤ tupleAt S 0 := by
    by_cases hz : i=0
    · subst i
      exact le_rfl
    · exact (tupleAt_decreasing S 0 i (by omega) hi).le
  exact hhead.trans (tupleAt_zero_le_cost S (by omega))

theorem mem_le_tupleCost (S : Finset ℕ) (s : ℕ) (hs : s ∈ S) : s ≤ tupleCost S := by
  obtain ⟨i,hi,rfl⟩ := (mem_iff_tupleAt S s).mp hs
  exact tupleAt_le_cost S i hi

@[simp] theorem tupleCost_empty : tupleCost ∅=0 := by
  simp [tupleCost,pointCost]

@[simp] theorem tupleCost_singleton (s : ℕ) : tupleCost {s}=s := by
  simp [tupleCost,pointCost,tupleAt,tupleValues]

def feasibleSizes (n : ℕ) : Finset (Finset ℕ) :=
  (Icc 3 n).powerset.filter (fun S => tupleCost S ≤ n)

def tupleCount (n : ℕ) : ℕ := (feasibleSizes n).card

/-- The interval bound in the finite enumeration follows from the cost
bound; it imposes no additional mathematical condition. -/
@[simp] theorem mem_feasibleSizes (n : ℕ) (S : Finset ℕ) :
    S ∈ feasibleSizes n ↔ (∀ s ∈ S, 3 ≤ s) ∧ tupleCost S ≤ n := by
  simp only [feasibleSizes,mem_filter,mem_powerset]
  constructor
  · rintro ⟨hsub,hcost⟩
    exact ⟨fun s hs => (mem_Icc.mp (hsub hs)).1,hcost⟩
  · rintro ⟨hpos,hcost⟩
    refine ⟨?_,hcost⟩
    intro s hs
    exact mem_Icc.mpr ⟨hpos s hs,(mem_le_tupleCost S s hs).trans hcost⟩

@[simp] theorem empty_mem_feasibleSizes (n : ℕ) : ∅ ∈ feasibleSizes n := by
  simp

theorem feasibleSizes_mono : Monotone feasibleSizes := by
  intro n m hnm S hS
  obtain ⟨hpos,hcost⟩ := (mem_feasibleSizes n S).mp hS
  exact (mem_feasibleSizes m S).mpr ⟨hpos,hcost.trans hnm⟩

theorem tupleCount_mono : Monotone tupleCount := by
  intro n m hnm
  exact card_le_card (feasibleSizes_mono hnm)

theorem feasibleSizes_of_lt_three (n : ℕ) (hn : n < 3) : feasibleSizes n={∅} := by
  ext S
  rw [mem_feasibleSizes,mem_singleton]
  constructor
  · rintro ⟨hpos,hcost⟩
    apply eq_empty_iff_forall_notMem.mpr
    intro s hs
    have hlo := hpos s hs
    have hhi := mem_le_tupleCost S s hs
    omega
  · rintro rfl
    simp

@[simp] theorem tupleCount_of_lt_three (n : ℕ) (hn : n < 3) : tupleCount n=1 := by
  rw [tupleCount,feasibleSizes_of_lt_three n hn,card_singleton]

end LineSize
