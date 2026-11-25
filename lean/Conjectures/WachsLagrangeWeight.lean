module
public import Conjectures.WachsLagrangeDerivative
public import Mathlib.RingTheory.PowerSeries.Order

@[expose] public section
namespace WachsCompleteGraph

open PowerSeries

variable {K : Type*} [Field K] [CharZero K]

omit [CharZero K] in
theorem inverse_power_cancel (U : K⟦X⟧) (hU : constantCoeff U ≠ 0)
    (j k : ℕ) (h : j ≤ k) : U ^ j * U⁻¹ ^ k = U⁻¹ ^ (k-j) := by
  conv_lhs => rw [show k = j+(k-j) by omega,pow_add U⁻¹]
  rw [← mul_assoc,← mul_pow,PowerSeries.mul_inv_cancel U hU,one_pow,one_mul]

theorem lagrange_weight_cancel_positive (U : K⟦X⟧) (hU : constantCoeff U ≠ 0) (d : ℕ) :
    coeff (d+1) (U⁻¹ ^ (d+1) + X * (U⁻¹ ^ (d+2) * derivative U)) = 0 := by
  have H := coeff_derivative (U⁻¹ ^ (d+1)) d
  rw [derivative_inverse_power U hU] at H
  have hC : ((d+1 : ℕ) : K⟦X⟧) = C ((d+1 : ℕ) : K) := by simp
  rw [hC,mul_assoc,map_neg,coeff_C_mul] at H
  rw [map_add,coeff_succ_X_mul]
  have hd : ((d+1:ℕ):K) ≠ 0 := by exact_mod_cast Nat.add_one_ne_zero d
  push_cast at H hd
  apply (mul_right_cancel₀ hd)
  rw [zero_mul,add_mul,← H]
  ring

noncomputable def lagrangeWeight (U : K⟦X⟧) (n : ℕ) : K⟦X⟧ :=
  (U + X * derivative U) * U⁻¹ ^ (n+1)

theorem lagrange_weight_monomial (U : K⟦X⟧) (hU : constantCoeff U ≠ 0) (n j : ℕ) :
    coeff n ((X*U)^j * lagrangeWeight U n) = if j=n then 1 else 0 := by
  classical
  unfold lagrangeWeight
  rw [mul_pow, mul_assoc, mul_comm (X^j), coeff_mul_X_pow']
  by_cases hj : j ≤ n
  · rw [ite_eq_left hj]
    have hUcancel := inverse_power_cancel U hU j (n+1) (by omega)
    rw [show U^j * ((U + X*derivative U) * U⁻¹^(n+1)) =
      (U + X*derivative U) * (U^j * U⁻¹^(n+1)) by ring,hUcancel]
    by_cases h : j=n
    · subst j
      rw [Nat.sub_self,Nat.add_sub_cancel_left, pow_one,ite_eq_left rfl,add_mul,
        PowerSeries.mul_inv_cancel U hU,map_add, mul_assoc,coeff_zero_X_mul]
      simp
    · rw [ite_eq_right h]
      obtain ⟨d,hd⟩ : ∃ d, n-j = d+1 := ⟨n-j-1,by omega⟩
      have he : n+1-j = d+2 := by omega
      rw [hd,he,add_mul]
      have hh : U * U⁻¹^(d+2) = U⁻¹^(d+1) := by
        rw [show d+2 = 1+(d+1) by omega,pow_add,pow_one,← mul_assoc,
          PowerSeries.mul_inv_cancel U hU,one_mul]
      rw [hh,show X * derivative U * U⁻¹^(d+2) = X * (U⁻¹^(d+2)*derivative U) by ring]
      exact lagrange_weight_cancel_positive U hU d
  · rw [ite_eq_right hj,ite_eq_right (by omega : j ≠ n)]

end WachsCompleteGraph
