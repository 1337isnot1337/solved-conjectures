module

public import Conjectures.FranklSpanFourGraphTables
public import Conjectures.FranklSpanFourGraphSeedData

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

private theorem checked040 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk040 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked041 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk041 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked042 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk042 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked043 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk043 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked044 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk044 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked045 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk045 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked046 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk046 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked047 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk047 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

theorem pairBatch005_checked :
    seedBatch005.all (fun seeds => rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seeds (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks) = true := by
  simp only [seedBatch005, List.all_cons, List.all_nil, checked040, checked041, checked042, checked043, checked044, checked045, checked046, checked047, Bool.true_and]

end FranklSpanFour.Graph.Certificate
