import Conjectures.BinaryAutomata

/-! Boolean closure with exact language semantics for arbitrary input words. -/
namespace BinaryAutomata

def DFA.product {Q R : Type} (A : DFA Q) (B : DFA R)
    (op : Bool → Bool → Bool) : DFA (Q × R) := {
  step := fun q d => (A.step q.1 d,B.step q.2 d)
  start := (A.start,B.start)
  final := fun q => op (A.final q.1) (B.final q.2)
}

theorem DFA.product_runFrom {Q R : Type} (A : DFA Q) (B : DFA R)
    (op : Bool → Bool → Bool) (a : Q) (b : R) (w : List Digit) :
    (A.product B op).runFrom (a,b) w=(A.runFrom a w,B.runFrom b w) := by
  induction w generalizing a b with
  | nil => rfl
  | cons d ds ih => exact ih (A.step a d) (B.step b d)

theorem DFA.product_accepts {Q R : Type} (A : DFA Q) (B : DFA R)
    (op : Bool → Bool → Bool) (w : List Digit) :
    (A.product B op).accepts w=op (A.accepts w) (B.accepts w) := by
  change op (A.final ((A.product B op).runFrom (A.start,B.start) w).1)
    (B.final ((A.product B op).runFrom (A.start,B.start) w).2)=_
  rw [DFA.product_runFrom]
  rfl

theorem DFA.rejects_of_final_false {Q : Type} (A : DFA Q)
    (hf : ∀ q, A.final q=false) (w : List Digit) : A.accepts w=false :=
  hf (A.runFrom A.start w)

#print axioms DFA.product_accepts
end BinaryAutomata
