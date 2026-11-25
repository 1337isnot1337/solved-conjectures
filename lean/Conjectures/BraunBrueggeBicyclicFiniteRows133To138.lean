import Conjectures.BraunBrueggeBicyclicFiniteArithmetic

/-! Kernel checks at total lengths 133 through 138. -/

namespace BraunBruegge

set_option maxHeartbeats 0
set_option maxRecDepth 20000

private theorem mixedRow133 : checkMixedAtTotal 133 = true := by decide +kernel

private theorem mixedRow134 : checkMixedAtTotal 134 = true := by decide +kernel

private theorem mixedRow135 : checkMixedAtTotal 135 = true := by decide +kernel

private theorem mixedRow136 : checkMixedAtTotal 136 = true := by decide +kernel

private theorem mixedRow137 : checkMixedAtTotal 137 = true := by decide +kernel

private theorem mixedRow138 : checkMixedAtTotal 138 = true := by decide +kernel

theorem mixedRows133To138 (l : ℕ) (lo : 133 ≤ l) (hi : l ≤ 138) : checkMixedAtTotal l = true := by
  have h : l = 133 ∨ l = 134 ∨ l = 135 ∨ l = 136 ∨ l = 137 ∨ l = 138 := by omega
  rcases h with rfl | rfl | rfl | rfl | rfl | rfl
  · exact mixedRow133
  · exact mixedRow134
  · exact mixedRow135
  · exact mixedRow136
  · exact mixedRow137
  · exact mixedRow138

end BraunBruegge
