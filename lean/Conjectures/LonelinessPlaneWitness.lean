import Conjectures.LonelinessPlanePermutationTable

/-! Short rejecting-line witnesses for the finite plane certificate.
The witness includes its integer vector explicitly. The kernel verifies the
vector equation, nonzero coordinates, and failure of both critical supports. -/

namespace Loneliness.PlaneCertificate

structure Rejection where
  first : Fin 5
  second : Fin 5
  positive : Bool
  values : Vector

def rejectionSign (r : Rejection) : ℤ := if r.positive then 1 else -1

def witnessCheck (q c : Vector) (r : Option Rejection) : Bool :=
  match r with
  | none => productTest q c
  | some r =>
    decide (r.first < r.second) &&
      (List.finRange 5).all (fun k => r.values k ==
        repeatedLine q c r.first r.second (rejectionSign r) k) &&
      nonzeroTest r.values && !criticalSupportTest r.values

theorem permutationTable_length : permutationTable.length = 120 := by decide

def permutationAt (n : Fin 120) : Fin 5 → Fin 5 :=
  permutationTable[n.val]'(by simpa only [permutationTable_length] using n.is_lt)

def witnessBlockCheck (i j : Fin 8) (cert : Fin 120 → Fin 16 → Option Rejection) : Bool :=
  (List.finRange 120).all fun n =>
    (List.finRange 16).all fun mask =>
      witnessCheck (canonical i) (tableCandidate j (permutationAt n) mask) (cert n mask)

def witnessRowCheck (i j : Fin 8) (n : Fin 120)
    (cert : Fin 16 → Option Rejection) : Bool :=
  (List.finRange 16).all fun mask =>
    witnessCheck (canonical i) (tableCandidate j (permutationAt n) mask) (cert mask)

end Loneliness.PlaneCertificate
