import Conjectures.LonelinessSixPlaneDataDefs
import Mathlib.Tactic.FinCases

namespace Loneliness.SixPlane.Data

set_option maxRecDepth 100000 in
theorem pair_01_05_00 : partialCheck 1 5 0 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_01_05_01 : partialCheck 1 5 40 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_01_05_02 : partialCheck 1 5 80 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_01_05_03 : partialCheck 1 5 120 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_01_05_04 : partialCheck 1 5 160 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_01_05_05 : partialCheck 1 5 200 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_01_05_06 : partialCheck 1 5 240 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_01_05_07 : partialCheck 1 5 280 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_01_05_08 : partialCheck 1 5 320 40 = true := by
  decide +kernel

theorem pair_cases_01_05 (block : Fin 9) :
    partialCheck 1 5 (block.val * 40) 40 = true := by
  fin_cases block
  · exact pair_01_05_00
  · exact pair_01_05_01
  · exact pair_01_05_02
  · exact pair_01_05_03
  · exact pair_01_05_04
  · exact pair_01_05_05
  · exact pair_01_05_06
  · exact pair_01_05_07
  · exact pair_01_05_08

end Loneliness.SixPlane.Data
