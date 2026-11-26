import Conjectures.BraunBrueggeBicyclicFiniteArithmetic

/-! Kernel checks at total lengths 109 through 117. -/

namespace BraunBruegge

set_option maxHeartbeats 0
set_option maxRecDepth 20000

private theorem mixedRow109 : checkMixedAtTotal 109 = true := by decide +kernel

private theorem mixedRow110 : checkMixedAtTotal 110 = true := by decide +kernel

private theorem mixedRow111 : checkMixedAtTotal 111 = true := by decide +kernel

private theorem mixedRow112 : checkMixedAtTotal 112 = true := by decide +kernel

private theorem mixedRow113 : checkMixedAtTotal 113 = true := by decide +kernel

private theorem mixedRow114 : checkMixedAtTotal 114 = true := by decide +kernel

private theorem mixedRow115 : checkMixedAtTotal 115 = true := by decide +kernel

private theorem mixedRow116 : checkMixedAtTotal 116 = true := by decide +kernel

private theorem mixedRow117 : checkMixedAtTotal 117 = true := by decide +kernel

theorem mixedRows109To117 (l : ℕ) (lo : 109 ≤ l) (hi : l ≤ 117) : checkMixedAtTotal l = true := by
  have h : l = 109 ∨ l = 110 ∨ l = 111 ∨ l = 112 ∨ l = 113 ∨ l = 114 ∨ l = 115 ∨ l = 116 ∨ l = 117 := by omega
  rcases h with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact mixedRow109
  · exact mixedRow110
  · exact mixedRow111
  · exact mixedRow112
  · exact mixedRow113
  · exact mixedRow114
  · exact mixedRow115
  · exact mixedRow116
  · exact mixedRow117

end BraunBruegge
