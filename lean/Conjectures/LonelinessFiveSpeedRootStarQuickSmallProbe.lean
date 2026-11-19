import Conjectures.LonelinessFiveSpeedRootStarQuickBlocks
import Conjectures.LonelinessFiveSpeedRootStarCacheProbeData

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.RootQuickProbes.Small

theorem checked : rootQuickBlockCheck 179
    (treeMask 179 ScalarTrees.P179.tree) (treeInverse ScalarTrees.P179.tree)
    false 2 RootStarCacheProbes.P179B2.values RootStarCacheProbes.P179B2.eligible 0 8 = true := by
  decide +kernel

theorem original_checked : rootStarCBlockCheck 179
    (treeMask 179 ScalarTrees.P179.tree) (treeInverse ScalarTrees.P179.tree)
    (rootStarFastLeaf 179) 2 0 8 = true := by
  rw [← rootQuickBlockCheck_eq 179 (by decide) _ _ false 2
    RootStarCacheProbes.P179B2.values RootStarCacheProbes.P179B2.eligible 0 8
    RootStarCacheProbes.P179B2.values_checked RootStarCacheProbes.P179B2.eligible_checked]
  exact checked

end Loneliness.FiveSpeedCertificate.RootQuickProbes.Small
