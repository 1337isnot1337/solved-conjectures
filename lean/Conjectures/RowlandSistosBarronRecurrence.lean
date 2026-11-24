import Conjectures.RowlandSistosBarronCharacteristic
import Mathlib.Algebra.LinearRecurrence

/-!
# Rowland–Sistos Barrón conjecture

Rank is the least order of an actual constant-coefficient recurrence valid
on a tail, with nonzero constant coefficient, exactly as in §2 of
Rowland–Sistos Barrón, arXiv:2501.14643v1. The characteristic-polynomial
calculation is connected here to that definition.
-/

noncomputable section

namespace RowlandSistosBarron

open Polynomial Finset Module

variable {K : Type*} [Field K]

/-- The recurrence obtained from a monic polynomial. -/
def recurrenceOfPolynomial (p : K[X]) : LinearRecurrence K where
  order := p.natDegree
  coeffs i := -p.coeff i

theorem recurrenceOfPolynomial_charPoly (p : K[X]) (hp : p.Monic) :
    (recurrenceOfPolynomial p).charPoly = p := by
  rw [LinearRecurrence.charPoly]
  simp only [recurrenceOfPolynomial, ← C_mul_X_pow_eq_monomial,
    C_1, one_mul, C_neg, neg_mul, sum_neg_distrib, sub_neg_eq_add]
  change X ^ p.natDegree +
    (∑ i : Fin p.natDegree, C (p.coeff (i : ℕ)) * X ^ (i : ℕ)) = p
  rw [Fin.sum_univ_eq_sum_range (fun i : ℕ => C (p.coeff i) * X ^ i) p.natDegree]
  exact hp.as_sum.symm

theorem recurrence_charPoly_action (E : LinearRecurrence K) (u : ℕ → K) (n : ℕ) :
    (aeval (sequenceShift (K := K)) E.charPoly) u n =
      u (n + E.order) - ∑ i : Fin E.order, E.coeffs i * u (n + i) := by
  rw [LinearRecurrence.charPoly]
  simp only [← C_mul_X_pow_eq_monomial, map_sub, map_sum, map_mul, map_pow,
    aeval_C, aeval_X, Algebra.algebraMap_eq_smul_one, LinearMap.sub_apply,
    LinearMap.sum_apply, Module.End.mul_apply, LinearMap.smul_apply,
    Module.End.one_apply, Pi.sub_apply, Pi.smul_apply, smul_eq_mul,
    sequenceShift_pow_apply, Finset.sum_apply, one_smul]

theorem recurrence_isSolution_iff (E : LinearRecurrence K) (u : ℕ → K) :
    E.IsSolution u ↔ (aeval (sequenceShift (K := K)) E.charPoly) u = 0 := by
  simp only [LinearRecurrence.IsSolution, funext_iff, Pi.zero_apply,
    recurrence_charPoly_action, sub_eq_zero]

/-- An actual recurrence valid from some index onward. The condition on the
constant coefficient excludes artificial zero characteristic roots. -/
def IsTailRecurrence (u : ℕ → K) (E : LinearRecurrence K) : Prop :=
  E.charPoly.coeff 0 ≠ 0 ∧ ∃ N : ℕ, E.IsSolution (fun n => u (n + N))

theorem isTailRecurrence_iff (u : ℕ → K) (E : LinearRecurrence K) :
    IsTailRecurrence u E ↔ E.charPoly.coeff 0 ≠ 0 ∧
      ∃ N : ℕ, ∀ n, N ≤ n →
        u (n + E.order) = ∑ i : Fin E.order, E.coeffs i * u (n + i) := by
  constructor
  · rintro ⟨hc, N, hN⟩
    refine ⟨hc, N, ?_⟩
    intro n hn
    have h := hN (n - N)
    simpa only [show n - N + E.order + N = n + E.order by omega,
      show ∀ i : Fin E.order, n - N + i + N = n + i by intro i; omega] using h
  · rintro ⟨hc, N, hN⟩
    refine ⟨hc, N, ?_⟩
    intro n
    have h := hN (n + N) (by omega)
    simpa only [show n + N + E.order = n + E.order + N by omega,
      show ∀ i : Fin E.order, n + N + i = n + i + N by intro i; omega] using h

def HasTailRecurrenceOrder (u : ℕ → K) (d : ℕ) : Prop :=
  ∃ E : LinearRecurrence K, E.order = d ∧ IsTailRecurrence u E

/-- Least tail-recurrence order. The fallback is irrelevant to every
constant-recursive sequence, for which existence is separately proved. -/
def tailRecurrenceRank (u : ℕ → K) : ℕ :=
  by
    classical
    exact if h : ∃ d, HasTailRecurrenceOrder u d then Nat.find h else 0

theorem tailRecurrenceRank_eq (u : ℕ → K) (d : ℕ)
    (hex : HasTailRecurrenceOrder u d)
    (hmin : ∀ r, HasTailRecurrenceOrder u r → d ≤ r) :
    tailRecurrenceRank u = d := by
  classical
  have h : ∃ r, HasTailRecurrenceOrder u r := ⟨d, hex⟩
  rw [tailRecurrenceRank, dite_eq_left h]
  exact Nat.le_antisymm (Nat.find_min' h hex) (hmin _ (Nat.find_spec h))

theorem sequenceShift_pow_exponentialPolynomial (a : K) (p : K[X]) (N : ℕ) :
    (sequenceShift ^ N) (exponentialPolynomial a p) =
      exponentialPolynomial a (a ^ N • taylor (N : K) p) := by
  ext n
  simp only [sequenceShift_pow_apply, exponentialPolynomial_apply, eval_smul,
    smul_eq_mul, taylor_eval, Nat.cast_add, pow_add]
  ring

variable {ι : Type*} [Fintype ι] [CharZero K]

theorem exponentialPolynomial_hasTailRecurrenceOrder (a : ι → K)
    (hinj : Function.Injective a) (ha : ∀ i, a i ≠ 0) (p : ι → K[X]) :
    HasTailRecurrenceOrder (∑ i, exponentialPolynomial (a i) (p i))
      (∑ i, recurrenceWeight (p i)) := by
  let q := characteristicPolynomial a p
  have hq : q.Monic := characteristicPolynomial_monic a p
  refine ⟨recurrenceOfPolynomial q, ?_, ?_⟩
  · exact characteristicPolynomial_natDegree a p
  · refine ⟨?_, 0, ?_⟩
    · rw [recurrenceOfPolynomial_charPoly q hq]
      exact characteristicPolynomial_coeff_zero_ne_zero a ha p
    · rw [recurrence_isSolution_iff, recurrenceOfPolynomial_charPoly q hq]
      simpa only [Nat.add_zero] using characteristicPolynomial_annihilates a hinj ha p

theorem exponentialPolynomial_tailRecurrence_minimal (a : ι → K)
    (hinj : Function.Injective a) (ha : ∀ i, a i ≠ 0) (p : ι → K[X])
    (E : LinearRecurrence K)
    (hE : IsTailRecurrence (∑ i, exponentialPolynomial (a i) (p i)) E) :
    (∑ i, recurrenceWeight (p i)) ≤ E.order := by
  obtain ⟨_, N, hN⟩ := hE
  have hshift :
      (fun n => (∑ i, exponentialPolynomial (a i) (p i)) (n + N)) =
        ∑ i, exponentialPolynomial (a i) ((a i) ^ N • taylor (N : K) (p i)) := by
    calc
      _ = (sequenceShift ^ N) (∑ i, exponentialPolynomial (a i) (p i)) := by
        ext n
        exact (sequenceShift_pow_apply _ N n).symm
      _ = _ := by
        rw [map_sum]
        simp only [sequenceShift_pow_exponentialPolynomial]
  rw [hshift, recurrence_isSolution_iff] at hN
  have h := characteristicPolynomial_minimal_degree a hinj ha
    (fun i => (a i) ^ N • taylor (N : K) (p i)) E.charPoly E.charPoly_monic.ne_zero hN
  have hw (i : ι) :
      recurrenceWeight ((a i) ^ N • taylor (N : K) (p i)) = recurrenceWeight (p i) := by
    rw [recurrenceWeight_smul _ (pow_ne_zero N (ha i)), recurrenceWeight_taylor]
  simpa only [hw, natDegree_eq_of_degree_eq_some E.charPoly_degree_eq_order] using h

theorem exponentialPolynomial_tailRecurrenceRank (a : ι → K)
    (hinj : Function.Injective a) (ha : ∀ i, a i ≠ 0) (p : ι → K[X]) :
    tailRecurrenceRank (∑ i, exponentialPolynomial (a i) (p i)) =
      ∑ i, recurrenceWeight (p i) := by
  apply tailRecurrenceRank_eq _ _ (exponentialPolynomial_hasTailRecurrenceOrder a hinj ha p)
  rintro r ⟨E, rfl, hE⟩
  exact exponentialPolynomial_tailRecurrence_minimal a hinj ha p E hE

end RowlandSistosBarron
