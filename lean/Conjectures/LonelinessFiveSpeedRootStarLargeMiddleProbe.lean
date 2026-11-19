import Conjectures.LonelinessFiveSpeedRootStarBlocks
import Conjectures.LonelinessFiveSpeedScalarTreeMask1789

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.RootStarLargeMiddleProbe

theorem checked : rootStarCBlockCheck 1789
    (treeMask 1789 ScalarTrees.P1789.tree) (treeInverse ScalarTrees.P1789.tree)
    (rootStarFastLeaf 1789) 200 300 4 = true := by
  decide +kernel

end Loneliness.FiveSpeedCertificate.RootStarLargeMiddleProbe
