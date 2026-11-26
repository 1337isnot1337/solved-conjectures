module
public import Conjectures.CyrusianKaplanPolyhedronRayExit
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

@[expose] public section
namespace CyrusianKaplan
open Set

/-- Radial boundary with respect to the centre: a row strictly below
its bound at the centre attains the bound at the endpoint. -/
def radialBoundary {E ι : Type*} [AddCommGroup E] [Module ℝ E]
    (f : ι → E →ᵃ[ℝ] ℝ) (c : ι → ℝ) (x : E) : Set E :=
  {z ∈ finiteAffinePolyhedron f c | ∃ i, f i x < c i ∧ f i z = c i}

/-- A radial-boundary endpoint in a rising direction cannot be passed. -/
theorem radialBoundary_lineMap_not_mem {E ι : Type*} [AddCommGroup E] [Module ℝ E]
    (f : ι → E →ᵃ[ℝ] ℝ) (c : ι → ℝ) {x z : E}
    (hz : z ∈ radialBoundary f c x) {t : ℝ} (ht : 1 < t) :
    AffineMap.lineMap x z t ∉ finiteAffinePolyhedron f c := by
  obtain ⟨_,i,hi,hiz⟩ := hz
  intro hm
  have h := hm i
  rw [(f i).apply_lineMap, AffineMap.lineMap_apply_ring, hiz] at h
  have hp := mul_pos (sub_pos.mpr ht) (sub_pos.mpr hi)
  nlinarith only [h,hp]

/-- A noncentral nonboundary point lies on an open radius,
and its endpoint and interpolation weight are unique. -/
theorem compact_finiteAffinePolyhedron_open_radius {E ι : Type*}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [Finite ι]
    (f : ι → E →ᵃ[ℝ] ℝ) (c : ι → ℝ)
    (hc : IsCompact (finiteAffinePolyhedron f c))
    {x y : E} (hx : x∈finiteAffinePolyhedron f c) (hy : y∈finiteAffinePolyhedron f c)
    (hxy : x≠y) (hyB : y∉radialBoundary f c x) :
    ∃! p : E × ℝ, p.1 ∈ radialBoundary f c x ∧
      p.2 ∈ Ioo (0:ℝ) 1 ∧ AffineMap.lineMap x p.1 p.2 = y := by
  obtain ⟨T,hT,hmax,i,hi,hix⟩ := compact_finiteAffinePolyhedron_ray_exit f c hc hx hy hxy
  have hTpos : 0<T := lt_of_lt_of_le zero_lt_one hT
  have hT' : 1<T := by
    apply lt_of_le_of_ne hT
    intro h
    rw [← h, AffineMap.lineMap_apply_one] at hi
    exact hyB ⟨hy,i,hix,hi⟩
  have hZ : AffineMap.lineMap x y T ∈ radialBoundary f c x :=
    ⟨(hmax T hTpos.le).mpr le_rfl,i,hix,hi⟩
  let z := AffineMap.lineMap x y T
  refine ⟨(z,T⁻¹),⟨hZ,⟨inv_pos.mpr hTpos,(inv_lt_one₀ hTpos).mpr hT'⟩,?_⟩,?_⟩
  · change AffineMap.lineMap x (AffineMap.lineMap x y T) T⁻¹ = y
    rw [AffineMap.lineMap_lineMap_right, inv_mul_cancel₀ hTpos.ne', AffineMap.lineMap_apply_one]
  · intro q hq
    obtain ⟨hz,ht,he⟩ := hq
    have hqpos : 0<q.2 := ht.1
    have hEq (t : ℝ) :
        AffineMap.lineMap x y t = AffineMap.lineMap x q.1 (t*q.2) := by
      rw [← AffineMap.lineMap_lineMap_right, he]
    have hEnd : AffineMap.lineMap x y (q.2⁻¹) = q.1 := by
      rw [hEq, inv_mul_cancel₀ hqpos.ne', AffineMap.lineMap_apply_one]
    have hle : q.2⁻¹≤T := (hmax _ (inv_nonneg.mpr hqpos.le)).mp (hEnd ▸ hz.1)
    have hge : T≤q.2⁻¹ := by
      by_contra hn
      have hm : 1<T*q.2 := by
        have hh := mul_lt_mul_of_pos_right (lt_of_not_ge hn) hqpos
        rwa [inv_mul_cancel₀ hqpos.ne'] at hh
      have hh := (hmax T hTpos.le).mpr le_rfl
      rw [hEq] at hh
      exact radialBoundary_lineMap_not_mem f c hz hm hh
    have hInv : q.2⁻¹ = T := le_antisymm hle hge
    apply Prod.ext
    · change q.1 = z
      rw [hInv] at hEnd
      exact hEnd.symm
    · change q.2 = T⁻¹
      rw [← hInv, inv_inv]

end CyrusianKaplan
