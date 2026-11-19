module

public import Conjectures.FranklSpanFourGraphTables
public import Conjectures.FranklSpanFourGraphSeedData

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

private theorem checked096 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk096 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked097 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk097 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked098 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk098 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked099 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk099 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked100 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk100 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked101 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk101 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked102 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk102 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked103 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk103 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

theorem pairBatch012_checked :
    seedBatch012.all (fun seeds => rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seeds (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks) = true := by
  simp only [seedBatch012, List.all_cons, List.all_nil, checked096, checked097, checked098, checked099, checked100, checked101, checked102, checked103, Bool.true_and]

end FranklSpanFour.Graph.Certificate
