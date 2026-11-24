import Conjectures.SteinerbergerFeldheimBasic
import Mathlib.Analysis.Convex.SpecificFunctions.Basic
import Mathlib.Analysis.Calculus.Deriv.MeanValue
import Mathlib.Analysis.SpecialFunctions.Gaussian.GaussianIntegral
import Mathlib.Analysis.SpecialFunctions.Integrals.Basic
import Mathlib.Analysis.Real.Pi.Bounds

/-!
# Steinerberger's quantitative Feldheim-tail conjecture

The uniform integral estimate from Sections 3--4 of the existing entry's
`PROOF.md`.  It holds at every positive threshold, as required to disprove
an existence conjecture.
-/

open MeasureTheory Set Filter
open scoped ENNReal Topology

namespace SteinerbergerFeldheim
noncomputable section

/-- The normalized probability ratio derived from the counterexample law. -/
def profile (z : ℝ) : ℝ :=
  ∫ t in (0 : ℝ)..1, (1 + z / 100 * (1 - t)) * Real.exp (-(z ^ 2 / 100) * t ^ 2)

theorem exp_neg_le_quadratic {u : ℝ} (hu : 0 ≤ u) :
    Real.exp (-u) ≤ 1 - u + u ^ 2 / 2 := by
  let F : ℝ → ℝ := fun x => 1 - x + x ^ 2 / 2 - Real.exp (-x)
  have hd (x : ℝ) : HasDerivAt F (-1 + x + Real.exp (-x)) x := by
    have hpoly := ((hasDerivAt_const x (1 : ℝ)).sub (hasDerivAt_id x)).add
      (((hasDerivAt_id x).pow 2).div_const 2)
    convert hpoly.sub ((hasDerivAt_id x).neg.exp) using 1
    · funext y
      rfl
    · dsimp
      ring
  have hm : Monotone F := monotone_of_hasDerivAt_nonneg hd (fun x => by
    change 0 ≤ -1 + x + Real.exp (-x)
    have h := Real.add_one_le_exp (-x)
    linarith)
  have h := hm hu
  dsimp [F] at h
  norm_num at h
  linarith

theorem exp_secant (a : ℝ) {u : ℝ} (hu : u ∈ Icc (0 : ℝ) 1) :
    Real.exp (-a * u) ≤ 1 - (1 - Real.exp (-a)) * u := by
  have h := convexOn_exp.2 (mem_univ (0 : ℝ)) (mem_univ (-a))
    (sub_nonneg.mpr hu.2) hu.1 (show 1 - u + u = 1 by ring)
  simp only [smul_eq_mul, mul_zero, zero_add, Real.exp_zero, mul_one] at h
  rw [mul_comm u (-a)] at h
  nlinarith

theorem integral_secant_polynomial (b c : ℝ) :
    (∫ t in (0 : ℝ)..1, (1 + c * (1 - t)) * (1 - b * t ^ 2)) =
      1 + c / 2 - b * (1 / 3 + c / 12) := by
  let F : ℝ → ℝ := fun t =>
    (1 + c) * t - (c / 2) * t ^ 2 - (b * (1 + c) / 3) * t ^ 3 +
      (b * c / 4) * t ^ 4
  have hd (t : ℝ) : HasDerivAt F ((1 + c * (1 - t)) * (1 - b * t ^ 2)) t := by
    convert ((((hasDerivAt_id t).const_mul (1 + c)).sub
      (((hasDerivAt_id t).pow 2).const_mul (c / 2))).sub
      (((hasDerivAt_id t).pow 3).const_mul (b * (1 + c) / 3))).add
      (((hasDerivAt_id t).pow 4).const_mul (b * c / 4)) using 1
    · funext x
      rfl
    · dsimp
      ring
  rw [intervalIntegral.integral_eq_sub_of_hasDerivAt (fun x _ => hd x)
    (show IntervalIntegrable (fun t : ℝ => (1 + c * (1 - t)) * (1 - b * t ^ 2))
      volume 0 1 from (by fun_prop : Continuous _).intervalIntegrable 0 1)]
  dsimp [F]
  ring

theorem profile_small {z : ℝ} (hz : 0 ≤ z) (ha : z ^ 2 / 100 ≤ 1 / 2) :
    profile z ≤ 401 / 400 := by
  let a := z ^ 2 / 100
  let b := 1 - Real.exp (-a)
  have ha0 : 0 ≤ a := by dsimp [a]; positivity
  have hb : 3 * a / 4 ≤ b := by
    have h := exp_neg_le_quadratic ha0
    have haa : a ≤ 1 / 2 := ha
    dsimp [b]
    nlinarith
  have hpoint (t : ℝ) (ht : t ∈ Icc (0 : ℝ) 1) :
      (1 + z / 100 * (1 - t)) * Real.exp (-a * t ^ 2) ≤
        (1 + z / 100 * (1 - t)) * (1 - b * t ^ 2) := by
    apply mul_le_mul_of_nonneg_left (exp_secant a ⟨sq_nonneg t, by nlinarith [ht.1, ht.2]⟩)
    have ht1 : 0 ≤ 1 - t := sub_nonneg.mpr ht.2
    positivity
  have hI : profile z ≤ 1 + (z / 100) / 2 - b * (1 / 3 + (z / 100) / 12) := by
    unfold profile
    calc
      _ ≤ ∫ t in (0 : ℝ)..1, (1 + z / 100 * (1 - t)) * (1 - b * t ^ 2) :=
        intervalIntegral.integral_mono_on (by norm_num)
          ((by fun_prop : Continuous (fun t : ℝ =>
            (1 + z / 100 * (1 - t)) * Real.exp (-a * t ^ 2))).intervalIntegrable 0 1)
          ((by fun_prop : Continuous (fun t : ℝ =>
            (1 + z / 100 * (1 - t)) * (1 - b * t ^ 2))).intervalIntegrable 0 1) hpoint
      _ = _ := integral_secant_polynomial b (z / 100)
  have hco : 0 ≤ 1 / 3 + (z / 100) / 12 := by positivity
  have hmul := mul_le_mul_of_nonneg_right hb hco
  have hdrop : 0 ≤ a * z := mul_nonneg ha0 hz
  dsimp [a] at hmul hdrop
  nlinarith [sq_nonneg (z - 1)]

/-- The unweighted Gaussian integral on the unit interval. -/
def gaussianSegment (a : ℝ) : ℝ := ∫ t in (0 : ℝ)..1, Real.exp (-a * t ^ 2)

theorem gaussianSegment_secant (a : ℝ) :
    gaussianSegment a ≤ 1 - (1 - Real.exp (-a)) / 3 := by
  have h := intervalIntegral.integral_mono_on (μ := volume) (show (0 : ℝ) ≤ 1 by norm_num)
    ((by fun_prop : Continuous (fun t : ℝ => Real.exp (-a * t ^ 2))).intervalIntegrable 0 1)
    ((by fun_prop : Continuous (fun t : ℝ => 1 - (1 - Real.exp (-a)) * t ^ 2)).intervalIntegrable 0 1)
    (fun t (ht : t ∈ Icc (0 : ℝ) 1) => exp_secant a ⟨sq_nonneg t, by nlinarith [ht.1, ht.2]⟩)
  have he := integral_secant_polynomial (1 - Real.exp (-a)) 0
  simp only [zero_mul, add_zero, one_mul, zero_div] at he
  dsimp [gaussianSegment]
  rw [he] at h
  convert h using 1
  ring

theorem gaussianSegment_antitone : Antitone gaussianSegment := by
  intro a b hab
  apply intervalIntegral.integral_mono_on (show (0 : ℝ) ≤ 1 by norm_num)
    ((by fun_prop : Continuous (fun t : ℝ => Real.exp (-b * t ^ 2))).intervalIntegrable 0 1)
    ((by fun_prop : Continuous (fun t : ℝ => Real.exp (-a * t ^ 2))).intervalIntegrable 0 1)
  intro t _
  apply Real.exp_le_exp.mpr
  nlinarith [mul_nonneg (sub_nonneg.mpr hab) (sq_nonneg t)]

theorem gaussianSegment_large {a : ℝ} (ha : 1 / 2 ≤ a) :
    gaussianSegment a ≤ 7 / 8 := by
  have he : Real.exp (-(1 / 2 : ℝ)) ≤ 5 / 8 := by
    rw [Real.exp_neg, inv_le_iff_one_le_mul₀ (Real.exp_pos _)]
    have h := Real.quadratic_le_exp_of_nonneg (show (0 : ℝ) ≤ 1 / 2 by norm_num)
    nlinarith
  exact (gaussianSegment_antitone ha).trans (by
    have h := gaussianSegment_secant (1 / 2)
    linarith)

theorem gaussianSegment_le_halfLine {a : ℝ} (ha : 0 < a) :
    gaussianSegment a ≤ Real.sqrt (Real.pi / a) / 2 := by
  unfold gaussianSegment
  rw [intervalIntegral.integral_of_le (by norm_num)]
  calc
    _ ≤ ∫ t in Ioi (0 : ℝ), Real.exp (-a * t ^ 2) :=
      setIntegral_mono_set (integrable_exp_neg_mul_sq ha).integrableOn
        (ae_of_all _ (fun t => (Real.exp_pos _).le))
        (ae_of_all _ (fun _ ht => ht.1))
    _ = _ := integral_gaussian_Ioi a

theorem weighted_gaussian_bound {z : ℝ} (hz : 0 < z) :
    z / 100 * gaussianSegment (z ^ 2 / 100) < 1 / 8 := by
  have ha : 0 < z ^ 2 / 100 := by positivity
  have h := mul_le_mul_of_nonneg_left (gaussianSegment_le_halfLine ha)
    (show 0 ≤ z / 100 by positivity)
  have hs := Real.sq_sqrt (show 0 ≤ Real.pi / (z ^ 2 / 100) by positivity)
  have he : (z / 100 * (Real.sqrt (Real.pi / (z ^ 2 / 100)) / 2)) ^ 2 = Real.pi / 400 := by
    simp only [mul_pow, div_pow, hs]
    field_simp [hz.ne']
    ring
  have hp : 0 ≤ z / 100 * (Real.sqrt (Real.pi / (z ^ 2 / 100)) / 2) := by positivity
  have hlt : z / 100 * (Real.sqrt (Real.pi / (z ^ 2 / 100)) / 2) < 1 / 8 := by
    nlinarith [Real.pi_lt_four]
  exact h.trans_lt hlt

theorem profile_large {z : ℝ} (hz : 0 < z) (ha : 1 / 2 ≤ z ^ 2 / 100) :
    profile z < 1 := by
  have hpoint (t : ℝ) (ht : t ∈ Icc (0 : ℝ) 1) :
      (1 + z / 100 * (1 - t)) * Real.exp (-(z ^ 2 / 100) * t ^ 2) ≤
        (1 + z / 100) * Real.exp (-(z ^ 2 / 100) * t ^ 2) := by
    apply mul_le_mul_of_nonneg_right _ (Real.exp_pos _).le
    have hmul : 0 ≤ (z / 100) * t := mul_nonneg (by positivity) ht.1
    nlinarith
  have hI : profile z ≤ (1 + z / 100) * gaussianSegment (z ^ 2 / 100) := by
    unfold profile gaussianSegment
    rw [← intervalIntegral.integral_const_mul]
    exact intervalIntegral.integral_mono_on (by norm_num)
      ((by fun_prop : Continuous (fun t : ℝ =>
        (1 + z / 100 * (1 - t)) * Real.exp (-(z ^ 2 / 100) * t ^ 2))).intervalIntegrable 0 1)
      ((by fun_prop : Continuous (fun t : ℝ =>
        (1 + z / 100) * Real.exp (-(z ^ 2 / 100) * t ^ 2))).intervalIntegrable 0 1) hpoint
  have hG := gaussianSegment_large ha
  have hW := weighted_gaussian_bound hz
  nlinarith

/-- The central uniform estimate holds for every positive threshold. -/
theorem profile_uniform {z : ℝ} (hz : 0 < z) : profile z ≤ 401 / 400 := by
  by_cases ha : z ^ 2 / 100 ≤ 1 / 2
  · exact profile_small hz.le ha
  · exact (profile_large hz (le_of_not_ge ha)).le.trans (by norm_num)

end
end SteinerbergerFeldheim
