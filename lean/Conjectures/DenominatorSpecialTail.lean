import Conjectures.DenominatorDecomposition

namespace DenominatorForest

namespace State

/-- The binary tail starts with the two zeroes at the distinguished cut. -/
structure ZeroTail (t : State) : Prop where
  small : ∀ i, t.value i ≤ 1
  zero : t.value 0=0
  one : t.value 1=0
  offset : t.offset=0

theorem ZeroTail.sorted {t : State} (h : ZeroTail t) : t.Sorted := by
  intro i
  have hi := h.small (i+1)
  omega

theorem splice_legal_special (a : List Nat) (t : State) (s : Int)
    (ht : ZeroTail t) (hlo : 0 ≤ (a.length:Int)+s) (i : Nat) (hi : a.length ≤ i) :
    (splice a t s).Legal i ↔ i=a.length ∧ (a.length:Int)+s ≤ 0 := by
  constructor
  · intro h
    have hv := h.1
    rw [splice_value_tail a t s i hi] at hv
    change (i:Int)+s ≤ t.value (i-a.length) at hv
    have hsmall := ht.small (i-a.length)
    have hle : i ≤ a.length+1 := by omega
    have he : i=a.length := by
      by_contra hn
      have hk : i-a.length=1 := by omega
      rw [hk,ht.one] at hv
      omega
    refine ⟨he,?_⟩
    rw [he,Nat.sub_self,ht.zero] at hv
    exact hv
  · rintro ⟨rfl,h⟩
    constructor
    · change (a.length:Int)+s ≤ (splice a t s).value a.length
      rw [splice_value_tail a t s a.length le_rfl,Nat.sub_self,ht.zero]
      exact h
    · by_cases ha : a.length=0
      · exact Or.inl ha
      · right
        rw [splice_value_tail a t s a.length le_rfl,Nat.sub_self,ht.zero,
          splice_value_head a t s (a.length-1) (by omega)]
        omega

theorem splice_moves_special (a : List Nat) (t : State) (s : Int)
    (ht : ZeroTail t) (hlo : 0 ≤ (a.length:Int)+s) :
    (splice a t s).moves=headChoices a s ∪
      (if (a.length:Int)+s ≤ 0 then {a.length} else ∅) := by
  ext i
  rw [mem_moves,Finset.mem_union,mem_headChoices]
  by_cases hi : i < a.length
  · rw [splice_head_legal a t s i hi]
    have hn : i ≠ a.length := by omega
    simp only [hi,true_and]
    split_ifs <;> simp [hn]
  · rw [splice_legal_special a t s ht hlo i (by omega)]
    simp only [hi,false_and,false_or]
    split_ifs with hc <;> simp [hc]

theorem splice_moves_special_disjoint (a : List Nat) (s : Int) :
    Disjoint (headChoices a s) (if (a.length:Int)+s ≤ 0 then {a.length} else ∅) := by
  split_ifs
  · apply Finset.disjoint_left.mpr
    intro i hi hj
    have hh := ((mem_headChoices a s i).mp hi).1
    have he := Finset.mem_singleton.mp hj
    omega
  · exact Finset.disjoint_empty_right _

theorem step_dataEq_of_values {s t : State} (h : ∀ i, s.value i=t.value i) (j : Nat) :
    (s.step j).DataEq (t.step j) := by
  constructor
  · intro i
    simp only [step,h i,h (i+1)]
  · simp only [step,h j]

theorem splice_step_special (a : List Nat) (t : State) (s : Int) :
    ((splice a t s).step a.length).DataEq
      (liftHead (shiftHead a 1) (t.step 0)) := by
  have he : ((splice a t s).step a.length).DataEq ((liftHead a t).step a.length) :=
    step_dataEq_of_values (fun _ => rfl) a.length
  exact dataEq_trans he (by simpa only [Nat.add_zero] using liftHead_step_tail a t 0)

theorem protected_after_special (a : List Nat) (t : State) (s : Int)
    (ht : ZeroTail t) (hs : (splice a t s).Sorted)
    (hlast : a ≠ [] → 1 ≤ a.getD (a.length-1) 0) :
    Protected (shiftHead a 1) (t.step 0) := by
  refine ⟨t.step_sorted ht.sorted 0,
    sorted_dataEq (splice_step_special a t s) ((splice a t s).step_sorted hs _),?_,?_⟩
  · by_cases ha : a=[]
    · left
      simp [shiftHead,ha]
    · right
      have hlen := List.ne_nil_iff_length_pos.mp ha
      have hh := hlast ha
      rw [shiftHead_length,shiftHead_getD _ _ _ (by omega)]
      change t.value 1+2 ≤ a.getD (a.length-1) 0+1
      rw [ht.one]
      omega
  · intro _
    change (t.value 0:Int)-0-1 ≤ _
    rw [ht.zero]
    omega

theorem special_head_lower (a : List Nat) (t : State) (s : Int)
    (hs : (splice a t s).Sorted) (hlast : a ≠ [] → 1 ≤ a.getD (a.length-1) 0)
    (j : Nat) (hj : j < a.length) :
    0 ≤ ((headStep a j).length:Int)+headOffset a j := by
  have ha : a ≠ [] := by intro he; simp [he] at hj
  have hh := hlast ha
  have hp := (splice a t s).physical_antitone hs (show j ≤ a.length-1 by omega)
  dsimp only at hp
  rw [splice_value_head a t s (a.length-1) (by omega),splice_value_head a t s j hj] at hp
  rw [headStep_length]
  dsimp [headOffset]
  omega

theorem special_head_last (a : List Nat) (t : State) (s : Int)
    (hs : (splice a t s).Sorted) (hlast : a ≠ [] → 1 ≤ a.getD (a.length-1) 0)
    (j : Nat) (hj : j < a.length) :
    headStep a j ≠ [] → 1 ≤ (headStep a j).getD ((headStep a j).length-1) 0 := by
  intro hnew
  have ha : a ≠ [] := by intro he; simp [he] at hj
  exact (hlast ha).trans (headStep_last_ge a t s hs j hj
    (List.ne_nil_iff_length_pos.mp hnew))

end State

theorem prefixSecond_coe_eq (a : List Nat) (s : Int) :
    (prefixSecond a s : PowerSeries ℚ)=
      (if (a.length:Int)+s ≤ 0 then PowerSeries.X*(freePoly a:PowerSeries ℚ) else 0)+
      PowerSeries.X*∑ j ∈ headChoices a s,
        (prefixSecond (headStep a j) (headOffset a j):PowerSeries ℚ) := by
  rw [prefixSecond_eq]
  split_ifs <;> simp

/-- The exact affine decomposition over the distinguished binary tail. -/
theorem special_prefix_series (a : List Nat) (t : State) (s : Int)
    (ht : State.ZeroTail t) (hs : (State.splice a t s).Sorted)
    (hlast : a ≠ [] → 1 ≤ a.getD (a.length-1) 0)
    (hlo : 0 ≤ (a.length:Int)+s) :
    series (State.splice a t s)=(deadPoly a s:PowerSeries ℚ)+
      (prefixSecond a s:PowerSeries ℚ)*series (t.step 0) := by
  have aux : ∀ N (a : List Nat), a.length=N → ∀ t s,
      State.ZeroTail t → (State.splice a t s).Sorted →
      (a ≠ [] → 1 ≤ a.getD (a.length-1) 0) → 0 ≤ (a.length:Int)+s →
      series (State.splice a t s)=(deadPoly a s:PowerSeries ℚ)+
        (prefixSecond a s:PowerSeries ℚ)*series (t.step 0) := by
    intro N
    induction N using Nat.strong_induction_on with
    | h N ih =>
      intro a ha t s ht hs hlast hlo
      rw [series_rec,State.splice_moves_special a t s ht hlo,
        Finset.sum_union (State.splice_moves_special_disjoint a s)]
      have hhead : (∑ j ∈ headChoices a s, series ((State.splice a t s).step j))=
          (∑ j ∈ headChoices a s, (deadPoly (headStep a j) (headOffset a j):PowerSeries ℚ))+
          (∑ j ∈ headChoices a s, (prefixSecond (headStep a j) (headOffset a j):PowerSeries ℚ))*
            series (t.step 0) := by
        rw [Finset.sum_mul,← Finset.sum_add_distrib]
        apply Finset.sum_congr rfl
        intro j hj
        have hj' := ((mem_headChoices a s j).mp hj).1
        have he := State.splice_step_head a t s j hj'
        rw [series_congr he]
        exact ih (headStep a j).length (by rw [headStep_length]; omega) (headStep a j) rfl
          t (headOffset a j) ht
          (State.sorted_dataEq he ((State.splice a t s).step_sorted hs j))
          (State.special_head_last a t s hs hlast j hj')
          (State.special_head_lower a t s hs hlast j hj')
      have htail : (∑ j ∈ (if (a.length:Int)+s ≤ 0 then {a.length} else ∅),
          series ((State.splice a t s).step j))=
          if (a.length:Int)+s ≤ 0 then (freePoly a:PowerSeries ℚ)*series (t.step 0) else 0 := by
        split_ifs
        · simp only [Finset.sum_singleton]
          rw [series_congr (State.splice_step_special a t s),
            protected_series _ _ (State.protected_after_special a t s ht hs hlast),freePoly_shift]
        · simp
      rw [hhead,htail,deadPoly_coe_eq,prefixSecond_coe_eq]
      split_ifs <;> ring
  exact aux a.length a rfl t s ht hs hlast hlo

end DenominatorForest
