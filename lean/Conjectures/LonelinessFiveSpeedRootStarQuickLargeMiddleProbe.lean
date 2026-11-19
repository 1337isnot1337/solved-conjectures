import Conjectures.LonelinessFiveSpeedRootStarQuickBlocks
import Conjectures.LonelinessFiveSpeedRootStarCacheProbeData

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.RootQuickProbes.LargeMiddle

theorem checked : rootQuickBlockCheck 1789
    (treeMask 1789 ScalarTrees.P1789.tree) (treeInverse ScalarTrees.P1789.tree)
    false 200 RootStarCacheProbes.P1789B200.values RootStarCacheProbes.P1789B200.eligible 300 1 = true := by
  decide +kernel

theorem original_checked : rootStarCBlockCheck 1789
    (treeMask 1789 ScalarTrees.P1789.tree) (treeInverse ScalarTrees.P1789.tree)
    (rootStarFastLeaf 1789) 200 300 1 = true := by
  rw [← rootQuickBlockCheck_eq 1789 (by decide) _ _ false 200
    RootStarCacheProbes.P1789B200.values RootStarCacheProbes.P1789B200.eligible 300 1
    RootStarCacheProbes.P1789B200.values_checked RootStarCacheProbes.P1789B200.eligible_checked]
  exact checked

end Loneliness.FiveSpeedCertificate.RootQuickProbes.LargeMiddle
