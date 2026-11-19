module

public import Conjectures.FranklSpanFourGraphTables
public import Conjectures.FranklSpanFourGraphSeedData

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

private theorem checked136 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk136 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked137 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk137 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked138 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk138 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked139 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk139 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked140 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk140 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked141 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk141 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked142 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk142 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked143 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk143 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

theorem pairBatch017_checked :
    seedBatch017.all (fun seeds => rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seeds (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks) = true := by
  simp only [seedBatch017, List.all_cons, List.all_nil, checked136, checked137, checked138, checked139, checked140, checked141, checked142, checked143, Bool.true_and]

end FranklSpanFour.Graph.Certificate
