module

public import Conjectures.FranklSpanFourGraphTables
public import Conjectures.FranklSpanFourGraphSeedData

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

private theorem checked184 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk184 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked185 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk185 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked186 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk186 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked187 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk187 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked188 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk188 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked189 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk189 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked190 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk190 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked191 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk191 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

theorem pairBatch023_checked :
    seedBatch023.all (fun seeds => rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seeds (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks) = true := by
  simp only [seedBatch023, List.all_cons, List.all_nil, checked184, checked185, checked186, checked187, checked188, checked189, checked190, checked191, Bool.true_and]

end FranklSpanFour.Graph.Certificate
