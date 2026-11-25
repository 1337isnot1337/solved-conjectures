import Conjectures.KovalevZeroFreeBeta
import Conjectures.KovalevZeroFreeMobius

/-!
# Kovalev's square-root Taylor-section zero-free conjecture

The one-dimensional beta integral transformation needed for the exact
beta--gamma coupling in Section 2 of the recorded argument. Its proof uses
the explicit Möbius substitution and the already proved beta normalization.
-/

namespace Conjectures.KovalevZeroFree

open MeasureTheory ProbabilityTheory Set
open scoped ENNReal

noncomputable section

def betaWeight (a b t : ℝ) : ℝ := t ^ (a - 1) * (1 - t) ^ (b - 1)

theorem betaPDFReal_eq_weight {a b t : ℝ} (ht : t ∈ Ioo (0 : ℝ) 1) :
    betaPDFReal a b t = betaWeight a b t / beta a b := by
  rw [betaPDFReal, ite_eq_left (show 0 < t ∧ t < 1 from ht)]
  unfold betaWeight
  ring

theorem lintegral_betaPDF_Ioo {a b : ℝ} (ha : 0 < a) (hb : 0 < b) :
    ∫⁻ t in Ioo (0 : ℝ) 1, betaPDF a b t = 1 := by
  calc
    _ = ∫⁻ t in Ioo (0 : ℝ) 1,
        ENNReal.ofReal (1 / beta a b * t ^ (a - 1) * (1 - t) ^ (b - 1)) := by
      exact setLIntegral_congr_fun measurableSet_Ioo
        (fun t ht => betaPDF_of_pos_lt_one ht.1 ht.2)
    _ = ∫⁻ t, betaPDF a b t := lintegral_betaPDF.symm
    _ = 1 := lintegral_betaPDF_eq_one ha hb

theorem one_sub_mobius {v t : ℝ} (hv : 0 < v) (ht : t ∈ Ioo (0 : ℝ) 1) :
    1 - mobius v t = v * (1 - t) / (v + (1 - v) * t) := by
  have hd := (mobius_den_pos hv ⟨ht.1.le, ht.2.le⟩).ne'
  unfold mobius
  apply (eq_div_iff hd).mpr
  rw [sub_mul, one_mul, div_mul_cancel₀ _ hd]
  ring

theorem rpow_mobius_algebra (a b : ℝ) {v t q : ℝ}
    (hv : 0 < v) (ht : 0 < t) (ht1 : t < 1) (hq : 0 < q) :
    v / q ^ 2 * ((t / q) ^ (a - 1) * ((v * (1 - t) / q) ^ (b - 1))) =
      v ^ b * (t ^ (a - 1) * (1 - t) ^ (b - 1)) / q ^ (a + b) := by
  rw [Real.div_rpow ht.le hq.le, Real.div_rpow (mul_pos hv (sub_pos.mpr ht1)).le hq.le,
    Real.mul_rpow hv.le (sub_pos.mpr ht1).le,
    Real.rpow_sub_one hq.ne' a, Real.rpow_sub_one hq.ne' b,
    Real.rpow_sub_one hv.ne' b, Real.rpow_add hq a b]
  have hqa := (Real.rpow_pos_of_pos hq a).ne'
  have hqb := (Real.rpow_pos_of_pos hq b).ne'
  field_simp

theorem mobiusJacobian_betaWeight (a b : ℝ) {v t : ℝ}
    (hv : 0 < v) (ht : t ∈ Ioo (0 : ℝ) 1) :
    mobiusJacobian v t * betaWeight a b (mobius v t) =
      v ^ b * betaWeight a b t / (v + (1 - v) * t) ^ (a + b) := by
  rw [betaWeight, one_sub_mobius hv ht]
  exact rpow_mobius_algebra a b hv ht.1 ht.2
    (mobius_den_pos hv ⟨ht.1.le, ht.2.le⟩)

theorem euler_integrand_identity {a b v t : ℝ}
    (ha : 0 < a) (hb : 0 < b) (hv : 0 < v) (ht : t ∈ Ioo (0 : ℝ) 1) :
    betaWeight a b t / (v + (1 - v) * t) ^ (a + b) =
      (beta a b / v ^ b) *
        (mobiusJacobian v t * betaPDFReal a b (mobius v t)) := by
  rw [betaPDFReal_eq_weight (mobius_mem hv ht), ← mul_div_assoc,
    mobiusJacobian_betaWeight a b hv ht]
  have hB := (beta_pos ha hb).ne'
  have hvb := (Real.rpow_pos_of_pos hv b).ne'
  field_simp

/-- Euler's beta transformation, proved here for the exact positive parameters
and the actual Lebesgue integral, rather than assumed as a coupling law. -/
theorem lintegral_beta_euler {a b v : ℝ} (ha : 0 < a) (hb : 0 < b) (hv : 0 < v) :
    ∫⁻ t in Ioo (0 : ℝ) 1,
      ENNReal.ofReal (betaWeight a b t / (v + (1 - v) * t) ^ (a + b)) =
      ENNReal.ofReal (beta a b / v ^ b) := by
  have hc : 0 ≤ beta a b / v ^ b :=
    (div_pos (beta_pos ha hb) (Real.rpow_pos_of_pos hv b)).le
  calc
    _ = ∫⁻ t in Ioo (0 : ℝ) 1, ENNReal.ofReal (beta a b / v ^ b) *
        (ENNReal.ofReal (mobiusJacobian v t) * betaPDF a b (mobius v t)) := by
      apply setLIntegral_congr_fun measurableSet_Ioo
      intro t ht
      dsimp only
      rw [betaPDF, ← ENNReal.ofReal_mul (mobiusJacobian_pos hv ht).le,
        ← ENNReal.ofReal_mul hc, euler_integrand_identity ha hb hv ht]
    _ = ENNReal.ofReal (beta a b / v ^ b) *
        (∫⁻ t in Ioo (0 : ℝ) 1,
          ENNReal.ofReal (mobiusJacobian v t) * betaPDF a b (mobius v t)) :=
      lintegral_const_mul' _ _ ENNReal.ofReal_ne_top
    _ = _ := by rw [lintegral_mobius_substitution hv, lintegral_betaPDF_Ioo ha hb, mul_one]

theorem beta_coupling_normalizers {a b c : ℝ}
    (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) :
    beta (a + c) b / (beta a b * beta (a + b) c) = 1 / beta a c := by
  have hga := (Real.Gamma_pos_of_pos ha).ne'
  have hgb := (Real.Gamma_pos_of_pos hb).ne'
  have hgc := (Real.Gamma_pos_of_pos hc).ne'
  have hgab := (Real.Gamma_pos_of_pos (add_pos ha hb)).ne'
  have hgac := (Real.Gamma_pos_of_pos (add_pos ha hc)).ne'
  have hgabc := (Real.Gamma_pos_of_pos (add_pos (add_pos ha hb) hc)).ne'
  unfold beta
  rw [show a + c + b = a + b + c by ring]
  field_simp

end

end Conjectures.KovalevZeroFree
