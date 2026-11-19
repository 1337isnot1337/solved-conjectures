module

public import Conjectures.FranklSpanFourGraphTables
public import Conjectures.FranklSpanFourGraphSeedData

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

private theorem checked240 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk240 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked241 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk241 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked242 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk242 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked243 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk243 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked244 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk244 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked245 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk245 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked246 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk246 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked247 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk247 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

theorem pairBatch030_checked :
    seedBatch030.all (fun seeds => rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seeds (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks) = true := by
  simp only [seedBatch030, List.all_cons, List.all_nil, checked240, checked241, checked242, checked243, checked244, checked245, checked246, checked247, Bool.true_and]

end FranklSpanFour.Graph.Certificate
