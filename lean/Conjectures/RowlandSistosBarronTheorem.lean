import Conjectures.RowlandSistosBarronSequence
import Conjectures.RowlandSistosBarronCoefficients
import Conjectures.RowlandSistosBarronQuasipolynomial
import Mathlib.Tactic.LinearCombination

/-!
# Rowland–Sistos Barrón conjecture

The full counterexample recorded in the existing entry
`results/rowland-sistos-barron/PROOF.md`, Sections 1–5, to the particular-rank
clause of Conjecture 5.3 of Eric Rowland and Jesús Sistos Barrón, *Complexity
of powers of a constant-recursive sequence*, arXiv:2501.14643v1.

The source's term "pseudo-polynomial" is not explicitly defined there.
The formal result uses the exact, conventional meaning "quasipolynomial":
polynomial on each residue class modulo a fixed positive integer. It does
not decide the separate conjecture about general rank sequences, and it
does not assert priority for the recorded counterexample.

Every rank below is the minimum order of an actual constant-coefficient
recurrence valid on a tail, with nonzero constant coefficient. The sequence
is integer-valued and is cast to an arbitrary characteristic-zero field.
-/

noncomputable section

namespace RowlandSistosBarron

open Polynomial

variable {K : Type*} [Field K] [CharZero K]

/-- The literal rank sequence of the powers of the documented integer sequence. -/
def rankSequence (M : ℕ) : ℕ := tailRecurrenceRank (poweredSequence (K := K) M)

theorem rankSequence_eq_coefficientRank (M : ℕ) :
    rankSequence (K := K) M = coefficientRank M :=
  poweredSequence_tailRecurrenceRank M

theorem rankSequence_hasTailRecurrenceOrder (M : ℕ) :
    HasTailRecurrenceOrder (poweredSequence (K := K) M) (rankSequence (K := K) M) := by
  rw [rankSequence_eq_coefficientRank]
  exact poweredSequence_hasTailRecurrenceOrder M

theorem integerSequence_hasTailRecurrenceOrder_six :
    HasTailRecurrenceOrder (fun n => (integerSequence n : K)) 6 := by
  have h := poweredSequence_hasTailRecurrenceOrder (K := K) 1
  rw [coefficientRank_one] at h
  change HasTailRecurrenceOrder (fun n => (integerSequence n : K) ^ 1) 6 at h
  simpa only [pow_one] using h

/-- Exact formula in natural-number form, with no truncated subtraction. -/
theorem rankSequence_formula {M : ℕ} (hM : 49 ≤ M) :
    2 * rankSequence (K := K) M +
      6 * (if M % 2 = 0 then 1 else 0) +
      12 * (if IsSquare M then 1 else 0) = 7 * M ^ 2 + 3 * M + 2 := by
  rw [rankSequence_eq_coefficientRank]
  exact coefficientRank_formula hM

theorem rankSequence_formula_cast {M : ℕ} (hM : 49 ≤ M) :
    2 * (rankSequence (K := K) M : K) +
      6 * (if M % 2 = 0 then 1 else 0) +
      12 * (if IsSquare M then 1 else 0) = 7 * (M : K) ^ 2 + 3 * M + 2 := by
  have h := congrArg (fun n : ℕ => (n : K)) (rankSequence_formula (K := K) hM)
  simpa only [Nat.cast_add, Nat.cast_mul, Nat.cast_pow, Nat.cast_ofNat,
    Nat.cast_ite, Nat.cast_one, Nat.cast_zero] using h

/-- The displayed formula from the existing proof. -/
theorem rankSequence_formula_div {M : ℕ} (hM : 49 ≤ M) :
    (rankSequence (K := K) M : K) =
      (7 * (M : K) ^ 2 + 3 * M + 2) / 2 -
        3 * (if M % 2 = 0 then 1 else 0) - 6 * (if IsSquare M then 1 else 0) := by
  have h := rankSequence_formula_cast (K := K) hM
  linear_combination (norm := ring_nf) h / 2

theorem rankSequence_not_eventuallyQuasipolynomial :
    ¬ EventuallyQuasipolynomial (fun M => (rankSequence (K := K) M : K)) := by
  apply not_eventuallyQuasipolynomial_of_square_formula
  intro M hM
  exact rankSequence_formula_cast hM

/-- The particular-rank universal clause, with "pseudo-polynomial" made
precise as eventual quasipolynomiality. -/
def ParticularRankConjecture : Prop :=
  ∀ s : ℕ → ℤ,
    (∃ d : ℕ, HasTailRecurrenceOrder (fun n => (s n : K)) d) →
      EventuallyQuasipolynomial
        (fun M => (tailRecurrenceRank (fun n => (s n : K) ^ M) : K))

theorem particularRankConjecture_false : ¬ ParticularRankConjecture (K := K) := by
  intro h
  have hs := h integerSequence ⟨6, integerSequence_hasTailRecurrenceOrder_six⟩
  exact rankSequence_not_eventuallyQuasipolynomial hs

/-- The complete documented result, for every characteristic-zero field. -/
theorem rowland_sistos_barron_counterexample :
    tailRecurrenceRank (fun n => (integerSequence n : K)) = 6 ∧
    (∀ M : ℕ, HasTailRecurrenceOrder (poweredSequence (K := K) M)
      (rankSequence (K := K) M)) ∧
    (∀ M : ℕ, 49 ≤ M → (rankSequence (K := K) M : K) =
      (7 * (M : K) ^ 2 + 3 * M + 2) / 2 -
        3 * (if M % 2 = 0 then 1 else 0) - 6 * (if IsSquare M then 1 else 0)) ∧
    ¬ EventuallyQuasipolynomial (fun M => (rankSequence (K := K) M : K)) := by
  exact ⟨integerSequence_rank_six, rankSequence_hasTailRecurrenceOrder,
    fun _ hM => rankSequence_formula_div hM, rankSequence_not_eventuallyQuasipolynomial⟩

end RowlandSistosBarron
