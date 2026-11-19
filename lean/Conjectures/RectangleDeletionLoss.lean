import Conjectures.RectangleLogBounds
import Mathlib.Analysis.SpecialFunctions.Pow.Asymptotics
import Mathlib.Order.Interval.Finset.Nat

/-! The cost of deleting small partition parts, with an explicit finite bound
and the elementary logarithm-versus-power limit used in the uniform estimate. -/

namespace RectanglePartitions

open Filter
open scoped Topology

theorem deletion_sum_nonneg (I : Finset ℕ) (T : ℕ → ℕ) :
    0 ≤ ∑ a ∈ I, ((a-1 : ℕ) : ℝ)*Real.log ((T a : ℝ)+1) := by
  apply Finset.sum_nonneg
  intro a _
  exact mul_nonneg (Nat.cast_nonneg _)
    (Real.log_nonneg (le_add_of_nonneg_left (Nat.cast_nonneg _)))

theorem deletion_sum_le (I : Finset ℕ) (K N : ℕ) (T : ℕ → ℕ)
    (hpos : ∀ a ∈ I, 1 ≤ a) (hcap : ∀ a ∈ I, a ≤ K)
    (hT : ∀ a ∈ I, T a ≤ N) :
    (∑ a ∈ I, ((a-1 : ℕ) : ℝ)*Real.log ((T a : ℝ)+1)) ≤
      (K : ℝ)^2*Real.log ((N : ℝ)+1) := by
  have hcard : I.card ≤ K := by
    calc
      I.card ≤ (Finset.Icc 1 K).card := Finset.card_le_card (by
        intro a ha
        exact Finset.mem_Icc.mpr ⟨hpos a ha,hcap a ha⟩)
      _ = K := by simp
  have hlog : 0 ≤ Real.log ((N : ℝ)+1) :=
    Real.log_nonneg (le_add_of_nonneg_left (Nat.cast_nonneg _))
  calc
    _ ≤ ∑ _a ∈ I, (K : ℝ)*Real.log ((N : ℝ)+1) := by
      apply Finset.sum_le_sum
      intro a ha
      have haK : ((a-1 : ℕ) : ℝ) ≤ K := by
        exact_mod_cast (Nat.sub_le a 1).trans (hcap a ha)
      have htlog : Real.log ((T a : ℝ)+1) ≤ Real.log ((N : ℝ)+1) := by
        apply Real.log_le_log (by positivity)
        have hTR : (T a : ℝ) ≤ (N : ℝ) := by exact_mod_cast hT a ha
        linarith
      exact mul_le_mul haK htlog
        (Real.log_nonneg (le_add_of_nonneg_left (Nat.cast_nonneg _))) (Nat.cast_nonneg K)
    _ = (I.card : ℝ)*((K : ℝ)*Real.log ((N : ℝ)+1)) := by simp
    _ ≤ (K : ℝ)*((K : ℝ)*Real.log ((N : ℝ)+1)) :=
      mul_le_mul_of_nonneg_right (by exact_mod_cast hcard)
        (mul_nonneg (Nat.cast_nonneg K) hlog)
    _ = _ := by ring

/-- A logarithmic deletion cost is negligible compared with every positive power. -/
theorem tendsto_log_add_one_div_rpow {ε : ℝ} (hε : 0 < ε) :
    Tendsto (fun N : ℝ => Real.log (N+1)/N^ε) atTop (𝓝 0) := by
  have hp := tendsto_rpow_atTop hε
  have hc := hp.const_div_atTop (Real.log 2)
  have hl := (isLittleO_log_rpow_atTop hε).tendsto_div_nhds_zero
  have hu : Tendsto (fun N : ℝ => (Real.log 2+Real.log N)/N^ε) atTop (𝓝 0) := by
    simpa only [add_div,zero_add] using hc.add hl
  apply squeeze_zero' ?_ ?_ hu
  · filter_upwards [eventually_ge_atTop (1 : ℝ)] with N hN
    exact div_nonneg (Real.log_nonneg (by linarith)) (Real.rpow_nonneg (by linarith) _)
  · filter_upwards [eventually_ge_atTop (1 : ℝ)] with N hN
    have hN0 : 0 < N := by linarith
    have hlog := Real.log_le_log (by linarith : 0 < N+1)
      (show N+1 ≤ 2*N by linarith)
    rw [Real.log_mul (by norm_num) (ne_of_gt hN0)] at hlog
    exact div_le_div_of_nonneg_right hlog (Real.rpow_nonneg hN0.le _)

theorem deletion_power_identity {N ε : ℝ} (hN : 0 < N) :
    N^((1/2 : ℝ)-ε)*Real.log (N+1) =
      (Real.log (N+1)/N^ε)*Real.sqrt N := by
  rw [Real.rpow_sub hN,Real.sqrt_eq_rpow]
  ring

end RectanglePartitions
