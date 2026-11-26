module
public import Conjectures.PomeranceSarkozyRareRateLegendre
import Mathlib.Tactic.Ring
import Mathlib.Tactic.Linarith

@[expose] public section
namespace PomeranceSarkozy

open Filter MeasureTheory Set
open scoped Topology

theorem gaussianRareCumulant_zero : gaussianRareCumulant 0=0 := by
  unfold gaussianRareCumulant gaussianRareCumulantIntegrand bernoulliCenteredCumulant
    bernoulliExponentialDenominator
  simp

theorem gaussianRareRate_zero : gaussianRareRate 0=0 := by
  rw [gaussianRareRate_eq_at_tilt 0 0 gaussianRareCumulantSlope_zero,gaussianRareCumulant_zero]
  ring

theorem gaussianRareRate_nonneg (x : ℝ) : 0≤gaussianRareRate x := by
  simpa only [zero_mul,gaussianRareCumulant_zero,sub_zero] using le_gaussianRareRate_from_tilt x 0

theorem gaussianRareRate_even (x : ℝ) : gaussianRareRate (-x)=gaussianRareRate x := by
  obtain ⟨t,ht,_⟩ := exists_unique_gaussianRareCumulant_tilt x
  have h := gaussianRareCumulantSlope_odd t
  rw [ht] at h
  rw [gaussianRareRate_eq_at_tilt (-x) (-t) h,gaussianRareRate_eq_at_tilt x t ht,gaussianRareCumulant_even]
  ring

theorem gaussianRareRate_pos_of_pos (x : ℝ) (hx : 0<x) : 0<gaussianRareRate x := by
  obtain ⟨t,ht,_⟩ := exists_unique_gaussianRareCumulant_tilt x
  have hT : 0<t := gaussianRareCumulantSlope_strictMono.lt_iff_lt.mp (by
    rw [gaussianRareCumulantSlope_zero,ht]; exact hx)
  let f (z : ℝ) := z*x-gaussianRareCumulant z
  have hD (z : ℝ) : HasDerivAt f (x-gaussianRareCumulantSlope z) z := by
    have hC : HasDerivAt gaussianRareCumulant (gaussianRareCumulantSlope z) z :=
      (gaussianRareCumulant_hasDerivAt z).2
    have hX : HasDerivAt (fun y : ℝ => y*x) x z := by
      simpa only [one_mul,id_eq] using (hasDerivAt_id z).mul_const x
    exact hX.sub hC
  have hF : Differentiable ℝ f := fun z=>(hD z).differentiableAt
  have hPos : StrictMonoOn f (Icc (0:ℝ) t) := by
    apply strictMonoOn_of_deriv_pos (convex_Icc _ _) hF.continuous.continuousOn
    intro z hz
    rw [(hD z).deriv,← ht]
    have hZ : z<t := by
      rw [interior_Icc] at hz
      exact hz.2
    exact sub_pos.mpr (gaussianRareCumulantSlope_strictMono hZ)
  have hh := hPos (left_mem_Icc.mpr hT.le) (right_mem_Icc.mpr hT.le) hT
  change 0*x-gaussianRareCumulant 0<t*x-gaussianRareCumulant t at hh
  rw [gaussianRareCumulant_zero,zero_mul,sub_zero] at hh
  rwa [gaussianRareRate_eq_at_tilt x t ht]

theorem gaussianRareRate_pos (x : ℝ) (hx : x≠0) : 0<gaussianRareRate x := by
  rcases lt_or_gt_of_ne hx with h|h
  · rw [← gaussianRareRate_even]
    exact gaussianRareRate_pos_of_pos (-x) (neg_pos.mpr h)
  · exact gaussianRareRate_pos_of_pos x h

/-- Monotonicity on the right half line follows from the signs of
the maximizing tilts; this is the closed-set LDP upper-bound reduction. -/
theorem gaussianRareRate_monotoneOn_nonneg : MonotoneOn gaussianRareRate (Ici (0:ℝ)) := by
  intro x hx y _ hXY
  obtain ⟨t,ht,_⟩ := exists_unique_gaussianRareCumulant_tilt x
  have hT : 0≤t := gaussianRareCumulantSlope_strictMono.le_iff_le.mp (by
    rw [gaussianRareCumulantSlope_zero,ht]; exact hx)
  rw [gaussianRareRate_eq_at_tilt x t ht]
  exact (sub_le_sub_right (mul_le_mul_of_nonneg_left hXY hT) _).trans
    (le_gaussianRareRate_from_tilt y t)

theorem gaussianRareCumulantSlope_zero_deriv :
    HasDerivAt gaussianRareCumulantSlope (1/Real.sqrt Real.pi) 0 := by
  have h := (gaussianRareFirst_hasDerivAt 0).2
  change HasDerivAt gaussianRareCumulantSlope (∫ s,gaussianRareSecondIntegrand 0 s) 0 at h
  have he (s : ℝ) : gaussianRareSecondIntegrand 0 s=normalTailVarianceWeight s := by
    unfold gaussianRareSecondIntegrand bernoulliExponentialDenominator
    simp
  simp_rw [he,normalTailVarianceWeight_integral] at h
  exact h

end PomeranceSarkozy
