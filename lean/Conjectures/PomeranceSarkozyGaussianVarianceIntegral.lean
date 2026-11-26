module
public import Conjectures.PomeranceSarkozyGaussianTailKernel
import Mathlib.Tactic.Ring

@[expose] public section
namespace PomeranceSarkozy

open MeasureTheory ProbabilityTheory Set
open scoped ENNReal NNReal ProbabilityTheory

private theorem gaussian_two_positivePart_integrable (a : ℝ) :
    Integrable (shiftedPositivePart a) (gaussianReal 0 2) := by
  let ρ : ProbabilityMeasure ℝ := ⟨gaussianReal 0 2,inferInstance⟩
  have hi : Integrable (fun x : ℝ=>x^2) (ρ:Measure ℝ) :=
    (memLp_two_iff_integrable_sq (by fun_prop)).mp (memLp_id_gaussianReal (μ:=0) (v:=2) 2)
  exact shiftedPositivePart_integrable a ρ hi

/-- The exact continuous kernel identity including finiteness, rather
than only an equality after taking toReal. -/
theorem gaussian_shifted_tail_kernel_ofReal (a : ℝ) :
    (∫⁻ s : ℝ,(gaussianReal 0 1) (Set.Ioi (s+a))*(gaussianReal 0 1) (Set.Iic s)) =
      ENNReal.ofReal (∫ x : ℝ,shiftedPositivePart a x ∂gaussianReal 0 2) := by
  rw [continuous_shifted_tail_cross,ofReal_integral_eq_lintegral_ofReal
    (gaussian_two_positivePart_integrable a) (Filter.Eventually.of_forall (shiftedPositivePart_nonneg a))]
  rw [← gaussianUnitDifference_law,lintegral_map (by unfold shiftedPositivePart; fun_prop) (by fun_prop)]
  apply lintegral_congr
  intro z
  unfold shiftedPositivePart
  by_cases h : 0≤z.1-z.2-a
  · rw [max_eq_left h]
  · rw [max_eq_right (le_of_not_ge h),ENNReal.ofReal_zero]
    exact ENNReal.ofReal_eq_zero.mpr (le_of_not_ge h)

private theorem centered_gaussian_two_positivePart_zero :
    ∫ x : ℝ,shiftedPositivePart 0 x ∂gaussianReal 0 2=1/Real.sqrt Real.pi := by
  let μ := gaussianReal 0 2
  have hv : MemLp (id : ℝ→ℝ) 2 μ := memLp_id_gaussianReal (μ:=0) (v:=2) 2
  have hi : Integrable (fun x : ℝ=>x) μ := hv.integrable one_le_two
  have ha : Integrable (fun x : ℝ=>|x|) μ := by simpa only [Real.norm_eq_abs] using hi.norm
  have he (x : ℝ) : shiftedPositivePart 0 x=(x+|x|)/2 := by
    unfold shiftedPositivePart
    rw [sub_zero]
    by_cases hx : 0≤x
    · rw [max_eq_left hx,abs_of_nonneg hx]
      ring
    · rw [max_eq_right (le_of_not_ge hx),abs_of_nonpos (le_of_not_ge hx),add_neg_cancel,zero_div]
  simp_rw [he]
  rw [integral_div,integral_add hi ha,integral_id_gaussianReal,zero_add,
    centered_gaussian_two_absolute_moment]
  ring

/-- The Gaussian tail-variance integral is the exact quadratic
coefficient in the written rare-deviation cumulant calculation. -/
theorem gaussian_variance_tail_integral :
    (∫⁻ s : ℝ,(gaussianReal 0 1) (Set.Ioi s)*(gaussianReal 0 1) (Set.Iic s)) =
      ENNReal.ofReal (1/Real.sqrt Real.pi) := by
  have h := gaussian_shifted_tail_kernel_ofReal 0
  rw [centered_gaussian_two_positivePart_zero] at h
  simpa only [add_zero] using h

end PomeranceSarkozy
