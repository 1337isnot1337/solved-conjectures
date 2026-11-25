import Conjectures.CaioloFerroniHosterGraphs

/-! # Graph subspaces of linearized polynomials in every degree -/

set_option linter.unusedSectionVars false

namespace CaioloFerroniHoster.Ranks

variable {F K : Type*} [Field F] [Field K] [Fintype F]
variable [Finite K] [Algebra F K]

omit [Finite K] in
private theorem graphMap_sub {n : ℕ} (a b : Fin n → K) :
    graphMap (F := F) a - graphMap (F := F) b = graphMap (F := F) (a - b) := by
  unfold graphMap
  rw [← Finset.sum_sub_distrib]
  apply Finset.sum_congr rfl
  intro i _
  ext x
  simp [sub_mul]

/-- The graph plane indexed by its coefficients. -/
noncomputable def graphSpace {k : ℕ} (a : Fin k → K) : Submodule F (K × K) :=
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
theorem graphSpace_finrank {k : ℕ} (hK : Module.finrank F K = k) (a : Fin k → K) :
    Module.finrank F (graphSpace (F := F) a) = k :=
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

theorem graphSpace_inf_finrank {k : ℕ} {a b : Fin k → K} (hab : a ≠ b) (d : ℕ)
    (hd : ∀ i : Fin k, d < i.val → a i = b i) :
    Module.finrank F (graphSpace (F := F) a ⊓ graphSpace (F := F) b :
      Submodule F (K × K)) ≤ d := by
  rw [graphSpace, graphSpace, ← (graphInfEquiv _ _).finrank_eq, graphMap_sub]
  exact graphMap_ker_finrank_le (sub_ne_zero.mpr hab) fun i hi => sub_eq_zero.2 (hd i hi)

theorem graphSpace_inf_same_label {k : ℕ} {a b : Fin (k + 1) → K} (hab : a ≠ b)
    (hlabel : a (Fin.last k) = b (Fin.last k)) (hk : 1 ≤ k) :
    Module.finrank F (graphSpace (F := F) a ⊓ graphSpace (F := F) b :
      Submodule F (K × K)) ≤ k - 1 :=
  graphSpace_inf_finrank hab (k - 1) fun i hi => by
    have he : i = Fin.last k := Fin.ext (by have := i.isLt; simp only [Fin.val_last]; omega)
    simpa only [he] using hlabel

end CaioloFerroniHoster.Ranks
