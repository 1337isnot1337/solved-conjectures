module

public import Conjectures.FranklSpanFourGraphTables
public import Conjectures.FranklSpanFourGraphPartition

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

theorem leftTablePart000_rank_checked :
    rankTableCheck 6 leftTablePart000 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart001_rank_checked :
    rankTableCheck 6 leftTablePart001 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart002_rank_checked :
    rankTableCheck 6 leftTablePart002 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart003_rank_checked :
    rankTableCheck 6 leftTablePart003 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart004_rank_checked :
    rankTableCheck 6 leftTablePart004 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart005_rank_checked :
    rankTableCheck 6 leftTablePart005 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart006_rank_checked :
    rankTableCheck 6 leftTablePart006 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart007_rank_checked :
    rankTableCheck 6 leftTablePart007 residualKept residualRanks = true := by
  decide +kernel

end FranklSpanFour.Graph.Certificate
