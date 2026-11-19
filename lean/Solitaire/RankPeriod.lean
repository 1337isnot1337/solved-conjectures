import Mathlib.Algebra.Order.BigOperators.Group.Finset
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Data.Nat.Periodic
import Mathlib.Data.Nat.ModEq
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum

/-! Rank-period rigidity for arbitrary-layer solitaire.  These finite statements
are independent of any enumeration of decks or layer sets. -/

namespace SolitaireGeneral

def bit (v : Bool) : ℤ := if v then 1 else 0

def rankEnergy (j b : Nat) (v : Bool) : ℤ :=
  (2*(j:ℤ)+1-2*b) * (bit v - if j < b then 1 else 0)

theorem rankEnergy_nonnegative (j b : Nat) (v : Bool) :
    0 ≤ rankEnergy j b v ∧ (rankEnergy j b v=0 → v=decide (j < b)) := by
  by_cases h : j < b <;> cases v <;> simp [rankEnergy,bit,h] <;> omega

/-- A finite zero-one matrix with the same row and column totals as a matrix
of initial segments must be that matrix.  Its signed rank energy is zero. -/
theorem prefix_matrix_rigidity {T : Type*} [Fintype T] (M : Nat)
    (b : T → Nat) (X : T → Fin M → Bool)
    (hrow : ∀ t, (∑ r, bit (X t r)) = ∑ r : Fin M, if r.val < b t then (1:ℤ) else 0)
    (hcol : ∀ r : Fin M, (∑ t, bit (X t r)) = ∑ t, if r.val < b t then (1:ℤ) else 0) :
    ∀ t r, X t r=decide (r.val < b t) := by
  classical
  let d := fun t (r : Fin M) => bit (X t r) - if r.val < b t then (1:ℤ) else 0
  have hrows : ∀ t, (∑ r, d t r)=0 := by
    intro t
    dsimp [d]
    rw [Finset.sum_sub_distrib,hrow]
    omega
  have hcols : ∀ r, (∑ t, d t r)=0 := by
    intro r
    dsimp [d]
    rw [Finset.sum_sub_distrib,hcol]
    omega
  have hline : ∀ t, (∑ r : Fin M, rankEnergy r.val (b t) (X t r)) =
      ∑ r : Fin M, (2*(r.val:ℤ)+1)*d t r := by
    intro t
    simp only [rankEnergy,sub_mul,Finset.sum_sub_distrib]
    change (∑ r, (2*(r.val:ℤ)+1)*d t r) - (∑ r, 2*(b t:ℤ)*d t r) = _
    rw [← Finset.mul_sum,hrows,mul_zero,sub_zero]
  have htotal : (∑ t, ∑ r : Fin M, rankEnergy r.val (b t) (X t r))=0 := by
    simp_rw [hline]
    rw [Finset.sum_comm]
    simp_rw [← Finset.mul_sum,hcols,mul_zero]
    simp
  have hnonneg : ∀ t (r : Fin M), 0 ≤ rankEnergy r.val (b t) (X t r) :=
    fun t r => (rankEnergy_nonnegative r.val (b t) (X t r)).1
  have hrowzero : ∀ t, (∑ r : Fin M, rankEnergy r.val (b t) (X t r))=0 := by
    intro t
    exact (Finset.sum_eq_zero_iff_of_nonneg (by
      intro t _
      exact Finset.sum_nonneg (fun r _ => hnonneg t r))).mp htotal t (by simp)
  intro t r
  apply (rankEnergy_nonnegative r.val (b t) (X t r)).2
  exact (Finset.sum_eq_zero_iff_of_nonneg (fun r _ => hnonneg t r)).mp
    (hrowzero t) r (by simp)

/-- On a finite time cycle, a rank-dependent return delay preserves every
column count.  The birth-count equation therefore forces rank periodicity. -/
theorem renewal_rank_period {T : Type*} [Fintype T] [AddCommGroup T] (M : Nat)
    (b : T → Nat) (delay : Fin M → T)
    (hrenewal : ∀ t,
      (∑ r : Fin M, bit (decide (r.val < b (t-delay r)))) =
        ∑ r : Fin M, if r.val < b t then (1:ℤ) else 0) :
    ∀ r : Fin M, Function.Periodic (fun t => r.val < b t) (delay r) := by
  classical
  have hcol : ∀ r : Fin M,
      (∑ t, bit (decide (r.val < b (t-delay r)))) =
        ∑ t, if r.val < b t then (1:ℤ) else 0 := by
    intro r
    let shift : T ≃ T := {
      toFun := fun t => t-delay r
      invFun := fun t => t+delay r
      left_inv := by intro t; simp
      right_inv := by intro t; simp }
    apply Fintype.sum_equiv shift
    intro t
    simp [shift,bit]
  have hr := prefix_matrix_rigidity M b
    (fun t r => decide (r.val < b (t-delay r))) hrenewal hcol
  intro r t
  have hh := hr (t+delay r) r
  simp only [add_sub_cancel_right,decide_eq_decide] at hh
  exact propext hh.symm

end SolitaireGeneral
