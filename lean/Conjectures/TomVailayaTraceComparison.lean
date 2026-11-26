import Conjectures.TomVailayaColorBasis
import Conjectures.TomVailayaWeightedPathRows

/-! The exact trace conclusion from agreement of the weighted path observations. -/

open Matrix

namespace TomVailaya

noncomputable section

variable {K E : Type*} [Field K] [Fintype E] {N : ℕ}

/-- The weighted path observations determine a finite transfer matrix. -/
theorem weightedPathTests_injective (x : Fin N → K) (hx : Function.Injective x) :
    Function.Injective ((pathTestRows (RatFunc.C ∘ x) (RatFunc.X : RatFunc K)) *
      · : Matrix (Fin N) (Fin N) (RatFunc K) → Matrix (Fin N) (Fin N) (RatFunc K)) := by
  have h := Matrix.linearIndependent_row_iff_isUnit.mp (weightedPathRows_linearIndependent x hx)
  intro A B heq
  exact h.mul_left_cancel heq

/-- Once the path observations of the weighted color matrix in its color
basis agree with those of a candidate matrix, the candidate's trace is
the literal chromatic function of the glued endpoints. -/
theorem chromatic_close_eq_trace_of_weighted_path_tests
    (x : Fin N → K) (hx : Function.Injective x) (hn : ∀ b, x b ≠ 0)
    {m : ℕ} (edge : E → Fin (m + 2) × Fin (m + 2))
    (F : Matrix (Fin N) (Fin N) (RatFunc K))
    (hTests :
      let vars := RatFunc.C ∘ x
      let q := (RatFunc.X : RatFunc K)
      let B := colorBasis vars q
      let T := pathTestRows vars q
      T * (B⁻¹ * colorMatrix vars q edge * B) = T * F) :
    chromatic (RatFunc.C ∘ x) (RatFunc.X : RatFunc K) (closeEdges edge) = F.trace := by
  let vars := RatFunc.C ∘ x
  let q := (RatFunc.X : RatFunc K)
  let B := colorBasis vars q
  let A := colorMatrix vars q edge
  have hB : IsUnit B.det :=
    (Matrix.isUnit_iff_isUnit_det B).mp (weightedColorBasis_isUnit x hx hn)
  have hF : B⁻¹ * A * B = F := weightedPathTests_injective x hx hTests
  rw [← trace_colorMatrix_eq_chromatic_close, ← hF]
  change A.trace = (B⁻¹ * A * B).trace
  have hcancel : B * (B⁻¹ * A) = A := by
    rw [← mul_assoc, Matrix.mul_nonsing_inv B hB, one_mul]
  rw [Matrix.trace_mul_comm (B⁻¹ * A) B, hcancel]

end

end TomVailaya
