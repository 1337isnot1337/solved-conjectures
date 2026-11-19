module

public import Conjectures.FranklSpanFourGraphTables
public import Conjectures.FranklSpanFourGraphPartition
public import Conjectures.FranklSmallCyclicCanonicalWords

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

theorem pairKeptPart120_partition_checked :
    retainedPartitionCheck pairKeptPart120 leftTable
      FranklSmallCyclic.CanonicalWords.count
      FranklSmallCyclic.CanonicalWords.codeAt = true := by
  decide +kernel

theorem pairKeptPart121_partition_checked :
    retainedPartitionCheck pairKeptPart121 leftTable
      FranklSmallCyclic.CanonicalWords.count
      FranklSmallCyclic.CanonicalWords.codeAt = true := by
  decide +kernel

theorem pairKeptPart122_partition_checked :
    retainedPartitionCheck pairKeptPart122 leftTable
      FranklSmallCyclic.CanonicalWords.count
      FranklSmallCyclic.CanonicalWords.codeAt = true := by
  decide +kernel

theorem pairKeptPart123_partition_checked :
    retainedPartitionCheck pairKeptPart123 leftTable
      FranklSmallCyclic.CanonicalWords.count
      FranklSmallCyclic.CanonicalWords.codeAt = true := by
  decide +kernel

theorem pairKeptPart124_partition_checked :
    retainedPartitionCheck pairKeptPart124 leftTable
      FranklSmallCyclic.CanonicalWords.count
      FranklSmallCyclic.CanonicalWords.codeAt = true := by
  decide +kernel

theorem pairKeptPart125_partition_checked :
    retainedPartitionCheck pairKeptPart125 leftTable
      FranklSmallCyclic.CanonicalWords.count
      FranklSmallCyclic.CanonicalWords.codeAt = true := by
  decide +kernel

theorem pairKeptPart126_partition_checked :
    retainedPartitionCheck pairKeptPart126 leftTable
      FranklSmallCyclic.CanonicalWords.count
      FranklSmallCyclic.CanonicalWords.codeAt = true := by
  decide +kernel

theorem pairKeptPart127_partition_checked :
    retainedPartitionCheck pairKeptPart127 leftTable
      FranklSmallCyclic.CanonicalWords.count
      FranklSmallCyclic.CanonicalWords.codeAt = true := by
  decide +kernel

end FranklSpanFour.Graph.Certificate
