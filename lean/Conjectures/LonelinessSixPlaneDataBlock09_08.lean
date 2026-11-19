import Conjectures.LonelinessSixPlaneDataDefs
import Mathlib.Tactic.FinCases

namespace Loneliness.SixPlane.Data

set_option maxRecDepth 100000 in
theorem pair_09_08_00 : partialCheck 9 8 0 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_09_08_01 : partialCheck 9 8 40 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_09_08_02 : partialCheck 9 8 80 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_09_08_03 : partialCheck 9 8 120 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_09_08_04 : partialCheck 9 8 160 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_09_08_05 : partialCheck 9 8 200 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_09_08_06 : partialCheck 9 8 240 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_09_08_07 : partialCheck 9 8 280 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_09_08_08 : partialCheck 9 8 320 40 = true := by
  decide +kernel

theorem pair_cases_09_08 (block : Fin 9) :
    partialCheck 9 8 (block.val * 40) 40 = true := by
  fin_cases block
  · exact pair_09_08_00
  · exact pair_09_08_01
  · exact pair_09_08_02
  · exact pair_09_08_03
  · exact pair_09_08_04
  · exact pair_09_08_05
  · exact pair_09_08_06
  · exact pair_09_08_07
  · exact pair_09_08_08

end Loneliness.SixPlane.Data
