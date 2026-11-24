import Conjectures.FanTringaliBasic
import Mathlib.Data.Finset.Powerset

/-!
# Fan–Tringali's power-monoid length-set conjecture: the local gadget

The nine points and their two unique domino quotients are the gadget in
Section 1 of `results/fan-tringali-power-monoid-lengths/PROOF.md`.
Every finite search below is an ordinary kernel-checked `decide` proof.
The quantified uniqueness statements concern all finite subsets of `ℕ × ℕ`;
the powerset reduction is justified by the zero element of the divisor.
This module is a component of the general construction, not a formalization
of the full conjecture on its own.
-/

open scoped Pointwise

namespace FanTringali

section Quotients

variable {α : Type*} [DecidableEq α] [AddMonoid α]

/-- All possible finite quotients of `X` by `T`, when `T` contains zero. -/
def quotients (X T : Finset α) : Finset (Finset α) :=
  X.powerset.filter fun D => D + T = X

theorem mem_quotients {X T D : Finset α} (hT : 0 ∈ T) :
    D ∈ quotients X T ↔ D + T = X := by
  simp only [quotients, Finset.mem_filter, Finset.mem_powerset]
  constructor
  · exact And.right
  · intro h
    refine ⟨?_, h⟩
    rw [← h]
    exact left_subset_sum (A := D) (B := T) hT

theorem quotient_unique {X T D₀ : Finset α} (hT : 0 ∈ T)
    (h : quotients X T = {D₀}) {D : Finset α} (hD : D + T = X) : D = D₀ := by
  have hmem := (mem_quotients hT).mpr hD
  simpa only [h, Finset.mem_singleton] using hmem

theorem quotient_impossible {X T : Finset α} (hT : 0 ∈ T)
    (h : quotients X T = ∅) (D : Finset α) : D + T ≠ X := by
  intro hD
  have hmem := (mem_quotients hT).mpr hD
  simp only [h, Finset.notMem_empty] at hmem

end Quotients

namespace Gadget

def points : Finset (ℕ × ℕ) :=
  {(2, 0), (3, 0), (1, 1), (2, 1), (3, 1), (0, 2), (1, 2), (0, 3), (1, 3)}

def horizontal : Finset (ℕ × ℕ) := {0, (1, 0)}

def vertical : Finset (ℕ × ℕ) := {0, (0, 1)}

def square : Finset (ℕ × ℕ) := horizontal + vertical

def horizontalQuotient : Finset (ℕ × ℕ) := {(2, 0), (1, 1), (2, 1), (0, 2), (0, 3)}

def verticalQuotient : Finset (ℕ × ℕ) := {(0, 2), (1, 1), (1, 2), (2, 0), (3, 0)}

theorem horizontal_eq : horizontalQuotient + horizontal = points := by decide

theorem vertical_eq : verticalQuotient + vertical = points := by decide

set_option maxRecDepth 10000 in
set_option maxHeartbeats 4000000 in
theorem horizontal_quotients : quotients points horizontal = {horizontalQuotient} := by decide

set_option maxRecDepth 10000 in
set_option maxHeartbeats 4000000 in
theorem vertical_quotients : quotients points vertical = {verticalQuotient} := by decide

set_option maxRecDepth 10000 in
set_option maxHeartbeats 4000000 in
theorem square_quotients : quotients points square = ∅ := by decide

theorem horizontal_unique {D : Finset (ℕ × ℕ)}
    (hD : D + horizontal = points) : D = horizontalQuotient :=
  quotient_unique (by decide) horizontal_quotients hD

theorem vertical_unique {D : Finset (ℕ × ℕ)}
    (hD : D + vertical = points) : D = verticalQuotient :=
  quotient_unique (by decide) vertical_quotients hD

theorem square_impossible (D : Finset (ℕ × ℕ)) : D + square ≠ points :=
  quotient_impossible (by decide) square_quotients D

end Gadget

end FanTringali
