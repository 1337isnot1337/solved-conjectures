module
public import Conjectures.NovelliThibonSignedFundamentals
public import Conjectures.NovelliThibonGraphOmega

@[expose] public section
namespace NovelliThibon

open Classical

variable {n : ℕ}

def graphIndegree (E : Finset (Fin n × Fin n)) (j : Fin n) : ℕ :=
  (E.filter fun e => e.2=j).card

theorem marked_graphDescents_eq_head_count (E : Finset (Fin n × Fin n))
    (hE : OrientedForward E) (S : Finset (Fin n)) :
    graphDescents E (markedStandardize S) = (E.filter fun e => e.2∈S).card := by
  unfold graphDescents
  congr 1
  exact Finset.filter_congr (fun e he => markedStandardize_inversion_iff S (hE e he))

theorem marked_graphDescents_eq_indegree_sum (E : Finset (Fin n × Fin n))
    (hE : OrientedForward E) (S : Finset (Fin n)) :
    graphDescents E (markedStandardize S) = ∑ j ∈ S,graphIndegree E j := by
  rw [marked_graphDescents_eq_head_count E hE]
  exact (Finset.sum_card_fiberwise_eq_card_filter E S Prod.snd).symm

/-- Negative-first two-letter evaluation of the descent expansion.
The product is indexed by every vertex, even isolated vertices. -/
theorem signed_graph_descent_expansion {R : Type*} [CommRing R]
    (E : Finset (Fin (n+1) × Fin (n+1))) (hE : OrientedForward E) (q z : R) :
    (∑ σ : Equiv.Perm (Fin (n+1)), q^graphDescents E σ *
      signedFundamentalAt (inverseDescentSet σ) z) =
      ∏ j : Fin (n+1), (1-z*q^graphIndegree E j) := by
  simp_rw [signedFundamentalAt_as_fibre,Finset.mul_sum]
  have hh (σ : Equiv.Perm (Fin (n+1))) :
      (∑ S : Finset (Fin (n+1)) with markedStandardize S=σ, q^graphDescents E σ * (-z)^S.card) =
      ∑ S : Finset (Fin (n+1)) with markedStandardize S=σ,
        q^graphDescents E (markedStandardize S) * (-z)^S.card := by
    apply Finset.sum_congr rfl
    intro S hS
    rw [(Finset.mem_filter.mp hS).2]
  simp_rw [hh]
  rw [Finset.sum_fiberwise]
  simp_rw [marked_graphDescents_eq_indegree_sum E hE,sub_eq_add_neg,← neg_mul,
    Finset.prod_one_add,Finset.powerset_univ,Finset.prod_mul_distrib,Finset.prod_const,
    Finset.prod_pow_eq_pow_sum]
  apply Finset.sum_congr rfl
  intro S _
  ac_rfl

/-- The same source inverse-q and omega operations, now with the
explicit signed two-letter fundamental rule instead of ordinary evaluation. -/
noncomputable def signedModifiedOmegaGraphLLT {K : Type*} [Field K]
    (E : Finset (Fin (n+1) × Fin (n+1))) (q z : K) : K :=
  ∑ D : Finset (Fin n), q^E.card * graphLLTCoordinate E q⁻¹ Dᶜ * signedFundamentalAt D z

theorem signedModifiedOmegaGraphLLT_as_descents {K : Type*} [Field K]
    (E : Finset (Fin (n+1) × Fin (n+1))) (hE : OrientedForward E) (q z : K) (hq : q≠0) :
    signedModifiedOmegaGraphLLT E q z =
      ∑ σ : Equiv.Perm (Fin (n+1)),q^graphDescents E σ * signedFundamentalAt (inverseDescentSet σ) z := by
  unfold signedModifiedOmegaGraphLLT
  simp_rw [graphLLTCoordinate_complement,Finset.mul_sum,Finset.sum_mul]
  have hf (D : Finset (Fin n)) :
      (∑ σ : Equiv.Perm (Fin (n+1)) with inverseDescentSet σ=D,
          (q^E.card*(q⁻¹)^graphAscents E σ)*signedFundamentalAt D z) =
        ∑ σ : Equiv.Perm (Fin (n+1)) with inverseDescentSet σ=D,
          (q^E.card*(q⁻¹)^graphAscents E σ)*signedFundamentalAt (inverseDescentSet σ) z := by
    apply Finset.sum_congr rfl
    intro σ hs
    rw [(Finset.mem_filter.mp hs).2]
  simp_rw [hf]
  rw [Finset.sum_fiberwise]
  apply Finset.sum_congr rfl
  intro σ _
  rw [← graphAscents_add_graphDescents E hE σ,pow_add,inv_pow]
  calc
    _ = ((q^graphAscents E σ)*(q^graphAscents E σ)⁻¹) *
          (q^graphDescents E σ * signedFundamentalAt (inverseDescentSet σ) z) := by ac_rfl
    _ = _ := by rw [mul_inv_cancel₀ (pow_ne_zero _ hq),one_mul]

theorem signedModifiedOmegaGraphLLT_eq_product {K : Type*} [Field K]
    (E : Finset (Fin (n+1) × Fin (n+1))) (hE : OrientedForward E) (q z : K) (hq : q≠0) :
    signedModifiedOmegaGraphLLT E q z = ∏ j : Fin (n+1), (1-z*q^graphIndegree E j) := by
  rw [signedModifiedOmegaGraphLLT_as_descents E hE q z hq,signed_graph_descent_expansion E hE]

end NovelliThibon
