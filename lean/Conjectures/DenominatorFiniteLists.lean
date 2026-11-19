import Conjectures.DenominatorHead
import Mathlib.Data.List.GetD
import Mathlib.Data.List.Perm.Basic
import Mathlib.Data.Multiset.FinsetOps

namespace DenominatorFinite

def Descending (l : List Nat) : Prop :=
  ∀ i j, i ≤ j → j < l.length → l.getD j 0 ≤ l.getD i 0

def Positive (l : List Nat) : Prop := ∀ a ∈ l, 0 < a

def Legal (l : List Nat) (j : Nat) : Prop :=
  j < l.length ∧ l.length ≤ l.getD j 0+1 ∧
    (j=0 ∨ l.getD j 0 ≠ l.getD (j-1) 0)

instance (l : List Nat) (j : Nat) : Decidable (Legal l j) :=
  inferInstanceAs (Decidable (j < l.length ∧ l.length ≤ l.getD j 0+1 ∧
    (j=0 ∨ l.getD j 0 ≠ l.getD (j-1) 0)))

def choices (l : List Nat) : Finset Nat := (Finset.range l.length).filter (Legal l)

@[simp] theorem mem_choices (l : List Nat) (j : Nat) : j ∈ choices l ↔ Legal l j := by
  simp only [choices,Finset.mem_filter,Finset.mem_range]
  exact ⟨fun h => h.2,fun h => ⟨h.1,h⟩⟩

theorem getD_mem (l : List Nat) (j : Nat) (hj : j < l.length) : l.getD j 0 ∈ l := by
  rw [List.getD_eq_getElem l 0 hj]
  exact List.getElem_mem _

theorem coe_eraseIdx (l : List Nat) (j : Nat) (hj : j < l.length) :
    ((l.eraseIdx j):Multiset Nat)=(l:Multiset Nat).erase (l.getD j 0) := by
  induction l generalizing j with
  | nil => simp at hj
  | cons a l ih =>
    cases j with
    | zero => simp
    | succ j =>
      have hj' : j < l.length := by simpa using hj
      simp only [List.eraseIdx_cons_succ,List.getD_cons_succ]
      change a ::ₘ (l.eraseIdx j:Multiset Nat)=(a ::ₘ (l:Multiset Nat)).erase (l.getD j 0)
      rw [ih j hj',Multiset.erase_cons_tail_of_mem (show l.getD j 0 ∈ (l:Multiset Nat) from getD_mem l j hj')]

def reverseList (l : List Nat) (j : Nat) : List Nat :=
  (l.eraseIdx j).map Nat.succ ++ List.replicate (l.getD j 0+1-l.length) 1

theorem reverse_coe (l : List Nat) (j : Nat) (hj : j < l.length) :
    (reverseList l j:Multiset Nat)=DenominatorDynamics.reverseMove (l:Multiset Nat) (l.getD j 0) := by
  change (l.eraseIdx j:Multiset Nat).map Nat.succ+
      Multiset.replicate (l.getD j 0+1-l.length) 1=
    ((l:Multiset Nat).erase (l.getD j 0)).map Nat.succ+
      Multiset.replicate (l.getD j 0+1-l.length) 1
  rw [coe_eraseIdx l j hj]

theorem reverse_length (l : List Nat) (j : Nat) (hj : Legal l j) :
    (reverseList l j).length=l.getD j 0 := by
  simp only [reverseList,List.length_append,List.length_map,List.length_replicate,
    List.length_eraseIdx_of_lt hj.1]
  have hl := hj.2.1
  have hpos : 0 < l.length := (Nat.zero_le j).trans_lt hj.1
  omega

theorem reverse_positive (l : List Nat) (j : Nat) : Positive (reverseList l j) := by
  intro a ha
  rcases List.mem_append.mp ha with ha|ha
  · obtain ⟨b,_,rfl⟩ := List.mem_map.mp ha
    omega
  · have he := List.eq_of_mem_replicate ha
    omega

theorem getD_map_succ (l : List Nat) (i : Nat) (hi : i < l.length) :
    (l.map Nat.succ).getD i 0=l.getD i 0+1 := by
  rw [List.getD_eq_getElem (l.map Nat.succ) 0 (by simpa using hi),List.getElem_map,
    List.getD_eq_getElem l 0 hi]

theorem getD_eraseIdx (l : List Nat) (j i : Nat) (hj : j < l.length) (hi : i < l.length-1) :
    (l.eraseIdx j).getD i 0=if i < j then l.getD i 0 else l.getD (i+1) 0 := by
  have hi' : i < (l.eraseIdx j).length := by simpa only [List.length_eraseIdx_of_lt hj] using hi
  rw [List.getD_eq_getElem (l.eraseIdx j) 0 hi',List.getElem_eraseIdx]
  split_ifs with hij
  · rw [List.getD_eq_getElem l 0 (by omega)]
  · rw [List.getD_eq_getElem l 0 (by omega)]

theorem reverse_getD_head (l : List Nat) (j i : Nat) (hj : j < l.length) (hi : i < l.length-1) :
    (reverseList l j).getD i 0=(if i < j then l.getD i 0 else l.getD (i+1) 0)+1 := by
  have hi' : i < (l.eraseIdx j).length := by simpa only [List.length_eraseIdx_of_lt hj] using hi
  rw [reverseList,List.getD_append _ _ _ _ (by simpa using hi'),getD_map_succ _ _ hi',
    getD_eraseIdx l j i hj hi]

theorem reverse_getD_tail (l : List Nat) (j i : Nat) (hj : j < l.length)
    (hi : l.length-1 ≤ i) (hib : i < (reverseList l j).length) :
    (reverseList l j).getD i 0=1 := by
  have hl : ((l.eraseIdx j).map Nat.succ).length=l.length-1 := by
    simp [List.length_eraseIdx_of_lt hj]
  rw [reverseList,List.getD_append_right _ _ _ _ (by omega),hl]
  apply List.getD_replicate
  simp only [reverseList,List.length_append,hl,List.length_replicate] at hib
  omega

theorem reverse_descending (l : List Nat) (hd : Descending l) (j : Nat) (hj : Legal l j) :
    Descending (reverseList l j) := by
  intro i k hik hk
  by_cases hkhead : k < l.length-1
  · have hihead : i < l.length-1 := by omega
    rw [reverse_getD_head l j k hj.1 hkhead,reverse_getD_head l j i hj.1 hihead]
    split_ifs with hkj hij
    · have hh := hd i k hik (by omega)
      omega
    · omega
    · have hh := hd i (k+1) (by omega) (by omega)
      omega
    · have hh := hd (i+1) (k+1) (by omega) (by omega)
      omega
  · rw [reverse_getD_tail l j k hj.1 (by omega) hk]
    by_cases hihead : i < l.length-1
    · rw [reverse_getD_head l j i hj.1 hihead]
      omega
    · rw [reverse_getD_tail l j i hj.1 (by omega) (by omega)]

theorem choices_injective (l : List Nat) (hd : Descending l) :
    Set.InjOn (fun j => l.getD j 0) (choices l) := by
  intro i hi j hj he
  have hi' := (mem_choices l i).mp hi
  have hj' := (mem_choices l j).mp hj
  have hil := hi'.1
  have hjl := hj'.1
  change l.getD i 0=l.getD j 0 at he
  rcases lt_trichotomy i j with hij|hij|hij
  · have hj0 : j ≠ 0 := by omega
    have hneq := hj'.2.2.resolve_left hj0
    have h1 := hd i (j-1) (by omega) (by omega)
    have h2 := hd (j-1) j (by omega) hj'.1
    omega
  · exact hij
  · have hi0 : i ≠ 0 := by omega
    have hneq := hi'.2.2.resolve_left hi0
    have h1 := hd j (i-1) (by omega) (by omega)
    have h2 := hd (i-1) i (by omega) hi'.1
    omega

theorem legal_size_of_choice (l : List Nat) (j : Nat) (hj : Legal l j) :
    DenominatorDynamics.LegalSize (l:Multiset Nat) (l.getD j 0) := by
  exact ⟨getD_mem l j hj.1,hj.2.1⟩

theorem choice_of_legal_size (l : List Nat) (v : Nat)
    (hv : DenominatorDynamics.LegalSize (l:Multiset Nat) v) :
    ∃ j, Legal l j ∧ l.getD j 0=v := by
  obtain ⟨j,hj,hv'⟩ := List.getElem_of_mem hv.1
  have hex : ∃ j, j < l.length ∧ l.getD j 0=v :=
    ⟨j,hj,(List.getD_eq_getElem l 0 hj).trans hv'⟩
  let i := Nat.find hex
  have hi : i < l.length ∧ l.getD i 0=v := Nat.find_spec hex
  refine ⟨i,⟨hi.1,?_,?_⟩,hi.2⟩
  · have hh := hv.2
    change l.length ≤ v+1 at hh
    simpa only [hi.2] using hh
  · by_cases hi0 : i=0
    · exact Or.inl hi0
    · right
      intro he
      have hprev : i-1 < l.length ∧ l.getD (i-1) 0=v := ⟨by omega,he.symm.trans hi.2⟩
      have hh := Nat.find_min' hex hprev
      change i ≤ i-1 at hh
      omega

def legalSizes (p : Multiset Nat) : Finset Nat :=
  p.toFinset.filter (fun v => v ∈ p ∧ p.card ≤ v+1)

@[simp] theorem mem_legalSizes (p : Multiset Nat) (v : Nat) :
    v ∈ legalSizes p ↔ DenominatorDynamics.LegalSize p v := by
  simp only [legalSizes,Finset.mem_filter,Multiset.mem_toFinset]
  exact ⟨fun h => h.2,fun h => ⟨h.1,h⟩⟩

theorem choices_image (l : List Nat) :
    (choices l).image (fun j => l.getD j 0)=legalSizes (l:Multiset Nat) := by
  ext v
  rw [Finset.mem_image,mem_legalSizes]
  constructor
  · rintro ⟨j,hj,rfl⟩
    exact legal_size_of_choice l j ((mem_choices l j).mp hj)
  · intro hv
    obtain ⟨j,hj,he⟩ := choice_of_legal_size l v hv
    exact ⟨j,(mem_choices l j).mpr hj,he⟩

def actualPathCount : Nat → Multiset Nat → Nat
  | 0,_ => 1
  | d+1,p => ∑ v ∈ legalSizes p, actualPathCount d (DenominatorDynamics.reverseMove p v)

end DenominatorFinite
