module

public import Conjectures.FranklSpanFourGraphTables
public import Conjectures.FranklSpanFourGraphPartition

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

theorem leftTablePart040_rank_checked :
    rankTableCheck 6 leftTablePart040 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart041_rank_checked :
    rankTableCheck 6 leftTablePart041 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart042_rank_checked :
    rankTableCheck 6 leftTablePart042 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart043_rank_checked :
    rankTableCheck 6 leftTablePart043 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart044_rank_checked :
    rankTableCheck 6 leftTablePart044 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart045_rank_checked :
    rankTableCheck 6 leftTablePart045 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart046_rank_checked :
    rankTableCheck 6 leftTablePart046 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart047_rank_checked :
    rankTableCheck 6 leftTablePart047 residualKept residualRanks = true := by
  decide +kernel

end FranklSpanFour.Graph.Certificate
