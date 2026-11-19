module

public import Conjectures.FranklSpanFourGraphTables
public import Conjectures.FranklSpanFourGraphSeedData

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

private theorem checked264 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk264 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked265 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk265 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked266 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk266 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

theorem pairBatch033_checked :
    seedBatch033.all (fun seeds => rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seeds (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks) = true := by
  simp only [seedBatch033, List.all_cons, List.all_nil, checked264, checked265, checked266, Bool.true_and]

end FranklSpanFour.Graph.Certificate
