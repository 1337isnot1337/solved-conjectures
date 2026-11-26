import Conjectures.HeimNeuhauserPlanePartition
import Conjectures.OrdinaryDarcaisRows

/-! Factorial-cleared coefficients after shifting by either endpoint. -/

namespace PlanePartition

open Finset Polynomial
open OrdinaryDarcais (rowPoly rowEval addRows scaleRow sumRows rowPoly_addRows rowPoly_sumRows_ofFn
  rowPoly_scaleRow rowPoly_eval)

noncomputable def scaledValue (e : ℕ) (t : ℝ) (n : ℕ) : ℝ :=
  (n.factorial : ℝ) * planePartition ((e : ℝ) + t) n

def recurrenceWeight (n k : ℕ) : ℕ :=
  divisorSquareSum (k + 1) * (n - k + 1).ascFactorial k

theorem scaledValue_succ (e : ℕ) (t : ℝ) (n : ℕ) :
    scaledValue e t (n + 1) =
      ((e : ℝ) + t) * ∑ k ∈ range (n + 1), (recurrenceWeight n k : ℝ) * scaledValue e t (n - k) := by
  have h := planePartition_recurrence ((e : ℝ) + t) n
  unfold scaledValue
  rw [Nat.factorial_succ, Nat.cast_mul, mul_comm ((n + 1 : ℕ) : ℝ) (n.factorial : ℝ), mul_assoc, h,
    mul_left_comm ((n.factorial : ℕ) : ℝ) ((e : ℝ) + t), Finset.mul_sum]
  congr 1
  apply sum_congr rfl
  intro k hk
  have hkn := Nat.le_of_lt_succ (mem_range.mp hk)
  have hf : (((n - k).factorial : ℕ) : ℝ) *
      (((n - k + 1).ascFactorial k : ℕ) : ℝ) = (n.factorial : ℝ) := by
    exact_mod_cast (Nat.factorial_mul_ascFactorial (n - k) k).trans
      (congrArg Nat.factorial (Nat.sub_add_cancel hkn))
  rw [recurrenceWeight, Nat.cast_mul, ← hf]
  ring

def nextRow (e : ℕ) (row : ℕ → List ℕ) (n : ℕ) : List ℕ :=
  let s := sumRows (List.ofFn fun k : Fin (n + 1) =>
    scaleRow (recurrenceWeight n k.val) (row (n - k.val)))
  addRows (scaleRow e s) (0 :: s)

theorem rowPoly_nextRow (e : ℕ) (row : ℕ → List ℕ) (n : ℕ) :
    rowPoly (nextRow e row n) =
      (C e + X) * ∑ k ∈ range (n + 1), C (recurrenceWeight n k) * rowPoly (row (n - k)) := by
  unfold nextRow
  rw [rowPoly_addRows, rowPoly_scaleRow, rowPoly, map_zero, zero_add, rowPoly_sumRows_ofFn, Finset.sum_range,
    add_mul]
  simp only [rowPoly_scaleRow]

/-- Dynamic table of the coefficient lists of every scaled polynomial up to an index. -/
def rowTable (e : ℕ) : ℕ → Array (List ℕ)
  | 0 => #[[1]]
  | n + 1 =>
    let rows := rowTable e n
    rows.push (nextRow e (fun i => rows[i]?.getD []) n)

private theorem rowTable_size (e n : ℕ) : (rowTable e n).size = n + 1 := by
  induction n with
  | zero => rfl
  | succ n ih => simp [rowTable, ih]

/-- Every table entry evaluates to the corresponding scaled original coefficient. -/
theorem table_eval (e N : ℕ) (t : ℝ) {n : ℕ} (hn : n ≤ N) :
    (rowPoly ((rowTable e N)[n]?.getD [])).eval₂ (Nat.castRingHom ℝ) t = scaledValue e t n := by
  induction N generalizing n with
  | zero =>
    have h : n = 0 := by omega
    subst n
    simp [rowTable, rowPoly, scaledValue, planePartition_zero]
  | succ N ih =>
    by_cases h : n ≤ N
    · rw [rowTable, Array.getElem?_push, rowTable_size, ite_eq_right (by omega : n ≠ N + 1)]
      exact ih h
    · have h' : n = N + 1 := by omega
      subst n
      rw [rowTable, Array.getElem?_push, rowTable_size, ite_eq_left rfl, Option.getD_some,
        rowPoly_nextRow, scaledValue_succ]
      simp only [eval₂_mul, eval₂_add, eval₂_X, eval₂_finsetSum, eval₂_C, Nat.coe_castRingHom]
      congr 1
      apply sum_congr rfl
      intro k _
      rw [ih (Nat.sub_le N k)]

def checkedRow (e n : ℕ) := (rowTable e n)[n]?.getD []

theorem checkedRow_eval (e : ℕ) (t : ℝ) (n : ℕ) :
    (rowPoly (checkedRow e n)).eval₂ (Nat.castRingHom ℝ) t = scaledValue e t n :=
  table_eval e n t le_rfl

end PlanePartition
