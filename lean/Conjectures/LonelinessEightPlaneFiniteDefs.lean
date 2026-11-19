import Mathlib.Data.List.FinRange
import Mathlib.Data.Fintype.Pi
import Mathlib.Data.Fin.VecNotation
import Mathlib.Data.List.Dedup
import Mathlib.Data.Bool.Basic
import Lean.Elab.Tactic.Omega

/-! Finite integer data for the eight-coordinate plane argument. These
definitions make no assertion about the remaining numerical coverage. -/

namespace Loneliness.EightPlane

abbrev Vector := Fin 8 → ℤ
abbrev Domains := Fin 8 → List ℤ

def base : Fin 3 → Fin 7 → ℕ :=
  ![![1, 2, 3, 4, 5, 6, 7],
    ![1, 2, 3, 4, 5, 7, 12],
    ![1, 4, 5, 6, 7, 11, 13]]

def baseList (family : Fin 3) : List ℕ := List.ofFn (base family)

def canonical (family : Fin 3) (repeatIndex : Fin 7) : Vector :=
  Fin.lastCases (base family repeatIndex : ℤ) (fun i => (base family i : ℤ))

theorem base_positive : ∀ family : Fin 3, ∀ a ∈ baseList family, 0 < a := by
  decide +kernel

theorem base_anchor : ∀ family : Fin 3, base family 0 = 1 := by
  decide +kernel

/-- The nonzero absolute support is exactly a positive integer scaling
of one of the three primitive seven-speed bases. Multiplicities are retained
in the vector, but this predicate concerns its support. -/
def KnownShape (q : Vector) : Prop :=
  ∃ (family : Fin 3) (d : ℕ), 0 < d ∧
    (∀ i, (q i).natAbs ∈ (baseList family).map (fun a => d * a)) ∧
    (∀ a ∈ baseList family, ∃ i, (q i).natAbs = d * a)

def LineAllowed (q : Vector) : Prop := (∃ i, q i = 0) ∨ KnownShape q

def repeatVector (w z : Vector) (i j : Fin 8) (sign : ℤ) : Vector :=
  fun k => (w i - sign * w j) * z k - (z i - sign * z j) * w k

def RepeatTests (w z : Vector) : Prop :=
  ∀ (i j : Fin 8), i ≠ j → ∀ sign : ℤ, sign = 1 ∨ sign = -1 →
    (w i - sign * w j ≠ 0 ∨ z i - sign * z j ≠ 0) ∧
      LineAllowed (repeatVector w z i j sign)

end Loneliness.EightPlane

