module
public import Conjectures.CyrusianKaplanBaselineCount
public import Mathlib.Algebra.BigOperators.Ring.Finset
public import Mathlib.Algebra.Order.BigOperators.Group.Finset
import Mathlib.Tactic.Ring

@[expose] public section
namespace CyrusianKaplan

open Finset
open scoped BigOperators

/-- At even genus, Pascal's rule gives the displayed positive
increment from the old summation range when r≥2. -/
theorem even_baseline_increment (g r : ℕ) (he : Even g) (hr : 2≤r) :
    (baselinePairs g r).card+
      (∑ t ∈ Finset.Ioc (g/2) g,(g-t).choose (r-2)*t.choose r)
      ≤(baselinePairs (g+1) r).card := by
  have hFloor : (g+1)/2=g/2 := by obtain ⟨x,hx⟩ := he; omega
  rw [card_baselinePairs,card_baselinePairs,hFloor,← Finset.sum_add_distrib]
  have hSub : Finset.Ioc (g/2) g⊆Finset.Ioc (g/2) (g+1) := by
    intro t ht
    have hh := Finset.mem_Ioc.mp ht
    exact Finset.mem_Ioc.mpr ⟨hh.1,by omega⟩
  refine (Finset.sum_le_sum (fun t ht=>?_ )).trans
    (Finset.sum_le_sum_of_subset_of_nonneg hSub (fun _ _ _=>Nat.zero_le _))
  have htG := (Finset.mem_Ioc.mp ht).2
  have hv : g+1-t=(g-t)+1 := by omega
  have hP : ((g-t)+1).choose (r-1)=(g-t).choose (r-2)+(g-t).choose (r-1) := by
    simpa only [show r-2+1=r-1 by omega] using Nat.choose_succ_succ' (g-t) (r-2)
  rw [hv,hP]
  apply le_of_eq
  ring

/-- The r=1 even-genus gain is exactly the newly available term. -/
theorem even_baseline_increment_one (g : ℕ) (he : Even g) :
    (baselinePairs (g+1) 1).card=(baselinePairs g 1).card+(g+1) := by
  have hFloor : (g+1)/2=g/2 := by obtain ⟨x,hx⟩ := he; omega
  have hInsert : Finset.Ioc (g/2) (g+1)=insert (g+1) (Finset.Ioc (g/2) g) := by
    ext t
    simp only [Finset.mem_Ioc,Finset.mem_insert]
    omega
  rw [card_baselinePairs,card_baselinePairs,hFloor,hInsert,Finset.sum_insert]
  · simp only [Nat.sub_self,Nat.choose_zero_right,one_mul,Nat.choose_one_right]
    omega
  · simp

/-- At odd genus, shift every old minimum up by one. The first
binomial factor is unchanged; the second has the exact Pascal gain. -/
theorem odd_baseline_increment (g r : ℕ) (ho : Odd g) (hr : 1≤r) :
    (baselinePairs (g+1) r).card=(baselinePairs g r).card+
      ∑ t ∈ Finset.Ioc (g/2) g,(g-t).choose (r-1)*t.choose (r-1) := by
  have hFloor : (g+1)/2=g/2+1 := by obtain ⟨x,hx⟩ := ho; omega
  let R := Finset.Ioc (g/2) g
  have hShift : R.image (fun t : ℕ=>t+1)=Finset.Ioc ((g+1)/2) (g+1) := by
    ext t
    constructor
    · intro ht
      obtain ⟨s,hs,rfl⟩ := Finset.mem_image.mp ht
      have hS := Finset.mem_Ioc.mp hs
      exact Finset.mem_Ioc.mpr ⟨by omega,by omega⟩
    · intro ht
      have hT := Finset.mem_Ioc.mp ht
      exact Finset.mem_image.mpr
        ⟨t-1,Finset.mem_Ioc.mpr ⟨by omega,by omega⟩,by omega⟩
  rw [card_baselinePairs,card_baselinePairs,← Finset.sum_add_distrib,← hShift]
  rw [Finset.sum_image (by
    intro a _ b _ h
    change a+1=b+1 at h
    omega)]
  apply Finset.sum_congr rfl
  intro t _
  have hv : g+1-(t+1)=g-t := by omega
  have hP : (t+1).choose r=t.choose (r-1)+t.choose r := by
    simpa only [show r-1+1=r by omega] using Nat.choose_succ_succ' t (r-1)
  rw [hv,hP]
  ring

end CyrusianKaplan
