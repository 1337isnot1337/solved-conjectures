import Conjectures.LopezPousoSeguraBesselConstant
open Filter
open scoped Topology
namespace BesselWeights

theorem sourceWeightSum_tendsto (g : ℝ → ℝ) (err : ℕ → ℝ) (D : ℝ)
    (hD : Tendsto (fun n => ∑ k ∈ Finset.range n, err k) atTop (𝓝 D))
    (ha : ∀ n : ℕ, g (n+1)/4 = Real.pi^2/2*((n:ℝ)+3/4)+err n) :
    Tendsto (weightSum (sourceWeight g)) atTop atTop := by
  have htlin : Tendsto (fun n : ℕ => (n:ℝ)/8) atTop atTop := by
    have ht := (tendsto_natCast_atTop_atTop : Tendsto (fun n : ℕ => (n:ℝ)) atTop atTop).atTop_mul_const (show (0:ℝ)<1/8 by norm_num)
    simpa [div_eq_mul_inv] using ht
  have hp : Tendsto (fun n : ℕ => (n:ℝ)^2/4+n/8) atTop atTop := by
    apply tendsto_atTop_mono (f := fun n : ℕ => (n:ℝ)/8) _ htlin
    intro n
    nlinarith [sq_nonneg (n:ℝ)]
  have hpi := hp.const_mul_atTop (show 0 < Real.pi^2 by positivity)
  have hh := hpi.atTop_add hD
  apply hh.congr'
  filter_upwards with n
  simpa [weightSum,sourceWeight] using (sum_weight_expansion (fun n : ℕ => g (n+1)/4) err ha n).symm

theorem all_three_limits_from_source_asymptotics (g lam : ℝ → ℝ) (errA errL : ℕ → ℝ)
    (hgp : ∀ n : ℕ, 0 < g (n+1))
    (hA : Tendsto errA atTop (𝓝 0)) (hL : Tendsto errL atTop (𝓝 0))
    (hD : Tendsto (fun n => ∑ k ∈ Finset.range n, errA k) atTop (𝓝 (1/16-Real.pi^2/192)))
    (ha : ∀ n : ℕ, g (n+1)/4 = Real.pi^2/2*((n:ℝ)+3/4)+errA n)
    (hl : ∀ n : ℕ, lam (n+1) = Real.pi^2*((n:ℝ)+3/4)^2+1/4+errL n) :
    Tendsto (C g lam) atTop (𝓝 (Real.pi^2/12)) ∧
    Tendsto (E g lam) atTop (𝓝 (-(Real.pi^2)/6)) ∧
    Tendsto (sourceK g lam) atTop (𝓝 (Real.pi^2/12)) := by
  exact all_three_limits_from_deviations g lam errA errL hgp
    (sourceWeightSum_tendsto g errA _ hD ha) hA hL hD ha hl
end BesselWeights
