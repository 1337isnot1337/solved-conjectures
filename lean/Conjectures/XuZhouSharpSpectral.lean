module

public import Conjectures.XuZhouThreshold

@[expose] public section
namespace XuZhou
open Matrix
open scoped Matrix BigOperators InnerProductSpace

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

theorem mem_strictlyLowSpace_of_zero_high {M : Matrix ι ι ℝ} (hM : M.IsHermitian)
    (μ : ℝ) (x : EuclideanSpace ℝ ι)
    (hx : ∀ i, μ ≤ hM.eigenvalues i → hM.eigenvectorBasis.repr x i=0) :
    x ∈ strictlyLowSpace hM μ := by
  unfold strictlyLowSpace
  let c : {i : ι // hM.eigenvalues i<μ} → ℝ := fun i => hM.eigenvectorBasis.repr x i.val
  refine ⟨c,?_⟩
  apply hM.eigenvectorBasis.repr.injective
  apply WithLp.ofLp_injective 2
  funext i
  rw [restrictedEigenExpansion_coordinates]
  by_cases hi : hM.eigenvalues i<μ
  · rw [dite_eq_left hi]
  · rw [dite_eq_right hi,hx i (le_of_not_gt hi)]

/-- A nonnegative shifted quadratic form on a subspace supplies a lower
bound on the number of eigenvalues at or above the shift, including equality. -/
theorem finrank_le_card_ge_of_quadratic_lower {M : Matrix ι ι ℝ} (hM : M.IsHermitian)
    (μ : ℝ) (W : Submodule ℝ (EuclideanSpace ℝ ι))
    (hW : ∀ (x : W), μ*‖x.val‖^2 ≤ quadraticEnergy M x.val) :
    Module.finrank ℝ W ≤ Fintype.card {i : ι // μ ≤ hM.eigenvalues i} := by
  let L : W →ₗ[ℝ] ({i : ι // μ ≤ hM.eigenvalues i}→ℝ) :=
    { toFun := fun x i => hM.eigenvectorBasis.repr x.val i.val
      map_add' := fun x y => funext fun i => by simp
      map_smul' := fun c x => funext fun i => by simp }
  have hi : Function.Injective L := LinearMap.ker_eq_bot.mp (LinearMap.ker_eq_bot'.mpr (by
    intro x hx
    by_contra hne
    have hv (i : ι) (h : μ ≤ hM.eigenvalues i) :
        hM.eigenvectorBasis.repr x.val i=0 := congrFun hx ⟨i,h⟩
    let y : strictlyLowSpace hM μ := ⟨x.val,mem_strictlyLowSpace_of_zero_high hM μ x.val hv⟩
    have hy : y≠0 := fun h => hne (Subtype.ext (congrArg (fun z : strictlyLowSpace hM μ => z.val) h))
    exact (not_lt_of_ge (hW x)) (strictlyLowSpace_energy hM μ y hy)))
  simpa using LinearMap.finrank_le_finrank_of_injective hi

end XuZhou
