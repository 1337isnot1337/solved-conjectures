import Conjectures.DenominatorPeriodic
import Conjectures.DenominatorLocality
import Mathlib.Data.List.Sort

namespace DenominatorForest

def periodBit (word : List Nat) (i : Nat) : Nat := word.getD (i%word.length) 0

def priorBit (word : List Nat) (q : Nat) : Nat :=
  word.getD (if q=0 then word.length-1 else q-1) 0

def nextPhase (word : List Nat) (q : Nat) : Nat := (q+1)%word.length

def cycleList (word : List Nat) (k q : Nat) : List Nat :=
  (List.range (word.length*k-1+priorBit word q)).map
    (fun i => word.length*k-1-i+periodBit word (q+i))

@[simp] theorem cycleList_length (word : List Nat) (k q : Nat) :
    (cycleList word k q).length=word.length*k-1+priorBit word q := by
  simp [cycleList]

theorem cycleList_getD (word : List Nat) (k q i : Nat) (hi : i < (cycleList word k q).length) :
    (cycleList word k q).getD i 0=word.length*k-1-i+periodBit word (q+i) := by
  rw [List.getD_eq_getElem _ 0 hi]
  simp [cycleList]

theorem priorBit_le (word : List Nat) (hsmall : ∀ i, word.getD i 0 ≤ 1) (q : Nat) :
    priorBit word q ≤ 1 := hsmall _

theorem periodBit_le (word : List Nat) (hsmall : ∀ i, word.getD i 0 ≤ 1) (i : Nat) :
    periodBit word i ≤ 1 := hsmall _

theorem period_last_index (p k q : Nat) (hp : 0 < p) (hk : 0 < k) (hq : q < p) :
    (q+(p*k-1))%p=if q=0 then p-1 else q-1 := by
  have hL : 0 < p*k := Nat.mul_pos hp hk
  by_cases hq0 : q=0
  · subst q
    simpa using Nat.mul_sub_mod (x := 0) (n := p) (p := k) hL
  · rw [ite_eq_right hq0]
    have he : q+(p*k-1)=p*k+(q-1) := by omega
    rw [he,Nat.mul_add_mod_self_left,Nat.mod_eq_of_lt (by omega)]

theorem periodBit_last (word : List Nat) (k q : Nat) (hp : 0 < word.length)
    (hk : 0 < k) (hq : q < word.length) :
    periodBit word (q+(word.length*k-1))=priorBit word q := by
  unfold periodBit priorBit
  rw [period_last_index word.length k q hp hk hq]

theorem priorBit_next (word : List Nat) (q : Nat) (hp : 0 < word.length) (hq : q < word.length) :
    priorBit word (nextPhase word q)=periodBit word q := by
  by_cases he : q+1=word.length
  · have hq' : q=word.length-1 := by omega
    simp only [nextPhase,he,Nat.mod_self,priorBit,ite_true,periodBit,Nat.mod_eq_of_lt hq]
    rw [hq']
  · have hn : q+1 < word.length := by omega
    simp [nextPhase,Nat.mod_eq_of_lt hn,priorBit,periodBit,Nat.mod_eq_of_lt hq]

theorem periodBit_next (word : List Nat) (q i : Nat) :
    periodBit word (nextPhase word q+i)=periodBit word (q+(i+1)) := by
  unfold periodBit nextPhase
  congr 1
  rw [Nat.mod_add_mod]
  congr 1
  omega

theorem cycleList_positive (word : List Nat) (hsmall : ∀ i, word.getD i 0 ≤ 1)
    (k q : Nat) (hp : 0 < word.length) (hk : 0 < k) (hq : q < word.length) :
    DenominatorFinite.Positive (cycleList word k q) := by
  intro a ha
  obtain ⟨i,hi,rfl⟩ := List.mem_map.mp ha
  have hi' : i < word.length*k-1+priorBit word q := List.mem_range.mp hi
  have hprev := priorBit_le word hsmall q
  by_cases hil : i < word.length*k-1
  · omega
  · have he : i=word.length*k-1 := by omega
    rw [he,Nat.sub_self,zero_add,periodBit_last word k q hp hk hq]
    omega

theorem cycleList_descending (word : List Nat) (hsmall : ∀ i, word.getD i 0 ≤ 1)
    (k q : Nat) : DenominatorFinite.Descending (cycleList word k q) := by
  intro i j hij hj
  have hi : i < (cycleList word k q).length := by omega
  rw [cycleList_getD word k q j hj,cycleList_getD word k q i hi]
  have hprev := priorBit_le word hsmall q
  have hb := periodBit_le word hsmall (q+j)
  rw [cycleList_length] at hj
  rcases eq_or_lt_of_le hij with rfl|hij
  · rfl
  · omega

theorem cycleList_realizes (word : List Nat) (hsmall : ∀ i, word.getD i 0 ≤ 1)
    (k q W : Nat) (hp : 0 < word.length) (hk : 0 < k) (hq : q < word.length)
    (hW : W ≤ word.length*k-1) :
    DenominatorFinite.Realizes (word.length*k) W (wordRoot word hsmall q) (cycleList word k q) := by
  have hL := Nat.mul_pos hp hk
  refine ⟨cycleList_descending word hsmall k q,
    cycleList_positive word hsmall k q hp hk hq,?_,?_,?_⟩
  · rw [cycleList_length]
    change ((word.length*k-1+priorBit word q:Nat):Int)=
      (word.length*k:Nat)+((priorBit word q:Int)-1)
    omega
  · rw [cycleList_length]
    omega
  · intro i hi
    rw [cycleList_getD word k q i (by rw [cycleList_length]; omega)]
    change ((word.length*k-1-i+periodBit word (q+i):Nat):Int)=
      (word.length*k:Nat)-1-i+periodBit word (q+i)
    omega

/-- Every fixed-depth count stabilizes in the actual finite reverse graph. -/
theorem cycleList_pathCount (word : List Nat) (hsmall : ∀ i, word.getD i 0 ≤ 1)
    (n k q : Nat) (hp : 0 < word.length) (hk : 0 < k) (hq : q < word.length)
    (hL : 3*n+5 ≤ word.length*k) :
    DenominatorFinite.actualPathCount n (cycleList word k q:Multiset Nat)=
      pathCount n (wordRoot word hsmall q) := by
  apply DenominatorFinite.pathCount_eq_actual n 0 (word.length*k) (word.length*k-1)
  · exact cycleList_realizes word hsmall k q _ hp hk hq le_rfl
  · exact wordRoot_depth_zero word hsmall q
  · omega

end DenominatorForest
