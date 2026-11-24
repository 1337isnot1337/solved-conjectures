module

public import Conjectures.AlexanderssonParkingExcedanceRoots
public import Conjectures.AlexanderssonParkingExcedanceWords

/-! The source question follows from the missing equality with the exact row.
This module deliberately does not assert or assume that equality globally. -/

@[expose] public section

namespace AlexanderssonParkingExcedance

open Polynomial

/-- Identifying the literal word enumerator with the checked row suffices.
The hypothesis is the remaining combinatorial bridge, not a project axiom. -/
theorem literal_nonreal_of_row_eq
    (h : polynomial 17 = polynomialOfList row17) :
    ∃ z : ℂ, ((polynomial 17).map Complex.ofRealHom).IsRoot z ∧ z.im ≠ 0 := by
  rw [h]
  exact row17_nonreal_root

end AlexanderssonParkingExcedance
