module

public import Conjectures.McNamaraSteingrimssonLaterFamilyInjective

@[expose] public section
namespace McNamaraSteingrimsson

theorem widths_eq_replaced {n A K r : ℕ} {w : Fin (n+2)→ℕ}
    (miss : Fin (n+1)) (h0 : w 0=A) (he : w miss.succ=r)
    (hp : ∀ j : Fin (n+1), j≠miss → w j.succ=K) :
    w=replacedWidths miss A K r := by
  funext i
  refine Fin.cases (motive := fun i => w i=replacedWidths miss A K r i) h0 (fun j => ?_) i
  by_cases h : j=miss
  · subst j
    exact he.trans (replacedWidths_absent miss).symm
  · exact (hp j h).trans (replacedWidths_present miss j h).symm

theorem laterOmissionMap_from_factors {n A K r : ℕ}
    {a : Equiv.Perm (Fin A)} {p : Equiv.Perm (Fin K)}
    (hAK : A≤K) (hrK : r≤K) (miss : Fin (n+1)) (hm : miss≠0)
    {w : Fin (n+2)→ℕ} (q : BlockOrder w)
    (e : Fintype.card (BlockPosition w)=A+n*K+r) (hW : ∀ i,w i≤K)
    (h0 : w 0=A) (hMiss : w miss.succ=r) (hP : ∀ j : Fin (n+1), j≠miss → w j.succ=K)
    (qa : castPermutation h0 (q 0)=a)
    (qp : ∀ (j : Fin (n+1)) (hj : j≠miss), castPermutation (hP j hj) (q j.succ)=p)
    (hx : ClassicalPattern (q miss.succ) p) :
    ∃ y : LaterOmissionData n p r,
      (laterOmissionMap (a := a) hAK hrK y).val=castPermutation e (blockPermutation hW q) := by
  have hw := widths_eq_replaced miss h0 hMiss hP
  subst w
  let x := castPermutation hMiss (q miss.succ)
  have hx' : ClassicalPattern x p := (classicalPattern_cast_left hMiss _ _).mpr hx
  let y : LaterOmissionData n p r := (⟨miss,hm⟩,⟨x,hx'⟩)
  refine ⟨y,?_⟩
  have hq : replacedOrder miss a p x=q := by
    funext i
    refine Fin.cases (motive := fun i => replacedOrder miss a p x i=q i) ?_ (fun j => ?_) i
    · exact qa.symm
    · by_cases hj : j=miss
      · subst j
        apply castPermutation_injective hMiss
        exact replacedOrder_absent miss a p x
      · apply castPermutation_injective (hP j hj)
        exact (replacedOrder_present miss j hj a p x).trans (qp j hj).symm
  change castPermutation e (blockPermutation (replacedWidths_le miss hAK hrK)
    (replacedOrder miss a p x))=castPermutation e (blockPermutation hW q)
  rw [hq,blockPermutation_bound_independent _ hW q]

/-- Every later-omission middle permutation is obtained by inserting
one actual proper subpattern at its unique exceptional slot. -/
theorem laterOmissionMap_onto_later {n A K r : ℕ}
    {a : Equiv.Perm (Fin A)} {p : Equiv.Perm (Fin K)} (hAK : A<K)
    (hA : 0<A) (ha : BeginsWithMaximum a) (hp : BeginsWithMaximum p)
    (hr : 0<r) (hrK : r<K)
    (b : AbsoluteInterval (repeatedPattern n a p hAK.le) (repeatedPattern (n+1) a p hAK.le)
      (A+n*K+r))
    (hcomp : CanonicalComponent b.val A (A+K)) :
    ∃ y : LaterOmissionData n p r, laterOmissionMap (a := a) hAK.le hrK.le y=b := by
  obtain ⟨miss,w,q,hcard,hB,he,hc,hfull,hhead,hm⟩ :=
    repeatedMiddle_first_vs_later hAK hA ha hp hr hrK b.property.1 b.property.2
  have hn := hm.mp hcomp
  let hP (j : Fin (n+1)) (hj : j≠miss) := (hfull j hj).choose
  let h0 := (hhead hn).choose
  have hd : w miss.succ=r := by
    have hsum := repeatedFactor_sizes miss hcard hP
    omega
  obtain ⟨y,hy⟩ := laterOmissionMap_from_factors hAK.le hrK.le miss hn q hcard hB h0 hd hP
    (hhead hn).choose_spec (fun j hj => (hfull j hj).choose_spec) (hc miss.succ)
  exact ⟨y,Subtype.ext (hy.trans he)⟩

end McNamaraSteingrimsson
