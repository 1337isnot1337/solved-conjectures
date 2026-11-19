module

public import Conjectures.FranklSpanFourGraphTables
public import Conjectures.FranklSpanFourGraphSeedData

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

private theorem checked168 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk168 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked169 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk169 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked170 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk170 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked171 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk171 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked172 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk172 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked173 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk173 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked174 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk174 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked175 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk175 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

theorem pairBatch021_checked :
    seedBatch021.all (fun seeds => rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seeds (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks) = true := by
  simp only [seedBatch021, List.all_cons, List.all_nil, checked168, checked169, checked170, checked171, checked172, checked173, checked174, checked175, Bool.true_and]

end FranklSpanFour.Graph.Certificate
