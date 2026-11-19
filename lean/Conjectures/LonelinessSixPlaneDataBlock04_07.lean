import Conjectures.LonelinessSixPlaneDataDefs
import Mathlib.Tactic.FinCases

namespace Loneliness.SixPlane.Data

set_option maxRecDepth 100000 in
theorem pair_04_07_00 : partialCheck 4 7 0 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_04_07_01 : partialCheck 4 7 40 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_04_07_02 : partialCheck 4 7 80 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_04_07_03 : partialCheck 4 7 120 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_04_07_04 : partialCheck 4 7 160 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_04_07_05 : partialCheck 4 7 200 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_04_07_06 : partialCheck 4 7 240 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_04_07_07 : partialCheck 4 7 280 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_04_07_08 : partialCheck 4 7 320 40 = true := by
  decide +kernel

theorem pair_cases_04_07 (block : Fin 9) :
    partialCheck 4 7 (block.val * 40) 40 = true := by
  fin_cases block
  · exact pair_04_07_00
  · exact pair_04_07_01
  · exact pair_04_07_02
  · exact pair_04_07_03
  · exact pair_04_07_04
  · exact pair_04_07_05
  · exact pair_04_07_06
  · exact pair_04_07_07
  · exact pair_04_07_08

end Loneliness.SixPlane.Data
