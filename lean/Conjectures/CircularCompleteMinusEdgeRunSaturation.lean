import Mathlib.Algebra.BigOperators.Group.Finset.Piecewise
import Mathlib.Algebra.Order.BigOperators.Ring.Finset

/-! Finite saturation of the run-capacity bounds from Step 4.
The normal and special counts remain explicit hypotheses here. -/

namespace CircularCompleteMinusEdge
open scoped BigOperators

/-- Every run bound in the double-counting argument is saturated.
A unique normal vertex has zero slack, the others have one period
of slack, and both special vertices achieve their upper bounds. -/
theorem saturate_all_run_capacities {I : Type*} [Fintype I]
    (q k : I→ℕ) (R S u v : ℕ) (hR : 0<R)
    (hLocal : ∀ i,k i≤R+1-q i)
    (hZero : (Finset.univ.filter fun i => q i=0).card≤1)
    (hU : u≤S) (hV : v≤S)
    (hTotal : (∑ i,k i)+u+v=Fintype.card I*R+2*S+1) :
    (∃! b,q b=0) ∧ u=S ∧ v=S ∧
      ∀ i,(q i=0 ∧ k i=R+1) ∨ (q i=1 ∧ k i=R) := by
  classical
  let e (i : I) : ℕ := if q i=0 then 1 else 0
  let cap (i : I) : ℕ := R+e i
  have hE : (∑ i,e i) = (Finset.univ.filter fun i => q i=0).card := by
    rw [Finset.card_filter]
  have hCap : (∑ i,cap i)=Fintype.card I*R+∑ i,e i := by
    simp [cap,Finset.sum_add_distrib]
  have hLoc (i : I) : k i≤cap i := by
    unfold cap e
    have hh := hLocal i
    split_ifs <;> omega
  have hSum : (∑ i,k i)≤∑ i,cap i :=
    Finset.sum_le_sum (fun i _ => hLoc i)
  have hOne : (Finset.univ.filter fun i => q i=0).card=1 := by
    omega
  have hSumEq : (∑ i,k i) = ∑ i,cap i := by omega
  have hEq (i : I) : k i=cap i := by
    by_contra hN
    have hLt : k i<cap i := lt_of_le_of_ne (hLoc i) hN
    have hS := Finset.sum_lt_sum (fun i _ => hLoc i) ⟨i,Finset.mem_univ _,hLt⟩
    exact (Nat.ne_of_lt hS) hSumEq
  obtain ⟨b,hb⟩ := Finset.card_eq_one.mp hOne
  have hSingle := Finset.eq_singleton_iff_unique_mem.mp hb
  refine ⟨⟨b,by simpa using hSingle.1,fun i hi => hSingle.2 i (by simpa using hi)⟩,by omega,by omega,?_⟩
  intro i
  have h := hEq i
  have hL := hLocal i
  unfold cap e at h
  by_cases he : q i=0
  · exact Or.inl ⟨he,by simpa [he] using h⟩
  · simp [he] at h
    exact Or.inr ⟨by omega,h⟩

end CircularCompleteMinusEdge
