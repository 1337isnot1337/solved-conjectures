module

public import Conjectures.FranklSpanFourGraphTables
public import Conjectures.FranklSpanFourGraphSeedData

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

private theorem checked104 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk104 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked105 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk105 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked106 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk106 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked107 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk107 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked108 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk108 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked109 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk109 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked110 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk110 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked111 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk111 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

theorem pairBatch013_checked :
    seedBatch013.all (fun seeds => rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seeds (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks) = true := by
  simp only [seedBatch013, List.all_cons, List.all_nil, checked104, checked105, checked106, checked107, checked108, checked109, checked110, checked111, Bool.true_and]

end FranklSpanFour.Graph.Certificate
