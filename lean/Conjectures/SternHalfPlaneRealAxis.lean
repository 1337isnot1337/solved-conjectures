import Conjectures.SternHalfPlaneContinuant

/-! Unconditional real-axis endpoint for the actual integer Stern polynomials. -/

namespace Conjectures.SternHalfPlane

theorem sternPolynomial_eval_ne_zero_of_pos_real {n : ℕ} (hn : 0 < n) {x : ℝ}
    (hx : 0 < x) : (sternPolynomial n).eval₂ (Int.castRingHom ℂ) (x : ℂ) ≠ 0 := by
  have he : ((stern n x : ℝ) : ℂ) = stern n (x : ℂ) :=
    map_stern Complex.ofRealHom x n
  rw [eval_sternPolynomial, ← he]
  exact Complex.ofReal_ne_zero.mpr (stern_pos hx hn).ne'

theorem sternPolynomial_eval_ne_zero_of_real_re_ge_one {n : ℕ} (hn : 0 < n)
    {z : ℂ} (hre : 1 ≤ z.re) (him : z.im = 0) :
    (sternPolynomial n).eval₂ (Int.castRingHom ℂ) z ≠ 0 := by
  have he : (z.re : ℂ) = z := Complex.ext rfl (by simpa using him.symm)
  rw [← he]
  exact sternPolynomial_eval_ne_zero_of_pos_real hn (by linarith)

end Conjectures.SternHalfPlane
