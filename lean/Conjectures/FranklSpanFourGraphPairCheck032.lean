module

public import Conjectures.FranklSpanFourGraphTables
public import Conjectures.FranklSpanFourGraphSeedData

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

private theorem checked256 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk256 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked257 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk257 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked258 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk258 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked259 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk259 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked260 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk260 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked261 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk261 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked262 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk262 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked263 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk263 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

theorem pairBatch032_checked :
    seedBatch032.all (fun seeds => rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seeds (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks) = true := by
  simp only [seedBatch032, List.all_cons, List.all_nil, checked256, checked257, checked258, checked259, checked260, checked261, checked262, checked263, Bool.true_and]

end FranklSpanFour.Graph.Certificate
