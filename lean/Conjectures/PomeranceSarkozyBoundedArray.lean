module
public import Conjectures.PomeranceSarkozyBoundedGaussianError
public import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

@[expose] public section
namespace PomeranceSarkozy

open Filter Finset MeasureTheory
open scoped Topology BigOperators

theorem bounded_centered_product_normal_error {ι : Type*}
    (S : Finset ι) (μ : ι→ProbabilityMeasure ℝ) (M θ : ℝ)
    (hM : 0≤M) (hθ : |θ| * M≤1) (hθ' : |θ|≤1)
    (hBound : ∀ i∈S,∀ᵐ x ∂(μ i:Measure ℝ),|x|≤M)
    (hMean : ∀ i∈S,(∫ x : ℝ,x ∂(μ i:Measure ℝ))=0) :
    let V := ∑ i∈S,∫ x : ℝ,x^2 ∂(μ i:Measure ℝ)
    ‖(∏ i∈S,charFun (μ i:Measure ℝ) θ)-Complex.exp (↑(-(θ^2*V/2):ℝ):ℂ)‖≤
      (3*M+M^2)*|θ| ^3*V := by
  let v (i : ι) := ∫ x : ℝ,x^2 ∂(μ i:Measure ℝ)
  let b (i : ι) : ℂ := Complex.exp (↑(-(θ^2*v i/2):ℝ):ℂ)
  have hb (i : ι) (_hi : i∈S) : ‖b i‖≤1 := by
    unfold b
    rw [Complex.norm_exp,Complex.ofReal_re,Real.exp_le_one_iff]
    have hv : 0≤v i := integral_nonneg (fun _=>sq_nonneg _)
    exact neg_nonpos.mpr (by positivity)
  have hB : (∏ i∈S,b i)=Complex.exp (↑(-(θ^2*(∑ i∈S,v i)/2):ℝ):ℂ) := by
    have hsum : (∑ i∈S,-(θ^2*v i/2))= -(θ^2*(∑ i∈S,v i)/2) := by
      rw [Finset.sum_neg_distrib,← Finset.sum_div,← Finset.mul_sum]
    unfold b
    rw [← Complex.exp_sum,← hsum]
    congr 1
    exact (map_sum Complex.ofRealHom _ _).symm
  change ‖_ -Complex.exp (↑(-(θ^2*(∑ i∈S,v i)/2):ℝ):ℂ)‖≤_
  rw [← hB]
  refine (norm_prod_sub_prod_le_sum S _ b (fun _ _=>norm_charFun_le_one _) hb).trans ?_
  change (∑ i∈S,‖charFun (μ i:Measure ℝ) θ-b i‖)≤(3*M+M^2)*|θ| ^3*(∑ i∈S,v i)
  rw [Finset.mul_sum]
  exact Finset.sum_le_sum (fun i hi=>bounded_centered_charFun_normal_error
    (μ i:Measure ℝ) θ M hM hθ hθ' (hBound i hi) (hMean i hi))

/-- Scalar Fourier CLT for uniformly bounded, centered row variables.
Unlike the Bernoulli-only version, rows may encode linear combinations
of many endpoint indicators from each independent Poisson coordinate. -/
theorem bounded_centered_array_charFun_tendsto {ι : ℕ→Type*}
    (S : (n : ℕ)→Finset (ι n)) (μ : (n : ℕ)→ι n→ProbabilityMeasure ℝ) (M : ℝ) (hM : 0≤M)
    (hBound : ∀ n i,i∈S n→∀ᵐ x ∂(μ n i:Measure ℝ),|x|≤M)
    (hMean : ∀ n i,i∈S n→(∫ x : ℝ,x ∂(μ n i:Measure ℝ))=0)
    (a : ℕ→ℝ) (ha : Tendsto a atTop atTop) {v : ℝ}
    (hv : Tendsto (fun n => (∑ i∈S n,∫ x : ℝ,x^2 ∂(μ n i:Measure ℝ))/(a n)^2) atTop (𝓝 v))
    (t : ℝ) :
    Tendsto (fun n=>∏ i∈S n,charFun (μ n i:Measure ℝ) (t/a n)) atTop
      (𝓝 (Complex.exp (↑(-(t^2*v/2):ℝ):ℂ))) := by
  let V (n : ℕ) : ℝ := ∑ i∈S n,∫ x : ℝ,x^2 ∂(μ n i:Measure ℝ)
  let z (n : ℕ) : ℂ := Complex.exp (↑(-((t/a n)^2*V n/2):ℝ):ℂ)
  let f (n : ℕ) : ℂ := ∏ i∈S n,charFun (μ n i:Measure ℝ) (t/a n)
  let C := 3*M+M^2
  have hinv : Tendsto (fun n => (a n)⁻¹) atTop (𝓝 0) := tendsto_inv_atTop_zero.comp ha
  have ht : Tendsto (fun n => t/a n) atTop (𝓝 0) := by
    simpa only [div_eq_mul_inv,mul_zero] using hinv.const_mul t
  have hbound : Tendsto (fun n=>C*|t/a n| ^3*V n) atTop (𝓝 0) := by
    have h := (hv.mul hinv).const_mul (C*|t| ^3)
    simp only [mul_zero] at h
    refine h.congr' ?_
    filter_upwards [ha.eventually_gt_atTop (0:ℝ)] with n hn
    change C*|t| ^3*((V n/(a n)^2)*(a n)⁻¹)=C*|t/a n| ^3*V n
    rw [abs_div,abs_of_nonneg hn.le,div_pow]
    field_simp
  have hz : Tendsto z atTop (𝓝 (Complex.exp (↑(-(t^2*v/2):ℝ):ℂ))) := by
    have h : Tendsto (fun n => -(t^2*(V n/(a n)^2)/2)) atTop (𝓝 (-(t^2*v/2))) :=
      ((hv.const_mul (t^2)).div_const 2).neg
    have h' : Tendsto (fun n => -((t/a n)^2*V n/2)) atTop (𝓝 (-(t^2*v/2))) := by
      refine h.congr (fun n=>?_ )
      rw [div_pow,div_mul_eq_mul_div]
      ring
    exact (Complex.continuous_exp.tendsto _).comp ((Complex.continuous_ofReal.tendsto _).comp h')
  have hfz : Tendsto (fun n=>f n-z n) atTop (𝓝 0) := by
    apply tendsto_iff_norm_sub_tendsto_zero.mpr
    simp only [sub_zero]
    refine squeeze_zero' (Eventually.of_forall (fun _=>norm_nonneg _)) ?_ hbound
    have htAbs : Tendsto (fun n=>|t/a n|) atTop (𝓝 0) := by simpa only [abs_zero] using ht.abs
    have htM : Tendsto (fun n=>|t/a n| * M) atTop (𝓝 0) := by simpa only [zero_mul] using htAbs.mul_const M
    filter_upwards [htAbs.eventually_lt_const (by norm_num : (0:ℝ)<1),
      htM.eventually_lt_const (by norm_num : (0:ℝ)<1)] with n hn hm
    exact bounded_centered_product_normal_error (S n) (μ n) M _ hM hm.le hn.le (hBound n) (hMean n)
  simpa only [sub_add_cancel,zero_add] using hfz.add hz

end PomeranceSarkozy
