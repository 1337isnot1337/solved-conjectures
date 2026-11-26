import Conjectures.BraunBrueggeBicyclicFiniteArithmetic

/-! Kernel checks at total lengths 45 through 59. -/

namespace BraunBruegge

set_option maxHeartbeats 0
set_option maxRecDepth 20000

private theorem mixedRow45 : checkMixedAtTotal 45 = true := by decide +kernel

private theorem mixedRow46 : checkMixedAtTotal 46 = true := by decide +kernel

private theorem mixedRow47 : checkMixedAtTotal 47 = true := by decide +kernel

private theorem mixedRow48 : checkMixedAtTotal 48 = true := by decide +kernel

private theorem mixedRow49 : checkMixedAtTotal 49 = true := by decide +kernel

private theorem mixedRow50 : checkMixedAtTotal 50 = true := by decide +kernel

private theorem mixedRow51 : checkMixedAtTotal 51 = true := by decide +kernel

private theorem mixedRow52 : checkMixedAtTotal 52 = true := by decide +kernel

private theorem mixedRow53 : checkMixedAtTotal 53 = true := by decide +kernel

private theorem mixedRow54 : checkMixedAtTotal 54 = true := by decide +kernel

private theorem mixedRow55 : checkMixedAtTotal 55 = true := by decide +kernel

private theorem mixedRow56 : checkMixedAtTotal 56 = true := by decide +kernel

private theorem mixedRow57 : checkMixedAtTotal 57 = true := by decide +kernel

private theorem mixedRow58 : checkMixedAtTotal 58 = true := by decide +kernel

private theorem mixedRow59 : checkMixedAtTotal 59 = true := by decide +kernel

theorem mixedRows045To059 (l : ℕ) (lo : 45 ≤ l) (hi : l ≤ 59) : checkMixedAtTotal l = true := by
  have h : l = 45 ∨ l = 46 ∨ l = 47 ∨ l = 48 ∨ l = 49 ∨ l = 50 ∨ l = 51 ∨ l = 52 ∨ l = 53 ∨ l = 54 ∨ l = 55 ∨ l = 56 ∨ l = 57 ∨ l = 58 ∨ l = 59 := by omega
  rcases h with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact mixedRow45
  · exact mixedRow46
  · exact mixedRow47
  · exact mixedRow48
  · exact mixedRow49
  · exact mixedRow50
  · exact mixedRow51
  · exact mixedRow52
  · exact mixedRow53
  · exact mixedRow54
  · exact mixedRow55
  · exact mixedRow56
  · exact mixedRow57
  · exact mixedRow58
  · exact mixedRow59

end BraunBruegge
