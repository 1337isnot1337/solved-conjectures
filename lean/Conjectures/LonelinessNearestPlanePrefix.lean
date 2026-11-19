import Conjectures.LonelinessNearestPlaneValue
import Conjectures.LonelinessCoalescenceValue
import Mathlib.LinearAlgebra.Dimension.Finrank

/-! Rationality and the coordinate-coalescence lower bound for an integer
basis prefix. Combining this lower bound with nearest-plane rounding gives
the geometric prefix constraints for the product certificates. -/

namespace Loneliness.NearestPlane

open scoped BigOperators
open SubspaceDensity CoordinateSubspace

noncomputable section

variable {ι : Type*} [Fintype ι] [Nonempty ι]

theorem coordinatePrefix_eq_span_range (w : ℕ → ι → ℤ) (r : ℕ) :
    coordinatePrefix w r =
      Submodule.span ℝ (Set.range (fun i : Fin r => integerVector (w i.val))) := by
  unfold coordinatePrefix
  congr 1
  ext x
  constructor
  · rintro ⟨i, hi, rfl⟩
    exact ⟨⟨i, hi⟩, rfl⟩
  · rintro ⟨i, rfl⟩
    exact ⟨i.val, i.isLt, rfl⟩

def rationalPrefix (w : ℕ → ι → ℤ) (r : ℕ) : Submodule ℚ (ι → ℚ) :=
  Submodule.span ℚ (Set.range (fun i : Fin r => fun j => (w i.val j : ℚ)))

theorem realSpan_rationalPrefix (w : ℕ → ι → ℤ) (r : ℕ) :
    realSpan (rationalPrefix w r) = coordinatePrefix w r := by
  rw [coordinatePrefix_eq_span_range]
  exact realSpan_span_integer (fun i : Fin r => w i.val)

theorem coordinatePrefix_finrank (w : ℕ → ι → ℤ) (r : ℕ)
    (hind : LinearIndependent ℝ (fun i : Fin r => integerVector (w i.val))) :
    Module.finrank ℝ (coordinatePrefix w r) = r := by
  rw [coordinatePrefix_eq_span_range, finrank_span_eq_card hind, Fintype.card_fin]

theorem coordinatePrefix_coordinateFree (w : ℕ → ι → ℤ) (r : ℕ)
    (hfirst : ∀ j, w 0 j ≠ 0) : CoordinateFree (coordinatePrefix w (r+1)) := by
  intro j
  refine ⟨integerVector (w 0), ?_, ?_⟩
  · exact Submodule.subset_span ⟨0, by simp, rfl⟩
  · simpa only [integerVector, ne_eq, Int.cast_eq_zero] using hfirst j

/-- The prefix torus has dimension `r+1`; coordinate coalescence reduces its
lower bound to the lonely-runner bound for `card ι - r` distinct speeds. -/
theorem coordinatePrefix_value_lower (w : ℕ → ι → ℤ) (r : ℕ)
    (hr : r < Fintype.card ι)
    (hind : LinearIndependent ℝ (fun i : Fin (r+1) => integerVector (w i.val)))
    (hfirst : ∀ j, w 0 j ≠ 0)
    (hLRC : LonelyRunnerBound (Fintype.card ι - r)) :
    (1 : ℝ) / ((Fintype.card ι - r : ℕ) + 1) ≤
      spaceValue (coordinatePrefix w (r+1)) := by
  have hdim := coordinatePrefix_finrank w (r+1) hind
  have hfree := coordinatePrefix_coordinateFree w r hfirst
  rw [← realSpan_rationalPrefix] at hdim hfree ⊢
  apply spaceValue_lower_of_runner_bound (rationalPrefix w (r+1)) hfree
    (Fintype.card ι - r) _ hLRC
  rw [hdim]
  omega

/-- All geometric inputs to the product prefix inequality, apart from the
stated lower-dimensional runner theorem, follow from an integer prefix with
independent real columns and a nonzero first coordinate vector. -/
theorem runner_prefix_squared_lower (w : ℕ → ι → ℤ) (r : ℕ) (threshold : ℝ)
    (hr : r < Fintype.card ι)
    (hind : LinearIndependent ℝ (fun i : Fin (r+1) => integerVector (w i.val)))
    (hfirst : ∀ j, w 0 j ≠ 0)
    (hLRC : LonelyRunnerBound (Fintype.card ι - r))
    (hline : spaceValue (Submodule.span ℝ {integerVector (w 0)}) ≤ threshold)
    (hthreshold : threshold ≤ (1 : ℝ) / ((Fintype.card ι - r : ℕ) + 1)) :
    4 * ((1 : ℝ) / ((Fintype.card ι - r : ℕ) + 1) - threshold)^2 ≤
      tailGramSum w r := by
  exact tailGramSum_lower w r _ threshold
    (coordinatePrefix_value_lower w r hr hind hfirst hLRC) hline hthreshold

end

end Loneliness.NearestPlane
