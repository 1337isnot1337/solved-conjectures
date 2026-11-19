import Conjectures.LonelinessSixPlaneDataDefs
import Mathlib.Tactic.FinCases

namespace Loneliness.SixPlane.Data

set_option maxRecDepth 100000 in
theorem pair_05_00_00 : partialCheck 5 0 0 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_05_00_01 : partialCheck 5 0 40 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_05_00_02 : partialCheck 5 0 80 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_05_00_03 : partialCheck 5 0 120 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_05_00_04 : partialCheck 5 0 160 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_05_00_05 : partialCheck 5 0 200 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_05_00_06 : partialCheck 5 0 240 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_05_00_07 : partialCheck 5 0 280 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_05_00_08 : partialCheck 5 0 320 40 = true := by
  decide +kernel

theorem pair_cases_05_00 (block : Fin 9) :
    partialCheck 5 0 (block.val * 40) 40 = true := by
  fin_cases block
  · exact pair_05_00_00
  · exact pair_05_00_01
  · exact pair_05_00_02
  · exact pair_05_00_03
  · exact pair_05_00_04
  · exact pair_05_00_05
  · exact pair_05_00_06
  · exact pair_05_00_07
  · exact pair_05_00_08

end Loneliness.SixPlane.Data
