module

public import Conjectures.McNamaraSteingrimssonFirstFamilyClass

@[expose] public section
namespace McNamaraSteingrimsson

theorem repeatedPattern_one_head {n A K : ℕ} (a : Equiv.Perm (Fin A))
    (p : Equiv.Perm (Fin K)) (hAK : A≤K) :
    castPermutation (cardinal_repeatedBlocks n A K) (repeatedPattern n a p hAK) =
      directSumPermutation a (uniformPattern n p) := by
  let w := repeatedWidths n A K
  let q := repeatedOrders (n := n) a p
  let hB := repeatedWidths_le (n := n) hAK
  let e := head_tail_block_card w
  let ex := congrArg (A+·) (uniformBlock_card n K)
  change castPermutation (e.trans ex) (blockPermutation hB q) = _
  rw [← castPermutation_trans e ex,blockPermutation_uncons hB q]
  change castPermutation (congrArg (A+·) (uniformBlock_card n K))
    (directSumPermutation a (uniformBlockPermutation n p)) = _
  rw [castPermutation_directSum_right (uniformBlock_card n K)]
  rfl

theorem repeatedPattern_two_heads {n A K : ℕ} (a : Equiv.Perm (Fin A))
    (p : Equiv.Perm (Fin K)) (hAK : A≤K) :
    castPermutation ((firstTwo_tail_card (repeatedWidths (n+1) A K)).trans
      (congrArg (A+K+·) (uniformBlock_card n K))) (repeatedPattern (n+1) a p hAK) =
      directSumPermutation (directSumPermutation a p) (uniformPattern n p) := by
  let w := repeatedWidths (n+1) A K
  let q := repeatedOrders (n := n+1) a p
  let hB := repeatedWidths_le (n := n+1) hAK
  let e := firstTwo_tail_card w
  let ex := congrArg (A+K+·) (uniformBlock_card n K)
  change castPermutation (e.trans ex) (blockPermutation hB q) = _
  rw [← castPermutation_trans e ex,blockPermutation_two_uncons hB q]
  change castPermutation (congrArg (A+K+·) (uniformBlock_card n K))
    (directSumPermutation (directSumPermutation a p) (uniformBlockPermutation n p)) = _
  rw [castPermutation_directSum_right (uniformBlock_card n K)]
  rfl

theorem canonicalCut_cast_iff {m d : ℕ} (e : m=d)
    (p : Equiv.Perm (Fin m)) (k : ℕ) :
    CanonicalCut (castPermutation e p) k ↔ CanonicalCut p k := by
  subst d
  rfl

theorem canonicalCut_directSum {m n : ℕ} (p : Equiv.Perm (Fin m)) (q : Equiv.Perm (Fin n)) :
    CanonicalCut (directSumPermutation p q) m := by
  apply (canonicalCut_directSum_left p q le_rfl).mpr
  exact ⟨le_rfl,fun i _ => (p i).isLt⟩

/-- The first-exception case is exactly the smaller two-summand
interval with a fixed final product attached. -/
theorem repeated_first_family_iff {n A K r : ℕ}
    {a : Equiv.Perm (Fin A)} {p : Equiv.Perm (Fin K)} (hAK : A<K)
    (hA : 0<A) (ha : BeginsWithMaximum a) (hp : BeginsWithMaximum p)
    (hr : 0<r) (hrK : r<K) (b : Equiv.Perm (Fin (A+n*K+r))) :
    FirstOmissionFamily a p b ↔
    (ClassicalPattern (repeatedPattern n a p hAK.le) b ∧
      ClassicalPattern b (repeatedPattern (n+1) a p hAK.le)) ∧
    ¬CanonicalComponent b A (A+K) := by
  constructor
  · rintro ⟨pref,he⟩
    rw [← he]
    let U := uniformPattern n p
    let e : (A+r)+n*K=A+n*K+r := by omega
    let q := directSumPermutation pref.val U
    have hU : ClassicalPattern U U := (classicalPattern_same_size_iff_eq _ _).mpr rfl
    have hLo := classicalPattern_directSum pref.property.1 hU
    have hHi := classicalPattern_directSum pref.property.2 hU
    have hLo' := (classicalPattern_cast_right e _ _).mpr hLo
    have hHi' := (classicalPattern_cast_left e _ _).mpr hHi
    refine ⟨⟨?_,?_⟩,?_⟩
    · rw [← repeatedPattern_one_head a p hAK.le] at hLo'
      exact (classicalPattern_cast_left _ _ _).mp hLo'
    · rw [← repeatedPattern_two_heads a p hAK.le] at hHi'
      exact (classicalPattern_cast_right _ _ _).mp hHi'
    · intro hc
      have hcut : CanonicalCut (castPermutation e q) (A+r) :=
        (canonicalCut_cast_iff e q (A+r)).mpr (canonicalCut_directSum pref.val U)
      exact hc.2.2.2 (A+r) (by omega) (by omega) hcut
  · rintro ⟨⟨hs,ht⟩,hm⟩
    exact first_omission_of_repeated_middle hAK hA ha hp hr hrK hs ht hm

end McNamaraSteingrimsson
