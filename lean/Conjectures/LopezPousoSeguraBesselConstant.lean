import Conjectures.LopezPousoSeguraBesselGap
open Filter
open scoped Topology
namespace BesselWeights

theorem sum_weight_expansion (a err : ℕ → ℝ)
    (ha : ∀ n, a n = Real.pi^2/2*((n:ℝ)+3/4)+err n) :
    ∀ n, (∑ k ∈ Finset.range n, a k) = Real.pi^2*((n:ℝ)^2/4+n/8) + ∑ k ∈ Finset.range n, err k := by
  intro n
  induction n with
  | zero => simp
  | succ n ih =>
    rw [Finset.sum_range_succ, Finset.sum_range_succ, ih, ha n]
    push_cast
    ring

theorem sourceC_limit_from_deviations (g lam : ℝ → ℝ) (errA errL : ℕ → ℝ)
    (hA : Tendsto errA atTop (𝓝 0)) (hL : Tendsto errL atTop (𝓝 0))
    (hD : Tendsto (fun n => ∑ k ∈ Finset.range n, errA k) atTop (𝓝 (1/16-Real.pi^2/192)))
    (ha : ∀ n : ℕ, g (n+1)/4 = Real.pi^2/2*((n:ℝ)+3/4)+errA n)
    (hl : ∀ n : ℕ, lam (n+1) = Real.pi^2*((n:ℝ)+3/4)^2+1/4+errL n) :
    Tendsto (C g lam) atTop (𝓝 (Real.pi^2/12)) := by
  have hsum := sum_weight_expansion (fun n : ℕ => g (n+1)/4) errA ha
  have hconst : Tendsto (fun _ : ℕ => 3*Real.pi^2/32-1/8) atTop (𝓝 (3*Real.pi^2/32-1/8)) := tendsto_const_nhds
  have htwo := hD.const_mul 2
  have hhalf := hL.div_const 2
  have hh := ((htwo.add hA).sub hhalf).add hconst
  have he : (2*(1/16-Real.pi^2/192)+0-0/2)+(3*Real.pi^2/32-1/8) = Real.pi^2/12 := by ring
  rw [he] at hh
  apply hh.congr'
  filter_upwards with n
  have hc := C_source_formula g lam n
  rw [hsum n, ha n, hl n] at hc
  linarith

theorem all_three_limits_from_deviations (g lam : ℝ → ℝ) (errA errL : ℕ → ℝ)
    (hgp : ∀ n : ℕ, 0 < g (n+1))
    (hS : Tendsto (weightSum (sourceWeight g)) atTop atTop)
    (hA : Tendsto errA atTop (𝓝 0)) (hL : Tendsto errL atTop (𝓝 0))
    (hD : Tendsto (fun n => ∑ k ∈ Finset.range n, errA k) atTop (𝓝 (1/16-Real.pi^2/192)))
    (ha : ∀ n : ℕ, g (n+1)/4 = Real.pi^2/2*((n:ℝ)+3/4)+errA n)
    (hl : ∀ n : ℕ, lam (n+1) = Real.pi^2*((n:ℝ)+3/4)^2+1/4+errL n) :
    Tendsto (C g lam) atTop (𝓝 (Real.pi^2/12)) ∧
    Tendsto (E g lam) atTop (𝓝 (-(Real.pi^2)/6)) ∧
    Tendsto (sourceK g lam) atTop (𝓝 (Real.pi^2/12)) := by
  have hc := sourceC_limit_from_deviations g lam errA errL hA hL hD ha hl
  exact ⟨hc, sourceE_limit_from_asymptotics g lam errA errL hc hA hL ha hl,
    sourceK_tendsto_of_C g lam _ hgp hc hS⟩
end BesselWeights
