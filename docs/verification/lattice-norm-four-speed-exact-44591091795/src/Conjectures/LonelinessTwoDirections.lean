import Conjectures.LonelinessCoalescenceAvoiding
import Conjectures.LonelinessRationalSubspace
import Conjectures.LonelinessCoalescenceValue

/-! Two independent integer directions with repeated absolute coordinates in
any coordinate-free rational plane. The second direction is constructed in
a coordinate-coalescing hyperplane that excludes the first direction. -/

namespace Loneliness.CoordinateSubspace

noncomputable section

variable {K ι : Type*} [Field K] [Fintype ι]

theorem coordinate_coalescence_avoiding [LinearOrder K] [IsStrictOrderedRing K] [Infinite K]
    [Nonempty ι] (E : Submodule K (ι → K))
    (q : E) (hq : ∀ i, (q : ι → K) i ≠ 0)
    (hdim : 2 ≤ Module.finrank K E) :
    ∃ (a b : ι) (ε : K) (F : Submodule K (ι → K)), a ≠ b ∧
      coordinateForm E a ∉ Submodule.span K {coordinateForm E b} ∧
      (ε = 1 ∨ ε = -1) ∧ F ≤ E ∧
      Module.finrank K F + 1 = Module.finrank K E ∧ CoordinateFree F ∧
      F = E ⊓ LinearMap.ker ((LinearMap.proj a : (ι → K) →ₗ[K] K) - ε • LinearMap.proj b) ∧
      (q : ι → K) ∉ F := by
  classical
  have hfree : CoordinateFree E := fun i => ⟨q, q.property, hq i⟩
  have hrank : 2 ≤ Module.finrank K (Submodule.span K (Set.range (coordinateForm E))) := by
    rw [coordinateForm_span_top, finrank_top, Subspace.dual_finrank_eq]
    exact hdim
  obtain ⟨a, b, ε, H, hab, hnonparallel, hε, hHdim, hrel, hHfree, hHeq, hqnot⟩ :=
    Coalescence.coalescing_hyperplane_avoiding (coordinateForm E)
      (coordinateForm_ne_zero hfree) q hq hrank
  let F : Submodule K (ι → K) := H.map E.subtype
  have hFdim : Module.finrank K F = Module.finrank K H :=
    (Submodule.equivMapOfInjective E.subtype E.subtype_injective H).finrank_eq.symm
  refine ⟨a, b, ε, F, hab, hnonparallel, hε, ?_, by omega, ?_, ?_, ?_⟩
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
  · intro hqF
    obtain ⟨y, hy, heq⟩ := Submodule.mem_map.mp hqF
    have hyq : y = q := Subtype.ext heq
    exact hqnot (hyq ▸ hy)

end

end Loneliness.CoordinateSubspace
