import Mathlib.Algebra.BigOperators.Intervals
import Mathlib.Algebra.BigOperators.Group.Finset.Sigma
import Mathlib.Algebra.BigOperators.Group.Finset.Piecewise
import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Algebra.Ring.Parity
import Mathlib.Data.Finset.Card
import Mathlib.Data.Finset.Prod
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring
import Lean.Elab.Tactic.Omega

/-! The Euclidean floor-sum recurrence used by the exact two-difference
evaluator. The mathematical specification is a finite sum; `eval` executes the
modulus-reducing algorithm without enumerating its summands. -/
namespace Motzkin.FloorSum

open scoped BigOperators

def spec (n M A B : ℕ) : ℕ := ∑ i ∈ Finset.range n, (A*i+B)/M

theorem summand_split (M A B i : ℕ) (hM : 0 < M) :
    (A*i+B)/M = (A/M)*i+B/M+((A%M)*i+B%M)/M := by
  have h : A*i+B=((A%M)*i+B%M)+((A/M)*i+B/M)*M := by
    conv_lhs => rw [← Nat.mod_add_div A M,← Nat.mod_add_div B M]
    ring
  rw [h,Nat.add_mul_div_right _ _ hM]
  omega

theorem spec_split (n M A B : ℕ) (hM : 0 < M) :
    spec n M A B = (A/M)*(n*(n-1)/2)+(B/M)*n+spec n M (A%M) (B%M) := by
  simp only [spec,summand_split M A B _ hM,Finset.sum_add_distrib]
  rw [← Finset.mul_sum,Finset.sum_range_id,Finset.sum_const,Finset.card_range,
    nsmul_eq_mul]
  ring

theorem triangular_contribution (c n : ℕ) :
    c*(n*(n-1)/2)=c*n*(n-1)/2 := by
  rw [← Nat.mul_div_assoc c (Nat.two_dvd_mul_sub_one n)]
  rw [mul_assoc]

theorem spec_zero_of_height_lt (n M A B : ℕ) (h : A*n+B < M) :
    spec n M A B=0 := by
  apply Finset.sum_eq_zero
  intro i hi
  apply Nat.div_eq_of_lt
  exact (Nat.add_le_add_right (Nat.mul_le_mul_left A
    (Nat.le_of_lt (Finset.mem_range.mp hi))) B).trans_lt h

def points (n q M A B : ℕ) : Finset (ℕ × ℕ) :=
  (Finset.range n ×ˢ Finset.range q).filter
    (fun p => M*(p.2+1) ≤ A*p.1+B)

theorem spec_eq_card_points (n q M A B : ℕ) (hM : 0 < M)
    (hbound : ∀ i < n, (A*i+B)/M ≤ q) :
    spec n M A B=(points n q M A B).card := by
  rw [points,Finset.card_filter,Finset.sum_product]
  apply Finset.sum_congr rfl
  intro i hi
  rw [← Finset.card_filter]
  have hset : (Finset.range q).filter (fun j => M*(j+1) ≤ A*i+B)=
      Finset.range ((A*i+B)/M) := by
    ext j
    simp only [Finset.mem_filter,Finset.mem_range]
    rw [mul_comm M (j+1),← Nat.le_div_iff_mul_le hM]
    have hb := hbound i (Finset.mem_range.mp hi)
    omega
  rw [hset,Finset.card_range]

theorem reciprocal (n M A B : ℕ) (hM : 0 < M) (hA : 0 < A) (hB : B < M) :
    spec n M A B=spec ((A*n+B)/M) A M ((A*n+B)%M) := by
  let q := (A*n+B)/M
  let r := (A*n+B)%M
  have height : A*n+B=M*q+r := by
    have hh := Nat.mod_add_div (A*n+B) M
    dsimp only [q,r]
    omega
  have bound₁ : ∀ i < n, (A*i+B)/M ≤ q := by
    intro i hi
    exact Nat.div_le_div_right (Nat.add_le_add_right
      (Nat.mul_le_mul_left A hi.le) B)
  have bound₂ : ∀ j < q, (M*j+r)/A ≤ n := by
    intro j hj
    have hj' : M*(j+1) ≤ M*q := Nat.mul_le_mul_left M (by omega)
    have hnum : M*j+r ≤ A*n := by nlinarith
    calc
      (M*j+r)/A ≤ (A*n)/A := Nat.div_le_div_right hnum
      _ = n := Nat.mul_div_cancel_left n hA
  rw [spec_eq_card_points n q M A B hM bound₁,
    spec_eq_card_points q n A M r hA bound₂]
  have hswap (i j : ℕ) (hi : i < n) (hj : j < q) :
      M*(j+1) ≤ A*i+B ↔ A*((n-1-i)+1) ≤ M*(q-1-j)+r := by
    have hi' : A*((n-1-i)+1)+A*i=A*n := by
      rw [← mul_add]
      congr 1
      omega
    have hj' : M*(q-1-j)+M*(j+1)=M*q := by
      rw [← mul_add]
      congr 1
      omega
    constructor <;> intro h <;> nlinarith
  apply Finset.card_bij'
    (fun p _ => (q-1-p.2,n-1-p.1)) (fun p _ => (n-1-p.2,q-1-p.1))
  · rintro ⟨i,j⟩ hp
    simp only [points,Finset.mem_filter,Finset.mem_product,Finset.mem_range] at hp ⊢
    exact ⟨⟨by omega,by omega⟩,(hswap i j hp.1.1 hp.1.2).mp hp.2⟩
  · rintro ⟨j,i⟩ hp
    simp only [points,Finset.mem_filter,Finset.mem_product,Finset.mem_range] at hp ⊢
    refine ⟨⟨by omega,by omega⟩,?_⟩
    apply (hswap (n-1-i) (q-1-j) (by omega) (by omega)).mpr
    have hi : n-1-(n-1-i)=i := by omega
    have hj : q-1-(q-1-j)=j := by omega
    simpa only [hi,hj] using hp.2
  · rintro ⟨i,j⟩ hp
    simp only [points,Finset.mem_filter,Finset.mem_product,Finset.mem_range] at hp
    apply Prod.ext <;> simp only [Prod.fst,Prod.snd] <;> omega
  · rintro ⟨j,i⟩ hp
    simp only [points,Finset.mem_filter,Finset.mem_product,Finset.mem_range] at hp
    apply Prod.ext <;> simp only [Prod.fst,Prod.snd] <;> omega

def eval (n M A B : ℕ) : ℕ :=
  if _hM : M=0 then 0 else
  let A₀ := A%M
  let B₀ := B%M
  let base := (A/M)*(n*(n-1)/2)+(B/M)*n
  let height := A₀*n+B₀
  if height < M then base
  else base+eval (height/M) A₀ M (height%M)
termination_by M
decreasing_by exact Nat.mod_lt _ (Nat.pos_of_ne_zero _hM)

theorem eval_eq_spec (n M A B : ℕ) : eval n M A B=spec n M A B := by
  induction M using Nat.strong_induction_on generalizing n A B with
  | h M ih =>
    by_cases hM : M=0
    · subst M
      simp [eval,spec]
    have hMp : 0 < M := Nat.pos_of_ne_zero hM
    rw [eval,dite_eq_right hM]
    dsimp only
    rw [spec_split n M A B hMp]
    by_cases hsmall : (A%M)*n+B%M < M
    · rw [ite_eq_left hsmall,spec_zero_of_height_lt n M (A%M) (B%M) hsmall,add_zero]
    · rw [ite_eq_right hsmall,ih (A%M) (Nat.mod_lt A hMp)]
      have hA : 0 < A%M := by
        have hB := Nat.mod_lt B hMp
        by_contra hn
        have hz : A%M=0 := by omega
        simp only [hz,zero_mul,zero_add] at hsmall
        exact hsmall hB
      rw [reciprocal n M (A%M) (B%M) hMp hA (Nat.mod_lt B hMp)]

end Motzkin.FloorSum
