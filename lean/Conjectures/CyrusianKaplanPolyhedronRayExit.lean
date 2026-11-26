module
public import Conjectures.CyrusianKaplanPolyhedronVertices
public import Mathlib.Analysis.Normed.Group.Bounded
public import Mathlib.Data.Finset.Max
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

@[expose] public section
namespace CyrusianKaplan

open Set

/-- Every nonconstant ray from a point of a compact finite
polyhedron meets a first boundary. Its maximal parameter is
the least ratio among rising rows, and the endpoint activates
a row that was strict at the initial point. -/
theorem compact_finiteAffinePolyhedron_ray_exit {E ι : Type*}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [Finite ι]
    (f : ι → E →ᵃ[ℝ] ℝ) (c : ι → ℝ)
    (hc : IsCompact (finiteAffinePolyhedron f c))
    {x y : E} (hx : x∈finiteAffinePolyhedron f c) (hy : y∈finiteAffinePolyhedron f c)
    (hxy : x≠y) :
    ∃ T : ℝ, 1≤T ∧
      (∀ t : ℝ, 0≤t → (AffineMap.lineMap x y t∈finiteAffinePolyhedron f c ↔ t≤T)) ∧
      ∃ i : ι, f i (AffineMap.lineMap x y T)=c i ∧ f i x<c i := by
  classical
  let : Fintype ι := Fintype.ofFinite ι
  let d (i : ι) := f i y-f i x
  let rise := Finset.univ.filter fun i => 0<d i
  let ratio (i : ι) := (c i-f i x)/d i
  have hLine (i : ι) (t : ℝ) :
      f i (AffineMap.lineMap x y t)=f i x+t*d i := by
    rw [(f i).apply_lineMap,AffineMap.lineMap_apply_ring]
    unfold d
    ring
  have hR : rise.Nonempty := by
    by_contra hEmpty
    have hn (i : ι) : d i≤0 := by
      apply le_of_not_gt
      intro hi
      exact hEmpty ⟨i,Finset.mem_filter.mpr ⟨Finset.mem_univ _,hi⟩⟩
    obtain ⟨B,hB,hBound⟩ := hc.isBounded.exists_pos_norm_le
    have hnrm : 0<‖y-x‖ := norm_pos_iff.mpr (sub_ne_zero.mpr hxy.symm)
    let t := (B + ‖x‖ + 1)/‖y-x‖
    have ht : 0<t := by
      unfold t
      exact div_pos (by linarith [norm_nonneg x]) hnrm
    have htW : AffineMap.lineMap x y t∈finiteAffinePolyhedron f c := by
      intro i
      rw [hLine]
      have h := mul_nonpos_of_nonneg_of_nonpos ht.le (hn i)
      exact (add_le_of_nonpos_right h).trans (hx i)
    have hB' := hBound _ htW
    rw [AffineMap.lineMap_apply_module'] at hB'
    have hTri := norm_sub_le (t • (y-x)+x) x
    rw [add_sub_cancel_right,norm_smul,Real.norm_eq_abs,abs_of_pos ht] at hTri
    have he : t*‖y-x‖=B + ‖x‖ + 1 := by
      unfold t
      rw [div_mul_cancel₀ _ hnrm.ne']
    linarith
  obtain ⟨j,hj,hmin⟩ := Finset.exists_min_image rise ratio hR
  have hjd : 0<d j := (Finset.mem_filter.mp hj).2
  have hOne : 1≤ratio j := by
    apply (le_div_iff₀ hjd).mpr
    rw [one_mul]
    exact sub_le_sub_right (hy j) _
  refine ⟨ratio j,hOne,?_,j,?_,?_⟩
  · intro t ht
    constructor
    · intro h
      apply (le_div_iff₀ hjd).mpr
      have hj' := h j
      rw [hLine] at hj'
      linarith
    · intro h i
      rw [hLine]
      by_cases hi : 0<d i
      · have hTi : t≤ratio i := h.trans (hmin i (Finset.mem_filter.mpr ⟨Finset.mem_univ _,hi⟩))
        have hmul := (le_div_iff₀ hi).mp hTi
        linarith
      · have hmul := mul_nonpos_of_nonneg_of_nonpos ht (le_of_not_gt hi)
        exact (add_le_of_nonpos_right hmul).trans (hx i)
  · rw [hLine]
    unfold ratio
    rw [div_mul_cancel₀ _ hjd.ne']
    ring
  · have hh : f j x<f j y := sub_pos.mp hjd
    exact hh.trans_le (hy j)

end CyrusianKaplan
