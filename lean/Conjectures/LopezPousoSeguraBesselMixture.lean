import Conjectures.LopezPousoSeguraBesselDiverge
import Mathlib.Analysis.Convex.Deriv

namespace BesselWeights
noncomputable def kernel (q y : ℝ) : ℝ := y^2/(y+q)

theorem kernel_deriv (q y : ℝ) (hq : 0 < q) (hy : 0 < y) :
    HasDerivAt (kernel q) (1-q^2/(y+q)^2) y := by
  have hn : y+q ≠ 0 := by positivity
  have hh := ((hasDerivAt_id y).pow 2).div ((hasDerivAt_id y).add_const q) hn
  convert hh using 1
  all_goals try { funext t; simp [kernel] }
  all_goals simp only [Pi.pow_apply, Pi.div_apply, Pi.add_apply, id_eq, Nat.reduceSub, pow_one, mul_one]
  all_goals field_simp [hn]
  all_goals ring

theorem kernel_deriv2 (q y : ℝ) (hq : 0 < q) (hy : 0 < y) :
    HasDerivAt (deriv (kernel q)) (2*q^2/(y+q)^3) y := by
  have hn : y+q ≠ 0 := by positivity
  have hh := (hasDerivAt_const y 1).sub ((hasDerivAt_const y (q^2)).div (((hasDerivAt_id y).add_const q).pow 2) (pow_ne_zero 2 hn))
  have hh' : HasDerivAt (fun t : ℝ => 1-q^2/(t+q)^2) (2*q^2/(y+q)^3) y := by
    convert hh using 1
    all_goals try { funext t; simp only [Pi.sub_apply, Pi.div_apply, Pi.pow_apply, Pi.add_apply, id_eq] }
    all_goals simp only [Pi.pow_apply, Pi.div_apply, Pi.add_apply, id_eq, Nat.reduceSub, pow_one, mul_one]
    all_goals field_simp [hn]
    all_goals ring
  apply hh'.congr_of_eventuallyEq
  filter_upwards [eventually_gt_nhds hy] with z hz
  exact (kernel_deriv q z hq hz).deriv

theorem kernel_strictConvex (q : ℝ) (hq : 0 < q) : StrictConvexOn ℝ (Set.Ioi 0) (kernel q) := by
  apply strictConvexOn_of_deriv2_pos' (convex_Ioi 0)
  · intro y hy
    exact (((kernel_deriv q y hq hy).continuousAt).continuousWithinAt)
  · intro y hy
    have hy' : 0 < y := hy
    change 0 < deriv (deriv (kernel q)) y
    rw [(kernel_deriv2 q y hq hy').deriv]
    positivity

open MeasureTheory Filter

theorem mixture_strictConvex (μ : Measure ℝ) (hμ : μ ≠ 0)
    (hpos : ∀ᵐ q ∂μ, 0 < q)
    (hI : ∀ y ∈ Set.Ioi (0:ℝ), Integrable (fun q => kernel q y) μ) :
    StrictConvexOn ℝ (Set.Ioi 0) (fun y => ∫ q, kernel q y ∂μ) := by
  letI : (ae μ).NeBot := ae_neBot.2 hμ
  refine ⟨convex_Ioi 0, ?_⟩
  intro x hx y hy hxy a b ha hb hab
  have hxypos : 0 < a*x+b*y := add_pos (mul_pos ha hx) (mul_pos hb hy)
  have hf := hI (a*x+b*y) hxypos
  have hg := ((hI x hx).const_mul a).add ((hI y hy).const_mul b)
  have hlt : ∀ᵐ q ∂μ, kernel q (a*x+b*y) < a*kernel q x+b*kernel q y := by
    filter_upwards [hpos] with q hq
    simpa only [smul_eq_mul] using (kernel_strictConvex q hq).2 hx hy hxy ha hb hab
  have hle : (fun q => kernel q (a*x+b*y)) ≤ᵐ[μ] (fun q => a*kernel q x+b*kernel q y) :=
    hlt.mono fun _ h => h.le
  have hi := integral_mono_ae hf hg hle
  have hne : (∫ q, kernel q (a*x+b*y) ∂μ) ≠ ∫ q, (a*kernel q x+b*kernel q y) ∂μ := by
    intro he
    have heq := (integral_eq_iff_of_ae_le hf hg hle).1 he
    obtain ⟨q, hqeq, hq⟩ := (heq.and hlt).exists
    exact (ne_of_lt hq) hqeq
  have hh := lt_of_le_of_ne hi hne
  change (∫ q, kernel q (a*x+b*y) ∂μ) < ∫ q, (a*kernel q x+b*kernel q y) ∂μ at hh
  rw [integral_add ((hI x hx).const_mul a) ((hI y hy).const_mul b), integral_const_mul, integral_const_mul] at hh
  simpa only [smul_eq_mul] using hh
end BesselWeights
