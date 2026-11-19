module

public import Conjectures.FranklSpanFourGraphTables
public import Conjectures.FranklSpanFourGraphPartition

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

theorem leftTablePart008_rank_checked :
    rankTableCheck 6 leftTablePart008 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart009_rank_checked :
    rankTableCheck 6 leftTablePart009 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart010_rank_checked :
    rankTableCheck 6 leftTablePart010 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart011_rank_checked :
    rankTableCheck 6 leftTablePart011 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart012_rank_checked :
    rankTableCheck 6 leftTablePart012 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart013_rank_checked :
    rankTableCheck 6 leftTablePart013 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart014_rank_checked :
    rankTableCheck 6 leftTablePart014 residualKept residualRanks = true := by
  decide +kernel

theorem leftTablePart015_rank_checked :
    rankTableCheck 6 leftTablePart015 residualKept residualRanks = true := by
  decide +kernel

end FranklSpanFour.Graph.Certificate
