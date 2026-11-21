import Conjectures.LopezPousoSeguraBesselLimit
open Filter
open scoped Topology
namespace BesselWeights

theorem E_sub_C (g lam : ℝ → ℝ) (n : ℕ) :
    E g lam (n+1) - C g lam n = g (n+1)/4 - (lam (n+1+1)-lam (n+1))/4 := by
  unfold E C
  rw [Finset.sum_range_succ]
  push_cast
  ring

theorem E_tendsto_of_C_and_gap (g lam : ℝ → ℝ) (L D : ℝ)
    (hC : Tendsto (C g lam) atTop (𝓝 L))
    (hgap : Tendsto (fun n : ℕ => g (n+1)/4 - (lam (n+1+1)-lam (n+1))/4) atTop (𝓝 D)) :
    Tendsto (E g lam) atTop (𝓝 (L+D)) := by
  apply (tendsto_add_atTop_iff_nat 1).1
  have hh := hC.add hgap
  apply hh.congr'
  filter_upwards with n
  have he := E_sub_C g lam n
  linarith

theorem source_gap_tendsto (g lam errA errL : ℕ → ℝ)
    (hA : Tendsto errA atTop (𝓝 0)) (hL : Tendsto errL atTop (𝓝 0))
    (ha : ∀ n, g n = (Real.pi^2/2)*((n:ℝ)+3/4)+errA n)
    (hl : ∀ n, lam n = Real.pi^2*((n:ℝ)+3/4)^2+1/4+errL n) :
    Tendsto (fun n : ℕ => g n - (lam (n+1)-lam n)/4) atTop (𝓝 (-(Real.pi^2)/4)) := by
  have hshift := hL.comp (tendsto_add_atTop_nat 1)
  have hh := hA.sub ((hshift.sub hL).div_const 4)
  have hconst : Tendsto (fun _ : ℕ => -(Real.pi^2)/4) atTop (𝓝 (-(Real.pi^2)/4)) := tendsto_const_nhds
  have hh' := hconst.add hh
  have h : Tendsto (fun n : ℕ => -(Real.pi^2)/4 + (errA n - (errL (n+1)-errL n)/4)) atTop (𝓝 (-(Real.pi^2)/4)) := by
    simpa using hh'
  apply h.congr'
  filter_upwards with n
  rw [ha, hl, hl]
  push_cast
  ring

theorem sourceE_limit_from_asymptotics (g lam : ℝ → ℝ) (errA errL : ℕ → ℝ)
    (hC : Tendsto (C g lam) atTop (𝓝 (Real.pi^2/12)))
    (hA : Tendsto errA atTop (𝓝 0)) (hL : Tendsto errL atTop (𝓝 0))
    (ha : ∀ n : ℕ, g (n+1)/4 = (Real.pi^2/2)*((n:ℝ)+3/4)+errA n)
    (hl : ∀ n : ℕ, lam (n+1) = Real.pi^2*((n:ℝ)+3/4)^2+1/4+errL n) :
    Tendsto (E g lam) atTop (𝓝 (-(Real.pi^2)/6)) := by
  have hgap := source_gap_tendsto (fun n : ℕ => g (n+1)/4) (fun n : ℕ => lam (n+1)) errA errL hA hL ha hl
  have hgap' : Tendsto (fun n : ℕ => g (n+1)/4-(lam (n+1+1)-lam (n+1))/4) atTop (𝓝 (-(Real.pi^2)/4)) := by
    apply hgap.congr'
    filter_upwards with n
    push_cast
    congr 2 <;> ring
  have hh := E_tendsto_of_C_and_gap g lam (Real.pi^2/12) (-(Real.pi^2)/4) hC hgap'
  convert hh using 1 <;> ring
end BesselWeights
