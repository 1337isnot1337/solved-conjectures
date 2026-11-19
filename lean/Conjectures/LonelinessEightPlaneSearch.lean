import Conjectures.LonelinessEightPlanePruning

/-! The bounded recursive search used for the eight-coordinate repeat-line
cover. Partial rejection inspects an overapproximation of all remaining
coordinate values. The completeness proof is supplied separately. -/

namespace Loneliness.EightPlane

def signedChoices (remaining : List ℕ) : List ℤ :=
  remaining.flatMap fun (r : ℕ) => [(r : ℤ), -(r : ℤ)]

def vectorOf (values : List ℤ) : Vector :=
  fun i => (values[i.val]?).getD 0

def coordinateDomains (assigned : List ℤ) (remaining : List ℕ) : Domains :=
  fun i => if i.val < assigned.length then [vectorOf assigned i] else signedChoices remaining

def partialRejected (w : Vector) (assigned : List ℤ) (remaining : List ℕ) : Bool :=
  let z := vectorOf assigned
  (List.finRange 8).any fun i =>
    (List.finRange 8).any fun j =>
      decide (j.val < i.val ∧ i.val < assigned.length) &&
        ([-1, 1] : List ℤ).any fun sign =>
          let a := w i - sign * w j
          let b := z i - sign * z j
          ((a == 0) && (b == 0)) ||
            !(partialPossible (coordinateDomains assigned remaining) w a b
              (a * z 0 - b * w 0).natAbs)

def productSide (family : Fin 3) (z : Vector) (free : Fin 8) : Bool :=
  let p := Equiv.swap free (Fin.last 7)
  (List.finRange 7).all fun i =>
    z (p i.castSucc) == (base family i : ℤ) * z (p 0)

def productCheck (family : Fin 3) (repeatIndex : Fin 7) (z : Vector) : Bool :=
  productSide family z (Fin.last 7) || productSide family z repeatIndex.castSucc

def search : ℕ → Fin 3 → Fin 7 → List ℤ → List ℕ → Bool
  | fuel, family, repeatIndex, assigned, remaining =>
    if partialRejected (canonical family repeatIndex) assigned remaining then true
    else match fuel with
      | 0 => productCheck family repeatIndex (vectorOf assigned)
      | steps + 1 =>
        remaining.dedup.all fun r =>
          search steps family repeatIndex (assigned ++ [(r : ℤ)]) (remaining.erase r) &&
            (assigned.isEmpty ||
              search steps family repeatIndex (assigned ++ [-(r : ℤ)]) (remaining.erase r))

def checkPattern (family : Fin 3) (repeatIndex : Fin 7)
    (secondFamily : Fin 3) (secondRepeat : Fin 7) : Bool :=
  search 8 family repeatIndex []
    (baseList secondFamily ++ [base secondFamily secondRepeat])

end Loneliness.EightPlane

