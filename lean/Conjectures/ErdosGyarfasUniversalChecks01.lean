import Conjectures.ErdosGyarfasUniversalData

/-! Eight independently kernel-reduced universal-cover certificate nodes. -/

namespace ErdosGyarfasUniversal.Certificate

theorem node08_checked : checkNode lookup 8 = true := by
  decide +kernel

theorem node09_checked : checkNode lookup 9 = true := by
  decide +kernel

theorem node10_checked : checkNode lookup 10 = true := by
  decide +kernel

theorem node11_checked : checkNode lookup 11 = true := by
  decide +kernel

theorem node12_checked : checkNode lookup 12 = true := by
  decide +kernel

theorem node13_checked : checkNode lookup 13 = true := by
  decide +kernel

theorem node14_checked : checkNode lookup 14 = true := by
  decide +kernel

theorem node15_checked : checkNode lookup 15 = true := by
  decide +kernel

end ErdosGyarfasUniversal.Certificate
