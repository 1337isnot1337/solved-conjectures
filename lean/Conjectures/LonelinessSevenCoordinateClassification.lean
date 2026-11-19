import Conjectures.LonelinessSevenCoordinatePlaneNormalization
import Conjectures.LonelinessSevenCoordinateTangent
import Conjectures.LonelinessSevenCoordinateFinite
import Conjectures.LonelinessSevenCoordinateAdmissibility
import Conjectures.LonelinessSevenCoordinateProduct
import Conjectures.LonelinessConsecutive

/-! The seven-coordinate critical-plane classification. The finite plane
enumeration is supplied by the checked reduced cases. The mathematical
inputs that remain are exactly the five-speed lower bound and the primitive
six-speed classification; no plane-classification premise is assumed. -/

namespace Loneliness.SevenCoordinateCritical

open CoordinateSubspace SubspaceDensity

noncomputable section

def StandardProductPlane (E : Submodule ℚ (Fin 7 → ℚ)) : Prop :=
  ∃ (σ : Fin 7 → ℤ) (hσ : ∀ i, σ i = 1 ∨ σ i = -1)
    (p : Equiv.Perm (Fin 7)),
    E.map (signedCoordinates ℚ σ hσ p).toLinearMap = standardPlane

theorem critical_plane_classification
    (hfive : LonelyRunnerBound 5) (hsix : PrimitiveSixClassification)
    (E : Submodule ℚ (Fin 7 → ℚ)) (hfree : CoordinateFree E)
    (hdim : Module.finrank ℚ E = 2)
    (hlow : spaceValue (realSpan E) ≤ (1 / 7 : ℝ)) : StandardProductPlane E := by
  obtain ⟨σ, hσ, p, k, b, hb, hbzero, hE, hfreeF, hdimF, hlowF⟩ :=
    normalized_low_plane hfive hsix E hfree hdim hlow
  let F : Submodule ℚ (Fin 7 → ℚ) :=
    Submodule.span ℚ {(fun i => (canonical k i : ℚ)), (fun i => (b i : ℚ))}
  have hcanonicalF : (fun i => (canonical k i : ℚ)) ∈ F :=
    Submodule.subset_span (by simp)
  have hbF : (fun i => (b i : ℚ)) ∈ F :=
    Submodule.subset_span (by simp)
  have htests : Finite.RepeatTests (canonical k) b :=
    repeatTests_of_low_plane hfive hsix F hfreeF hdimF hlowF
      (canonical k) b hcanonicalF hbF rfl
  have hpairs : ∀ a : Fin 6, k ≠ a → k ≠ a.rev →
      (6-(a.val : ℤ)) * b a.castSucc = ((a.val : ℤ)+1) * b a.rev.castSucc :=
    fun a ha ha' => canonical_plane_pair_proportional F k b hcanonicalF hbF
      (canonicalSigned_abs_le_six hb) hlowF a ha ha'
  have hproduct : Finite.ProductForm (canonical k) b :=
    Finite.productForm_of_necessary_conditions k b
      (candidate_of_canonicalSigned hb hbzero) (canonicalSigned_nonzero hb)
      (canonicalSigned_abs_le_six hb) hpairs htests
  obtain ⟨q, hq⟩ := productForm_standardPlane k b hdimF hproduct
  let σ' : Fin 7 → ℤ := fun i => σ (q i)
  have hσ' : ∀ i, σ' i = 1 ∨ σ' i = -1 := fun i => hσ (q i)
  have hcomp : (signedCoordinates ℚ σ' hσ' (q.trans p)).toLinearMap =
      (signedCoordinates ℚ (fun _ : Fin 7 => 1) (fun _ => Or.inl rfl) q).toLinearMap.comp
        (signedCoordinates ℚ σ hσ p).toLinearMap := by
    ext x i
    change (σ (q i) : ℚ) * x (p (q i)) =
      (1 : ℚ) * ((σ (q i) : ℚ) * x (p (q i)))
    simp
  refine ⟨σ', hσ', q.trans p, ?_⟩
  rw [hcomp, Submodule.map_comp, hE]
  exact hq

/-- The converse is unconditional: the displayed product plane has value
exactly `1/7`, using the already proved consecutive-six maximum. -/
theorem standardPlane_value : spaceValue (realSpan standardPlane) = (1 / 7 : ℝ) := by
  apply le_antisymm
  · apply spaceValue_le
    intro x hx
    rw [standardPlane, realSpan_span, Set.image_insert_eq, Set.image_singleton] at hx
    obtain ⟨t, s, hrepr⟩ := Submodule.mem_span_pair.mp hx
    have hcoordinate (i : Fin 6) : x i.castSucc = ((i.val+1 : ℕ) : ℝ) * t := by
      rw [← hrepr]
      fin_cases i <;> simp [standardBase, coordinateAxis, rationalVector] <;> ring
    have hclearance : pointClearance x ≤ clearance sixBase t := by
      apply le_clearance (point_le_half x)
      intro a ha
      have hbounds : ∀ a ∈ sixBase, 1 ≤ a ∧ a ≤ 6 := by norm_num [sixBase]
      have ha' := hbounds a ha
      let i : Fin 6 := ⟨a-1, by omega⟩
      have hi : i.val+1 = a := by dsimp [i]; omega
      have hxi : x i.castSucc = (a : ℝ) * t := by simpa only [hi] using hcoordinate i
      have h := point_le_distance x i.castSucc
      rwa [hxi] at h
    apply hclearance.trans
    simpa [sixBase, List.range'] using consecutive_upper 6 (by decide) t
  · let x : Fin 7 → ℚ := (1 / 7 : ℚ) • standardBase + (1 / 2 : ℚ) • coordinateAxis 6
    have hx : x ∈ standardPlane :=
      Submodule.mem_span_pair.mpr ⟨1 / 7, 1 / 2, rfl⟩
    apply le_trans (b := pointClearance (rationalVector x))
    · apply le_point
      intro i
      apply distance_lower_of_cell (k := 0)
      · fin_cases i <;> norm_num [x, standardBase, coordinateAxis, rationalVector]
      · fin_cases i <;> norm_num [x, standardBase, coordinateAxis, rationalVector]
    · exact point_le_spaceValue (rationalVector_mem_realSpan hx)

theorem standardProductPlane_value {E : Submodule ℚ (Fin 7 → ℚ)}
    (h : StandardProductPlane E) : spaceValue (realSpan E) = (1 / 7 : ℝ) := by
  obtain ⟨σ, hσ, p, hE⟩ := h
  rw [← spaceValue_realSpan_signedCoordinates σ hσ p E, hE]
  exact standardPlane_value

theorem coordinateFree_of_positive_spaceValue (E : Submodule ℚ (Fin 7 → ℚ))
    (hpositive : 0 < spaceValue (realSpan E)) : CoordinateFree E := by
  apply coordinateFree_of_realSpan
  intro i
  by_contra hnone
  have hzero (x : Fin 7 → ℝ) (hx : x ∈ realSpan E) : x i = 0 := by
    by_contra hne
    exact hnone ⟨x, hx, hne⟩
  have hupper : spaceValue (realSpan E) ≤ 0 := by
    apply spaceValue_le
    intro x hx
    calc
      pointClearance x ≤ distance (x i) := point_le_distance x i
      _ = 0 := by rw [hzero x hx]; simp [distance]
  exact (not_le_of_gt hpositive) hupper

theorem critical_plane_classification_of_value_eq
    (hfive : LonelyRunnerBound 5) (hsix : PrimitiveSixClassification)
    (E : Submodule ℚ (Fin 7 → ℚ)) (hdim : Module.finrank ℚ E = 2)
    (hvalue : spaceValue (realSpan E) = (1 / 7 : ℝ)) : StandardProductPlane E := by
  have hfree : CoordinateFree E := coordinateFree_of_positive_spaceValue E (by
    rw [hvalue]
    norm_num)
  exact critical_plane_classification hfive hsix E hfree hdim hvalue.le

theorem critical_plane_iff
    (hfive : LonelyRunnerBound 5) (hsix : PrimitiveSixClassification)
    (E : Submodule ℚ (Fin 7 → ℚ)) (hdim : Module.finrank ℚ E = 2) :
    spaceValue (realSpan E) = (1 / 7 : ℝ) ↔ StandardProductPlane E :=
  ⟨fun h => critical_plane_classification_of_value_eq hfive hsix E hdim h,
    standardProductPlane_value⟩

end

end Loneliness.SevenCoordinateCritical
