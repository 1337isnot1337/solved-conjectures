module

public import Conjectures.McNamaraSteingrimssonLaterOmission
public import Conjectures.McNamaraSteingrimssonRepeatedRankWidths

@[expose] public section
namespace McNamaraSteingrimsson

theorem beginsWithMaximum_cast_iff {m d : ℕ} (e : m=d)
    (p : Equiv.Perm (Fin m)) :
    BeginsWithMaximum (castPermutation e p) ↔ BeginsWithMaximum p := by
  subst d
  rfl

/-- Whether the omitted long slot is the first is intrinsic to the
intermediate permutation, not a choice of embeddings. -/
theorem repeatedMiddle_first_vs_later {n A K r : ℕ}
    {a : Equiv.Perm (Fin A)} {p : Equiv.Perm (Fin K)} (hAK : A<K)
    (hA : 0<A) (ha : BeginsWithMaximum a) (hp : BeginsWithMaximum p)
    (hr : 0<r) (hrK : r<K)
    {b : Equiv.Perm (Fin (A+n*K+r))}
    (hs : ClassicalPattern (repeatedPattern n a p hAK.le) b)
    (ht : ClassicalPattern b (repeatedPattern (n+1) a p hAK.le)) :
    ∃ (miss : Fin (n+1)) (w : Fin (n+2)→ℕ) (q : BlockOrder w)
      (hcard : Fintype.card (BlockPosition w)=A+n*K+r) (hB : ∀ j,w j≤K),
      castPermutation hcard (blockPermutation hB q)=b ∧
      (∀ j, ClassicalPattern (q j) (repeatedOrders a p j)) ∧
      (∀ j : Fin (n+1), j≠miss → ∃ h : w j.succ=K, castPermutation h (q j.succ)=p) ∧
      (miss≠0 → ∃ h : w 0=A, castPermutation h (q 0)=a) ∧
      (CanonicalComponent b A (A+K) ↔ miss≠0) := by
  obtain ⟨miss,w,q,hcard,hB,he,hc,hfull,hhead⟩ :=
    repeatedMiddle_actual_factors hAK hA ha hp hs ht
  refine ⟨miss,w,q,hcard,hB,he,hc,hfull,hhead,?_⟩
  have hu (j : Fin (n+1)) (hj : j≠miss) : w j.succ=K :=
    (hfull j hj).choose
  have hv (hj : miss≠0) : w 0=A := (hhead hj).choose
  have hmax (j : Fin (n+1)) (hj : j≠miss) : BeginsWithMaximum (q j.succ) := by
    obtain ⟨hw,hh⟩ := hfull j hj
    apply (beginsWithMaximum_cast_iff hw _).mp
    rwa [hh]
  rw [← he,canonicalComponent_cast_iff]
  rcases repeatedFactor_rank_cases miss hr hrK hcard hu hv with ⟨hm,hw⟩|⟨hm,h0,_,_,_⟩
  · have h₀ : w 0≤A := classicalPattern_size_le (hc 0)
    exact iff_of_false (first_omission_no_component_at_short_width hB q hAK hr hrK h₀ hw)
      (fun H => H hm)
  · exact iff_of_true (later_omission_component_at_short_width hB q (hA.trans hAK)
      h0 (hu 0 (Ne.symm hm)) (hmax 0 (Ne.symm hm))) hm

end McNamaraSteingrimsson
