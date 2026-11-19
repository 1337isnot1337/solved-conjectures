import Conjectures.BinaryAffineGraph
import Mathlib.Data.Fintype.Pi

/-! Uniform finite graph recognizers for an arbitrary prefix followed by an
arithmetic tail. This construction has no bound on the supplied parameters. -/
namespace BinaryAutomata
open AffineGraph

def DFA.family {m : Nat} {Q : Fin m → Type} (A : (i : Fin m) → DFA (Q i)) :
    DFA ((i : Fin m) → Q i) := {
  step := fun q d i => (A i).step (q i) d
  start := fun i => (A i).start
  final := fun q => (List.finRange m).any (fun i => (A i).final (q i))
}

theorem DFA.family_run {m : Nat} {Q : Fin m → Type} (A : (i : Fin m) → DFA (Q i))
    (q : (i : Fin m) → Q i) (w : List Digit) (i : Fin m) :
    ((DFA.family A).runFrom q w) i=(A i).runFrom (q i) w := by
  induction w generalizing q with
  | nil => rfl
  | cons d ds ih => exact ih (fun i => (A i).step (q i) d)

theorem DFA.family_accepts {m : Nat} {Q : Fin m → Type} (A : (i : Fin m) → DFA (Q i))
    (w : List Digit) : (DFA.family A).accepts w=true ↔ ∃ i, (A i).accepts w=true := by
  change (List.finRange m).any
    (fun i => (A i).final (((DFA.family A).runFrom (fun j => (A j).start) w) i))=true ↔ _
  simp only [List.any_eq_true,List.mem_finRange,true_and,DFA.family_run,DFA.accepts]

theorem cap_step (K n a : Nat) : min K (2*min K n+a)=min K (2*n+a) := by
  by_cases hn : n≤K
  · rw [Nat.min_eq_right hn]
  · rw [Nat.min_eq_left (by omega : K≤n)]
    rw [Nat.min_eq_left (by omega : K≤2*K+a)]
    rw [Nat.min_eq_left (by omega : K≤2*n+a)]

structure Point where
  size : Nat
  value : Nat

abbrev Point.State (P : Point) := Fin (P.size+2) × Fin (P.value+2)

def Point.classify (P : Point) (n g : Nat) : P.State :=
  (⟨min (P.size+1) n,by omega⟩,⟨min (P.value+1) g,by omega⟩)

def Point.graph (P : Point) : DFA P.State := {
  step := fun q d => (⟨min (P.size+1) (2*q.1.val+sizeBit d),by omega⟩,
    ⟨min (P.value+1) (2*q.2.val+valueBit d),by omega⟩)
  start := P.classify 0 0
  final := fun q => decide (q.1.val=P.size ∧ q.2.val=P.value)
}

theorem Point.classify_step (P : Point) (n g : Nat) (d : Digit) :
    P.graph.step (P.classify n g) d=P.classify (2*n+sizeBit d) (2*g+valueBit d) := by
  apply Prod.ext <;> apply Fin.ext
  · exact cap_step (P.size+1) n (sizeBit d)
  · exact cap_step (P.value+1) g (valueBit d)

theorem Point.graph_run (P : Point) (n g : Nat) (w : List Digit) :
    P.graph.runFrom (P.classify n g) w=
      P.classify (w.foldl (fun a d => 2*a+sizeBit d) n)
        (w.foldl (fun a d => 2*a+valueBit d) g) := by
  induction w generalizing n g with
  | nil => rfl
  | cons d ds ih =>
    change P.graph.runFrom (P.graph.step (P.classify n g) d) ds=_
    rw [P.classify_step,ih]
    rfl

theorem Point.graph_correct (P : Point) (w : List Digit) : P.graph.accepts w=true ↔
    decodeHigh sizeBit w=P.size ∧ decodeHigh valueBit w=P.value := by
  change P.graph.final (P.graph.runFrom (P.classify 0 0) w)=true ↔ _
  rw [P.graph_run,fold_decode,fold_decode]
  simp only [Nat.zero_mul,Nat.zero_add,Point.graph,Point.classify,decide_eq_true_eq]
  omega

def positiveState (n : Nat) : Fin 2 := ⟨min 1 n,by omega⟩

def positiveSize : DFA (Fin 2) := {
  step := fun q d => ⟨min 1 (2*q.val+sizeBit d),by omega⟩
  start := positiveState 0
  final := fun q => decide (q.val=1)
}

theorem positiveState_step (n : Nat) (d : Digit) :
    positiveSize.step (positiveState n) d=positiveState (2*n+sizeBit d) := by
  apply Fin.ext
  exact cap_step 1 n (sizeBit d)

theorem positiveSize_run (n : Nat) (w : List Digit) :
    positiveSize.runFrom (positiveState n) w=
      positiveState (w.foldl (fun a d => 2*a+sizeBit d) n) := by
  induction w generalizing n with
  | nil => rfl
  | cons d ds ih =>
    change positiveSize.runFrom (positiveSize.step (positiveState n) d) ds=_
    rw [positiveState_step,ih]
    rfl

theorem positiveSize_correct (w : List Digit) : positiveSize.accepts w=true ↔
    0<decodeHigh sizeBit w := by
  change positiveSize.final (positiveSize.runFrom (positiveState 0) w)=true ↔ _
  rw [positiveSize_run,fold_decode]
  simp only [Nat.zero_mul,Nat.zero_add,positiveSize,positiveState,decide_eq_true_eq]
  omega

structure Tail where
  initialValues : List Nat
  period : Nat
  period_pos : 0<period
  block : Fin period → Nat
  saltus : Nat

def Tail.value (T : Tail) (n : Nat) : Nat :=
  if hn : n<T.initialValues.length then T.initialValues[n] else
    T.saltus*((n-T.initialValues.length)/T.period)+
      T.block ⟨(n-T.initialValues.length)%T.period,Nat.mod_lt _ T.period_pos⟩

def Tail.point (T : Tail) (i : Fin T.initialValues.length) : Point :=
  ⟨i.val,T.initialValues[i.val]⟩

def Tail.ray (T : Tail) (r : Fin T.period) : Ray :=
  ⟨T.initialValues.length+r.val,T.block r,T.period,T.saltus,T.period_pos⟩

def Tail.Relation (T : Tail) (n g : Nat) : Prop :=
  (∃ i : Fin T.initialValues.length, n=i.val ∧ g=T.initialValues[i.val]) ∨
    ∃ r : Fin T.period, (T.ray r).Relation n g

theorem Tail.relation_iff (T : Tail) (n g : Nat) : T.Relation n g ↔ g=T.value n := by
  constructor
  · rintro (⟨i,rfl,rfl⟩ | ⟨r,q,hn,hg⟩)
    · simp only [Tail.value,dite_eq_left i.isLt]
    · change n=T.initialValues.length+r.val+T.period*q at hn
      change g=T.block r+T.saltus*q at hg
      have hnlarge : ¬n<T.initialValues.length := by omega
      have hdiff : n-T.initialValues.length=r.val+T.period*q := by omega
      have hr : (n-T.initialValues.length)%T.period=r.val := by
        rw [hdiff]
        simp [Nat.add_mod,Nat.mod_eq_of_lt r.isLt]
      have hq : (n-T.initialValues.length)/T.period=q := by
        rw [hdiff,Nat.add_mul_div_left _ _ T.period_pos]
        simp [Nat.div_eq_of_lt r.isLt]
      simp only [Tail.value,dite_eq_right hnlarge,hq]
      have heq : (⟨(n-T.initialValues.length)%T.period,Nat.mod_lt _ T.period_pos⟩ : Fin T.period)=r :=
        Fin.ext hr
      rw [heq,hg]
      omega
  · intro hg
    by_cases hn : n<T.initialValues.length
    · left
      refine ⟨⟨n,hn⟩,rfl,?_⟩
      simpa only [Tail.value,dite_eq_left hn] using hg
    · right
      let r : Fin T.period := ⟨(n-T.initialValues.length)%T.period,Nat.mod_lt _ T.period_pos⟩
      let q := (n-T.initialValues.length)/T.period
      refine ⟨r,q,?_,?_⟩
      · change n=T.initialValues.length+r.val+T.period*q
        have hdiv := Nat.mod_add_div (n-T.initialValues.length) T.period
        dsimp only [r,q]
        omega
      · change g=T.block r+T.saltus*q
        simpa only [Tail.value,dite_eq_right hn,r,q,Nat.add_comm] using hg

def Tail.prefixMachine (T : Tail) := DFA.family (fun i => (T.point i).graph)
def Tail.tailMachine (T : Tail) := DFA.family (fun r => (T.ray r).graph)

def Tail.graph (T : Tail) :=
  ((T.prefixMachine).product T.tailMachine (fun a b => a || b)).product
    positiveSize (fun a b => a && b)

theorem Tail.graph_correct (T : Tail) (w : List Digit) : T.graph.accepts w=true ↔
    0<decodeHigh sizeBit w ∧ decodeHigh valueBit w=T.value (decodeHigh sizeBit w) := by
  simp only [Tail.graph,DFA.product_accepts,Bool.and_eq_true,Bool.or_eq_true,
    Tail.prefixMachine,Tail.tailMachine,DFA.family_accepts,Point.graph_correct,
    Ray.graph_correct,positiveSize_correct]
  change (T.Relation (decodeHigh sizeBit w) (decodeHigh valueBit w) ∧
    0<decodeHigh sizeBit w) ↔ _
  rw [T.relation_iff]
  exact and_comm

def Tail.graphEmptyCheck (T : Tail) : Bool := T.graph.emptyCheck

theorem Tail.graphEmptyCheck_correct (T : Tail) : T.graphEmptyCheck=true ↔
    ∀ w, T.graph.accepts w=false := T.graph.emptyCheck_correct

#print axioms Tail.graph_correct
#print axioms Tail.graphEmptyCheck_correct
end BinaryAutomata
