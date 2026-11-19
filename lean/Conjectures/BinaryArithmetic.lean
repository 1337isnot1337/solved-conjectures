import Conjectures.BinaryAutomata
import Mathlib.Tactic.IntervalCases

/-! Arithmetic interpretation of the local carry constraints used by the CUT
option automata. All binary words have their actual finite width. -/
namespace BinaryAutomata

structure Column where
  left : Digit
  right : Digit
  out : Digit

def leftSize (w : List Column) : Nat := decodeHigh sizeBit (w.map Column.left)
def rightSize (w : List Column) : Nat := decodeHigh sizeBit (w.map Column.right)
def outSize (w : List Column) : Nat := decodeHigh sizeBit (w.map Column.out)

/-- The state carries travel from high to low bits. A local transition guesses
the carry from the next lower column. -/
def Adds : List Column → Fin 2 → Fin 2 → Prop
  | [],hi,lo => hi=lo
  | c::cs,hi,lo => ∃ mid : Fin 2,
      sizeBit c.left+sizeBit c.right+mid.val=sizeBit c.out+2*hi.val ∧ Adds cs mid lo

/-- Local carry constraints are equivalent to actual addition, including the
carries at the two ends of a word. -/
theorem adds_iff (w : List Column) (hi lo : Fin 2) :
    Adds w hi lo ↔ leftSize w+rightSize w+lo.val=outSize w+2^w.length*hi.val := by
  induction w generalizing hi lo with
  | nil => simp [Adds,leftSize,rightSize,outSize,decodeHigh,decode,Fin.ext_iff,eq_comm]
  | cons c cs ih =>
    let P : Nat := 2^cs.length
    have hP : 0<P := by dsimp [P]; positivity
    have hL : leftSize cs<P := by
      simpa only [leftSize,P,List.length_map] using decodeHigh_bound sizeBit sizeBit_bound (cs.map Column.left)
    have hR : rightSize cs<P := by
      simpa only [rightSize,P,List.length_map] using decodeHigh_bound sizeBit sizeBit_bound (cs.map Column.right)
    have hO : outSize cs<P := by
      simpa only [outSize,P,List.length_map] using decodeHigh_bound sizeBit sizeBit_bound (cs.map Column.out)
    have hhi := hi.isLt
    have hlo := lo.isLt
    have hLcons : leftSize (c::cs)=sizeBit c.left*P+leftSize cs := by
      simp only [leftSize,List.map_cons,decodeHigh_cons,List.length_map,P]
    have hRcons : rightSize (c::cs)=sizeBit c.right*P+rightSize cs := by
      simp only [rightSize,List.map_cons,decodeHigh_cons,List.length_map,P]
    have hOcons : outSize (c::cs)=sizeBit c.out*P+outSize cs := by
      simp only [outSize,List.map_cons,decodeHigh_cons,List.length_map,P]
    rw [hLcons,hRcons,hOcons]
    constructor
    · rintro ⟨mid,hcol,htail⟩
      have htail' := (ih mid lo).mp htail
      have hscaled := congrArg (fun n : Nat => n*P) hcol
      change _ = _ + (P*2)*hi.val
      change leftSize cs+rightSize cs+lo.val=outSize cs+P*mid.val at htail'
      nlinarith only [htail',hscaled]
    · intro heq
      let midZ : ℤ := (sizeBit c.out:ℤ)+2*hi.val-sizeBit c.left-sizeBit c.right
      have htailZ : (leftSize cs:ℤ)+rightSize cs+lo.val-outSize cs=(P:ℤ)*midZ := by
        have hz : (sizeBit c.left:ℤ)*P+leftSize cs+
            ((sizeBit c.right:ℤ)*P+rightSize cs)+lo.val=
            (sizeBit c.out:ℤ)*P+outSize cs+(P:ℤ)*2*hi.val := by
          exact_mod_cast heq
        dsimp [midZ]
        nlinarith only [hz]
      have hmidlo : 0≤midZ := by
        by_contra hn
        have hneg : midZ≤-1 := by omega
        have hmul : (P:ℤ)*midZ≤-(P:ℤ) := by
          have hh := mul_nonneg (show (0:ℤ)≤P by positivity) (show 0≤-midZ-1 by omega)
          nlinarith only [hh]
        omega
      have hmidhi : midZ<2 := by
        by_contra hn
        have hpos : 2≤midZ := by omega
        have hmul : 2*(P:ℤ)≤(P:ℤ)*midZ := by
          have hh := mul_nonneg (show (0:ℤ)≤P by positivity) (show 0≤midZ-2 by omega)
          nlinarith only [hh]
        omega
      let mid : Fin 2 := ⟨midZ.toNat,by omega⟩
      have hmid : (mid.val:ℤ)=midZ := by dsimp [mid]; omega
      refine ⟨mid,?_,?_⟩
      · have hz : (sizeBit c.left:ℤ)+sizeBit c.right+mid.val=
            sizeBit c.out+2*hi.val := by rw [hmid]; dsimp [midZ]; ring
        exact_mod_cast hz
      · apply (ih mid lo).mpr
        have hz : (leftSize cs:ℤ)+rightSize cs+lo.val=outSize cs+(P:ℤ)*mid.val := by
          rw [hmid]
          linarith only [htailZ]
        exact_mod_cast hz

/-- With zero carries at the ends, the automaton relation is exactly addition. -/
theorem adds_zero_iff (w : List Column) :
    Adds w 0 0 ↔ leftSize w+rightSize w=outSize w := by
  simpa using adds_iff w 0 0

#print axioms adds_zero_iff
/-- XOR separates the low binary digit from the remaining high digits. -/
theorem xor_low_digit (a b A B : Nat) (ha : a<2) (hb : b<2) :
    (a+2*A) ^^^ (b+2*B)=(a ^^^ b)+2*(A ^^^ B) := by
  interval_cases a <;> interval_cases b
  · simpa [Nat.bit,two_mul,add_comm] using Nat.xor_bit false A false B
  · simpa [Nat.bit,two_mul,add_comm] using Nat.xor_bit false A true B
  · simpa [Nat.bit,two_mul,add_comm] using Nat.xor_bit true A false B
  · simpa [Nat.bit,two_mul,add_comm] using Nat.xor_bit true A true B

theorem xor_low_eq (a b c A B C : Nat) (ha : a<2) (hb : b<2) (hc : c<2) :
    (a+2*A) ^^^ (b+2*B)=c+2*C ↔ a ^^^ b=c ∧ A ^^^ B=C := by
  rw [xor_low_digit a b A B ha hb]
  have hab := Nat.xor_lt_two_pow (n:=1) ha hb
  omega

def XorColumns (w : List Column) : Prop :=
  ∀ c∈w, valueBit c.left ^^^ valueBit c.right=valueBit c.out

theorem low_xor_iff (w : List Column) :
    decode valueBit (w.map Column.left) ^^^ decode valueBit (w.map Column.right)=
      decode valueBit (w.map Column.out) ↔ XorColumns w := by
  induction w with
  | nil => simp [decode,XorColumns]
  | cons c cs ih =>
    have hcols : XorColumns (c::cs) ↔
        (valueBit c.left ^^^ valueBit c.right=valueBit c.out) ∧ XorColumns cs := by
      simp [XorColumns]
    rw [hcols]
    simp only [List.map_cons,decode]
    rw [xor_low_eq _ _ _ _ _ _ (valueBit_bound _) (valueBit_bound _) (valueBit_bound _),ih]

def leftValue (w : List Column) : Nat := decodeHigh valueBit (w.map Column.left)
def rightValue (w : List Column) : Nat := decodeHigh valueBit (w.map Column.right)
def outValue (w : List Column) : Nat := decodeHigh valueBit (w.map Column.out)

/-- Columnwise XOR is exactly numerical XOR for the high-bit-first reading. -/
theorem high_xor_iff (w : List Column) :
    leftValue w ^^^ rightValue w=outValue w ↔ XorColumns w := by
  unfold leftValue rightValue outValue decodeHigh
  rw [←List.map_reverse,←List.map_reverse,←List.map_reverse,low_xor_iff]
  simp only [XorColumns,List.mem_reverse]

#print axioms high_xor_iff

end BinaryAutomata
