module

public import Conjectures.FranklSpanFourGraphTables
public import Conjectures.FranklSpanFourGraphSeedData

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

private theorem checked072 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk072 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked073 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk073 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked074 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk074 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked075 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk075 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked076 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk076 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked077 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk077 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked078 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk078 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked079 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk079 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

theorem pairBatch009_checked :
    seedBatch009.all (fun seeds => rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seeds (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks) = true := by
  simp only [seedBatch009, List.all_cons, List.all_nil, checked072, checked073, checked074, checked075, checked076, checked077, checked078, checked079, Bool.true_and]

end FranklSpanFour.Graph.Certificate
