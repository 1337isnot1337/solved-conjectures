module
public import Conjectures.PomeranceSarkozyRareCumulantBounds
public import Mathlib.Analysis.Calculus.Taylor
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

@[expose] public section
namespace PomeranceSarkozy

open Set

theorem bernoulliTiltedProbability_mem_Icc (p t : ℝ) (hp₀ : 0≤ p) (hp₁ : p≤ 1) :
    bernoulliTiltedProbability p t∈Icc (0:ℝ) 1 := by
  have hD := bernoulliExponentialDenominator_pos hp₀ hp₁ t
  unfold bernoulliTiltedProbability
  constructor
  · exact div_nonneg (by positivity) hD.le
  · apply (div_le_one₀ hD).mpr
    unfold bernoulliExponentialDenominator
    have h := sub_nonneg.mpr hp₁
    nlinarith only [h]

theorem bernoulliTiltedProbability_hasDerivAt_logistic {p : ℝ} (hp₀ : 0≤ p) (hp₁ : p≤ 1) (t : ℝ) :
    HasDerivAt (bernoulliTiltedProbability p)
      (bernoulliTiltedProbability p t*(1-bernoulliTiltedProbability p t)) t := by
  have h := bernoulliTiltedProbability_hasDerivAt hp₀ hp₁ t
  have he : bernoulliTiltedProbability p t*(1-bernoulliTiltedProbability p t)=
      p*(1-p)*Real.exp t/(bernoulliExponentialDenominator p t)^2 := by
    have hD := (bernoulliExponentialDenominator_pos hp₀ hp₁ t).ne'
    unfold bernoulliTiltedProbability
    field_simp
    unfold bernoulliExponentialDenominator
    ring
  rw [he]
  exact h

theorem bernoulliCenteredCumulant_contDiff {p : ℝ} (hp₀ : 0≤ p) (hp₁ : p≤ 1) (n : ℕ) :
    ContDiff ℝ n (bernoulliCenteredCumulant p) := by
  unfold bernoulliCenteredCumulant
  have hd : ContDiff ℝ n (bernoulliExponentialDenominator p) := by
    unfold bernoulliExponentialDenominator
    fun_prop
  exact (hd.log (fun t=>(bernoulliExponentialDenominator_pos hp₀ hp₁ t).ne')).sub
    (contDiff_id.mul contDiff_const)

theorem bernoulliCenteredCumulant_second (p t : ℝ) (hp₀ : 0≤ p) (hp₁ : p≤ 1) :
    iteratedDeriv 2 (bernoulliCenteredCumulant p) t =
      bernoulliTiltedProbability p t*(1-bernoulliTiltedProbability p t) := by
  have h₁ : deriv (bernoulliCenteredCumulant p)=fun u=>bernoulliTiltedProbability p u-p :=
    funext (fun u=>(bernoulliCenteredCumulant_hasDerivAt hp₀ hp₁ u).deriv)
  rw [show (2:ℕ)=1+1 from rfl,iteratedDeriv_succ,iteratedDeriv_one,h₁]
  exact ((bernoulliTiltedProbability_hasDerivAt_logistic hp₀ hp₁ t).sub_const p).deriv

/-- The third derivative stays bounded by the variance-weighted
exponential envelope, including degenerate Bernoulli parameters. -/
theorem bernoulliCenteredCumulant_third_bound (p t : ℝ) (hp₀ : 0≤ p) (hp₁ : p≤ 1) :
    |iteratedDeriv 3 (bernoulliCenteredCumulant p) t|≤ Real.exp (3*|t|) *p*(1-p) := by
  let q := bernoulliTiltedProbability p t
  let D := p*(1-p)*Real.exp t/(bernoulliExponentialDenominator p t)^2
  have h₂ : iteratedDeriv 2 (bernoulliCenteredCumulant p)=
      fun u=>bernoulliTiltedProbability p u*(1-bernoulliTiltedProbability p u) :=
    funext (fun u=>bernoulliCenteredCumulant_second p u hp₀ hp₁)
  have hq := bernoulliTiltedProbability_hasDerivAt hp₀ hp₁ t
  have hh : HasDerivAt (fun u=>bernoulliTiltedProbability p u*(1-bernoulliTiltedProbability p u))
      (D*(1-q)+q*(-D)) t := hq.mul (hq.const_sub 1)
  rw [show (3:ℕ)=2+1 from rfl,iteratedDeriv_succ,h₂,hh.deriv]
  change |D*(1-q)+q*(-D)|≤ _
  rw [show D*(1-q)+q*(-D)=D*(1-2*q) by ring,abs_mul]
  obtain ⟨hq₀,hq₁⟩ := bernoulliTiltedProbability_mem_Icc p t hp₀ hp₁
  have hu : |1-2*q|≤ 1 := abs_le.mpr ⟨by linarith,by linarith⟩
  obtain ⟨hn,hD⟩ := bernoulliTiltedProbability_derivative_bound p t hp₀ hp₁
  rw [abs_of_nonneg hn]
  refine (mul_le_of_le_one_right hn hu).trans (hD.trans_eq ?_)
  ring

end PomeranceSarkozy
