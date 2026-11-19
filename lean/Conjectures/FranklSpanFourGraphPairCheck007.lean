module

public import Conjectures.FranklSpanFourGraphTables
public import Conjectures.FranklSpanFourGraphSeedData

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

private theorem checked056 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk056 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked057 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk057 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked058 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk058 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked059 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk059 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked060 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk060 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked061 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk061 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked062 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk062 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked063 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk063 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

theorem pairBatch007_checked :
    seedBatch007.all (fun seeds => rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seeds (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks) = true := by
  simp only [seedBatch007, List.all_cons, List.all_nil, checked056, checked057, checked058, checked059, checked060, checked061, checked062, checked063, Bool.true_and]

end FranklSpanFour.Graph.Certificate
