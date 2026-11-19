module

public import Conjectures.FranklSpanFourGraphTables
public import Conjectures.FranklSpanFourGraphPartition

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

theorem leftTablePart056_rank_checked :
    rankTableCheck 6 leftTablePart056 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart057_rank_checked :
    rankTableCheck 6 leftTablePart057 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart058_rank_checked :
    rankTableCheck 6 leftTablePart058 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart059_rank_checked :
    rankTableCheck 6 leftTablePart059 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart060_rank_checked :
    rankTableCheck 6 leftTablePart060 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart061_rank_checked :
    rankTableCheck 6 leftTablePart061 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart062_rank_checked :
    rankTableCheck 6 leftTablePart062 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart063_rank_checked :
    rankTableCheck 6 leftTablePart063 residualKept residualRanks = true := by
  decide +kernel

end FranklSpanFour.Graph.Certificate
