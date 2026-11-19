module

public import Conjectures.FranklSpanFourGraphTables
public import Conjectures.FranklSpanFourGraphSeedData

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

private theorem checked232 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk232 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked233 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk233 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked234 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk234 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked235 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk235 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked236 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk236 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked237 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk237 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked238 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk238 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked239 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk239 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

theorem pairBatch029_checked :
    seedBatch029.all (fun seeds => rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seeds (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks) = true := by
  simp only [seedBatch029, List.all_cons, List.all_nil, checked232, checked233, checked234, checked235, checked236, checked237, checked238, checked239, Bool.true_and]

end FranklSpanFour.Graph.Certificate
