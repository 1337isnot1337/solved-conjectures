import Conjectures.HeimNeuhauserPlanePartitionScalar

/-! Two exact scalar evaluations of each shifted polynomial. The emitted numbers
are witnesses. The kernel checks the original recurrence separately at both arguments. -/

namespace PlanePartition

def digitBase : ℕ := 2 ^ 4096

open Lean Elab Term in
elab "planePartitionMassData" : term => return toExpr (scalarTable 2 251)

open Lean Elab Term in
elab "planePartitionPackedData" : term => return toExpr (scalarTable (1 + digitBase) 251)

set_option maxRecDepth 10000 in
def massData : Array ℕ := planePartitionMassData

set_option maxRecDepth 10000 in
def packedData : Array ℕ := planePartitionPackedData

def massAt (n : ℕ) : ℕ := massData[n]?.getD 0

def packedAt (n : ℕ) : ℕ := packedData[n]?.getD 0

end PlanePartition
