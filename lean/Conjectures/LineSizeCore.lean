import Conjectures.LineSizeCost
import Mathlib.Data.Nat.Find
import Mathlib.Algebra.BigOperators.Intervals

/-! The positive core of a strictly decreasing line-size sequence. Indices
start at zero, so the contribution of size `d i` is `d i - i`. -/
namespace LineSize
open Finset

def Decreasing (d : ℕ → ℕ) (k : ℕ) : Prop :=
  ∀ i j, i < j → j < k → d j < d i

def IsCoreLength (d : ℕ → ℕ) (k r : ℕ) : Prop :=
  r ≤ k ∧ (∀ i < r, i < d i) ∧ (∀ i, r ≤ i → i < k → d i ≤ i)

theorem decreasing_drop (d : ℕ → ℕ) (k : ℕ) (hd : Decreasing d k)
    (i a : ℕ) (hia : i+a < k) : d (i+a)+a ≤ d i := by
  induction a with
  | zero => simp
  | succ a ih =>
    have hprev := ih (by omega)
    have hstep := hd (i+a) (i+(a+1)) (by omega) hia
    omega

theorem exists_core_length (d : ℕ → ℕ) (k : ℕ) (hd : Decreasing d k) :
    ∃ r, IsCoreLength d k r := by
  let hex : ∃ i, k ≤ i ∨ d i ≤ i := ⟨k,Or.inl le_rfl⟩
  let r := Nat.find hex
  have hr : r ≤ k := Nat.find_min' hex (Or.inl le_rfl)
  have hpositive : ∀ i < r, i < d i := by
    intro i hi
    have hnot := Nat.find_min hex hi
    omega
  refine ⟨r,hr,hpositive,?_⟩
  intro i hri hik
  have hbad : k ≤ r ∨ d r ≤ r := Nat.find_spec hex
  have hrk : r < k := by omega
  have hsmall : d r ≤ r := by omega
  by_cases hri' : r=i
  · simpa [hri'] using hsmall
  · have hdrop := hd r i (by omega) hik
    omega

theorem core_length_unique (d : ℕ → ℕ) (k r s : ℕ)
    (hr : IsCoreLength d k r) (hs : IsCoreLength d k s) : r=s := by
  rcases hr with ⟨hrk,hrpos,hrtail⟩
  rcases hs with ⟨hsk,hspos,hstail⟩
  by_contra hne
  rcases lt_or_gt_of_ne hne with hrs | hsr
  · have := hspos r hrs
    have := hrtail r le_rfl (by omega)
    omega
  · have := hrpos s hsr
    have := hstail s le_rfl (by omega)
    omega

theorem tail_size_le_core_length (d : ℕ → ℕ) (k r : ℕ)
    (hd : Decreasing d k) (hr : IsCoreLength d k r)
    (i : ℕ) (hri : r ≤ i) (hik : i < k) : d i ≤ r := by
  have hrr := hr.2.2 r le_rfl (by omega)
  by_cases heq : r=i
  · simpa [heq] using hrr
  · have hdrop := hd r i (by omega) hik
    omega

theorem core_size_lower (d : ℕ → ℕ) (k r : ℕ)
    (hd : Decreasing d k) (hr : IsCoreLength d k r)
    (i : ℕ) (hi : i < r) : 2*r-1-i ≤ d i := by
  have hrk := hr.1
  have hlast := hr.2.1 (r-1) (by omega)
  have hindex : i+(r-1-i)=r-1 := by omega
  have hdrop := decreasing_drop d k hd i (r-1-i) (by omega)
  rw [hindex] at hdrop
  omega

theorem pointCost_eq_core (d : ℕ → ℕ) (k r : ℕ)
    (hr : IsCoreLength d k r) : pointCost d k=pointCost d r := by
  unfold pointCost
  symm
  apply sum_subset (range_mono hr.1)
  intro i hik hir
  apply Nat.sub_eq_zero_of_le
  exact hr.2.2 i (by simpa only [mem_range,not_lt] using hir) (mem_range.mp hik)

theorem pointCost_core_formula (d : ℕ → ℕ) (k r : ℕ)
    (hr : IsCoreLength d k r) :
    pointCost d k=(∑ i ∈ range r, d i)-r*(r-1)/2 := by
  rw [pointCost_eq_core d k r hr]
  unfold pointCost
  rw [sum_tsub_distrib (range r) (fun i hi => (hr.2.1 i (mem_range.mp hi)).le)]
  rw [sum_range_id]

end LineSize
