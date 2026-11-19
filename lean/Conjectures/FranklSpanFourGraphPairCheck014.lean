module

public import Conjectures.FranklSpanFourGraphTables
public import Conjectures.FranklSpanFourGraphSeedData

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

private theorem checked112 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk112 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked113 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk113 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked114 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk114 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked115 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk115 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked116 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk116 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked117 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk117 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked118 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk118 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked119 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk119 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

theorem pairBatch014_checked :
    seedBatch014.all (fun seeds => rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seeds (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks) = true := by
  simp only [seedBatch014, List.all_cons, List.all_nil, checked112, checked113, checked114, checked115, checked116, checked117, checked118, checked119, Bool.true_and]

end FranklSpanFour.Graph.Certificate
