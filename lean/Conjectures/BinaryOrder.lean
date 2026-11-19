import Conjectures.BinaryEncoding

/-! Exact numerical order for high-bit-first binary projection automata. -/
namespace BinaryAutomata

def compareStatus (a b : Nat) : Fin 3 := if a<b then 0 else if a=b then 1 else 2

def compareStep (s : Fin 3) (a b : Nat) : Fin 3 := if s=1 then compareStatus a b else s

theorem compare_double (a b x y : Nat) (hx : x<2) (hy : y<2) :
    compareStep (compareStatus a b) x y=compareStatus (2*a+x) (2*b+y) := by
  by_cases hab : a<b
  · have hn : 2*a+x<2*b+y := by omega
    simp [compareStep,compareStatus,hab,hn]
  · by_cases heq : a=b
    · subst b
      simp [compareStep,compareStatus]
    · have hn : ¬2*a+x<2*b+y := by omega
      have hne : 2*a+x≠2*b+y := by omega
      simp [compareStep,compareStatus,hab,heq,hn,hne]

theorem compareStatus_gt (a b : Nat) : compareStatus a b=2 ↔ b<a := by
  unfold compareStatus
  split_ifs <;> simp_all <;> omega

def compareColumns : Fin 3 → List Column → Fin 3
  | s,[] => s
  | s,c::cs => compareColumns (compareStep s (valueBit c.left) (valueBit c.out)) cs

/-- A comparison state represents the ordering of the complete numerical
prefix, including any initially supplied prefix values. -/
theorem compareColumns_numeric (cols : List Column) (a b : Nat) :
    compareColumns (compareStatus a b) cols=
      compareStatus (a*2^cols.length+leftValue cols) (b*2^cols.length+outValue cols) := by
  induction cols generalizing a b with
  | nil => simp [compareColumns,leftValue,outValue,decodeHigh,decode]
  | cons c cs ih =>
    rw [compareColumns,compare_double a b _ _ (valueBit_bound _) (valueBit_bound _),ih]
    simp only [List.length_cons,pow_succ,leftValue,outValue,List.map_cons,decodeHigh_cons,List.length_map]
    congr 1 <;> ring

theorem compareColumns_gt_iff (cols : List Column) :
    compareColumns 1 cols=2 ↔ outValue cols<leftValue cols := by
  change compareColumns (compareStatus 0 0) cols=2 ↔ _
  rw [compareColumns_numeric]
  simpa only [Nat.zero_mul,Nat.zero_add] using compareStatus_gt (leftValue cols) (outValue cols)

/-- Equal fixed-width numerical tracks have equal digits even when the other
track differs. -/
theorem decode_track_injective (bit : Digit → Nat) (hbit : ∀ d, bit d<2)
    (a b : List Digit) (hlen : a.length=b.length) (hnum : decode bit a=decode bit b) :
    a.map bit=b.map bit := by
  induction a generalizing b with
  | nil =>
    have hb : b=[] := List.eq_nil_of_length_eq_zero (by simpa using hlen.symm)
    subst b
    rfl
  | cons d ds ih =>
    cases b with
    | nil => simp at hlen
    | cons e es =>
      have hd := hbit d
      have he := hbit e
      simp only [decode] at hnum
      have hhead : bit d=bit e := by omega
      have htail : decode bit ds=decode bit es := by omega
      have hm := ih es (by simpa using hlen) htail
      simpa only [List.map_cons,hhead] using congrArg (List.cons (bit e)) hm

theorem decodeHigh_track_injective (bit : Digit → Nat) (hbit : ∀ d, bit d<2)
    (a b : List Digit) (hlen : a.length=b.length)
    (hnum : decodeHigh bit a=decodeHigh bit b) : a.map bit=b.map bit := by
  have hh := decode_track_injective bit hbit a.reverse b.reverse (by simpa using hlen) hnum
  simpa using congrArg List.reverse hh

def SameSizeColumns (cols : List Column) : Prop :=
  ∀ c∈cols, sizeBit c.left=sizeBit c.out

theorem sameSizeColumns_of_numeric (cols : List Column) (h : leftSize cols=outSize cols) :
    SameSizeColumns cols := by
  have hm := decodeHigh_track_injective sizeBit sizeBit_bound
    (cols.map Column.left) (cols.map Column.out) (by simp) h
  simp only [List.map_map,Function.comp_def] at hm
  have general : ∀ cs : List Column,
      cs.map (fun c => sizeBit c.left)=cs.map (fun c => sizeBit c.out) → SameSizeColumns cs := by
    intro cs
    induction cs with
    | nil => simp [SameSizeColumns]
    | cons c cs ih =>
      intro hh
      simp only [List.map_cons,List.cons.injEq] at hh
      intro d hd
      rcases List.mem_cons.mp hd with rfl | hd
      · exact hh.1
      · exact ih hh.2 d hd
  exact general cols hm

theorem sameSizeColumns_numeric (cols : List Column) (h : SameSizeColumns cols) :
    leftSize cols=outSize cols := by
  induction cols with
  | nil => rfl
  | cons c cs ih =>
    have hc := h c (by simp)
    have ht : SameSizeColumns cs := fun d hd => h d (by simp [hd])
    have hh := ih ht
    simp only [leftSize,outSize,List.map_cons,decodeHigh_cons,List.length_map]
    simpa only [leftSize,outSize,hc] using congrArg (fun n => sizeBit c.out*2^cs.length+n) hh

#print axioms compareColumns_gt_iff
#print axioms sameSizeColumns_of_numeric
/-- A checked finite encoding of a component state and an auxiliary state. -/
structure PairEncoding (M K N : Nat) where
  left : Fin N → Fin M
  right : Fin N → Fin K
  pack : Fin M → Fin K → Fin N
  left_pack : ∀ a b, left (pack a b)=a
  right_pack : ∀ a b, right (pack a b)=b
  pack_parts : ∀ s, pack (left s) (right s)=s

end BinaryAutomata
