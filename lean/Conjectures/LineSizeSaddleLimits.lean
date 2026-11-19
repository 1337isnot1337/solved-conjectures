import Conjectures.LineSizeAnalyticProfile
import Mathlib.Analysis.Calculus.Taylor
import Mathlib.Analysis.Calculus.DSlope
import Mathlib.Analysis.Calculus.ContDiff.Deriv

/-! Local saddle limits for the actual profile. The scaled arguments may
vary along an arbitrary filter, so the results apply to moving lattice cells.
All derivative values come from the checked profile identities. -/
noncomputable section
namespace LineSize.Saddle

open Real Set Filter MeasureTheory
open LineSize.Profile
open scoped Topology ContDiff

theorem f_contDiffOn : ContDiffOn ℝ ∞ Profile.f (Ioi 0) := by
  have h : ContDiffOn ℝ ∞ (fun x : ℝ => 1 - exp (-x)) (Ioi 0) := by fun_prop
  exact (h.log (fun x hx => (one_sub_exp_neg_pos hx).ne')).neg

theorem I_contDiffOn : ContDiffOn ℝ ∞ Profile.I (Ioi 0) := by
  apply (contDiffOn_infty_iff_deriv_of_isOpen isOpen_Ioi).mpr
  refine ⟨fun x hx => (hasDerivAt_I hx).differentiableAt.differentiableWithinAt, ?_⟩
  exact f_contDiffOn.congr (fun x hx => (hasDerivAt_I hx).deriv)

theorem Phi_contDiffOn : ContDiffOn ℝ ∞ Phi (Ioi 0) := by
  exact ((contDiffOn_id.mul_const (log 2)).sub (contDiffOn_id.pow 2)).add I_contDiffOn

theorem iteratedDerivWithin_Phi_u0 (n : ℕ) :
    iteratedDerivWithin n Phi (Ioi 0) u0 = iteratedDeriv n Phi u0 := by
  have hc : ContDiffAt ℝ n Phi u0 :=
    ((Phi_contDiffOn.of_le (by simp)) u0 u0_pos).contDiffAt (Ioi_mem_nhds u0_pos)
  exact iteratedDerivWithin_eq_iteratedDeriv isOpen_Ioi.uniqueDiffOn hc u0_pos

theorem Phi_taylor_two (x : ℝ) :
    taylorWithinEval Phi 2 (Ioi 0) u0 x = A - (3 / 2 : ℝ) * (x - u0) ^ 2 := by
  have hd1 : deriv Phi u0 = 0 := by rw [deriv_Phi u0_pos, PhiPrime_u0]
  have hd2 : deriv (deriv Phi) u0 = -3 := by
    have h := h_eq_three
    unfold Profile.h at h
    linarith
  rw [show (2 : ℕ) = 1 + 1 from rfl, taylorWithinEval_succ,
    show (1 : ℕ) = 0 + 1 from rfl, taylorWithinEval_succ, taylor_within_zero_eval]
  rw [iteratedDerivWithin_Phi_u0, iteratedDerivWithin_Phi_u0]
  simp only [iteratedDeriv_succ, iteratedDeriv_zero, smul_eq_mul,
    Nat.factorial_zero, Nat.factorial_one, Nat.cast_one, Phi_u0, hd1, hd2]
  ring

def phaseRemainder (u : ℝ) : ℝ :=
  (Phi u - A + (3 / 2 : ℝ) * (u - u0) ^ 2) / (u - u0) ^ 2

theorem phaseRemainder_tendsto : Tendsto phaseRemainder (𝓝 u0) (𝓝 0) := by
  have h := Real.taylor_tendsto (f := Phi) (n := 2) (convex_Ioi (0 : ℝ)) u0_pos
    (Phi_contDiffOn.of_le (by simp))
  rw [nhdsWithin_of_mem (Ioi_mem_nhds u0_pos)] at h
  change Tendsto (fun u => (Phi u - A + (3 / 2 : ℝ) * (u - u0) ^ 2) /
    (u - u0) ^ 2) (𝓝 u0) (𝓝 0)
  simpa only [Phi_taylor_two, sub_sub] using h

theorem phaseRemainder_identity (u : ℝ) :
    Phi u - A = phaseRemainder u * (u - u0) ^ 2 - (3 / 2 : ℝ) * (u - u0) ^ 2 := by
  by_cases hu : u = u0
  · subst u
    simp [Phi_u0]
  · unfold phaseRemainder
    rw [div_mul_cancel₀ _ (pow_ne_zero _ (sub_ne_zero.mpr hu))]
    ring

theorem phase_scaled_identity {t : ℝ} (ht : 0 < t) (z : ℝ) :
    (Phi (u0 + sqrt t * z) - A) / t =
      phaseRemainder (u0 + sqrt t * z) * z ^ 2 - (3 / 2 : ℝ) * z ^ 2 := by
  rw [phaseRemainder_identity]
  have hs : (u0 + sqrt t * z - u0) ^ 2 = t * z ^ 2 := by
    rw [add_sub_cancel_left, mul_pow, Real.sq_sqrt ht.le]
  rw [hs]
  field_simp
  ring

theorem scaled_argument_tendsto {α : Type*} {l : Filter α} {t z : α → ℝ} {z0 : ℝ}
    (ht : Tendsto t l (𝓝 0)) (hz : Tendsto z l (𝓝 z0)) :
    Tendsto (fun k => u0 + sqrt (t k) * z k) l (𝓝 u0) := by
  have h := tendsto_const_nhds.add (((Real.continuous_sqrt.tendsto 0).comp ht).mul hz)
  simpa only [Real.sqrt_zero, zero_mul, add_zero] using h

theorem phase_scaled_tendsto {α : Type*} {l : Filter α} {t z : α → ℝ} {z0 : ℝ}
    (ht : Tendsto t l (𝓝 0)) (htpos : ∀ᶠ k in l, 0 < t k)
    (hz : Tendsto z l (𝓝 z0)) :
    Tendsto (fun k => (Phi (u0 + sqrt (t k) * z k) - A) / t k)
      l (𝓝 (-(3 / 2 : ℝ) * z0 ^ 2)) := by
  have hu := scaled_argument_tendsto ht hz
  have he := phaseRemainder_tendsto.comp hu
  have hlim := (he.mul (hz.pow 2)).sub (tendsto_const_nhds.mul (hz.pow 2))
  have hlim' : Tendsto
      (fun k => phaseRemainder (u0 + sqrt (t k) * z k) * z k ^ 2 -
        (3 / 2 : ℝ) * z k ^ 2) l (𝓝 (-(3 / 2 : ℝ) * z0 ^ 2)) := by
    simpa only [zero_mul, zero_sub, neg_mul] using hlim
  apply hlim'.congr'
  filter_upwards [htpos] with k hk
  exact (phase_scaled_identity hk (z k)).symm

theorem meanSlope_tendsto : Tendsto (dslope M u0) (𝓝 u0) (𝓝 (3 * u0)) := by
  have hc := continuousAt_dslope_same.mpr (hasDerivAt_M u0_pos).differentiableAt
  simpa only [dslope_same, deriv_M_u0] using hc.tendsto

theorem mean_scaled_identity {t : ℝ} (ht : 0 < t) (z : ℝ) :
    (M (u0 + sqrt t * z) - A) / sqrt t =
      z * dslope M u0 (u0 + sqrt t * z) := by
  have h := sub_smul_dslope M u0 (u0 + sqrt t * z)
  rw [smul_eq_mul, M_u0, add_sub_cancel_left] at h
  apply (div_eq_iff (Real.sqrt_pos.mpr ht).ne').mpr
  nlinarith [h]

theorem mean_scaled_tendsto {α : Type*} {l : Filter α} {t z : α → ℝ} {z0 : ℝ}
    (ht : Tendsto t l (𝓝 0)) (htpos : ∀ᶠ k in l, 0 < t k)
    (hz : Tendsto z l (𝓝 z0)) :
    Tendsto (fun k => (M (u0 + sqrt (t k) * z k) - A) / sqrt (t k))
      l (𝓝 (z0 * (3 * u0))) := by
  have hs := meanSlope_tendsto.comp (scaled_argument_tendsto ht hz)
  apply (hz.mul hs).congr'
  filter_upwards [htpos] with k hk
  exact (mean_scaled_identity hk (z k)).symm

theorem hasDerivAt_V {u : ℝ} (hu : 0 < u) : HasDerivAt V (varianceKernel u) u := by
  exact intervalIntegral.integral_hasDerivAt_right (intervalIntegrable_varianceKernel hu.le)
    measurable_varianceKernel.stronglyMeasurable.stronglyMeasurableAtFilter
    (continuousAt_varianceKernel hu)

theorem variance_scaled_tendsto {α : Type*} {l : Filter α} {t z : α → ℝ} {z0 : ℝ}
    (ht : Tendsto t l (𝓝 0)) (hz : Tendsto z l (𝓝 z0)) :
    Tendsto (fun k => V (u0 + sqrt (t k) * z k)) l (𝓝 V0) :=
  (hasDerivAt_V u0_pos).continuousAt.tendsto.comp (scaled_argument_tendsto ht hz)

end LineSize.Saddle
