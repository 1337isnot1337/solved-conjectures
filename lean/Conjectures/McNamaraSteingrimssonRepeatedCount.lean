module

public import Conjectures.McNamaraSteingrimssonLaterFamilySurjective

@[expose] public section
namespace McNamaraSteingrimsson

/-- The actual intermediate permutations at a positive interior rank
are in bijection with a two-summand interval and a disjoint collection
of insertions of a proper long-block pattern. -/
noncomputable def repeatedInterval_rank_equiv {n A K r : ℕ}
    {a : Equiv.Perm (Fin A)} {p : Equiv.Perm (Fin K)} (hAK : A<K)
    (hA : 0<A) (ha : BeginsWithMaximum a) (hp : BeginsWithMaximum p)
    (hr : 0<r) (hrK : r<K) :
    (AbsoluteInterval a (directSumPermutation a p) (A+r) ⊕ LaterOmissionData n p r) ≃
    AbsoluteInterval (repeatedPattern n a p hAK.le) (repeatedPattern (n+1) a p hAK.le)
      (A+n*K+r) := by
  let F := AbsoluteInterval a (directSumPermutation a p) (A+r)
  let L := LaterOmissionData n p r
  let I := AbsoluteInterval (repeatedPattern n a p hAK.le) (repeatedPattern (n+1) a p hAK.le)
    (A+n*K+r)
  let e : (A+r)+n*K=A+n*K+r := by omega
  let u := uniformPattern n p
  let f (x : F) : I :=
    ⟨castPermutation e (directSumPermutation x.val u),
      ((repeated_first_family_iff hAK hA ha hp hr hrK _).mp ⟨x,rfl⟩).1⟩
  let g : L→I := laterOmissionMap (a := a) hAK.le hrK.le
  have hf (x : F) : ¬CanonicalComponent (f x).val A (A+K) :=
    ((repeated_first_family_iff hAK hA ha hp hr hrK _).mp ⟨x,rfl⟩).2
  have hg (x : L) : CanonicalComponent (g x).val A (A+K) :=
    laterOmissionMap_has_component hAK.le hrK.le (hA.trans hAK) hp x
  have hfinj : Function.Injective f := by
    intro x y h
    have he : castPermutation e (directSumPermutation x.val u)=
      castPermutation e (directSumPermutation y.val u) := congrArg Subtype.val h
    apply Subtype.ext
    exact ((directSum_cases_injective x.val y.val u u).mp (castPermutation_injective e he)).1
  have hginj : Function.Injective g := laterOmissionMap_injective hAK hr hrK hp
  refine Equiv.ofBijective (Sum.elim f g) ⟨?_,?_⟩
  · rintro (x|x) (y|y) h
    · exact congrArg Sum.inl (hfinj h)
    · change f x=g y at h
      exact ((hf x) (h.symm ▸ hg y)).elim
    · change g x=f y at h
      exact ((hf y) (h ▸ hg x)).elim
    · exact congrArg Sum.inr (hginj h)
  · intro b
    by_cases h : CanonicalComponent b.val A (A+K)
    · obtain ⟨y,hy⟩ := laterOmissionMap_onto_later hAK hA ha hp hr hrK b h
      exact ⟨Sum.inr y,hy⟩
    · obtain ⟨x,hx⟩ := (repeated_first_family_iff hAK hA ha hp hr hrK b.val).mpr
        ⟨b.property,h⟩
      exact ⟨Sum.inl x,Subtype.ext hx⟩

/-- Lean's exact count refers to literal permutations in the large
interval, not embeddings, words or an assumed rank polynomial. -/
theorem repeatedInterval_rank_count {n A K r : ℕ}
    {a : Equiv.Perm (Fin A)} {p : Equiv.Perm (Fin K)} (hAK : A<K)
    (hA : 0<A) (ha : BeginsWithMaximum a) (hp : BeginsWithMaximum p)
    (hr : 0<r) (hrK : r<K) :
    Nat.card (AbsoluteInterval (repeatedPattern n a p hAK.le)
        (repeatedPattern (n+1) a p hAK.le) (A+n*K+r)) =
      Nat.card (AbsoluteInterval a (directSumPermutation a p) (A+r)) +
        n*Nat.card (PatternDownsetAt p r) := by
  rw [← Nat.card_congr (repeatedInterval_rank_equiv hAK hA ha hp hr hrK),
    Nat.card_sum,LaterOmissionData,Nat.card_prod,
    ← Nat.card_congr (finSuccAboveEquiv (0 : Fin (n+1))),Nat.card_fin]

end McNamaraSteingrimsson
