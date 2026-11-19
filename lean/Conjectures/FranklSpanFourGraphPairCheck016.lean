module

public import Conjectures.FranklSpanFourGraphTables
public import Conjectures.FranklSpanFourGraphSeedData

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

private theorem checked128 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk128 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked129 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk129 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked130 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk130 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked131 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk131 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked132 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk132 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked133 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk133 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked134 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk134 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked135 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk135 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

theorem pairBatch016_checked :
    seedBatch016.all (fun seeds => rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seeds (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks) = true := by
  simp only [seedBatch016, List.all_cons, List.all_nil, checked128, checked129, checked130, checked131, checked132, checked133, checked134, checked135, Bool.true_and]

end FranklSpanFour.Graph.Certificate
