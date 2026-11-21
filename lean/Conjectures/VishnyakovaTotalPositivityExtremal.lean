module

public import Conjectures.VishnyakovaExtremal
public import Mathlib.LinearAlgebra.Matrix.Determinant.TotallyNonneg
public import Mathlib.Order.Fin.Basic
public import Mathlib.Algebra.Order.BigOperators.Group.Finset
public import Mathlib.Data.Nat.Choose.Sum

/-!
# Total nonnegativity of the extremal sampled sequence

Column cumulative sums preserve total nonnegativity. For any selected
columns, subtracting each preceding selected column makes the sums run over
disjoint increasing intervals. Multilinearity then expresses the determinant
as a sum of nonnegative minors. Repeated cumulative sums of the identity
matrix give the Toeplitz matrices of the binomial sequences.
-/

@[expose] public section

namespace VishnyakovaTotalPositivity

open Matrix
open scoped BigOperators

noncomputable def cumulativeColumns (M : Matrix ℕ ℕ ℝ) : Matrix ℕ ℕ ℝ :=
  fun i j => ∑ k ∈ Finset.range (j + 1), M i k

theorem cumulativeColumns_succ (M : Matrix ℕ ℕ ℝ) (i j : ℕ) :
    cumulativeColumns M i (j + 1) = cumulativeColumns M i j + M i (j + 1) :=
  Finset.sum_range_succ _ _

/-- Cumulative sums of columns preserve every finite ordered minor. -/
theorem cumulativeColumns_totallyNonneg {M : Matrix ℕ ℕ ℝ}
    (hM : M.IsTotallyNonneg) : (cumulativeColumns M).IsTotallyNonneg := by
  classical
  intro n rows cols hrows hcols
  cases n with
  | zero => simp
  | succ n =>
    let intervals : Fin (n + 1) → Finset ℕ :=
      Fin.cons (Finset.range (cols 0 + 1))
        (fun j => Finset.Ico (cols j.castSucc + 1) (cols j.succ + 1))
    let A : Matrix (Fin (n + 1)) (Fin (n + 1)) ℝ :=
      (cumulativeColumns M).submatrix rows cols
    let B : Matrix (Fin (n + 1)) (Fin (n + 1)) ℝ :=
      fun i j => ∑ k ∈ intervals j, M (rows i) k
    have hdet : A.det = B.det := by
      apply Matrix.det_eq_of_forall_col_eq_smul_add_pred (fun _ => 1)
      · intro i
        simp [A, B, intervals, cumulativeColumns]
      · intro i j
        have hc : cols j.castSucc + 1 ≤ cols j.succ + 1 :=
          Nat.add_le_add_right (hcols Fin.castSucc_lt_succ).le 1
        simpa [A, B, intervals, cumulativeColumns, add_comm] using
          (Finset.sum_range_add_sum_Ico (fun k => M (rows i) k) hc).symm
    have hexpand : B.det =
        ∑ p ∈ Fintype.piFinset intervals, (M.submatrix rows p).det := by
      change Matrix.det (fun i j : Fin (n + 1) => ∑ k ∈ intervals j, M (rows i) k) = _
      erw [Matrix.det_apply']
      simp only [Finset.prod_univ_sum, Finset.mul_sum]
      rw [Finset.sum_comm]
      apply Finset.sum_congr rfl
      intro p hp
      exact (Matrix.det_apply' (M.submatrix rows p)).symm
    change 0 ≤ A.det
    rw [hdet, hexpand]
    apply Finset.sum_nonneg
    intro p hp
    have hp' := Fintype.mem_piFinset.mp hp
    have hupper (j : Fin (n + 1)) : p j ≤ cols j := by
      refine Fin.cases ?_ (fun j => ?_) j
      · have h := hp' 0
        simpa [intervals, Nat.lt_succ_iff] using h
      · have hi : cols j.castSucc < p j.succ ∧ p j.succ ≤ cols j.succ := by
          simpa [intervals] using hp' j.succ
        exact hi.2
    apply hM hrows
    apply Fin.strictMono_iff_lt_succ.mpr
    intro j
    have hi : cols j.castSucc < p j.succ ∧ p j.succ ≤ cols j.succ := by
      simpa [intervals] using hp' j.succ
    exact lt_of_le_of_lt (hupper j.castSucc) hi.1

noncomputable def binomialToeplitz (n : ℕ) : Matrix ℕ ℕ ℝ :=
  fun i j => if i ≤ j then ((j - i + n).choose n : ℝ) else 0

theorem cumulativeColumns_one :
    cumulativeColumns (1 : Matrix ℕ ℕ ℝ) = binomialToeplitz 0 := by
  ext i j
  simp [cumulativeColumns, binomialToeplitz, Matrix.one_apply]

theorem cumulativeColumns_binomialToeplitz (n : ℕ) :
    cumulativeColumns (binomialToeplitz n) = binomialToeplitz (n + 1) := by
  ext i j
  induction j with
  | zero => simp [cumulativeColumns, binomialToeplitz]
  | succ j ih =>
    rw [cumulativeColumns_succ, ih]
    by_cases hij : i ≤ j
    · have hij' : i ≤ j + 1 := by omega
      have hs : j + 1 - i = (j - i) + 1 := by omega
      simp only [binomialToeplitz, ite_eq_left hij, ite_eq_left hij', hs]
      have h := congrArg (fun k : ℕ => (k : ℝ))
        (Nat.choose_succ_succ' (j - i + n + 1) n)
      push_cast at h
      simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm, add_comm] using h.symm
    · by_cases hij' : i ≤ j + 1
      · have hi : i = j + 1 := by omega
        simp [binomialToeplitz, hi]
      · simp [binomialToeplitz, hij, hij']

/-- All minors of the Toeplitz matrix of `choose (k+n) n` are nonnegative. -/
theorem binomialToeplitz_totallyNonneg (n : ℕ) :
    (binomialToeplitz n).IsTotallyNonneg := by
  induction n with
  | zero =>
    rw [← cumulativeColumns_one]
    exact cumulativeColumns_totallyNonneg Matrix.IsTotallyNonneg.one
  | succ n ih =>
    rw [← cumulativeColumns_binomialToeplitz]
    exact cumulativeColumns_totallyNonneg ih

/-- The degree-`n` polynomial with the radius-attaining root `-n` has a
totally nonnegative sampled Toeplitz matrix. -/
theorem unitExtremal_sampled_totallyNonneg (n : ℕ) :
    Matrix.IsTotallyNonneg (fun i j : ℕ => if i ≤ j then
      (VishnyakovaRootRadius.unitExtremal n).eval ((j - i : ℕ) : ℝ) else 0) := by
  have heq : (fun i j : ℕ => if i ≤ j then
      (VishnyakovaRootRadius.unitExtremal n).eval ((j - i : ℕ) : ℝ) else 0) =
      binomialToeplitz n := by
    funext i j
    simp only [VishnyakovaRootRadius.unitExtremal_eval_nat, binomialToeplitz]
  rw [heq]
  exact binomialToeplitz_totallyNonneg n

end VishnyakovaTotalPositivity
