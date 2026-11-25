import Conjectures.KovalevZeroFreeKernel
import Conjectures.KovalevZeroFreeBeta
import Mathlib.MeasureTheory.Function.SpecialFunctions.Basic

/-!
# Kovalev's square-root Taylor-section zero-free conjecture

The actual beta-average correction in equation (3) of the recorded proof.
The norm estimates below concern this concrete integral over mathlib's beta
probability measure, including strictness on the punctured closed unit disk.
-/

namespace Conjectures.KovalevZeroFree

open MeasureTheory ProbabilityTheory Set

noncomputable section

def odds (t : ℝ) : ℝ := t / (1 - t)

def resolvent (z : ℂ) (s : ℝ) : ℂ :=
  (Complex.sqrt (1 + (1 - z) * (s : ℂ)))⁻¹

/-- The exact beta average `E (1+(1-z)T/(1-T))^(-1/2)`. -/
def remainder (M : ℕ) (z : ℂ) : ℂ :=
  ∫ t, resolvent z (odds t) ∂betaMeasure ((M : ℝ) + 1) (1 / 2)

theorem odds_pos {t : ℝ} (ht : t ∈ Ioo (0 : ℝ) 1) : 0 < odds t := by
  exact div_pos ht.1 (sub_pos.mpr ht.2)

@[fun_prop] theorem measurable_odds : Measurable odds := by
  unfold odds
  fun_prop

@[fun_prop] theorem measurable_complex_sqrt : Measurable Complex.sqrt := by
  have h : Complex.sqrt = fun z : ℂ =>
      (Real.sqrt ((‖z‖ + z.re) / 2) : ℂ) +
      (if 0 ≤ z.im then (1 : ℂ) else -1) *
        (Real.sqrt ((‖z‖ - z.re) / 2) : ℂ) * Complex.I := by
    funext z
    exact Complex.sqrt_eq_real_add_ite
  rw [h]
  have hi : Measurable (fun z : ℂ => if 0 ≤ z.im then (1 : ℂ) else -1) :=
    Measurable.ite (measurableSet_le measurable_const (by fun_prop))
      measurable_const measurable_const
  apply Measurable.add (by fun_prop)
  exact (hi.mul (by fun_prop)).mul measurable_const

@[fun_prop] theorem measurable_resolvent (z : ℂ) : Measurable (resolvent z) := by
  unfold resolvent
  fun_prop

theorem re_lt_one_of_closedDisk_ne_one {z : ℂ} (hz : ‖z‖ ≤ 1) (hz1 : z ≠ 1) :
    z.re < 1 := by
  have hre := (Complex.re_le_norm z).trans hz
  by_contra! h
  have hr : z.re = 1 := le_antisymm hre h
  have hn : z.re ^ 2 + z.im ^ 2 ≤ 1 := by
    have hs : ‖z‖ ^ 2 ≤ 1 := by nlinarith [norm_nonneg z]
    simpa only [Complex.sq_norm, Complex.normSq_apply, ← pow_two] using hs
  have hi : z.im = 0 := by
    have hsq : z.im ^ 2 = 0 := by nlinarith [sq_nonneg z.im]
    exact sq_eq_zero_iff.mp hsq
  apply hz1
  apply Complex.ext <;> simp [hr, hi]

theorem resolvent_norm_le_one {z : ℂ} {s : ℝ} (hz : ‖z‖ ≤ 1) (hs : 0 ≤ s) :
    ‖resolvent z s‖ ≤ 1 := by
  apply norm_inv_sqrt_le_one
  have hre := (Complex.re_le_norm z).trans hz
  simp only [Complex.add_re, Complex.one_re, Complex.mul_re, Complex.sub_re,
    Complex.ofReal_re, Complex.sub_im, Complex.one_im, Complex.ofReal_im,
    mul_zero, sub_zero]
  nlinarith

theorem resolvent_norm_lt_one {z : ℂ} {s : ℝ}
    (hz : ‖z‖ ≤ 1) (hz1 : z ≠ 1) (hs : 0 < s) :
    ‖resolvent z s‖ < 1 := by
  apply norm_inv_sqrt_lt_one
  have hre := re_lt_one_of_closedDisk_ne_one hz hz1
  simp only [Complex.add_re, Complex.one_re, Complex.mul_re, Complex.sub_re,
    Complex.ofReal_re, Complex.sub_im, Complex.one_im, Complex.ofReal_im,
    mul_zero, sub_zero]
  nlinarith

theorem resolvent_beta_integrable (M : ℕ) {z : ℂ} (hz : ‖z‖ ≤ 1) :
    Integrable (fun t => resolvent z (odds t))
      (betaMeasure ((M : ℝ) + 1) (1 / 2)) := by
  let := isProbabilityMeasureBeta (show 0 < (M : ℝ) + 1 by positivity)
    (show 0 < (1 / 2 : ℝ) by norm_num)
  apply (integrable_const (1 : ℝ)).mono'
    ((measurable_resolvent z).comp measurable_odds).aestronglyMeasurable
  filter_upwards [beta_ae_mem ((M : ℝ) + 1) (1 / 2)] with t ht
  exact resolvent_norm_le_one hz (odds_pos ht).le

theorem remainder_norm_le_one (M : ℕ) {z : ℂ} (hz : ‖z‖ ≤ 1) :
    ‖remainder M z‖ ≤ 1 := by
  let := isProbabilityMeasureBeta (show 0 < (M : ℝ) + 1 by positivity)
    (show 0 < (1 / 2 : ℝ) by norm_num)
  have hb : ∀ᵐ t ∂betaMeasure ((M : ℝ) + 1) (1 / 2),
      ‖resolvent z (odds t)‖ ≤ (1 : ℝ) := by
    filter_upwards [beta_ae_mem ((M : ℝ) + 1) (1 / 2)] with t ht
    exact resolvent_norm_le_one hz (odds_pos ht).le
  have hμ : (betaMeasure ((M : ℝ) + 1) (1 / 2)).real univ = 1 := by
    rw [measureReal_def, measure_univ, ENNReal.toReal_one]
  simpa only [remainder, hμ, one_mul] using norm_integral_le_of_norm_le_const hb

theorem norm_integral_lt_one_of_ae {α : Type*} [MeasurableSpace α]
    (μ : Measure α) [IsProbabilityMeasure μ] (f : α → ℂ)
    (hf : Integrable f μ) (hstrict : ∀ᵐ x ∂μ, ‖f x‖ < 1) :
    ‖∫ x, f x ∂μ‖ < 1 := by
  have hnonneg : 0 ≤ᵐ[μ] fun x => 1 - ‖f x‖ := by
    filter_upwards [hstrict] with x hx
    change 0 ≤ 1 - ‖f x‖
    linarith
  have hfull : Function.support (fun x => 1 - ‖f x‖) =ᵐ[μ] Set.univ := by
    filter_upwards [hstrict] with x hx
    apply propext
    simp only [Function.mem_support, Set.mem_univ, iff_true]
    exact (sub_pos.mpr hx).ne'
  have hpos : 0 < ∫ x, 1 - ‖f x‖ ∂μ := by
    apply (integral_pos_iff_support_of_nonneg_ae hnonneg
      ((integrable_const (1 : ℝ)).sub hf.norm)).mpr
    rw [measure_congr hfull]
    simp
  rw [integral_sub (integrable_const _) hf.norm] at hpos
  have hone : ∫ x, (1 : ℝ) ∂μ = 1 := by simp
  rw [hone] at hpos
  exact (norm_integral_le_integral_norm f).trans_lt (by linarith)

theorem remainder_norm_lt_one (M : ℕ) {z : ℂ} (hz : ‖z‖ ≤ 1) (hz1 : z ≠ 1) :
    ‖remainder M z‖ < 1 := by
  let := isProbabilityMeasureBeta (show 0 < (M : ℝ) + 1 by positivity)
    (show 0 < (1 / 2 : ℝ) by norm_num)
  apply norm_integral_lt_one_of_ae _ _ (resolvent_beta_integrable M hz)
  filter_upwards [beta_ae_mem ((M : ℝ) + 1) (1 / 2)] with t ht
  exact resolvent_norm_lt_one hz hz1 (odds_pos ht)

@[simp] theorem remainder_one (M : ℕ) : remainder M 1 = 1 := by
  let := isProbabilityMeasureBeta (show 0 < (M : ℝ) + 1 by positivity)
    (show 0 < (1 / 2 : ℝ) by norm_num)
  have hμ : (betaMeasure ((M : ℝ) + 1) (1 / 2)).real univ = 1 := by
    rw [measureReal_def, measure_univ, ENNReal.toReal_one]
  simp only [remainder, resolvent, sub_self, zero_mul, add_zero, Complex.sqrt_one,
    inv_one, integral_const, hμ, one_smul]

end

end Conjectures.KovalevZeroFree
