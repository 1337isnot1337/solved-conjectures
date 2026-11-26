module
public import Conjectures.PomeranceSarkozyBernoulliProduct
public import Mathlib.MeasureTheory.Measure.CharacteristicFunction.Basic
public import Mathlib.MeasureTheory.Measure.ProbabilityMeasure
import Mathlib.Analysis.Complex.ExponentialBounds
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

@[expose] public section
namespace PomeranceSarkozy

open MeasureTheory
open scoped ENNReal BigOperators

private theorem bounded_phase_norm (x : ℝ) : ‖Complex.exp ((x:ℂ)*Complex.I)‖=1 := by
  rw [Complex.norm_exp,Complex.mul_re,Complex.ofReal_re,Complex.ofReal_im,Complex.I_re,
    Complex.I_im,mul_zero,zero_mul,sub_zero,Real.exp_zero]

private theorem phase_taylor_bound (x : ℝ) (hx : |x|≤1) :
    ‖Complex.exp ((x:ℂ)*Complex.I)-(1+(x:ℂ)*Complex.I-(x:ℂ)^2/2)‖≤3*|x| ^3 := by
  let z : ℂ := (x:ℂ)*Complex.I
  have hz : ‖z‖=|x| := by unfold z; rw [norm_mul,Complex.norm_real,Complex.norm_I,mul_one,Real.norm_eq_abs]
  have he := Complex.norm_exp_sub_sum_le_norm_mul_exp z 3
  have hsum : (∑ m ∈ Finset.range 3,z^m/(m.factorial:ℂ))=
      1+(x:ℂ)*Complex.I-(x:ℂ)^2/2 := by
    simp only [Finset.sum_range_succ,Finset.sum_range_zero,pow_zero,pow_one]
    norm_num [z,Complex.I_sq,mul_pow]
    ring
  rw [hsum,hz] at he
  refine he.trans ?_
  rw [mul_comm (3:ℝ)]
  exact mul_le_mul_of_nonneg_left
    ((Real.exp_le_exp.mpr hx).trans Real.exp_one_lt_three.le) (by positivity)

/-- Variance-weighted second-order Fourier error for any centered
bounded law, needed when several endpoints share a Poisson coordinate. -/
theorem bounded_centered_charFun_error (μ : Measure ℝ) [IsProbabilityMeasure μ]
    (θ M : ℝ) (_hM : 0≤M) (hθ : |θ| * M≤1)
    (hBound : ∀ᵐ x ∂μ,|x|≤M) (hMean : ∫ x : ℝ,x ∂μ=0) :
    ‖charFun μ θ-(1-(↑(θ^2*(∫ x : ℝ,x^2 ∂μ)/2:ℝ):ℂ))‖≤
      3*M*|θ| ^3*(∫ x : ℝ,x^2 ∂μ) := by
  let f (x : ℝ) : ℂ := Complex.exp ((↑(θ*x):ℂ)*Complex.I)
  let a : ℂ := (θ:ℂ)*Complex.I
  let b : ℂ := (θ:ℂ)^2/2
  let g (x : ℝ) : ℂ := 1+a*(x:ℂ)-b*((x^2:ℝ):ℂ)
  have hId : Integrable (fun x : ℝ=>(x:ℂ)) μ :=
    Integrable.of_bound (by fun_prop) M (by
      simpa only [Complex.norm_real,Real.norm_eq_abs] using hBound)
  have hSq : Integrable (fun x : ℝ=>(↑(x^2:ℝ):ℂ)) μ :=
    Integrable.of_bound (by fun_prop) (M^2) (by
      filter_upwards [hBound] with x hx
      rw [Complex.norm_real,Real.norm_of_nonneg (sq_nonneg _),← sq_abs]
      exact pow_le_pow_left₀ (abs_nonneg _) hx 2)
  have hSqReal : Integrable (fun x : ℝ=>x^2) μ :=
    Integrable.of_bound (by fun_prop) (M^2) (by
      filter_upwards [hBound] with x hx
      rw [Real.norm_of_nonneg (sq_nonneg _),← sq_abs]
      exact pow_le_pow_left₀ (abs_nonneg _) hx 2)
  have hf : Integrable f μ := Integrable.of_bound (by unfold f; fun_prop) 1
    (Filter.Eventually.of_forall (fun x=>(bounded_phase_norm (θ*x)).le))
  have hg : Integrable g μ :=
    ((integrable_const (1:ℂ)).add (hId.const_mul a)).sub (hSq.const_mul b)
  have hpoint : ∀ᵐ x ∂μ,‖f x-g x‖≤(3*M*|θ| ^3)*x^2 := by
    filter_upwards [hBound] with x hx
    have hc : |θ*x|≤1 := by rw [abs_mul]; exact (mul_le_mul_of_nonneg_left hx (abs_nonneg _)).trans hθ
    have he : g x=1+(↑(θ*x):ℂ)*Complex.I-(↑(θ*x):ℂ)^2/2 := by
      unfold g a b
      push_cast
      ring
    rw [he]
    have h := phase_taylor_bound (θ*x) hc
    refine h.trans ?_
    have hv : |x| ^3≤M*x^2 := by
      rw [pow_succ,sq_abs,mul_comm (x^2)]
      exact mul_le_mul_of_nonneg_right hx (sq_nonneg _)
    have hb := mul_le_mul_of_nonneg_left hv (show (0:ℝ)≤3*|θ| ^3 by positivity)
    rw [abs_mul,mul_pow]
    convert hb using 1 <;> ring
  have hF : charFun μ θ=∫ x,f x ∂μ := by
    rw [charFun_apply]
    simp only [Real.inner_apply,f]
    congr 1
    funext x
    rw [mul_comm x θ]
  have hG : (∫ x,g x ∂μ)=1-(↑(θ^2*(∫ x : ℝ,x^2 ∂μ)/2:ℝ):ℂ) := by
    unfold g
    have hi : Integrable (fun x : ℝ=>(1:ℂ)+a*(x:ℂ)) μ :=
      (integrable_const _).add (hId.const_mul a)
    rw [integral_sub hi (hSq.const_mul b),integral_add (integrable_const _) (hId.const_mul a),
      integral_const,probReal_univ,one_smul,integral_const_mul,integral_const_mul,
      integral_complex_ofReal,integral_complex_ofReal,hMean]
    unfold b
    push_cast
    ring
  rw [hF,← hG,← integral_sub hf hg]
  refine (norm_integral_le_integral_norm _).trans ?_
  have h := integral_mono_ae (hf.sub hg).norm (hSqReal.const_mul (3*M*|θ| ^3)) hpoint
  rw [integral_const_mul] at h
  exact h

end PomeranceSarkozy
