module

public import Conjectures.FranklSpanFourGraphTables
public import Conjectures.FranklSpanFourGraphSeedData

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

private theorem checked024 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk024 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked025 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk025 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked026 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk026 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked027 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk027 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked028 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk028 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked029 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk029 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked030 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk030 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked031 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk031 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

theorem pairBatch003_checked :
    seedBatch003.all (fun seeds => rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seeds (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks) = true := by
  simp only [seedBatch003, List.all_cons, List.all_nil, checked024, checked025, checked026, checked027, checked028, checked029, checked030, checked031, Bool.true_and]

end FranklSpanFour.Graph.Certificate
