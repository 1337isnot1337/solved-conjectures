import Conjectures.LonelinessFiveSpeedRootStarBlocks
import Conjectures.LonelinessFiveSpeedScalarTreeMask1789

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.RootStarLargeFirstProbe

theorem checked : rootStarCBlockCheck 1789
    (treeMask 1789 ScalarTrees.P1789.tree) (treeInverse ScalarTrees.P1789.tree)
    (rootStarFastLeaf 1789) 2 3 1 = true := by
  decide +kernel

end Loneliness.FiveSpeedCertificate.RootStarLargeFirstProbe
