import Conjectures.FiniteCertificate
import Mathlib.Data.Nat.Bitwise
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

/-! Executable finite automata with checked subset and minimization certificates.
Digits are pairs of binary digits. Both reading directions have explicit decoders. -/
namespace BinaryAutomata

abbrev Digit := Fin 4

def sizeBit (d : Digit) : Nat := d.val/2
def valueBit (d : Digit) : Nat := d.val%2

def decode (bit : Digit → Nat) : List Digit → Nat
  | [] => 0
  | d::ds => bit d+2*decode bit ds

abbrev decodeSize := decode sizeBit
abbrev decodeValue := decode valueBit

theorem decode_bound (bit : Digit → Nat) (hbit : ∀ d, bit d<2) (w : List Digit) :
    decode bit w < 2^w.length := by
  induction w with
  | nil => simp [decode]
  | cons d w ih =>
    have hd := hbit d
    simp only [decode,List.length_cons,pow_succ]
    omega

theorem sizeBit_bound (d : Digit) : sizeBit d<2 := by have := d.isLt; dsimp [sizeBit]; omega
theorem valueBit_bound (d : Digit) : valueBit d<2 := Nat.mod_lt _ (by decide)

/-- A finite-state deterministic automaton, with executable acceptance. -/
structure DFA (Q : Type) where
  step : Q → Digit → Q
  start : Q
  final : Q → Bool

def DFA.runFrom {Q : Type} (A : DFA Q) : Q → List Digit → Q
  | q,[] => q
  | q,d::ds => A.runFrom (A.step q d) ds

def DFA.accepts {Q : Type} (A : DFA Q) (w : List Digit) : Bool :=
  A.final (A.runFrom A.start w)

/-- Encode a finite set of natural numbers as a bit mask. -/
def maskOfList : List Nat → Nat
  | [] => 0
  | s::ss => 2^s ||| maskOfList ss

theorem maskOfList_mem (l : List Nat) (i : Nat) :
    (maskOfList l).testBit i=true ↔ i∈l := by
  induction l with
  | nil => simp [maskOfList]
  | cons s ss ih =>
    simp only [maskOfList,Nat.testBit_lor,Bool.or_eq_true,ih,List.mem_cons]
    simp [Nat.testBit_two_pow,eq_comm]

structure NFA (N : Nat) where
  successors : Fin N → Digit → List (Fin N)
  startMask : Nat
  final : Fin N → Bool

def NFA.nextMask {N : Nat} (A : NFA N) (S : Nat) (d : Digit) : Nat :=
  maskOfList ((List.finRange N).flatMap (fun s =>
    if S.testBit s.val then (A.successors s d).map Fin.val else []))

theorem NFA.nextMask_mem {N : Nat} (A : NFA N) (S : Nat) (d : Digit) (t : Fin N) :
    (A.nextMask S d).testBit t.val=true ↔
      ∃ s : Fin N, S.testBit s.val=true ∧ t∈A.successors s d := by
  rw [NFA.nextMask,maskOfList_mem]
  constructor
  · intro h
    obtain ⟨s,_,hs⟩ := List.mem_flatMap.mp h
    split at hs
    · rename_i hbit
      obtain ⟨u,hu,hval⟩ := List.mem_map.mp hs
      have hut : u=t := Fin.ext hval
      subst u
      exact ⟨s,hbit,hu⟩
    · simp at hs
  · rintro ⟨s,hs,ht⟩
    apply List.mem_flatMap.mpr
    refine ⟨s,by simp,?_⟩
    rw [ite_eq_left hs]
    exact List.mem_map.mpr ⟨t,ht,rfl⟩

def NFA.runFrom {N : Nat} (A : NFA N) : Nat → List Digit → Nat
  | S,[] => S
  | S,d::ds => A.runFrom (A.nextMask S d) ds

def NFA.Path {N : Nat} (A : NFA N) : Fin N → List Digit → Fin N → Prop
  | s,[],t => s=t
  | s,d::ds,t => ∃ u, u∈A.successors s d ∧ A.Path u ds t

/-- Exact subset-construction semantics, for every finite input word. -/
theorem NFA.runFrom_mem {N : Nat} (A : NFA N) (S : Nat) (w : List Digit) (t : Fin N) :
    (A.runFrom S w).testBit t.val=true ↔
      ∃ s : Fin N, S.testBit s.val=true ∧ A.Path s w t := by
  induction w generalizing S with
  | nil => simp [NFA.runFrom,NFA.Path]
  | cons d ds ih =>
    rw [NFA.runFrom,ih]
    constructor
    · rintro ⟨u,hu,hpath⟩
      obtain ⟨s,hs,hsu⟩ := (A.nextMask_mem S d u).mp hu
      exact ⟨s,hs,u,hsu,hpath⟩
    · rintro ⟨s,hs,u,hsu,hpath⟩
      exact ⟨u,(A.nextMask_mem S d u).mpr ⟨s,hs,hsu⟩,hpath⟩

def NFA.acceptMask {N : Nat} (A : NFA N) (S : Nat) : Bool :=
  (List.finRange N).any (fun s => S.testBit s.val && A.final s)

def NFA.accepts {N : Nat} (A : NFA N) (w : List Digit) : Bool :=
  A.acceptMask (A.runFrom A.startMask w)

theorem NFA.acceptMask_iff {N : Nat} (A : NFA N) (S : Nat) :
    A.acceptMask S=true ↔ ∃ s : Fin N, S.testBit s.val=true ∧ A.final s=true := by
  simp [NFA.acceptMask,List.any_eq_true,Bool.and_eq_true]

theorem NFA.accepts_iff {N : Nat} (A : NFA N) (w : List Digit) :
    A.accepts w=true ↔ ∃ s t : Fin N,
      A.startMask.testBit s.val=true ∧ A.Path s w t ∧ A.final t=true := by
  rw [NFA.accepts,A.acceptMask_iff]
  constructor
  · rintro ⟨t,ht,hf⟩
    obtain ⟨s,hs,hpath⟩ := (A.runFrom_mem A.startMask w t).mp ht
    exact ⟨s,t,hs,hpath,hf⟩
  · rintro ⟨s,t,hs,hpath,hf⟩
    exact ⟨t,(A.runFrom_mem A.startMask w t).mpr ⟨s,hs,hpath⟩,hf⟩

/-- A finite, locally checked refinement certificate suffices for exact language
 equivalence. Neither a search nor a minimization algorithm is trusted. -/
theorem certified_refinement {N : Nat} {Q R : Type}
    (A : NFA N) (B : DFA Q) (r₀ : R)
    (rep : R → Nat) (label : R → Q) (next : R → Digit → R)
    (hstart : rep r₀=A.startMask) (hlstart : label r₀=B.start)
    (hstep : ∀ r d, rep (next r d)=A.nextMask (rep r) d)
    (hlstep : ∀ r d, label (next r d)=B.step (label r) d)
    (hfinal : ∀ r, A.acceptMask (rep r)=B.final (label r)) :
    ∀ w, A.accepts w=B.accepts w := by
  have general : ∀ w r, A.acceptMask (A.runFrom (rep r) w)=
      B.final (B.runFrom (label r) w) := by
    intro w
    induction w with
    | nil => intro r; exact hfinal r
    | cons d ds ih =>
      intro r
      simp only [NFA.runFrom,DFA.runFrom]
      rw [←hstep r d,←hlstep r d]
      exact ih (next r d)
  intro w
  simpa only [NFA.accepts,DFA.accepts,hstart,hlstart] using general w r₀

#print axioms certified_refinement
/-- High-bit-first interpretation of a digit word. -/
def decodeHigh (bit : Digit → Nat) (w : List Digit) : Nat := decode bit w.reverse

/-- Direct refinement also applies to a counter-based semantic DFA whose
state space is infinite; only the checked representation carrier is finite. -/
theorem certified_dfa_refinement {P Q R : Type}
    (A : DFA P) (B : DFA Q) (r₀ : R)
    (rep : R → P) (label : R → Q) (next : R → Digit → R)
    (hstart : rep r₀=A.start) (hlstart : label r₀=B.start)
    (hstep : ∀ r d, rep (next r d)=A.step (rep r) d)
    (hlstep : ∀ r d, label (next r d)=B.step (label r) d)
    (hfinal : ∀ r, A.final (rep r)=B.final (label r)) :
    ∀ w, A.accepts w=B.accepts w := by
  have general : ∀ w r, A.final (A.runFrom (rep r) w)=
      B.final (B.runFrom (label r) w) := by
    intro w
    induction w with
    | nil => intro r; exact hfinal r
    | cons d ds ih =>
      intro r
      simp only [DFA.runFrom]
      rw [←hstep r d,←hlstep r d]
      exact ih (next r d)
  intro w
  simpa only [DFA.accepts,hstart,hlstart] using general w r₀

/-- A self-looping nonfinal state rejects every continuation. -/
theorem DFA.rejecting_sink {Q : Type} (A : DFA Q) (s : Q)
    (hf : A.final s=false) (hs : ∀ d, A.step s d=s) :
    ∀ w, A.final (A.runFrom s w)=false := by
  intro w
  induction w with
  | nil => exact hf
  | cons d ds ih => simpa only [DFA.runFrom,hs] using ih

/-- Compute successors from an explicit active-state list rather than scanning
all states. Equality with the full subset construction is proved here. -/
theorem NFA.nextMask_of_list {N : Nat} (A : NFA N) (xs : List (Fin N)) (d : Digit) :
    A.nextMask (maskOfList (xs.map Fin.val)) d =
      maskOfList ((xs.flatMap (fun s => A.successors s d)).map Fin.val) := by
  apply Nat.eq_of_testBit_eq
  intro i
  apply Bool.eq_iff_iff.mpr
  rw [NFA.nextMask,maskOfList_mem,maskOfList_mem]
  constructor
  · intro h
    obtain ⟨s,_,hs⟩ := List.mem_flatMap.mp h
    split at hs
    · rename_i hbit
      obtain ⟨u,hu,hval⟩ := List.mem_map.mp hs
      obtain ⟨s',hs',hss⟩ := List.mem_map.mp ((maskOfList_mem _ _).mp hbit)
      have hse : s'=s := Fin.ext hss
      subst s'
      exact List.mem_map.mpr ⟨u,List.mem_flatMap.mpr ⟨s,hs',hu⟩,hval⟩
    · simp at hs
  · intro h
    obtain ⟨u,hu,hval⟩ := List.mem_map.mp h
    obtain ⟨s,hs,hsu⟩ := List.mem_flatMap.mp hu
    apply List.mem_flatMap.mpr
    refine ⟨s,by simp,?_⟩
    have hbit : (maskOfList (xs.map Fin.val)).testBit s.val=true :=
      (maskOfList_mem _ _).mpr (List.mem_map.mpr ⟨s,hs,rfl⟩)
    rw [ite_eq_left hbit]
    exact List.mem_map.mpr ⟨u,hsu,hval⟩

theorem NFA.acceptMask_of_list {N : Nat} (A : NFA N) (xs : List (Fin N)) :
    A.acceptMask (maskOfList (xs.map Fin.val)) = xs.any A.final := by
  apply Bool.eq_iff_iff.mpr
  rw [NFA.acceptMask_iff,List.any_eq_true]
  constructor
  · rintro ⟨s,hs,hf⟩
    obtain ⟨s',hs',hval⟩ := List.mem_map.mp ((maskOfList_mem _ _).mp hs)
    have hse : s'=s := Fin.ext hval
    subst s'
    exact ⟨s,hs',hf⟩
  · rintro ⟨s,hs,hf⟩
    exact ⟨s,(maskOfList_mem _ _).mpr (List.mem_map.mpr ⟨s,hs,rfl⟩),hf⟩

/-- Efficient finite certificates check only the represented active states. -/
theorem certified_list_refinement {N : Nat} {Q R : Type}
    (A : NFA N) (B : DFA Q) (r₀ : R)
    (active : R → List (Fin N)) (label : R → Q) (next : R → Digit → R)
    (hstart : maskOfList ((active r₀).map Fin.val)=A.startMask)
    (hlstart : label r₀=B.start)
    (hstep : ∀ r d, maskOfList ((active (next r d)).map Fin.val)=
      maskOfList (((active r).flatMap (fun s => A.successors s d)).map Fin.val))
    (hlstep : ∀ r d, label (next r d)=B.step (label r) d)
    (hfinal : ∀ r, (active r).any A.final=B.final (label r)) :
    ∀ w, A.accepts w=B.accepts w := by
  apply certified_refinement A B r₀ (fun r => maskOfList ((active r).map Fin.val)) label next hstart hlstart
  · intro r d
    rw [A.nextMask_of_list]
    exact hstep r d
  · exact hlstep
  · intro r
    rw [A.acceptMask_of_list]
    exact hfinal r

theorem decode_append (bit : Digit → Nat) (a b : List Digit) :
    decode bit (a++b)=decode bit a+2^a.length*decode bit b := by
  induction a with
  | nil => simp [decode]
  | cons d ds ih => simp only [List.cons_append,decode,ih,List.length_cons,pow_succ]; ring

theorem decodeHigh_cons (bit : Digit → Nat) (d : Digit) (ds : List Digit) :
    decodeHigh bit (d::ds)=bit d*2^ds.length+decodeHigh bit ds := by
  simp only [decodeHigh,List.reverse_cons,decode_append,decode,List.length_reverse]
  ring

theorem decodeHigh_bound (bit : Digit → Nat) (hbit : ∀ d, bit d<2) (w : List Digit) :
    decodeHigh bit w<2^w.length := by
  simpa only [decodeHigh,List.length_reverse] using decode_bound bit hbit w.reverse

#print axioms certified_list_refinement

/-- Re-export the generic finite-family coverage theorem for generated automata. -/
theorem checked_list_rows {n : Nat} {P : Fin n → Prop}
    (rows : List {q : Fin n // P q})
    (hindices : rows.map (fun r => r.val.val)=List.range n) : ∀ q, P q :=
  FiniteCertificate.checked_list_rows rows hindices

end BinaryAutomata
