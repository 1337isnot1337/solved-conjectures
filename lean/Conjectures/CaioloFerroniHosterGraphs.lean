import Mathlib.FieldTheory.Finite.GaloisField
import Mathlib.LinearAlgebra.FiniteDimensional.Lemmas
import Mathlib.Tactic

/-! The finite-field graph subspaces in the rank-five counterexample. -/

namespace CaioloFerroniHoster

open Polynomial
open scoped BigOperators

section Graphs

variable {F K : Type*} [Field F] [Field K] [Fintype F]
variable [Finite K] [Algebra F K]

/-- The polynomial for the chosen linear combination of Frobenius powers. -/
noncomputable def graphPolynomial {n : ℕ} (a : Fin n → K) : K[X] :=
  ∑ i : Fin n, C (a i) * X ^ ((Fintype.card F) ^ (i : ℕ))

/-- The linear transformation defining each graph in the construction. -/
noncomputable def graphMap {n : ℕ} (a : Fin n → K) : K →ₗ[F] K :=
  ∑ i : Fin n, a i • ((FiniteField.frobeniusAlgHom F K) ^ (i : ℕ)).toLinearMap

omit [Finite K] in
theorem graphMap_apply {n : ℕ} (a : Fin n → K) (t : K) :
    graphMap (F := F) a t = (graphPolynomial (F := F) a).eval t := by
  simp [graphMap, graphPolynomial, AlgHom.coe_pow, FiniteField.coe_frobeniusAlgHom,
    pow_iterate, Polynomial.eval_finsetSum]

omit [Finite K] [Algebra F K] in
theorem graphPolynomial_coeff {n : ℕ} (a : Fin n → K) (i : Fin n) :
    (graphPolynomial (F := F) a).coeff ((Fintype.card F) ^ (i : ℕ)) = a i := by
  classical
  simp only [graphPolynomial, finsetSum_coeff, coeff_C_mul_X_pow]
  rw [Finset.sum_eq_single i]
  · simp
  · intro j _ hji
    have hn : Fintype.card F ^ (i : ℕ) ≠ Fintype.card F ^ (j : ℕ) :=
      fun h => hji (Fin.ext (Nat.pow_right_injective Fintype.one_lt_card h).symm)
    simp [hn]
  · simp

omit [Finite K] [Algebra F K] in
theorem graphPolynomial_ne_zero {n : ℕ} {a : Fin n → K} (ha : a ≠ 0) :
    graphPolynomial (F := F) a ≠ 0 := by
  intro h
  apply ha
  funext i
  rw [← graphPolynomial_coeff (F := F) a i, h]
  rfl

omit [Finite K] [Algebra F K] in
theorem graphPolynomial_degree_le {n d : ℕ} (a : Fin n → K)
    (ha : ∀ i : Fin n, d < i.val → a i = 0) :
    (graphPolynomial (F := F) a).natDegree ≤ (Fintype.card F) ^ d := by
  refine natDegree_sum_le_of_forall_le _ _ fun i _ => ?_
  by_cases hi : i.val ≤ d
  · exact (natDegree_C_mul_X_pow_le _ _).trans (Nat.pow_le_pow_right Fintype.card_pos hi)
  · simp [ha i (Nat.lt_of_not_ge hi)]

omit [Finite K] in
private theorem graphMap_sub {n : ℕ} (a b : Fin n → K) :
    graphMap (F := F) a - graphMap (F := F) b = graphMap (F := F) (a - b) := by
  unfold graphMap
  rw [← Finset.sum_sub_distrib]
  apply Finset.sum_congr rfl
  intro i _
  ext x
  simp [sub_mul]

theorem graphMap_ker_finrank_le {n d : ℕ} {a : Fin n → K}
    (ha : a ≠ 0) (hd : ∀ i : Fin n, d < i.val → a i = 0) :
    Module.finrank F (LinearMap.ker (graphMap (F := F) a)) ≤ d := by
  have : Module.Finite F K := .of_finite
  let p := graphPolynomial (F := F) a
  have hp : p ≠ 0 := graphPolynomial_ne_zero ha
  let i : LinearMap.ker (graphMap (F := F) a) → p.rootSet K :=
    fun t => ⟨t, (mem_rootSet_of_ne hp).2 (by
      simp [p, aeval_def, ← graphMap_apply])⟩
  have hi : Function.Injective i := fun _ _ h => Subtype.ext (congrArg (fun v : p.rootSet K => (v : K)) h)
  have hcard := (Nat.card_le_card_of_injective i hi).trans (p.ncard_rootSet_le K)
  rw [Module.natCard_eq_pow_finrank (K := F), ← Fintype.card_eq_nat_card] at hcard
  exact (Nat.pow_le_pow_iff_right Fintype.one_lt_card).1
    (hcard.trans (graphPolynomial_degree_le a hd))

/-- The graph plane indexed by its four coefficients. -/
noncomputable def graphSpace (a : Fin 4 → K) : Submodule F (K × K) :=
  (graphMap (F := F) a).graph

private noncomputable def graphEquiv {V : Type*} [AddCommGroup V] [Module F V]
    (f : V →ₗ[F] V) : V ≃ₗ[F] f.graph where
  toFun x := ⟨(x, f x), rfl⟩
  invFun v := v.val.1
  left_inv _ := rfl
  right_inv v := Subtype.ext (Prod.ext rfl ((f.mem_graph_iff v.val).1 v.property).symm)
  map_add' x y := Subtype.ext (Prod.ext rfl (f.map_add x y))
  map_smul' c x := Subtype.ext (Prod.ext rfl (f.map_smul c x))

omit [Finite K] in
theorem graphSpace_finrank (hK : Module.finrank F K = 4) (a : Fin 4 → K) :
    Module.finrank F (graphSpace (F := F) a) = 4 :=
  (graphEquiv (graphMap (F := F) a)).finrank_eq.symm.trans hK

private noncomputable def graphInfEquiv (f g : K →ₗ[F] K) :
    (f - g).ker ≃ₗ[F] (f.graph ⊓ g.graph : Submodule F (K × K)) where
  toFun t := ⟨(t, f t), rfl, (sub_eq_zero.1 (LinearMap.mem_ker.1 t.property))⟩
  invFun z := ⟨z.val.1, LinearMap.mem_ker.2 <| sub_eq_zero.2 <|
    ((f.mem_graph_iff _).1 z.property.1).symm.trans ((g.mem_graph_iff _).1 z.property.2)⟩
  left_inv _ := rfl
  right_inv z := Subtype.ext (Prod.ext rfl ((f.mem_graph_iff _).1 z.property.1).symm)
  map_add' _ _ := Subtype.ext (Prod.ext rfl (f.map_add ..))
  map_smul' _ _ := Subtype.ext (Prod.ext rfl (f.map_smul ..))

theorem graphSpace_inf_finrank {a b : Fin 4 → K} (hab : a ≠ b) (d : ℕ)
    (hd : ∀ i : Fin 4, d < i.val → a i = b i) :
    Module.finrank F (graphSpace (F := F) a ⊓ graphSpace (F := F) b :
      Submodule F (K × K)) ≤ d := by
  rw [graphSpace, graphSpace, ← (graphInfEquiv _ _).finrank_eq, graphMap_sub]
  exact graphMap_ker_finrank_le (sub_ne_zero.mpr hab) fun i hi => sub_eq_zero.2 (hd i hi)

theorem graphSpace_injective (hK : Module.finrank F K = 4) :
    Function.Injective (graphSpace (F := F) (K := K)) := by
  intro a b he
  by_contra hn
  have h := graphSpace_inf_finrank (F := F) hn 3 (fun i hi => by omega)
  rw [he, inf_idem, graphSpace_finrank hK] at h
  omega

theorem graphSpace_inf_same_label {a b : Fin 4 → K} (hab : a ≠ b) (hlabel : a 3 = b 3) :
    Module.finrank F (graphSpace (F := F) a ⊓ graphSpace (F := F) b :
      Submodule F (K × K)) ≤ 2 :=
  graphSpace_inf_finrank hab 2 fun i hi => by
    have he : i = 3 := Fin.ext (by have := i.isLt; omega)
    simpa only [he] using hlabel

end Graphs
end CaioloFerroniHoster
