module

public import Conjectures.FranklSpanFourGraphTables
public import Conjectures.FranklSpanFourGraphSeedData

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

private theorem checked048 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk048 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked049 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk049 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked050 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk050 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked051 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk051 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked052 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk052 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked053 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk053 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked054 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk054 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked055 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk055 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

theorem pairBatch006_checked :
    seedBatch006.all (fun seeds => rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seeds (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks) = true := by
  simp only [seedBatch006, List.all_cons, List.all_nil, checked048, checked049, checked050, checked051, checked052, checked053, checked054, checked055, Bool.true_and]

end FranklSpanFour.Graph.Certificate
