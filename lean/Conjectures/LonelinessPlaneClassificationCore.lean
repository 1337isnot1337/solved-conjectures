import Conjectures.LonelinessPlaneProduct

/-! The semantic composition of the critical-plane classification. The finite
Boolean coverage statement remains an explicit input in this module. The final
classification module supplies it from all 64 kernel-checked blocks. -/

namespace Loneliness.PlaneCertificate

noncomputable section

open CoordinateSubspace

def CandidatePairsChecked : Prop :=
  ∀ (i j : Fin 8) (p : Equiv.Perm (Fin 5)) (mask : Fin 16),
    pairTest (canonical i) (candidate j p mask) = true

theorem critical_product_of_low_value_of_checked (hchecked : CandidatePairsChecked)
    (hgap : FourSpeedGap)
    (E : Submodule ℚ (Fin 5 → ℚ)) (hfree : CoordinateFree E)
    (hdim : Module.finrank ℚ E = 2)
    (hbelow : SubspaceDensity.spaceValue (realSpan E) < (2 / 9 : ℝ)) :
    CriticalProductPlane E := by
  obtain ⟨σ, hσ, π, i, j, p, mask, hE, hvalue⟩ :=
    normalized_low_plane hgap E hfree hdim hbelow
  have hdim' : Module.finrank ℚ (canonicalPlane i j p mask) = 2 := by
    rw [← hE, LinearEquiv.finrank_map_eq, hdim]
  have hq : (fun k => (canonical i k : ℚ)) ∈ canonicalPlane i j p mask :=
    Submodule.subset_span (by simp)
  have hc : (fun k => (candidate j p mask k : ℚ)) ∈ canonicalPlane i j p mask :=
    Submodule.subset_span (by simp)
  have hadmissible := admissibleTest_of_low_plane hgap (canonicalPlane i j p mask)
    (canonical i) (candidate j p mask) hq hc hvalue
  have hproduct : productTest (canonical i) (candidate j p mask) = true := by
    have hcheck := hchecked i j p mask
    simpa [pairTest, hadmissible] using hcheck
  obtain ⟨free, hbase, hspan⟩ := canonical_product_structure i j p mask hdim' hproduct
  exact ⟨σ, hσ, π, i, free, hbase, hE.trans hspan⟩

end

end Loneliness.PlaneCertificate
