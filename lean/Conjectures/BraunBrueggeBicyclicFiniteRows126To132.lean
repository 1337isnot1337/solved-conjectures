import Conjectures.BraunBrueggeBicyclicFiniteArithmetic

/-! Kernel checks at total lengths 126 through 132. -/

namespace BraunBruegge

set_option maxHeartbeats 0
set_option maxRecDepth 20000

private theorem mixedRow126 : checkMixedAtTotal 126 = true := by decide +kernel

private theorem mixedRow127 : checkMixedAtTotal 127 = true := by decide +kernel

private theorem mixedRow128 : checkMixedAtTotal 128 = true := by decide +kernel

private theorem mixedRow129 : checkMixedAtTotal 129 = true := by decide +kernel

private theorem mixedRow130 : checkMixedAtTotal 130 = true := by decide +kernel

private theorem mixedRow131 : checkMixedAtTotal 131 = true := by decide +kernel

private theorem mixedRow132 : checkMixedAtTotal 132 = true := by decide +kernel

theorem mixedRows126To132 (l : ℕ) (lo : 126 ≤ l) (hi : l ≤ 132) : checkMixedAtTotal l = true := by
  have h : l = 126 ∨ l = 127 ∨ l = 128 ∨ l = 129 ∨ l = 130 ∨ l = 131 ∨ l = 132 := by omega
  rcases h with rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact mixedRow126
  · exact mixedRow127
  · exact mixedRow128
  · exact mixedRow129
  · exact mixedRow130
  · exact mixedRow131
  · exact mixedRow132

end BraunBruegge
