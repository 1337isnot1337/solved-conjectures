import Conjectures.BinaryGenericProjection
import Conjectures.BinaryTailGraph

/-! Executable recognizers packaged with their finite state type and semantics. -/
namespace BinaryAutomata

structure Recognizer (P : Nat → Nat → Prop) where
  State : Type
  finite : Fintype State
  decEq : DecidableEq State
  machine : DFA State
  correct : Recognizes machine P

def Recognizer.ofDFA {P : Nat → Nat → Prop} {Q : Type} [Fintype Q] [DecidableEq Q]
    (A : DFA Q) (hA : Recognizes A P) : Recognizer P :=
  ⟨Q,inferInstance,inferInstance,A,hA⟩

def Recognizer.change {P S : Nat → Nat → Prop} (A : Recognizer P)
    (h : ∀ n g, P n g ↔ S n g) : Recognizer S :=
  ⟨A.State,A.finite,A.decEq,A.machine,fun w => (A.correct w).trans (h _ _)⟩

def Recognizer.constant (p : Prop) [Decidable p] : Recognizer (fun _ _ => p) :=
  Recognizer.ofDFA ({step:=fun _ _ => 0,start:=0,final:=fun _ => decide p} : DFA (Fin 1))
    (by intro w; change decide p=true ↔ p; simp only [decide_eq_true_eq])

def Recognizer.union {P S : Nat → Nat → Prop} (A : Recognizer P) (B : Recognizer S) :
    Recognizer (fun n g => P n g ∨ S n g) := by
  letI : Fintype A.State := A.finite
  letI : Fintype B.State := B.finite
  letI : DecidableEq A.State := A.decEq
  letI : DecidableEq B.State := B.decEq
  exact Recognizer.ofDFA (A.machine.product B.machine (fun a b => a || b)) (by
    intro w
    rw [DFA.product_accepts,Bool.or_eq_true]
    exact or_congr (A.correct w) (B.correct w))

def Recognizer.intersect {P S : Nat → Nat → Prop} (A : Recognizer P) (B : Recognizer S) :
    Recognizer (fun n g => P n g ∧ S n g) := by
  letI : Fintype A.State := A.finite
  letI : Fintype B.State := B.finite
  letI : DecidableEq A.State := A.decEq
  letI : DecidableEq B.State := B.decEq
  exact Recognizer.ofDFA (A.machine.product B.machine (fun a b => a && b)) (by
    intro w
    rw [DFA.product_accepts,Bool.and_eq_true]
    exact and_congr (A.correct w) (B.correct w))

def Recognizer.difference {P S : Nat → Nat → Prop} (A : Recognizer P) (B : Recognizer S) :
    Recognizer (fun n g => P n g ∧ ¬S n g) := by
  letI : Fintype A.State := A.finite
  letI : Fintype B.State := B.finite
  letI : DecidableEq A.State := A.decEq
  letI : DecidableEq B.State := B.decEq
  exact Recognizer.ofDFA (A.machine.product B.machine (fun a b => a && !b)) (by
    intro w
    rw [DFA.product_accepts,Bool.and_eq_true]
    refine and_congr (A.correct w) ?_
    rw [← B.correct w]
    cases B.machine.accepts w <;> decide)

def Recognizer.guard {P : Nat → Nat → Prop} (p : Prop) [Decidable p] (A : Recognizer P) :
    Recognizer (fun n g => p ∧ P n g) := (Recognizer.constant p).intersect A

def Recognizer.sum {P S : Nat → Nat → Prop} (A : Recognizer P) (B : Recognizer S) :
    Recognizer (SumRelation P S) := by
  letI : Fintype A.State := A.finite
  letI : Fintype B.State := B.finite
  letI : DecidableEq A.State := A.decEq
  letI : DecidableEq B.State := B.decEq
  exact Recognizer.ofDFA (A.machine.sumRelation B.machine)
    (DFA.sumRelation_correct A.machine B.machine P S A.correct B.correct)

def Recognizer.lower {P : Nat → Nat → Prop} (A : Recognizer P) :
    Recognizer (fun n g => ∃ h, P n h ∧ g<h) := by
  letI : Fintype A.State := A.finite
  letI : DecidableEq A.State := A.decEq
  exact Recognizer.ofDFA A.machine.lowerRelation (A.machine.lowerRelation_correct P A.correct)

def Recognizer.point (a b : Nat) : Recognizer (fun n g => n=a ∧ g=b) :=
  Recognizer.ofDFA (Point.graph ⟨a,b⟩) (Point.graph_correct ⟨a,b⟩)

def Tail.recognizer (T : Tail) : Recognizer (fun n g => 0<n ∧ g=T.value n) := by
  letI (i : Fin T.initialValues.length) : DecidableEq (T.point i).State := inferInstance
  letI (i : Fin T.period) : DecidableEq (T.ray i).State := inferInstance
  exact Recognizer.ofDFA T.graph T.graph_correct

def Recognizer.emptyCheck {P : Nat → Nat → Prop} (A : Recognizer P) : Bool :=
  letI : Fintype A.State := A.finite
  A.machine.emptyCheck

theorem Recognizer.emptyCheck_correct {P : Nat → Nat → Prop} (A : Recognizer P) :
    A.emptyCheck=true ↔ ∀ n g, ¬P n g := by
  letI : Fintype A.State := A.finite
  rw [Recognizer.emptyCheck,DFA.emptyCheck_correct]
  constructor
  · intro h n g hp
    obtain ⟨w,hn,hg⟩ := exists_encoding n g
    have ha : A.machine.accepts w=true := (A.correct w).mpr (by rw [hn,hg]; exact hp)
    rw [h w] at ha
    contradiction
  · intro h w
    cases heq : A.machine.accepts w
    · rfl
    · exact False.elim (h _ _ ((A.correct w).mp heq))

#print axioms Recognizer.emptyCheck_correct
end BinaryAutomata
