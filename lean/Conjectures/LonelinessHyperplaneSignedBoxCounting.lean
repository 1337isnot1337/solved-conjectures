import Conjectures.LonelinessHyperplaneBoundedPartitions

/-! A signed integer relation with nonzero coefficients reduces to a
positive weighted partition equation by reflecting its negative
coordinates in the box. This preserves the exact count for every N. -/

namespace Loneliness.Hyperplane.QuasipolynomialArithmetic

open Polynomial
open scoped BigOperators

noncomputable section

variable {ι : Type*} [Fintype ι] [DecidableEq ι] [Nonempty ι]

def closedRelationBox (m : ι → ℤ) (N : ℕ) : Type _ :=
  {v : ι → Fin (N + 1) // ∑ i, m i * (v i : ℕ) = 0}

def negativeWeight (m : ι → ℤ) : ℕ :=
  ∑ i, if m i < 0 then (m i).natAbs else 0

def reflectedCoordinates (m : ι → ℤ) (N : ℕ) (v : ι → ℕ) : ι → ℕ :=
  fun i => if m i < 0 then N - v i else v i

theorem reflectedCoordinates_le (m : ι → ℤ) (N : ℕ) (v : ι → ℕ)
    (hv : ∀ i, v i ≤ N) : ∀ i, reflectedCoordinates m N v i ≤ N := by
  intro i
  unfold reflectedCoordinates
  split_ifs
  · exact Nat.sub_le _ _
  · exact hv i

theorem reflectedCoordinates_involutive (m : ι → ℤ) (N : ℕ) (v : ι → ℕ)
    (hv : ∀ i, v i ≤ N) :
    reflectedCoordinates m N (reflectedCoordinates m N v) = v := by
  funext i
  by_cases hi : m i < 0
  · simp only [reflectedCoordinates, ite_eq_left hi, Nat.sub_sub_self (hv i)]
  · simp only [reflectedCoordinates, ite_eq_right hi]

theorem reflected_weighted_sum (m : ι → ℤ) (N : ℕ) (v : ι → ℕ)
    (hv : ∀ i, v i ≤ N) :
    ((∑ i, (m i).natAbs * reflectedCoordinates m N v i : ℕ) : ℤ) =
      (∑ i, m i * (v i : ℤ)) + (N : ℤ) * (negativeWeight m : ℤ) := by
  have hpoint : ∀ i,
      (((m i).natAbs * reflectedCoordinates m N v i : ℕ) : ℤ) =
        m i * (v i : ℤ) + (N : ℤ) *
          (if m i < 0 then ((m i).natAbs : ℤ) else 0) := by
    intro i
    by_cases hi : m i < 0
    · have hcast : ((m i).natAbs : ℤ) = -m i := by
        rw [Int.natCast_natAbs, abs_of_neg hi]
      simp only [Nat.cast_mul, reflectedCoordinates, ite_eq_left hi,
        Nat.cast_sub (hv i), hcast]
      ring
    · have hcast : ((m i).natAbs : ℤ) = m i := by
        rw [Int.natCast_natAbs, abs_of_nonneg (le_of_not_gt hi)]
      simp only [Nat.cast_mul, reflectedCoordinates, ite_eq_right hi,
        hcast, mul_zero, add_zero]
  have hconstant : (∑ i, (N : ℤ) *
      (if m i < 0 then ((m i).natAbs : ℤ) else 0)) =
        (N : ℤ) * (negativeWeight m : ℤ) := by
    simp only [negativeWeight, Nat.cast_sum, Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro i _
    by_cases hi : m i < 0 <;> simp only [hi, ite_true, ite_false, Nat.cast_zero]
  rw [Nat.cast_sum]
  calc
    _ = ∑ i, (m i * (v i : ℤ) + (N : ℤ) *
        (if m i < 0 then ((m i).natAbs : ℤ) else 0)) :=
      Finset.sum_congr rfl (fun i _ => hpoint i)
    _ = _ := by rw [Finset.sum_add_distrib, hconstant]

theorem negativeWeight_le_total (m : ι → ℤ) :
    negativeWeight m ≤ ∑ i, (m i).natAbs := by
  apply Finset.sum_le_sum
  intro i _
  by_cases hi : m i < 0
  · simpa only [ite_eq_left hi] using (le_rfl : (m i).natAbs ≤ (m i).natAbs)
  · simpa only [ite_eq_right hi] using Nat.zero_le (m i).natAbs

/-- Reflection is a bijection of the actual closed sampling box. -/
def closedRelationBoxEquiv (m : ι → ℤ) (N : ℕ) :
    closedRelationBox m N ≃
      boundedWeightedPartition (fun i => (m i).natAbs) (negativeWeight m * N) N := by
  let forward : closedRelationBox m N →
      boundedWeightedPartition (fun i => (m i).natAbs) (negativeWeight m * N) N := fun v =>
    ⟨⟨reflectedCoordinates m N (fun i => (v.1 i : ℕ)), by
        have hbound : ∀ i, (v.1 i : ℕ) ≤ N := fun i => Nat.le_of_lt_succ (v.1 i).isLt
        have h := reflected_weighted_sum m N (fun i => (v.1 i : ℕ)) hbound
        rw [v.2, zero_add] at h
        have hnat : (∑ i, (m i).natAbs *
            reflectedCoordinates m N (fun i => (v.1 i : ℕ)) i) = N * negativeWeight m := by
          exact_mod_cast h
        simpa only [Nat.mul_comm] using hnat⟩,
      reflectedCoordinates_le m N (fun i => (v.1 i : ℕ))
        (fun i => Nat.le_of_lt_succ (v.1 i).isLt)⟩
  let backward : boundedWeightedPartition (fun i => (m i).natAbs) (negativeWeight m * N) N →
      closedRelationBox m N := fun x =>
    ⟨fun i => ⟨reflectedCoordinates m N x.1.1 i,
        Nat.lt_succ_of_le (reflectedCoordinates_le m N x.1.1 x.2 i)⟩, by
      have h := reflected_weighted_sum m N (reflectedCoordinates m N x.1.1)
        (reflectedCoordinates_le m N x.1.1 x.2)
      rw [reflectedCoordinates_involutive m N x.1.1 x.2] at h
      have hx : ((∑ i, (m i).natAbs * x.1.1 i : ℕ) : ℤ) =
          (negativeWeight m : ℤ) * (N : ℤ) := by exact_mod_cast x.1.2
      change (∑ i, m i * (reflectedCoordinates m N x.1.1 i : ℤ)) = 0
      nlinarith⟩
  refine ⟨forward, backward, ?_, ?_⟩
  · intro v
    apply Subtype.ext
    funext i
    apply Fin.ext
    exact congrFun (reflectedCoordinates_involutive m N (fun j => (v.1 j : ℕ))
      (fun j => Nat.le_of_lt_succ (v.1 j).isLt)) i
  · intro x
    apply Subtype.ext
    apply Subtype.ext
    exact reflectedCoordinates_involutive m N x.1.1 x.2

theorem closedRelationBox_quasipolynomial_of_full_support
    (m : ι → ℤ) (hsupport : ∀ i, m i ≠ 0) :
    ∃ M : ℕ, 0 < M ∧ ∃ P : Fin M → ℚ[X],
      (∀ r, (P r).natDegree ≤ Fintype.card ι - 1) ∧
      ∀ (r : Fin M) (n : ℕ),
        (Nat.card (closedRelationBox m (M * n + r)) : ℚ) = (P r).eval (n : ℚ) := by
  have ha : ∀ i, 0 < (m i).natAbs := fun i => Int.natAbs_pos.mpr (hsupport i)
  obtain ⟨M, hM, P, hdegree, heval⟩ := boundedWeightedPartition_quasipolynomial
    (fun i => (m i).natAbs) ha (negativeWeight m) (negativeWeight_le_total m)
  refine ⟨M, hM, P, hdegree, ?_⟩
  intro r n
  rw [Nat.card_congr (closedRelationBoxEquiv m (M * n + r))]
  exact heval r n

end

end Loneliness.Hyperplane.QuasipolynomialArithmetic
