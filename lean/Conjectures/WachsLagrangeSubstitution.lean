module
public import Conjectures.WachsLagrangeWeight
public import Mathlib.RingTheory.PowerSeries.Substitution

@[expose] public section
namespace WachsCompleteGraph

open PowerSeries

variable {K : Type*} [Field K] [CharZero K]

omit [CharZero K] in
theorem coeff_mul_X_power_of_lt (U : K⟦X⟧) {n j : ℕ} (h : n < j) :
    coeff n ((X*U)^j) = 0 := by
  rw [mul_pow,mul_comm,coeff_mul_X_pow',ite_eq_right (not_le_of_gt h)]

omit [CharZero K] in
theorem coeff_subst_X_mul_range (U A : K⟦X⟧) (n N : ℕ) (h : n ≤ N) :
    coeff n (A.subst (X*U)) =
      ∑ j ∈ Finset.range (N+1), coeff j A * coeff n ((X*U)^j) := by
  classical
  rw [coeff_subst' (HasSubst.of_constantCoeff_zero' (by simp))]
  simp only [smul_eq_mul]
  apply finsum_eq_sum_of_support_subset
  intro j hj
  apply Finset.mem_range.mpr
  by_contra! hh
  have hnj : n < j := by omega
  exact hj (by change coeff j A * coeff n ((X*U)^j) = 0; rw [coeff_mul_X_power_of_lt U hnj,mul_zero])

/-- Formal coefficient change of variable. The change (H=XU) contributes
the exact Jacobian (H') and all off-diagonal monomials cancel. -/
theorem lagrange_change_variable (U A : K⟦X⟧) (hU : constantCoeff U ≠ 0) (n : ℕ) :
    coeff n ((A.subst (X*U)) * lagrangeWeight U n) = coeff n A := by
  classical
  let P : K⟦X⟧ := ∑ j ∈ Finset.range (n+1), C (coeff j A) * (X*U)^j
  have h (i : ℕ) (hi : i ≤ n) : coeff i (A.subst (X*U)) = coeff i P := by
    rw [coeff_subst_X_mul_range U A i n hi]
    simp [P,coeff_C_mul]
  have hP : coeff n ((A.subst (X*U))*lagrangeWeight U n) =
      coeff n (P*lagrangeWeight U n) := by
    rw [coeff_mul,coeff_mul]
    apply Finset.sum_congr rfl
    intro p hp
    rw [h p.1 (by have he := Finset.mem_antidiagonal.mp hp; omega)]
  rw [hP]
  simp only [P,Finset.sum_mul,map_sum,mul_assoc,coeff_C_mul,lagrange_weight_monomial U hU]
  simp

end WachsCompleteGraph
