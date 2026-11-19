import Conjectures.LonelinessSixPlaneDataDefs
import Mathlib.Tactic.FinCases

namespace Loneliness.SixPlane.Data

set_option maxRecDepth 100000 in
theorem pair_07_01_00 : partialCheck 7 1 0 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_07_01_01 : partialCheck 7 1 40 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_07_01_02 : partialCheck 7 1 80 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_07_01_03 : partialCheck 7 1 120 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_07_01_04 : partialCheck 7 1 160 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_07_01_05 : partialCheck 7 1 200 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_07_01_06 : partialCheck 7 1 240 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_07_01_07 : partialCheck 7 1 280 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_07_01_08 : partialCheck 7 1 320 40 = true := by
  decide +kernel

theorem pair_cases_07_01 (block : Fin 9) :
    partialCheck 7 1 (block.val * 40) 40 = true := by
  fin_cases block
  · exact pair_07_01_00
  · exact pair_07_01_01
  · exact pair_07_01_02
  · exact pair_07_01_03
  · exact pair_07_01_04
  · exact pair_07_01_05
  · exact pair_07_01_06
  · exact pair_07_01_07
  · exact pair_07_01_08

end Loneliness.SixPlane.Data
