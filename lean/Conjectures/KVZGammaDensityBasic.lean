module

public import Mathlib.Analysis.SpecialFunctions.Gamma.Basic
public import Mathlib.Analysis.SpecialFunctions.Pow.Continuity
public import Mathlib.Tactic.FieldSimp
public import Mathlib.Tactic.Ring

/-!
# The literal gamma-density kernel

The formula is defined globally. Positivity and continuity are asserted on
the positive half-line; the convolution modules integrate against volume
restricted to that half-line.
-/

@[expose] public section

namespace KVZGamma

open Set

noncomputable section

/-- The gamma-density formula used in the source integral representation. -/
def gammaDensity (a u : ℝ) : ℝ :=
  Real.rpow u (a - 1) * Real.exp (-u) / Real.Gamma a

theorem gammaDensity_pos {a u : ℝ} (ha : 0 < a) (hu : 0 < u) :
    0 < gammaDensity a u := by
  exact div_pos (mul_pos (Real.rpow_pos_of_pos hu _) (Real.exp_pos _))
    (Real.Gamma_pos_of_pos ha)

theorem gammaDensity_nonneg {a u : ℝ} (ha : 0 < a) (hu : 0 < u) :
    0 ≤ gammaDensity a u := (gammaDensity_pos ha hu).le

theorem gammaDensity_continuousAt (a : ℝ) {u : ℝ} (hu : 0 < u) :
    ContinuousAt (gammaDensity a) u := by
  exact ((Real.continuousAt_rpow_const u (a - 1) (Or.inl hu.ne')).mul
    (Real.continuous_exp.continuousAt.comp continuousAt_id.neg)).div_const _

theorem gammaDensity_continuousOn (a : ℝ) :
    ContinuousOn (gammaDensity a) (Ioi 0) := by
  intro u hu
  exact (gammaDensity_continuousAt a hu).continuousWithinAt

/-- Positive row and column factors reduce this kernel to exponentials. -/
theorem gammaDensity_eq_exp (a : ℝ) {u : ℝ} (hu : 0 < u) :
    gammaDensity a u = (Real.Gamma a)⁻¹ * Real.exp (a * Real.log u) *
      (Real.exp (-u) / u) := by
  rw [gammaDensity, Real.rpow_eq_pow, Real.rpow_sub_one hu.ne', Real.rpow_def_of_pos hu]
  rw [mul_comm (Real.log u) a]
  ring

end

end KVZGamma
