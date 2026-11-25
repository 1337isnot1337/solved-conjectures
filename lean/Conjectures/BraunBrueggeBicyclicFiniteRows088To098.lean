import Conjectures.BraunBrueggeBicyclicFiniteArithmetic

/-! Kernel checks at total lengths 88 through 98. -/

namespace BraunBruegge

set_option maxHeartbeats 0
set_option maxRecDepth 20000

private theorem mixedRow88 : checkMixedAtTotal 88 = true := by decide +kernel

private theorem mixedRow89 : checkMixedAtTotal 89 = true := by decide +kernel

private theorem mixedRow90 : checkMixedAtTotal 90 = true := by decide +kernel

private theorem mixedRow91 : checkMixedAtTotal 91 = true := by decide +kernel

private theorem mixedRow92 : checkMixedAtTotal 92 = true := by decide +kernel

private theorem mixedRow93 : checkMixedAtTotal 93 = true := by decide +kernel

private theorem mixedRow94 : checkMixedAtTotal 94 = true := by decide +kernel

private theorem mixedRow95 : checkMixedAtTotal 95 = true := by decide +kernel

private theorem mixedRow96 : checkMixedAtTotal 96 = true := by decide +kernel

private theorem mixedRow97 : checkMixedAtTotal 97 = true := by decide +kernel

private theorem mixedRow98 : checkMixedAtTotal 98 = true := by decide +kernel

theorem mixedRows088To098 (l : ℕ) (lo : 88 ≤ l) (hi : l ≤ 98) : checkMixedAtTotal l = true := by
  have h : l = 88 ∨ l = 89 ∨ l = 90 ∨ l = 91 ∨ l = 92 ∨ l = 93 ∨ l = 94 ∨ l = 95 ∨ l = 96 ∨ l = 97 ∨ l = 98 := by omega
  rcases h with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact mixedRow88
  · exact mixedRow89
  · exact mixedRow90
  · exact mixedRow91
  · exact mixedRow92
  · exact mixedRow93
  · exact mixedRow94
  · exact mixedRow95
  · exact mixedRow96
  · exact mixedRow97
  · exact mixedRow98

end BraunBruegge
