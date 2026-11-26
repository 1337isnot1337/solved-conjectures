import Conjectures.BraunBrueggeBicyclicFiniteArithmetic

/-! Kernel checks at total lengths 25 through 44. -/

namespace BraunBruegge

set_option maxHeartbeats 0
set_option maxRecDepth 20000

private theorem mixedRow25 : checkMixedAtTotal 25 = true := by decide +kernel

private theorem mixedRow26 : checkMixedAtTotal 26 = true := by decide +kernel

private theorem mixedRow27 : checkMixedAtTotal 27 = true := by decide +kernel

private theorem mixedRow28 : checkMixedAtTotal 28 = true := by decide +kernel

private theorem mixedRow29 : checkMixedAtTotal 29 = true := by decide +kernel

private theorem mixedRow30 : checkMixedAtTotal 30 = true := by decide +kernel

private theorem mixedRow31 : checkMixedAtTotal 31 = true := by decide +kernel

private theorem mixedRow32 : checkMixedAtTotal 32 = true := by decide +kernel

private theorem mixedRow33 : checkMixedAtTotal 33 = true := by decide +kernel

private theorem mixedRow34 : checkMixedAtTotal 34 = true := by decide +kernel

private theorem mixedRow35 : checkMixedAtTotal 35 = true := by decide +kernel

private theorem mixedRow36 : checkMixedAtTotal 36 = true := by decide +kernel

private theorem mixedRow37 : checkMixedAtTotal 37 = true := by decide +kernel

private theorem mixedRow38 : checkMixedAtTotal 38 = true := by decide +kernel

private theorem mixedRow39 : checkMixedAtTotal 39 = true := by decide +kernel

private theorem mixedRow40 : checkMixedAtTotal 40 = true := by decide +kernel

private theorem mixedRow41 : checkMixedAtTotal 41 = true := by decide +kernel

private theorem mixedRow42 : checkMixedAtTotal 42 = true := by decide +kernel

private theorem mixedRow43 : checkMixedAtTotal 43 = true := by decide +kernel

private theorem mixedRow44 : checkMixedAtTotal 44 = true := by decide +kernel

theorem mixedRows025To044 (l : ℕ) (lo : 25 ≤ l) (hi : l ≤ 44) : checkMixedAtTotal l = true := by
  have h : l = 25 ∨ l = 26 ∨ l = 27 ∨ l = 28 ∨ l = 29 ∨ l = 30 ∨ l = 31 ∨ l = 32 ∨ l = 33 ∨ l = 34 ∨ l = 35 ∨ l = 36 ∨ l = 37 ∨ l = 38 ∨ l = 39 ∨ l = 40 ∨ l = 41 ∨ l = 42 ∨ l = 43 ∨ l = 44 := by omega
  rcases h with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact mixedRow25
  · exact mixedRow26
  · exact mixedRow27
  · exact mixedRow28
  · exact mixedRow29
  · exact mixedRow30
  · exact mixedRow31
  · exact mixedRow32
  · exact mixedRow33
  · exact mixedRow34
  · exact mixedRow35
  · exact mixedRow36
  · exact mixedRow37
  · exact mixedRow38
  · exact mixedRow39
  · exact mixedRow40
  · exact mixedRow41
  · exact mixedRow42
  · exact mixedRow43
  · exact mixedRow44

end BraunBruegge
