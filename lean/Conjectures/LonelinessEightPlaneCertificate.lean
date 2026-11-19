import Conjectures.LonelinessEightPlaneDomains

/-! Certificates choose the failed repeat-line test and a concrete
obstruction for each possible base/scale ratio. The kernel checks those
witnesses, rather than searching for them. -/

namespace Loneliness.EightPlane

/-- Codes 0..7 reject a coordinate domain; codes 8..14 exhibit an uncovered
base entry. Code 15 is invalid and cannot justify a cut. -/
def obstructionCheck (domains : Domains) (w : Vector) (a b : ℤ)
    (family : Fin 3) (d code : ℕ) : Bool :=
  if h : code < 8 then
    (domains ⟨code, h⟩).all fun z =>
      (baseList family).all fun c => decide ((a * z - b * w ⟨code, h⟩).natAbs ≠ d * c)
  else if h' : code < 15 then
    let index : Fin 7 := ⟨code - 8, by omega⟩
    (List.finRange 8).all fun i =>
      (domains i).all fun z => decide ((a * z - b * w i).natAbs ≠ d * base family index)
  else false

def obstructionCode (codes : ℕ) (family : Fin 3) (index : Fin 7) : ℕ :=
  codes / 16 ^ (7 * family.val + index.val) % 16

def scalesRejected (domains : Domains) (w : Vector) (a b : ℤ)
    (anchor codes : ℕ) : Bool :=
  (List.finRange 3).all fun family =>
    (List.finRange 7).all fun index =>
      if anchor % base family index = 0 then
        obstructionCheck domains w a b family (anchor / base family index)
          (obstructionCode codes family index)
      else true

def cutCheck (w : Vector) (assigned : List ℤ) (remaining : List ℕ)
    (i j : Fin 8) (negative : Bool) (codes : ℕ) : Bool :=
  decide (j.val < i.val ∧ i.val < assigned.length) &&
    let sign : ℤ := if negative then -1 else 1
    let z := vectorOf assigned
    let a := w i - sign * w j
    let b := z i - sign * z j
    ((a == 0) && (b == 0)) ||
      (!(zeroPossible (coordinateDomains assigned remaining) w a b) &&
        scalesRejected (coordinateDomains assigned remaining) w a b
          (a * z 0 - b * w 0).natAbs codes)

inductive Certificate where
  | product
  | cut (i j : Fin 8) (negative : Bool) (codes : ℕ)
  | split (children : List Certificate)

def branchChoices (assigned : List ℤ) (remaining : List ℕ) : List ℤ :=
  if assigned.isEmpty then remaining.dedup.map (fun (r : ℕ) => (r : ℤ))
  else signedChoices remaining.dedup

def checkBranches (check : ℤ → Certificate → Bool) : List ℤ → List Certificate → Bool
  | [], [] => true
  | z :: zs, c :: cs => check z c && checkBranches check zs cs
  | _, _ => false

def checkCertificate : ℕ → Fin 3 → Fin 7 → List ℤ → List ℕ → Certificate → Bool
  | _, family, repeatIndex, assigned, _, .product =>
      decide (assigned.length = 8) && productCheck family repeatIndex (vectorOf assigned)
  | _, family, repeatIndex, assigned, remaining, .cut i j negative codes =>
      cutCheck (canonical family repeatIndex) assigned remaining i j negative codes
  | 0, _, _, _, _, .split _ => false
  | fuel + 1, family, repeatIndex, assigned, remaining, .split children =>
      !remaining.isEmpty && checkBranches
        (fun z child => checkCertificate fuel family repeatIndex
          (assigned ++ [z]) (remaining.erase z.natAbs) child)
        (branchChoices assigned remaining) children

end Loneliness.EightPlane

