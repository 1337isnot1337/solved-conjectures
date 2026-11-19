module

public import Conjectures.FranklSpanFourGraphTables
public import Conjectures.FranklSpanFourGraphSeedData

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

private theorem checked192 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk192 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked193 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk193 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked194 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk194 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked195 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk195 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked196 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk196 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked197 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk197 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked198 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk198 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked199 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk199 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

theorem pairBatch024_checked :
    seedBatch024.all (fun seeds => rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seeds (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks) = true := by
  simp only [seedBatch024, List.all_cons, List.all_nil, checked192, checked193, checked194, checked195, checked196, checked197, checked198, checked199, Bool.true_and]

end FranklSpanFour.Graph.Certificate
