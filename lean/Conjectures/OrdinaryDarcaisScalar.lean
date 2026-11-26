import Conjectures.OrdinaryDarcaisRows

/-! Scalar evaluations of the factorial-cleared ordinary divisor polynomial after shifting the real parameter by one. -/

namespace OrdinaryDarcais

open Finset Polynomial

/-- Dynamic table of the coefficient lists of every scaled polynomial up to an index. -/
def dynamicRows : ℕ → Array (List ℕ)
  | 0 => #[[1]]
  | n + 1 =>
    let rows := dynamicRows n
    rows.push (nextRow (fun i => rows[i]?.getD []) n)

private theorem dynamicRows_size (n : ℕ) : (dynamicRows n).size = n + 1 := by
  induction n with
  | zero => rfl
  | succ n ih => simp [dynamicRows, ih]

/-- Every table entry evaluates to the corresponding scaled original coefficient. -/
theorem dynamicRows_eval (N : ℕ) (t : ℝ) {n : ℕ} (hn : n ≤ N) :
    (rowPoly ((dynamicRows N)[n]?.getD [])).eval₂ (Nat.castRingHom ℝ) t = scaledValue t n := by
  induction N generalizing n with
  | zero =>
    have h : n = 0 := by omega
    subst n
    simp [dynamicRows, rowPoly, scaledValue, darcais_zero]
  | succ N ih =>
    by_cases h : n ≤ N
    · rw [dynamicRows, Array.getElem?_push, dynamicRows_size, ite_eq_right (by omega : n ≠ N + 1)]
      exact ih h
    · have h' : n = N + 1 := by omega
      subst n
      rw [dynamicRows, Array.getElem?_push, dynamicRows_size, ite_eq_left rfl, Option.getD_some,
        rowPoly_nextRow, scaledValue_succ]
      simp only [eval₂_mul, eval₂_add, eval₂_X, eval₂_one, eval₂_finsetSum, eval₂_C, Nat.coe_castRingHom]
      congr 1
      apply sum_congr rfl
      intro k _
      rw [ih (Nat.sub_le N k)]

def shiftedRow (n : ℕ) := (dynamicRows n)[n]?.getD []

theorem shiftedRow_eval (t : ℝ) (n : ℕ) :
    (rowPoly (shiftedRow n)).eval₂ (Nat.castRingHom ℝ) t = scaledValue t n :=
  dynamicRows_eval n t le_rfl

def nestedSum (n : ℕ) (row : ℕ → ℕ) : ℕ → ℕ
  | 0 => divisorSum (n + 1) * row 0
  | m + 1 => divisorSum (n - m) * row (m + 1) + (m + 1) * nestedSum n row m

def scalarTable (z : ℕ) : ℕ → Array ℕ
  | 0 => #[1]
  | n + 1 =>
    let rows := scalarTable z n
    rows.push (z * nestedSum n (fun i => rows[i]?.getD 0) n)

private theorem nestedSum_eq (n : ℕ) (row : ℕ → ℕ) (m : ℕ) :
    nestedSum n row m = ∑ i ∈ range (m + 1),
      divisorSum (n + 1 - i) * (i + 1).ascFactorial (m - i) * row i := by
  induction m with
  | zero => simp [nestedSum]
  | succ m ih =>
    rw [nestedSum, ih, Finset.mul_sum, sum_range_succ _ (m + 1)]
    simp only [Nat.sub_self, Nat.ascFactorial_zero, mul_one, Nat.add_sub_add_right]
    rw [add_comm]
    congr 1
    apply sum_congr rfl
    intro i hi
    have hi' := mem_range.mp hi
    rw [show m + 1 - i = (m - i) + 1 by omega, Nat.ascFactorial_succ,
      show i + 1 + (m - i) = m + 1 by omega]
    ring

private theorem nestedSum_recurrence (n : ℕ) (row : ℕ → ℕ) :
    nestedSum n row n = ∑ k ∈ range (n + 1), recurrenceWeight n k * row (n - k) := by
  rw [nestedSum_eq, ← sum_range_reflect]
  apply sum_congr rfl
  intro k hk
  have hk' := mem_range.mp hk
  simp only [Nat.add_sub_cancel, recurrenceWeight]
  rw [show n + 1 - (n - k) = k + 1 by omega, show n - (n - k) = k by omega]


/-- A scalar witness table satisfying the recurrence evaluates the genuine shifted polynomial. -/
theorem scalarCandidate_eval {d N : ℕ} {a : ℕ → ℕ} (h₀ : a 0 = 1)
    (hs : ∀ n < N, a (n + 1) = (1 + d) * nestedSum n a n) {n : ℕ} (hn : n ≤ N) :
    a n = (rowPoly (shiftedRow n)).eval d := by
  have hv {j : ℕ} (hj : j ≤ N) : (a j : ℝ) = scaledValue (d : ℝ) j := by
    induction j using Nat.strong_induction_on with
    | h j ih =>
      cases j with
      | zero => simp [h₀, scaledValue, darcais_zero]
      | succ j =>
        rw [hs j (by omega), nestedSum_recurrence, Nat.cast_mul, Nat.cast_add, Nat.cast_one, Nat.cast_sum,
          scaledValue_succ]
        congr 1
        apply sum_congr rfl
        intro k _
        rw [Nat.cast_mul, ih (j - k) (by omega) (by omega)]
  have h := (hv hn).trans (shiftedRow_eval d n).symm
  change (a n : ℝ) = (rowPoly (shiftedRow n)).eval₂ (Nat.castRingHom ℝ) (Nat.castRingHom ℝ d) at h
  rw [Polynomial.eval₂_hom] at h
  exact Nat.cast_injective (R := ℝ) h

end OrdinaryDarcais
