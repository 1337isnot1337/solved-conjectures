module

public import Conjectures.FranklSpanFourGraphTables
public import Conjectures.FranklSpanFourGraphSeedData

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

private theorem checked000 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk000 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked001 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk001 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked002 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk002 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked003 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk003 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked004 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk004 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked005 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk005 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked006 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk006 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked007 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk007 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

theorem pairBatch000_checked :
    seedBatch000.all (fun seeds => rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seeds (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks) = true := by
  simp only [seedBatch000, List.all_cons, List.all_nil, checked000, checked001, checked002, checked003, checked004, checked005, checked006, checked007, Bool.true_and]

end FranklSpanFour.Graph.Certificate
