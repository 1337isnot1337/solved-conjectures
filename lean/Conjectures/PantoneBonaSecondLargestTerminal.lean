import Conjectures.PantoneBonaTerminal
import Conjectures.PantoneBonaTerminalLimit
import Conjectures.PantoneBonaTerminalWalk
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic

/-! The normalized limit for the literal four-pattern class, conditional on
the binomial counting identity and the probabilistic front estimates. -/

namespace PantoneBonaTerminal

open Filter Finset
open scoped Topology

/-- The rank-three front permutations for the four-pattern problem. -/
noncomputable def fronts (m : ℕ) : Finset (Equiv.Perm (Fin m)) := by
  classical
  exact univ.filter (fun p => IsFront p 2)

/-- Values of entries that end an increasing triple in a front. -/
noncomputable def markerValues {m : ℕ} (p : Equiv.Perm (Fin m)) : Finset (Fin m) := by
  classical
  exact univ.filter (fun v => Reaches p 2 (p.symm v))

/-- The number of front values strictly between a marker and the next
marker. When there is no next marker, all larger front values are counted. -/
noncomputable def gapSize {m : ℕ} (M : Finset (Fin m)) (a : Fin m) : ℕ := by
  classical
  exact (univ.filter (fun b => a < b ∧ ∀ v ∈ M, a < v → b < v)).card

/-- The count of marker gaps of the specified size in a front. -/
noncomputable def gapCount {m : ℕ} (p : Equiv.Perm (Fin m)) (g : ℕ) : ℕ :=
  ((markerValues p).filter (fun a => gapSize (markerValues p) a = g)).card

/-- Expected marker-gap count divided by front length under the uniform law. -/
noncomputable def normalizedGapFrequency (m g : ℕ) : ℝ :=
  (∑ p ∈ fronts m, (gapCount p g : ℝ)) / ((fronts m).card * (m : ℝ))

/-- The expected number of length-`r` tails obtained from one front. -/
noncomputable def tailMass (m r : ℕ) : ℝ :=
  (m : ℝ) * gapMoment normalizedGapFrequency m r

/-- The stated leading amplitude for the literal `A₅,₄` count follows
from the exact binomial counting formula, Regev's front estimates, and the
fixed-gap and uniform gap estimates for the three-row model. -/
theorem countA54_limit_of_front_estimates {C D : ℝ} (B : ℕ)
    (hC : 0 ≤ C) (hD : 0 ≤ D)
    (hcount : ∀ n, (countA54 n : ℝ) = (fronts n).card +
      ∑ r ∈ range n, ((fronts (n - (r + 1))).card : ℝ) * tailMass (n - (r + 1)) (r + 1))
    (hRegev : Tendsto (fun m : ℕ => ((fronts m).card : ℝ) / 9 ^ m * (m : ℝ) ^ 4)
      atTop (𝓝 (81 * Real.sqrt 3 / (16 * Real.pi))))
    (hFrontBound : ∀ m, |((fronts m).card : ℝ) / 9 ^ m| ≤ C / ((m : ℝ) + 1) ^ 4)
    (hGapLimit : ∀ g, Tendsto (fun m => normalizedGapFrequency m g)
      atTop (𝓝 ((1 / 9) * (2 / 3) ^ g)))
    (hGapBound : ∀ m g, |normalizedGapFrequency m g| ≤ D * ((g : ℝ) + 1) ^ B * (2 / 3) ^ g) :
    Tendsto (fun n : ℕ => (countA54 n : ℝ) / 9 ^ n * (n : ℝ) ^ 3)
      atTop (𝓝 (27 * Real.sqrt 3 / (32 * Real.pi))) := by
  obtain ⟨K, hK, hKB⟩ := gapMoment_bound_width_three B hD hGapBound
  have hs (r : ℕ) : Tendsto (fun m : ℕ => tailMass m (r + 1) / (m : ℝ)) atTop (𝓝 (3 ^ r)) := by
    have hh := gapMoment_limit B (r + 1) (by norm_num : (0 : ℝ) < 2 / 3)
      (by norm_num) hD hGapBound hGapLimit
    have hval : (1 / 9 : ℝ) / (1 - 2 / 3) ^ (r + 1 + 1) = 3 ^ r := by
      rw [show (1 : ℝ) - 2 / 3 = 1 / 3 by norm_num,
        show r + 1 + 1 = r + 2 by omega, pow_add, div_pow]
      field_simp
      norm_num
    rw [hval] at hh
    apply hh.congr'
    filter_upwards [eventually_ge_atTop (1 : ℕ)] with m hm
    have hm₀ : (m : ℝ) ≠ 0 := by exact_mod_cast (by omega : m ≠ 0)
    rw [tailMass, mul_comm (m : ℝ), mul_div_cancel_right₀ _ hm₀]
  have hSB (m r : ℕ) : |tailMass m (r + 1)| ≤ K * (m : ℝ) * 4 ^ (r + 1) := by
    rw [tailMass, abs_mul, abs_of_nonneg (Nat.cast_nonneg _), mul_comm K, mul_assoc]
    exact mul_le_mul_of_nonneg_left (hKB m (r + 1)) (Nat.cast_nonneg _)
  have hh := count_limit_of_gap_estimates hC hK hcount hRegev hFrontBound hs hSB
  convert hh using 2
  ring

end PantoneBonaTerminal
