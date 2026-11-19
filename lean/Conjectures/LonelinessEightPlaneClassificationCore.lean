import Conjectures.LonelinessEightPlaneNormalization
import Conjectures.LonelinessEightPlaneAdmissibility

/-! The eight-coordinate plane gap follows from complete finite pair
coverage and the explicitly stated six- and seven-speed inputs. -/

namespace Loneliness.EightPlane

noncomputable section

open CoordinateSubspace

theorem product_plane_of_low_value_of_checked (hchecked : CandidatePairsChecked)
    (hsix : LonelyRunnerBound 6) (hseven : SevenLowGapInput.SevenSpeedGap)
    (E : Submodule ℚ (Fin 8 → ℚ)) (hfree : CoordinateFree E)
    (hdim : Module.finrank ℚ E = 2)
    (hbelow : SubspaceDensity.spaceValue (realSpan E) < (3 / 23 : ℝ)) :
    ProductPlane E := by
  obtain ⟨σ, hσ, π, family, secondFamily, repeatIndex, secondRepeat, z,
      hE, hzpositive, hzperm, hvalue⟩ :=
    normalized_low_plane hsix hseven E hfree hdim hbelow
  have hdim' : Module.finrank ℚ (spanPair (canonical family repeatIndex) z) = 2 := by
    rw [← hE, LinearEquiv.finrank_map_eq, hdim]
  have hfree' : CoordinateFree (spanPair (canonical family repeatIndex) z) := by
    rw [← hE]
    exact coordinateFree_signedCoordinates ℚ σ hσ π E hfree
  have htests := repeatTests_of_low_plane hsix hseven
    (canonical family repeatIndex) z hfree' hdim' hvalue
  have hproduct := productCheck_sound family repeatIndex z hdim'
    (hchecked family secondFamily repeatIndex secondRepeat z hzpositive hzperm htests)
  apply productPlane_of_signedCoordinates E σ hσ π
  rw [hE]
  exact hproduct

theorem nonproduct_value_ge_three_twenty_thirds_of_checked
    (hchecked : CandidatePairsChecked)
    (hsix : LonelyRunnerBound 6) (hseven : SevenLowGapInput.SevenSpeedGap)
    (E : Submodule ℚ (Fin 8 → ℚ)) (hfree : CoordinateFree E)
    (hdim : Module.finrank ℚ E = 2) (hnot : ¬ProductPlane E) :
    (3 / 23 : ℝ) ≤ SubspaceDensity.spaceValue (realSpan E) := by
  by_contra hbelow
  exact hnot (product_plane_of_low_value_of_checked hchecked hsix hseven E hfree hdim
    (lt_of_not_ge hbelow))

end

end Loneliness.EightPlane

