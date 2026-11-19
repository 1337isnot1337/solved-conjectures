import Conjectures.BinaryAutomata

/-! Finite determinization of the executable bit-mask automata. -/
namespace BinaryAutomata

theorem maskOfList_lt_two_pow (N : Nat) (xs : List Nat)
    (hxs : ∀ x∈xs, x<N) : maskOfList xs<2^N := by
  induction xs with
  | nil => simp [maskOfList]
  | cons x xs ih =>
    have hx : 2^x<2^N := Nat.pow_lt_pow_right (by decide) (hxs x (by simp))
    have hs := ih (fun y hy => hxs y (by simp [hy]))
    exact Nat.bitwise_lt_two_pow hx hs

theorem NFA.nextMask_lt {N : Nat} (A : NFA N) (S : Nat) (d : Digit) :
    A.nextMask S d<2^N := by
  apply maskOfList_lt_two_pow
  intro i hi
  obtain ⟨s,_,hs⟩ := List.mem_flatMap.mp hi
  split at hs
  · obtain ⟨t,_,rfl⟩ := List.mem_map.mp hs
    exact t.isLt
  · simp at hs

def NFA.determinize {N : Nat} (A : NFA N) (hstart : A.startMask<2^N) :
    DFA (Fin (2^N)) := {
  step := fun s d => ⟨A.nextMask s.val d,A.nextMask_lt s.val d⟩
  start := ⟨A.startMask,hstart⟩
  final := fun s => A.acceptMask s.val
}

theorem NFA.determinize_run {N : Nat} (A : NFA N) (hstart : A.startMask<2^N)
    (s : Fin (2^N)) (w : List Digit) :
    ((A.determinize hstart).runFrom s w).val=A.runFrom s.val w := by
  induction w generalizing s with
  | nil => rfl
  | cons d ds ih => exact ih ⟨A.nextMask s.val d,A.nextMask_lt s.val d⟩

theorem NFA.determinize_accepts {N : Nat} (A : NFA N)
    (hstart : A.startMask<2^N) (w : List Digit) :
    (A.determinize hstart).accepts w=A.accepts w := by
  change A.acceptMask (((A.determinize hstart).runFrom ⟨A.startMask,hstart⟩ w).val)=_
  rw [A.determinize_run]
  rfl

#print axioms NFA.determinize_accepts
end BinaryAutomata
