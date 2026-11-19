module

public import Conjectures.FranklSpanFourGraphTables
public import Conjectures.FranklSpanFourGraphSeedData

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

private theorem checked088 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk088 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked089 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk089 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked090 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk090 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked091 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk091 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked092 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk092 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked093 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk093 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked094 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk094 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked095 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk095 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

theorem pairBatch011_checked :
    seedBatch011.all (fun seeds => rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seeds (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks) = true := by
  simp only [seedBatch011, List.all_cons, List.all_nil, checked088, checked089, checked090, checked091, checked092, checked093, checked094, checked095, Bool.true_and]

end FranklSpanFour.Graph.Certificate
