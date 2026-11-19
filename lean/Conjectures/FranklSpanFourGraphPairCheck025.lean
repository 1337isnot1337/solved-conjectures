module

public import Conjectures.FranklSpanFourGraphTables
public import Conjectures.FranklSpanFourGraphSeedData

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

private theorem checked200 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk200 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked201 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk201 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked202 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk202 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked203 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk203 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked204 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk204 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked205 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk205 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked206 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk206 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked207 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk207 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

theorem pairBatch025_checked :
    seedBatch025.all (fun seeds => rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seeds (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks) = true := by
  simp only [seedBatch025, List.all_cons, List.all_nil, checked200, checked201, checked202, checked203, checked204, checked205, checked206, checked207, Bool.true_and]

end FranklSpanFour.Graph.Certificate
