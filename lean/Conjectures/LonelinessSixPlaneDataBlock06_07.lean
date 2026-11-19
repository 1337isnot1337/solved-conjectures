import Conjectures.LonelinessSixPlaneDataDefs
import Mathlib.Tactic.FinCases

namespace Loneliness.SixPlane.Data

set_option maxRecDepth 100000 in
theorem pair_06_07_00 : partialCheck 6 7 0 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_06_07_01 : partialCheck 6 7 40 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_06_07_02 : partialCheck 6 7 80 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_06_07_03 : partialCheck 6 7 120 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_06_07_04 : partialCheck 6 7 160 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_06_07_05 : partialCheck 6 7 200 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_06_07_06 : partialCheck 6 7 240 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_06_07_07 : partialCheck 6 7 280 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_06_07_08 : partialCheck 6 7 320 40 = true := by
  decide +kernel

theorem pair_cases_06_07 (block : Fin 9) :
    partialCheck 6 7 (block.val * 40) 40 = true := by
  fin_cases block
  · exact pair_06_07_00
  · exact pair_06_07_01
  · exact pair_06_07_02
  · exact pair_06_07_03
  · exact pair_06_07_04
  · exact pair_06_07_05
  · exact pair_06_07_06
  · exact pair_06_07_07
  · exact pair_06_07_08

end Loneliness.SixPlane.Data
