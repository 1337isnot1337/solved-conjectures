module

public import Conjectures.KVZGammaDensityBasic
public import Mathlib.Analysis.SpecialFunctions.Gamma.Beta
public import Mathlib.Tactic.NormNum

/-!
# The real beta identity and the literal gamma-density convolution

The real scaled beta integral is obtained from Mathlib's complex identity
through the injective real embedding. The density convolution is then an
identity of the actual positive-domain integrals.
-/

@[expose] public section

namespace KVZGamma

open MeasureTheory Set Real

noncomputable section

theorem scaled_beta_integral {a b s : ℝ}
    (ha : 0 < a) (hb : 0 < b) (hs : 0 < s) :
    (∫ t in (0 : ℝ)..s, t ^ (a - 1) * (s - t) ^ (b - 1)) =
      s ^ (a + b - 1) * (Gamma a * Gamma b / Gamma (a + b)) := by
  apply Complex.ofReal_injective
  rw [← intervalIntegral.integral_ofReal]
  calc
    (∫ t in (0 : ℝ)..s, ((t ^ (a - 1) * (s - t) ^ (b - 1) : ℝ) : ℂ)) =
        ∫ t in (0 : ℝ)..s,
          (t : ℂ) ^ ((a : ℂ) - 1) * ((s : ℂ) - t) ^ ((b : ℂ) - 1) := by
      apply intervalIntegral.integral_congr
      intro t ht
      have ht' : 0 ≤ t ∧ t ≤ s := by
        simpa only [uIcc_of_le hs.le, mem_Icc] using ht
      dsimp only
      rw [Complex.ofReal_mul, Complex.ofReal_cpow ht'.1 (a - 1),
        Complex.ofReal_cpow (sub_nonneg.mpr ht'.2) (b - 1)]
      push_cast; rfl
    _ = (s : ℂ) ^ ((a : ℂ) + (b : ℂ) - 1) *
        Complex.betaIntegral (a : ℂ) (b : ℂ) :=
      Complex.betaIntegral_scaled _ _ hs
    _ = (s : ℂ) ^ ((a : ℂ) + (b : ℂ) - 1) *
        (Complex.Gamma (a : ℂ) * Complex.Gamma (b : ℂ) /
          Complex.Gamma ((a : ℂ) + (b : ℂ))) := by
      rw [Complex.betaIntegral_eq_Gamma_mul_div _ _ (by simpa using ha) (by simpa using hb)]
    _ = ((s ^ (a + b - 1) * (Gamma a * Gamma b / Gamma (a + b)) : ℝ) : ℂ) := by
      have hpow : (s : ℂ) ^ ((a : ℂ) + (b : ℂ) - 1) =
          ((s ^ (a + b - 1) : ℝ) : ℂ) := by
        simpa only [Complex.ofReal_sub, Complex.ofReal_add, Complex.ofReal_one] using
          (Complex.ofReal_cpow hs.le (a + b - 1)).symm
      rw [hpow, ← Complex.ofReal_add a b, Complex.Gamma_ofReal,
        Complex.Gamma_ofReal, Complex.Gamma_ofReal]
      push_cast; rfl

/-- The forward convolution of two literal gamma densities is the density
with the sum of their positive shape parameters. -/
theorem gamma_density_convolution {a b s : ℝ}
    (ha : 0 < a) (hb : 0 < b) (hs : 0 < s) :
    (∫ t in (0 : ℝ)..s, gammaDensity a t * gammaDensity b (s - t)) =
      gammaDensity (a + b) s := by
  have hi (t : ℝ) : gammaDensity a t * gammaDensity b (s - t) =
      (exp (-s) / (Gamma a * Gamma b)) * (t ^ (a - 1) * (s - t) ^ (b - 1)) := by
    have he : exp (-t) * exp (-(s - t)) = exp (-s) := by
      rw [← exp_add]
      congr 1
      ring
    change (t ^ (a - 1) * exp (-t) / Gamma a) *
        ((s - t) ^ (b - 1) * exp (-(s - t)) / Gamma b) = _
    calc
      _ = (t ^ (a - 1) * (s - t) ^ (b - 1)) *
          (exp (-t) * exp (-(s - t))) / (Gamma a * Gamma b) := by ring
      _ = _ := by rw [he]; ring
  simp_rw [hi]
  rw [intervalIntegral.integral_const_mul, scaled_beta_integral ha hb hs]
  change (exp (-s) / (Gamma a * Gamma b)) *
      (s ^ (a + b - 1) * (Gamma a * Gamma b / Gamma (a + b))) =
    s ^ (a + b - 1) * exp (-s) / Gamma (a + b)
  field_simp [(Gamma_pos_of_pos ha).ne', (Gamma_pos_of_pos hb).ne',
    (Gamma_pos_of_pos (add_pos ha hb)).ne']

end

end KVZGamma
