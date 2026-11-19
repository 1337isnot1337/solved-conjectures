import Mathlib.Data.Fintype.Perm
import Mathlib.Data.Fin.VecNotation
import Mathlib.Data.Int.Basic

/-! Computable finite-plane tests. The eight positive patterns list the two
critical quadruples with one coordinate repeated. The second direction is
an arbitrary signed permutation, with its first sign fixed to `+1`. -/

namespace Loneliness.PlaneCertificate

abbrev Vector := Fin 5 → ℤ

def canonical (i : Fin 8) : Vector :=
  ![![1,1,2,3,4], ![1,2,2,3,4], ![1,2,3,3,4], ![1,2,3,4,4],
    ![1,1,3,4,7], ![1,3,3,4,7], ![1,3,4,4,7], ![1,3,4,7,7]] i

def signs (mask : Fin 16) (i : Fin 5) : ℤ :=
  if i = 0 then 1 else if Nat.testBit mask.val (i.val - 1) then 1 else -1

def candidate (j : Fin 8) (p : Equiv.Perm (Fin 5)) (mask : Fin 16) : Vector :=
  fun i => signs mask i * canonical j (p i)

def absoluteCoordinates (u : Vector) : List ℕ := List.ofFn (fun i => (u i).natAbs)

def minimumAbsolute (u : Vector) : ℕ :=
  (absoluteCoordinates u).foldl min (u 0).natAbs

def scaledSupportTest (u : Vector) (base : List ℕ) : Bool :=
  let xs := absoluteCoordinates u
  let m := minimumAbsolute u
  xs.all (fun a => base.any (fun b => a == m * b)) &&
    base.all (fun b => xs.any (fun a => a == m * b))

def criticalSupportTest (u : Vector) : Bool :=
  scaledSupportTest u [1,2,3,4] || scaledSupportTest u [1,3,4,7]

def nonzeroTest (u : Vector) : Bool := (List.ofFn u).all (fun a => a != 0)

def repeatedLine (q c : Vector) (i j : Fin 5) (ε : ℤ) : Vector :=
  fun k => (q i - ε * q j) * c k - (c i - ε * c j) * q k

def lineTest (u : Vector) : Bool := !nonzeroTest u || criticalSupportTest u

def admissibleTest (q c : Vector) : Bool :=
  (List.finRange 5).all fun i =>
    (List.finRange 5).all fun j =>
      if i < j then
        lineTest (repeatedLine q c i j 1) && lineTest (repeatedLine q c i j (-1))
      else true

def remainingCoordinates (j : Fin 5) : List (Fin 5) :=
  (List.finRange 5).filter (fun i => i != j)

def freeCoordinateTest (q c : Vector) (j : Fin 5) : Bool :=
  let other := remainingCoordinates j
  let base := other.map (fun i => (q i).natAbs)
  ((base == [1,2,3,4]) || (base == [1,3,4,7])) &&
    other.all (fun i => other.all (fun k => q i * c k == q k * c i))

def productTest (q c : Vector) : Bool :=
  (List.finRange 5).any (freeCoordinateTest q c)

def pairTest (q c : Vector) : Bool := !admissibleTest q c || productTest q c

def caseCheck (i j : Fin 8) : Bool :=
  (permsOfList (List.finRange 5)).all fun p =>
    (List.finRange 16).all fun mask => pairTest (canonical i) (candidate j p mask)

end Loneliness.PlaneCertificate
