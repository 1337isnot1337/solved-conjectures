module
public import Conjectures.PomeranceSarkozyBernoulliProduct
public import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

@[expose] public section
namespace PomeranceSarkozy

open Filter Finset
open scoped Topology BigOperators

/-- Fourier form of the CLT for rows of independent, non-identical
Bernoulli variables. An arbitrary growing normalizer is allowed,
provided the ratio of total variance to its square has a limit. -/
theorem centeredBernoulliArray_charFun_tendsto {ι : Type*} (S : ℕ→Finset ι)
    (p : ℕ→ι→ℝ) (hp : ∀ n i,i∈S n→0≤p n i ∧ p n i≤1)
    (a : ℕ→ℝ) (ha : Tendsto a atTop atTop) {v : ℝ}
    (hv : Tendsto (fun n => (∑ i∈S n,p n i*(1-p n i))/(a n)^2) atTop (𝓝 v))
    (t : ℝ) :
    Tendsto (fun n => ∏ i∈S n,centeredBernoulliFactor (p n i) (t/a n)) atTop
      (𝓝 (Complex.exp (↑(-(t^2*v/2):ℝ):ℂ))) := by
  let V (n : ℕ) : ℝ := ∑ i∈S n,p n i*(1-p n i)
  let z (n : ℕ) : ℂ := Complex.exp (↑(-((t/a n)^2*V n/2):ℝ):ℂ)
  let f (n : ℕ) : ℂ := ∏ i∈S n,centeredBernoulliFactor (p n i) (t/a n)
  have hinv : Tendsto (fun n => (a n)⁻¹) atTop (𝓝 0) := tendsto_inv_atTop_zero.comp ha
  have ht : Tendsto (fun n => t/a n) atTop (𝓝 0) := by
    simpa only [div_eq_mul_inv,mul_zero] using hinv.const_mul t
  have hbound : Tendsto (fun n => 4*|t/a n| ^3*V n) atTop (𝓝 0) := by
    have h := (hv.mul hinv).const_mul (4*|t| ^3)
    simp only [mul_zero] at h
    refine h.congr' ?_
    filter_upwards [ha.eventually_gt_atTop (0:ℝ)] with n hn
    change 4*|t| ^3*((V n/(a n)^2)*(a n)⁻¹)=4*|t/a n| ^3*V n
    rw [abs_div,abs_of_nonneg hn.le,div_pow]
    field_simp
  have hz : Tendsto z atTop (𝓝 (Complex.exp (↑(-(t^2*v/2):ℝ):ℂ))) := by
    have h : Tendsto (fun n => -(t^2*(V n/(a n)^2)/2)) atTop (𝓝 (-(t^2*v/2))) :=
      ((hv.const_mul (t^2)).div_const 2).neg
    have h' : Tendsto (fun n => -((t/a n)^2*V n/2)) atTop (𝓝 (-(t^2*v/2))) := by
      refine h.congr (fun n => ?_)
      rw [div_pow,div_mul_eq_mul_div]
      ring
    exact (Complex.continuous_exp.tendsto _).comp ((Complex.continuous_ofReal.tendsto _).comp h')
  have hfz : Tendsto (fun n => f n-z n) atTop (𝓝 0) := by
    apply tendsto_iff_norm_sub_tendsto_zero.mpr
    simp only [sub_zero]
    refine squeeze_zero' (Eventually.of_forall (fun _=>norm_nonneg _)) ?_ hbound
    have htAbs : Tendsto (fun n => |t/a n|) atTop (𝓝 0) := by simpa only [abs_zero] using ht.abs
    filter_upwards [htAbs.eventually_lt_const (by norm_num : (0:ℝ)<1)] with n hn
    exact centeredBernoulliProduct_normal_error (S n) (p n) (hp n) hn.le
  have hsum := hfz.add hz
  simpa only [sub_add_cancel,zero_add] using hsum

end PomeranceSarkozy
