import Conjectures.BinaryEncoding
import Conjectures.BinaryComposition
import Conjectures.CutPeriodGraphCertificate
import Conjectures.CutFamily

/-! The connection between binary composition languages and actual positive
pile lists, including completeness of the width used for hidden tracks. -/
namespace CutPeriod
open BinaryAutomata

def Piles (p n g : Nat) : Prop :=
  ∃ l : List Nat, (∀ h∈l, 0<h) ∧ l.length=p ∧ l.sum=n ∧ CutFamily.xorList (l.map value)=g

def RecognizesPiles {Q : Type} (A : DFA Q) (p : Nat) : Prop :=
  ∀ w, A.accepts w=true ↔ Piles p (decodeHigh sizeBit w) (decodeHigh valueBit w)

theorem value_le_size (n : Nat) : value n≤n := by
  by_cases hn : n≤6
  · have hsmall : ∀ i : Fin 7, value i.val≤i.val := by decide
    exact hsmall ⟨n,by omega⟩
  · have hdiv := Nat.mod_add_div (n-7) 12
    have hr := Nat.mod_lt (n-7) (by decide : 0<12)
    have hfinite : ∀ r : Fin 12, block[r.val]!≤7+r.val := by decide
    have hb := hfinite ⟨(n-7)%12,hr⟩
    dsimp only at hb
    rw [value_tail n (by omega)]
    omega

theorem values_sum_le (l : List Nat) : (l.map value).sum≤l.sum := by
  induction l with
  | nil => rfl
  | cons h l ih =>
    have hh := value_le_size h
    simp only [List.map_cons,List.sum_cons]
    omega

theorem values_xor_le (l : List Nat) : CutFamily.xorList (l.map value)≤l.sum :=
  (CutFamily.xorList_le_sum (l.map value)).trans (values_sum_le l)

theorem graph_recognizes_one : RecognizesPiles GraphCertificate.machine 1 := by
  intro w
  rw [GraphCertificate.correct]
  constructor
  · rintro ⟨hn,hg⟩
    refine ⟨[decodeHigh sizeBit w],?_,rfl,by simp,?_⟩
    · intro h hh
      have heq : h=decodeHigh sizeBit w := List.mem_singleton.mp hh
      simpa only [heq] using hn
    · simpa only [List.map_singleton,CutFamily.xorList,Nat.xor_zero] using hg.symm
  · rintro ⟨l,hpos,hlen,hsum,hxor⟩
    cases l with
    | nil => simp at hlen
    | cons h hs =>
      have hhs : hs=[] := List.eq_nil_of_length_eq_zero (by simpa using hlen)
      subst hs
      have hn : h=decodeHigh sizeBit w := by simpa using hsum
      have hg : value h=decodeHigh valueBit w := by simpa [CutFamily.xorList] using hxor
      refine ⟨?_,?_⟩
      · rw [←hn]
        exact hpos h (by simp)
      · rw [←hn]
        exact hg.symm

/-- Numeric witness bounds suffice for padding both hidden tracks to the
visible input width. The relation is about actual pile lists, at every size. -/
theorem sum_recognizes_successor {L N : Nat} (E : ProductEncoding L 27 N)
    (A : DFA (Fin L)) (p : Nat) (hA : RecognizesPiles A p) :
    ∀ w, (sumMachine E A GraphCertificate.machine
      A.rejectingSink GraphCertificate.machine.rejectingSink).accepts w=true ↔
        Piles (p+1) (decodeHigh sizeBit w) (decodeHigh valueBit w) := by
  intro w
  rw [sum_accepts_iff E A GraphCertificate.machine A.rejectingSink GraphCertificate.machine.rejectingSink
    A.rejectingSink_sound GraphCertificate.machine.rejectingSink_sound]
  constructor
  · rintro ⟨cols,hout,ha,hb,hsum,hxor⟩
    obtain ⟨ls,hpos,hlen,hls,hgls⟩ := (hA _).mp ha
    obtain ⟨hrpos,hgr⟩ := (GraphCertificate.correct _).mp hb
    subst w
    change Piles (p+1) (outSize cols) (outValue cols)
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
    · simp only [List.map_cons,CutFamily.xorList]
      change CutFamily.xorList (ls.map value)=leftValue cols at hgls
      rw [hgls]
      change rightValue cols=value r at hgr
      rw [←hgr,Nat.xor_comm]
      exact hxor
  · rintro ⟨l,hpos,hlen,hsum,hxor⟩
    cases l with
    | nil => simp at hlen
    | cons r ls =>
      have hrpos := hpos r (by simp)
      have hlspos : ∀ h∈ls, 0<h := fun h hh => hpos h (by simp [hh])
      have hlenls : ls.length=p := by simpa using hlen
      have hsum' : ls.sum+r=decodeHigh sizeBit w := by simpa [Nat.add_comm] using hsum
      have hxor' : CutFamily.xorList (ls.map value) ^^^ value r=decodeHigh valueBit w := by
        simpa only [List.map_cons,CutFamily.xorList,Nat.xor_comm] using hxor
      have hwidth := decodeHigh_bound sizeBit sizeBit_bound w
      have hgLeft := values_xor_le ls
      have hgRight := value_le_size r
      have hnL : ls.sum<2^w.length := by omega
      have hnR : r<2^w.length := by omega
      have hgL : CutFamily.xorList (ls.map value)<2^w.length := by omega
      have hgR : value r<2^w.length := by omega
      let a := encodeHigh w.length ls.sum (CutFamily.xorList (ls.map value))
      let b := encodeHigh w.length r (value r)
      obtain ⟨haN,haG⟩ := encodeHigh_correct w.length ls.sum (CutFamily.xorList (ls.map value)) hnL hgL
      obtain ⟨hbN,hbG⟩ := encodeHigh_correct w.length r (value r) hnR hgR
      change decodeHigh sizeBit a=ls.sum at haN
      change decodeHigh valueBit a=CutFamily.xorList (ls.map value) at haG
      change decodeHigh sizeBit b=r at hbN
      change decodeHigh valueBit b=value r at hbG
      have ha : A.accepts a=true := by
        apply (hA a).mpr
        rw [haN,haG]
        exact ⟨ls,hlspos,hlenls,rfl,rfl⟩
      have hb : GraphCertificate.machine.accepts b=true := by
        apply (GraphCertificate.correct b).mpr
        rw [hbN,hbG]
        exact ⟨hrpos,rfl⟩
      obtain ⟨cols,hl,hr,ho⟩ := columns_of_words a b w (encodeHigh_length _ _ _) (encodeHigh_length _ _ _)
      refine ⟨cols,ho,by rw [hl]; exact ha,by rw [hr]; exact hb,?_,?_⟩
      · change decodeHigh sizeBit (cols.map Column.left)+decodeHigh sizeBit (cols.map Column.right)=
          decodeHigh sizeBit (cols.map Column.out)
        rw [hl,hr,ho,haN,hbN]
        exact hsum'
      · change decodeHigh valueBit (cols.map Column.left) ^^^ decodeHigh valueBit (cols.map Column.right)=
          decodeHigh valueBit (cols.map Column.out)
        rw [hl,hr,ho,haG,hbG]
        exact hxor'

#print axioms sum_recognizes_successor
end CutPeriod
