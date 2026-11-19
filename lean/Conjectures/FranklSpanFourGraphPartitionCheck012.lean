module

public import Conjectures.FranklSpanFourGraphTables
public import Conjectures.FranklSpanFourGraphPartition
public import Conjectures.FranklSmallCyclicCanonicalWords

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

theorem pairKeptPart096_partition_checked :
    retainedPartitionCheck pairKeptPart096 leftTable
      FranklSmallCyclic.CanonicalWords.count
      FranklSmallCyclic.CanonicalWords.codeAt = true := by
  decide +kernel

theorem pairKeptPart097_partition_checked :
    retainedPartitionCheck pairKeptPart097 leftTable
      FranklSmallCyclic.CanonicalWords.count
      FranklSmallCyclic.CanonicalWords.codeAt = true := by
  decide +kernel

theorem pairKeptPart098_partition_checked :
    retainedPartitionCheck pairKeptPart098 leftTable
      FranklSmallCyclic.CanonicalWords.count
      FranklSmallCyclic.CanonicalWords.codeAt = true := by
  decide +kernel

theorem pairKeptPart099_partition_checked :
    retainedPartitionCheck pairKeptPart099 leftTable
      FranklSmallCyclic.CanonicalWords.count
      FranklSmallCyclic.CanonicalWords.codeAt = true := by
  decide +kernel

theorem pairKeptPart100_partition_checked :
    retainedPartitionCheck pairKeptPart100 leftTable
      FranklSmallCyclic.CanonicalWords.count
      FranklSmallCyclic.CanonicalWords.codeAt = true := by
  decide +kernel

theorem pairKeptPart101_partition_checked :
    retainedPartitionCheck pairKeptPart101 leftTable
      FranklSmallCyclic.CanonicalWords.count
      FranklSmallCyclic.CanonicalWords.codeAt = true := by
  decide +kernel

theorem pairKeptPart102_partition_checked :
    retainedPartitionCheck pairKeptPart102 leftTable
      FranklSmallCyclic.CanonicalWords.count
      FranklSmallCyclic.CanonicalWords.codeAt = true := by
  decide +kernel

theorem pairKeptPart103_partition_checked :
    retainedPartitionCheck pairKeptPart103 leftTable
      FranklSmallCyclic.CanonicalWords.count
      FranklSmallCyclic.CanonicalWords.codeAt = true := by
  decide +kernel

end FranklSpanFour.Graph.Certificate
