import Conjectures.MotzkinFloorSumCost
import Mathlib.Algebra.Order.BigOperators.Group.Finset

/-! Bounds for every integer in the recursive floor-sum computation.
`allValues` overapproximates the values of all arithmetic subexpressions and
returned results, including every recursive call. The cubic magnitude bound
gives a logarithmic bound on their binary lengths. -/
namespace Motzkin.FloorSum

open scoped BigOperators

theorem eval_le_cubic (N n M A B : ℕ) (hn : n ≤ N) (hA : A ≤ N)
    (hB : B ≤ 2*N^2) : eval n M A B ≤ 3*N^3 := by
  rw [eval_eq_spec,spec]
  calc
    ∑ i ∈ Finset.range n, (A*i+B)/M ≤ ∑ _i ∈ Finset.range n, 3*N^2 := by
      apply Finset.sum_le_sum
      intro i hi
      have hiN : i ≤ N := (Finset.mem_range.mp hi).le.trans hn
      have hai := Nat.mul_le_mul hA hiN
      have hnum : A*i+B ≤ 3*N^2 := by nlinarith
      exact (Nat.div_le_self _ _).trans hnum
    _ = n*(3*N^2) := by simp only [Finset.sum_const,Finset.card_range,nsmul_eq_mul]
    _ ≤ N*(3*N^2) := Nat.mul_le_mul_right _ hn
    _ = 3*N^3 := by ring

def localValues (n M A B : ℕ) : Finset ℕ :=
  {n,M,A,B,A%M,B%M,A/M,B/M,n-1,n*(n-1),n*(n-1)/2,
    (A/M)*(n*(n-1)/2),(B/M)*n,
    (A/M)*(n*(n-1)/2)+(B/M)*n,
    (A%M)*n,(A%M)*n+B%M,((A%M)*n+B%M)/M,((A%M)*n+B%M)%M,
    eval n M A B}

theorem localValues_le_cubic (N n M A B : ℕ) (hN : 0 < N)
    (hn : n ≤ N) (hM : M ≤ N) (hA : A ≤ N) (hB : B ≤ 2*N^2)
    {v : ℕ} (hv : v ∈ localValues n M A B) : v ≤ 4*N^3 := by
  have hN2 : N ≤ N^2 := by
    have h := Nat.mul_le_mul_left N (show 1 ≤ N by omega)
    simpa only [mul_one,pow_two] using h
  have hN3 : N^2 ≤ N^3 := by
    have h := Nat.mul_le_mul_left (N^2) (show 1 ≤ N by omega)
    simpa only [mul_one,pow_succ] using h
  have hAMod : A%M ≤ N := (Nat.mod_le _ _).trans hA
  have hBMod : B%M ≤ 2*N^2 := (Nat.mod_le _ _).trans hB
  have hADiv : A/M ≤ N := (Nat.div_le_self _ _).trans hA
  have hBDiv : B/M ≤ 2*N^2 := (Nat.div_le_self _ _).trans hB
  have hnSub : n-1 ≤ N := (Nat.sub_le _ _).trans hn
  have htriProd : n*(n-1) ≤ N^2 := by
    simpa only [pow_two] using Nat.mul_le_mul hn hnSub
  have htri : n*(n-1)/2 ≤ N^2 := (Nat.div_le_self _ _).trans htriProd
  have hbase₁ : (A/M)*(n*(n-1)/2) ≤ N^3 := by
    have h := Nat.mul_le_mul hADiv htri
    nlinarith
  have hbase₂ : (B/M)*n ≤ 2*N^3 := by
    have h := Nat.mul_le_mul hBDiv hn
    nlinarith
  have hbase : (A/M)*(n*(n-1)/2)+(B/M)*n ≤ 3*N^3 := by omega
  have hheight : (A%M)*n+B%M ≤ 3*N^2 := by
    have h := Nat.mul_le_mul hAMod hn
    nlinarith
  have hheightProduct : (A%M)*n ≤ 3*N^2 := (Nat.le_add_right _ _).trans hheight
  have hnext : ((A%M)*n+B%M)/M ≤ 3*N^2 := (Nat.div_le_self _ _).trans hheight
  have hrem : ((A%M)*n+B%M)%M ≤ 3*N^2 := (Nat.mod_le _ _).trans hheight
  have hval := eval_le_cubic N n M A B hn hA hB
  simp only [localValues,Finset.mem_insert,Finset.mem_singleton] at hv
  rcases hv with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl |
    rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;> omega

def allValues (n M A B : ℕ) : Finset ℕ :=
  if _hM : M=0 then localValues n M A B else
  let height := (A%M)*n+B%M
  localValues n M A B ∪
    if height < M then ∅ else allValues (height/M) (A%M) M (height%M)
termination_by M
decreasing_by exact Nat.mod_lt _ (Nat.pos_of_ne_zero _hM)

theorem allValues_le_cubic (N n M A B : ℕ) (hN : 0 < N)
    (hn : n ≤ N) (hM : M ≤ N) (hA : A ≤ N) (hB : B ≤ 2*N^2)
    {v : ℕ} (hv : v ∈ allValues n M A B) : v ≤ 4*N^3 := by
  induction M using Nat.strong_induction_on generalizing n A B v with
  | h M ih =>
    by_cases hz : M=0
    · rw [allValues,dite_eq_left hz] at hv
      exact localValues_le_cubic N n M A B hN hn hM hA hB hv
    have hMp : 0 < M := Nat.pos_of_ne_zero hz
    rw [allValues,dite_eq_right hz] at hv
    dsimp only at hv
    by_cases hh : (A%M)*n+B%M < M
    · rw [ite_eq_left hh,Finset.union_empty] at hv
      exact localValues_le_cubic N n M A B hN hn hM hA hB hv
    · rw [ite_eq_right hh,Finset.mem_union] at hv
      rcases hv with hv | hv
      · exact localValues_le_cubic N n M A B hN hn hM hA hB hv
      · have hn' := (next_count_le n M A B hMp).trans hn
        have hM' := (Nat.mod_lt A hMp).le.trans hM
        have hB' : ((A%M)*n+B%M)%M ≤ 2*N^2 := by
          have hr := (Nat.mod_lt ((A%M)*n+B%M) hMp).le.trans hM
          have hN2 : N ≤ N^2 := by
            have h := Nat.mul_le_mul_left N (show 1 ≤ N by omega)
            simpa only [mul_one,pow_two] using h
          omega
        exact ih (A%M) (Nat.mod_lt A hMp) _ M _ hn' hM' hM hB' hv

theorem size_mul_le (x y : ℕ) : (x*y).size ≤ x.size+y.size := by
  apply Nat.size_le.mpr
  rw [pow_add]
  have hx : x < 2^x.size := Nat.lt_size_self x
  have hy : y < 2^y.size := Nat.lt_size_self y
  have hpos : 0 < 2^y.size := by positivity
  exact (Nat.mul_le_mul_left x hy.le).trans_lt (Nat.mul_lt_mul_of_pos_right hx hpos)

theorem cubic_size_bound (N v : ℕ) (hN : 0 < N) (hv : v ≤ 4*N^3) :
    v.size ≤ 6*(N.log2+1) := by
  have hNsize : 0 < N.size := Nat.size_pos.mpr hN
  have h₂ := size_mul_le N N
  have h₃ := size_mul_le (N*N) N
  have h₄ := size_mul_le 4 (N^3)
  have hpow : N^3=(N*N)*N := by ring
  rw [hpow] at h₄
  have hfour : (4:ℕ).size=3 := by decide
  rw [hfour] at h₄
  have hv' := (Nat.size_le_size hv).trans (by
    rw [hpow]
    exact h₄)
  rw [← size_eq_log2_add_one hN]
  omega

/-- Every floor-sum intermediate, in every recursive call, uses at most
six times the input quotient order's binary length. -/
theorem allValues_size_bound (N n M A B : ℕ) (hN : 0 < N)
    (hn : n ≤ N) (hM : M ≤ N) (hA : A ≤ N) (hB : B ≤ 2*N^2)
    {v : ℕ} (hv : v ∈ allValues n M A B) : v.size ≤ 6*(N.log2+1) :=
  cubic_size_bound N v hN (allValues_le_cubic N n M A B hN hn hM hA hB hv)

end Motzkin.FloorSum
