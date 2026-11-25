module

public import Conjectures.NuttallThetaKernel

public section
namespace NuttallCumulants

noncomputable def thetaScale (t : ℝ) : ℝ := Real.pi * Real.exp (4*t)

/-- The leading factor in the first-summand expansion of §3. -/
noncomputable def thetaLead (t : ℝ) : ℝ :=
  2 * Real.pi^2 * Real.exp (9*t) * Real.exp (-thetaScale t)

theorem thetaLead_pos (t : ℝ) : 0 < thetaLead t := by
  unfold thetaLead
  positivity

theorem thetaScale_ge_one {t : ℝ} (ht : 0 ≤ t) : 1 ≤ thetaScale t := by
  have h : 1 ≤ Real.exp (4*t) := Real.one_le_exp (by positivity)
  unfold thetaScale
  nlinarith [Real.pi_gt_three, mul_nonneg (sub_nonneg.mpr Real.pi_gt_three.le)
    (sub_nonneg.mpr h)]

/-- The exact first summand, including its inverse-scale correction. -/
theorem thetaTerm_zero_eq (t : ℝ) :
    thetaTerm t 0 = thetaLead t * (1 - 3 / (2 * thetaScale t)) := by
  have he : Real.exp (9*t) = Real.exp (5*t) * Real.exp (4*t) := by
    rw [← Real.exp_add, show 5*t+4*t=9*t by ring]
  unfold thetaTerm thetaLead
  push_cast
  simp only [zero_add, one_pow, mul_one]
  unfold thetaScale
  rw [he]
  field_simp [Real.pi_ne_zero, (Real.exp_pos (4*t)).ne']

noncomputable def thetaTailConstant : ℝ :=
  ∑' n : ℕ, ((n : ℝ) + 2)^4 * Real.exp (-1)^n

set_option maxHeartbeats 1000000 in
private theorem thetaTailMajorant_summable :
    Summable (fun n : ℕ => ((n : ℝ) + 2)^4 * Real.exp (-1)^n) := by
  have hr : ‖Real.exp (-1)‖ < 1 := by
    rw [Real.norm_eq_abs, abs_of_pos (Real.exp_pos _)]
    exact Real.exp_lt_one_iff.mpr (by norm_num)
  have hs0 : Summable (fun n : ℕ => (n : ℝ)^4 * Real.exp (-1)^n) :=
    summable_pow_mul_geometric_of_norm_lt_one 4 hr
  have hs := (summable_nat_add_iff 2).mpr hs0
  have hs' : Summable (fun n : ℕ => ((n : ℝ) + 2)^4 * Real.exp (-1)^(n+2)) := by
    simpa only [Nat.cast_add, Nat.cast_ofNat] using hs
  refine (hs'.mul_right ((Real.exp (-1)^2)⁻¹)).congr (fun n => ?_)
  rw [pow_add, mul_assoc, mul_assoc, mul_inv_cancel₀ (by positivity : Real.exp (-1)^2 ≠ 0),
    mul_one]

theorem thetaTailConstant_nonneg : 0 ≤ thetaTailConstant :=
  tsum_nonneg fun _ => by positivity

/-- After removing the first summand, the remaining modes carry a uniform
factor exp(-3 y), where y = π exp(4t). -/
theorem thetaTerm_succ_le_tailMajorant {t : ℝ} (ht : 0 ≤ t) (n : ℕ) :
    thetaTerm t (n+1) ≤ thetaLead t * Real.exp (-3 * thetaScale t) *
      (((n : ℝ)+2)^4 * Real.exp (-1)^n) := by
  let k : ℝ := (n : ℝ) + 2
  let y := thetaScale t
  have hy : 1 ≤ y := thetaScale_ge_one ht
  have hn : 0 ≤ (n : ℝ) := Nat.cast_nonneg _
  have hk : 4 + (n : ℝ) ≤ k^2 := by dsimp [k]; nlinarith [sq_nonneg (n:ℝ)]
  have hkyn : 4*y + (n : ℝ) ≤ y*k^2 := calc
    _ ≤ (4 + (n : ℝ)) * y := by nlinarith [mul_nonneg hn (sub_nonneg.mpr hy)]
    _ ≤ k^2*y := mul_le_mul_of_nonneg_right hk (by linarith)
    _ = _ := mul_comm _ _
  have hexp : Real.exp (-(y * k^2)) ≤ Real.exp (-(4*y) - (n : ℝ)) :=
    Real.exp_le_exp.mpr (by linarith)
  have he1 : Real.exp (-(n : ℝ)) = Real.exp (-1)^n := by
    rw [← Real.exp_nat_mul, mul_neg, mul_one]
  have he2 : Real.exp (-(4*y) - (n : ℝ)) =
      Real.exp (-y) * Real.exp (-3*y) * Real.exp (-1)^n := by
    rw [show -(4*y) - (n : ℝ) = (-y + (-3*y)) + (-(n : ℝ)) by ring,
      Real.exp_add, Real.exp_add, he1]
  unfold thetaTerm
  change (2 * Real.pi^2 * ((↑(n+1) : ℝ) + 1)^4 * Real.exp (9*t) -
        3 * Real.pi * ((↑(n+1) : ℝ) + 1)^2 * Real.exp (5*t)) *
        Real.exp (-Real.pi * ((↑(n+1) : ℝ) + 1)^2 * Real.exp (4*t)) ≤ _
  have hcast : ((↑(n+1) : ℝ) + 1) = k := by push_cast; dsimp [k]; ring
  rw [hcast]
  have harg : -Real.pi * k^2 * Real.exp (4*t) = -(y*k^2) := by
    dsimp [y, thetaScale]
    ring
  rw [harg]
  calc
    _ ≤ (2 * Real.pi^2 * k^4 * Real.exp (9*t)) * Real.exp (-(y*k^2)) :=
      mul_le_mul_of_nonneg_right (sub_le_self _ (by positivity)) (by positivity)
    _ ≤ (2 * Real.pi^2 * k^4 * Real.exp (9*t)) * Real.exp (-(4*y) - (n:ℝ)) :=
      mul_le_mul_of_nonneg_left hexp (by positivity)
    _ = _ := by rw [he2]; unfold thetaLead; dsimp [k,y]; ring

/-- The exact first-term decomposition with a nonnegative exponential error
relative to the leading factor. No differentiated estimate is asserted. -/
theorem thetaKernel_first_mode_bounds {t : ℝ} (ht : 0 ≤ t) :
    thetaLead t * (1 - 3/(2*thetaScale t)) ≤ thetaKernel t ∧
    thetaKernel t ≤ thetaLead t *
      (1 - 3/(2*thetaScale t) + thetaTailConstant * Real.exp (-3*thetaScale t)) := by
  have hs := thetaTerm_summable ht
  have htail := (summable_nat_add_iff 1).mpr hs
  have hn : 0 ≤ ∑' n : ℕ, thetaTerm t (n+1) :=
    tsum_nonneg fun n => (thetaTerm_pos ht (n+1)).le
  have hb := htail.tsum_le_tsum (thetaTerm_succ_le_tailMajorant ht)
    (thetaTailMajorant_summable.mul_left (thetaLead t * Real.exp (-3*thetaScale t)))
  rw [tsum_mul_left, ← thetaTailConstant] at hb
  unfold thetaKernel
  rw [hs.tsum_eq_zero_add, thetaTerm_zero_eq]
  constructor
  · linarith
  · nlinarith [hb]

open Filter
open scoped Topology

/-- The undifferentiated leading asymptotic for the source theta kernel. -/
theorem thetaKernel_div_lead_tendsto_one :
    Tendsto (fun t : ℝ => thetaKernel t / thetaLead t) atTop (𝓝 1) := by
  have hE : Tendsto (fun t : ℝ => Real.exp (4*t)) atTop atTop :=
    Real.tendsto_exp_atTop.comp (tendsto_id.const_mul_atTop (by norm_num : (0:ℝ) < 4))
  have hy : Tendsto thetaScale atTop atTop := hE.const_mul_atTop Real.pi_pos
  have hδ : Tendsto (fun t => 3 / (2 * thetaScale t)) atTop (𝓝 (0:ℝ)) :=
    (hy.const_mul_atTop (by norm_num : (0:ℝ) < 2)).const_div_atTop 3
  have hlow : Tendsto (fun t => 1 - 3 / (2 * thetaScale t)) atTop (𝓝 (1:ℝ)) := by
    simpa only [sub_zero] using (tendsto_const_nhds (x := (1:ℝ))).sub hδ
  have hrem : Tendsto (fun t => thetaTailConstant * Real.exp (-3 * thetaScale t))
      atTop (𝓝 (0:ℝ)) := by
    simpa only [mul_zero, Function.comp_apply] using (Real.tendsto_exp_atBot.comp
      (hy.const_mul_atTop_of_neg (by norm_num : (-3:ℝ) < 0))).const_mul thetaTailConstant
  have hup : Tendsto (fun t => 1 - 3 / (2 * thetaScale t) +
      thetaTailConstant * Real.exp (-3 * thetaScale t)) atTop (𝓝 (1:ℝ)) := by
    simpa only [add_zero] using hlow.add hrem
  apply tendsto_of_tendsto_of_tendsto_of_le_of_le' hlow hup
  · filter_upwards [eventually_ge_atTop (0:ℝ)] with t ht
    exact (le_div_iff₀ (thetaLead_pos t)).2 (by
      simpa only [mul_comm] using (thetaKernel_first_mode_bounds ht).1)
  · filter_upwards [eventually_ge_atTop (0:ℝ)] with t ht
    exact (div_le_iff₀ (thetaLead_pos t)).2 (by
      simpa only [mul_comm] using (thetaKernel_first_mode_bounds ht).2)

/-- Global double-exponential bound for derivative order zero in §3. -/
theorem thetaKernel_le_double_exp {t : ℝ} (ht : 0 ≤ t) :
    thetaKernel t ≤ (2 * Real.pi^2 * (1 + thetaTailConstant)) *
      Real.exp (-Real.exp (2*t)) := by
  let E := Real.exp (2*t)
  have hE : 1 + 2*t ≤ E := by simpa only [add_comm] using Real.add_one_le_exp (2*t)
  have hE1 : 1 ≤ E := by linarith
  have hEp : 0 ≤ E := by linarith
  have hE2 : E ≤ E^2 := by
    nlinarith [mul_nonneg hEp (sub_nonneg.mpr hE1)]
  have hsq : (1+2*t)^2 ≤ E^2 := by
    nlinarith [mul_nonneg (sub_nonneg.mpr hE) (show 0 ≤ E + (1+2*t) by linarith)]
  have h9 : 9*t ≤ 2*E^2 := by nlinarith [sq_nonneg (4*t-1)]
  have he4 : Real.exp (4*t) = E^2 := by
    rw [show 4*t = 2*t + 2*t by ring, Real.exp_add, pow_two]
  have hy : 3*E^2 ≤ thetaScale t := by
    unfold thetaScale
    rw [he4]
    exact mul_le_mul_of_nonneg_right Real.pi_gt_three.le (sq_nonneg _)
  have hlead : thetaLead t ≤ 2 * Real.pi^2 * Real.exp (-E) := by
    unfold thetaLead
    rw [mul_assoc (2 * Real.pi^2), ← Real.exp_add]
    exact mul_le_mul_of_nonneg_left (Real.exp_le_exp.mpr (by linarith)) (by positivity)
  have hscale : 0 < thetaScale t := lt_of_lt_of_le (by norm_num) (thetaScale_ge_one ht)
  have hExp : Real.exp (-3 * thetaScale t) ≤ 1 := Real.exp_le_one_iff.mpr (by linarith)
  have hcorr : 1 - 3/(2*thetaScale t) + thetaTailConstant * Real.exp (-3*thetaScale t) ≤
      1 + thetaTailConstant := by
    linarith [show 0 ≤ 3/(2*thetaScale t) by positivity,
      mul_le_mul_of_nonneg_left hExp thetaTailConstant_nonneg]
  calc
    _ ≤ thetaLead t * (1 - 3/(2*thetaScale t) +
        thetaTailConstant * Real.exp (-3*thetaScale t)) := (thetaKernel_first_mode_bounds ht).2
    _ ≤ thetaLead t * (1 + thetaTailConstant) :=
      mul_le_mul_of_nonneg_left hcorr (thetaLead_pos t).le
    _ ≤ (2 * Real.pi^2 * Real.exp (-E)) * (1 + thetaTailConstant) :=
      mul_le_mul_of_nonneg_right hlead (by linarith [thetaTailConstant_nonneg])
    _ = _ := by dsimp [E]; ring

end NuttallCumulants
