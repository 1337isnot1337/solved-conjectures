module

public import Conjectures.FranklSpanFourGraphTables
public import Conjectures.FranklSpanFourGraphSeedData

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

private theorem checked144 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk144 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked145 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk145 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked146 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk146 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked147 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk147 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked148 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk148 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked149 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk149 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked150 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk150 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked151 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk151 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

theorem pairBatch018_checked :
    seedBatch018.all (fun seeds => rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seeds (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks) = true := by
  simp only [seedBatch018, List.all_cons, List.all_nil, checked144, checked145, checked146, checked147, checked148, checked149, checked150, checked151, Bool.true_and]

end FranklSpanFour.Graph.Certificate
