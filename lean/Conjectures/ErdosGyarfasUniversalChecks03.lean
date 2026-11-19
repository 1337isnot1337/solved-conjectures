import Conjectures.ErdosGyarfasUniversalData

/-! Eight independently kernel-reduced universal-cover certificate nodes. -/

namespace ErdosGyarfasUniversal.Certificate

theorem node24_checked : checkNode lookup 24 = true := by
  decide +kernel

theorem node25_checked : checkNode lookup 25 = true := by
  decide +kernel

theorem node26_checked : checkNode lookup 26 = true := by
  decide +kernel

theorem node27_checked : checkNode lookup 27 = true := by
  decide +kernel

theorem node28_checked : checkNode lookup 28 = true := by
  decide +kernel

theorem node29_checked : checkNode lookup 29 = true := by
  decide +kernel

theorem node30_checked : checkNode lookup 30 = true := by
  decide +kernel

theorem node31_checked : checkNode lookup 31 = true := by
  decide +kernel

end ErdosGyarfasUniversal.Certificate
