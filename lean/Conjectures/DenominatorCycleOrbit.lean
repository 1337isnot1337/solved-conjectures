import Conjectures.DenominatorCycles

namespace DenominatorForest

theorem periodBit_add_repeat (word : List Nat) (k q : Nat) :
    periodBit word (q+word.length*k)=periodBit word q := by
  simp [periodBit]

theorem cycleList_legal_zero (word : List Nat) (hsmall : ∀ i, word.getD i 0 ≤ 1)
    (k q : Nat) (hL : 2 ≤ word.length*k) :
    DenominatorFinite.Legal (cycleList word k q) 0 := by
  have hlen : 0 < (cycleList word k q).length := by rw [cycleList_length]; omega
  refine ⟨hlen,?_,Or.inl rfl⟩
  rw [cycleList_getD word k q 0 hlen,cycleList_length]
  have hprev := priorBit_le word hsmall q
  omega

theorem cycleList_reverse_zero (word : List Nat) (hsmall : ∀ i, word.getD i 0 ≤ 1)
    (k q : Nat) (hp : 0 < word.length) (hk : 0 < k) (hq : q < word.length)
    (hL : 2 ≤ word.length*k) :
    DenominatorFinite.reverseList (cycleList word k q) 0=
      cycleList word k (nextPhase word q) := by
  have hlegal := cycleList_legal_zero word hsmall k q hL
  have hlen : (DenominatorFinite.reverseList (cycleList word k q) 0).length=
      (cycleList word k (nextPhase word q)).length := by
    rw [DenominatorFinite.reverse_length _ _ hlegal,cycleList_getD word k q 0 hlegal.1,
      cycleList_length,priorBit_next word q hp hq]
    simp
  apply List.ext_getElem hlen
  intro i hi hi'
  rw [← List.getD_eq_getElem _ 0 hi,← List.getD_eq_getElem _ 0 hi']
  have hprev := priorBit_le word hsmall q
  have hcur := periodBit_le word hsmall q
  have hnew : i < word.length*k-1+periodBit word q := by
    simpa only [cycleList_length,priorBit_next word q hp hq] using hi'
  by_cases hhead : i < (cycleList word k q).length-1
  · rw [DenominatorFinite.reverse_getD_head _ 0 i hlegal.1 hhead]
    simp only [Nat.not_lt_zero,↓reduceIte]
    rw [cycleList_getD word k q (i+1) (by omega),cycleList_getD word k _ i hi',periodBit_next]
    rw [cycleList_length] at hhead
    omega
  · rw [DenominatorFinite.reverse_getD_tail _ 0 i hlegal.1 (by omega) hi,
      cycleList_getD word k _ i hi',periodBit_next]
    rw [cycleList_length] at hhead
    by_cases he : i=word.length*k-1
    · have hc : periodBit word q=1 := by omega
      have hiadd : i+1=word.length*k := by omega
      rw [hiadd,periodBit_add_repeat,he,Nat.sub_self,hc]
    · have he' : i=word.length*k-2 := by omega
      have hp0 : priorBit word q=0 := by omega
      have hiadd : i+1=word.length*k-1 := by omega
      rw [hiadd,periodBit_last word k q hp hk hq,hp0]
      omega

theorem cycleList_forward_next (word : List Nat) (hsmall : ∀ i, word.getD i 0 ≤ 1)
    (k q : Nat) (hp : 0 < word.length) (hk : 0 < k) (hq : q < word.length)
    (hL : 2 ≤ word.length*k) :
    DenominatorDynamics.forward (cycleList word k (nextPhase word q):Multiset Nat)=
      (cycleList word k q:Multiset Nat) := by
  have hlegal := cycleList_legal_zero word hsmall k q hL
  have hp' : DenominatorDynamics.Positive (cycleList word k q:Multiset Nat) :=
    cycleList_positive word hsmall k q hp hk hq
  have hf := DenominatorDynamics.forward_reverse (cycleList word k q:Multiset Nat) hp'
    ((cycleList word k q).getD 0 0) (DenominatorFinite.legal_size_of_choice _ _ hlegal)
  rw [← DenominatorFinite.reverse_coe _ _ hlegal.1,
    cycleList_reverse_zero word hsmall k q hp hk hq hL] at hf
  exact hf

def cycleSet (word : List Nat) (k : Nat) : Finset (Multiset Nat) :=
  (Finset.range word.length).image (fun q => (cycleList word k q:Multiset Nat))

theorem cycleSet_positive (word : List Nat) (hsmall : ∀ i, word.getD i 0 ≤ 1)
    (k : Nat) (hp : 0 < word.length) (hk : 0 < k) :
    ∀ p ∈ cycleSet word k, DenominatorDynamics.Positive p := by
  intro p hp'
  obtain ⟨q,hq,rfl⟩ := Finset.mem_image.mp hp'
  exact cycleList_positive word hsmall k q hp hk (Finset.mem_range.mp hq)

theorem cycleSet_nonempty_parts (word : List Nat) (k : Nat) (hL : 2 ≤ word.length*k) :
    ∀ p ∈ cycleSet word k, p ≠ 0 := by
  intro p hp
  obtain ⟨q,_,rfl⟩ := Finset.mem_image.mp hp
  intro he
  have hc := congrArg Multiset.card he
  change (cycleList word k q).length=0 at hc
  rw [cycleList_length] at hc
  omega

theorem cycleSet_forward (word : List Nat) (hsmall : ∀ i, word.getD i 0 ≤ 1)
    (k : Nat) (hp : 0 < word.length) (hk : 0 < k) (hL : 2 ≤ word.length*k) :
    ∀ p ∈ cycleSet word k, DenominatorDynamics.forward p ∈ cycleSet word k := by
  intro p hp'
  obtain ⟨q,hq,rfl⟩ := Finset.mem_image.mp hp'
  have hq' := Finset.mem_range.mp hq
  have hprev : ∃ t, t < word.length ∧ nextPhase word t=q := by
    by_cases hq0 : q=0
    · refine ⟨word.length-1,by omega,?_⟩
      have he : word.length-1+1=word.length := by omega
      simp [nextPhase,he,hq0]
    · refine ⟨q-1,by omega,?_⟩
      have he : q-1+1=q := by omega
      simp [nextPhase,he,Nat.mod_eq_of_lt hq']
  obtain ⟨t,ht,he⟩ := hprev
  rw [← he,cycleList_forward_next word hsmall k t hp hk ht hL]
  exact Finset.mem_image.mpr ⟨t,Finset.mem_range.mpr ht,rfl⟩

def RotationsDistinct (word : List Nat) : Prop :=
  ∀ q r : Fin word.length,
    (∀ i : Fin word.length, periodBit word (q.val+i.val)=periodBit word (r.val+i.val)) → q=r

theorem descending_eq_of_coe (l r : List Nat) (hl : DenominatorFinite.Descending l)
    (hr : DenominatorFinite.Descending r) (he : (l:Multiset Nat)=(r:Multiset Nat)) : l=r := by
  have hpair : ∀ a : List Nat, DenominatorFinite.Descending a → a.Pairwise (· ≥ ·) := by
    intro a ha
    apply List.pairwise_iff_getElem.mpr
    intro i j hi hj hij
    have hh := ha i j (Nat.le_of_lt hij) hj
    simpa only [List.getD_eq_getElem a 0 hi,List.getD_eq_getElem a 0 hj] using hh
  exact List.Perm.eq_of_pairwise' (hpair l hl) (hpair r hr) (Multiset.coe_eq_coe.mp he)

theorem cycleList_injective (word : List Nat) (hsmall : ∀ i, word.getD i 0 ≤ 1)
    (hprim : RotationsDistinct word) (k : Nat) (hL : word.length+1 ≤ word.length*k) :
    Set.InjOn (fun q => (cycleList word k q:Multiset Nat)) (Finset.range word.length) := by
  intro q hq r hr he
  have hq' := Finset.mem_range.mp hq
  have hr' := Finset.mem_range.mp hr
  have hl := descending_eq_of_coe _ _ (cycleList_descending word hsmall k q)
    (cycleList_descending word hsmall k r) he
  have hrot : ∀ i : Fin word.length, periodBit word (q+i.val)=periodBit word (r+i.val) := by
    intro i
    have hiq : i.val < (cycleList word k q).length := by rw [cycleList_length]; omega
    have hir : i.val < (cycleList word k r).length := by rw [cycleList_length]; omega
    have hh := congrArg (fun l : List Nat => l.getD i.val 0) hl
    rw [cycleList_getD word k q i.val hiq,cycleList_getD word k r i.val hir] at hh
    omega
  exact congrArg Fin.val (hprim ⟨q,hq'⟩ ⟨r,hr'⟩ hrot)

theorem cycleSet_card (word : List Nat) (hsmall : ∀ i, word.getD i 0 ≤ 1)
    (hprim : RotationsDistinct word) (k : Nat) (hL : word.length+1 ≤ word.length*k) :
    (cycleSet word k).card=word.length := by
  rw [cycleSet,Finset.card_image_of_injOn (cycleList_injective word hsmall hprim k hL),Finset.card_range]

theorem cycleList_sum_eq (word : List Nat) (hsmall : ∀ i, word.getD i 0 ≤ 1)
    (k q : Nat) (hp : 0 < word.length) (hk : 0 < k) (hq : q < word.length)
    (hL : 2 ≤ word.length*k) :
    (cycleList word k q:Multiset Nat).sum=(cycleList word k 0:Multiset Nat).sum := by
  have aux : ∀ q, q < word.length →
      (cycleList word k q:Multiset Nat).sum=(cycleList word k 0:Multiset Nat).sum := by
    intro q
    induction q with
    | zero => intro _; rfl
    | succ q ih =>
      intro hq'
      have hn : nextPhase word q=q+1 := Nat.mod_eq_of_lt hq'
      have hf := cycleList_forward_next word hsmall k q hp hk (by omega) hL
      rw [hn] at hf
      have hm := DenominatorDynamics.forward_preserves_mass (cycleList word k (q+1):Multiset Nat)
        (cycleList_positive word hsmall k (q+1) hp hk hq')
      rw [hf] at hm
      exact hm.symm.trans (ih (by omega))
  exact aux q hq

theorem cycleSet_mass (word : List Nat) (hsmall : ∀ i, word.getD i 0 ≤ 1)
    (k : Nat) (hp : 0 < word.length) (hk : 0 < k) (hL : 2 ≤ word.length*k) :
    ∀ p ∈ cycleSet word k, p.sum=(cycleList word k 0:Multiset Nat).sum := by
  intro p hp'
  obtain ⟨q,hq,rfl⟩ := Finset.mem_image.mp hp'
  exact cycleList_sum_eq word hsmall k q hp hk (Finset.mem_range.mp hq) hL

theorem cycleList_forward_drop (word : List Nat) (hsmall : ∀ i, word.getD i 0 ≤ 1)
    (k q d : Nat) (hp : 0 < word.length) (hk : 0 < k) (hq : q < word.length)
    (hL : 2 ≤ word.length*k) (hd : d ≤ q) :
    (DenominatorDynamics.forward^[d]) (cycleList word k q:Multiset Nat)=
      (cycleList word k (q-d):Multiset Nat) := by
  induction d generalizing q with
  | zero => simp
  | succ d ih =>
    have hq0 : 0 < q := by omega
    have hn : nextPhase word (q-1)=q := by
      unfold nextPhase
      rw [Nat.sub_add_cancel hq0,Nat.mod_eq_of_lt hq]
    have hf := cycleList_forward_next word hsmall k (q-1) hp hk (by omega) hL
    rw [hn] at hf
    rw [Function.iterate_succ_apply,hf,ih (q-1) (by omega) (by omega)]
    congr 2
    omega

theorem cycleList_zero_period (word : List Nat) (hsmall : ∀ i, word.getD i 0 ≤ 1)
    (k : Nat) (hp : 0 < word.length) (hk : 0 < k) (hL : 2 ≤ word.length*k) :
    (DenominatorDynamics.forward^[word.length]) (cycleList word k 0:Multiset Nat)=
      (cycleList word k 0:Multiset Nat) := by
  have hn : nextPhase word (word.length-1)=0 := by
    unfold nextPhase
    rw [Nat.sub_add_cancel hp,Nat.mod_self]
  have hf := cycleList_forward_next word hsmall k (word.length-1) hp hk (by omega) hL
  rw [hn] at hf
  have he : word.length=(word.length-1)+1 := by omega
  rw [he,Function.iterate_succ_apply,hf]
  simpa using cycleList_forward_drop word hsmall k (word.length-1) (word.length-1) hp hk (by omega) hL le_rfl

theorem cycleList_from_zero (word : List Nat) (hsmall : ∀ i, word.getD i 0 ≤ 1)
    (k q : Nat) (hp : 0 < word.length) (hk : 0 < k) (hq : q < word.length)
    (hL : 2 ≤ word.length*k) :
    (DenominatorDynamics.forward^[word.length-q]) (cycleList word k 0:Multiset Nat)=
      (cycleList word k q:Multiset Nat) := by
  have hn : nextPhase word (word.length-1)=0 := by
    unfold nextPhase
    rw [Nat.sub_add_cancel hp,Nat.mod_self]
  have hf := cycleList_forward_next word hsmall k (word.length-1) hp hk (by omega) hL
  rw [hn] at hf
  have he : word.length-q=(word.length-1-q)+1 := by omega
  rw [he,Function.iterate_succ_apply,hf,
    cycleList_forward_drop word hsmall k (word.length-1) (word.length-1-q) hp hk (by omega) hL (by omega)]
  congr 2
  omega

theorem cycleSet_eq_forward_orbit (word : List Nat) (hsmall : ∀ i, word.getD i 0 ≤ 1)
    (k : Nat) (hp : 0 < word.length) (hk : 0 < k) (hL : 2 ≤ word.length*k) :
    cycleSet word k=(Finset.range word.length).image
      (fun d => (DenominatorDynamics.forward^[d]) (cycleList word k 0:Multiset Nat)) := by
  have hiter : ∀ d, (DenominatorDynamics.forward^[d]) (cycleList word k 0:Multiset Nat) ∈ cycleSet word k := by
    intro d
    induction d with
    | zero => exact Finset.mem_image.mpr ⟨0,Finset.mem_range.mpr hp,rfl⟩
    | succ d ih =>
      rw [Function.iterate_succ_apply']
      exact cycleSet_forward word hsmall k hp hk hL _ ih
  ext p
  constructor
  · intro hp'
    obtain ⟨q,hq,rfl⟩ := Finset.mem_image.mp hp'
    have hq' := Finset.mem_range.mp hq
    by_cases hq0 : q=0
    · subst q
      exact Finset.mem_image.mpr ⟨0,Finset.mem_range.mpr hp,rfl⟩
    · exact Finset.mem_image.mpr ⟨word.length-q,Finset.mem_range.mpr (by omega),
        cycleList_from_zero word hsmall k q hp hk hq' hL⟩
  · intro hp'
    obtain ⟨d,_,rfl⟩ := Finset.mem_image.mp hp'
    exact hiter d

end DenominatorForest
