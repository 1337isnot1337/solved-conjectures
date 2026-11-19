module

public import Conjectures.FranklSpanFourGraphTables
public import Conjectures.FranklSpanFourGraphPartition
public import Conjectures.FranklSmallCyclicCanonicalWords

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

theorem pairKeptPart056_partition_checked :
    retainedPartitionCheck pairKeptPart056 leftTable
      FranklSmallCyclic.CanonicalWords.count
      FranklSmallCyclic.CanonicalWords.codeAt = true := by
  decide +kernel

theorem pairKeptPart057_partition_checked :
    retainedPartitionCheck pairKeptPart057 leftTable
      FranklSmallCyclic.CanonicalWords.count
      FranklSmallCyclic.CanonicalWords.codeAt = true := by
  decide +kernel

theorem pairKeptPart058_partition_checked :
    retainedPartitionCheck pairKeptPart058 leftTable
      FranklSmallCyclic.CanonicalWords.count
      FranklSmallCyclic.CanonicalWords.codeAt = true := by
  decide +kernel

theorem pairKeptPart059_partition_checked :
    retainedPartitionCheck pairKeptPart059 leftTable
      FranklSmallCyclic.CanonicalWords.count
      FranklSmallCyclic.CanonicalWords.codeAt = true := by
  decide +kernel

theorem pairKeptPart060_partition_checked :
    retainedPartitionCheck pairKeptPart060 leftTable
      FranklSmallCyclic.CanonicalWords.count
      FranklSmallCyclic.CanonicalWords.codeAt = true := by
  decide +kernel

theorem pairKeptPart061_partition_checked :
    retainedPartitionCheck pairKeptPart061 leftTable
      FranklSmallCyclic.CanonicalWords.count
      FranklSmallCyclic.CanonicalWords.codeAt = true := by
  decide +kernel

theorem pairKeptPart062_partition_checked :
    retainedPartitionCheck pairKeptPart062 leftTable
      FranklSmallCyclic.CanonicalWords.count
      FranklSmallCyclic.CanonicalWords.codeAt = true := by
  decide +kernel

theorem pairKeptPart063_partition_checked :
    retainedPartitionCheck pairKeptPart063 leftTable
      FranklSmallCyclic.CanonicalWords.count
      FranklSmallCyclic.CanonicalWords.codeAt = true := by
  decide +kernel

end FranklSpanFour.Graph.Certificate
