import Conjectures.ErdosGyarfasUniversalData

/-! Eight independently kernel-reduced universal-cover certificate nodes. -/

namespace ErdosGyarfasUniversal.Certificate

theorem node00_checked : checkNode lookup 0 = true := by
  decide +kernel

theorem node01_checked : checkNode lookup 1 = true := by
  decide +kernel

theorem node02_checked : checkNode lookup 2 = true := by
  decide +kernel

theorem node03_checked : checkNode lookup 3 = true := by
  decide +kernel

theorem node04_checked : checkNode lookup 4 = true := by
  decide +kernel

theorem node05_checked : checkNode lookup 5 = true := by
  decide +kernel

theorem node06_checked : checkNode lookup 6 = true := by
  decide +kernel

theorem node07_checked : checkNode lookup 7 = true := by
  decide +kernel

end ErdosGyarfasUniversal.Certificate
