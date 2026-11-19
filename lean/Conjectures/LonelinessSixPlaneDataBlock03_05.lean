import Conjectures.LonelinessSixPlaneDataDefs
import Mathlib.Tactic.FinCases

namespace Loneliness.SixPlane.Data

set_option maxRecDepth 100000 in
theorem pair_03_05_00 : partialCheck 3 5 0 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_03_05_01 : partialCheck 3 5 40 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_03_05_02 : partialCheck 3 5 80 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_03_05_03 : partialCheck 3 5 120 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_03_05_04 : partialCheck 3 5 160 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_03_05_05 : partialCheck 3 5 200 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_03_05_06 : partialCheck 3 5 240 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_03_05_07 : partialCheck 3 5 280 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_03_05_08 : partialCheck 3 5 320 40 = true := by
  decide +kernel

theorem pair_cases_03_05 (block : Fin 9) :
    partialCheck 3 5 (block.val * 40) 40 = true := by
  fin_cases block
  · exact pair_03_05_00
  · exact pair_03_05_01
  · exact pair_03_05_02
  · exact pair_03_05_03
  · exact pair_03_05_04
  · exact pair_03_05_05
  · exact pair_03_05_06
  · exact pair_03_05_07
  · exact pair_03_05_08

end Loneliness.SixPlane.Data
