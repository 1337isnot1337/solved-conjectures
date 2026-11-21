import Conjectures.LopezPousoSeguraBesselScaled
import Mathlib.Analysis.PSeries
open Filter
open scoped Topology
namespace BesselWeights

theorem deviation_summable_of_cubic_bound (δ : ℕ → ℝ) (C : ℝ)
    (h : ∀ᶠ n in atTop, ‖δ n‖ ≤ C / ((n:ℝ)+1)^3) : Summable δ := by
  have hp : Summable (fun n : ℕ => (1:ℝ)/((n:ℝ)+1)^3) := by
    have hh := (Real.summable_one_div_nat_pow.mpr (show 1 < 3 by norm_num)).comp_injective Nat.succ_injective
    simpa [Function.comp_def, Nat.cast_succ] using hh
  have hb : Summable (fun n : ℕ => C/((n:ℝ)+1)^3) := by
    have hh := hp.mul_left C
    simpa [div_eq_mul_inv] using hh
  exact hb.of_norm_bounded_eventually_nat h

theorem scaled_deviation_of_cubic_bound (δ ell : ℕ → ℝ) (s : ℕ → ℝ) (C : ℝ)
    (h : ∀ᶠ n in atTop, ‖δ n‖ ≤ C / ((n:ℝ)+1)^3)
    (hell : ∀ k, 0 ≤ ell k) (hs : Tendsto s atTop atTop) :
    Tendsto (fun n => (s n)^4 * ∑' k, δ k / (ell k + (s n)^2)^2) atTop (𝓝 (∑' k, δ k)) :=
  deviation_scaled_resolvent δ ell s (deviation_summable_of_cubic_bound δ C h) hell hs

theorem all_three_limits_from_cubic_deviation (g lam : ℝ → ℝ) (errA errL : ℕ → ℝ) (B : ℝ)
    (hgp : ∀ n : ℕ, 0 < g (n+1))
    (hA : Tendsto errA atTop (𝓝 0)) (hL : Tendsto errL atTop (𝓝 0))
    (hbound : ∀ᶠ n in atTop, ‖errA n‖ ≤ B/((n:ℝ)+1)^3)
    (hvalue : (∑' n, errA n) = 1/16-Real.pi^2/192)
    (ha : ∀ n : ℕ, g (n+1)/4 = Real.pi^2/2*((n:ℝ)+3/4)+errA n)
    (hl : ∀ n : ℕ, lam (n+1) = Real.pi^2*((n:ℝ)+3/4)^2+1/4+errL n) :
    Tendsto (C g lam) atTop (𝓝 (Real.pi^2/12)) ∧
    Tendsto (E g lam) atTop (𝓝 (-(Real.pi^2)/6)) ∧
    Tendsto (sourceK g lam) atTop (𝓝 (Real.pi^2/12)) := by
  have hsum := (deviation_summable_of_cubic_bound errA B hbound).hasSum.tendsto_sum_nat
  rw [hvalue] at hsum
  exact all_three_limits_from_source_asymptotics g lam errA errL hgp hA hL hsum ha hl
end BesselWeights
