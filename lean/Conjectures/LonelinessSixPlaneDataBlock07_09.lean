import Conjectures.LonelinessSixPlaneDataDefs
import Mathlib.Tactic.FinCases

namespace Loneliness.SixPlane.Data

set_option maxRecDepth 100000 in
theorem pair_07_09_00 : partialCheck 7 9 0 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_07_09_01 : partialCheck 7 9 40 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_07_09_02 : partialCheck 7 9 80 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_07_09_03 : partialCheck 7 9 120 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_07_09_04 : partialCheck 7 9 160 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_07_09_05 : partialCheck 7 9 200 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_07_09_06 : partialCheck 7 9 240 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_07_09_07 : partialCheck 7 9 280 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_07_09_08 : partialCheck 7 9 320 40 = true := by
  decide +kernel

theorem pair_cases_07_09 (block : Fin 9) :
    partialCheck 7 9 (block.val * 40) 40 = true := by
  fin_cases block
  · exact pair_07_09_00
  · exact pair_07_09_01
  · exact pair_07_09_02
  · exact pair_07_09_03
  · exact pair_07_09_04
  · exact pair_07_09_05
  · exact pair_07_09_06
  · exact pair_07_09_07
  · exact pair_07_09_08

end Loneliness.SixPlane.Data
