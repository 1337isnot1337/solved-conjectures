import Conjectures.BraunBrueggeBicyclicFiniteArithmetic

/-! Kernel checks at total lengths 139 through 143. -/

namespace BraunBruegge

set_option maxHeartbeats 0
set_option maxRecDepth 20000

private theorem mixedRow139 : checkMixedAtTotal 139 = true := by decide +kernel

private theorem mixedRow140 : checkMixedAtTotal 140 = true := by decide +kernel

private theorem mixedRow141 : checkMixedAtTotal 141 = true := by decide +kernel

private theorem mixedRow142 : checkMixedAtTotal 142 = true := by decide +kernel

private theorem mixedRow143 : checkMixedAtTotal 143 = true := by decide +kernel

theorem mixedRows139To143 (l : ℕ) (lo : 139 ≤ l) (hi : l ≤ 143) : checkMixedAtTotal l = true := by
  have h : l = 139 ∨ l = 140 ∨ l = 141 ∨ l = 142 ∨ l = 143 := by omega
  rcases h with rfl | rfl | rfl | rfl | rfl
  · exact mixedRow139
  · exact mixedRow140
  · exact mixedRow141
  · exact mixedRow142
  · exact mixedRow143

end BraunBruegge
