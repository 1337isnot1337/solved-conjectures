import Mathlib.Data.Fintype.Perm
import Mathlib.Data.Fin.VecNotation
import Mathlib.Data.Int.Basic

/-! Finite tests for the six-coordinate plane gap. The canonical vectors are
the two tight five-speed patterns with one entry repeated, in increasing order.
The second direction is an arbitrary signed permutation, modulo global sign. -/

namespace Loneliness.SixPlane

abbrev Vector := Fin 6 → ℤ

def canonical (i : Fin 10) : Vector :=
  ![![1,1,2,3,4,5], ![1,2,2,3,4,5], ![1,2,3,3,4,5],
    ![1,2,3,4,4,5], ![1,2,3,4,5,5],
    ![1,1,3,4,5,9], ![1,3,3,4,5,9], ![1,3,4,4,5,9],
    ![1,3,4,5,5,9], ![1,3,4,5,9,9]] i

def signs (mask : Fin 32) (i : Fin 6) : ℤ :=
  if i = 0 then 1 else if Nat.testBit mask.val (i.val - 1) then 1 else -1

def candidate (j : Fin 10) (p : Equiv.Perm (Fin 6)) (mask : Fin 32) : Vector :=
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
  scaledSupportTest u [1,2,3,4,5] || scaledSupportTest u [1,3,4,5,9]

def nonzeroTest (u : Vector) : Bool := (List.ofFn u).all (fun a => a != 0)

def repeatedLine (q c : Vector) (i j : Fin 6) (ε : ℤ) : Vector :=
  fun k => (q i - ε * q j) * c k - (c i - ε * c j) * q k

def lineTest (u : Vector) : Bool := !nonzeroTest u || criticalSupportTest u

def admissibleTest (q c : Vector) : Bool :=
  (List.finRange 6).all fun i =>
    (List.finRange 6).all fun j =>
      if i < j then
        lineTest (repeatedLine q c i j 1) && lineTest (repeatedLine q c i j (-1))
      else true

/-- Literal columns of the two product planes and the third critical plane. -/
def standard {K : Type*} [Semiring K] (kind : Fin 3) (s t : K) : Fin 6 → K :=
  ![![s,2*s,3*s,4*s,5*s,t],
    ![s,3*s,4*s,5*s,9*s,t],
    ![s,t,s+t,2*s+t,3*s+t,3*s+2*t]] kind

def literalTest (kind : Fin 3) (w : Vector) : Bool :=
  let s := w 0
  let t := if kind = 2 then w 1 else w 5
  (List.finRange 6).all fun i => w i == standard kind s t i

def fullSigns (mask : Fin 64) (i : Fin 6) : ℤ :=
  if Nat.testBit mask.val i.val then 1 else -1

structure Acceptance where
  kind : Fin 3
  permutation : Equiv.Perm (Fin 6)
  mask : Fin 64

def Acceptance.transform (r : Acceptance) (w : Vector) : Vector :=
  fun i => fullSigns r.mask i * w (r.permutation i)

def acceptanceCheck (q c : Vector) (r : Acceptance) : Bool :=
  literalTest r.kind (r.transform q) && literalTest r.kind (r.transform c)

def rejectionSign (positive : Bool) : ℤ := if positive then 1 else -1

inductive PairCertificate where
  | dependent
  | coordinate (first second : Fin 6) (positive : Bool)
  | line (first second : Fin 6) (positive : Bool)
  | accepted (witness : Acceptance)

/-- Every rejection includes its exact obstruction. The dependent branch uses
the canonical first coordinate `q 0 = 1`; its soundness requires that identity. -/
def certificateCheck (q c : Vector) : PairCertificate → Bool
  | .dependent => (List.finRange 6).all fun i => c i == c 0 * q i
  | .coordinate i j positive =>
      decide (i < j) && (q i == rejectionSign positive * q j) &&
        (c i == rejectionSign positive * c j)
  | .line i j positive =>
      let u := repeatedLine q c i j (rejectionSign positive)
      decide (i < j) && nonzeroTest u && !criticalSupportTest u
  | .accepted r => acceptanceCheck q c r

def CandidatePairsChecked : Prop :=
  ∀ (i j : Fin 10) (p : Equiv.Perm (Fin 6)) (mask : Fin 32),
    ∃ certificate : PairCertificate,
      certificateCheck (canonical i) (candidate j p mask) certificate = true

end Loneliness.SixPlane
