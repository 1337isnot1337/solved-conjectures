import Conjectures.ErdosGyarfasUniversalData

/-! Eight independently kernel-reduced universal-cover certificate nodes. -/

namespace ErdosGyarfasUniversal.Certificate

theorem node32_checked : checkNode lookup 32 = true := by
  decide +kernel

theorem node33_checked : checkNode lookup 33 = true := by
  decide +kernel

theorem node34_checked : checkNode lookup 34 = true := by
  decide +kernel

theorem node35_checked : checkNode lookup 35 = true := by
  decide +kernel

theorem node36_checked : checkNode lookup 36 = true := by
  decide +kernel

theorem node37_checked : checkNode lookup 37 = true := by
  decide +kernel

theorem node38_checked : checkNode lookup 38 = true := by
  decide +kernel

theorem node39_checked : checkNode lookup 39 = true := by
  decide +kernel

end ErdosGyarfasUniversal.Certificate
