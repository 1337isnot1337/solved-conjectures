import Conjectures.LonelinessSixPlaneGeometry
import Conjectures.LonelinessSixPlaneAdmissibility

/-! Soundness of each finite certificate branch. Rejections contradict the
actual dimension, coordinate freedom, or loneliness bound; acceptance gives
one of the three literal planes. No finite data are assumed in this module. -/

namespace Loneliness.SixPlane

noncomputable section

open CoordinateSubspace

theorem sameCoordinate_of_span_equations (q c : Vector) (i j : Fin 6) (ε : ℤ)
    (hε : ε = 1 ∨ ε = -1) (hq : q i = ε * q j) (hc : c i = ε * c j) :
    SameCoordinate
      (Submodule.span ℚ {(fun k => (q k : ℚ)), (fun k => (c k : ℚ))}) i j := by
  have hqQ : (q i : ℚ) = (ε : ℚ) * (q j : ℚ) := by exact_mod_cast hq
  have hcQ : (c i : ℚ) = (ε : ℚ) * (c j : ℚ) := by exact_mod_cast hc
  have hrel (x : Fin 6 → ℚ)
      (hx : x ∈ Submodule.span ℚ {(fun k => (q k : ℚ)), (fun k => (c k : ℚ))}) :
      x i = (ε : ℚ) * x j := by
    obtain ⟨a, b, hab⟩ := Submodule.mem_span_pair.mp hx
    rw [← hab]
    simp only [Pi.add_apply, Pi.smul_apply, smul_eq_mul]
    rw [hqQ, hcQ]
    ring
  rcases hε with rfl | rfl
  · exact Or.inl (by simpa using hrel)
  · exact Or.inr (by simpa using hrel)

theorem dependent_span_finrank_le_one (q c : Vector)
    (hcoeff : ∀ i, c i = c 0 * q i) :
    Module.finrank ℚ
      (Submodule.span ℚ {(fun i => (q i : ℚ)), (fun i => (c i : ℚ))}) ≤ 1 := by
  have hc : (fun i => (c i : ℚ)) = (c 0 : ℚ) • (fun i => (q i : ℚ)) := by
    ext i
    simp only [Pi.smul_apply, smul_eq_mul]
    exact_mod_cast hcoeff i
  have heq : Submodule.span ℚ {(fun i => (q i : ℚ)), (fun i => (c i : ℚ))} =
      Submodule.span ℚ {(fun i => (q i : ℚ))} := by
    apply le_antisymm
    · apply Submodule.span_le.mpr
      refine Set.insert_subset_iff.mpr ⟨Submodule.subset_span (by simp), ?_⟩
      apply Set.singleton_subset_iff.mpr
      rw [hc]
      exact Submodule.smul_mem _ _ (Submodule.subset_span (by simp))
    · apply Submodule.span_le.mpr
      exact Set.singleton_subset_iff.mpr (Submodule.subset_span (by simp))
  rw [heq]
  calc
    _ ≤ ({(fun i => (q i : ℚ))} : Set (Fin 6 → ℚ)).ncard :=
      finrank_span_le_ncard _ (by simp)
    _ = 1 := by simp

theorem rejectionSign_spec (positive : Bool) :
    rejectionSign positive = 1 ∨ rejectionSign positive = -1 := by
  cases positive <;> simp [rejectionSign]

theorem certificateCheck_sound (hfour : LonelyRunnerBound 4) (hfive : FiveSpeedGap)
    (q c : Vector)
    (hfree : CoordinateFree
      (Submodule.span ℚ {(fun i => (q i : ℚ)), (fun i => (c i : ℚ))}))
    (hdim : Module.finrank ℚ
      (Submodule.span ℚ {(fun i => (q i : ℚ)), (fun i => (c i : ℚ))}) = 2)
    (hbelow : SubspaceDensity.spaceValue
      (realSpan (Submodule.span ℚ {(fun i => (q i : ℚ)), (fun i => (c i : ℚ))})) <
        (2 / 11 : ℝ))
    (certificate : PairCertificate) (hcheck : certificateCheck q c certificate = true) :
    CriticalPlane (Submodule.span ℚ {(fun i => (q i : ℚ)), (fun i => (c i : ℚ))}) := by
  cases certificate with
  | dependent =>
    have hcoeff : ∀ i, c i = c 0 * q i := by
      simpa [certificateCheck, List.all_eq_true] using hcheck
    have hle := dependent_span_finrank_le_one q c hcoeff
    omega
  | coordinate i j positive =>
    have hparts : i < j ∧ q i = rejectionSign positive * q j ∧
        c i = rejectionSign positive * c j := by
      simpa [certificateCheck, and_assoc] using hcheck
    have hsame := sameCoordinate_of_span_equations q c i j (rejectionSign positive)
      (rejectionSign_spec positive) hparts.2.1 hparts.2.2
    exact False.elim (no_same_coordinate_of_low_plane hfour _ hfree hdim hbelow i j
      (ne_of_lt hparts.1) hsame)
  | line i j positive =>
    have hparts : i < j ∧ nonzeroTest (repeatedLine q c i j (rejectionSign positive)) = true ∧
        criticalSupportTest (repeatedLine q c i j (rejectionSign positive)) = false := by
      simpa [certificateCheck, and_assoc] using hcheck
    have hgood := lineTest_of_low_plane hfour hfive _ q c
      (Submodule.subset_span (by simp)) (Submodule.subset_span (by simp)) hbelow
      i j (ne_of_lt hparts.1) (rejectionSign positive) (rejectionSign_spec positive)
    simp [lineTest, hparts.2.1, hparts.2.2] at hgood
  | accepted witness =>
    exact acceptanceCheck_sound q c witness hdim hcheck

end

end Loneliness.SixPlane
