module

public import Conjectures.FranklSpanFourGraphTables
public import Conjectures.FranklSpanFourGraphSeedData

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

private theorem checked224 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk224 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked225 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk225 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked226 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk226 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked227 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk227 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked228 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk228 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked229 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk229 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked230 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk230 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked231 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk231 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

theorem pairBatch028_checked :
    seedBatch028.all (fun seeds => rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seeds (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks) = true := by
  simp only [seedBatch028, List.all_cons, List.all_nil, checked224, checked225, checked226, checked227, checked228, checked229, checked230, checked231, Bool.true_and]

end FranklSpanFour.Graph.Certificate
