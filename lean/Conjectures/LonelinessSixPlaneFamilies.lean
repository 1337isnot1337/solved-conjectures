import Conjectures.LonelinessSixPlaneGeometry
import Conjectures.LonelinessProductPlaneSpeeds
import Conjectures.LonelinessHigherTriangleConsequences

/-! Actual integer members of the classified six-coordinate planes belong
to the original literal families. The product cases reuse the generic
integer-scale bridge. The third case retains the full real parameters and
every coordinate sign; no positive parameter chamber is imposed.
-/

namespace Loneliness.SixPlane

open CoordinateSubspace

noncomputable section

def productBase (which : Fin 2) : Fin 5 → ℕ :=
  ![![1,2,3,4,5], ![1,3,4,5,9]] which

private theorem productBase_zero : List.ofFn (productBase 0) = [1,2,3,4,5] := by
  decide +kernel

private theorem productBase_one : List.ofFn (productBase 1) = [1,3,4,5,9] := by
  decide +kernel

private theorem productBase_first (which : Fin 2) : productBase which 0 = 1 := by
  fin_cases which <;> rfl

private theorem productBase_gcd (which : Fin 2) :
    Normalization.gcd (List.ofFn (productBase which)) = 1 := by
  fin_cases which <;> decide +kernel

private theorem productBase_residues (which : Fin 2) :
    ∀ a ∈ List.ofFn (productBase which), a % 6 ≠ 0 := by
  fin_cases which <;> decide +kernel

theorem standard_product_plane (which : Fin 2) :
    standardPlane which.castSucc = ProductPlaneSpeeds.plane (productBase which) := by
  have hbase : standard which.castSucc (1 : ℚ) 0 =
      ProductPlaneSpeeds.baseVector (productBase which) := by
    fin_cases which <;> funext i <;> fin_cases i <;> decide +kernel
  have haxis : standard which.castSucc (0 : ℚ) 1 = ProductPlaneSpeeds.axis 5 := by
    fin_cases which <;> funext i <;> fin_cases i <;> decide +kernel
  unfold standardPlane ProductPlaneSpeeds.plane
  rw [hbase, haxis]

private theorem signed_product_of_kind (which : Fin 2)
    (E : Submodule ℚ (Fin 6 → ℚ))
    (σ : Fin 6 → ℤ) (hσ : ∀ i, σ i = 1 ∨ σ i = -1)
    (p : Equiv.Perm (Fin 6))
    (hE : E.map (signedCoordinates ℚ σ hσ p).toLinearMap =
      standardPlane which.castSucc) :
    ProductPlaneSpeeds.SignedProductPlane (productBase which) E :=
  ⟨σ, hσ, p, hE.trans (standard_product_plane which)⟩

private theorem third_of_signed_plane
    (E : Submodule ℚ (Fin 6 → ℚ))
    (σ : Fin 6 → ℤ) (hσ : ∀ i, σ i = 1 ∨ σ i = -1)
    (p : Equiv.Perm (Fin 6))
    (hE : E.map (signedCoordinates ℚ σ hσ p).toLinearMap = standardPlane 2)
    (v : Fin 6 → ℕ) (hv : (fun i => (v i : ℚ)) ∈ E) :
    HigherTriangleConsequences.SixThird (List.ofFn v) := by
  let w : Fin 6 → ℤ := signedCoordinates ℤ σ hσ p (fun i => (v i : ℤ))
  have hcast : signedCoordinates ℚ σ hσ p (fun i => (v i : ℚ)) =
      (fun i => (w i : ℚ)) := by
    ext i
    simp [w]
  have hw : (fun i => (w i : ℚ)) ∈ standardPlane 2 := by
    rw [← hE]
    exact Submodule.mem_map.mpr ⟨_, hv, hcast⟩
  obtain ⟨s, t, hrepr⟩ := Submodule.mem_span_pair.mp hw
  have hcoordsQ : (fun i => (w i : ℚ)) = standard 2 s t :=
    hrepr.symm.trans (standard_linear_combination 2 s t).symm
  have hcoordsR : (fun i => (w i : ℝ)) =
      ![(s : ℝ), (t : ℝ), (s : ℝ) + (t : ℝ), 2 * (s : ℝ) + (t : ℝ),
        3 * (s : ℝ) + (t : ℝ), 3 * (s : ℝ) + 2 * (t : ℝ)] := by
    ext i
    have h := congrArg (fun a : ℚ => (a : ℝ)) (congrFun hcoordsQ i)
    fin_cases i <;> simpa [standard] using h
  have habs : (fun i => (w i).natAbs) = fun i => v (p i) := by
    funext i
    simp only [w, natAbs_signedCoordinates, Int.natAbs_natCast]
  refine ⟨w, (s : ℝ), (t : ℝ), ?_, hcoordsR⟩
  rw [habs]
  exact (p.ofFn_comp_perm v).symm

/-- The two product alternatives retain both positive integer parameters.
The remaining alternative is the full signed real third-family statement. -/
theorem literal_parameters_of_mem_critical_plane
    (E : Submodule ℚ (Fin 6 → ℚ)) (hcritical : CriticalPlane E)
    (v : Fin 6 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hv : (fun i => (v i : ℚ)) ∈ E) :
    (∃ A b : ℕ, 0 < A ∧ 0 < b ∧
      ((List.ofFn v).Perm [A,2*A,3*A,4*A,5*A,b] ∨
        (List.ofFn v).Perm [A,3*A,4*A,5*A,9*A,b])) ∨
      HigherTriangleConsequences.SixThird (List.ofFn v) := by
  obtain ⟨σ, hσ, p, kind, hE⟩ := hcritical
  fin_cases kind
  · obtain ⟨A, b, hA, hb, hperm⟩ :=
      ProductPlaneSpeeds.product_parameters_of_positive_direction
        (productBase 0) 0 (productBase_first 0) E
        (signed_product_of_kind 0 E σ hσ p hE) v hpositive hv
    refine Or.inl ⟨A, b, hA, hb, Or.inl ?_⟩
    simpa [ProductFamily.speeds, productBase, mul_comm] using hperm
  · obtain ⟨A, b, hA, hb, hperm⟩ :=
      ProductPlaneSpeeds.product_parameters_of_positive_direction
        (productBase 1) 0 (productBase_first 1) E
        (signed_product_of_kind 1 E σ hσ p hE) v hpositive hv
    refine Or.inl ⟨A, b, hA, hb, Or.inr ?_⟩
    simpa [ProductFamily.speeds, productBase, mul_comm] using hperm
  · exact Or.inr (third_of_signed_plane E σ hσ p hE v hv)

theorem literal_family_of_mem_critical_plane
    (E : Submodule ℚ (Fin 6 → ℚ)) (hcritical : CriticalPlane E)
    (v : Fin 6 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hv : (fun i => (v i : ℚ)) ∈ E) :
    HigherTriangleConsequences.SixProduct (List.ofFn v) ∨
      HigherTriangleConsequences.SixThird (List.ofFn v) := by
  rcases literal_parameters_of_mem_critical_plane E hcritical v hpositive hv with
    ⟨A, b, hA, _hb, hperm⟩ | hthird
  · exact Or.inl ⟨A, b, hA, hperm⟩
  · exact Or.inr hthird

/-- Primitivity and actual loneliness below one sixth force the product
scale to one and the free speed to a positive multiple of six. -/
theorem primitive_family_of_mem_critical_plane
    (E : Submodule ℚ (Fin 6 → ℚ)) (hcritical : CriticalPlane E)
    (v : Fin 6 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hv : (fun i => (v i : ℚ)) ∈ E)
    (hprimitive : Normalization.gcd (List.ofFn v) = 1)
    (hbelow : value (List.ofFn v) < (1 / 6 : ℝ)) :
    (∃ s : ℕ, 1 ≤ s ∧ (List.ofFn v).Perm [1,2,3,4,5,6*s]) ∨
      (∃ s : ℕ, 1 ≤ s ∧ (List.ofFn v).Perm [1,3,4,5,9,6*s]) ∨
      HigherTriangleConsequences.SixThird (List.ofFn v) := by
  obtain ⟨σ, hσ, p, kind, hE⟩ := hcritical
  fin_cases kind
  · obtain ⟨s, hs, hperm⟩ := ProductPlaneSpeeds.primitive_family_of_below
      (productBase 0) 0 (productBase_first 0) 6 (by decide)
      (productBase_gcd 0) (productBase_residues 0) E
      (signed_product_of_kind 0 E σ hσ p hE) v hpositive hv hprimitive hbelow
    refine Or.inl ⟨s, hs, ?_⟩
    simpa only [productBase_zero, List.cons_append, List.nil_append] using hperm
  · obtain ⟨s, hs, hperm⟩ := ProductPlaneSpeeds.primitive_family_of_below
      (productBase 1) 0 (productBase_first 1) 6 (by decide)
      (productBase_gcd 1) (productBase_residues 1) E
      (signed_product_of_kind 1 E σ hσ p hE) v hpositive hv hprimitive hbelow
    refine Or.inr (Or.inl ⟨s, hs, ?_⟩)
    simpa only [productBase_one, List.cons_append, List.nil_append] using hperm
  · exact Or.inr (Or.inr (third_of_signed_plane E σ hσ p hE v hv))

/-- This is exactly the geometric off-critical premise needed by the norm
argument, obtained from exclusion of the original literal family predicates. -/
theorem not_mem_critical_plane_of_not_literal_families
    (v : Fin 6 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hnot : ¬ (HigherTriangleConsequences.SixProduct (List.ofFn v) ∨
      HigherTriangleConsequences.SixThird (List.ofFn v))) :
    ∀ E : Submodule ℚ (Fin 6 → ℚ), CriticalPlane E →
      (fun i => (v i : ℚ)) ∉ E := by
  intro E hcritical hv
  exact hnot (literal_family_of_mem_critical_plane E hcritical v hpositive hv)

end

end Loneliness.SixPlane
