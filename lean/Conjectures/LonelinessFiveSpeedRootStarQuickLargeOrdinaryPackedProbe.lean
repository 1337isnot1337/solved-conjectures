import Conjectures.LonelinessFiveSpeedRootStarQuickBlocks
import Conjectures.LonelinessFiveSpeedRootStarCacheProbeData
import Conjectures.LonelinessFiveSpeedPackedScalar1789

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.RootQuickProbes.LargeOrdinaryPacked

theorem checked : rootQuickBlockCheck 1789
    PackedScalars.P1789.mask (treeInverse ScalarTrees.P1789.tree)
    false 2 RootStarCacheProbes.P1789B2.values RootStarCacheProbes.P1789B2.eligible 5 1 = true := by
  decide +kernel

theorem original_checked : rootStarCBlockCheck 1789
    (treeMask 1789 ScalarTrees.P1789.tree) (treeInverse ScalarTrees.P1789.tree)
    (rootStarFastLeaf 1789) 2 5 1 = true := by
  rw [← rootQuickBlockCheck_eq 1789 (by decide) _ _ false 2
    RootStarCacheProbes.P1789B2.values RootStarCacheProbes.P1789B2.eligible 5 1
    RootStarCacheProbes.P1789B2.values_checked RootStarCacheProbes.P1789B2.eligible_checked]
  rw [← PackedScalars.P1789.mask_eq_treeMask]
  exact checked

end Loneliness.FiveSpeedCertificate.RootQuickProbes.LargeOrdinaryPacked
