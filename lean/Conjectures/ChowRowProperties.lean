module

public import Conjectures.ChowBase
public import Mathlib.Algebra.Polynomial.BigOperators
public import Mathlib.Algebra.Polynomial.Coeff
public import Mathlib.Algebra.Polynomial.Eval.Coeff
public import Mathlib.Algebra.Polynomial.Degree.Operations
public import Mathlib.Tactic.ComputeDegree
public import Mathlib.Tactic.Push

/-!
# Positivity, degree, and absence of a common refined-row zero

These facts follow directly from the full recurrence. In particular, the
absence of a common zero is proved at every complex point and every rank.
-/

@[expose] public section

namespace Chow

open Polynomial
open scoped BigOperators

theorem ceval_ofReal (P : ℝ[X]) (x : ℝ) : ceval P (x : ℂ) = ((P.eval x : ℝ) : ℂ) := by
  exact Polynomial.eval_map_apply (p := P) Complex.ofRealHom x

theorem refinedRow_coeff_nonneg (r : ℕ) (i : Fin (2 * (r + 2))) (k : ℕ) :
    0 ≤ (refinedRow r i).coeff k := by
  induction r generalizing k with
  | zero =>
    fin_cases i <;> simp [refinedRow, baseRow2, coeff_C_mul, coeff_C, coeff_X_pow, coeff_X]
      <;> positivity
  | succ r ih =>
    simp only [refinedRow_succ, nextRow, finsetSum_coeff]
    apply Finset.sum_nonneg
    intro j hj
    split_ifs
    · cases k with
      | zero => simp
      | succ k => simpa only [coeff_X_mul] using ih j k
    · exact ih j k

theorem totalRow_coeff_nonneg (r k : ℕ) : 0 ≤ (totalRow r).coeff k := by
  simp only [totalRow, finsetSum_coeff]
  exact Finset.sum_nonneg fun i _ => refinedRow_coeff_nonneg r i k

theorem refinedRow_natDegree_le (r : ℕ) (i : Fin (2 * (r + 2))) :
    (refinedRow r i).natDegree ≤ r + 2 := by
  induction r with
  | zero =>
    fin_cases i <;> norm_num [refinedRow, baseRow2, Polynomial.C_ofNat]
  | succ r ih =>
    change (nextRow (r + 2) (refinedRow r) i).natDegree ≤ r + 1 + 2
    apply natDegree_sum_le_of_forall_le
    intro j hj
    split_ifs
    · have hj' := ih j
      exact natDegree_mul_le.trans (by simp only [natDegree_X]; omega)
    · exact (ih j).trans (by omega)

theorem totalRow_natDegree_le (r : ℕ) : (totalRow r).natDegree ≤ r + 2 := by
  exact natDegree_sum_le_of_forall_le _ _ fun i _ => refinedRow_natDegree_le r i

theorem nextRow_last (n : ℕ) (f : Fin (2 * n) → ℝ[X]) :
    nextRow n f ⟨2 * n + 1, by omega⟩ = X * ∑ j, f j := by
  have hcut : cutoff n (2 * n + 1) = 2 * n := by
    simp [cutoff, show ¬2 * n + 1 ≤ n by omega]
  simp only [nextRow, hcut, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro j hj
  rw [ite_eq_left j.isLt]

theorem refinedRow_last (r : ℕ) :
    refinedRow (r + 1) ⟨2 * (r + 2) + 1, by omega⟩ = X * totalRow r :=
  nextRow_last (r + 2) (refinedRow r)

theorem totalRow_top_coeff_pos (r : ℕ) : 0 < (totalRow r).coeff (r + 2) := by
  induction r with
  | zero => norm_num [totalRow, refinedRow, baseRow2, Fin.sum_univ_succ]
  | succ r ih =>
    let i : Fin (2 * (r + 1 + 2)) := ⟨2 * (r + 2) + 1, by omega⟩
    have hi : 0 < (refinedRow (r + 1) i).coeff (r + 1 + 2) := by
      rw [show refinedRow (r + 1) i = X * totalRow r from refinedRow_last r]
      simpa only [coeff_X_mul] using ih
    apply hi.trans_le
    simp only [totalRow, finsetSum_coeff]
    exact Finset.single_le_sum (fun j _ => refinedRow_coeff_nonneg (r + 1) j _)
      (Finset.mem_univ i)

theorem totalRow_natDegree (r : ℕ) : (totalRow r).natDegree = r + 2 := by
  exact (totalRow_natDegree_le r).antisymm
    (le_natDegree_of_ne_zero (totalRow_top_coeff_pos r).ne')

theorem totalRow_leadingCoeff_pos (r : ℕ) : 0 < (totalRow r).leadingCoeff := by
  simpa only [leadingCoeff, totalRow_natDegree] using totalRow_top_coeff_pos r

theorem totalRow_eval_zero_pos (r : ℕ) : 0 < (totalRow r).eval 0 := by
  rw [← coeff_zero_eq_eval_zero]
  induction r with
  | zero => norm_num [totalRow, refinedRow, baseRow2, Fin.sum_univ_succ]
  | succ r ih =>
    let i : Fin (2 * (r + 1 + 2)) := ⟨0, by omega⟩
    have hi : 0 < (refinedRow (r + 1) i).coeff 0 := by
      rw [show refinedRow (r + 1) i = totalRow r from refinedRow_first r]
      exact ih
    apply hi.trans_le
    simp only [totalRow, finsetSum_coeff]
    exact Finset.single_le_sum (fun j _ => refinedRow_coeff_nonneg (r + 1) j 0)
      (Finset.mem_univ i)

theorem refinedRow_eval_one_pos (r : ℕ) (i : Fin (2 * (r + 2))) :
    0 < (refinedRow r i).eval 1 := by
  induction r with
  | zero => fin_cases i <;> norm_num [refinedRow, baseRow2]
  | succ r ih =>
    simp only [refinedRow_succ, nextRow, eval_finsetSum]
    simp only [apply_ite, eval_mul, eval_X, one_mul, ite_self]
    exact Finset.sum_pos (fun j _ => ih j) ⟨⟨0, by omega⟩, Finset.mem_univ _⟩

theorem cutValue_succ {n : ℕ} (z : ℂ) (f : Fin n → ℂ) (k : Fin n) :
    cutValue z f (k.val + 1) - cutValue z f k.val = (z - 1) * f k := by
  classical
  simp only [cutValue, ← Finset.sum_sub_distrib]
  rw [Finset.sum_eq_single k]
  · simp
    ring
  · intro i hi hik
    have hval : i.val ≠ k.val := fun h => hik (Fin.ext h)
    by_cases hil : i.val < k.val
    · simp [hil, show i.val < k.val + 1 by omega]
    · simp [hil, show ¬i.val < k.val + 1 by omega]
  · simp

theorem refinedRow_no_common_zero (r : ℕ) (z : ℂ) :
    ∃ i : Fin (2 * (r + 2)), ceval (refinedRow r i) z ≠ 0 := by
  classical
  induction r with
  | zero =>
    refine ⟨0, ?_⟩
    norm_num [refinedRow, baseRow2, ceval]
  | succ r ih =>
    by_contra h
    push Not at h
    by_cases hz : z = 1
    · subst z
      have hzero := h ⟨0, by omega⟩
      rw [show (1 : ℂ) = ((1 : ℝ) : ℂ) from rfl, ceval_ofReal] at hzero
      have hreal : (refinedRow (r + 1) ⟨0, by omega⟩).eval 1 = 0 :=
        Complex.ofReal_eq_zero.mp hzero
      exact (refinedRow_eval_one_pos (r + 1) ⟨0, by omega⟩).ne' hreal
    · obtain ⟨j, hj⟩ := ih
      obtain ⟨a, ha⟩ := cutoff_surjective (r + 2) ⟨j.val, by omega⟩
      obtain ⟨b, hb⟩ := cutoff_surjective (r + 2) ⟨j.val + 1, by omega⟩
      have hA := h a
      have hB := h b
      simp only [refinedRow_succ, ceval_nextRow, ha, hb] at hA hB
      have heq := cutValue_succ z (fun i => ceval (refinedRow r i) z) j
      rw [hA, hB, sub_self] at heq
      exact hj ((mul_eq_zero.mp heq.symm).resolve_left (sub_ne_zero.mpr hz))

end Chow
