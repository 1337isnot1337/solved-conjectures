import Conjectures.LonelinessFiveSpeedRootStarBlocks
import Conjectures.LonelinessFiveSpeedScalarTreeMask0179

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.RootStarBlockProbe

theorem checked : rootStarCBlockCheck 179
    (treeMask 179 ScalarTrees.P179.tree) (treeInverse ScalarTrees.P179.tree)
    (rootStarFastLeaf 179) 2 0 8 = true := by
  decide +kernel

end Loneliness.FiveSpeedCertificate.RootStarBlockProbe
