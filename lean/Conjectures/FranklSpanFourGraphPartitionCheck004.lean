module

public import Conjectures.FranklSpanFourGraphTables
public import Conjectures.FranklSpanFourGraphPartition
public import Conjectures.FranklSmallCyclicCanonicalWords

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

theorem pairKeptPart032_partition_checked :
    retainedPartitionCheck pairKeptPart032 leftTable
      FranklSmallCyclic.CanonicalWords.count
      FranklSmallCyclic.CanonicalWords.codeAt = true := by
  decide +kernel

theorem pairKeptPart033_partition_checked :
    retainedPartitionCheck pairKeptPart033 leftTable
      FranklSmallCyclic.CanonicalWords.count
      FranklSmallCyclic.CanonicalWords.codeAt = true := by
  decide +kernel

theorem pairKeptPart034_partition_checked :
    retainedPartitionCheck pairKeptPart034 leftTable
      FranklSmallCyclic.CanonicalWords.count
      FranklSmallCyclic.CanonicalWords.codeAt = true := by
  decide +kernel

theorem pairKeptPart035_partition_checked :
    retainedPartitionCheck pairKeptPart035 leftTable
      FranklSmallCyclic.CanonicalWords.count
      FranklSmallCyclic.CanonicalWords.codeAt = true := by
  decide +kernel

theorem pairKeptPart036_partition_checked :
    retainedPartitionCheck pairKeptPart036 leftTable
      FranklSmallCyclic.CanonicalWords.count
      FranklSmallCyclic.CanonicalWords.codeAt = true := by
  decide +kernel

theorem pairKeptPart037_partition_checked :
    retainedPartitionCheck pairKeptPart037 leftTable
      FranklSmallCyclic.CanonicalWords.count
      FranklSmallCyclic.CanonicalWords.codeAt = true := by
  decide +kernel

theorem pairKeptPart038_partition_checked :
    retainedPartitionCheck pairKeptPart038 leftTable
      FranklSmallCyclic.CanonicalWords.count
      FranklSmallCyclic.CanonicalWords.codeAt = true := by
  decide +kernel

theorem pairKeptPart039_partition_checked :
    retainedPartitionCheck pairKeptPart039 leftTable
      FranklSmallCyclic.CanonicalWords.count
      FranklSmallCyclic.CanonicalWords.codeAt = true := by
  decide +kernel

end FranklSpanFour.Graph.Certificate
