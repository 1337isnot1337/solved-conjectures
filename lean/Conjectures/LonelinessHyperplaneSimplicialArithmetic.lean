import Conjectures.LonelinessHyperplaneQuasipolynomialClosure

/-! The arithmetic term for a lattice point in a fundamental
parallelepiped: a positive weighted partition with an offset smaller
than the sum of the weights. The strict offset bound gives exact
quasipolynomials at every nonnegative argument. -/

namespace Loneliness.Hyperplane.QuasipolynomialArithmetic

open Polynomial
open scoped BigOperators

noncomputable section

variable {ι : Type*} [Fintype ι] [DecidableEq ι] [Nonempty ι]

theorem remainderWeight_add_offset_lt
    (a : ι → ℕ) (M : ℕ) (hdiv : ∀ i, a i ∣ M)
    (r : remainderVectors a M) (offset : ℕ) (hoffset : offset < ∑ i, a i) :
    remainderWeight a M r + offset < Fintype.card ι * M := by
  have hpoint : ∀ i, a i * (r i : ℕ) + a i ≤ M := by
    intro i
    have h := Nat.mul_le_mul_left (a i) (Nat.succ_le_of_lt (r i).isLt)
    simpa only [Nat.mul_add, Nat.mul_one, Nat.mul_div_cancel' (hdiv i)] using h
  have hsum : remainderWeight a M r + (∑ i, a i) ≤ Fintype.card ι * M := by
    have h := Finset.sum_le_sum (fun i (_ : i ∈ (Finset.univ : Finset ι)) => hpoint i)
    simpa only [Finset.sum_add_distrib, Finset.sum_const, Finset.card_univ,
      nsmul_eq_mul, remainderWeight] using h
  omega

theorem shiftedWeightedPartition_progressions_of_small_offset
    (a : ι → ℕ) (ha : ∀ i, 0 < a i) (M : ℕ) (hM : 0 < M)
    (hdiv : ∀ i, a i ∣ M) (offset : ℕ) (hoffset : offset < ∑ i, a i) :
    HasProgressionPolynomials (fun n => (Nat.card (shiftedWeightedPartition a offset n) : ℚ))
      M (Fintype.card ι - 1) := by
  classical
  choose P hdegree heval using fun r : remainderVectors a M =>
    shiftedWeakComposition_polynomial_on_progressions (ι := ι) M
      (remainderWeight a M r + offset) hM
        (remainderWeight_add_offset_lt a M hdiv r offset hoffset)
  refine ⟨fun s => ∑ r : remainderVectors a M, P r s, ?_, ?_⟩
  · intro s
    apply natDegree_sum_le_of_forall_le
    intro r _
    exact hdegree r s
  · intro s n
    rw [shiftedWeightedPartition_card_eq_sum a ha M hM hdiv,
      Nat.cast_sum, eval_finsetSum]
    apply Finset.sum_congr rfl
    intro r _
    exact heval r s n

theorem shiftedWeightedPartition_isQuasipolynomial_of_small_offset
    (a : ι → ℕ) (ha : ∀ i, 0 < a i) (offset : ℕ) (hoffset : offset < ∑ i, a i) :
    IsQuasipolynomial (fun n => (Nat.card (shiftedWeightedPartition a offset n) : ℚ))
      (Fintype.card ι - 1) := by
  let M := ∏ i, a i
  have hM : 0 < M := Finset.prod_pos (fun i _ => ha i)
  have hdiv : ∀ i, a i ∣ M := fun i => Finset.dvd_prod_of_mem a (Finset.mem_univ i)
  exact ⟨M, hM,
    shiftedWeightedPartition_progressions_of_small_offset a ha M hM hdiv offset hoffset⟩

end

end Loneliness.Hyperplane.QuasipolynomialArithmetic
