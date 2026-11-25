module
public import Conjectures.NovelliThibonGraphOmega
public import Conjectures.NovelliThibonSourceNormalization
public import Mathlib.Algebra.BigOperators.Group.Finset.Sigma

@[expose] public section
namespace NovelliThibon

open Classical

variable {n : ℕ} {A K : Type*} [LinearOrder A] [Fintype A] [Field K]

abbrev LabelEdge (n : ℕ) := Fin n × Fin n

def edgeDescent {r : ℕ} (σ : Equiv.Perm (Fin r)) (e : LabelEdge r) : Bool :=
  decide (σ e.2 < σ e.1)

theorem graphDescents_as_sum {r : ℕ} (E : Finset (LabelEdge r)) (σ : Equiv.Perm (Fin r)) :
    graphDescents E σ = ∑ e ∈ E, if edgeDescent σ e then (1:ℕ) else 0 := by
  unfold graphDescents
  simp only [edgeDescent,decide_eq_true_eq]
  rw [← Finset.sum_filter]
  simp

theorem graphDescents_union {r : ℕ} (E S : Finset (LabelEdge r)) (h : Disjoint E S)
    (σ : Equiv.Perm (Fin r)) :
    graphDescents (E ∪ S) σ = graphDescents E σ + graphDescents S σ := by
  simp only [graphDescents_as_sum]
  exact Finset.sum_union h

theorem graphDescents_as_product {r : ℕ} (S : Finset (LabelEdge r)) (q : K)
    (σ : Equiv.Perm (Fin r)) :
    q^graphDescents S σ = ∏ e ∈ S,if edgeDescent σ e then q else 1 := by
  rw [graphDescents_as_sum,← Finset.prod_pow_eq_pow_sum]
  apply Finset.prod_congr rfl
  intro e he
  cases edgeDescent σ e <;> simp

/-- The scalar attached to one intermediate graph in Definition 5.3. -/
noncomputable def intermediateGraphScalar {r : ℕ} (U S : Finset (LabelEdge r)) (q : K)
    (t : LabelEdge r → K) (armValue : LabelEdge r → ℕ) : K :=
  (∏ e ∈ S,(t e-q^(armValue e))) * (∏ e ∈ U\S,excludeVertical q (t e) (armValue e))

/-- The commutative intermediate-graph expression in Definition 5.3.
The optional-edge count and arm sum are taken directly on the graph. -/
noncomputable def sourceModifiedGraphSum (x : A → K)
    (E U : Finset (LabelEdge (n+1))) (q : K)
    (t : LabelEdge (n+1) → K) (armValue : LabelEdge (n+1) → ℕ) : K :=
  (∑ S ∈ U.powerset,
    intermediateGraphScalar U S q t armValue * modifiedOmegaGraphLLT x (E ∪ S) q) /
      (q-1)^U.card / q^(∑ e ∈ U,armValue e)

theorem intermediateGraphScalar_mul_descents {r : ℕ} (U S : Finset (LabelEdge r))
    (q : K) (t : LabelEdge r → K) (armValue : LabelEdge r → ℕ) (σ : Equiv.Perm (Fin r)) :
    intermediateGraphScalar U S q t armValue * q^graphDescents S σ =
      (∏ e ∈ S,includeVertical q (t e) (armValue e) (edgeDescent σ e)) *
        (∏ e ∈ U\S,excludeVertical q (t e) (armValue e)) := by
  rw [intermediateGraphScalar,graphDescents_as_product]
  unfold includeVertical
  rw [Finset.prod_mul_distrib]
  ac_rfl

theorem sourceGraph_inner_sum (x : A → K) (E U : Finset (LabelEdge (n+1)))
    (hE : OrientedForward E) (hU : OrientedForward U) (h : Disjoint E U)
    (q : K) (hq : q≠0) (t : LabelEdge (n+1) → K) (armValue : LabelEdge (n+1) → ℕ) :
    (∑ S ∈ U.powerset,
      intermediateGraphScalar U S q t armValue * modifiedOmegaGraphLLT x (E∪S) q) =
      ∑ σ : Equiv.Perm (Fin (n+1)),
        (q^graphDescents E σ*intermediateContribution U q t armValue (edgeDescent σ)) *
          fundamentalEvaluation σ x := by
  have hh (S : Finset (LabelEdge (n+1))) (hS : S ∈ U.powerset) :
      modifiedOmegaGraphLLT x (E∪S) q =
        ∑ σ : Equiv.Perm (Fin (n+1)),
          (q^graphDescents E σ * q^graphDescents S σ) * fundamentalEvaluation σ x := by
    have hsu := Finset.mem_powerset.mp hS
    have ho : OrientedForward (E∪S) := by
      intro e he
      obtain he|he := Finset.mem_union.mp he
      · exact hE _ he
      · exact hU _ (hsu he)
    rw [modifiedOmegaGraphLLT_eq_descent_expansion x (E∪S) ho q hq]
    simp_rw [graphDescents_union E S (h.mono_right hsu),pow_add]
  have he :
      (∑ S ∈ U.powerset,intermediateGraphScalar U S q t armValue * modifiedOmegaGraphLLT x (E∪S) q) =
      ∑ S ∈ U.powerset, ∑ σ : Equiv.Perm (Fin (n+1)),
        (q^graphDescents E σ * (intermediateGraphScalar U S q t armValue * q^graphDescents S σ)) *
          fundamentalEvaluation σ x := by
    apply Finset.sum_congr rfl
    intro S hS
    rw [hh S hS,Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro σ _
    ac_rfl
  rw [he,Finset.sum_comm (s:=U.powerset)]
  apply Finset.sum_congr rfl
  intro σ _
  unfold intermediateContribution
  rw [Finset.mul_sum,Finset.sum_mul]
  simp_rw [intermediateGraphScalar_mul_descents]
  apply Finset.sum_congr rfl
  intro S _
  congr 1
  congr 1
  congr 1
  congr 1
  ext e
  simp only [Finset.mem_sdiff]

/-- Definition 5.3 has exactly the normalized signed-power expansion
of the written proof, independently of the number of optional edges. -/
theorem sourceModifiedGraphSum_normalized (x : A → K) (E U : Finset (LabelEdge (n+1)))
    (hE : OrientedForward E) (hU : OrientedForward U) (h : Disjoint E U)
    (q : K) (hq : q≠0) (hq1 : q≠1) (t : LabelEdge (n+1) → K) (armValue : LabelEdge (n+1) → ℕ) :
    sourceModifiedGraphSum x E U q t armValue =
      ∑ σ : Equiv.Perm (Fin (n+1)),
        (q^((graphDescents E σ:ℤ)-((∑ e ∈ U,if edgeDescent σ e then armValue e else 0:ℕ):ℤ)) *
          (∏ e ∈ U,if edgeDescent σ e then t e else 1)) * fundamentalEvaluation σ x := by
  rw [sourceModifiedGraphSum,sourceGraph_inner_sum x E U hE hU h q hq]
  simp_rw [div_eq_mul_inv,Finset.sum_mul]
  apply Finset.sum_congr rfl
  intro σ _
  have h0 := source_optional_contribution U q hq hq1 t armValue (edgeDescent σ)
    (graphDescents E σ)
  rw [← h0]
  simp only [div_eq_mul_inv]
  ring

end NovelliThibon
