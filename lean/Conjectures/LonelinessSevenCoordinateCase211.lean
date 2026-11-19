import Conjectures.LonelinessSevenCoordinateFiniteBool

namespace Loneliness.SevenCoordinateCritical.Finite

set_option maxRecDepth 32768
set_option maxHeartbeats 0

/-! Each Boolean kernel check covers 144 assignments. The proved
checker interpretation assembles all 1,728 cases without a native premise. -/

private theorem checked_211_a0 : blockCheck 2 true true 0 = true := by
  decide +kernel

private theorem checked_211_a1 : blockCheck 2 true true 1 = true := by
  decide +kernel

private theorem checked_211_a2 : blockCheck 2 true true 2 = true := by
  decide +kernel

private theorem checked_211_a3 : blockCheck 2 true true 3 = true := by
  decide +kernel

private theorem checked_211_a4 : blockCheck 2 true true 4 = true := by
  decide +kernel

private theorem checked_211_a5 : blockCheck 2 true true 5 = true := by
  decide +kernel

private theorem checked_211_a6 : blockCheck 2 true true 6 = true := by
  decide +kernel

private theorem checked_211_a7 : blockCheck 2 true true 7 = true := by
  decide +kernel

private theorem checked_211_a8 : blockCheck 2 true true 8 = true := by
  decide +kernel

private theorem checked_211_a9 : blockCheck 2 true true 9 = true := by
  decide +kernel

private theorem checked_211_a10 : blockCheck 2 true true 10 = true := by
  decide +kernel

private theorem checked_211_a11 : blockCheck 2 true true 11 = true := by
  decide +kernel

theorem cases_211 : ∀ a b c : Fin 12, CaseValid 2 true true a b c := by
  intro a b c
  fin_cases a
  · exact blockCheck_sound 2 true true 0 checked_211_a0 b c
  · exact blockCheck_sound 2 true true 1 checked_211_a1 b c
  · exact blockCheck_sound 2 true true 2 checked_211_a2 b c
  · exact blockCheck_sound 2 true true 3 checked_211_a3 b c
  · exact blockCheck_sound 2 true true 4 checked_211_a4 b c
  · exact blockCheck_sound 2 true true 5 checked_211_a5 b c
  · exact blockCheck_sound 2 true true 6 checked_211_a6 b c
  · exact blockCheck_sound 2 true true 7 checked_211_a7 b c
  · exact blockCheck_sound 2 true true 8 checked_211_a8 b c
  · exact blockCheck_sound 2 true true 9 checked_211_a9 b c
  · exact blockCheck_sound 2 true true 10 checked_211_a10 b c
  · exact blockCheck_sound 2 true true 11 checked_211_a11 b c

end Loneliness.SevenCoordinateCritical.Finite
