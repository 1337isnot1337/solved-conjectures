import Conjectures.GawronUlasPartitionSeries
import Mathlib.Analysis.Normed.Group.Tannery
import Mathlib.Analysis.PSeries
import Mathlib.Analysis.SpecialFunctions.ExpDeriv

/-! # Boundary limits of the signed partition series -/

open Filter Complex
open scoped Topology

namespace GawronUlasPartitionSigns

noncomputable def approach (η v : ℂ) (t : ℝ) : ℂ := η * Complex.exp (-v * t)

theorem norm_approach {η v : ℂ} (hη : ‖η‖ = 1) (hv : v.re = 1) (t : ℝ) :
    ‖approach η v t‖ = Real.exp (-t) := by
  simp [approach, hη, Complex.norm_exp, Complex.mul_re, hv]

noncomputable def cuspTerm (η : ℂ) (j : ℕ) : ℂ :=
  if η ^ (3 * (j + 1)) = 1 then (-η) ^ (j + 1) / ((j : ℂ) + 1) ^ 2 else 0

noncomputable def cuspRate (η v : ℂ) : ℝ := ((∑' j, cuspTerm η j) / (3 * v)).re

private theorem summable_inv_succ_sq : Summable (fun j : ℕ ↦ ((j : ℝ) + 1)⁻¹ ^ 2) := by
  simpa only [Nat.cast_add, Nat.cast_one, inv_pow] using
    ((summable_nat_add_iff 1).2 ((Real.summable_nat_pow_inv).2 (by decide : 1 < (2 : ℕ))))

theorem norm_cuspTerm_le {η : ℂ} (hη : ‖η‖ = 1) (j : ℕ) :
    ‖cuspTerm η j‖ ≤ ((j : ℝ) + 1)⁻¹ ^ 2 := by
  unfold cuspTerm
  split_ifs
  · simp [norm_pow, hη, ← Complex.ofReal_natCast, ← Complex.ofReal_one,
      ← Complex.ofReal_add, Complex.norm_real, abs_of_nonneg (by positivity : 0 ≤ (j : ℝ) + 1)]
  · simpa only [norm_zero] using sq_nonneg (((j : ℝ) + 1)⁻¹)

theorem summable_cuspTerm {η : ℂ} (hη : ‖η‖ = 1) : Summable (cuspTerm η) :=
  (summable_inv_succ_sq.of_nonneg_of_le (fun _ ↦ norm_nonneg _) (norm_cuspTerm_le hη)).of_norm

private theorem approach_pow (η v : ℂ) (t : ℝ) (n : ℕ) :
    approach η v t ^ n = η ^ n * Complex.exp (-(n : ℂ) * v * t) := by
  rw [approach, mul_pow, ← Complex.exp_nat_mul]
  congr 2
  ring

private noncomputable def scaledTerm (η v : ℂ) (t : ℝ) (j : ℕ) : ℂ :=
  (t : ℂ) * (((-approach η v t) ^ (j + 1) / (j + 1)) /
    (1 - approach η v t ^ (3 * (j + 1))))

private theorem tendsto_exp_slope (a : ℂ) :
    Tendsto (fun z : ℂ ↦ (1 - Complex.exp (-a * z)) / z) (𝓝[≠] 0) (𝓝 a) := by
  have h : HasDerivAt (fun z : ℂ ↦ 1 - Complex.exp (-a * z)) a 0 := by
    simpa using (((hasDerivAt_id (0 : ℂ)).const_mul (-a)).cexp.const_sub 1)
  simpa [div_eq_mul_inv, mul_comm, smul_eq_mul] using h.tendsto_slope_zero

private theorem tendsto_ofReal_right : Tendsto (fun t : ℝ ↦ (t : ℂ)) (𝓝[>] 0) (𝓝[≠] 0) := by
  rw [tendsto_nhdsWithin_iff]
  refine ⟨Complex.continuous_ofReal.continuousAt.continuousWithinAt, ?_⟩
  filter_upwards [self_mem_nhdsWithin] with t ht
  exact fun h ↦ (ne_of_gt ht) (Complex.ofReal_eq_zero.mp h)

private theorem tendsto_scaledTerm (η v : ℂ) (hv : v.re = 1) (j : ℕ) :
    Tendsto (fun t ↦ scaledTerm η v t j) (𝓝[>] 0) (𝓝 (cuspTerm η j / (3 * v))) := by
  let a : ℂ := (3 * ((j : ℂ) + 1)) * v
  have hvne : v ≠ 0 := fun h ↦ by simp [h] at hv
  have hn : (j : ℂ) + 1 ≠ 0 := by exact_mod_cast Nat.succ_ne_zero j
  have hane : a ≠ 0 := mul_ne_zero (mul_ne_zero (by norm_num) hn) hvne
  have ht : Tendsto (fun t : ℝ ↦ (t : ℂ)) (𝓝[>] 0) (𝓝 0) :=
    tendsto_ofReal_right.mono_right nhdsWithin_le_nhds
  have hz : Tendsto (approach η v) (𝓝[>] 0) (𝓝 η) := by
    change Tendsto (fun t : ℝ ↦ η * Complex.exp (-v * t)) (𝓝[>] 0) (𝓝 η)
    simpa using ((tendsto_const_nhds.mul ht).cexp.const_mul η :
      Tendsto (fun t : ℝ ↦ η * Complex.exp (-v * t)) _ (𝓝 (η * Complex.exp (-v * 0))))
  have hnum := (hz.neg.pow (j + 1)).div_const ((j : ℂ) + 1)
  by_cases h : η ^ (3 * (j + 1)) = 1
  · have H := hnum.div ((tendsto_exp_slope a).comp tendsto_ofReal_right) hane
    have hlim : (-η) ^ (j + 1) / ((j : ℂ) + 1) / a = cuspTerm η j / (3 * v) := by
      simp only [cuspTerm, ite_eq_left h, div_div]
      congr 1
      dsimp [a]
      ring
    rw [hlim] at H
    refine H.congr' ?_
    filter_upwards [self_mem_nhdsWithin] with t (ht : 0 < t)
    change ((-approach η v t) ^ (j + 1) / ((j : ℂ) + 1)) /
      ((1 - Complex.exp (-a * t)) / (t : ℂ)) = _
    rw [scaledTerm, approach_pow, h, one_mul]
    have ha : -(↑(3 * (j + 1)) : ℂ) * v * t = -a * t := by simp [a, Nat.cast_mul]
    rw [ha, div_div_eq_mul_div, mul_comm, mul_div_assoc]
  · have H := (ht.mul hnum).div ((hz.pow (3 * (j + 1))).const_sub 1) (sub_ne_zero.mpr (Ne.symm h))
    simpa only [scaledTerm, cuspTerm, ite_eq_right h, zero_mul, zero_div, Pi.div_def,
      mul_div_assoc] using H

private theorem scaledTerm_bound {η v : ℂ} (hη : ‖η‖ = 1) (hv : v.re = 1)
    {t : ℝ} (ht : 0 < t) (j : ℕ) : ‖scaledTerm η v t j‖ ≤ ((j : ℝ) + 1)⁻¹ ^ 2 := by
  let n : ℝ := j + 1
  let u : ℝ := n * t
  have hn : 0 < n := by dsimp [n]; positivity
  have hu : 0 < u := mul_pos hn ht
  have hnorm (m : ℕ) : ‖approach η v t ^ m‖ = Real.exp (-(m : ℝ) * t) := by
    rw [norm_pow, norm_approach hη hv, ← Real.exp_nat_mul]
    congr 1
    ring
  have hb : 1 - Real.exp (-3 * u) ≤ ‖1 - approach η v t ^ (3 * (j + 1))‖ := by
    have H := norm_sub_norm_le (1 : ℂ) (approach η v t ^ (3 * (j + 1)))
    rw [norm_one, hnorm] at H
    convert H using 3
    push_cast
    simp [u, n]
    ring
  have hden : 0 < 1 - Real.exp (-3 * u) := sub_pos.mpr (Real.exp_lt_one_iff.mpr (by linarith))
  have he : u * Real.exp (-u) ≤ 1 - Real.exp (-3 * u) := by
    have hh : u ≤ Real.exp u - Real.exp (-2 * u) := by
      have h₁ := Real.add_one_le_exp u
      have h₂ : Real.exp (-2 * u) ≤ 1 := Real.exp_le_one_iff.mpr (by linarith)
      linarith
    have heq : Real.exp (-3 * u) * Real.exp u = Real.exp (-2 * u) := by
      rw [← Real.exp_add]
      congr 1
      ring
    apply (le_of_mul_le_mul_right · (Real.exp_pos u))
    rw [sub_mul, one_mul, heq, mul_assoc, ← Real.exp_add, neg_add_cancel, Real.exp_zero, mul_one]
    exact hh
  have hnum : ‖(-approach η v t) ^ (j + 1)‖ = Real.exp (-(↑(j + 1) : ℝ) * t) := by
    rw [norm_pow, norm_neg, ← norm_pow, hnorm]
  rw [scaledTerm, norm_mul, norm_div, norm_div, hnum, Complex.norm_real, Real.norm_eq_abs,
    abs_of_pos ht]
  have hnc : ‖(j : ℂ) + 1‖ = n := by
    rw [← Complex.ofReal_natCast, ← Complex.ofReal_one, ← Complex.ofReal_add, Complex.norm_real,
      Real.norm_eq_abs, abs_of_pos hn]
  rw [hnc]
  change t * (Real.exp (-(↑(j + 1) : ℝ) * t) / n /
    ‖1 - approach η v t ^ (3 * (j + 1))‖) ≤ n⁻¹ ^ 2
  rw [show -(↑(j + 1) : ℝ) * t = -u by push_cast; dsimp [u, n]; ring]
  calc
    _ ≤ t * (Real.exp (-u) / n / (1 - Real.exp (-3 * u))) := by gcongr
    _ = (u * Real.exp (-u) / (1 - Real.exp (-3 * u))) * n⁻¹ ^ 2 := by
      field_simp
      simp [u]
      ring
    _ ≤ 1 * n⁻¹ ^ 2 := mul_le_mul_of_nonneg_right ((div_le_one hden).mpr he) (sq_nonneg _)
    _ = _ := one_mul _

theorem tendsto_cuspRate {η v : ℂ} (hη : ‖η‖ = 1) (hv : v.re = 1) :
    Tendsto (fun t : ℝ ↦ t * Real.log ‖series (approach η v t)‖) (𝓝[>] 0) (𝓝 (cuspRate η v)) := by
  have hpos : ∀ᶠ t : ℝ in 𝓝[>] 0, 0 < t := self_mem_nhdsWithin
  have H := tendsto_tsum_of_dominated_convergence summable_inv_succ_sq (tendsto_scaledTerm η v hv)
    (Filter.Eventually.mono hpos fun _ ht j ↦ scaledTerm_bound hη hv ht j)
  have HR := Complex.continuous_re.continuousAt.tendsto.comp H
  rw [tsum_div_const] at HR
  refine HR.congr' ?_
  filter_upwards [self_mem_nhdsWithin] with t (ht : 0 < t)
  have hz : ‖approach η v t‖ < 1 := by
    rw [norm_approach hη hv]
    exact Real.exp_lt_one_iff.mpr (neg_lt_zero.mpr ht)
  rw [Function.comp_apply, series_eq_exp_lambert _ hz, Complex.norm_exp, Real.log_exp]
  unfold scaledTerm
  rw [tsum_mul_left, ← lambert, Complex.re_ofReal_mul]

end GawronUlasPartitionSigns
