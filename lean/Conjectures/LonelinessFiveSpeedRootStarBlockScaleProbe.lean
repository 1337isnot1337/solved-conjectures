import Conjectures.LonelinessFiveSpeedRootStarBlocks
import Conjectures.LonelinessFiveSpeedScalarTreeMask0179
import Conjectures.LonelinessFiveSpeedScalarTreeMask1789

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.RootStarBlockScaleProbe

theorem small_middle : rootStarCBlockCheck 179
    (treeMask 179 ScalarTrees.P179.tree) (treeInverse ScalarTrees.P179.tree)
    (rootStarFastLeaf 179) 22 23 8 = true := by
  decide +kernel

end Loneliness.FiveSpeedCertificate.RootStarBlockScaleProbe
