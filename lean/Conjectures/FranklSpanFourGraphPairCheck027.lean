module

public import Conjectures.FranklSpanFourGraphTables
public import Conjectures.FranklSpanFourGraphSeedData

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

private theorem checked216 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk216 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked217 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk217 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked218 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk218 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked219 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk219 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked220 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk220 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked221 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk221 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked222 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk222 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked223 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk223 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

theorem pairBatch027_checked :
    seedBatch027.all (fun seeds => rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seeds (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks) = true := by
  simp only [seedBatch027, List.all_cons, List.all_nil, checked216, checked217, checked218, checked219, checked220, checked221, checked222, checked223, Bool.true_and]

end FranklSpanFour.Graph.Certificate
