module
public import Conjectures.CyrusianKaplanRationalStratumPoint
public import Conjectures.CyrusianKaplanRayBoundary
import Mathlib.Tactic.Linarith

@[expose] public section
namespace CyrusianKaplan
open Set

theorem tupleFibre_eq_strict {r : ℕ} (g : ℝ) (s : TupleAffineTest r → Ordering) :
    affineSignFibre (tupleAffineForm g) s =
      strictAffineStratum (fun i => orientedTupleAffineMap g s i)
        {i | s i=.eq} {i | s i≠.eq} := by
  rw [affineSignFibre_eq_strictStratum]
  congr 1
  funext i z
  exact (orientedTupleAffineMap_apply g s i z).symm

theorem compact_weak_sign_is_rational_convexHull {r : ℕ}
    (s : TupleAffineTest r → Ordering) (hC : IsCompact (weakTupleSignPolyhedron 1 s)) :
    ∃ T : Finset (TupleSpace r), weakTupleSignPolyhedron 1 s=convexHull ℝ (T:Set (TupleSpace r)) ∧
      ∀ x∈T, ∃ a b : Fin r → ℚ,(fun i => (a i:ℝ),fun i => (b i:ℝ))=x := by
  classical
  let W := weakTupleSignPolyhedron 1 s
  have hV : (W.extremePoints ℝ).Finite := by
    unfold W
    rw [weak_sign_eq_finiteAffinePolyhedron]
    exact finite_extremePoints_finiteAffinePolyhedron _ _ (continuous_signWeakConstraint 1 s)
  have hConv : Convex ℝ W := by
    have he : W=⋂ i, (signWeakConstraint 1 s i) ⁻¹' (Iic (0:ℝ)) := by
      unfold W
      rw [weak_sign_eq_finiteAffinePolyhedron]
      ext x
      simp [finiteAffinePolyhedron]
    rw [he]
    exact convex_iInter (fun i => (convex_Iic (0:ℝ)).affine_preimage _)
  have hHull : convexHull ℝ (W.extremePoints ℝ)=W := by
    have hK := closure_convexHull_extremePoints hC hConv
    rwa [(hV.isClosed_convexHull ℝ).closure_eq] at hK
  refine ⟨hV.toFinset,?_,?_⟩
  · rw [Set.Finite.coe_toFinset]
    exact hHull.symm
  · intro x hx
    exact actual_weak_sign_extreme_point_rational s (hV.mem_toFinset.mp hx)

theorem compact_signFibre_has_rational_point {r : ℕ}
    (s : TupleAffineTest r → Ordering) (x : TupleSpace r)
    (hC : IsCompact (weakTupleSignPolyhedron 1 s)) (hs : affineSignCode (tupleAffineForm 1) x=s) :
    ∃ z∈affineSignFibre (tupleAffineForm 1) s,RationalTuple z := by
  let W := weakTupleSignPolyhedron 1 s
  let I := {i : TupleAffineTest r // s i≠.eq}
  let f (i : I) := orientedTupleAffineMap 1 s i.val
  have hxS : x∈strictAffineStratum (fun i => orientedTupleAffineMap 1 s i)
      {i | s i=.eq} {i | s i≠.eq} := by
    rw [← tupleFibre_eq_strict]
    exact hs
  have hX : x∈W := ⟨hxS.1,fun i hi => (hxS.2 i hi).le⟩
  obtain ⟨T,hT,hR⟩ := compact_weak_sign_is_rational_convexHull s hC
  have hT' : W=convexHull ℝ (T:Set (TupleSpace r)) := hT
  have hMem {z : TupleSpace r} (hz : z∈T) : z∈W := hT'.symm ▸ subset_convexHull ℝ _ hz
  have hWe (z : TupleSpace r) (hz : z∈W) (i : I) : f i z≤0 := hz.2 i.val i.property
  have hBase : ∃ z∈W,RationalTuple z := by
    have hTNe : T.Nonempty := by
      apply Finset.nonempty_iff_ne_empty.mpr
      intro he
      rw [hT',he,Finset.coe_empty,convexHull_empty] at hX
      exact hX
    obtain ⟨t,ht⟩ := hTNe
    exact ⟨t,hMem ht,hR t ht⟩
  have hCv : Convex ℝ W := hT'.symm ▸ convex_convexHull ℝ _
  have hRow (i : I) : ∃ z∈W,RationalTuple z ∧ f i z<0 := by
    have hXNeg : f i x<0 := hxS.2 i.val i.property
    by_contra! hN
    have hZero : (T:Set (TupleSpace r)) ⊆ (f i) ⁻¹' ({0}:Set ℝ) := by
      intro t ht
      have htT : t∈T := ht
      exact le_antisymm (hWe t (hMem htT) i) (hN t (hMem htT) (hR t htT))
    have hC : Convex ℝ ((f i) ⁻¹' ({0}:Set ℝ)) :=
      (convex_singleton (0:ℝ)).affine_preimage _
    have hn := convexHull_min hZero hC (hT' ▸ hX)
    exact hXNeg.ne (show f i x=0 from hn)
  obtain ⟨z,hz,hRat,hAll⟩ := finite_negative_rows_joint_rational_witness
    W hCv f hBase hWe hRow
  refine ⟨z,?_,hRat⟩
  rw [tupleFibre_eq_strict]
  exact ⟨hz.1,fun i hi => hAll ⟨i,hi⟩⟩

/-- A weak face can only replace nonzero signs with zero signs. -/
def signSpecializes {ι : Type*} (a b : ι→Ordering) : Prop :=
  ∀ i, a i = b i ∨ a i = .eq

theorem mem_weak_sign_iff_specializes {r : ℕ} {x : TupleSpace r}
    {s : TupleAffineTest r→Ordering} :
    x∈weakTupleSignPolyhedron 1 s ↔
      signSpecializes (affineSignCode (tupleAffineForm 1) x) s := by
  constructor
  · intro h i
    change affineTestSign (tupleAffineForm 1 i x) = s i ∨
      affineTestSign (tupleAffineForm 1 i x) = .eq
    by_cases hZero : tupleAffineForm 1 i x = 0
    · exact Or.inr ((affineTestSign_eq_eq _).mpr hZero)
    left
    cases hs : s i with
    | eq =>
      have hh : orientedTupleAffineMap 1 s i x = 0 := h.1 i hs
      rw [orientedTupleAffineMap_apply] at hh
      exact (hZero (by simpa [hs] using hh)).elim
    | lt =>
      have hh : orientedTupleAffineMap 1 s i x ≤ 0 := h.2 i (by simp [hs])
      rw [orientedTupleAffineMap_apply] at hh
      have hn : tupleAffineForm 1 i x ≤ 0 := by simpa [hs] using hh
      exact (affineTestSign_eq_lt _).mpr (lt_of_le_of_ne hn hZero)
    | gt =>
      have hh : orientedTupleAffineMap 1 s i x ≤ 0 := h.2 i (by simp [hs])
      rw [orientedTupleAffineMap_apply] at hh
      have hn : 0 ≤ tupleAffineForm 1 i x := by simpa [hs] using hh
      exact (affineTestSign_eq_gt _).mpr (lt_of_le_of_ne hn (fun hh => hZero hh.symm))
  · intro h
    refine ⟨?_,?_⟩
    · intro i (hi : s i = .eq)
      change orientedTupleAffineMap 1 s i x = 0
      have hz : affineTestSign (tupleAffineForm 1 i x) = .eq := (h i).elim
        (fun e => e.trans hi) id
      simpa [orientedTupleAffineMap_apply,hi] using (affineTestSign_eq_eq _).mp hz
    · intro i (hi : s i ≠ .eq)
      change orientedTupleAffineMap 1 s i x ≤ 0
      rw [orientedTupleAffineMap_apply]
      rcases h i with hSame|hZero
      · cases hs : s i with
        | eq => exact (hi hs).elim
        | lt =>
          have he : tupleAffineForm 1 i x < 0 := (affineTestSign_eq_lt _).mp (hSame.trans hs)
          simpa [hs] using he.le
        | gt =>
          have he : 0 < tupleAffineForm 1 i x := (affineTestSign_eq_gt _).mp (hSame.trans hs)
          simpa [hs] using he.le
      · have he : tupleAffineForm 1 i x = 0 := (affineTestSign_eq_eq _).mp hZero
        simp [he]

theorem compact_of_signSpecializes {r : ℕ} {s t : TupleAffineTest r→Ordering}
    (h : signSpecializes t s) (hc : IsCompact (weakTupleSignPolyhedron 1 s)) :
    IsCompact (weakTupleSignPolyhedron 1 t) := by
  apply hc.of_isClosed_subset
  · rw [weak_sign_eq_finiteAffinePolyhedron]
    have he : finiteAffinePolyhedron (signWeakConstraint 1 t) (fun _=>0) =
        ⋂ i, (signWeakConstraint 1 t i) ⁻¹' Iic (0:ℝ) := by
      ext x
      simp [finiteAffinePolyhedron]
    rw [he]
    exact isClosed_iInter (fun i => isClosed_Iic.preimage (continuous_signWeakConstraint 1 t i))
  · intro x hx
    have hX := mem_weak_sign_iff_specializes.mp hx
    apply mem_weak_sign_iff_specializes.mpr
    intro i
    rcases hX i with he|he
    · exact (h i).elim (fun hh => Or.inl (he.trans hh)) (fun hh => Or.inr (he.trans hh))
    · exact Or.inr he

end CyrusianKaplan
