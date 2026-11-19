import Conjectures.BinaryDecision
import Conjectures.BinaryDeterminize

/-! Removing arbitrarily many leading zero columns preserves regularity.
The construction computes a finite set of possible starting states, so a
hidden witness need not fit in the original visible input width. -/
namespace BinaryAutomata

theorem decodeHigh_zero_prefix (bit : Digit → Nat) (hzero : bit 0=0)
    (k : Nat) (w : List Digit) :
    decodeHigh bit (List.replicate k 0++w)=decodeHigh bit w := by
  induction k with
  | zero => rfl
  | succ k ih =>
    simpa only [List.replicate_succ,List.cons_append,decodeHigh_cons,hzero,
      Nat.zero_mul,Nat.zero_add] using ih

theorem DFA.runFrom_append {Q : Type} (A : DFA Q) (s : Q) (u v : List Digit) :
    A.runFrom s (u++v)=A.runFrom (A.runFrom s u) v := by
  induction u generalizing s with
  | nil => rfl
  | cons d ds ih => exact ih (A.step s d)

def DFA.onlyZero {Q : Type} (A : DFA Q) : DFA Q :=
  {A with step := fun q _ => A.step q 0}

theorem DFA.onlyZero_run {Q : Type} (A : DFA Q) (s : Q) (w : List Digit) :
    A.onlyZero.runFrom s w=A.runFrom s (List.replicate w.length 0) := by
  induction w generalizing s with
  | nil => rfl
  | cons d ds ih =>
    simpa only [DFA.runFrom,DFA.onlyZero,List.length_cons,List.replicate_succ] using
      ih (A.step s 0)

theorem DFA.short_zero_prefix {Q : Type} [Fintype Q] (A : DFA Q) (s : Q) (k : Nat) :
    ∃ j, j<Fintype.card Q ∧
      A.runFrom s (List.replicate j 0)=A.runFrom s (List.replicate k 0) := by
  obtain ⟨v,hv,heq⟩ := A.onlyZero.short_word_to_state s (List.replicate k 0)
  refine ⟨v.length,hv,?_⟩
  simpa only [DFA.onlyZero_run,List.length_replicate] using heq

def DFA.zeroStarts {N : Nat} (A : DFA (Fin N)) : List (Fin N) :=
  (List.range N).map (fun k => A.runFrom A.start (List.replicate k 0))

theorem DFA.mem_zeroStarts {N : Nat} (A : DFA (Fin N)) (s : Fin N) :
    s∈A.zeroStarts ↔ ∃ k, A.runFrom A.start (List.replicate k 0)=s := by
  constructor
  · intro h
    obtain ⟨k,_,hk⟩ := List.mem_map.mp h
    exact ⟨k,hk⟩
  · rintro ⟨k,hk⟩
    obtain ⟨j,hj,heq⟩ := A.short_zero_prefix A.start k
    apply List.mem_map.mpr
    refine ⟨j,?_,heq.trans hk⟩
    simpa using hj

def DFA.zeroPrefixNFA {N : Nat} (A : DFA (Fin N)) : NFA N := {
  successors := fun s d => [A.step s d]
  startMask := maskOfList (A.zeroStarts.map Fin.val)
  final := A.final
}

theorem DFA.zeroPrefix_path {N : Nat} (A : DFA (Fin N))
    (s t : Fin N) (w : List Digit) :
    A.zeroPrefixNFA.Path s w t ↔ A.runFrom s w=t := by
  induction w generalizing s with
  | nil => rfl
  | cons d ds ih =>
    change (∃ u, u∈[A.step s d] ∧ A.zeroPrefixNFA.Path u ds t) ↔
      A.runFrom (A.step s d) ds=t
    simp only [List.mem_singleton,exists_eq_left]
    exact ih (A.step s d)

theorem DFA.zeroPrefixNFA_accepts {N : Nat} (A : DFA (Fin N)) (w : List Digit) :
    A.zeroPrefixNFA.accepts w=true ↔
      ∃ k, A.accepts (List.replicate k 0++w)=true := by
  rw [NFA.accepts_iff]
  constructor
  · rintro ⟨s,t,hs,hpath,hfinal⟩
    have hm : s∈A.zeroStarts := by
      have hm := (maskOfList_mem (A.zeroStarts.map Fin.val) s.val).mp hs
      obtain ⟨u,hu,hval⟩ := List.mem_map.mp hm
      have heq : u=s := Fin.ext hval
      exact heq ▸ hu
    obtain ⟨k,hk⟩ := (A.mem_zeroStarts s).mp hm
    have hp := (A.zeroPrefix_path s t w).mp hpath
    refine ⟨k,?_⟩
    simpa only [DFA.accepts,DFA.runFrom_append,hk,hp,DFA.zeroPrefixNFA] using hfinal
  · rintro ⟨k,hk⟩
    let s := A.runFrom A.start (List.replicate k 0)
    let t := A.runFrom s w
    refine ⟨s,t,?_,(A.zeroPrefix_path s t w).mpr rfl,?_⟩
    · apply (maskOfList_mem _ _).mpr
      exact List.mem_map.mpr ⟨s,(A.mem_zeroStarts s).mpr ⟨k,rfl⟩,rfl⟩
    · simpa only [DFA.accepts,DFA.runFrom_append,DFA.zeroPrefixNFA,s,t] using hk

theorem DFA.zeroPrefix_start_bound {N : Nat} (A : DFA (Fin N)) :
    A.zeroPrefixNFA.startMask<2^N := by
  apply maskOfList_lt_two_pow
  intro i hi
  obtain ⟨s,_,rfl⟩ := List.mem_map.mp hi
  exact s.isLt

def DFA.zeroPrefix {N : Nat} (A : DFA (Fin N)) : DFA (Fin (2^N)) :=
  A.zeroPrefixNFA.determinize A.zeroPrefix_start_bound

theorem DFA.zeroPrefix_accepts {N : Nat} (A : DFA (Fin N)) (w : List Digit) :
    A.zeroPrefix.accepts w=true ↔
      ∃ k, A.accepts (List.replicate k 0++w)=true := by
  rw [DFA.zeroPrefix,NFA.determinize_accepts]
  exact A.zeroPrefixNFA_accepts w

#print axioms DFA.zeroPrefix_accepts
end BinaryAutomata
