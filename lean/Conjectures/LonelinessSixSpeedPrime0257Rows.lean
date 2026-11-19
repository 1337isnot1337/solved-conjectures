import Conjectures.LonelinessSixSpeedFiniteSound
import Mathlib.Data.Fin.VecNotation
import Mathlib.Tactic.FinCases

/-!
# Actual retained rows for the prime-257 minimum-pair-two pilot

These are the three six-element folded dilations of the consecutive speeds
which the pilot retains. The facts below verify the complete existing
`Row.Valid 257` predicate, including the short-direction inequality.
No initial-support coverage or complete-prime assertion is made here.
-/

namespace Loneliness.Modular.SixSpeed.Prime0257

def rows : Fin 3 → Row :=
  ![⟨![1, 2, 3, 4, 5, 6], 1⟩,
    ⟨![1, 2, 3, 126, 127, 128], 2⟩,
    ⟨![1, 2, 84, 85, 86, 87], 3⟩]

theorem row0_valid : (rows 0).Valid 257 := by
  decide +kernel

theorem row1_valid : (rows 1).Valid 257 := by
  decide +kernel

theorem row2_valid : (rows 2).Valid 257 := by
  decide +kernel

theorem rows_valid (i : Fin 3) : (rows i).Valid 257 := by
  fin_cases i
  · exact row0_valid
  · exact row1_valid
  · exact row2_valid

theorem terminal_sound :
    ∀ s index, SixSpeed.terminal rows s index = true → Retained rows s :=
  SixSpeed.terminal_sound rows

end Loneliness.Modular.SixSpeed.Prime0257
