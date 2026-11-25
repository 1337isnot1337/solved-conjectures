module

public import Conjectures.McNamaraSteingrimssonPrefixProduct
public import Conjectures.McNamaraSteingrimssonIntrinsicOmission
public import Conjectures.McNamaraSteingrimssonShortFactor

@[expose] public section
namespace McNamaraSteingrimsson

noncomputable def uniformPattern (n : ℕ) {K : ℕ} (p : Equiv.Perm (Fin K)) :
    Equiv.Perm (Fin (n*K)) :=
  castPermutation (uniformBlock_card n K) (uniformBlockPermutation n p)

theorem castPermutation_directSum_both {m n m' n' : ℕ} (hm : m=m') (hn : n=n')
    (p : Equiv.Perm (Fin m)) (q : Equiv.Perm (Fin n)) :
    castPermutation (congrArg₂ (·+·) hm hn) (directSumPermutation p q) =
      directSumPermutation (castPermutation hm p) (castPermutation hn q) := by
  subst m' n'
  rfl

/-- The first family uses a literal two-summand prefix; deleting the
remaining fixed long suffix recovers exactly that prefix. -/
def FirstOmissionFamily {A K n r : ℕ} (a : Equiv.Perm (Fin A)) (p : Equiv.Perm (Fin K))
    (b : Equiv.Perm (Fin (A+n*K+r))) : Prop :=
  ∃ pref : AbsoluteInterval a (directSumPermutation a p) (A+r),
    castPermutation (by omega : (A+r)+n*K=A+n*K+r)
      (directSumPermutation pref.val (uniformPattern n p))=b

theorem first_omission_of_repeated_middle {n A K r : ℕ}
    {a : Equiv.Perm (Fin A)} {p : Equiv.Perm (Fin K)} (hAK : A<K)
    (hA : 0<A) (ha : BeginsWithMaximum a) (hp : BeginsWithMaximum p)
    (hr : 0<r) (hrK : r<K)
    {b : Equiv.Perm (Fin (A+n*K+r))}
    (hs : ClassicalPattern (repeatedPattern n a p hAK.le) b)
    (ht : ClassicalPattern b (repeatedPattern (n+1) a p hAK.le))
    (hmiss : ¬CanonicalComponent b A (A+K)) : FirstOmissionFamily a p b := by
  obtain ⟨miss,w,q,hcard,hB,he,hc,hfull,hhead,hm⟩ :=
    repeatedMiddle_first_vs_later hAK hA ha hp hr hrK hs ht
  have hz : miss=0 := by
    by_contra! hz
    exact hmiss (hm.mpr hz)
  subst miss
  let first : Fin (n+2) := (0 : Fin (n+1)).succ
  have hb (j : Fin (n+1)) (hj : j≠0) : w j.succ=K := (hfull j hj).choose
  have hfirst : w 0+w first=A+r := by
    have hh := repeatedFactor_rank_cases (0 : Fin (n+1)) hr hrK hcard hb
      (fun hn => (hn rfl).elim)
    exact (hh.resolve_right fun h => h.1 rfl).2
  have hs' : ClassicalPattern (repeatedPattern n a p hAK.le) (blockPermutation hB q) := by
    rw [← he] at hs
    exact (classicalPattern_cast_right hcard _ _).mp hs
  have hl : ClassicalPattern a (directSumPermutation (q 0) (q first)) := by
    rcases repeatedSource_short_in_initial_two hAK hA ha hp hB hB q hs' with h|h
    · exact occurrence_in_left h
    · exact occurrence_in_right h
  have hh : ClassicalPattern (directSumPermutation (q 0) (q first)) (directSumPermutation a p) :=
    classicalPattern_directSum (hc 0) (hc first)
  let pref := castPermutation hfirst (directSumPermutation (q 0) (q first))
  let tail : Fin n→ℕ := afterTwo w
  let tailOrders : BlockOrder tail := fun i => q i.succ.succ
  let hTail (i : Fin n) : tail i=K := hb i.succ (Fin.succ_ne_zero i)
  have hTailOrders (i : Fin n) : castPermutation (hTail i) (tailOrders i)=p :=
    (hfull i.succ (Fin.succ_ne_zero i)).choose_spec
  let et := congrArg (fun v : Fin n→ℕ => Fintype.card (BlockPosition v)) (funext hTail)
  let eK := uniformBlock_card n K
  let eBoth := congrArg₂ (·+·) hfirst (et.trans eK)
  let eA : (A+r)+n*K=A+n*K+r := by omega
  have hTailEq : castPermutation (et.trans eK)
      (blockPermutation (fun i : Fin n => hB i.succ.succ) tailOrders)=uniformPattern n p := by
    rw [← castPermutation_trans et eK,
      blockPermutation_eq_uniform (fun i : Fin n => hB i.succ.succ) tailOrders p hTail hTailOrders]
    rfl
  refine ⟨⟨pref,(classicalPattern_cast_right hfirst _ _).mpr hl,
    (classicalPattern_cast_left hfirst _ _).mpr hh⟩,?_⟩
  change castPermutation eA (directSumPermutation pref (uniformPattern n p))=b
  rw [← hTailEq,← castPermutation_directSum_both hfirst (et.trans eK)]
  rw [← blockPermutation_two_uncons hB q]
  rw [castPermutation_trans,castPermutation_trans]
  exact he

end McNamaraSteingrimsson
