import Conjectures.BinaryComposition

/-! Precomputed digit choices implement the already verified composition rule.
The numerical table has only eight rows, all checked by the kernel. -/
namespace BinaryAutomata
variable {L R N : Nat}

abbrev SumColumn := Digit × Digit × Fin 2

def columnChoices (c : Fin 2) (d : Digit) : List SumColumn :=
  (List.finRange 4).flatMap (fun dl => (List.finRange 4).flatMap (fun dr =>
    (List.finRange 2).flatMap (fun mid =>
      if sizeBit dl+sizeBit dr+mid.val=sizeBit d+2*c.val ∧ valueBit dl ^^^ valueBit dr=valueBit d
      then [(dl,dr,mid)] else [])))

def fastColumnChoices (c : Fin 2) (d : Digit) : List SumColumn :=
  match c.val,d.val with
  | 0,0 => [(0,0,0),(1,1,0)]
  | 0,1 => [(0,1,0),(1,0,0)]
  | 0,2 => [(0,0,1),(0,2,0),(1,1,1),(1,3,0),(2,0,0),(3,1,0)]
  | 0,3 => [(0,1,1),(0,3,0),(1,0,1),(1,2,0),(2,1,0),(3,0,0)]
  | 1,0 => [(0,2,1),(1,3,1),(2,0,1),(2,2,0),(3,1,1),(3,3,0)]
  | 1,1 => [(0,3,1),(1,2,1),(2,1,1),(2,3,0),(3,0,1),(3,2,0)]
  | 1,2 => [(2,2,1),(3,3,1)]
  | 1,3 => [(2,3,1),(3,2,1)]
  | _,_ => []

theorem checked_column_choices : ∀ c d, fastColumnChoices c d=columnChoices c d := by decide

def applyColumn (E : ProductEncoding L R N) (A : DFA (Fin L)) (B : DFA (Fin R))
    (blockedA : Fin L → Bool) (blockedB : Fin R → Bool) (s : Fin N)
    (col : SumColumn) : List (Fin N) :=
  if blockedA (A.step (E.left s) col.1)=false ∧ blockedB (B.step (E.right s) col.2.1)=false then
    [E.pack (A.step (E.left s) col.1) (B.step (E.right s) col.2.1) col.2.2] else []

theorem sum_successors_columns (E : ProductEncoding L R N) (A : DFA (Fin L)) (B : DFA (Fin R))
    (blockedA : Fin L → Bool) (blockedB : Fin R → Bool) (s : Fin N) (d : Digit) :
    (sumMachine E A B blockedA blockedB).successors s d=
      (columnChoices (E.carry s) d).flatMap (applyColumn E A B blockedA blockedB s) := by
  dsimp only [sumMachine,columnChoices]
  simp only [List.flatMap_assoc]
  apply congrArg (fun f => (List.finRange 4).flatMap f)
  funext dl
  apply congrArg (fun f => (List.finRange 4).flatMap f)
  funext dr
  apply congrArg (fun f => (List.finRange 2).flatMap f)
  funext mid
  by_cases hs : sizeBit dl+sizeBit dr+mid.val=sizeBit d+2*(E.carry s).val
  all_goals by_cases hx : valueBit dl ^^^ valueBit dr=valueBit d
  all_goals simp [SumConstraints,hs,hx,applyColumn]

def fastSuccessors (E : ProductEncoding L R N) (A : DFA (Fin L)) (B : DFA (Fin R))
    (blockedA : Fin L → Bool) (blockedB : Fin R → Bool) (s : Fin N) (d : Digit) : List (Fin N) :=
  (fastColumnChoices (E.carry s) d).flatMap (applyColumn E A B blockedA blockedB s)

theorem fastSuccessors_eq (E : ProductEncoding L R N) (A : DFA (Fin L)) (B : DFA (Fin R))
    (blockedA : Fin L → Bool) (blockedB : Fin R → Bool) (s : Fin N) (d : Digit) :
    fastSuccessors E A B blockedA blockedB s d=(sumMachine E A B blockedA blockedB).successors s d := by
  rw [fastSuccessors,checked_column_choices]
  exact (sum_successors_columns E A B blockedA blockedB s d).symm

#print axioms fastSuccessors_eq
end BinaryAutomata
