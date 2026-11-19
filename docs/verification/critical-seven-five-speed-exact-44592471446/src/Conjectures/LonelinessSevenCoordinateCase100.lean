import Conjectures.LonelinessSevenCoordinateFiniteBool

namespace Loneliness.SevenCoordinateCritical.Finite

set_option maxRecDepth 32768
set_option maxHeartbeats 0

/-! Each Boolean kernel check covers 144 assignments. The proved
checker interpretation assembles all 1,728 cases without a native premise. -/

private theorem checked_100_a0 : blockCheck 1 false false 0 = true := by
  decide +kernel

private theorem checked_100_a1 : blockCheck 1 false false 1 = true := by
  decide +kernel

private theorem checked_100_a2 : blockCheck 1 false false 2 = true := by
  decide +kernel

private theorem checked_100_a3 : blockCheck 1 false false 3 = true := by
  decide +kernel

private theorem checked_100_a4 : blockCheck 1 false false 4 = true := by
  decide +kernel

private theorem checked_100_a5 : blockCheck 1 false false 5 = true := by
  decide +kernel

private theorem checked_100_a6 : blockCheck 1 false false 6 = true := by
  decide +kernel

private theorem checked_100_a7 : blockCheck 1 false false 7 = true := by
  decide +kernel

private theorem checked_100_a8 : blockCheck 1 false false 8 = true := by
  decide +kernel

private theorem checked_100_a9 : blockCheck 1 false false 9 = true := by
  decide +kernel

private theorem checked_100_a10 : blockCheck 1 false false 10 = true := by
  decide +kernel

private theorem checked_100_a11 : blockCheck 1 false false 11 = true := by
  decide +kernel

theorem cases_100 : ∀ a b c : Fin 12, CaseValid 1 false false a b c := by
  intro a b c
  fin_cases a
  · exact blockCheck_sound 1 false false 0 checked_100_a0 b c
  · exact blockCheck_sound 1 false false 1 checked_100_a1 b c
  · exact blockCheck_sound 1 false false 2 checked_100_a2 b c
  · exact blockCheck_sound 1 false false 3 checked_100_a3 b c
  · exact blockCheck_sound 1 false false 4 checked_100_a4 b c
  · exact blockCheck_sound 1 false false 5 checked_100_a5 b c
  · exact blockCheck_sound 1 false false 6 checked_100_a6 b c
  · exact blockCheck_sound 1 false false 7 checked_100_a7 b c
  · exact blockCheck_sound 1 false false 8 checked_100_a8 b c
  · exact blockCheck_sound 1 false false 9 checked_100_a9 b c
  · exact blockCheck_sound 1 false false 10 checked_100_a10 b c
  · exact blockCheck_sound 1 false false 11 checked_100_a11 b c

end Loneliness.SevenCoordinateCritical.Finite
