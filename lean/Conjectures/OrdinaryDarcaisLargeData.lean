import Conjectures.OrdinaryDarcaisScalar

/-! Exact scalar witnesses for the ordinary sigma-one factorial recurrence.
Every stored number is checked against that recurrence in the proof modules. -/

namespace OrdinaryDarcais

def largeDigitBase : ℕ := 2^8192

open Lean Elab Term in
elab "ordinaryMassWitnesses" : term => return toExpr (scalarTable 2 501)

open Lean Elab Term in
elab "ordinaryPackedWitnesses" : term => return toExpr (scalarTable (1+largeDigitBase) 501)

set_option maxRecDepth 10000 in
def largeMassData : Array ℕ := ordinaryMassWitnesses

set_option maxRecDepth 10000 in
def largePackedData : Array ℕ := ordinaryPackedWitnesses

def largeMass (n : ℕ) : ℕ := largeMassData[n]?.getD 0
def largePacked (n : ℕ) : ℕ := largePackedData[n]?.getD 0

end OrdinaryDarcais
