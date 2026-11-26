module
public import Conjectures.CyrusianKaplanRadialSignFaces
import Mathlib.Tactic.Linarith

@[expose] public section
namespace CyrusianKaplan
open Set

theorem tuple_mem_weak_of_fibre {r : ℕ} {s : TupleAffineTest r→Ordering}
    {x : TupleSpace r} (hx : x∈affineSignFibre (tupleAffineForm 1) s) :
    x∈weakTupleSignPolyhedron 1 s := by
  apply mem_weak_sign_iff_specializes.mpr
  intro i
  exact Or.inl (congrFun hx i)

theorem lineMap_mem_tuple_fibre {r : ℕ} {s : TupleAffineTest r→Ordering}
    {x z : TupleSpace r} (hx : x∈affineSignFibre (tupleAffineForm 1) s)
    (hz : z∈weakTupleSignPolyhedron 1 s) {t : ℝ} (ht : t∈Icc (0:ℝ) 1)
    (hStrict : t<1) :
    AffineMap.lineMap x z t∈affineSignFibre (tupleAffineForm 1) s := by
  rw [tupleFibre_eq_strict] at hx ⊢
  constructor
  · intro i hi
    change orientedTupleAffineMap 1 s i (AffineMap.lineMap x z t)=0
    rw [(orientedTupleAffineMap 1 s i).apply_lineMap,AffineMap.lineMap_apply_ring]
    simp only [hx.1 i hi,hz.1 i hi,mul_zero,add_zero]
  · intro i hi
    change orientedTupleAffineMap 1 s i (AffineMap.lineMap x z t)<0
    rw [(orientedTupleAffineMap 1 s i).apply_lineMap,AffineMap.lineMap_apply_ring]
    exact add_neg_of_neg_of_nonpos
      (mul_neg_of_pos_of_neg (sub_pos.mpr hStrict) (hx.2 i hi))
      (mul_nonpos_of_nonneg_of_nonpos ht.1 (hz.2 i hi))

theorem tuple_fibre_open_radius {r : ℕ} {s : TupleAffineTest r→Ordering}
    (hc : IsCompact (weakTupleSignPolyhedron 1 s)) {x y : TupleSpace r}
    (hx : x∈affineSignFibre (tupleAffineForm 1) s)
    (hy : y∈affineSignFibre (tupleAffineForm 1) s) (hne : x≠y) :
    ∃! p : TupleSpace r × ℝ,
      (signSpecializes (affineSignCode (tupleAffineForm 1) p.1) s ∧
        affineSignCode (tupleAffineForm 1) p.1 ≠ s) ∧
      p.2∈Ioo (0:ℝ) 1 ∧ AffineMap.lineMap x p.1 p.2=y := by
  let f := signWeakConstraint 1 s
  have hW : weakTupleSignPolyhedron 1 s = finiteAffinePolyhedron f (fun _=>0) :=
    weak_sign_eq_finiteAffinePolyhedron _ _
  have hxW : x∈finiteAffinePolyhedron f (fun _=>0) := hW ▸ tuple_mem_weak_of_fibre hx
  have hyW : y∈finiteAffinePolyhedron f (fun _=>0) := hW ▸ tuple_mem_weak_of_fibre hy
  have hyN : y∉radialBoundary f (fun _=>0) x :=
    fun h => ((mem_radialBoundary_iff_specializes_ne hx).mp h).2 hy
  have he := compact_finiteAffinePolyhedron_open_radius f (fun _=>0) (hW ▸ hc) hxW hyW hne hyN
  simpa only [f,mem_radialBoundary_iff_specializes_ne hx] using he

theorem tuple_radius_not_centre {r : ℕ} {s : TupleAffineTest r→Ordering}
    {x z : TupleSpace r} (hx : x∈affineSignFibre (tupleAffineForm 1) s)
    (hz : affineSignCode (tupleAffineForm 1) z ≠ s) {t : ℝ} (ht : 0<t) :
    AffineMap.lineMap x z t ≠ x := by
  have hxz : x≠z := fun he => hz (he ▸ hx)
  intro he
  have he' : AffineMap.lineMap x z t=AffineMap.lineMap x z (0:ℝ) := by
    rw [AffineMap.lineMap_apply_zero,he]
  exact ht.ne' (AffineMap.lineMap_injective ℝ hxz he')

/-- Distinct boundary faces have a separating actual row, so a
point in the parent stratum is not on their affine hyperplane. -/
theorem specialized_sign_face_separating_row {r : ℕ} {s t : TupleAffineTest r→Ordering}
    (hst : signSpecializes t s) (hne : t≠s) :
    ∃ i : TupleAffineTest r, t i=.eq ∧ s i≠.eq := by
  obtain ⟨i,hi⟩ : ∃ i,t i≠s i := by
    by_contra! h
    exact hne (funext h)
  have heq := (hst i).resolve_left hi
  exact ⟨i,heq,fun hs => hi (heq.trans hs.symm)⟩

end CyrusianKaplan
