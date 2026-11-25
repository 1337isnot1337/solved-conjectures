import Conjectures.BraunBrueggeMinimumPolar
import Mathlib.Analysis.Convex.Hull

/-! The geometric symmetric edge polytope and the spanning property of
its actual oriented edge vectors. -/

open Finset Set

namespace BraunBruegge

variable {V : Type*} [Fintype V] [DecidableEq V]

noncomputable def edgeVector (u v : V) : V → ℝ := Pi.single u 1 - Pi.single v 1

def edgeVectors (G : SimpleGraph V) : Set (V → ℝ) :=
  {z | ∃ u v, G.Adj u v ∧ z = edgeVector u v}

def symmetricEdgePolytope (G : SimpleGraph V) : Set (V → ℝ) := convexHull ℝ (edgeVectors G)

noncomputable def pairing (f : V → ℝ) : (V → ℝ) →ₗ[ℝ] ℝ :=
  ∑ u, (f u) • LinearMap.proj u

omit [DecidableEq V] in
theorem pairing_apply (f z : V → ℝ) : pairing f z = ∑ u, f u * z u := by
  simp [pairing, LinearMap.sum_apply]

@[simp] theorem pairing_edgeVector (f : V → ℝ) (u v : V) :
    pairing f (edgeVector u v) = f u - f v := by
  simp only [edgeVector, map_sub, pairing_apply]
  simp [Pi.single_apply, mul_ite]

theorem polar_iff_polytope_pairing (G : SimpleGraph V) (root : V) (f : V → ℝ) :
    f ∈ polar G root ↔ f root = 0 ∧ ∀ z ∈ symmetricEdgePolytope G, pairing f z ≤ 1 := by
  constructor
  · rintro ⟨h0, hf⟩
    refine ⟨h0, ?_⟩
    change symmetricEdgePolytope G ⊆ (pairing f) ⁻¹' Set.Iic 1
    apply convexHull_min _ ((convex_Iic (1 : ℝ)).linear_preimage (pairing f))
    rintro z ⟨u, v, huv, rfl⟩
    change pairing f (edgeVector u v) ≤ 1
    rw [pairing_edgeVector]
    exact (abs_le.mp (hf huv)).2
  · rintro ⟨h0, hf⟩
    refine ⟨h0, ?_⟩
    intro u v huv
    have h1 := hf _ (subset_convexHull ℝ _ ⟨u, v, huv, rfl⟩)
    have h2 := hf _ (subset_convexHull ℝ _ ⟨v, u, huv.symm, rfl⟩)
    rw [pairing_edgeVector] at h1 h2
    exact abs_le.mpr ⟨by linarith, h1⟩

noncomputable def zeroSumSpace : Submodule ℝ (V → ℝ) := LinearMap.ker (pairing (fun _ => 1))

omit [DecidableEq V] in
@[simp] theorem mem_zeroSumSpace_iff (z : V → ℝ) :
    z ∈ (zeroSumSpace : Submodule ℝ (V → ℝ)) ↔ ∑ u, z u = 0 := by
  simp [zeroSumSpace, pairing_apply]

omit [Fintype V] in
private theorem edgeVector_add (u v w : V) : edgeVector u v + edgeVector v w = edgeVector u w := by
  unfold edgeVector
  abel

omit [Fintype V] in
private theorem difference_mem_span_of_reachable {G : SimpleGraph V} {u v : V} (h : G.Reachable u v) :
    edgeVector u v ∈ Submodule.span ℝ (edgeVectors G) := by
  obtain ⟨p⟩ := h
  induction p with
  | nil => simp [edgeVector]
  | cons h _ ih =>
    rw [← edgeVector_add _ _ _]
    exact Submodule.add_mem _ (Submodule.subset_span ⟨_, _, h, rfl⟩) ih

theorem sum_smul_edgeVector_eq_of_zeroSum (root : V) {z : V → ℝ} (hz : ∑ u, z u = 0) :
    (∑ u, z u • edgeVector u root) = z := by
  change (∑ u, z u • (Pi.single u 1 - Pi.single root 1)) = z
  simp_rw [smul_sub, sum_sub_distrib, ← sum_smul, hz, zero_smul, sub_zero]
  exact (pi_eq_sum_univ' z).symm

theorem span_edgeVectors_of_connected {G : SimpleGraph V} (hG : G.Connected) :
    Submodule.span ℝ (edgeVectors G) = zeroSumSpace := by
  obtain ⟨root⟩ := hG.nonempty
  apply le_antisymm
  · apply Submodule.span_le.mpr
    rintro z ⟨u, v, _, rfl⟩
    change pairing (fun _ => 1) (edgeVector u v) = 0
    simp
  · intro z hz
    have hsum := (mem_zeroSumSpace_iff z).mp hz
    rw [← sum_smul_edgeVector_eq_of_zeroSum root hsum]
    exact Submodule.sum_mem _ fun u _ => Submodule.smul_mem _ _
      (difference_mem_span_of_reachable (hG u root))

end BraunBruegge
