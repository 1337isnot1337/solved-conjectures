module

public import Conjectures.FranklSpanFourGraphTables
public import Conjectures.FranklSpanFourGraphSeedData

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

private theorem checked160 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk160 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked161 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk161 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked162 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk162 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked163 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk163 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked164 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk164 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked165 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk165 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked166 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk166 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked167 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk167 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

theorem pairBatch020_checked :
    seedBatch020.all (fun seeds => rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seeds (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks) = true := by
  simp only [seedBatch020, List.all_cons, List.all_nil, checked160, checked161, checked162, checked163, checked164, checked165, checked166, checked167, Bool.true_and]

end FranklSpanFour.Graph.Certificate
