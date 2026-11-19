module

public import Conjectures.FranklSpanFourGraphTables
public import Conjectures.FranklSpanFourGraphSeedData

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

private theorem checked152 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk152 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked153 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk153 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked154 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk154 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked155 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk155 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked156 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk156 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked157 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk157 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked158 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk158 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked159 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk159 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

theorem pairBatch019_checked :
    seedBatch019.all (fun seeds => rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seeds (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks) = true := by
  simp only [seedBatch019, List.all_cons, List.all_nil, checked152, checked153, checked154, checked155, checked156, checked157, checked158, checked159, Bool.true_and]

end FranklSpanFour.Graph.Certificate
