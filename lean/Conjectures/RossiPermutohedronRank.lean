module

public import Conjectures.RossiPermutohedronWhitney
public import Conjectures.RossiPermutohedronOrderedPartitions

@[expose] public section
namespace RossiPermutohedron

open Polynomial BigOperators

/-- The faces in Rossi's Definition 2.3, indexed by rank. An ordered partition
of a nonempty set has at least one and at most n blocks. The extra element
represents the empty face. -/
abbrev RankedFace (n : ℕ) := Option (Σ j : Fin n, OrderedPartition n (n-j.val))

def rankPlusOne {n : ℕ} : RankedFace n → ℕ
  | none => 0
  | some ⟨j,_⟩ => j.val+1

/-- The rank generating polynomial, by a sum over the faces themselves. -/
noncomputable def rankPolynomial (n : ℕ) : ℝ[X] :=
  ∑ f : RankedFace n, X^rankPlusOne f

theorem rankPolynomial_grouped (n : ℕ) :
    rankPolynomial n =
      1 + X * (∑ j : Fin n, C (Fintype.card (OrderedPartition n (n-j.val)) : ℝ) * X^j.val) := by
  rw [rankPolynomial,Fintype.sum_option,Fintype.sum_sigma,Finset.mul_sum]
  simp only [rankPlusOne,pow_zero]
  congr 1
  apply Finset.sum_congr rfl
  intro j _
  simp only [Finset.sum_const,Finset.card_univ,nsmul_eq_mul,C_eq_natCast]
  ring

theorem orderedPartition_sum_eq_whitney {n : ℕ} (hn : 0<n) :
    (∑ j : Fin n, C (Fintype.card (OrderedPartition n (n-j.val)) : ℝ) * X^j.val) =
      whitneyPolynomial n := by
  have hdegree : (whitneyPolynomial n).natDegree ≤ n-1 := by
    have he := (eulerianRec_degree (n-1)).1
    rw [Nat.sub_add_cancel hn] at he
    calc
      _ ≤ (eulerianRec n).natDegree * (1+X : ℝ[X]).natDegree := natDegree_comp_le
      _ ≤ n-1 := by rw [he, add_comm, ← C_1, natDegree_X_add_C, mul_one]
  ext i
  simp only [finsetSum_coeff,coeff_C_mul,coeff_X_pow,mul_ite,mul_one,mul_zero]
  by_cases hi : i<n
  · rw [Finset.sum_eq_single (⟨i,hi⟩ : Fin n)]
    · simp only [ite_true]
      rw [orderedPartition_card,Nat.cast_mul,whitneyPolynomial_coeff n i hi.le]
    · intro j _ hj
      have h : j.val ≠ i := fun hz => hj (Fin.ext hz)
      simp [h.symm]
    · simp
  · rw [coeff_eq_zero_of_natDegree_lt (show (whitneyPolynomial n).natDegree < i by omega)]
    apply Finset.sum_eq_zero
    intro j _
    have h : j.val≠i := by have hj := j.isLt; omega
    simp [h.symm]

theorem rankPolynomial_eq {n : ℕ} (hn : 0<n) :
    rankPolynomial n = 1 + X * whitneyPolynomial n := by
  rw [rankPolynomial_grouped,orderedPartition_sum_eq_whitney hn]

theorem rankPolynomial_shifted {n : ℕ} (hn : 0<n) :
    rankPolynomial n = (shiftedEulerian (eulerianRec n)).comp (1+X) := by
  rw [rankPolynomial_eq hn]
  simp only [shiftedEulerian,whitneyPolynomial,sub_comp,mul_comp,one_comp,X_comp]
  ring

end RossiPermutohedron
