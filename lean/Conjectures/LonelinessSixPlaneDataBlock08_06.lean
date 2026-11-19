import Conjectures.LonelinessSixPlaneDataDefs
import Mathlib.Tactic.FinCases

namespace Loneliness.SixPlane.Data

set_option maxRecDepth 100000 in
theorem pair_08_06_00 : partialCheck 8 6 0 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_08_06_01 : partialCheck 8 6 40 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_08_06_02 : partialCheck 8 6 80 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_08_06_03 : partialCheck 8 6 120 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_08_06_04 : partialCheck 8 6 160 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_08_06_05 : partialCheck 8 6 200 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_08_06_06 : partialCheck 8 6 240 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_08_06_07 : partialCheck 8 6 280 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_08_06_08 : partialCheck 8 6 320 40 = true := by
  decide +kernel

theorem pair_cases_08_06 (block : Fin 9) :
    partialCheck 8 6 (block.val * 40) 40 = true := by
  fin_cases block
  · exact pair_08_06_00
  · exact pair_08_06_01
  · exact pair_08_06_02
  · exact pair_08_06_03
  · exact pair_08_06_04
  · exact pair_08_06_05
  · exact pair_08_06_06
  · exact pair_08_06_07
  · exact pair_08_06_08

end Loneliness.SixPlane.Data
