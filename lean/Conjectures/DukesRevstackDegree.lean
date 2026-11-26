import Conjectures.DukesRevstackPolynomial
import Mathlib.Algebra.Polynomial.Degree.IsMonicOfDegree

/-! The reduced Eulerian and revstack polynomials are monic in the
specified degree. This gives the degree side of the root-count argument. -/

open Polynomial

namespace DukesRevstack

variable {R : Type*} [CommRing R]

theorem coeff_eulerianOperator_succ (n k : ℕ) (p : R[X]) :
    (eulerianOperator n p).coeff (k + 1) =
      ((k : R) + 2) * p.coeff (k + 1) + ((n : R) - k) * p.coeff k := by
  have he : eulerianOperator n p =
      p + C (n : R) * (X * p) + X * p.derivative - X * (X * p.derivative) := by
    unfold eulerianOperator
    ring
  rw [he, coeff_sub, coeff_add, coeff_add, coeff_C_mul, coeff_X_mul, coeff_X_mul, coeff_X_mul, coeff_derivative]
  cases k with
  | zero => simp; ring
  | succ k =>
    rw [coeff_X_mul, coeff_derivative]
    push_cast
    ring

private theorem eulerianOperator_preserves_monic [Nontrivial R] {d : ℕ} {p : R[X]}
    (h : IsMonicOfDegree p d) :
    IsMonicOfDegree (eulerianOperator (d + 1) p) (d + 1) := by
  apply (isMonicOfDegree_iff _ _).mpr
  constructor
  · apply natDegree_le_iff_coeff_eq_zero.mpr
    intro k hk
    obtain ⟨j, rfl⟩ : ∃ j, k = j + 1 := ⟨k - 1, by omega⟩
    have hj : d < j := by omega
    have hj' : d < j + 1 := by omega
    rw [coeff_eulerianOperator_succ, coeff_eq_zero_of_natDegree_lt (h.natDegree_eq ▸ hj'),
      coeff_eq_zero_of_natDegree_lt (h.natDegree_eq ▸ hj)]
    ring
  · have htop : p.coeff d = 1 := by
      rw [← h.natDegree_eq, coeff_natDegree, h.leadingCoeff_eq]
    have hnext : p.coeff (d + 1) = 0 :=
      coeff_eq_zero_of_natDegree_lt (by rw [h.natDegree_eq]; omega)
    rw [coeff_eulerianOperator_succ, htop, hnext]
    push_cast
    ring

theorem eulerian_monic_degree [Nontrivial R] (n : ℕ) (hn : 0 < n) :
    IsMonicOfDegree (eulerian (R := R) n) (n - 1) := by
  cases n with
  | zero => omega
  | succ d =>
    induction d with
    | zero => simp [eulerian_succ, eulerianOperator]
    | succ d ih =>
      have h : IsMonicOfDegree (eulerian (R := R) (d + 1)) d := ih (by omega)
      rw [eulerian_succ]
      exact eulerianOperator_preserves_monic h

theorem reducedRevstack_monic_degree [Nontrivial R] (n : ℕ) (hn : 3 ≤ n) :
    IsMonicOfDegree (reducedRevstack (R := R) n) (n - 1) := by
  let a := leftSize n
  let b := rightSize n
  have ha : 0 < a := by dsimp [a, leftSize]; omega
  have hb : 0 < b := by dsimp [b, rightSize]; omega
  have hs : a + b = n - 1 := split_size_add (by omega)
  have hM := eulerian_monic_degree (R := R) n (by omega)
  have hA := (eulerian_monic_degree (R := R) a ha).natDegree_eq
  have hB := (eulerian_monic_degree (R := R) b hb).natDegree_eq
  have hDeg : (X * (eulerian (R := R) a * eulerian b)).natDegree ≤ n - 2 := by
    calc
      _ ≤ (X : R[X]).natDegree + (eulerian (R := R) a * eulerian b).natDegree := natDegree_mul_le
      _ ≤ 1 + ((eulerian (R := R) a).natDegree + (eulerian (R := R) b).natDegree) :=
        add_le_add (by simp) natDegree_mul_le
      _ ≤ _ := by rw [hA, hB]; omega
  apply (isMonicOfDegree_iff _ _).mpr
  change ((eulerian n : R[X]) - X * (eulerian a * eulerian b)).natDegree ≤ n - 1 ∧ _
  constructor
  · exact (natDegree_sub_le _ _).trans (max_le (by rw [hM.natDegree_eq]) (hDeg.trans (by omega)))
  · have hzero : (X * (eulerian (R := R) a * eulerian b)).coeff (n - 1) = 0 :=
      coeff_eq_zero_of_natDegree_lt (hDeg.trans_lt (by omega))
    change ((eulerian n : R[X]) - X * (eulerian a * eulerian b)).coeff (n - 1) = 1
    rw [coeff_sub, hzero, sub_zero, ← hM.natDegree_eq, coeff_natDegree, hM.leadingCoeff_eq]

end DukesRevstack
