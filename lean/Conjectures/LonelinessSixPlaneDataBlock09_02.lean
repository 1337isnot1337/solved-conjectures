import Conjectures.LonelinessSixPlaneDataDefs
import Mathlib.Tactic.FinCases

namespace Loneliness.SixPlane.Data

set_option maxRecDepth 100000 in
theorem pair_09_02_00 : partialCheck 9 2 0 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_09_02_01 : partialCheck 9 2 40 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_09_02_02 : partialCheck 9 2 80 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_09_02_03 : partialCheck 9 2 120 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_09_02_04 : partialCheck 9 2 160 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_09_02_05 : partialCheck 9 2 200 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_09_02_06 : partialCheck 9 2 240 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_09_02_07 : partialCheck 9 2 280 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_09_02_08 : partialCheck 9 2 320 40 = true := by
  decide +kernel

theorem pair_cases_09_02 (block : Fin 9) :
    partialCheck 9 2 (block.val * 40) 40 = true := by
  fin_cases block
  · exact pair_09_02_00
  · exact pair_09_02_01
  · exact pair_09_02_02
  · exact pair_09_02_03
  · exact pair_09_02_04
  · exact pair_09_02_05
  · exact pair_09_02_06
  · exact pair_09_02_07
  · exact pair_09_02_08

end Loneliness.SixPlane.Data
