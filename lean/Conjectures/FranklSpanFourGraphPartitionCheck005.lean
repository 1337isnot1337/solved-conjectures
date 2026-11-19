module

public import Conjectures.FranklSpanFourGraphTables
public import Conjectures.FranklSpanFourGraphPartition
public import Conjectures.FranklSmallCyclicCanonicalWords

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

theorem pairKeptPart040_partition_checked :
    retainedPartitionCheck pairKeptPart040 leftTable
      FranklSmallCyclic.CanonicalWords.count
      FranklSmallCyclic.CanonicalWords.codeAt = true := by
  decide +kernel

theorem pairKeptPart041_partition_checked :
    retainedPartitionCheck pairKeptPart041 leftTable
      FranklSmallCyclic.CanonicalWords.count
      FranklSmallCyclic.CanonicalWords.codeAt = true := by
  decide +kernel

theorem pairKeptPart042_partition_checked :
    retainedPartitionCheck pairKeptPart042 leftTable
      FranklSmallCyclic.CanonicalWords.count
      FranklSmallCyclic.CanonicalWords.codeAt = true := by
  decide +kernel

theorem pairKeptPart043_partition_checked :
    retainedPartitionCheck pairKeptPart043 leftTable
      FranklSmallCyclic.CanonicalWords.count
      FranklSmallCyclic.CanonicalWords.codeAt = true := by
  decide +kernel

theorem pairKeptPart044_partition_checked :
    retainedPartitionCheck pairKeptPart044 leftTable
      FranklSmallCyclic.CanonicalWords.count
      FranklSmallCyclic.CanonicalWords.codeAt = true := by
  decide +kernel

theorem pairKeptPart045_partition_checked :
    retainedPartitionCheck pairKeptPart045 leftTable
      FranklSmallCyclic.CanonicalWords.count
      FranklSmallCyclic.CanonicalWords.codeAt = true := by
  decide +kernel

theorem pairKeptPart046_partition_checked :
    retainedPartitionCheck pairKeptPart046 leftTable
      FranklSmallCyclic.CanonicalWords.count
      FranklSmallCyclic.CanonicalWords.codeAt = true := by
  decide +kernel

theorem pairKeptPart047_partition_checked :
    retainedPartitionCheck pairKeptPart047 leftTable
      FranklSmallCyclic.CanonicalWords.count
      FranklSmallCyclic.CanonicalWords.codeAt = true := by
  decide +kernel

end FranklSpanFour.Graph.Certificate
