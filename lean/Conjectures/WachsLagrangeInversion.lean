module
public import Conjectures.WachsLagrangeSubstitution

@[expose] public section
namespace WachsCompleteGraph

open PowerSeries

variable {K : Type*} [Field K] [CharZero K]

/-- Lagrange–Bürmann, expressed entirely in the ordinary formal power
series ring. No convergence or unproved residue rule is needed. -/
theorem formal_lagrange_burmann (U A G : K⟦X⟧)
    (hU : constantCoeff U ≠ 0) (hA : A.subst (X*U) = G) (n : ℕ) :
    ((n:K)+1) * coeff (n+1) A = coeff n (derivative G * U⁻¹ ^ (n+1)) := by
  have hc := lagrange_change_variable U A hU (n+1)
  rw [hA] at hc
  have hm : G * lagrangeWeight U (n+1) =
      G * U⁻¹ ^ (n+1) + X * (G * (U⁻¹ ^ (n+2) * derivative U)) := by
    unfold lagrangeWeight
    have h : U * U⁻¹^(n+1+1) = U⁻¹^(n+1) := by
      rw [pow_succ,mul_comm (U⁻¹ ^ (n+1)),← mul_assoc,PowerSeries.mul_inv_cancel U hU,one_mul]
    rw [add_mul,h]
    ring
  rw [hm,map_add,coeff_succ_X_mul] at hc
  have hd := coeff_derivative (G * U⁻¹^(n+1)) n
  rw [Derivation.leibniz,Algebra.smul_def,Algebra.smul_def,
    Algebra.algebraMap_self,RingHom.id_apply,RingHom.id_apply,
    derivative_inverse_power U hU] at hd
  have hC : ((n+1:ℕ):K⟦X⟧) = C ((n+1:ℕ):K) := by simp
  rw [hC,mul_assoc,mul_neg,show G * (C ((n+1:ℕ):K) * (U⁻¹ ^ (n+1+1) * derivative U)) =
    C ((n+1:ℕ):K) * (G * (U⁻¹^(n+2) * derivative U)) by ring,
    map_add,map_neg,coeff_C_mul] at hd
  push_cast at hd
  rw [mul_comm (derivative G),← hc]
  linear_combination -hd

end WachsCompleteGraph
