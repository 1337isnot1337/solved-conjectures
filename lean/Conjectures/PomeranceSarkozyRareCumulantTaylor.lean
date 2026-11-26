module
public import Conjectures.PomeranceSarkozyRareCumulantThird
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

@[expose] public section
namespace PomeranceSarkozy

open Set

/-- The variance-weighted cubic remainder in the written moderate
deviation expansion, uniformly in the Bernoulli parameter. -/
theorem bernoulliCenteredCumulant_quadratic_error (p t : ℝ) (hp₀ : 0≤ p) (hp₁ : p≤ 1) :
    |bernoulliCenteredCumulant p t-p*(1-p)*t^2/2| ≤ Real.exp (3*|t|) *p*(1-p)*|t| ^3/6 := by
  by_cases ht : t=0
  · subst t
    simp [bernoulliCenteredCumulant_at_zero]
  let f := bernoulliCenteredCumulant p
  let S := uIcc (0:ℝ) t
  let v := p*(1-p)
  have ht' : (0:ℝ)≠t := fun h=>ht h.symm
  have hCont (n : ℕ) : ContDiff ℝ n f := bernoulliCenteredCumulant_contDiff hp₀ hp₁ n
  have hS : UniqueDiffOn ℝ S := uniqueDiffOn_uIcc ht'
  have h0 : (0:ℝ)∈S := left_mem_uIcc
  have hQ : bernoulliTiltedProbability p 0=p := by
    simp [bernoulliTiltedProbability,bernoulliExponentialDenominator]
  have h1 : iteratedDerivWithin 1 f S 0=0 := by
    rw [iteratedDerivWithin_eq_iteratedDeriv hS (hCont 1).contDiffAt h0,iteratedDeriv_one]
    have h := (bernoulliCenteredCumulant_hasDerivAt hp₀ hp₁ 0).deriv
    rwa [hQ,sub_self] at h
  have h2 : iteratedDerivWithin 2 f S 0=v := by
    rw [iteratedDerivWithin_eq_iteratedDeriv hS (hCont 2).contDiffAt h0]
    unfold f v
    rw [bernoulliCenteredCumulant_second p 0 hp₀ hp₁,hQ]
  have hPoly : taylorWithinEval f 2 S 0 t=v*t^2/2 := by
    rw [taylor_within_apply]
    norm_num [Finset.sum_range_succ,h1,h2,Nat.factorial,f,bernoulliCenteredCumulant_at_zero]
    ring
  obtain ⟨s,hs,hr⟩ := taylor_mean_remainder_lagrange_iteratedDeriv
    (f:=f) (n:=2) ht' (hCont 3).contDiffOn
  have hAbs : |s| ≤ |t| := by
    obtain ⟨hs₀,hs₁⟩ := hs
    by_cases hz : 0≤ t
    · rw [min_eq_left hz] at hs₀
      rw [max_eq_right hz] at hs₁
      rw [abs_of_nonneg hs₀.le,abs_of_nonneg hz]
      exact hs₁.le
    · have hz' : t≤ 0 := le_of_not_ge hz
      rw [min_eq_right hz'] at hs₀
      rw [max_eq_left hz'] at hs₁
      rw [abs_of_nonpos hs₁.le,abs_of_nonpos hz']
      linarith
  change f t-taylorWithinEval f 2 S 0 t=iteratedDeriv 3 f s*(t-0)^3/((3:ℕ).factorial:ℝ) at hr
  rw [hPoly,sub_zero] at hr
  change |f t-v*t^2/2| ≤ Real.exp (3*|t|) *p*(1-p)*|t| ^3/6
  rw [hr,abs_div,abs_mul,abs_pow]
  norm_num [Nat.factorial]
  apply div_le_div_of_nonneg_right _ (by norm_num)
  refine mul_le_mul_of_nonneg_right ((bernoulliCenteredCumulant_third_bound p s hp₀ hp₁).trans ?_) (by positivity)
  exact mul_le_mul_of_nonneg_right
    (mul_le_mul_of_nonneg_right (Real.exp_le_exp.mpr (by linarith)) hp₀) (sub_nonneg.mpr hp₁)

end PomeranceSarkozy
