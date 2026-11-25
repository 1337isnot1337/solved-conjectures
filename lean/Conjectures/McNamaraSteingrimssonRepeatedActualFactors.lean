module

public import Conjectures.McNamaraSteingrimssonFiberProduct

@[expose] public section
namespace McNamaraSteingrimsson

set_option maxHeartbeats 1000000 in
/-- Every intermediate permutation has a literal direct-sum
factorization. All long factors but the omitted one equal the long
endpoint. If the omission is later than the first, the initial
factor equals the short endpoint. The two possible non-full factors
are genuine patterns of their respective host blocks. -/
theorem repeatedMiddle_actual_factors {n A K d : ℕ}
    {a : Equiv.Perm (Fin A)} {p : Equiv.Perm (Fin K)} (hAK : A<K)
    (hA : 0<A) (ha : BeginsWithMaximum a) (hp : BeginsWithMaximum p)
    {b : Equiv.Perm (Fin d)}
    (hs : ClassicalPattern (repeatedPattern n a p hAK.le) b)
    (ht : ClassicalPattern b (repeatedPattern (n+1) a p hAK.le)) :
    ∃ (miss : Fin (n+1)) (w : Fin (n+2)→ℕ) (q : BlockOrder w)
      (hcard : Fintype.card (BlockPosition w)=d) (hB : ∀ j,w j≤K),
      castPermutation hcard (blockPermutation hB q)=b ∧
      (∀ j, ClassicalPattern (q j) (repeatedOrders a p j)) ∧
      (∀ j : Fin (n+1), j≠miss → ∃ h : w j.succ=K, castPermutation h (q j.succ)=p) ∧
      (miss≠0 → ∃ h : w 0=A, castPermutation h (q 0)=a) := by
  obtain ⟨miss,selected,hpos,hval,hfull,hhead⟩ :=
    repeatedMiddle_covers_all_but_one hAK hA ha hp hs ht
  have hi : Function.Injective selected := by
    intro i j h
    rcases lt_trichotomy i j with hlt|he|hlt
    · have H := (hpos _ _).mp hlt
      rw [h] at H
      exact (H.elim (lt_irrefl _) (fun hk => lt_irrefl _ hk.2)).elim
    · exact he
    · have H := (hpos _ _).mp hlt
      rw [h] at H
      exact (H.elim (lt_irrefl _) (fun hk => lt_irrefl _ hk.2)).elim
  let w := fun j => Fintype.card (PositionFiber selected j)
  let q := selectedFiberPattern b selected
  have hB (j : Fin (n+2)) : w j≤K :=
    (selectedFiber_card_le selected hi j).trans (repeatedWidths_le hAK.le j)
  have hcontains (j : Fin (n+2)) : ClassicalPattern (q j) (repeatedOrders a p j) :=
    selectedFiberPattern_contains selected hpos hval j
  have hcard := fiber_block_card selected
  refine ⟨miss,w,q,hcard,hB,?_,hcontains,?_,?_⟩
  · have he := middle_eq_fiber_blockPermutation selected hpos hval
    let hD : ∀ j,w j≤d := fun _ => (Fintype.card_subtype_le _).trans_eq (Fintype.card_fin d)
    have hc : ClassicalPattern (blockPermutation hB q) (blockPermutation hD q) :=
      (blockPermutation_pattern_iff hB hD q q).mpr
        ⟨⟨id,fun _ _ e => e,fun _ _ => Iff.rfl,fun _ _ => Iff.rfl⟩⟩
    have hEq : blockPermutation hB q=blockPermutation hD q :=
      (classicalPattern_same_size_iff_eq _ _).mp hc
    exact (congrArg (castPermutation hcard) hEq).trans he
  · intro j hj
    have hw : w j.succ=K := selectedFiber_card_eq_of_full selected hi j.succ (hfull j hj)
    refine ⟨hw,(classicalPattern_same_size_iff_eq _ _).mp ?_⟩
    exact (classicalPattern_cast_left hw _ _).mpr (hcontains j.succ)
  · intro hm
    have hw : w 0=A := selectedFiber_card_eq_of_full selected hi 0 (hhead hm)
    refine ⟨hw,(classicalPattern_same_size_iff_eq _ _).mp ?_⟩
    exact (classicalPattern_cast_left hw _ _).mpr (hcontains 0)

end McNamaraSteingrimsson
