module

public import Conjectures.FranklSpanFourGraphTables
public import Conjectures.FranklSpanFourGraphPartition

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

theorem leftTablePart024_rank_checked :
    rankTableCheck 6 leftTablePart024 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart025_rank_checked :
    rankTableCheck 6 leftTablePart025 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart026_rank_checked :
    rankTableCheck 6 leftTablePart026 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart027_rank_checked :
    rankTableCheck 6 leftTablePart027 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart028_rank_checked :
    rankTableCheck 6 leftTablePart028 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart029_rank_checked :
    rankTableCheck 6 leftTablePart029 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart030_rank_checked :
    rankTableCheck 6 leftTablePart030 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart031_rank_checked :
    rankTableCheck 6 leftTablePart031 residualKept residualRanks = true := by
  decide +kernel

end FranklSpanFour.Graph.Certificate
