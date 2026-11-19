import Conjectures.LonelinessSevenCoordinateFiniteBool

namespace Loneliness.SevenCoordinateCritical.Finite

set_option maxRecDepth 32768
set_option maxHeartbeats 0

/-! Each Boolean kernel check covers 144 assignments. The proved
checker interpretation assembles all 1,728 cases without a native premise. -/

private theorem checked_210_a0 : blockCheck 2 true false 0 = true := by
  decide +kernel

private theorem checked_210_a1 : blockCheck 2 true false 1 = true := by
  decide +kernel

private theorem checked_210_a2 : blockCheck 2 true false 2 = true := by
  decide +kernel

private theorem checked_210_a3 : blockCheck 2 true false 3 = true := by
  decide +kernel

private theorem checked_210_a4 : blockCheck 2 true false 4 = true := by
  decide +kernel

private theorem checked_210_a5 : blockCheck 2 true false 5 = true := by
  decide +kernel

private theorem checked_210_a6 : blockCheck 2 true false 6 = true := by
  decide +kernel

private theorem checked_210_a7 : blockCheck 2 true false 7 = true := by
  decide +kernel

private theorem checked_210_a8 : blockCheck 2 true false 8 = true := by
  decide +kernel

private theorem checked_210_a9 : blockCheck 2 true false 9 = true := by
  decide +kernel

private theorem checked_210_a10 : blockCheck 2 true false 10 = true := by
  decide +kernel

private theorem checked_210_a11 : blockCheck 2 true false 11 = true := by
  decide +kernel

theorem cases_210 : ∀ a b c : Fin 12, CaseValid 2 true false a b c := by
  intro a b c
  fin_cases a
  · exact blockCheck_sound 2 true false 0 checked_210_a0 b c
  · exact blockCheck_sound 2 true false 1 checked_210_a1 b c
  · exact blockCheck_sound 2 true false 2 checked_210_a2 b c
  · exact blockCheck_sound 2 true false 3 checked_210_a3 b c
  · exact blockCheck_sound 2 true false 4 checked_210_a4 b c
  · exact blockCheck_sound 2 true false 5 checked_210_a5 b c
  · exact blockCheck_sound 2 true false 6 checked_210_a6 b c
  · exact blockCheck_sound 2 true false 7 checked_210_a7 b c
  · exact blockCheck_sound 2 true false 8 checked_210_a8 b c
  · exact blockCheck_sound 2 true false 9 checked_210_a9 b c
  · exact blockCheck_sound 2 true false 10 checked_210_a10 b c
  · exact blockCheck_sound 2 true false 11 checked_210_a11 b c

end Loneliness.SevenCoordinateCritical.Finite
