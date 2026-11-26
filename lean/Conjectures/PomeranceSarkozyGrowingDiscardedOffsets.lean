module
public import Conjectures.PomeranceSarkozyDiscardedOffsets
public import Conjectures.PomeranceSarkozyGrowingCutoffs
import Conjectures.PomeranceSarkozyMertensRemainder
import Mathlib.Tactic.Linarith

@[expose] public section
namespace PomeranceSarkozy

open Filter
open scoped Topology

/-- Offsets beyond the growing cutoff contribute with vanishing probability
under the literal uniform sample from `ceil (sqrt X)` to `X`. -/
theorem growing_discarded_offset_probability :
    Tendsto (fun X => discardedOffsetProbability X (psH X)) atTop (𝓝 0) := by
  apply discardedOffsetProbability_tendsto psL psH psL_tendsto
  · obtain ⟨B, hB⟩ := primeReciprocalSum_logLog_bounded
    filter_upwards [eventually_ge_atTop (2 : ℕ), psL_tendsto.eventually_ge_atTop B] with X hX hLX
    have hX' : (2 : ℝ) ≤ X := by exact_mod_cast hX
    have hmass := (abs_le.mp (hB (X : ℝ) hX')).2
    change primeReciprocalSum (X : ℝ) - psL X ≤ B at hmass
    rw [discardedOffsetPrimeMass_eq_sum]
    simpa [primeReciprocalSum] using (show primeReciprocalSum (X : ℝ) ≤ 2 * psL X by linarith)
  · exact Eventually.of_forall fun X => (Nat.lt_floor_add_one (10 * psL X)).le

end PomeranceSarkozy
