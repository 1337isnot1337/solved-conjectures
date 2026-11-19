module

public import Conjectures.FranklSpanFourGraphTables
public import Conjectures.FranklSpanFourGraphSeedData

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

private theorem checked208 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk208 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked209 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk209 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked210 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk210 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked211 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk211 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked212 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk212 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked213 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk213 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked214 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk214 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked215 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk215 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

theorem pairBatch026_checked :
    seedBatch026.all (fun seeds => rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seeds (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks) = true := by
  simp only [seedBatch026, List.all_cons, List.all_nil, checked208, checked209, checked210, checked211, checked212, checked213, checked214, checked215, Bool.true_and]

end FranklSpanFour.Graph.Certificate
