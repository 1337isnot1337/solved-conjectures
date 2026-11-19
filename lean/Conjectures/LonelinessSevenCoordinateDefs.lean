import Mathlib.Data.Fin.VecNotation
import Mathlib.Data.Int.Basic
import Mathlib.Algebra.Order.Group.Unbundled.Int

/-! The six canonical repeat vectors for seven-coordinate critical planes.
These definitions have no dependency on the geometric reduction. -/

namespace Loneliness.SevenCoordinateCritical

abbrev Vector := Fin 7 → ℤ

def sixBase : List ℕ := [1,2,3,4,5,6]

def canonical (k : Fin 6) : Vector :=
  ![1,2,3,4,5,6, ((k.val+1 : ℕ) : ℤ)]

theorem canonical_positive : ∀ (k : Fin 6) (i : Fin 7), 0 < canonical k i := by
  decide +kernel

theorem canonical_absolute_list : ∀ k : Fin 6,
    List.ofFn (fun i => (canonical k i).natAbs) = sixBase ++ [k.val+1] := by
  decide +kernel

theorem canonical_abs_le_six : ∀ (k : Fin 6) (i : Fin 7), |canonical k i| ≤ 6 := by
  decide +kernel

end Loneliness.SevenCoordinateCritical
