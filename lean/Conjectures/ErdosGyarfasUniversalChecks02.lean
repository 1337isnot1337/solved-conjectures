import Conjectures.ErdosGyarfasUniversalData

/-! Eight independently kernel-reduced universal-cover certificate nodes. -/

namespace ErdosGyarfasUniversal.Certificate

theorem node16_checked : checkNode lookup 16 = true := by
  decide +kernel

theorem node17_checked : checkNode lookup 17 = true := by
  decide +kernel

theorem node18_checked : checkNode lookup 18 = true := by
  decide +kernel

theorem node19_checked : checkNode lookup 19 = true := by
  decide +kernel

theorem node20_checked : checkNode lookup 20 = true := by
  decide +kernel

theorem node21_checked : checkNode lookup 21 = true := by
  decide +kernel

theorem node22_checked : checkNode lookup 22 = true := by
  decide +kernel

theorem node23_checked : checkNode lookup 23 = true := by
  decide +kernel

end ErdosGyarfasUniversal.Certificate
