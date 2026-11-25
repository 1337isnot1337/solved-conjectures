module

public import Conjectures.RossiPermutohedronRank

@[expose] public section
namespace RossiPermutohedron
open Polynomial BigOperators

/-- The characteristic polynomial in Rossi's explicitly evaluated face-sum
formula (the sign for each face is Theorem 6.3 of his paper). -/
noncomputable def characteristicFacePolynomial (n : ℕ) : ℝ[X] :=
  ∑ f : RankedFace n, C ((-1:ℝ)^rankPlusOne f) * X^(n-rankPlusOne f)

theorem rankPlusOne_le {n : ℕ} (f : RankedFace n) : rankPlusOne f≤n := by
  rcases f with _|⟨j,f⟩
  · exact Nat.zero_le _
  · exact j.isLt

private theorem reflect_sum {α : Type*} (s : Finset α) (p : α→ℝ[X]) (n : ℕ) :
    (∑ i∈s,p i).reflect n = ∑ i∈s,(p i).reflect n := by
  classical
  induction s using Finset.induction_on with
  | empty => simp
  | insert i s hi ih => simp [Finset.sum_insert hi,ih]

theorem characteristicFacePolynomial_eq_reflect (n : ℕ) :
    characteristicFacePolynomial n = ((rankPolynomial n).comp (-X)).reflect n := by
  unfold characteristicFacePolynomial rankPolynomial
  rw [sum_comp,reflect_sum]
  apply Finset.sum_congr rfl
  intro f _
  simp only [pow_comp,X_comp]
  rw [show (-X:ℝ[X]) = C (-1:ℝ)*X by simp, mul_pow, ← map_pow,
    reflect_C_mul_X_pow,revAt_le (rankPlusOne_le f)]

/-- The exact signed face sum, not an unspecified polynomial variable, agrees
with the reciprocal recurrence model. -/
theorem characteristicFacePolynomial_eq_recurrence (m : ℕ) :
    characteristicFacePolynomial (m+2) =
      reciprocalShift (shiftedEulerian (eulerianRec (m+2))) := by
  rw [characteristicFacePolynomial_eq_reflect,rankPolynomial_shifted (by omega),comp_assoc]
  simp only [add_comp,one_comp,X_comp]
  unfold reciprocalShift reverse
  rw [show (1 + -X : ℝ[X]) = 1-X by ring]
  have ha : (eulerianRec (m+2)) ≠ 0 := by
    intro h
    have hh := eulerianRec_eval0 (m+2)
    simp [h] at hh
  rw [natDegree_comp,shiftedEulerian_natDegree ha,(eulerianRec_degree (m+1)).1,
    natDegree_sub,← C_1,natDegree_X_sub_C,mul_one]

end RossiPermutohedron
