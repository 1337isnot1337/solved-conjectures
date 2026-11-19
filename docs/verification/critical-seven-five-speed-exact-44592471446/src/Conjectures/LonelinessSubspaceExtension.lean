import Conjectures.LonelinessRationalSubspace
import Conjectures.LonelinessSubspaceDensity
import Mathlib.LinearAlgebra.FiniteDimensional.Lemmas

/-! Dimension and rationality of an integer-vector extension. Together with
coefficient rounding this gives the full subspace transfer construction,
with independent projected vectors supplied as explicit input. -/

namespace Loneliness.SubspaceDensity

noncomputable section

open scoped BigOperators
open CoordinateSubspace

variable {ι κ V : Type*} [Fintype ι] [Fintype κ]
    [AddCommGroup V] [Module ℝ V]

theorem extension_finrank (E : Submodule ℝ (ι → ℝ))
    (P : (ι → ℝ) →ₗ[ℝ] V) (hEP : E ≤ P.ker) (w : κ → ι → ℝ)
    (hlin : LinearIndependent ℝ (P ∘ w)) :
    Module.finrank ℝ (E ⊔ Submodule.span ℝ (Set.range w) : Submodule ℝ (ι → ℝ)) =
      Module.finrank ℝ E + Fintype.card κ := by
  have hw : LinearIndependent ℝ w := LinearIndependent.of_comp P hlin
  have hdis : Disjoint E (Submodule.span ℝ (Set.range w)) :=
    ((Submodule.range_ker_disjoint hlin).mono_right hEP).symm
  have h := Submodule.finrank_sup_add_finrank_inf_eq E (Submodule.span ℝ (Set.range w))
  rw [hdis.eq_bot, finrank_bot, add_zero, finrank_span_eq_card hw] at h
  exact h

omit [Fintype ι] [Fintype κ] [AddCommGroup V] [Module ℝ V] in
theorem coordinateFree_of_le {E F : Submodule ℝ (ι → ℝ)}
    (hfree : CoordinateFree E) (hEF : E ≤ F) : CoordinateFree F := by
  intro i
  obtain ⟨x, hx, hxi⟩ := hfree i
  exact ⟨x, hEF hx, hxi⟩

theorem rational_integer_extension [Nonempty ι]
    (E : Submodule ℚ (ι → ℚ)) (hfree : CoordinateFree (realSpan E))
    (P : (ι → ℝ) →ₗ[ℝ] V) (hEP : realSpan E ≤ P.ker)
    (w : κ → ι → ℤ)
    (hlin : LinearIndependent ℝ (P ∘ (fun k => integerVector (w k))))
    (v : κ → ι → ℝ) (hv : ∀ k, v k ∈ realSpan E) :
    ∃ F : Submodule ℚ (ι → ℚ),
      realSpan F = realSpan E ⊔ Submodule.span ℝ (Set.range (fun k => integerVector (w k))) ∧
      Module.finrank ℚ F = Module.finrank ℚ E + Fintype.card κ ∧
      CoordinateFree (realSpan F) ∧
      spaceValue (realSpan F) ≤ spaceValue (realSpan E) +
        (1 / 2 : ℝ) * ∑ k, ‖integerVector (w k) - v k‖ := by
  let F := E ⊔ Submodule.span ℚ (Set.range (fun k i => (w k i : ℚ)))
  have hF : realSpan F =
      realSpan E ⊔ Submodule.span ℝ (Set.range (fun k => integerVector (w k))) := by
    rw [realSpan_sup, realSpan_span_integer]
    rfl
  refine ⟨F, hF, ?_, ?_, ?_⟩
  · rw [← finrank_realSpan F, hF, extension_finrank (realSpan E) P hEP _ hlin,
      finrank_realSpan E]
  · rw [hF]
    exact coordinateFree_of_le hfree le_sup_left
  · rw [hF]
    exact extension_value_bound_norm (realSpan E) w v hv

end

end Loneliness.SubspaceDensity
