import Conjectures.KovalevZeroFreeNormalization
import Conjectures.KovalevZeroFreeKernel
import Mathlib.Analysis.Complex.SqrtDeriv
import Mathlib.Analysis.Complex.RealDeriv
import Mathlib.Analysis.Calculus.Deriv.Pow
import Mathlib.Analysis.Calculus.Deriv.Add
import Mathlib.Tactic.LinearCombination

/-!
# Kovalev's square-root Taylor-section zero-free conjecture

The exact finite-section derivative identity in Section 1, equation (2), of
the recorded proof, for the actual principal complex square root.
-/

namespace Conjectures.KovalevZeroFree

noncomputable section

theorem invSection_succ (M : ℕ) (z : ℂ) :
    invSection (M + 1) z = invSection M z + (halfCoeff (M + 1) : ℂ) * z ^ (M + 1) := by
  unfold invSection
  exact Finset.sum_range_succ _ _

theorem sqrt_one_sub_hasDerivAt {z : ℂ} (hz : 0 < (1 - z).re) :
    HasDerivAt (fun w : ℂ => Complex.sqrt (1 - w))
      (-(Complex.sqrt (1 - z))⁻¹ / 2) z := by
  have hs := (Complex.hasDerivAt_sqrt (Or.inl hz)).comp z
    ((hasDerivAt_const z (1 : ℂ)).sub (hasDerivAt_id z))
  have he : (-1 / 2 : ℂ) = -(2 : ℂ)⁻¹ := by norm_num
  simpa only [Function.comp_def, he, Complex.cpow_neg, Complex.sqrt, zero_sub,
    mul_neg, mul_one, neg_div] using hs

/-- The derivative of the finite inverse-square-root section after multiplying
by the principal square root; there is no power-series remainder assumption. -/
theorem sqrt_mul_invSection_hasDerivAt (M : ℕ) {z : ℂ} (hz : 0 < (1 - z).re) :
    HasDerivAt (fun w : ℂ => Complex.sqrt (1 - w) * invSection M w)
      (-((((M : ℝ) + 1 / 2) * halfCoeff M : ℝ) : ℂ) * z ^ M *
        (Complex.sqrt (1 - z))⁻¹) z := by
  have hs := sqrt_one_sub_hasDerivAt hz
  induction M with
  | zero =>
    simpa [invSection, halfCoeff, div_eq_mul_inv, mul_comm] using hs
  | succ M ih =>
    have hterm := (hs.mul ((hasDerivAt_pow (M + 1) z).const_mul
      (halfCoeff (M + 1) : ℂ)))
    have h := ih.add hterm
    have hfun : (fun w : ℂ => Complex.sqrt (1 - w) * invSection M w +
        Complex.sqrt (1 - w) * ((halfCoeff (M + 1) : ℂ) * w ^ (M + 1))) =
      (fun w : ℂ => Complex.sqrt (1 - w) * invSection (M + 1) w) := by
      funext w
      rw [invSection_succ, mul_add]
    change HasDerivAt (fun w : ℂ => Complex.sqrt (1 - w) * invSection M w +
      Complex.sqrt (1 - w) * ((halfCoeff (M + 1) : ℂ) * w ^ (M + 1))) _ z at h
    rw [hfun] at h
    apply h.congr_deriv
    have hrec : (((M : ℝ) + 1) * halfCoeff (M + 1) : ℝ) =
        ((M : ℝ) + 1 / 2) * halfCoeff M := halfCoeff_recurrence M
    have hrecC : ((M : ℂ) + 1) * (halfCoeff (M + 1) : ℂ) =
        ((M : ℂ) + 1 / 2) * (halfCoeff M : ℂ) := by
      have hc := congrArg (fun x : ℝ => (x : ℂ)) hrec
      push_cast at hc
      exact hc
    have hn : Complex.sqrt (1 - z) ≠ 0 := sqrt_ne_zero (by intro he; simp [he] at hz)
    have hsq := sqrt_sq (1 - z)
    simp only [Nat.add_sub_cancel, Nat.cast_add, Nat.cast_one, Complex.ofReal_mul,
      Complex.ofReal_add, Complex.ofReal_natCast, Complex.ofReal_div,
      Complex.ofReal_one, Complex.ofReal_ofNat]
    rw [← hrecC]
    apply (mul_left_inj' hn).mp
    field_simp
    rw [hsq]
    ring

end

end Conjectures.KovalevZeroFree
