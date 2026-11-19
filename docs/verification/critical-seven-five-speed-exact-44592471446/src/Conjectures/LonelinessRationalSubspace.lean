import Conjectures.LonelinessIntegerDirection
import Mathlib.LinearAlgebra.LinearIndependent.BaseChange
import Mathlib.LinearAlgebra.Dimension.Free
import Mathlib.Algebra.Algebra.Rat

/-! Rational coordinate subspaces and their real spans. Extending scalars
preserves dimension and coordinate-freeness, so the integer direction from
coordinate coalescence has the expected bound in the real ambient space. -/

namespace Loneliness.CoordinateSubspace

noncomputable section

open scoped BigOperators

variable {ι : Type*} [Fintype ι]

def rationalVector : (ι → ℚ) →ₗ[ℚ] (ι → ℝ) where
  toFun x i := (x i : ℝ)
  map_add' x y := by ext i; simp
  map_smul' a x := by ext i; simp [Algebra.smul_def]

omit [Fintype ι] in
@[simp] theorem rationalVector_apply (v : ι → ℚ) (i : ι) :
    rationalVector v i = (v i : ℝ) := rfl

def realSpan (E : Submodule ℚ (ι → ℚ)) : Submodule ℝ (ι → ℝ) :=
  Submodule.span ℝ (rationalVector '' (E : Set (ι → ℚ)))

omit [Fintype ι] in
theorem rationalVector_mem_realSpan {E : Submodule ℚ (ι → ℚ)} {v : ι → ℚ}
    (hv : v ∈ E) : rationalVector v ∈ realSpan E :=
  Submodule.subset_span ⟨v, hv, rfl⟩

omit [Fintype ι] in
theorem realSpan_eq_span_basis {κ : Type*} [Fintype κ]
    (E : Submodule ℚ (ι → ℚ)) (b : Module.Basis κ ℚ E) :
    realSpan E = Submodule.span ℝ (Set.range (fun i : κ => rationalVector (b i : ι → ℚ))) := by
  classical
  apply le_antisymm
  · apply Submodule.span_le.mpr
    rintro _ ⟨v, hv, rfl⟩
    let u : E := ⟨v, hv⟩
    have hrepr : rationalVector v =
        ∑ i, (b.repr u i : ℝ) • rationalVector (b i : ι → ℚ) := by
      ext j
      have h := congrArg (fun x : E => (x : ι → ℚ) j) (b.sum_repr u)
      simp only [Submodule.coe_sum, Submodule.coe_smul, Finset.sum_apply,
        Pi.smul_apply, smul_eq_mul] at h
      simp only [rationalVector_apply, Finset.sum_apply, Pi.smul_apply, smul_eq_mul]
      exact_mod_cast h.symm
    rw [hrepr]
    apply Submodule.sum_mem
    intro i hi
    exact Submodule.smul_mem _ _ (Submodule.subset_span ⟨i, rfl⟩)
  · apply Submodule.span_le.mpr
    rintro _ ⟨i, rfl⟩
    exact rationalVector_mem_realSpan (b i).property

theorem finrank_realSpan (E : Submodule ℚ (ι → ℚ)) :
    Module.finrank ℝ (realSpan E) = Module.finrank ℚ E := by
  classical
  let b := Module.finBasis ℚ E
  have hQ : LinearIndependent ℚ (fun i => (b i : ι → ℚ)) :=
    b.linearIndependent.map' E.subtype (LinearMap.ker_eq_bot.mpr E.subtype_injective)
  have hR : LinearIndependent ℝ (fun i => rationalVector (b i : ι → ℚ)) := by
    have h := (linearIndependent_algebraMap_comp_iff (R := ℚ) (S := ℝ)).mpr hQ
    convert h using 1
    funext i j
    simp [rationalVector_apply]
  rw [realSpan_eq_span_basis E b, finrank_span_eq_card hR]
  exact Fintype.card_fin _

omit [Fintype ι] in
theorem coordinateFree_realSpan {E : Submodule ℚ (ι → ℚ)}
    (hfree : CoordinateFree E) : CoordinateFree (realSpan E) := by
  intro i
  obtain ⟨x, hx, hxi⟩ := hfree i
  refine ⟨rationalVector x, rationalVector_mem_realSpan hx, ?_⟩
  simpa only [rationalVector_apply, ne_eq, Rat.cast_eq_zero] using hxi

omit [Fintype ι] in
theorem coordinateFree_of_realSpan {E : Submodule ℚ (ι → ℚ)}
    (hfree : CoordinateFree (realSpan E)) : CoordinateFree E := by
  intro i
  by_contra hn
  have hzero : ∀ x ∈ E, x i = 0 := by
    intro x hx
    by_contra hxi
    exact hn ⟨x, hx, hxi⟩
  have hker : realSpan E ≤ (LinearMap.proj i : (ι → ℝ) →ₗ[ℝ] ℝ).ker := by
    apply Submodule.span_le.mpr
    rintro _ ⟨x, hx, rfl⟩
    change (x i : ℝ) = 0
    rw [hzero x hx, Rat.cast_zero]
  obtain ⟨x, hx, hxi⟩ := hfree i
  exact hxi (hker hx)

omit [Fintype ι] in
theorem coordinateFree_realSpan_iff (E : Submodule ℚ (ι → ℚ)) :
    CoordinateFree (realSpan E) ↔ CoordinateFree E :=
  ⟨coordinateFree_of_realSpan, coordinateFree_realSpan⟩

omit [Fintype ι] in
theorem realSpan_mono {E F : Submodule ℚ (ι → ℚ)} (hEF : E ≤ F) :
    realSpan E ≤ realSpan F := by
  apply Submodule.span_le.mpr
  rintro _ ⟨x, hx, rfl⟩
  exact rationalVector_mem_realSpan (hEF hx)

omit [Fintype ι] in
theorem realSpan_sup (E F : Submodule ℚ (ι → ℚ)) :
    realSpan (E ⊔ F) = realSpan E ⊔ realSpan F := by
  apply le_antisymm
  · apply Submodule.span_le.mpr
    rintro _ ⟨v, hv, rfl⟩
    obtain ⟨x, hx, y, hy, rfl⟩ := Submodule.mem_sup.mp hv
    rw [map_add]
    exact Submodule.add_mem _
      ((le_sup_left : realSpan E ≤ realSpan E ⊔ realSpan F) (rationalVector_mem_realSpan hx))
      ((le_sup_right : realSpan F ≤ realSpan E ⊔ realSpan F) (rationalVector_mem_realSpan hy))
  · exact sup_le (realSpan_mono le_sup_left) (realSpan_mono le_sup_right)

omit [Fintype ι] in
theorem realSpan_span (s : Set (ι → ℚ)) :
    realSpan (Submodule.span ℚ s) = Submodule.span ℝ (rationalVector '' s) := by
  apply le_antisymm
  · apply Submodule.span_le.mpr
    rintro _ ⟨x, hx, rfl⟩
    have hsub : Submodule.span ℚ s ≤
        ((Submodule.span ℝ (rationalVector '' s)).restrictScalars ℚ).comap rationalVector := by
      apply Submodule.span_le.mpr
      intro v hv
      exact Submodule.subset_span ⟨v, hv, rfl⟩
    exact hsub hx
  · apply Submodule.span_le.mpr
    rintro _ ⟨x, hx, rfl⟩
    exact rationalVector_mem_realSpan (Submodule.subset_span hx)

omit [Fintype ι] in
theorem realSpan_span_integer {κ : Type*} (w : κ → ι → ℤ) :
    realSpan (Submodule.span ℚ (Set.range (fun k i => (w k i : ℚ)))) =
      Submodule.span ℝ (Set.range (fun k i => (w k i : ℝ))) := by
  rw [realSpan_span, ← Set.range_comp]
  congr 2

theorem exists_integer_direction_real [Nonempty ι]
    (E : Submodule ℚ (ι → ℚ)) (hfree : CoordinateFree (realSpan E)) :
    ∃ w : ι → ℤ, (fun i => (w i : ℝ)) ∈ realSpan E ∧ (∀ i, w i ≠ 0) ∧
      Nat.card (Set.range (fun i => (w i).natAbs)) ≤
        Fintype.card ι - Module.finrank ℝ (realSpan E) + 1 := by
  obtain ⟨w, hw, hwzero, hwcard⟩ := exists_integer_direction E (coordinateFree_of_realSpan hfree)
  refine ⟨w, ?_, hwzero, ?_⟩
  · have heq : rationalVector (fun i => (w i : ℚ)) = fun i => (w i : ℝ) := by
      ext i
      simp only [rationalVector_apply, Rat.cast_intCast]
    rw [← heq]
    exact rationalVector_mem_realSpan hw
  · rwa [finrank_realSpan]

end

end Loneliness.CoordinateSubspace
