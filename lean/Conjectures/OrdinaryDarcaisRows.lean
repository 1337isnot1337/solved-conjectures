import Conjectures.OrdinaryDarcais
import Conjectures.OrdinaryDarcaisPacked

/-! The factorial-cleared recurrence and its coefficient-list interpretation. -/

namespace OrdinaryDarcais

open Finset Polynomial

noncomputable def scaledValue (t : ℝ) (n : ℕ) : ℝ :=
  (n.factorial : ℝ) * darcais (1 + t) n

def recurrenceWeight (n k : ℕ) : ℕ :=
  divisorSum (k + 1) * (n - k + 1).ascFactorial k

theorem scaledValue_succ (t : ℝ) (n : ℕ) :
    scaledValue t (n + 1) =
      (1 + t) * ∑ k ∈ range (n + 1), (recurrenceWeight n k : ℝ) * scaledValue t (n - k) := by
  have h := darcais_recurrence (1 + t) n
  unfold scaledValue
  rw [Nat.factorial_succ, Nat.cast_mul, mul_comm ((n + 1 : ℕ) : ℝ) (n.factorial : ℝ), mul_assoc, h,
    mul_left_comm ((n.factorial : ℕ) : ℝ) (1 + t), Finset.mul_sum]
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

noncomputable def rowPoly : List ℕ → ℕ[X]
  | [] => 0
  | a :: as => C a + X * rowPoly as

def rowEval (t : ℕ) : List ℕ → ℕ
  | [] => 0
  | a :: as => a + t * rowEval t as

theorem rowPoly_eval (t : ℕ) (row : List ℕ) : (rowPoly row).eval t = rowEval t row := by
  induction row with
  | nil => simp [rowPoly, rowEval]
  | cons a as ih => simp [rowPoly, rowEval, ih]

def addRows : List ℕ → List ℕ → List ℕ
  | [], b => b
  | a, [] => a
  | a :: as, b :: bs => (a + b) :: addRows as bs

theorem rowPoly_addRows (a b : List ℕ) : rowPoly (addRows a b) = rowPoly a + rowPoly b := by
  induction a generalizing b with
  | nil => simp [addRows, rowPoly]
  | cons a as ih =>
    cases b with
    | nil => simp [addRows, rowPoly]
    | cons b bs =>
      simp only [addRows, rowPoly, ih, map_add, mul_add]
      ac_rfl

def scaleRow (a : ℕ) (row : List ℕ) : List ℕ := row.map (a * ·)

theorem rowPoly_scaleRow (a : ℕ) (row : List ℕ) :
    rowPoly (scaleRow a row) = C a * rowPoly row := by
  induction row with
  | nil => simp [scaleRow, rowPoly]
  | cons b bs ih =>
    simp only [scaleRow, List.map_cons, rowPoly, map_mul] at *
    rw [ih]
    ring

def sumRows (rows : List (List ℕ)) : List ℕ := rows.foldr addRows []

theorem rowPoly_sumRows_ofFn {n : ℕ} (rows : Fin n → List ℕ) :
    rowPoly (sumRows (List.ofFn rows)) = ∑ i, rowPoly (rows i) := by
  induction n with
  | zero => simp [sumRows, rowPoly]
  | succ n ih =>
    rw [List.ofFn_succ, show sumRows (rows 0 :: List.ofFn (fun i => rows i.succ)) =
      addRows (rows 0) (sumRows (List.ofFn (fun i => rows i.succ))) from rfl,
      rowPoly_addRows, Fin.sum_univ_succ, ih]

def nextRow (row : ℕ → List ℕ) (n : ℕ) : List ℕ :=
  let s := sumRows (List.ofFn fun k : Fin (n + 1) =>
    scaleRow (recurrenceWeight n k.val) (row (n - k.val)))
  addRows s (0 :: s)

theorem rowPoly_nextRow (row : ℕ → List ℕ) (n : ℕ) :
    rowPoly (nextRow row n) =
      (1 + X) * ∑ k ∈ range (n + 1), C (recurrenceWeight n k) * rowPoly (row (n - k)) := by
  unfold nextRow
  rw [rowPoly_addRows, rowPoly, map_zero, zero_add, rowPoly_sumRows_ofFn, Finset.sum_range,
    add_mul, one_mul]
  simp only [rowPoly_scaleRow]

theorem rowPoly_matches {row : ℕ → List ℕ} {N : ℕ}
    (h₀ : row 0 = [1]) (hs : ∀ n < N, row (n + 1) = nextRow row n)
    (t : ℝ) {n : ℕ} (hn : n ≤ N) :
    (rowPoly (row n)).eval₂ (Nat.castRingHom ℝ) t = scaledValue t n := by
  revert hn
  induction n using Nat.strong_induction_on with
  | h n ih =>
    intro hn
    cases n with
    | zero => simp [h₀, rowPoly, scaledValue, darcais_zero]
    | succ n =>
      rw [hs n (by omega), rowPoly_nextRow, scaledValue_succ]
      simp only [eval₂_mul, eval₂_add, eval₂_one, eval₂_X, eval₂_finsetSum, eval₂_C,
        Nat.coe_castRingHom]
      congr 1
      apply sum_congr rfl
      intro k _
      rw [ih _ (by omega) (by omega)]

end OrdinaryDarcais
