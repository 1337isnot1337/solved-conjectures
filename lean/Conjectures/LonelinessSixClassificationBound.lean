import Conjectures.LonelinessSevenCoordinateDirections
import Conjectures.LonelinessConsecutive

/-! The primitive six-speed classification already supplies the six-speed
runner lower bound once the bound for at most five speeds is available.
No additional plane theorem or finite-search premise is required. -/

namespace Loneliness.SevenCoordinateCritical

open CoordinateSubspace

theorem lonelyRunnerBound_six_of_classification
    (hfive : LonelyRunnerBound 5) (hsix : PrimitiveSixClassification) :
    LonelyRunnerBound 6 := by
  intro ds hnonempty hnodup hlength hpositive
  change (1/7 : ℝ) ≤ value ds
  by_cases hsmall : ds.length ≤ 5
  · have hlower := hfive ds hnonempty hnodup hsmall hpositive
    norm_num at hlower
    linarith
  · have hlength6 : ds.length = 6 := by omega
    by_contra hn
    have hbelow : value ds < (1/7 : ℝ) := lt_of_not_ge hn
    have hnormalized : (Normalization.normalize ds).Perm sixBase := by
      apply hsix
      · simpa only [Normalization.normalize_length] using hlength6
      · exact Normalization.normalize_nodup hnodup
      · exact Normalization.normalize_positive ds hpositive
      · exact Normalization.normalize_primitive ds hnonempty hpositive
      · rw [Normalization.value_normalize ds hnonempty hpositive]
        exact hbelow.le
    have hvalue : value ds = (1/7 : ℝ) := by
      calc
        value ds = value (Normalization.normalize ds) :=
          (Normalization.value_normalize ds hnonempty hpositive).symm
        _ = value sixBase := CriticalFamilies.value_perm hnormalized
        _ = (1/7 : ℝ) := by
          simpa [sixBase, List.range'] using consecutive_value 6 (by decide)
    rw [hvalue] at hbelow
    exact (lt_irrefl (1/7 : ℝ)) hbelow

end Loneliness.SevenCoordinateCritical
