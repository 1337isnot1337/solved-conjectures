import Conjectures.LonelinessSixPlaneDataDefs
import Mathlib.Tactic.FinCases

namespace Loneliness.SixPlane.Data

set_option maxRecDepth 100000 in
theorem pair_05_03_00 : partialCheck 5 3 0 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_05_03_01 : partialCheck 5 3 40 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_05_03_02 : partialCheck 5 3 80 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_05_03_03 : partialCheck 5 3 120 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_05_03_04 : partialCheck 5 3 160 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_05_03_05 : partialCheck 5 3 200 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_05_03_06 : partialCheck 5 3 240 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_05_03_07 : partialCheck 5 3 280 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_05_03_08 : partialCheck 5 3 320 40 = true := by
  decide +kernel

theorem pair_cases_05_03 (block : Fin 9) :
    partialCheck 5 3 (block.val * 40) 40 = true := by
  fin_cases block
  · exact pair_05_03_00
  · exact pair_05_03_01
  · exact pair_05_03_02
  · exact pair_05_03_03
  · exact pair_05_03_04
  · exact pair_05_03_05
  · exact pair_05_03_06
  · exact pair_05_03_07
  · exact pair_05_03_08

end Loneliness.SixPlane.Data
