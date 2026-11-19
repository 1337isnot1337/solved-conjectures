module

public import Conjectures.FranklSpanFourGraphTables
public import Conjectures.FranklSpanFourGraphSeedData

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

private theorem checked064 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk064 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked065 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk065 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked066 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk066 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked067 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk067 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked068 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk068 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked069 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk069 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked070 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk070 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked071 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk071 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

theorem pairBatch008_checked :
    seedBatch008.all (fun seeds => rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seeds (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks) = true := by
  simp only [seedBatch008, List.all_cons, List.all_nil, checked064, checked065, checked066, checked067, checked068, checked069, checked070, checked071, Bool.true_and]

end FranklSpanFour.Graph.Certificate
