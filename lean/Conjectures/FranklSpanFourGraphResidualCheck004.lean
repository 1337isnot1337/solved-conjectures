module

public import Conjectures.FranklSpanFourGraphTables
public import Conjectures.FranklSpanFourGraphPartition

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

theorem leftTablePart032_rank_checked :
    rankTableCheck 6 leftTablePart032 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart033_rank_checked :
    rankTableCheck 6 leftTablePart033 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart034_rank_checked :
    rankTableCheck 6 leftTablePart034 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart035_rank_checked :
    rankTableCheck 6 leftTablePart035 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart036_rank_checked :
    rankTableCheck 6 leftTablePart036 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart037_rank_checked :
    rankTableCheck 6 leftTablePart037 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart038_rank_checked :
    rankTableCheck 6 leftTablePart038 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart039_rank_checked :
    rankTableCheck 6 leftTablePart039 residualKept residualRanks = true := by
  decide +kernel

end FranklSpanFour.Graph.Certificate
