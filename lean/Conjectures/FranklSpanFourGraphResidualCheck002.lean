module

public import Conjectures.FranklSpanFourGraphTables
public import Conjectures.FranklSpanFourGraphPartition

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

theorem leftTablePart016_rank_checked :
    rankTableCheck 6 leftTablePart016 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart017_rank_checked :
    rankTableCheck 6 leftTablePart017 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart018_rank_checked :
    rankTableCheck 6 leftTablePart018 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart019_rank_checked :
    rankTableCheck 6 leftTablePart019 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart020_rank_checked :
    rankTableCheck 6 leftTablePart020 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart021_rank_checked :
    rankTableCheck 6 leftTablePart021 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart022_rank_checked :
    rankTableCheck 6 leftTablePart022 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart023_rank_checked :
    rankTableCheck 6 leftTablePart023 residualKept residualRanks = true := by
  decide +kernel

end FranklSpanFour.Graph.Certificate
