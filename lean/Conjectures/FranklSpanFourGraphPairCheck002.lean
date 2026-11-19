module

public import Conjectures.FranklSpanFourGraphTables
public import Conjectures.FranklSpanFourGraphSeedData

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

private theorem checked016 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk016 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked017 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk017 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked018 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk018 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked019 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk019 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked020 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk020 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked021 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk021 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked022 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk022 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked023 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk023 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

theorem pairBatch002_checked :
    seedBatch002.all (fun seeds => rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seeds (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks) = true := by
  simp only [seedBatch002, List.all_cons, List.all_nil, checked016, checked017, checked018, checked019, checked020, checked021, checked022, checked023, Bool.true_and]

end FranklSpanFour.Graph.Certificate
