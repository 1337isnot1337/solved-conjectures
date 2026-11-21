module

public import Mathlib.Algebra.Polynomial.Basic
public import Mathlib.Algebra.BigOperators.Fin
public import Mathlib.Basic.Real.Basic
public import Mathlib.Tactic.FinCases
public import Mathlib.Tactic.NormNum
public import Lean.Elab.Tactic.Omega
public import Mathlib.Tactic.Ring

/-!
# The type-D refined recurrence

Ranks start at two: `refinedRow r` is the row for rank `r + 2`.
The separate signed-permutation module proves that this recurrence enumerates
the literal source objects. No enumeration theorem is assumed here.
-/

@[expose] public section

namespace Chow

open Polynomial
open scoped BigOperators

noncomputable section

/-- The cutoff in the rank-`n` to rank-`n+1` recurrence. On the new row's
index range this is `ceil (n*i/(n+1))`, written without real division. -/
def cutoff (n i : ℕ) : ℕ := if i ≤ n then i else i - 1

theorem cutoff_monotone (n : ℕ) : Monotone (cutoff n) := by
  intro i j hij
  unfold cutoff
  split_ifs <;> omega

@[simp] theorem cutoff_zero (n : ℕ) : cutoff n 0 = 0 := by
  simp [cutoff]

theorem cutoff_le (n i : ℕ) (hi : i < 2 * (n + 1)) : cutoff n i ≤ 2 * n := by
  unfold cutoff
  split_ifs <;> omega

theorem cutoff_surjective (n : ℕ) (j : Fin (2 * n + 1)) :
    ∃ i : Fin (2 * (n + 1)), cutoff n i.val = j.val := by
  by_cases hj : j.val ≤ n
  · refine ⟨⟨j.val, by omega⟩, ?_⟩
    simp [cutoff, hj]
  · refine ⟨⟨j.val + 1, by omega⟩, ?_⟩
    simp [cutoff, show ¬j.val + 1 ≤ n by omega]

/-- One step of the refined recurrence, indexed in descending signed order. -/
def nextRow (n : ℕ) (f : Fin (2 * n) → ℝ[X])
    (i : Fin (2 * (n + 1))) : ℝ[X] :=
  ∑ j : Fin (2 * n), if j.val < cutoff n i.val then X * f j else f j

/-- The rank-two row `(2, 2X, 2X, 2X²)`. -/
def baseRow2 (i : Fin 4) : ℝ[X] :=
  if i.val = 0 then C 2 else if i.val = 3 then C 2 * X ^ 2 else C 2 * X

/-- The defining rank-two formula is exported in its original module. -/
theorem baseRow2_apply (i : Fin 4) : baseRow2 i =
    if i.val = 0 then C 2 else if i.val = 3 then C 2 * X ^ 2 else C 2 * X := by
  simp only [baseRow2]

/-- `refinedRow r` is the refinement at the actual rank `r+2`. -/
def refinedRow : (r : ℕ) → Fin (2 * (r + 2)) → ℝ[X]
  | 0 => baseRow2
  | r + 1 => nextRow (r + 2) (refinedRow r)

def totalRow (r : ℕ) : ℝ[X] := ∑ i, refinedRow r i

/-- The total-row formula is exported before downstream modules unfold it. -/
theorem totalRow_eq_sum (r : ℕ) : totalRow r = ∑ i, refinedRow r i := by
  simp only [totalRow]

@[simp] theorem refinedRow_zero (i : Fin 4) : refinedRow 0 i = baseRow2 i := by
  simp only [refinedRow]

@[simp] theorem refinedRow_succ (r : ℕ) (i : Fin (2 * (r + 1 + 2))) :
    refinedRow (r + 1) i = nextRow (r + 2) (refinedRow r) i := by
  simp only [refinedRow]

theorem nextRow_first (n : ℕ) (f : Fin (2 * n) → ℝ[X]) :
    nextRow n f ⟨0, by omega⟩ = ∑ j, f j := by
  simp [nextRow]

theorem refinedRow_first (r : ℕ) :
    refinedRow (r + 1) ⟨0, by omega⟩ = totalRow r := by
  exact nextRow_first (r + 2) (refinedRow r)

end

end Chow
