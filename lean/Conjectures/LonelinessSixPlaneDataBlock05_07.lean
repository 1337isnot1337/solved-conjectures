import Conjectures.LonelinessSixPlaneDataDefs
import Mathlib.Tactic.FinCases

namespace Loneliness.SixPlane.Data

set_option maxRecDepth 100000 in
theorem pair_05_07_00 : partialCheck 5 7 0 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_05_07_01 : partialCheck 5 7 40 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_05_07_02 : partialCheck 5 7 80 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_05_07_03 : partialCheck 5 7 120 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_05_07_04 : partialCheck 5 7 160 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_05_07_05 : partialCheck 5 7 200 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_05_07_06 : partialCheck 5 7 240 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_05_07_07 : partialCheck 5 7 280 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_05_07_08 : partialCheck 5 7 320 40 = true := by
  decide +kernel

theorem pair_cases_05_07 (block : Fin 9) :
    partialCheck 5 7 (block.val * 40) 40 = true := by
  fin_cases block
  · exact pair_05_07_00
  · exact pair_05_07_01
  · exact pair_05_07_02
  · exact pair_05_07_03
  · exact pair_05_07_04
  · exact pair_05_07_05
  · exact pair_05_07_06
  · exact pair_05_07_07
  · exact pair_05_07_08

end Loneliness.SixPlane.Data
