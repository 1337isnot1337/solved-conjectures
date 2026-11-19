import Conjectures.BinaryComposition
import Conjectures.BinaryProjection
import Conjectures.CutMexDecision
import Mathlib.Logic.Equiv.Fin.Basic
import Mathlib.Data.Nat.ModEq

/-! Uniform finite automata constructions for the general CUT mex test.
The constructions below are executable. No certificate producer or unproved
recognizer correspondence is part of their definitions. -/
namespace CutGeneral
open BinaryAutomata CutFamily

def relabel {Q R : Type} (e : Q ≃ R) (A : BinaryAutomata.DFA Q) :
    BinaryAutomata.DFA R := {
  step := fun q d => e (A.step (e.symm q) d)
  start := e A.start
  final := fun q => A.final (e.symm q)
}

theorem relabel_run {Q R : Type} (e : Q ≃ R) (A : BinaryAutomata.DFA Q)
    (s : Q) (w : List Digit) :
    (relabel e A).runFrom (e s) w=e (A.runFrom s w) := by
  induction w generalizing s with
  | nil => rfl
  | cons d ds ih =>
    simpa only [DFA.runFrom,relabel,Equiv.symm_apply_apply] using ih (A.step s d)

theorem relabel_accepts {Q R : Type} (e : Q ≃ R) (A : BinaryAutomata.DFA Q)
    (w : List Digit) : (relabel e A).accepts w=A.accepts w := by
  change A.final (e.symm ((relabel e A).runFrom (e A.start) w))=A.accepts w
  rw [relabel_run,Equiv.symm_apply_apply]
  rfl

/-- A uniformly usable finite automaton, with its finite state count. -/
structure Machine where
  size : Nat
  dfa : BinaryAutomata.DFA (Fin size)

def Machine.accepts (A : Machine) (w : List Digit) : Bool := A.dfa.accepts w

def Machine.boolean (A B : Machine) (op : Bool → Bool → Bool) : Machine :=
  ⟨A.size*B.size,relabel finProdFinEquiv (A.dfa.product B.dfa op)⟩

theorem Machine.boolean_accepts (A B : Machine) (op : Bool → Bool → Bool)
    (w : List Digit) : (A.boolean B op).accepts w=op (A.accepts w) (B.accepts w) := by
  exact (relabel_accepts _ _ w).trans (DFA.product_accepts _ _ _ w)

def Machine.reject : Machine := ⟨1,⟨fun _ _ => 0,0,fun _ => false⟩⟩

theorem Machine.reject_accepts (w : List Digit) : Machine.reject.accepts w=false := rfl

def Machine.union (A B : Machine) : Machine := A.boolean B (· || ·)

theorem Machine.union_accepts (A B : Machine) (w : List Digit) :
    (A.union B).accepts w=true ↔ A.accepts w=true ∨ B.accepts w=true := by
  rw [Machine.union,Machine.boolean_accepts,Bool.or_eq_true]

def Machine.unions : List Machine → Machine
  | [] => .reject
  | A::As => A.union (Machine.unions As)

theorem Machine.unions_accepts (As : List Machine) (w : List Digit) :
    (Machine.unions As).accepts w=true ↔ ∃ A∈As, A.accepts w=true := by
  induction As with
  | nil => simp [Machine.unions,Machine.reject_accepts]
  | cons A As ih => simp [Machine.unions,Machine.union_accepts,ih]

def pairEncoding (M K : Nat) : PairEncoding M K (M*K) where
  left := fun s => (finProdFinEquiv.symm s).1
  right := fun s => (finProdFinEquiv.symm s).2
  pack := fun a b => finProdFinEquiv (a,b)
  left_pack := by intros; simp
  right_pack := by intros; simp
  pack_parts := fun s => finProdFinEquiv.apply_symm_apply s

def tripleEquiv (L R : Nat) : (Fin L × Fin R) × Fin 2 ≃ Fin (L*R*2) :=
  (Equiv.prodCongr finProdFinEquiv (Equiv.refl _)).trans finProdFinEquiv

def productEncoding (L R : Nat) : ProductEncoding L R (L*R*2) where
  left := fun s => ((tripleEquiv L R).symm s).1.1
  right := fun s => ((tripleEquiv L R).symm s).1.2
  carry := fun s => ((tripleEquiv L R).symm s).2
  pack := fun a b c => tripleEquiv L R ((a,b),c)
  left_pack := by intros; simp
  right_pack := by intros; simp
  carry_pack := by intros; simp
  pack_parts := by intro s; simp

theorem mask_bound (N : Nat) (l : List Nat) (hl : ∀ i∈l, i<N) :
    maskOfList l<2^N := by
  apply Nat.lt_pow_two_of_testBit
  intro i hi
  have hn : (maskOfList l).testBit i≠true := by
    intro ht
    exact Nat.not_lt_of_ge hi (hl i ((maskOfList_mem l i).mp ht))
  cases h : (maskOfList l).testBit i <;> simp_all

theorem mask_fin_bound {N : Nat} (l : List (Fin N)) :
    maskOfList (l.map Fin.val)<2^N := by
  apply mask_bound
  intro i hi
  obtain ⟨s,_,rfl⟩ := List.mem_map.mp hi
  exact s.isLt

theorem nextMask_bound {N : Nat} (A : BinaryAutomata.NFA N) (S : Nat) (d : Digit) :
    A.nextMask S d<2^N := by
  apply mask_bound
  intro i hi
  obtain ⟨s,_,hs⟩ := List.mem_flatMap.mp hi
  split at hs
  · obtain ⟨t,_,rfl⟩ := List.mem_map.mp hs
    exact t.isLt
  · simp at hs

/-- The complete subset construction, without minimization or external data. -/
def determinize {N : Nat} (A : BinaryAutomata.NFA N) (hs : A.startMask<2^N) : Machine :=
  ⟨2^N,{
    step := fun S d => ⟨A.nextMask S.val d,nextMask_bound A S.val d⟩
    start := ⟨A.startMask,hs⟩
    final := fun S => A.acceptMask S.val
  }⟩

theorem determinize_run {N : Nat} (A : BinaryAutomata.NFA N) (hs : A.startMask<2^N)
    (S : Fin (2^N)) (w : List Digit) :
    ((determinize A hs).dfa.runFrom S w).val=A.runFrom S.val w := by
  induction w generalizing S with
  | nil => rfl
  | cons d ds ih => exact ih _

theorem determinize_accepts {N : Nat} (A : BinaryAutomata.NFA N) (hs : A.startMask<2^N)
    (w : List Digit) : (determinize A hs).accepts w=A.accepts w := by
  exact congrArg A.acceptMask (determinize_run A hs ⟨A.startMask,hs⟩ w)

theorem run_append {Q : Type} (A : BinaryAutomata.DFA Q) (s : Q) (a b : List Digit) :
    A.runFrom s (a++b)=A.runFrom (A.runFrom s a) b := by
  induction a generalizing s with
  | nil => rfl
  | cons d ds ih => exact ih _

def Machine.pad (A : Machine) (D : Nat) : Machine :=
  ⟨A.size,{A.dfa with start := A.dfa.runFrom A.dfa.start (List.replicate D 0)}⟩

theorem restart_run {Q : Type} (A : BinaryAutomata.DFA Q) (t s : Q) (w : List Digit) :
    ({A with start := t} : BinaryAutomata.DFA Q).runFrom s w=A.runFrom s w := by
  induction w generalizing s with
  | nil => rfl
  | cons d ds ih => exact ih (A.step s d)

theorem Machine.pad_accepts (A : Machine) (D : Nat) (w : List Digit) :
    (A.pad D).accepts w=A.accepts (List.replicate D 0++w) := by
  change A.dfa.final (({A.dfa with start := A.dfa.runFrom A.dfa.start (List.replicate D 0)} :
    BinaryAutomata.DFA (Fin A.size)).runFrom (A.dfa.runFrom A.dfa.start (List.replicate D 0)) w)=_
  rw [restart_run]
  rw [←run_append]
  rfl

theorem decodeHigh_zero_prefix (bit : Digit → Nat) (hz : bit 0=0)
    (D : Nat) (w : List Digit) :
    decodeHigh bit (List.replicate D 0++w)=decodeHigh bit w := by
  induction D with
  | zero => rfl
  | succ D ih =>
    simp only [List.replicate_succ,List.cons_append,decodeHigh_cons,hz,Nat.zero_mul,Nat.zero_add,ih]

theorem zero_prefix_size (D : Nat) (w : List Digit) :
    decodeHigh sizeBit (List.replicate D 0++w)=decodeHigh sizeBit w :=
  decodeHigh_zero_prefix sizeBit rfl D w

theorem zero_prefix_value (D : Nat) (w : List Digit) :
    decodeHigh valueBit (List.replicate D 0++w)=decodeHigh valueBit w :=
  decodeHigh_zero_prefix valueBit rfl D w

theorem sum_start_bound (A B : Machine) :
    (sumMachine (productEncoding A.size B.size) A.dfa B.dfa
      (fun _ => false) (fun _ => false)).startMask<2^(A.size*B.size*2) :=
  mask_fin_bound [(productEncoding A.size B.size).pack A.dfa.start B.dfa.start 0]

def Machine.sum (A B : Machine) (D : Nat) : Machine :=
  let E := productEncoding A.size B.size
  let N := sumMachine E A.dfa B.dfa (fun _ => false) (fun _ => false)
  (determinize N (sum_start_bound A B)).pad D

theorem Machine.sum_accepts (A B : Machine) (D : Nat) (w : List Digit) :
    (A.sum B D).accepts w=true ↔
      ∃ cols : List Column, cols.map Column.out=List.replicate D 0++w ∧
        A.accepts (cols.map Column.left)=true ∧ B.accepts (cols.map Column.right)=true ∧
        leftSize cols+rightSize cols=outSize cols ∧
        leftValue cols ^^^ rightValue cols=outValue cols := by
  unfold Machine.sum
  rw [Machine.pad_accepts,determinize_accepts]
  exact sum_accepts_iff _ _ _ _ _ (by simp) (by simp) _

theorem lower_start_bound (A : Machine) :
    (projectionMachine (pairEncoding A.size 3) A.dfa).startMask<2^(A.size*3) :=
  mask_fin_bound [(pairEncoding A.size 3).pack A.dfa.start 1]

def Machine.lower (A : Machine) (D : Nat) : Machine :=
  let E := pairEncoding A.size 3
  let N := projectionMachine E A.dfa
  (determinize N (lower_start_bound A)).pad D

theorem Machine.lower_accepts (A : Machine) (D : Nat) (w : List Digit) :
    (A.lower D).accepts w=true ↔
      ∃ cols : List Column, cols.map Column.out=List.replicate D 0++w ∧
        A.accepts (cols.map Column.left)=true ∧
        leftSize cols=outSize cols ∧ outValue cols<leftValue cols := by
  unfold Machine.lower
  rw [Machine.pad_accepts,determinize_accepts]
  exact projection_accepts_iff _ _ _

def Graph (f : Nat → Nat) (A : Machine) : Prop :=
  ∀ w, A.accepts w=true ↔
    0<decodeHigh sizeBit w ∧ decodeHigh valueBit w=f (decodeHigh sizeBit w)

def Piles (f : Nat → Nat) (p n g : Nat) : Prop :=
  ∃ l : List Nat, (∀ h∈l, 0<h) ∧ l.length=p ∧ l.sum=n ∧ xorList (l.map f)=g

def RecognizesPiles (f : Nat → Nat) (A : Machine) (p : Nat) : Prop :=
  ∀ w, A.accepts w=true ↔ Piles f p (decodeHigh sizeBit w) (decodeHigh valueBit w)

theorem graph_recognizes_one (f : Nat → Nat) (A : Machine) (hA : Graph f A) :
    RecognizesPiles f A 1 := by
  intro w
  rw [hA]
  constructor
  · rintro ⟨hn,hg⟩
    refine ⟨[decodeHigh sizeBit w],?_,rfl,by simp,?_⟩
    · intro h hh
      simpa only [List.mem_singleton.mp hh] using hn
    · simpa only [List.map_singleton,xorList,Nat.xor_zero] using hg.symm
  · rintro ⟨l,hpos,hlen,hsum,hxor⟩
    cases l with
    | nil => simp at hlen
    | cons h hs =>
      have hhs : hs=[] := List.eq_nil_of_length_eq_zero (by simpa using hlen)
      subst hs
      have hn : h=decodeHigh sizeBit w := by simpa using hsum
      have hg : f h=decodeHigh valueBit w := by simpa [xorList] using hxor
      refine ⟨?_,?_⟩
      · rw [←hn]
        exact hpos h (by simp)
      · rw [←hn]
        exact hg.symm

theorem values_sum_bound (f : Nat → Nat) (C : Nat)
    (hf : ∀ n, 0<n → f n≤C*n) (l : List Nat) (hl : ∀ h∈l, 0<h) :
    (l.map f).sum≤C*l.sum := by
  induction l with
  | nil => simp
  | cons h l ih =>
    have hh := hf h (hl h (by simp))
    have ht := ih (fun h hh => hl h (by simp [hh]))
    simp only [List.map_cons,List.sum_cons,Nat.mul_add]
    omega

theorem values_xor_bound (f : Nat → Nat) (C : Nat)
    (hf : ∀ n, 0<n → f n≤C*n) (l : List Nat) (hl : ∀ h∈l, 0<h) :
    xorList (l.map f)≤C*l.sum :=
  (xorList_le_sum (l.map f)).trans (values_sum_bound f C hf l hl)

theorem padded_bound (C D : Nat) (hC : C<2^D) (w : List Digit)
    (n : Nat) (hn : n≤C*decodeHigh sizeBit w) :
    n<2^(List.replicate D (0 : Digit)++w).length := by
  have hw := decodeHigh_bound sizeBit sizeBit_bound w
  calc
    n≤C*decodeHigh sizeBit w := hn
    _≤C*2^w.length := Nat.mul_le_mul_left C (Nat.le_of_lt hw)
    _<2^D*2^w.length := Nat.mul_lt_mul_of_pos_right hC (by positivity)
    _=2^(List.replicate D (0 : Digit)++w).length := by
      simp only [List.length_append,List.length_replicate,pow_add]

/-- A fixed computable number of leading zero columns makes every hidden
pile value fit, even when the candidate exceeds the pile size. -/
theorem sum_recognizes_successor (f : Nat → Nat) (A B : Machine) (p C D : Nat)
    (hCpos : 1≤C) (hC : C<2^D) (hf : ∀ n, 0<n → f n≤C*n)
    (hA : RecognizesPiles f A p) (hB : Graph f B) :
    RecognizesPiles f (A.sum B D) (p+1) := by
  intro w
  rw [Machine.sum_accepts]
  constructor
  · rintro ⟨cols,hout,ha,hb,hsum,hxor⟩
    obtain ⟨ls,hpos,hlen,hls,hgls⟩ := (hA _).mp ha
    obtain ⟨hrpos,hgr⟩ := (hB _).mp hb
    have hoN : outSize cols=decodeHigh sizeBit w := by
      unfold outSize
      rw [hout,zero_prefix_size]
    have hoG : outValue cols=decodeHigh valueBit w := by
      unfold outValue
      rw [hout,zero_prefix_value]
    let r := rightSize cols
    refine ⟨r::ls,?_,by simp [hlen],?_,?_⟩
    · intro h hh
      rcases List.mem_cons.mp hh with rfl | hh
      · exact hrpos
      · exact hpos h hh
    · simp only [List.sum_cons]
      change ls.sum=leftSize cols at hls
      rw [hls]
      dsimp [r]
      omega
    · simp only [List.map_cons,xorList]
      change xorList (ls.map f)=leftValue cols at hgls
      rw [hgls]
      change rightValue cols=f r at hgr
      rw [←hgr,Nat.xor_comm,hxor,hoG]
  · rintro ⟨l,hpos,hlen,hsum,hxor⟩
    cases l with
    | nil => simp at hlen
    | cons r ls =>
      have hrpos := hpos r (by simp)
      have hlspos : ∀ h∈ls, 0<h := fun h hh => hpos h (by simp [hh])
      have hlenls : ls.length=p := by simpa using hlen
      have hsum' : ls.sum+r=decodeHigh sizeBit w := by simpa [Nat.add_comm] using hsum
      have hxor' : xorList (ls.map f) ^^^ f r=decodeHigh valueBit w := by
        simpa only [List.map_cons,xorList,Nat.xor_comm] using hxor
      let z : List Digit := List.replicate D 0++w
      have hzN : decodeHigh sizeBit z=decodeHigh sizeBit w := zero_prefix_size D w
      have hzG : decodeHigh valueBit z=decodeHigh valueBit w := zero_prefix_value D w
      have hmul : decodeHigh sizeBit w≤C*decodeHigh sizeBit w := by
        simpa using Nat.mul_le_mul_right (decodeHigh sizeBit w) hCpos
      have hls : C*ls.sum≤C*decodeHigh sizeBit w := Nat.mul_le_mul_left C (by omega)
      have hr : C*r≤C*decodeHigh sizeBit w := Nat.mul_le_mul_left C (by omega)
      have hnL : ls.sum<2^z.length := padded_bound C D hC w ls.sum (by omega)
      have hnR : r<2^z.length := padded_bound C D hC w r (by omega)
      have hgL : xorList (ls.map f)<2^z.length := padded_bound C D hC w _
        ((values_xor_bound f C hf ls hlspos).trans hls)
      have hgR : f r<2^z.length := padded_bound C D hC w _ ((hf r hrpos).trans hr)
      let a := encodeHigh z.length ls.sum (xorList (ls.map f))
      let b := encodeHigh z.length r (f r)
      obtain ⟨haN,haG⟩ := encodeHigh_correct z.length ls.sum (xorList (ls.map f)) hnL hgL
      obtain ⟨hbN,hbG⟩ := encodeHigh_correct z.length r (f r) hnR hgR
      change decodeHigh sizeBit a=ls.sum at haN
      change decodeHigh valueBit a=xorList (ls.map f) at haG
      change decodeHigh sizeBit b=r at hbN
      change decodeHigh valueBit b=f r at hbG
      have ha : A.accepts a=true := by
        apply (hA a).mpr
        rw [haN,haG]
        exact ⟨ls,hlspos,hlenls,rfl,rfl⟩
      have hb : B.accepts b=true := by
        apply (hB b).mpr
        rw [hbN,hbG]
        exact ⟨hrpos,rfl⟩
      obtain ⟨cols,hl,hr,ho⟩ := columns_of_words a b z (encodeHigh_length _ _ _) (encodeHigh_length _ _ _)
      refine ⟨cols,ho,by rw [hl]; exact ha,by rw [hr]; exact hb,?_,?_⟩
      · change decodeHigh sizeBit (cols.map Column.left)+decodeHigh sizeBit (cols.map Column.right)=
          decodeHigh sizeBit (cols.map Column.out)
        rw [hl,hr,ho,haN,hbN,hzN]
        exact hsum'
      · change decodeHigh valueBit (cols.map Column.left) ^^^ decodeHigh valueBit (cols.map Column.right)=
          decodeHigh valueBit (cols.map Column.out)
        rw [hl,hr,ho,haG,hbG,hzG]
        exact hxor'

theorem lower_correct (f : Nat → Nat) (A : Machine) (C D : Nat)
    (hCpos : 1≤C) (hC : C<2^D) (hf : ∀ n, 0<n → f n≤C*n) (hA : Graph f A) :
    ∀ w, (A.lower D).accepts w=true ↔
      0<decodeHigh sizeBit w ∧ decodeHigh valueBit w<f (decodeHigh sizeBit w) := by
  intro w
  rw [Machine.lower_accepts]
  constructor
  · rintro ⟨cols,hout,ha,hs,hlt⟩
    obtain ⟨hn,hg⟩ := (hA _).mp ha
    have hoN : outSize cols=decodeHigh sizeBit w := by
      unfold outSize
      rw [hout,zero_prefix_size]
    have hoG : outValue cols=decodeHigh valueBit w := by
      unfold outValue
      rw [hout,zero_prefix_value]
    change 0<leftSize cols at hn
    change leftValue cols=f (leftSize cols) at hg
    rw [hs,hoN] at hn hg
    exact ⟨hn,by rw [hoG,hg] at hlt; exact hlt⟩
  · rintro ⟨hn,hlt⟩
    let z : List Digit := List.replicate D 0++w
    have hzN : decodeHigh sizeBit z=decodeHigh sizeBit w := zero_prefix_size D w
    have hzG : decodeHigh valueBit z=decodeHigh valueBit w := zero_prefix_value D w
    have hmul : decodeHigh sizeBit w≤C*decodeHigh sizeBit w := by
      simpa using Nat.mul_le_mul_right (decodeHigh sizeBit w) hCpos
    have hnwidth : decodeHigh sizeBit w<2^z.length := padded_bound C D hC w _ hmul
    have hgwidth : f (decodeHigh sizeBit w)<2^z.length := padded_bound C D hC w _ (hf _ hn)
    let a := encodeHigh z.length (decodeHigh sizeBit w) (f (decodeHigh sizeBit w))
    obtain ⟨haN,haG⟩ := encodeHigh_correct z.length (decodeHigh sizeBit w)
      (f (decodeHigh sizeBit w)) hnwidth hgwidth
    change decodeHigh sizeBit a=decodeHigh sizeBit w at haN
    change decodeHigh valueBit a=f (decodeHigh sizeBit w) at haG
    have ha : A.accepts a=true := (hA a).mpr (by rw [haN,haG]; exact ⟨hn,rfl⟩)
    obtain ⟨cols,hl,_,ho⟩ := columns_of_words a z z (encodeHigh_length _ _ _) rfl
    refine ⟨cols,ho,by rw [hl]; exact ha,?_,?_⟩
    · change decodeHigh sizeBit (cols.map Column.left)=decodeHigh sizeBit (cols.map Column.out)
      rw [hl,ho,haN,hzN]
    · change decodeHigh valueBit (cols.map Column.out)<decodeHigh valueBit (cols.map Column.left)
      rw [hl,ho,haG,hzG]
      exact hlt

def Machine.groups (A : Machine) (D : Nat) : Nat → Machine
  | 0 => A
  | p+1 => (A.groups D p).sum A D

theorem groups_correct (f : Nat → Nat) (A : Machine) (C D : Nat)
    (hCpos : 1≤C) (hC : C<2^D) (hf : ∀ n, 0<n → f n≤C*n) (hA : Graph f A)
    (p : Nat) : RecognizesPiles f (A.groups D p) (p+1) := by
  induction p with
  | zero => exact graph_recognizes_one f A hA
  | succ p ih => exact sum_recognizes_successor f _ A (p+1) C D hCpos hC hf ih hA

def Machine.options (A : Machine) (D : Nat) (cuts : List Nat) : Machine :=
  Machine.unions ((cuts.filter (fun d => 0<d)).map (A.groups D))

theorem options_correct (f : Nat → Nat) (A : Machine) (C D : Nat)
    (hCpos : 1≤C) (hC : C<2^D) (hf : ∀ n, 0<n → f n≤C*n) (hA : Graph f A)
    (cuts : List Nat) : ∀ w, (A.options D cuts).accepts w=true ↔
      OptionValue {d | d∈cuts} f (decodeHigh sizeBit w) (decodeHigh valueBit w) := by
  intro w
  rw [Machine.options,Machine.unions_accepts]
  constructor
  · rintro ⟨B,hB,haccept⟩
    obtain ⟨d,hd,rfl⟩ := List.mem_map.mp hB
    have hd' : d∈cuts ∧ 0<d := by simpa using List.mem_filter.mp hd
    obtain ⟨l,hpos,hlen,hsum,hxor⟩ := (groups_correct f A C D hCpos hC hf hA d w).mp haccept
    refine ⟨l,hpos,by omega,?_,hsum,hxor⟩
    change l.length-1∈cuts
    simpa [hlen] using hd'.1
  · rintro ⟨l,hpos,hlen,hcut,hsum,hxor⟩
    refine ⟨A.groups D (l.length-1),?_,?_⟩
    · apply List.mem_map.mpr
      refine ⟨l.length-1,?_,rfl⟩
      apply List.mem_filter.mpr
      exact ⟨hcut,by simp; omega⟩
    · apply (groups_correct f A C D hCpos hC hf hA (l.length-1) w).mpr
      exact ⟨l,hpos,by omega,hsum,hxor⟩

/-- A terminating finite test for every linearly bounded function with a
supplied exact finite graph. The candidate construction below supplies that graph. -/
def graphTest (A : Machine) (D : Nat) (cuts : List Nat) : Bool :=
  (A.dfa.product (A.options D cuts).dfa (· && ·)).emptyCheck &&
  ((A.lower D).dfa.product (A.options D cuts).dfa (fun a b => a && !b)).emptyCheck

theorem graphTest_correct (f : Nat → Nat) (A : Machine) (C D : Nat)
    (hCpos : 1≤C) (hC : C<2^D) (hf : ∀ n, 0<n → f n≤C*n) (hA : Graph f A)
    (cuts : List Nat) :
    graphTest A D cuts=true ↔ SatisfiesMex {d | d∈cuts} f := by
  rw [graphTest,Bool.and_eq_true]
  exact (CutPeriod.Decision.satisfiesMex_iff_finite_tests {d | d∈cuts} f A.dfa
    (A.lower D).dfa (A.options D cuts).dfa hA
    (lower_correct f A C D hCpos hC hf hA)
    (options_correct f A C D hCpos hC hf hA cuts)).symm

#print axioms graphTest_correct

end CutGeneral
