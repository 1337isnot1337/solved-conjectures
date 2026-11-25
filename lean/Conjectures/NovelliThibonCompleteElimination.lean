module
public import Conjectures.NovelliThibonCompleteSubset
public import Mathlib.Tactic

@[expose] public section
namespace NovelliThibon

open Classical
variable {A R : Type*} [DecidableEq A] [CommRing R]

/-- Multiply the complete homogeneous sequence by one linear factor
for every variable except a distinguished one. The heap of alternating
subset terms collapses to the actual singleton complete sequence. -/
theorem completeOn_eliminate (x : A → R) (j : A) (S : Finset A)
    (hj : j∉S) (d : ℤ) :
    (∑ T ∈ S.powerset,(∏ i ∈ T,-x i)*completeOn (insert j S) x (d-(T.card:ℤ))) =
      completeOn ({j}:Finset A) x d := by
  induction S using Finset.induction_on with
  | empty => simp
  | insert a S ha ih =>
    have hjS : j∉S := fun h => hj (Finset.mem_insert_of_mem h)
    have hja : j≠a := fun h => hj (Finset.mem_insert.mpr (Or.inl h))
    have hna : a∉insert j S := fun h => (Finset.mem_insert.mp h).elim hja.symm ha
    have hmiss (T : Finset A) (hT : T∈S.powerset) : a∉T :=
      fun h => ha ((Finset.mem_powerset.mp hT) h)
    have hdis : Disjoint S.powerset (S.powerset.image (insert a)) := by
      rw [Finset.disjoint_left]
      intro T hT hTI
      obtain ⟨B,hB,hEq⟩ := Finset.mem_image.mp hTI
      exact hmiss T hT (hEq ▸ Finset.mem_insert_self _ _)
    have hins : Set.InjOn (insert a) (S.powerset : Set (Finset A)) := by
      intro T hT U hU he
      have hh := congrArg (fun B : Finset A => B.erase a) he
      simpa [Finset.erase_insert,hmiss T hT,hmiss U hU] using hh
    rw [Finset.powerset_insert,Finset.sum_union hdis,Finset.sum_image hins,
      ← Finset.sum_add_distrib,← ih hjS]
    apply Finset.sum_congr rfl
    intro T hT
    rw [Finset.prod_insert (hmiss T hT),Finset.card_insert_of_notMem (hmiss T hT)]
    have hh := completeOn_remove_factor (insert j S) x (d-(T.card:ℤ)) hna
    rw [Finset.insert_comm j a]
    rw [← hh]
    have he : d - ((T.card+1:ℕ):ℤ) = d - (T.card:ℤ) - 1 := by
      push_cast
      ring
    rw [he]
    ring

theorem completeOn_univ_eq_completeSum {A : Type*} [Fintype A] [DecidableEq A]
    (x : A → R) (d : ℤ) :
    completeOn (Finset.univ : Finset A) x d = if d < 0 then 0 else completeSum x d.toNat := by
  unfold completeOn
  split
  · rfl
  · let e : ↥(Finset.univ : Finset A) ≃ A := ⟨Subtype.val,
      fun a => ⟨a,Finset.mem_univ a⟩,fun _ => rfl,fun _ => rfl⟩
    exact completeSum_rename e x _

theorem completeOn_singleton_nat (x : A → R) (j : A) (d : ℕ) :
    completeOn ({j}:Finset A) x (d:ℤ) = (x j)^d := by
  have hpos : ¬(d:ℤ) < 0 := by omega
  simp only [completeOn,hpos,ite_false,Int.toNat_natCast,completeSum]
  have hm (s : Sym ↥({j}:Finset A) d) : (s.val.map (fun i => x i.val)).prod = (x j)^d := by
    have hmap : s.val.map (fun i => x i.val) = Multiset.replicate d (x j) := by
      apply Multiset.eq_replicate.mpr
      refine ⟨by simp,?_⟩
      intro b h
      obtain ⟨a,_,he⟩ := Multiset.mem_map.mp h
      exact he.symm.trans (congrArg x (Finset.mem_singleton.mp a.property))
    rw [hmap,Multiset.prod_replicate]
  have hc : Fintype.card (Sym ↥({j}:Finset A) d) = 1 := by
    rw [Sym.card_sym_eq_choose,Fintype.card_coe,Finset.card_singleton]
    simp
  simp_rw [hm]
  rw [Finset.sum_const,Finset.card_univ,hc,one_nsmul]

/-- A powerset sum reindexed by exact cardinality in a finite interval. -/
theorem sum_powersetCard_univ_fin {S : Finset A} {m : ℕ} (hm : S.card < m)
    (f : Finset A → R) :
    (∑ r : Fin m,∑ T ∈ S.powersetCard r.val,f T) = ∑ T ∈ S.powerset,f T := by
  let g (T : Finset A) : Fin m := ⟨min T.card S.card,(min_le_right _ _).trans_lt hm⟩
  have hset (r : Fin m) :
      S.powersetCard r.val = (S.powerset.filter fun T => g T=r) := by
    ext T
    rw [Finset.mem_powersetCard,Finset.mem_filter,Finset.mem_powerset]
    by_cases hs : T⊆S
    · have hv : (g T).val=T.card := min_eq_left (Finset.card_le_card hs)
      have hh : g T=r ↔ T.card=r.val :=
        ⟨fun e => hv.symm.trans (congrArg Fin.val e),fun e => Fin.ext (hv.trans e)⟩
      simp [hs,hh]
    · simp [hs]
  simp_rw [hset]
  exact Finset.sum_fiberwise S.powerset g f

end NovelliThibon
