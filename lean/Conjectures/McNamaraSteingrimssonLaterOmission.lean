module

public import Conjectures.McNamaraSteingrimssonLaterOffsets
public import Conjectures.McNamaraSteingrimssonPointedCount

@[expose] public section
namespace McNamaraSteingrimsson

theorem canonicalComponent_cast_iff {m d : ℕ} (e : m=d)
    (p : Equiv.Perm (Fin m)) (a b : ℕ) :
    CanonicalComponent (castPermutation e p) a b ↔ CanonicalComponent p a b := by
  subst d
  rfl

/-- The missing grid-aligned long component is recognizable in the
permutation itself at an interior rank. -/
theorem exceptional_aligned_slot_absent {n A K r : ℕ} {w : Fin (n+2)→ℕ}
    (hB : ∀ i,w i≤K) (p : BlockOrder w) (miss : Fin (n+1))
    (hAK : A<K) (hr : 0<r) (hrK : r<K) (hhead : w 0=A)
    (he : w miss.succ=r) (hw : ∀ j : Fin (n+1), j≠miss → w j.succ=K) :
    ¬CanonicalComponent (blockPermutation hB p) (A+miss.val*K) (A+miss.val*K+K) := by
  intro h
  obtain ⟨i,hi,hstart⟩ := canonicalComponent_width_max hB p h
  refine Fin.cases (motive := fun i => w i=K → blockOffset w i=A+miss.val*K → False)
    ?_ (fun j => ?_) i hi hstart
  · intro H _
    omega
  · intro hj hp
    rw [blockOffset_one_exception w miss j hw,hhead] at hp
    rcases lt_trichotomy j miss with hlt|rfl|hgt
    · rw [ite_eq_right (not_lt_of_ge hlt.le)] at hp
      have hK := Nat.zero_lt_of_lt hAK
      have hlt' : j.val*K<miss.val*K := Nat.mul_lt_mul_of_pos_right hlt hK
      omega
    · omega
    · rw [ite_eq_left hgt,he] at hp
      have hle : miss.val≤j.val-1 := by
        have ht : miss.val < j.val := hgt
        omega
      have hm := Nat.mul_le_mul_right K hle
      omega

theorem earlier_aligned_slot_present {n A K : ℕ} {w : Fin (n+2)→ℕ}
    (hB : ∀ i,w i≤K) (p : BlockOrder w) (miss j : Fin (n+1)) (hj : j<miss)
    (hK : 0<K) (hhead : w 0=A) (hw : ∀ k : Fin (n+1), k≠miss → w k.succ=K)
    (hp : BeginsWithMaximum (p j.succ)) :
    CanonicalComponent (blockPermutation hB p) (A+j.val*K) (A+j.val*K+K) := by
  have hEq := hw j hj.ne
  have h := canonicalComponent_full_firstMax_block hB p j.succ (hEq.symm ▸ hK) hp
  rwa [blockOffset_one_exception w miss j hw,ite_eq_right (not_lt_of_ge hj.le),hhead,hEq] at h

/-- If both exceptional slots are later than the first and both give
the same literal middle permutation, the exceptional indices coincide. -/
theorem later_omission_indices_unique {n A K r d : ℕ}
    {w v : Fin (n+2)→ℕ}
    (hB : ∀ i,w i≤K) (hC : ∀ i,v i≤K) (p : BlockOrder w) (q : BlockOrder v)
    (dW : Fintype.card (BlockPosition w)=d) (dV : Fintype.card (BlockPosition v)=d)
    (a b : Fin (n+1)) (hAK : A<K) (hr : 0<r) (hrK : r<K)
    (hW : w 0=A) (hV : v 0=A) (ha : w a.succ=r) (hb : v b.succ=r)
    (wa : ∀ j : Fin (n+1), j≠a → w j.succ=K)
    (vb : ∀ j : Fin (n+1), j≠b → v j.succ=K)
    (hp : ∀ j : Fin (n+1), j≠a → BeginsWithMaximum (p j.succ))
    (hq : ∀ j : Fin (n+1), j≠b → BeginsWithMaximum (q j.succ))
    (he : castPermutation dW (blockPermutation hB p)=castPermutation dV (blockPermutation hC q)) :
    a=b := by
  have hK := Nat.zero_lt_of_lt hAK
  rcases lt_trichotomy a b with hab|heq|hba
  · exfalso
    apply exceptional_aligned_slot_absent hB p a hAK hr hrK hW ha wa
    apply (canonicalComponent_cast_iff dW _ _ _).mp
    rw [he]
    exact (canonicalComponent_cast_iff dV _ _ _).mpr
      (earlier_aligned_slot_present hC q b a hab hK hV vb (hq a hab.ne))
  · exact heq
  · exfalso
    apply exceptional_aligned_slot_absent hC q b hAK hr hrK hV hb vb
    apply (canonicalComponent_cast_iff dV _ _ _).mp
    rw [← he]
    exact (canonicalComponent_cast_iff dW _ _ _).mpr
      (earlier_aligned_slot_present hB p a b hba hK hW wa (hp b hba.ne))

end McNamaraSteingrimsson
