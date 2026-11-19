module

public import Conjectures.FranklSpanFourGraphTables
public import Conjectures.FranklSpanFourGraphPartition

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

theorem leftTablePart048_rank_checked :
    rankTableCheck 6 leftTablePart048 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart049_rank_checked :
    rankTableCheck 6 leftTablePart049 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart050_rank_checked :
    rankTableCheck 6 leftTablePart050 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart051_rank_checked :
    rankTableCheck 6 leftTablePart051 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart052_rank_checked :
    rankTableCheck 6 leftTablePart052 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart053_rank_checked :
    rankTableCheck 6 leftTablePart053 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart054_rank_checked :
    rankTableCheck 6 leftTablePart054 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart055_rank_checked :
    rankTableCheck 6 leftTablePart055 residualKept residualRanks = true := by
  decide +kernel

end FranklSpanFour.Graph.Certificate
