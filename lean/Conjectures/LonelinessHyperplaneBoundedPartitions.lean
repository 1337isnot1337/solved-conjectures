import Conjectures.LonelinessHyperplaneWeightedPartitionOffsets
import Mathlib.Combinatorics.Enumerative.InclusionExclusion
import Mathlib.Data.Fintype.Powerset

/-! Exact quasipolynomials for a box cut out by one positive weighted
equation. Finite inclusion–exclusion uses the actual upper-violation
solution types. The resulting formula holds for all N ≥ 0. -/

namespace Loneliness.Hyperplane.QuasipolynomialArithmetic

open Polynomial
open scoped BigOperators

noncomputable section

variable {ι : Type*} [Fintype ι] [DecidableEq ι] [Nonempty ι]

def boundedWeightedPartition (a : ι → ℕ) (n N : ℕ) : Type _ :=
  {x : weightedPartition a n // ∀ i, x.1 i ≤ N}

private theorem mem_finset_inf {α : Type*} [Fintype α] [DecidableEq α]
    (S : Finset ι) (F : ι → Finset α) (x : α) :
    x ∈ S.inf F ↔ ∀ i ∈ S, x ∈ F i := by
  induction S using Finset.induction_on with
  | empty => simp
  | @insert i S hi ih =>
    rw [Finset.inf_insert, Finset.inf_eq_inter, Finset.mem_inter, ih]
    simp only [Finset.forall_mem_insert]

theorem boundedWeightedPartition_card_inclusion_exclusion
    (a : ι → ℕ) (n N : ℕ) [Finite (weightedPartition a n)] :
    (Nat.card (boundedWeightedPartition a n N) : ℤ) =
      ∑ S : Finset ι, (-1 : ℤ) ^ S.card *
        (Nat.card (upperViolationPartition a n N S) : ℤ) := by
  classical
  letI : Fintype (weightedPartition a n) := Fintype.ofFinite _
  let bad : ι → Finset (weightedPartition a n) := fun i =>
    Finset.univ.filter (fun x => N < x.1 i)
  have hgood : Nat.card (boundedWeightedPartition a n N) =
      (Finset.univ.inf (fun i => (bad i)ᶜ)).card := by
    apply Nat.subtype_card
    intro x
    simp only [mem_finset_inf, Finset.mem_univ, forall_true_left, Finset.mem_compl,
      bad, Finset.mem_filter, true_and, not_lt]
  have hbad : ∀ S : Finset ι, Nat.card (upperViolationPartition a n N S) =
      (S.inf bad).card := by
    intro S
    apply Nat.subtype_card
    intro x
    simp only [mem_finset_inf, bad, Finset.mem_filter, Finset.mem_univ, true_and]
  have h := Finset.inclusion_exclusion_card_inf_compl Finset.univ bad
  simpa only [← hgood, ← hbad, Finset.powerset_univ] using h

theorem boundedWeightedPartition_zero_card
    (a : ι → ℕ) (ha : ∀ i, 0 < a i) (N : ℕ) :
    Nat.card (boundedWeightedPartition a 0 N) = 1 := by
  classical
  let z : boundedWeightedPartition a 0 N :=
    ⟨⟨0, by simp⟩, by intro i; exact Nat.zero_le _⟩
  have hz : ∀ x : boundedWeightedPartition a 0 N, x = z := by
    intro x
    apply Subtype.ext
    apply Subtype.ext
    funext i
    have hi : a i * x.1.1 i ≤ ∑ j, a j * x.1.1 j :=
      Finset.single_le_sum (fun _ _ => Nat.zero_le _) (Finset.mem_univ i)
    rw [x.1.2] at hi
    have hprod : a i * x.1.1 i = 0 := Nat.eq_zero_of_le_zero hi
    have hxi : x.1.1 i = 0 := (Nat.mul_eq_zero.mp hprod).resolve_left (ha i).ne'
    exact hxi
  exact Nat.card_eq_one_iff_exists.mpr ⟨z, hz⟩

/-- For feasible nonnegative slope c, the bounded one-equation count
is polynomial on every progression of any common multiple of the
positive weights. There is no discarded initial interval. -/
theorem boundedWeightedPartition_polynomial_on_progressions
    (a : ι → ℕ) (ha : ∀ i, 0 < a i) (M : ℕ) (hM : 0 < M)
    (hdiv : ∀ i, a i ∣ M) (c : ℕ) (hctotal : c ≤ ∑ i, a i) :
    ∃ P : Fin M → ℚ[X],
      (∀ r, (P r).natDegree ≤ Fintype.card ι - 1) ∧
      ∀ (r : Fin M) (n : ℕ),
        (Nat.card (boundedWeightedPartition a (c * (M * n + r)) (M * n + r)) : ℚ) =
          (P r).eval (n : ℚ) := by
  classical
  by_cases hc : c = 0
  · subst c
    refine ⟨fun _ => 1, ?_, ?_⟩
    · intro r
      simp only [natDegree_one]
      exact Nat.zero_le _
    · intro r n
      rw [zero_mul, boundedWeightedPartition_zero_card a ha]
      simp only [Nat.cast_one, eval_one]
  · have hcpos : 0 < c := Nat.pos_of_ne_zero hc
    choose P hdegree heval using fun S : Finset ι =>
      upperViolationPartition_polynomial_on_progressions a ha M hM hdiv c hcpos hctotal S
    refine ⟨fun r => ∑ S : Finset ι, C ((-1 : ℚ) ^ S.card) * P S r, ?_, ?_⟩
    · intro r
      apply Polynomial.natDegree_sum_le_of_forall_le
      intro S _
      exact (natDegree_C_mul_le _ _).trans (hdegree S r)
    · intro r n
      let N := M * n + (r : ℕ)
      letI : Finite (weightedPartition a (c * N)) :=
        weightedPartition_finite a ha M hM hdiv (c * N)
      have hIE := boundedWeightedPartition_card_inclusion_exclusion a (c * N) N
      have hIEQ : (Nat.card (boundedWeightedPartition a (c * N) N) : ℚ) =
          ∑ S : Finset ι, (-1 : ℚ) ^ S.card *
            (Nat.card (upperViolationPartition a (c * N) N S) : ℚ) := by
        have h := congrArg (fun z : ℤ => (z : ℚ)) hIE
        simpa only [Int.cast_sum, Int.cast_mul, Int.cast_pow, Int.cast_neg,
          Int.cast_one, Int.cast_natCast] using h
      rw [hIEQ, Polynomial.eval_finsetSum]
      apply Finset.sum_congr rfl
      intro S _
      rw [eval_mul, eval_C, heval S r n]

theorem boundedWeightedPartition_quasipolynomial
    (a : ι → ℕ) (ha : ∀ i, 0 < a i) (c : ℕ) (hctotal : c ≤ ∑ i, a i) :
    ∃ M : ℕ, 0 < M ∧ ∃ P : Fin M → ℚ[X],
      (∀ r, (P r).natDegree ≤ Fintype.card ι - 1) ∧
      ∀ (r : Fin M) (n : ℕ),
        (Nat.card (boundedWeightedPartition a (c * (M * n + r)) (M * n + r)) : ℚ) =
          (P r).eval (n : ℚ) := by
  let M := ∏ i, a i
  have hM : 0 < M := Finset.prod_pos (fun i _ => ha i)
  have hdiv : ∀ i, a i ∣ M := fun i => Finset.dvd_prod_of_mem a (Finset.mem_univ i)
  obtain ⟨P, hdegree, heval⟩ :=
    boundedWeightedPartition_polynomial_on_progressions a ha M hM hdiv c hctotal
  exact ⟨M, hM, P, hdegree, heval⟩

end

end Loneliness.Hyperplane.QuasipolynomialArithmetic
