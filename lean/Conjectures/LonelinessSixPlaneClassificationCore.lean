import Conjectures.LonelinessSixPlaneCertificateSoundness

/-! The exact semantic implication from complete finite pair certificates to
the six-coordinate plane classification. The finite coverage and the precise
five-speed low-gap classification are explicit theorem inputs. -/

namespace Loneliness.SixPlane

noncomputable section

open CoordinateSubspace

theorem critical_plane_of_low_value_of_checked (hchecked : CandidatePairsChecked)
    (hfour : LonelyRunnerBound 4) (hfive : FiveSpeedGap)
    (E : Submodule ℚ (Fin 6 → ℚ)) (hfree : CoordinateFree E)
    (hdim : Module.finrank ℚ E = 2)
    (hbelow : SubspaceDensity.spaceValue (realSpan E) < (2 / 11 : ℝ)) :
    CriticalPlane E := by
  obtain ⟨σ, hσ, π, i, j, p, mask, hE, hvalue⟩ :=
    normalized_low_plane hfour hfive E hfree hdim hbelow
  have hdim' : Module.finrank ℚ (canonicalPlane i j p mask) = 2 := by
    rw [← hE, LinearEquiv.finrank_map_eq, hdim]
  have hfree' : CoordinateFree (canonicalPlane i j p mask) := by
    rw [← hE]
    exact coordinateFree_signedCoordinates ℚ σ hσ π E hfree
  obtain ⟨certificate, hcertificate⟩ := hchecked i j p mask
  have hcritical := certificateCheck_sound hfour hfive (canonical i) (candidate j p mask)
    hfree' hdim' hvalue certificate hcertificate
  apply criticalPlane_of_signedCoordinates E σ hσ π
  rw [hE]
  exact hcritical

end

end Loneliness.SixPlane
