import Conjectures.LonelinessCoalescenceValue
import Conjectures.LonelinessModularShortVector
import Mathlib.LinearAlgebra.FiniteDimensional.Lemmas

/-! A lower-dimensional runner bound supplies the gap on every genuine
integer plane through a positive speed vector. -/

namespace Loneliness.Modular.PlaneGeometry

open Loneliness.CoordinateSubspace Loneliness.SubspaceDensity

noncomputable section

def rationalIntegerLine {n : ℕ} (v : Fin n → ℤ) : Submodule ℚ (Fin n → ℚ) :=
  Submodule.span ℚ {fun i => (v i : ℚ)}

def rationalIntegerPlane {n : ℕ} (v z : Fin n → ℤ) : Submodule ℚ (Fin n → ℚ) :=
  rationalIntegerLine v ⊔ rationalIntegerLine z

theorem realSpan_integer_line {n : ℕ} (v : Fin n → ℤ) :
    realSpan (rationalIntegerLine v) = integerLine v := by
  rw [rationalIntegerLine, realSpan_span, Set.image_singleton]
  have h : rationalVector (fun i => (v i : ℚ)) = integerVector v := by
    ext i
    simp [rationalVector, integerVector]
  rw [h]
  rfl

theorem realSpan_integer_plane {n : ℕ} (v z : Fin n → ℤ) :
    realSpan (rationalIntegerPlane v z) = integerPlane v z := by
  rw [rationalIntegerPlane, realSpan_sup, realSpan_integer_line, realSpan_integer_line]
  rfl

theorem integer_plane_finrank {n : ℕ} (v z : Fin n → ℤ)
    (hv : integerVector v ≠ 0) (hz : integerVector z ∉ integerLine v) :
    Module.finrank ℝ (integerPlane v z) = 2 := by
  change Module.finrank ℝ
    (integerLine v ⊔ Submodule.span ℝ {integerVector z} : Submodule ℝ (Fin n → ℝ)) = 2
  rw [Submodule.finrank_sup_span_singleton hz]
  change Module.finrank ℝ (Submodule.span ℝ {integerVector v})+1 = 2
  rw [finrank_span_singleton hv]

theorem positive_vector_ne_zero {n : ℕ} (v : Fin (n+1) → ℕ)
    (hv : ∀ i, 0 < v i) : integerVector (fun i => (v i : ℤ)) ≠ 0 := by
  intro h
  have hzero : (v 0 : ℝ) = 0 := by simpa [integerVector] using congrFun h 0
  have hpos : (0 : ℝ) < v 0 := by exact_mod_cast hv 0
  linarith

theorem positive_plane_coordinateFree {n : ℕ} (v : Fin n → ℕ)
    (hv : ∀ i, 0 < v i) (z : Fin n → ℤ) :
    CoordinateFree (integerPlane (fun i => (v i : ℤ)) z) := by
  intro i
  refine ⟨integerVector (fun j => (v j : ℤ)), ?_, ?_⟩
  · exact (le_sup_left : integerLine (fun j => (v j : ℤ)) ≤
      integerPlane (fun j => (v j : ℤ)) z) (integerVector_mem_line _)
  · change ((v i : ℤ) : ℝ) ≠ 0
    exact_mod_cast (Nat.ne_of_gt (hv i))

/-- In `n+2` coordinates, every genuine integer plane through a positive
speed vector has the lower bound for at most `n+1` distinct speeds. -/
theorem plane_gap_of_runner_bound (n : ℕ)
    (hLRC : LonelyRunnerBound (n+1))
    (v : Fin (n+2) → ℕ) (hv : ∀ i, 0 < v i)
    (z : Fin (n+2) → ℤ)
    (hz : integerVector z ∉ integerLine (fun i => (v i : ℤ))) :
    (1 : ℝ)/((n+1 : ℕ)+1) ≤ spaceValue (integerPlane (fun i => (v i : ℤ)) z) := by
  let E := rationalIntegerPlane (fun i => (v i : ℤ)) z
  have hspan : realSpan E = integerPlane (fun i => (v i : ℤ)) z :=
    realSpan_integer_plane _ _
  have hdim : Module.finrank ℝ (realSpan E) = 2 := by
    rw [hspan]
    exact integer_plane_finrank _ _ (positive_vector_ne_zero v hv) hz
  have hfree : CoordinateFree (realSpan E) := by
    rw [hspan]
    exact positive_plane_coordinateFree v hv z
  have hcard : Fintype.card (Fin (n+2))-Module.finrank ℝ (realSpan E)+1 ≤ n+1 := by
    rw [hdim]
    simp
  have h := spaceValue_lower_of_runner_bound E hfree (n+1)
    ((1 : ℝ)/((n+1 : ℕ)+1)) hLRC hcard
  rwa [hspan] at h

theorem ten_speed_plane_gap
    (hLRC : LonelyRunnerBound 9)
    (v : Fin 10 → ℕ) (hv : ∀ i, 0 < v i)
    (z : Fin 10 → ℤ)
    (hz : integerVector z ∉ integerLine (fun i => (v i : ℤ))) :
    (1/10 : ℝ) ≤ spaceValue (integerPlane (fun i => (v i : ℤ)) z) := by
  have h := plane_gap_of_runner_bound 8 hLRC v hv z hz
  norm_num at h
  exact h

end

end Loneliness.Modular.PlaneGeometry
