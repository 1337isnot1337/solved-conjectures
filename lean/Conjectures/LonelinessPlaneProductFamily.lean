import Conjectures.LonelinessProductSpectrum

/-! Integer directions in a critical product plane contain a critical
quadruple. This records the structural conclusion before evaluating the
loneliness value, so it also applies to the nonfamily tuple classification. -/

namespace Loneliness.CriticalFamilies

theorem containsCriticalQuadruple_of_subset {ds es : List ℕ}
    (hsub : ds ⊆ es) (h : ContainsCriticalQuadruple ds) :
    ContainsCriticalQuadruple es := by
  obtain ⟨d, hd, h | h⟩ := h
  · exact ⟨d, hd, Or.inl (fun _ ha => hsub (h ha))⟩
  · exact ⟨d, hd, Or.inr (fun _ ha => hsub (h ha))⟩

theorem containsCriticalQuadruple_iff_of_mem {ds es : List ℕ}
    (hmem : ∀ a, a ∈ ds ↔ a ∈ es) :
    ContainsCriticalQuadruple ds ↔ ContainsCriticalQuadruple es :=
  ⟨containsCriticalQuadruple_of_subset (fun a ha => (hmem a).mp ha),
    containsCriticalQuadruple_of_subset (fun a ha => (hmem a).mpr ha)⟩

end Loneliness.CriticalFamilies

namespace Loneliness.PlaneCertificate

noncomputable section

open CoordinateSubspace

theorem critical_quadruple_in_critical_product
    (E : Submodule ℚ (Fin 5 → ℚ)) (hproduct : CriticalProductPlane E)
    (w : Vector) (hwE : (fun k => (w k : ℚ)) ∈ E)
    (hwzero : ∀ k, w k ≠ 0) :
    CriticalFamilies.ContainsCriticalQuadruple (integerSpeeds w) := by
  obtain ⟨σ, hσ, π, i, free, hbase, hE⟩ := hproduct
  let v : Vector := signedCoordinates ℤ σ hσ π w
  have hvzero : ∀ k, v k ≠ 0 := by
    intro k
    rcases hσ k with h | h <;> simpa [v, h] using hwzero (π k)
  have hcast : signedCoordinates ℚ σ hσ π (fun k => (w k : ℚ)) =
      fun k => (v k : ℚ) := by
    ext k
    simp [v]
  have hvE : (fun k => (v k : ℚ)) ∈
      Submodule.span ℚ {(fun k => (canonical i k : ℚ)), coordinateAxis free} := by
    rw [← hE]
    exact Submodule.mem_map.mpr ⟨_, hwE, hcast⟩
  have hcrit := critical_quadruple_in_coordinate_product (canonical i) free
    (canonical_positive i) hbase v hvzero hvE
  apply CriticalFamilies.containsCriticalQuadruple_of_subset (ds := absoluteCoordinates v)
    ?_ hcrit
  intro a ha
  have hv : a ∈ integerSpeeds v := by
    simpa only [absoluteCoordinates, List.mem_ofFn, mem_integerSpeeds] using ha
  exact (integerSpeeds_signedCoordinates σ hσ π w).mem_iff.mp hv

end

end Loneliness.PlaneCertificate
