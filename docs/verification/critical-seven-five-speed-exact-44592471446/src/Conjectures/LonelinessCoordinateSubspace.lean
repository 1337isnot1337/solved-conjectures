import Conjectures.LonelinessCoalescence
import Mathlib.LinearAlgebra.Pi
import Mathlib.Algebra.Module.Submodule.Map

/-! Coordinate coalescence inside an ambient finite coordinate space.
The result applies over both the rationals and the reals, and identifies the
smaller space by an explicit equation with coefficients `1` and `±1`. -/

namespace Loneliness.CoordinateSubspace

variable {K ι : Type*} [Field K] [Fintype ι]

def CoordinateFree (E : Submodule K (ι → K)) : Prop :=
  ∀ i, ∃ x ∈ E, x i ≠ 0

def coordinateForm (E : Submodule K (ι → K)) (i : ι) : Module.Dual K E :=
  (LinearMap.proj i).comp E.subtype

omit [Fintype ι] in
@[simp] theorem coordinateForm_apply (E : Submodule K (ι → K)) (i : ι) (x : E) :
    coordinateForm E i x = (x : ι → K) i := rfl

omit [Fintype ι] in
theorem coordinateForm_ne_zero {E : Submodule K (ι → K)}
    (hfree : CoordinateFree E) (i : ι) : coordinateForm E i ≠ 0 := by
  obtain ⟨x, hx, hxi⟩ := hfree i
  intro hz
  have h := congrArg (fun f : Module.Dual K E => f ⟨x, hx⟩) hz
  exact hxi h

theorem coordinateForm_span_top (E : Submodule K (ι → K)) :
    Submodule.span K (Set.range (coordinateForm E)) = ⊤ := by
  apply top_le_iff.mp
  intro f hf
  apply mem_span_of_iInf_ker_le_ker
  intro x hx
  have hxzero : x = 0 := by
    apply Subtype.ext
    funext i
    have hi := (Submodule.mem_iInf _).mp hx i
    exact hi
  rw [hxzero]
  exact (f.map_zero)

theorem coordinate_coalescence [LinearOrder K] [IsStrictOrderedRing K] [Infinite K]
    [Nonempty ι] (E : Submodule K (ι → K))
    (hfree : CoordinateFree E) (hdim : 2 ≤ Module.finrank K E) :
    ∃ (a b : ι) (ε : K) (F : Submodule K (ι → K)), a ≠ b ∧
      coordinateForm E a ∉ Submodule.span K {coordinateForm E b} ∧
      (ε = 1 ∨ ε = -1) ∧ F ≤ E ∧
      Module.finrank K F + 1 = Module.finrank K E ∧ CoordinateFree F ∧
      F = E ⊓ LinearMap.ker ((LinearMap.proj a : (ι → K) →ₗ[K] K) - ε • LinearMap.proj b) := by
  classical
  have hrank : 2 ≤ Module.finrank K (Submodule.span K (Set.range (coordinateForm E))) := by
    rw [coordinateForm_span_top, finrank_top, Subspace.dual_finrank_eq]
    exact hdim
  obtain ⟨a, b, ε, H, hab, hnonparallel, hε, hHdim, hrel, hHfree, hHeq⟩ :=
    Coalescence.coalescing_hyperplane (coordinateForm E) (coordinateForm_ne_zero hfree) hrank
  let F : Submodule K (ι → K) := H.map E.subtype
  have hFdim : Module.finrank K F = Module.finrank K H :=
    (Submodule.equivMapOfInjective E.subtype E.subtype_injective H).finrank_eq.symm
  refine ⟨a, b, ε, F, hab, hnonparallel, hε, ?_, by omega, ?_, ?_⟩
  · intro x hx
    obtain ⟨y, hy, rfl⟩ := Submodule.mem_map.mp hx
    exact y.property
  · intro i
    obtain ⟨y, hy, hiy⟩ := hHfree i
    exact ⟨y, Submodule.mem_map.mpr ⟨y, hy, rfl⟩, hiy⟩
  · ext x
    constructor
    · intro hx
      obtain ⟨y, hy, rfl⟩ := Submodule.mem_map.mp hx
      refine ⟨y.property, ?_⟩
      change (y : ι → K) a - ε * (y : ι → K) b = 0
      exact sub_eq_zero.mpr (hrel y hy)
    · rintro ⟨hxE, hxrel⟩
      refine Submodule.mem_map.mpr ⟨⟨x, hxE⟩, ?_, rfl⟩
      rw [hHeq]
      exact hxrel

end Loneliness.CoordinateSubspace
