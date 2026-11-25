module
public import Conjectures.WachsCompleteGraphSizeRecurrence

@[expose] public section
namespace WachsCompleteGraph
namespace WeightedCompletePartition

noncomputable local instance (r m : ℕ) : Fintype (WeightCompositions r m) :=
  Fintype.ofEquiv (Sym (Fin r) m) (Sym.equivNatSumOfFintype (Fin r) m)

/-- The literal one-vertex total is one for every number of colors. -/
theorem canonicalBlockTotal_one (r : ℕ) : canonicalBlockTotal r 1 = 1 := by
  classical
  rw [canonicalBlockTotal,dite_eq_left (by decide : 0<1)]
  have hp (P : CompletePartition 1) : P.parts = {Finset.univ} := by
    ext b
    rw [Finset.mem_singleton]
    constructor
    · intro h
      obtain ⟨x,hx⟩ := P.nonempty_of_mem_parts h
      apply Finset.eq_univ_of_forall
      intro j
      rwa [Subsingleton.elim j x]
    · intro h
      subst b
      obtain ⟨c,hc,hcr⟩ := P.exists_mem (Finset.mem_univ (0 : Fin 1))
      have h : c = Finset.univ := Finset.eq_univ_of_forall (fun j => Subsingleton.elim j (0 : Fin 1) ▸ hcr)
      subst c
      exact hc
  have hw (w : WeightCompositions r (1-1)) :
      topWithWeights (by decide : 0<1) w.val w.property = (⊥ : WeightedCompletePartition r 1) := by
    let T := topWithWeights (by decide : 0<1) w.val w.property
    have hrel : (⊥ : WeightedCompletePartition r 1) ≤ T := bot_le
    have he : (⊥ : WeightedCompletePartition r 1).partition = T.partition :=
      Finpartition.ext ((hp (⊥ : WeightedCompletePartition r 1).partition).trans (hp T.partition).symm)
    exact (equal_weights_of_refines_same_blocks hrel he).symm
  simp_rw [hw,moebius_bot]
  rw [Finset.sum_const,Finset.card_univ,nsmul_eq_mul,mul_one]
  have hc : Fintype.card (WeightCompositions r (1-1))=1 := by
    rw [← Nat.card_eq_fintype_card,weight_compositions_card]
    simp
  exact_mod_cast hc

end WeightedCompletePartition
end WachsCompleteGraph
