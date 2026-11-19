import Conjectures.LonelinessFourSpeedClassificationFinite
import Conjectures.LonelinessFourSpeedCutoff
import Conjectures.LonelinessExamples
import Conjectures.LonelinessPairBridge

/-! The all-size four-speed gap theorem. The finite classification and the
independent pigeonhole cutoff discharge both inputs to the scaling adapter. -/

namespace Loneliness.CoordinateSubspace

theorem four_speed_gap : FourSpeedGap :=
  four_speed_gap_of_cutoff Pigeonhole.four_speed_cutoff

theorem four_speed_below_gap_value (ds : List ℕ) (hlen : ds.length = 4)
    (hnodup : ds.Nodup) (hpositive : ∀ a ∈ ds, 0 < a)
    (hbelow : value ds < (2 / 9 : ℝ)) : value ds = (1 / 5 : ℝ) := by
  obtain ⟨d, hd, hfirst | hsecond⟩ := four_speed_gap ds hlen hnodup hpositive hbelow
  · rw [CriticalFamilies.value_perm hfirst,
      Normalization.value_scale _ d (by omega)]
    exact PairSum.Examples.four_consecutive.value_eq
  · rw [CriticalFamilies.value_perm hsecond,
      Normalization.value_scale _ d (by omega)]
    exact PairSum.Examples.four_other_critical.value_eq

/-- The four-speed lower bound is a consequence of the complete gap theorem
and the already verified one-, two-, and three-speed cases. -/
theorem four_speed_lonelyRunnerBound : LonelyRunnerBound 4 := by
  intro ds hne hnodup hlen hpositive
  norm_num
  by_cases hsmall : ds.length ≤ 3
  · have h := SmallRunner.lonelyRunnerBound 3 (by decide)
      ds hne hnodup hsmall hpositive
    norm_num at h
    linarith
  have hfour : ds.length = 4 := by omega
  by_cases hbelow : value ds < (2 / 9 : ℝ)
  · rw [four_speed_below_gap_value ds hfour hnodup hpositive hbelow]
  · linarith

end Loneliness.CoordinateSubspace
