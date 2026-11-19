import Conjectures.LineSizeTuples
import Mathlib.RingTheory.PowerSeries.Basic

/-! The cumulative tuple count and exact-cost count have the formal
power-series relation `G=(1-X)F`. All coefficients count finite sets. -/
noncomputable section
namespace LineSize

open Finset

def exactSizes (n : ℕ) : Finset (Finset ℕ) :=
  (feasibleSizes n).filter (fun S => tupleCost S=n)

def exactCount (n : ℕ) : ℕ := (exactSizes n).card

@[simp] theorem mem_exactSizes (n : ℕ) (S : Finset ℕ) :
    S ∈ exactSizes n ↔ (∀ s ∈ S, 3 ≤ s) ∧ tupleCost S=n := by
  simp only [exactSizes,mem_filter,mem_feasibleSizes]
  constructor
  · exact fun h => ⟨h.1.1,h.2⟩
  · rintro ⟨hpos,heq⟩
    exact ⟨⟨hpos,heq.le⟩,heq⟩

theorem tupleCost_fiber (n m : ℕ) (hm : m ≤ n) :
    (feasibleSizes n).filter (fun S => tupleCost S=m)=exactSizes m := by
  ext S
  simp only [mem_filter,mem_feasibleSizes,mem_exactSizes]
  constructor
  · exact fun h => ⟨h.1.1,h.2⟩
  · rintro ⟨hpos,heq⟩
    exact ⟨⟨hpos,heq.le.trans hm⟩,heq⟩

theorem tupleCount_eq_sum_exactCount (n : ℕ) :
    tupleCount n=∑ m ∈ range (n+1), exactCount m := by
  have hmap : Set.MapsTo tupleCost (↑(feasibleSizes n) : Set (Finset ℕ))
      (↑(range (n+1)) : Set ℕ) := by
    intro S hS
    have hcost := ((mem_feasibleSizes n S).mp hS).2
    exact mem_range.mpr (by omega)
  have hcard := card_eq_sum_card_fiberwise hmap
  unfold tupleCount
  rw [hcard]
  apply sum_congr rfl
  intro m hm
  rw [tupleCost_fiber n m (by have := mem_range.mp hm; omega)]
  rfl

theorem tupleCount_succ (n : ℕ) : exactCount (n+1)+tupleCount n=tupleCount (n+1) := by
  rw [tupleCount_eq_sum_exactCount n,tupleCount_eq_sum_exactCount (n+1),sum_range_succ]
  omega

@[simp] theorem exactSizes_zero : exactSizes 0={∅} := by
  simp [exactSizes,feasibleSizes_of_lt_three 0 (by omega)]

@[simp] theorem exactCount_zero : exactCount 0=1 := by
  simp [exactCount]

theorem exactSizes_eq_empty_of_pos_lt_three (n : ℕ) (hpos : 0 < n) (hsmall : n < 3) :
    exactSizes n=∅ := by
  simp [exactSizes,feasibleSizes_of_lt_three n hsmall,show ¬(0=n) by omega]

theorem exactCount_eq_zero_of_pos_lt_three (n : ℕ) (hpos : 0 < n) (hsmall : n < 3) :
    exactCount n=0 := by
  rw [exactCount,exactSizes_eq_empty_of_pos_lt_three n hpos hsmall,card_empty]

def tupleCostSeries : PowerSeries ℚ := PowerSeries.mk (fun n => (exactCount n : ℚ))

def tupleCountSeries : PowerSeries ℚ := PowerSeries.mk (fun n => (tupleCount n : ℚ))

@[simp] theorem coeff_tupleCostSeries (n : ℕ) :
    PowerSeries.coeff n tupleCostSeries=(exactCount n : ℚ) := by
  simp [tupleCostSeries]

@[simp] theorem coeff_tupleCountSeries (n : ℕ) :
    PowerSeries.coeff n tupleCountSeries=(tupleCount n : ℚ) := by
  simp [tupleCountSeries]

theorem one_sub_X_mul_tupleCountSeries :
    (1-PowerSeries.X)*tupleCountSeries=tupleCostSeries := by
  ext n
  rw [sub_mul,one_mul,map_sub,coeff_tupleCountSeries,coeff_tupleCostSeries]
  cases n with
  | zero =>
    simp [PowerSeries.coeff_zero_eq_constantCoeff,tupleCount_of_lt_three 0 (by omega)]
  | succ n =>
    rw [PowerSeries.coeff_succ_X_mul,coeff_tupleCountSeries]
    symm
    apply (eq_sub_iff_add_eq).mpr
    have hcast := congrArg (fun k : ℕ => (k : ℚ)) (tupleCount_succ n)
    simpa only [Nat.cast_add] using hcast

end LineSize
