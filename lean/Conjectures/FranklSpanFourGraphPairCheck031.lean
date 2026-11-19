module

public import Conjectures.FranklSpanFourGraphTables
public import Conjectures.FranklSpanFourGraphSeedData

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

private theorem checked248 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk248 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked249 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk249 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked250 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk250 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked251 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk251 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked252 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk252 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked253 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk253 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked254 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk254 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked255 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk255 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

theorem pairBatch031_checked :
    seedBatch031.all (fun seeds => rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seeds (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks) = true := by
  simp only [seedBatch031, List.all_cons, List.all_nil, checked248, checked249, checked250, checked251, checked252, checked253, checked254, checked255, Bool.true_and]

end FranklSpanFour.Graph.Certificate
