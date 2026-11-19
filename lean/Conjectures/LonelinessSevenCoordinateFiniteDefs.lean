import Conjectures.LonelinessSevenCoordinateDefs
import Mathlib.Data.Finset.Card
import Mathlib.Data.Finset.Image
import Mathlib.Data.Fintype.Pi
import Mathlib.Tactic

/-! Finite necessary tests for canonical seven-coordinate critical planes.
The numerical checker has no analytic input. Its later interpretation must
prove both the repeat-line tests and the tangent constraints from the actual
plane-value bound. -/

namespace Loneliness.SevenCoordinateCritical.Finite

def sixSet : Finset ℕ := {1,2,3,4,5,6}

def sign (positive : Bool) : ℤ := if positive then 1 else -1

def small (a : Fin 12) : ℤ :=
  if a.val < 6 then (a.val : ℤ)-6 else (a.val : ℤ)-5

def signed (positive : Bool) (n : ℕ) : ℤ := sign positive * n

/-- The two unaffected complementary pairs have one common sign each.
The other pair and the seventh coordinate are free in the twelve nonzero
integers of absolute value at most six. -/
def reduced (k : Fin 6) (left right : Bool) (a b c : Fin 12) : Vector :=
  match k.val with
  | 0 | 5 => ![small a, signed left 2, signed right 3,
      signed right 4, signed left 5, small b, small c]
  | 1 | 4 => ![signed left 1, small a, signed right 3,
      signed right 4, small b, signed left 6, small c]
  | _ => ![signed left 1, signed right 2, small a,
      small b, signed right 5, signed left 6, small c]

def absoluteSupport (w : Vector) : Finset ℕ :=
  Finset.univ.image (fun i => (w i).natAbs)

def Candidate (w : Vector) : Prop :=
  0 < w 0 ∧ absoluteSupport w = sixSet

instance (w : Vector) : Decidable (Candidate w) :=
  inferInstanceAs (Decidable (_ ∧ _))

def leastAbs (w : Vector) : ℕ :=
  (List.ofFn (fun i => (w i).natAbs)).foldr min ((w 0).natAbs)

def dividedSupport (w : Vector) : Finset ℕ :=
  Finset.univ.image (fun i => (w i).natAbs / leastAbs w)

def RepeatShape (w : Vector) : Prop :=
  0 < leastAbs w ∧ (∀ i, leastAbs w ∣ (w i).natAbs) ∧ dividedSupport w = sixSet

instance (w : Vector) : Decidable (RepeatShape w) :=
  inferInstanceAs (Decidable (_ ∧ _ ∧ _))

def repeatVector (w z : Vector) (i j : Fin 7) (positive : Bool) : Vector :=
  fun a => (w i - sign positive * w j) * z a -
    (z i - sign positive * z j) * w a

/-- Every tested signed repeat line is either a coordinate-zero line or
has exactly the consecutive six absolute speeds after primitive scaling.
Forced equalities on the whole plane are excluded explicitly. -/
def RepeatTests (w z : Vector) : Prop :=
  ∀ i j : Fin 7, j < i → ∀ positive : Bool,
    ¬ (w i = sign positive * w j ∧ z i = sign positive * z j) ∧
    ((∃ a, repeatVector w z i j positive a = 0) ∨
      RepeatShape (repeatVector w z i j positive))

instance (w z : Vector) : Decidable (RepeatTests w z) := by
  unfold RepeatTests
  infer_instance

def collinearCoordinates (w z : Vector) (i : Fin 7) : Finset (Fin 7) :=
  Finset.univ.filter (fun j => w i * z j = z i * w j)

/-- Six coordinate forms are proportional and their first coefficients
have precisely the six consecutive absolute values. -/
def ProductForm (w z : Vector) : Prop :=
  ∃ i : Fin 7, (collinearCoordinates w z i).card = 6 ∧
    ((collinearCoordinates w z i).image (fun j => (w j).natAbs)) = sixSet

instance (w z : Vector) : Decidable (ProductForm w z) := by
  unfold ProductForm
  infer_instance

def CaseValid (k : Fin 6) (left right : Bool) (a b c : Fin 12) : Prop :=
  let z := reduced k left right a b c
  Candidate z → RepeatTests (canonical k) z → ProductForm (canonical k) z

instance (k : Fin 6) (left right : Bool) (a b c : Fin 12) :
    Decidable (CaseValid k left right a b c) := by
  unfold CaseValid
  infer_instance

end Loneliness.SevenCoordinateCritical.Finite
