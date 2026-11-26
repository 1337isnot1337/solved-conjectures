import Conjectures.DukesRevstackDegree
import Conjectures.DukesRevstackHorner
import Mathlib.Algebra.BigOperators.NatAntidiagonal

/-! A triangular integer recurrence computes the coefficients of the same
Eulerian and revstack polynomials obtained from the actual sorting map. -/

open Polynomial

namespace DukesRevstack

def rowEntry (a : Array ℤ) (k : ℕ) : ℤ := a[k]?.getD 0

private theorem entry_ofFn {d : ℕ} (f : Fin d → ℤ) {k : ℕ} (hk : k<d) :
    rowEntry (Array.ofFn f) k=f ⟨k,hk⟩ := by
  simp [rowEntry,Array.size_ofFn,hk]

private theorem entry_ofFn_out {d : ℕ} (f : Fin d → ℤ) {k : ℕ} (hk : d≤k) :
    rowEntry (Array.ofFn f) k=0 := by
  simp [rowEntry,Array.getElem?_eq_none (by simpa using hk : (Array.ofFn f).size≤k)]

def eulerRows : ℕ → Array ℤ
  | 0 => #[1]
  | n+1 =>
    let a := eulerRows n
    Array.ofFn fun i : Fin (n+2) => match i.val with
      | 0 => 1
      | k+1 => ((k : ℤ)+2)*rowEntry a (k+1)+((n : ℤ)-k)*rowEntry a k

theorem euler_row_correct (n k : ℕ) :
    (rowEntry (eulerRows n) k : ℝ)=(eulerian (R := ℝ) n).coeff k := by
  induction n generalizing k with
  | zero =>
    cases k with
    | zero => simp [rowEntry,eulerRows]
    | succ k => simp [rowEntry,eulerRows,coeff_one]
  | succ n ih =>
    rw [eulerRows]
    by_cases h : k<n+2
    · rw [entry_ofFn _ h]
      cases k with
      | zero => simp [coeff_zero_eq_eval_zero]
      | succ k =>
        rw [eulerian_succ,coeff_eulerianOperator_succ]
        push_cast
        rw [ih,ih]
    · rw [entry_ofFn_out _ (by omega),Int.cast_zero]
      apply Eq.symm
      apply coeff_eq_zero_of_natDegree_lt
      rw [(eulerian_monic_degree (R := ℝ) (n+1) (by omega)).natDegree_eq]
      omega

def convolutionEntry (a b : Array ℤ) (k : ℕ) : ℤ :=
  ∑ i∈Finset.range (k+1),rowEntry a i*rowEntry b (k-i)

def reducedRow (n : ℕ) : List ℤ :=
  let all := eulerRows n
  let l := eulerRows (leftSize n)
  let r := eulerRows (rightSize n)
  (Array.ofFn fun i : Fin n => match i.val with
    | 0 => rowEntry all 0
    | k+1 => rowEntry all (k+1)-convolutionEntry l r k).toList

theorem coefficient_polynomialOfRow (c : List ℤ) (k : ℕ) :
    (polynomialOfRow c).coeff k=(c[k]?.getD 0 : ℤ) := by
  induction c generalizing k with
  | nil => simp [polynomialOfRow]
  | cons a c ih =>
    cases k with
    | zero => simp [polynomialOfRow]
    | succ k =>
      rw [polynomialOfRow,coeff_add,coeff_C,coeff_X_mul,ih]
      simp

theorem reduced_row_correct (n : ℕ) (hn : 3≤n) :
    polynomialOfRow (reducedRow n)=reducedRevstack (R := ℝ) n := by
  ext k
  rw [coefficient_polynomialOfRow]
  unfold reducedRow
  rw [Array.getElem?_toList]
  change (rowEntry (Array.ofFn _) k : ℝ)=_
  by_cases h : k<n
  · rw [entry_ofFn _ h]
    cases k with
    | zero => simp [euler_row_correct,coeff_zero_eq_eval_zero]
    | succ k =>
      rw [reducedRevstack,coeff_sub,coeff_X_mul,coeff_mul,
        Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk]
      simp [convolutionEntry,euler_row_correct]
  · rw [entry_ofFn_out _ (by omega),Int.cast_zero]
    exact (coeff_eq_zero_of_natDegree_lt (by rw [(reducedRevstack_monic_degree n hn).natDegree_eq]; omega)).symm

end DukesRevstack
