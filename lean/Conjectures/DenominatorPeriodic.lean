import Conjectures.DenominatorSpecialTail
import Conjectures.DenominatorPrefixTotals

namespace DenominatorForest

open Polynomial

def wordRoot (word : List Nat) (hsmall : ∀ i, word.getD i 0 ≤ 1) (q : Nat) : State where
  value i := word.getD ((q+i)%word.length) 0
  offset := phaseOffset word q
  cutoff := 0
  tail_small i _ := hsmall ((q+i)%word.length)

theorem wordRoot_sorted (word : List Nat) (hsmall : ∀ i, word.getD i 0 ≤ 1) (q : Nat) :
    (wordRoot word hsmall q).Sorted := by
  intro i
  have hh := hsmall ((q+(i+1))%word.length)
  dsimp [wordRoot]
  omega

theorem wordRoot_depth_zero (word : List Nat) (hsmall : ∀ i, word.getD i 0 ≤ 1) (q : Nat) :
    (wordRoot word hsmall q).WithinDepth 0 := by
  constructor
  · intro i
    exact hsmall _
  · dsimp [wordRoot,phaseOffset]
    omega

theorem list_getD_drop (word : List Nat) (q i : Nat) :
    (word.drop q).getD i 0=word.getD (q+i) 0 := by
  simp only [List.getD_eq_getElem?_getD,List.getElem?_drop]

theorem wordRoot_splice (word : List Nat) (hsmall : ∀ i, word.getD i 0 ≤ 1)
    (q : Nat) (hq : q < word.length) :
    (wordRoot word hsmall q).DataEq
      (State.splice (phaseHead word q) (wordRoot word hsmall 0) (phaseOffset word q)) := by
  constructor
  · intro i
    by_cases hq0 : q=0
    · subst q
      simp [wordRoot,phaseHead,State.splice]
    · have hlen : (phaseHead word q).length=word.length-q := by
        simp [phaseHead,hq0]
      by_cases hi : i < word.length-q
      · rw [State.splice_value_head _ _ _ _ (by omega)]
        simp only [phaseHead,hq0,↓reduceIte,list_getD_drop]
        change word.getD ((q+i)%word.length) 0=word.getD (q+i) 0
        rw [Nat.mod_eq_of_lt (by omega)]
      · rw [State.splice_value_tail _ _ _ _ (by omega),hlen]
        change word.getD ((q+i)%word.length) 0=
          word.getD ((0+(i-(word.length-q)))%word.length) 0
        have he : q+i=word.length+(i-(word.length-q)) := by omega
        simp [he]
  · rfl

theorem phaseHead_last (word : List Nat) (q : Nat) (hq : q < word.length)
    (hlast : word.getD (word.length-1) 0=1) :
    phaseHead word q ≠ [] → 1 ≤ (phaseHead word q).getD ((phaseHead word q).length-1) 0 := by
  intro hne
  have hq0 : q ≠ 0 := by intro he; simp [phaseHead,he] at hne
  simp only [phaseHead,hq0,↓reduceIte,List.length_drop,list_getD_drop]
  have he : q+(word.length-q-1)=word.length-1 := by omega
  rw [he,hlast]

theorem phaseHead_lower (word : List Nat) (q : Nat) (hq : q < word.length)
    (hlast : word.getD (word.length-1) 0=1) :
    0 ≤ ((phaseHead word q).length:Int)+phaseOffset word q := by
  by_cases hq0 : q=0
  · subst q
    change 0 ≤ (0:Int)+((word.getD (word.length-1) 0:Int)-1)
    rw [hlast]
    omega
  · simp only [phaseHead,phaseOffset,hq0,↓reduceIte,List.length_drop]
    omega

theorem wordRoot_zeroTail (word : List Nat) (hsmall : ∀ i, word.getD i 0 ≤ 1)
    (hlen : 2 ≤ word.length) (hzero : word.getD 0 0=0) (hone : word.getD 1 0=0)
    (hlast : word.getD (word.length-1) 0=1) :
    State.ZeroTail (wordRoot word hsmall 0) := by
  refine ⟨fun i => hsmall _,?_,?_,?_⟩
  · simpa [wordRoot] using hzero
  · simpa [wordRoot,Nat.mod_eq_of_lt (show 1 < word.length by omega)] using hone
  · change (word.getD (word.length-1) 0:Int)-1=0
    rw [hlast]
    rfl

theorem wordRoot_step_zero (word : List Nat) (hsmall : ∀ i, word.getD i 0 ≤ 1) :
    ((wordRoot word hsmall 0).step 0).DataEq (wordRoot word hsmall 1) := by
  constructor
  · intro i
    simp [State.step,wordRoot,Nat.add_comm]
  · simp [State.step,wordRoot,phaseOffset]

theorem wordRoot_series (word : List Nat) (hsmall : ∀ i, word.getD i 0 ≤ 1)
    (hlen : 2 ≤ word.length) (hzero : word.getD 0 0=0) (hone : word.getD 1 0=0)
    (hlast : word.getD (word.length-1) 0=1) (q : Nat) (hq : q < word.length) :
    series (wordRoot word hsmall q)=
      (deadPoly (phaseHead word q) (phaseOffset word q):PowerSeries ℚ)+
      (prefixSecond (phaseHead word q) (phaseOffset word q):PowerSeries ℚ)*
        series (wordRoot word hsmall 1) := by
  have he := wordRoot_splice word hsmall q hq
  rw [series_congr he,special_prefix_series]
  · rw [series_congr (wordRoot_step_zero word hsmall)]
  · exact wordRoot_zeroTail word hsmall hlen hzero hone hlast
  · exact State.sorted_dataEq he (wordRoot_sorted word hsmall q)
  · exact phaseHead_last word q hq hlast
  · exact phaseHead_lower word q hq hlast

noncomputable def wordSeries (word : List Nat) (hsmall : ∀ i, word.getD i 0 ≤ 1) :
    PowerSeries ℚ := (1-PowerSeries.X)*∑ q ∈ Finset.range word.length,
      series (wordRoot word hsmall q)

/-- The complete rational identity before concrete polynomial simplification. -/
theorem wordSeries_identity (word : List Nat) (hsmall : ∀ i, word.getD i 0 ≤ 1)
    (hlen : 2 ≤ word.length) (hzero : word.getD 0 0=0) (hone : word.getD 1 0=0)
    (hlast : word.getD (word.length-1) 0=1) :
    (((1 : ℚ[X])-prefixSecond (phaseHead word 1) (phaseOffset word 1)):PowerSeries ℚ)*
      wordSeries word hsmall=
      (((1-Polynomial.X)*(sumFirst word*((1:ℚ[X])-prefixSecond (phaseHead word 1) (phaseOffset word 1))+
        sumSecond word*deadPoly (phaseHead word 1) (phaseOffset word 1)):ℚ[X]):PowerSeries ℚ) := by
  have hroot := wordRoot_series word hsmall hlen hzero hone hlast 1 (by omega)
  have hsum : (∑ q ∈ Finset.range word.length, series (wordRoot word hsmall q))=
      (sumFirst word:PowerSeries ℚ)+(sumSecond word:PowerSeries ℚ)*series (wordRoot word hsmall 1) := by
    unfold sumFirst sumSecond
    rw [polynomial_sum_coe,polynomial_sum_coe,Finset.sum_mul,← Finset.sum_add_distrib]
    apply Finset.sum_congr rfl
    intro q hq
    exact wordRoot_series word hsmall hlen hzero hone hlast q (Finset.mem_range.mp hq)
  have hroot' : (1-(prefixSecond (phaseHead word 1) (phaseOffset word 1):PowerSeries ℚ))*
      series (wordRoot word hsmall 1)=(deadPoly (phaseHead word 1) (phaseOffset word 1):PowerSeries ℚ) := by
    rw [sub_mul,one_mul]
    exact sub_eq_iff_eq_add.mpr (by simpa only [add_comm] using hroot)
  unfold wordSeries
  rw [hsum]
  simp only [Polynomial.coe_sub,Polynomial.coe_one,Polynomial.coe_mul,Polynomial.coe_add,
    Polynomial.coe_X]
  calc
    _ = (1-PowerSeries.X)*((sumFirst word:PowerSeries ℚ)*
        (1-(prefixSecond (phaseHead word 1) (phaseOffset word 1):PowerSeries ℚ))+
        (sumSecond word:PowerSeries ℚ)*((1-(prefixSecond (phaseHead word 1) (phaseOffset word 1):PowerSeries ℚ))*
          series (wordRoot word hsmall 1))) := by ring
    _ = _ := by rw [hroot']

end DenominatorForest
