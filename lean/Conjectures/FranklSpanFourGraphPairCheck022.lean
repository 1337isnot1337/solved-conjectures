module

public import Conjectures.FranklSpanFourGraphTables
public import Conjectures.FranklSpanFourGraphSeedData

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

private theorem checked176 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk176 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked177 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk177 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked178 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk178 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked179 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk179 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked180 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk180 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked181 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk181 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked182 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk182 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked183 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk183 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

theorem pairBatch022_checked :
    seedBatch022.all (fun seeds => rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seeds (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks) = true := by
  simp only [seedBatch022, List.all_cons, List.all_nil, checked176, checked177, checked178, checked179, checked180, checked181, checked182, checked183, Bool.true_and]

end FranklSpanFour.Graph.Certificate
