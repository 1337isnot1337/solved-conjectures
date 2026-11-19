import Conjectures.LonelinessSixPlaneDataDefs
import Mathlib.Tactic.FinCases

namespace Loneliness.SixPlane.Data

set_option maxRecDepth 100000 in
theorem pair_00_04_00 : partialCheck 0 4 0 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_00_04_01 : partialCheck 0 4 40 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_00_04_02 : partialCheck 0 4 80 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_00_04_03 : partialCheck 0 4 120 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_00_04_04 : partialCheck 0 4 160 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_00_04_05 : partialCheck 0 4 200 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_00_04_06 : partialCheck 0 4 240 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_00_04_07 : partialCheck 0 4 280 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_00_04_08 : partialCheck 0 4 320 40 = true := by
  decide +kernel

theorem pair_cases_00_04 (block : Fin 9) :
    partialCheck 0 4 (block.val * 40) 40 = true := by
  fin_cases block
  · exact pair_00_04_00
  · exact pair_00_04_01
  · exact pair_00_04_02
  · exact pair_00_04_03
  · exact pair_00_04_04
  · exact pair_00_04_05
  · exact pair_00_04_06
  · exact pair_00_04_07
  · exact pair_00_04_08

end Loneliness.SixPlane.Data
