import Conjectures.BinaryBoolean
import Mathlib.Computability.DFA

/-! A terminating finite emptiness test, with a proved complete word bound. -/
namespace BinaryAutomata

def DFA.toMathlib {Q : Type} (A : DFA Q) : _root_.DFA Digit Q := {
  step := A.step
  start := A.start
  accept := {q | A.final q=true}
}

theorem DFA.toMathlib_run {Q : Type} (A : DFA Q) (s : Q) (w : List Digit) :
    A.toMathlib.evalFrom s w=A.runFrom s w := by
  induction w generalizing s with
  | nil => rfl
  | cons d ds ih =>
    rw [_root_.DFA.evalFrom_cons,DFA.runFrom]
    exact ih (A.step s d)

/-- Every reachable state has a witness shorter than the number of states. -/
theorem DFA.short_word_to_state {Q : Type} [Fintype Q] (A : DFA Q)
    (s : Q) (w : List Digit) : ∃ v : List Digit,
      v.length<Fintype.card Q ∧ A.runFrom s v=A.runFrom s w := by
  have all : ∀ L : Nat, ∀ (s : Q) (w : List Digit), w.length=L →
      ∃ v : List Digit, v.length<Fintype.card Q ∧ A.runFrom s v=A.runFrom s w := by
    intro L
    induction L using Nat.strong_induction_on with
    | h L ih =>
      intro s w hL
      by_cases hshort : w.length<Fintype.card Q
      · exact ⟨w,hshort,rfl⟩
      · have hlarge : Fintype.card Q≤w.length := by omega
        obtain ⟨q,a,b,c,hw,_,hb,ha,_,hc⟩ :=
          A.toMathlib.evalFrom_split hlarge (A.toMathlib_run s w)
        have hdrop : A.runFrom s (a++c)=A.runFrom s w := by
          have heq : A.toMathlib.evalFrom s (a++c)=A.runFrom s w := by
            rw [_root_.DFA.evalFrom_of_append,ha,hc]
          simpa only [DFA.toMathlib_run] using heq
        have hbpos : 0<b.length := by
          have hne : b.length≠0 := fun h => hb (List.eq_nil_of_length_eq_zero h)
          omega
        have hlen : (a++c).length<L := by
          rw [hw] at hL
          simp only [List.length_append] at hL ⊢
          omega
        obtain ⟨v,hv,heq⟩ := ih (a++c).length hlen s (a++c) rfl
        exact ⟨v,hv,heq.trans hdrop⟩
  exact all w.length s w rfl

def shortWords : Nat → List (List Digit)
  | 0 => []
  | k+1 => []::(List.finRange 4).flatMap (fun d => (shortWords k).map (fun w => d::w))

theorem mem_shortWords (k : Nat) (w : List Digit) : w∈shortWords k ↔ w.length<k := by
  induction k generalizing w with
  | zero => simp [shortWords]
  | succ k ih =>
    cases w with
    | nil => simp [shortWords]
    | cons d ds =>
      simp [shortWords,List.mem_flatMap,List.mem_map,List.cons.injEq,ih]

/-- This finite computation terminates for every finite DFA. -/
def DFA.emptyCheck {Q : Type} [Fintype Q] (A : DFA Q) : Bool :=
  (shortWords (Fintype.card Q)).all (fun w => !A.accepts w)

theorem DFA.emptyCheck_correct {Q : Type} [Fintype Q] (A : DFA Q) :
    A.emptyCheck=true ↔ ∀ w, A.accepts w=false := by
  constructor
  · intro h w
    obtain ⟨v,hv,heq⟩ := A.short_word_to_state A.start w
    have hmem : v∈shortWords (Fintype.card Q) := (mem_shortWords _ _).mpr hv
    have hfalse : A.accepts v=false := by
      have hv' := List.all_eq_true.mp h v hmem
      cases he : A.accepts v <;> simp_all
    have haccept : A.accepts v=A.accepts w := congrArg A.final heq
    exact haccept ▸ hfalse
  · intro h
    apply List.all_eq_true.mpr
    intro w _
    simp only [h w,Bool.not_false]

#print axioms DFA.short_word_to_state
#print axioms DFA.emptyCheck_correct
end BinaryAutomata
