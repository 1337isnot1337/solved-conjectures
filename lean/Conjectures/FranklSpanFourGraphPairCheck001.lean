module

public import Conjectures.FranklSpanFourGraphTables
public import Conjectures.FranklSpanFourGraphSeedData

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

private theorem checked008 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk008 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked009 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk009 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked010 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk010 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked011 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk011 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked012 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk012 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked013 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk013 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked014 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk014 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

private theorem checked015 :
    rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seedChunk015 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  decide +kernel

theorem pairBatch001_checked :
    seedBatch001.all (fun seeds => rankCodeCheck 6
      (edgeCodesFrom PrefixCertificate.level4 seeds (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks) = true := by
  simp only [seedBatch001, List.all_cons, List.all_nil, checked008, checked009, checked010, checked011, checked012, checked013, checked014, checked015, Bool.true_and]

end FranklSpanFour.Graph.Certificate
