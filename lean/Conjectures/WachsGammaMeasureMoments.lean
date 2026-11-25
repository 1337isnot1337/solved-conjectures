module
public import Conjectures.WachsGammaDensityMoments

@[expose] public section
namespace WachsCompleteGraph

open MeasureTheory ProbabilityTheory
open scoped ENNReal

theorem gamma_pdf_measurable (s a : ℝ) : Measurable (gammaPDF s a) :=
  (measurable_gammaPDFReal s a).ennreal_ofReal

theorem gamma_pdf_lt_top (s a : ℝ) :
    ∀ᵐ x ∂(volume : Measure ℝ), gammaPDF s a x < ∞ :=
  ae_of_all _ (fun _ => ENNReal.ofReal_lt_top)

theorem gamma_pdf_toReal {s a : ℝ} (hs : 0<s) (ha : 0<a) (x : ℝ) :
    (gammaPDF s a x).toReal = gammaPDFReal s a x := by
  exact ENNReal.toReal_ofReal (gammaPDFReal_nonneg hs ha x)

theorem gamma_density_integrable {s a : ℝ} (hs : 0<s) (ha : 0<a) :
    Integrable (gammaPDFReal s a) := by
  have _ := isProbabilityMeasure_gammaMeasure hs ha
  have h : Integrable (fun _ : ℝ => (1:ℝ)) (gammaMeasure s a) := integrable_const _
  rw [gammaMeasure,integrable_withDensity_iff_integrable_smul'
    (gamma_pdf_measurable s a) (gamma_pdf_lt_top s a)] at h
  simpa only [smul_eq_mul,mul_one,gamma_pdf_toReal hs ha] using h

theorem gamma_density_integral {s a : ℝ} (hs : 0<s) (ha : 0<a) :
    (∫ x : ℝ, gammaPDFReal s a x) = 1 := by
  have _ := isProbabilityMeasure_gammaMeasure hs ha
  have h : (∫ x, (1:ℝ) ∂gammaMeasure s a) = 1 := by simp
  rw [gammaMeasure,integral_withDensity_eq_integral_toReal_smul
    (gamma_pdf_measurable s a) (gamma_pdf_lt_top s a)] at h
  simpa only [smul_eq_mul,mul_one,gamma_pdf_toReal hs ha] using h

theorem integrable_gamma_nat_power (n j : ℕ) {a : ℝ} (ha : 0<a) :
    Integrable (fun x : ℝ => x^j) (gammaMeasure ((n+1:ℕ):ℝ) a) := by
  have hn : (0:ℝ)<((n+1:ℕ):ℝ) := by positivity
  have hnj : (0:ℝ)<((n+j+1:ℕ):ℝ) := by positivity
  rw [gammaMeasure,integrable_withDensity_iff_integrable_smul'
    (gamma_pdf_measurable _ _) (gamma_pdf_lt_top _ _)]
  simp_rw [smul_eq_mul,gamma_pdf_toReal hn ha,gamma_density_power n j a ha]
  exact (gamma_density_integrable hnj ha).const_mul _

theorem gamma_nat_power_integral (n j : ℕ) {a : ℝ} (ha : 0<a) :
    (∫ x : ℝ, x^j ∂gammaMeasure ((n+1:ℕ):ℝ) a) =
      ((n+j).factorial:ℝ)/(n.factorial:ℝ)/a^j := by
  have hn : (0:ℝ)<((n+1:ℕ):ℝ) := by positivity
  have hnj : (0:ℝ)<((n+j+1:ℕ):ℝ) := by positivity
  rw [gammaMeasure,integral_withDensity_eq_integral_toReal_smul
    (gamma_pdf_measurable _ _) (gamma_pdf_lt_top _ _)]
  simp_rw [smul_eq_mul,gamma_pdf_toReal hn ha,gamma_density_power n j a ha]
  rw [integral_const_mul,gamma_density_integral hnj ha,mul_one]

/-- For literal Mathlib Gamma measures, the normalized moments
are exactly the formal Gamma-factor coefficients. -/
theorem gamma_nat_integral_matches_formal (n j : ℕ) {a : ℝ} (ha : 0<a) :
    (∫ x : ℝ, x^j ∂gammaMeasure ((n+1:ℕ):ℝ) a) =
      (j.factorial:ℝ)*PowerSeries.coeff j (gammaMomentFactor (n+1) a) := by
  rw [gamma_nat_power_integral n j ha,gammaMomentFactor_coeff _ _ (by omega),
    Nat.add_sub_cancel,Nat.add_comm n j,inv_pow]
  have h : ((j+n).choose j:ℝ) * (j.factorial:ℝ) * (n.factorial:ℝ) = ((j+n).factorial:ℝ) := by
    have hh := Nat.choose_mul_factorial_mul_factorial (n:=j+n) (k:=j) (Nat.le_add_right j n)
    rw [Nat.add_sub_cancel_left] at hh
    exact_mod_cast hh
  have hn : (n.factorial:ℝ) ≠ 0 := by positivity
  have har : a^j ≠ 0 := pow_ne_zero _ ha.ne'
  field_simp
  linear_combination -h

end WachsCompleteGraph
