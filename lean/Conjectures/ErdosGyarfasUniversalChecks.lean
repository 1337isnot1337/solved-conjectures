import Conjectures.ErdosGyarfasUniversalChecks00
import Conjectures.ErdosGyarfasUniversalChecks01
import Conjectures.ErdosGyarfasUniversalChecks02
import Conjectures.ErdosGyarfasUniversalChecks03
import Conjectures.ErdosGyarfasUniversalChecks04
import Conjectures.ErdosGyarfasUniversalChecks05
import Conjectures.ErdosGyarfasUniversalChecks06
import Conjectures.ErdosGyarfasUniversalChecks07
import Mathlib.Tactic.FinCases

namespace ErdosGyarfasUniversal.Certificate

theorem all_nodes_checked (i : Fin 64) : checkNode lookup i.val = true := by
  fin_cases i
  · exact node00_checked
  · exact node01_checked
  · exact node02_checked
  · exact node03_checked
  · exact node04_checked
  · exact node05_checked
  · exact node06_checked
  · exact node07_checked
  · exact node08_checked
  · exact node09_checked
  · exact node10_checked
  · exact node11_checked
  · exact node12_checked
  · exact node13_checked
  · exact node14_checked
  · exact node15_checked
  · exact node16_checked
  · exact node17_checked
  · exact node18_checked
  · exact node19_checked
  · exact node20_checked
  · exact node21_checked
  · exact node22_checked
  · exact node23_checked
  · exact node24_checked
  · exact node25_checked
  · exact node26_checked
  · exact node27_checked
  · exact node28_checked
  · exact node29_checked
  · exact node30_checked
  · exact node31_checked
  · exact node32_checked
  · exact node33_checked
  · exact node34_checked
  · exact node35_checked
  · exact node36_checked
  · exact node37_checked
  · exact node38_checked
  · exact node39_checked
  · exact node40_checked
  · exact node41_checked
  · exact node42_checked
  · exact node43_checked
  · exact node44_checked
  · exact node45_checked
  · exact node46_checked
  · exact node47_checked
  · exact node48_checked
  · exact node49_checked
  · exact node50_checked
  · exact node51_checked
  · exact node52_checked
  · exact node53_checked
  · exact node54_checked
  · exact node55_checked
  · exact node56_checked
  · exact node57_checked
  · exact node58_checked
  · exact node59_checked
  · exact node60_checked
  · exact node61_checked
  · exact node62_checked
  · exact node63_checked

theorem table_checked (i : ℕ) (hi : i < 64) : checkNode lookup i = true :=
  all_nodes_checked ⟨i, hi⟩

end ErdosGyarfasUniversal.Certificate
