import Conjectures.LonelinessHyperplaneQuasipolynomialArithmetic
import Mathlib.Data.Sigma.Basic
import Mathlib.Algebra.Polynomial.BigOperators

/-! Exact quasipolynomiality of a single positive weighted partition
count. Division by a common multiple of the weights gives a finite,
disjoint remainder decomposition. Every resulting offset is below one
period per coordinate, so the polynomial formulas hold for all N ≥ 0. -/

namespace Loneliness.Hyperplane.QuasipolynomialArithmetic

open Polynomial
open scoped BigOperators

noncomputable section

variable {ι : Type*} [Fintype ι] [Nonempty ι]

def weightedPartition (a : ι → ℕ) (n : ℕ) : Type _ :=
  {x : ι → ℕ // ∑ i, a i * x i = n}

def remainderVectors (a : ι → ℕ) (M : ℕ) : Type _ :=
  (i : ι) → Fin (M / a i)

def remainderWeight (a : ι → ℕ) (M : ℕ) (r : remainderVectors a M) : ℕ :=
  ∑ i, a i * (r i : ℕ)

theorem remainderWeight_lt (a : ι → ℕ) (ha : ∀ i, 0 < a i)
    (M : ℕ) (hdiv : ∀ i, a i ∣ M) (r : remainderVectors a M) :
    remainderWeight a M r < Fintype.card ι * M := by
  have hterm : ∀ i, a i * (r i : ℕ) < M := by
    intro i
    have h := Nat.mul_lt_mul_of_pos_left (r i).isLt (ha i)
    rwa [Nat.mul_div_cancel' (hdiv i)] at h
  have h := Finset.sum_lt_sum_of_nonempty Finset.univ_nonempty (fun i _ => hterm i)
  simpa only [remainderWeight, Finset.sum_const, Finset.card_univ, nsmul_eq_mul] using h

/-- The remainder decomposition is an actual equivalence of solution
types. In particular it neither loses solutions nor counts one twice. -/
def weightedPartitionEquiv
    (a : ι → ℕ) (ha : ∀ i, 0 < a i) (M : ℕ) (hM : 0 < M)
    (hdiv : ∀ i, a i ∣ M) (n : ℕ) :
    weightedPartition a n ≃
      Σ r : remainderVectors a M,
        shiftedWeakComposition (ι := ι) M (remainderWeight a M r) n := by
  let b : ι → ℕ := fun i => M / a i
  have hb : ∀ i, 0 < b i := fun i =>
    Nat.div_pos (Nat.le_of_dvd hM (hdiv i)) (ha i)
  have hscale : ∀ i, a i * b i = M := fun i => Nat.mul_div_cancel' (hdiv i)
  let forward : weightedPartition a n →
      Σ r : remainderVectors a M,
        shiftedWeakComposition (ι := ι) M (remainderWeight a M r) n := fun x =>
    ⟨fun i => ⟨x.1 i % b i, Nat.mod_lt _ (hb i)⟩,
      ⟨fun i => x.1 i / b i, by
        change M * (∑ i, x.1 i / b i) +
          (∑ i, a i * (x.1 i % b i)) = n
        calc
          _ = ∑ i, (M * (x.1 i / b i) + a i * (x.1 i % b i)) := by
            rw [Finset.mul_sum, Finset.sum_add_distrib]
          _ = ∑ i, a i * x.1 i := by
            apply Finset.sum_congr rfl
            intro i _
            calc
              _ = a i * (x.1 i % b i + b i * (x.1 i / b i)) := by
                rw [← hscale i]
                ring
              _ = a i * x.1 i := by rw [Nat.mod_add_div]
          _ = n := x.2⟩⟩
  let backward : (Σ r : remainderVectors a M,
      shiftedWeakComposition (ι := ι) M (remainderWeight a M r) n) →
      weightedPartition a n := fun y =>
    ⟨fun i => b i * y.2.1 i + (y.1 i : ℕ), by
      calc
        _ = ∑ i, (M * y.2.1 i + a i * (y.1 i : ℕ)) := by
          apply Finset.sum_congr rfl
          intro i _
          rw [mul_add, ← mul_assoc, hscale i]
        _ = M * (∑ i, y.2.1 i) + remainderWeight a M y.1 := by
          simp only [Finset.sum_add_distrib, Finset.mul_sum, remainderWeight]
        _ = n := y.2.2⟩
  refine ⟨forward, backward, ?_, ?_⟩
  · intro x
    apply Subtype.ext
    funext i
    change b i * (x.1 i / b i) + x.1 i % b i = x.1 i
    simpa only [Nat.add_comm] using Nat.mod_add_div (x.1 i) (b i)
  · intro y
    apply Sigma.subtype_ext
    · funext i
      apply Fin.ext
      change (b i * y.2.1 i + (y.1 i : ℕ)) % b i = (y.1 i : ℕ)
      rw [Nat.add_comm, Nat.add_mul_mod_self_left, Nat.mod_eq_of_lt (y.1 i).isLt]
    · funext i
      change (b i * y.2.1 i + (y.1 i : ℕ)) / b i = y.2.1 i
      rw [Nat.add_comm, Nat.add_mul_div_left _ _ (hb i),
        Nat.div_eq_of_lt (y.1 i).isLt, zero_add]

theorem weightedPartition_finite
    (a : ι → ℕ) (ha : ∀ i, 0 < a i) (M : ℕ) (hM : 0 < M)
    (hdiv : ∀ i, a i ∣ M) (n : ℕ) : Finite (weightedPartition a n) := by
  letI (r : remainderVectors a M) :
      Finite (shiftedWeakComposition (ι := ι) M (remainderWeight a M r) n) :=
    shiftedWeakComposition_finite M (remainderWeight a M r) n hM
  exact Finite.of_equiv _ (weightedPartitionEquiv a ha M hM hdiv n).symm

theorem weightedPartition_card_eq_sum
    (a : ι → ℕ) (ha : ∀ i, 0 < a i) (M : ℕ) (hM : 0 < M)
    (hdiv : ∀ i, a i ∣ M) (n : ℕ) :
    Nat.card (weightedPartition a n) =
      ∑ r : remainderVectors a M,
        Nat.card (shiftedWeakComposition (ι := ι) M (remainderWeight a M r) n) := by
  letI (r : remainderVectors a M) :
      Finite (shiftedWeakComposition (ι := ι) M (remainderWeight a M r) n) :=
    shiftedWeakComposition_finite M (remainderWeight a M r) n hM
  rw [Nat.card_congr (weightedPartitionEquiv a ha M hM hdiv n), Nat.card_sigma]

/-- Every common multiple of the positive weights is a quasipolynomial
period for the literal partition count, at every nonnegative input. -/
theorem weightedPartition_polynomial_on_progressions
    (a : ι → ℕ) (ha : ∀ i, 0 < a i) (M : ℕ) (hM : 0 < M)
    (hdiv : ∀ i, a i ∣ M) :
    ∃ P : Fin M → ℚ[X],
      (∀ r, (P r).natDegree ≤ Fintype.card ι - 1) ∧
      ∀ (r : Fin M) (n : ℕ),
        (Nat.card (weightedPartition a (M * n + r)) : ℚ) = (P r).eval (n : ℚ) := by
  classical
  choose P hdegree heval using fun r : remainderVectors a M =>
    shiftedWeakComposition_polynomial_on_progressions (ι := ι) M
      (remainderWeight a M r) hM (remainderWeight_lt a ha M hdiv r)
  refine ⟨fun r => ∑ t : remainderVectors a M, P t r, ?_, ?_⟩
  · intro r
    exact Polynomial.natDegree_sum_le_of_forall_le _ _ (fun t _ => hdegree t r)
  · intro r n
    rw [weightedPartition_card_eq_sum a ha M hM hdiv, Nat.cast_sum, Polynomial.eval_finsetSum]
    apply Finset.sum_congr rfl
    intro t _
    exact heval t r n

theorem weightedPartition_quasipolynomial
    (a : ι → ℕ) (ha : ∀ i, 0 < a i) :
    ∃ M : ℕ, 0 < M ∧ ∃ P : Fin M → ℚ[X],
      (∀ r, (P r).natDegree ≤ Fintype.card ι - 1) ∧
      ∀ (r : Fin M) (n : ℕ),
        (Nat.card (weightedPartition a (M * n + r)) : ℚ) = (P r).eval (n : ℚ) := by
  classical
  let M := ∏ i, a i
  have hM : 0 < M := Finset.prod_pos (fun i _ => ha i)
  have hdiv : ∀ i, a i ∣ M := fun i => Finset.dvd_prod_of_mem a (Finset.mem_univ i)
  obtain ⟨P, hdegree, heval⟩ := weightedPartition_polynomial_on_progressions a ha M hM hdiv
  exact ⟨M, hM, P, hdegree, heval⟩

end

end Loneliness.Hyperplane.QuasipolynomialArithmetic
