module

public import Conjectures.FranklSpanFourGraphTables
public import Conjectures.FranklSpanFourGraphSeedData

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

private theorem checked032 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk032 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked033 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk033 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked034 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk034 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked035 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk035 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked036 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk036 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked037 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk037 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked038 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk038 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked039 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk039 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

theorem pairBatch004_checked :
    seedBatch004.all (fun seeds => rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seeds (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks) = true := by
  simp only [seedBatch004, List.all_cons, List.all_nil, checked032, checked033, checked034, checked035, checked036, checked037, checked038, checked039, Bool.true_and]

end FranklSpanFour.Graph.Certificate
