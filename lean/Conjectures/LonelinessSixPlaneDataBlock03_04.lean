import Conjectures.LonelinessSixPlaneDataDefs
import Mathlib.Tactic.FinCases

namespace Loneliness.SixPlane.Data

set_option maxRecDepth 100000 in
theorem pair_03_04_00 : partialCheck 3 4 0 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_03_04_01 : partialCheck 3 4 40 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_03_04_02 : partialCheck 3 4 80 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_03_04_03 : partialCheck 3 4 120 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_03_04_04 : partialCheck 3 4 160 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_03_04_05 : partialCheck 3 4 200 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_03_04_06 : partialCheck 3 4 240 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_03_04_07 : partialCheck 3 4 280 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_03_04_08 : partialCheck 3 4 320 40 = true := by
  decide +kernel

theorem pair_cases_03_04 (block : Fin 9) :
    partialCheck 3 4 (block.val * 40) 40 = true := by
  fin_cases block
  · exact pair_03_04_00
  · exact pair_03_04_01
  · exact pair_03_04_02
  · exact pair_03_04_03
  · exact pair_03_04_04
  · exact pair_03_04_05
  · exact pair_03_04_06
  · exact pair_03_04_07
  · exact pair_03_04_08

end Loneliness.SixPlane.Data
