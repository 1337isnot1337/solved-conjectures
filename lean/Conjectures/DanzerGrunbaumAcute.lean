import Mathlib
/-!
# Danzer–Grünbaum's conjecture

Danzer–Grünbaum (1962), the acute-set upper bound, disproved by
Erdős–Füredi (1983). This is Harangi's later explicit construction
(2011, Example 4.1), with perturbations (1,2,3)/100 and uniform scaling.
-/
namespace PublishedDanzerGrunbaum
open Finset
open scoped BigOperators

/-- The usual Euclidean acute-angle condition, expressed by the coordinate
dot product at the middle point. The three points are distinct. -/
def Acute {d m : ℕ} (p : Fin m → Fin d → ℝ) : Prop :=
  ∀ i j k : Fin m, i ≠ j → j ≠ k → i ≠ k →
    0 < ∑ t : Fin d, (p i t - p j t) * (p k t - p j t)

/-- All finite acute sets in Euclidean dimension at least two have size
at most twice the dimension minus one. An injective enumeration of the
points is equivalent to a finite set of that cardinality. -/
def conjecture : Prop :=
  ∀ (d m : ℕ) (p : Fin m → Fin d → ℝ),
    2 ≤ d → Function.Injective p → Acute p → m ≤ 2 * d - 1

/-- Harangi's eight points, multiplied by 100. -/
def points : Fin 8 → Fin 4 → ℤ :=
  ![![100, 0, 0, 1], ![-100, 0, 0, 1],
    ![0, 100, 0, 2], ![0, -100, 0, 2],
    ![0, 0, 100, 3], ![0, 0, -100, 3],
    ![40, 40, 40, 100], ![-40, -40, -40, 100]]

set_option maxRecDepth 10000 in
set_option maxHeartbeats 0 in
theorem distinct_points :
    ∀ i j : Fin 8, (∀ t : Fin 4, points i t = points j t) → i = j := by
  decide

set_option maxRecDepth 10000 in
set_option maxHeartbeats 0 in
theorem integer_acute :
    ∀ i j k : Fin 8, i ≠ j → j ≠ k → i ≠ k →
      0 < ∑ t : Fin 4, (points i t - points j t) * (points k t - points j t) := by
  decide

def realPoints (i : Fin 8) (t : Fin 4) : ℝ := points i t

theorem realPoints_injective : Function.Injective realPoints := by
  intro i j h
  apply distinct_points i j
  intro t
  have ht : (points i t : ℝ) = (points j t : ℝ) := congrFun h t
  exact_mod_cast ht

theorem realPoints_acute : Acute realPoints := by
  intro i j k hij hjk hik
  have h := integer_acute i j k hij hjk hik
  unfold realPoints
  exact_mod_cast h

/-- Full disproof, with arbitrary dimensions and finite acute sets in
the statement of the conjecture. -/
theorem conjecture_false : ¬ conjecture := by
  intro h
  have h' := h 4 8 realPoints (by decide) realPoints_injective realPoints_acute
  omega

#print axioms conjecture_false
end PublishedDanzerGrunbaum
