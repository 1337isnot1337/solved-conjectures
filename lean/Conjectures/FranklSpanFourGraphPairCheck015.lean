module

public import Conjectures.FranklSpanFourGraphTables
public import Conjectures.FranklSpanFourGraphSeedData

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

private theorem checked120 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk120 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked121 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk121 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked122 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk122 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked123 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk123 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked124 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk124 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked125 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk125 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked126 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk126 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked127 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk127 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

theorem pairBatch015_checked :
    seedBatch015.all (fun seeds => rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seeds (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks) = true := by
  simp only [seedBatch015, List.all_cons, List.all_nil, checked120, checked121, checked122, checked123, checked124, checked125, checked126, checked127, Bool.true_and]

end FranklSpanFour.Graph.Certificate
