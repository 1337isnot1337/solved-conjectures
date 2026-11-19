import Conjectures.LonelinessKZBasisOperations
import Conjectures.LonelinessKZBasisStep

/-! Existence of the adjacent Gram–Schmidt ratio needed by the loneliness
product bound. The proof minimizes the sum of the integer prefix Gram
determinants among genuine integer bases with a prescribed first vector.
It does not assume an existing reduced basis. -/

namespace Loneliness.KZBasis

open scoped BigOperators

noncomputable section

variable {n : ℕ}

theorem minimal_prefix_le_adjacentStep
    (B : Module.Basis (Fin (n + 1)) ℤ (Fin (n + 1) → ℤ))
    (hmin : ∀ C : Module.Basis (Fin (n + 1)) ℤ (Fin (n + 1) → ℤ),
      C 0 = B 0 → basisPotential B ≤ basisPotential C)
    (i : ℕ) (hi0 : 1 ≤ i) (hi : i + 1 < n + 1) (c : ℤ) :
    prefixDet B (i + 1) ≤ prefixDet (adjacentStep B i hi c) (i + 1) := by
  have hfirst : adjacentStep B i hi c 0 = B 0 :=
    adjacentStep_apply_before B i hi c 0 (by change 0 < i; omega)
  have hpot := hmin (adjacentStep B i hi c) hfirst
  by_contra h
  have hstrict : prefixDet (adjacentStep B i hi c) (i + 1) < prefixDet B (i + 1) :=
    lt_of_not_ge h
  have hsum : basisPotential (adjacentStep B i hi c) < basisPotential B := by
    apply Finset.sum_lt_sum
    · intro r hr
      by_cases he : r = i + 1
      · subst r
        exact hstrict.le
      · exact (prefixDet_adjacentStep_unchanged B i hi c r
          (by have := Finset.mem_range.mp hr; omega) he).le
    · exact ⟨i + 1, Finset.mem_range.mpr (by omega), hstrict⟩
  exact (not_lt_of_ge hpot) hsum

theorem minimal_gs_le_adjacentStep
    (B : Module.Basis (Fin (n + 1)) ℤ (Fin (n + 1) → ℤ))
    (hmin : ∀ C : Module.Basis (Fin (n + 1)) ℤ (Fin (n + 1) → ℤ),
      C 0 = B 0 → basisPotential B ≤ basisPotential C)
    (i : ℕ) (hi0 : 1 ≤ i) (hi : i + 1 < n + 1) (c : ℤ) :
    ‖InnerProductSpace.gramSchmidt ℝ (realFamily B) i‖ ^ 2 ≤
      ‖InnerProductSpace.gramSchmidt ℝ (realFamily (adjacentStep B i hi c)) i‖ ^ 2 := by
  have hdet : (prefixDet B (i + 1) : ℝ) ≤
      (prefixDet (adjacentStep B i hi c) (i + 1) : ℝ) := by
    exact_mod_cast minimal_prefix_le_adjacentStep B hmin i hi0 hi c
  rw [prefixDet_eq_gs_product, prefixDet_eq_gs_product,
    Finset.prod_range_succ, Finset.prod_range_succ] at hdet
  have hprefix :
      (∏ j ∈ Finset.range i,
        ‖InnerProductSpace.gramSchmidt ℝ (realFamily (adjacentStep B i hi c)) j‖ ^ 2) =
      ∏ j ∈ Finset.range i,
        ‖InnerProductSpace.gramSchmidt ℝ (realFamily B) j‖ ^ 2 := by
    rw [← prefixDet_eq_gs_product, ← prefixDet_eq_gs_product,
      prefixDet_adjacentStep_short B i hi c i le_rfl]
  rw [hprefix] at hdet
  have hpositive : 0 < ∏ j ∈ Finset.range i,
      ‖InnerProductSpace.gramSchmidt ℝ (realFamily B) j‖ ^ 2 := by
    apply Finset.prod_pos
    intro j hj
    exact gs_sq_positive B j (by have := Finset.mem_range.mp hj; omega)
  exact (mul_le_mul_iff_right₀ hpositive).mp hdet

theorem minimal_basis_ratio
    (B : Module.Basis (Fin (n + 1)) ℤ (Fin (n + 1) → ℤ))
    (hmin : ∀ C : Module.Basis (Fin (n + 1)) ℤ (Fin (n + 1) → ℤ),
      C 0 = B 0 → basisPotential B ≤ basisPotential C)
    (i : ℕ) (hi0 : 1 ≤ i) (hi : i + 1 < n + 1) :
    3 * ‖InnerProductSpace.gramSchmidt ℝ (realFamily B) i‖ ^ 2 ≤
      4 * ‖InnerProductSpace.gramSchmidt ℝ (realFamily B) (i + 1)‖ ^ 2 := by
  let c : ℤ := -round (adjacentCoefficient (realFamily B) i)
  let C := adjacentStep B i hi c
  have hlower : ‖InnerProductSpace.gramSchmidt ℝ (realFamily B) i‖ ^ 2 ≤
      ‖InnerProductSpace.gramSchmidt ℝ (realFamily C) i‖ ^ 2 :=
    minimal_gs_le_adjacentStep B hmin i hi0 hi c
  have hbefore : ∀ j < i, realFamily C j = realFamily B j := by
    intro j hj
    exact realFamily_adjacentStep_other B i hi c j (by omega) (by omega)
  have hcurrent : realFamily C i = realFamily B (i + 1) -
      (round (adjacentCoefficient (realFamily B) i) : ℝ) • realFamily B i := by
    simpa only [C, c, Int.cast_neg, neg_smul, sub_eq_add_neg] using
      realFamily_adjacentStep_left B i hi c
  have hupper := gramSchmidt_rounded_adjacent_norm (realFamily B) (realFamily C) i
    hbefore hcurrent
  linarith

/-- There is an actual integer basis retaining the prescribed first vector
whose successive tail Gram–Schmidt squares satisfy the required `3/4` ratio. -/
theorem exists_ratio_basis
    (B₀ : Module.Basis (Fin (n + 1)) ℤ (Fin (n + 1) → ℤ)) :
    ∃ B : Module.Basis (Fin (n + 1)) ℤ (Fin (n + 1) → ℤ), B 0 = B₀ 0 ∧
      ∀ i : ℕ, 1 ≤ i → i + 1 < n + 1 →
        3 * ‖InnerProductSpace.gramSchmidt ℝ (realFamily B) i‖ ^ 2 ≤
          4 * ‖InnerProductSpace.gramSchmidt ℝ (realFamily B) (i + 1)‖ ^ 2 := by
  obtain ⟨B, hfirst, hmin⟩ := exists_minimal_basis B₀
  refine ⟨B, hfirst, ?_⟩
  intro i hi0 hi
  apply minimal_basis_ratio B ?_ i hi0 hi
  intro C hC
  exact hmin C (hC.trans hfirst)

end

end Loneliness.KZBasis
