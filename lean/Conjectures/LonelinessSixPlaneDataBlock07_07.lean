import Conjectures.LonelinessSixPlaneDataDefs
import Mathlib.Tactic.FinCases

namespace Loneliness.SixPlane.Data

set_option maxRecDepth 100000 in
theorem pair_07_07_00 : partialCheck 7 7 0 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_07_07_01 : partialCheck 7 7 40 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_07_07_02 : partialCheck 7 7 80 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_07_07_03 : partialCheck 7 7 120 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_07_07_04 : partialCheck 7 7 160 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_07_07_05 : partialCheck 7 7 200 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_07_07_06 : partialCheck 7 7 240 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_07_07_07 : partialCheck 7 7 280 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_07_07_08 : partialCheck 7 7 320 40 = true := by
  decide +kernel

theorem pair_cases_07_07 (block : Fin 9) :
    partialCheck 7 7 (block.val * 40) 40 = true := by
  fin_cases block
  · exact pair_07_07_00
  · exact pair_07_07_01
  · exact pair_07_07_02
  · exact pair_07_07_03
  · exact pair_07_07_04
  · exact pair_07_07_05
  · exact pair_07_07_06
  · exact pair_07_07_07
  · exact pair_07_07_08

end Loneliness.SixPlane.Data
