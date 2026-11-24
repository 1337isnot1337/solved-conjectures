import Mathlib.Algebra.Polynomial.Taylor
import Mathlib.Algebra.Polynomial.Roots
import Mathlib.Algebra.Polynomial.Coeff
import Mathlib.Tactic.Ring
import Mathlib.Tactic.NormNum

/-!
# Rowland–Sistos Barrón conjecture

Finite-difference facts for the literal minimal-recurrence argument in
`results/rowland-sistos-barron/PROOF.md`, §1.  These are supporting lemmas;
they do not alone prove the conjecture's negation.
-/

noncomputable section

namespace RowlandSistosBarron

open Polynomial Finset

variable {K : Type*} [Field K]

/-- Unit forward difference of a polynomial. -/
def forwardDifference : K[X] →ₗ[K] K[X] := taylor 1 - LinearMap.id

theorem forwardDifference_apply (p : K[X]) :
    forwardDifference p = taylor 1 p - p := rfl

@[simp] theorem forwardDifference_C (c : K) : forwardDifference (C c) = 0 := by
  simp [forwardDifference_apply]

theorem forwardDifference_eval (p : K[X]) (x : K) :
    (forwardDifference p).eval x = p.eval (x + 1) - p.eval x := by
  rw [forwardDifference_apply, eval_sub, taylor_eval]

variable [CharZero K]

theorem polynomial_eq_of_nat_eval_eq (p q : K[X])
    (h : ∀ n : ℕ, p.eval (n : K) = q.eval (n : K)) : p = q := by
  apply p.eq_of_infinite_eval_eq q
  exact (Set.infinite_range_of_injective (Nat.cast_injective : Function.Injective
    (fun n : ℕ => (n : K)))).mono (by rintro x ⟨n, rfl⟩; exact h n)

theorem forwardDifference_eq_zero_iff (p : K[X]) :
    forwardDifference p = 0 ↔ p.natDegree = 0 := by
  constructor
  · intro hp
    have heval (n : ℕ) : p.eval (n : K) = p.eval 0 := by
      induction n with
      | zero => simp
      | succ n ih =>
        have hh := congrArg (fun q : K[X] => q.eval (n : K)) hp
        rw [forwardDifference_eval, eval_zero] at hh
        simpa only [Nat.cast_add, Nat.cast_one] using (sub_eq_zero.mp hh).trans ih
    have hc : p = C (p.eval 0) := polynomial_eq_of_nat_eval_eq p _ (by
      intro n
      simpa only [eval_C] using heval n)
    simpa only [natDegree_C] using congrArg Polynomial.natDegree hc
  · intro hp
    rw [eq_C_of_natDegree_eq_zero hp]
    exact forwardDifference_C _

omit [CharZero K] in
theorem forwardDifference_monomial_coeff (n j : ℕ) (c : K) :
    (forwardDifference (monomial n c)).coeff j =
      c * ((n.choose j : K) - if n = j then 1 else 0) := by
  rw [forwardDifference_apply, coeff_sub, taylor_monomial, coeff_C_mul,
    C_1, coeff_X_add_one_pow, coeff_monomial]
  split_ifs <;> ring

theorem forwardDifference_monomial_natDegree (n : ℕ) (c : K) (hc : c ≠ 0) :
    (forwardDifference (monomial n c)).natDegree = n - 1 := by
  cases n with
  | zero => simp [monomial_zero_left]
  | succ n =>
    simp only [Nat.add_sub_cancel]
    apply natDegree_eq_of_le_of_coeff_ne_zero
    · apply natDegree_le_iff_coeff_eq_zero.mpr
      intro j hj
      rw [forwardDifference_monomial_coeff]
      by_cases hjn : n + 1 = j
      · subst j
        simp
      · have hnj : n + 1 < j := by omega
        simp [Nat.choose_eq_zero_of_lt hnj, hjn]
    · rw [forwardDifference_monomial_coeff]
      have hnn : n + 1 ≠ n := by omega
      simp only [Nat.choose_succ_self_right, hnn, ↓reduceIte, sub_zero]
      exact mul_ne_zero hc (Nat.cast_ne_zero.mpr (by omega))

theorem forwardDifference_natDegree (p : K[X]) :
    (forwardDifference p).natDegree = p.natDegree - 1 := by
  apply map_natDegree_eq_sub (k := 1)
  · intro q hq
    exact (forwardDifference_eq_zero_iff q).mpr (by omega)
  · exact forwardDifference_monomial_natDegree

theorem forwardDifference_iterate_natDegree (p : K[X]) (r : ℕ) :
    ((forwardDifference (K := K))^[r] p).natDegree = p.natDegree - r := by
  induction r generalizing p with
  | zero => simp
  | succ r ih =>
    rw [Function.iterate_succ_apply', forwardDifference_natDegree, ih]
    omega

theorem forwardDifference_iterate_eq_zero_iff (p : K[X]) (r : ℕ) :
    (forwardDifference (K := K))^[r] p = 0 ↔ p = 0 ∨ p.natDegree < r := by
  induction r generalizing p with
  | zero => simp
  | succ r ih =>
    rw [Function.iterate_succ_apply, ih]
    rw [forwardDifference_eq_zero_iff, forwardDifference_natDegree]
    constructor
    · rintro (h | h)
      · exact Or.inr (by omega)
      · exact Or.inr (by omega)
    · rintro (h | h)
      · subst p
        exact Or.inl (by simp)
      · by_cases hp : p.natDegree = 0
        · exact Or.inl hp
        · exact Or.inr (by omega)

end RowlandSistosBarron
