import Conjectures.KovalevZeroFreeEuler

/-!
# Kovalev's square-root Taylor-section zero-free conjecture

The actual density computation for the beta coupling from Section 2 of the
recorded proof. With independent `V ~ Beta(a,b)` and `T ~ Beta(a+b,c)`, the
map `oddsScale V T` has law `Beta(a,c)`. The proof below uses explicit
one-dimensional Jacobians and Euler's beta transformation.
-/

namespace Conjectures.KovalevZeroFree

open MeasureTheory ProbabilityTheory Set
open scoped ENNReal

noncomputable section

theorem beta_joint_density_identity {a b c v t : ℝ}
    (hv : v ∈ Ioo (0 : ℝ) 1) (ht : t ∈ Ioo (0 : ℝ) 1) :
    betaPDFReal a b v *
        (mobiusJacobian v t * betaPDFReal (a + b) c (mobius v t)) =
      (betaWeight (a + b) c t / (beta a b * beta (a + b) c)) *
        (betaWeight (a + c) b v / (t + (1 - t) * v) ^ (a + c + b)) := by
  rw [betaPDFReal_eq_weight hv, betaPDFReal_eq_weight (mobius_mem hv.1 ht)]
  calc
    _ = (betaWeight a b v *
        (mobiusJacobian v t * betaWeight (a + b) c (mobius v t))) /
          (beta a b * beta (a + b) c) := by ring
    _ = _ := by
      rw [mobiusJacobian_betaWeight (a + b) c hv.1 ht]
      have hp : v ^ (a + c - 1) = v ^ (a - 1) * v ^ c := by
        rw [show a + c - 1 = (a - 1) + c by ring, Real.rpow_add hv.1]
      simp only [betaWeight, hp]
      rw [show v + (1 - v) * t = t + (1 - t) * v by ring,
        show a + b + c = a + c + b by ring]
      ring

theorem beta_marginal_normalizer {a b c t : ℝ}
    (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) (ht : t ∈ Ioo (0 : ℝ) 1) :
    (betaWeight (a + b) c t / (beta a b * beta (a + b) c)) *
      (beta (a + c) b / t ^ b) = betaPDFReal a c t := by
  rw [betaPDFReal_eq_weight ht]
  have hp : t ^ (a + b - 1) = t ^ (a - 1) * t ^ b := by
    rw [show a + b - 1 = (a - 1) + b by ring, Real.rpow_add ht.1]
  have htb := (Real.rpow_pos_of_pos ht.1 b).ne'
  calc
    _ = (beta (a + c) b / (beta a b * beta (a + b) c)) *
        (t ^ (a + b - 1) / t ^ b * (1 - t) ^ (c - 1)) := by
      dsimp [betaWeight]
      ring
    _ = (1 / beta a c) * betaWeight a c t := by
      rw [beta_coupling_normalizers ha hb hc, hp, mul_div_cancel_right₀ _ htb]
      rfl
    _ = _ := by ring

theorem lintegral_beta_joint_density {a b c t : ℝ}
    (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) (ht : t ∈ Ioo (0 : ℝ) 1) :
    ∫⁻ v in Ioo (0 : ℝ) 1, betaPDF a b v *
        (ENNReal.ofReal (mobiusJacobian v t) * betaPDF (a + b) c (mobius v t)) =
      betaPDF a c t := by
  let C := betaWeight (a + b) c t / (beta a b * beta (a + b) c)
  have hC : 0 ≤ C := by
    dsimp [C, betaWeight]
    exact (div_pos
      (mul_pos (Real.rpow_pos_of_pos ht.1 _) (Real.rpow_pos_of_pos (sub_pos.mpr ht.2) _))
      (mul_pos (beta_pos ha hb) (beta_pos (add_pos ha hb) hc))).le
  calc
    _ = ∫⁻ v in Ioo (0 : ℝ) 1, ENNReal.ofReal C *
        ENNReal.ofReal (betaWeight (a + c) b v /
          (t + (1 - t) * v) ^ (a + c + b)) := by
      apply setLIntegral_congr_fun measurableSet_Ioo
      intro v hv
      dsimp only
      rw [betaPDF, betaPDF,
        ← ENNReal.ofReal_mul (mobiusJacobian_pos hv.1 ht).le,
        ← ENNReal.ofReal_mul (betaPDFReal_nonneg ha hb v),
        ← ENNReal.ofReal_mul hC, beta_joint_density_identity hv ht]
    _ = ENNReal.ofReal C *
        (∫⁻ v in Ioo (0 : ℝ) 1, ENNReal.ofReal (betaWeight (a + c) b v /
          (t + (1 - t) * v) ^ (a + c + b))) :=
      lintegral_const_mul' _ _ ENNReal.ofReal_ne_top
    _ = ENNReal.ofReal C * ENNReal.ofReal (beta (a + c) b / t ^ b) := by
      rw [lintegral_beta_euler (add_pos ha hc) hb ht.1]
    _ = betaPDF a c t := by
      rw [← ENNReal.ofReal_mul hC, betaPDF]
      exact congrArg ENNReal.ofReal (beta_marginal_normalizer ha hb hc ht)

end

end Conjectures.KovalevZeroFree
