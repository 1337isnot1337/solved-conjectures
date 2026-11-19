module

public import Conjectures.FranklSpanFourGraphTables
public import Conjectures.FranklSpanFourGraphSeedData

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

private theorem checked080 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk080 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked081 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk081 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked082 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk082 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked083 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk083 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked084 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk084 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked085 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk085 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked086 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk086 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked087 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk087 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

theorem pairBatch010_checked :
    seedBatch010.all (fun seeds => rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seeds (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks) = true := by
  simp only [seedBatch010, List.all_cons, List.all_nil, checked080, checked081, checked082, checked083, checked084, checked085, checked086, checked087, Bool.true_and]

end FranklSpanFour.Graph.Certificate
