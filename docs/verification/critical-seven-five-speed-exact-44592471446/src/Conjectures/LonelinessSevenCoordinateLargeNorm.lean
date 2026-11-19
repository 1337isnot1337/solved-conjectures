import Conjectures.LonelinessSevenCoordinateClassification
import Conjectures.LonelinessSevenCoordinatePatternPlane
import Conjectures.LonelinessSevenCoordinateQuantitativeBasis
import Conjectures.LonelinessSevenCoordinateTangentGap

/-! The published large-norm seven-speed plane reduction. The geometric
estimate and repeat-line bounds are internal. The remaining inputs are the
five-speed runner theorem and the primitive six-speed classification. -/

namespace Loneliness.SevenCoordinateCritical.Quantitative

open CoordinateSubspace SubspaceDensity

noncomputable section

theorem product_plane_of_repeat_bound
    (hfive : LonelyRunnerBound 5) (hsix : PrimitiveSixClassification)
    (E : Submodule ℚ (Fin 7 → ℚ)) (hfree : CoordinateFree E)
    (hdim : Module.finrank ℚ E = 2)
    (hrepeated : RepeatDirectionBound E)
    (hnear : spaceValue (realSpan E) < (229/1596 : ℝ)) :
    StandardProductPlane E := by
  obtain ⟨σ, hσ, p, k, b, hb, hbzero, hE, hfreeF, hdimF, hvalueF⟩ :=
    normalized_plane_of_repeat_bound hfive hsix E hfree hdim hrepeated
  let F : Submodule ℚ (Fin 7 → ℚ) :=
    Submodule.span ℚ {(fun i => (canonical k i : ℚ)), (fun i => (b i : ℚ))}
  have hcanonicalF : (fun i => (canonical k i : ℚ)) ∈ F :=
    Submodule.subset_span (by simp)
  have hbF : (fun i => (b i : ℚ)) ∈ F :=
    Submodule.subset_span (by simp)
  have hboundF : RepeatDirectionBound F := by
    dsimp only [F]
    rw [← hE]
    exact repeatDirectionBound_signedCoordinates E hrepeated σ hσ p
  have hnearF : spaceValue (realSpan F) < (229/1596 : ℝ) := by
    rw [hvalueF]
    exact hnear
  have hsixthF : spaceValue (realSpan F) < (1/6 : ℝ) := by linarith
  have htests : Finite.RepeatTests (canonical k) b :=
    repeatTests_of_direction_bound hfive hsix F hfreeF hdimF hsixthF hboundF
      (canonical k) b hcanonicalF hbF rfl
  have hpairs : ∀ a : Fin 6, k ≠ a → k ≠ a.rev →
      (6-(a.val : ℤ))*b a.castSucc = ((a.val : ℤ)+1)*b a.rev.castSucc :=
    fun a ha ha' => canonical_plane_pair_proportional_of_lt F k b hcanonicalF hbF
      (canonicalSigned_abs_le_six hb) hnearF a ha ha'
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
    apply LinearMap.ext
    intro x
    funext i
    change (σ (q i) : ℚ)*x (p (q i)) =
      (1 : ℚ)*((σ (q i) : ℚ)*x (p (q i)))
    simp
  refine ⟨σ', hσ', q.trans p, ?_⟩
  rw [hcomp, Submodule.map_comp, hE]
  exact hq

/-- A primitive positive seven-speed vector at the stated Euclidean norm
cutoff, with value below one seventh, lies in an actual rational critical
plane. The returned plane is also classified by an actual signed permutation. -/
theorem large_norm_critical_plane
    (hfive : LonelyRunnerBound 5) (hsix : PrimitiveSixClassification)
    (v : Fin 7 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hbelow : value (List.ofFn v) < (1/7 : ℝ))
    (hnorm : (7*42^10 : ℝ) ≤ ‖KZBasis.realVector (fun i => (v i : ℤ))‖) :
    ∃ E : Submodule ℚ (Fin 7 → ℚ),
      (fun i => (v i : ℚ)) ∈ E ∧ CoordinateFree E ∧ Module.finrank ℚ E = 2 ∧
      spaceValue (realSpan E) = (1/7 : ℝ) ∧ StandardProductPlane E := by
  obtain ⟨B, A, hfirst, hfree, hdim, hA, hminor, hgap, hnear, hsixth⟩ :=
    exists_near_plane hfive v hpositive hprimitive hbelow hnorm
  have hrepeated : RepeatDirectionBound (basisPlane B) :=
    repeat_direction_bound_of_minors hfive (basisPlane B) hfree hdim (B 0) (B 1)
      rfl A hA hminor hgap hsixth
  have hproduct := product_plane_of_repeat_bound hfive hsix (basisPlane B)
    hfree hdim hrepeated hnear
  refine ⟨basisPlane B, ?_, hfree, hdim, standardProductPlane_value hproduct, hproduct⟩
  have hcast : (fun i => (v i : ℚ)) = (fun i => (B 0 i : ℚ)) := by
    rw [hfirst]
    ext i
    simp
  rw [hcast]
  exact Submodule.subset_span (by simp)

end

end Loneliness.SevenCoordinateCritical.Quantitative
