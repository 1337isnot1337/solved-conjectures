import Conjectures.LonelinessSixPlaneNormalization

/-! A finite acceptance certificate identifies the actual rational plane with
one of the three literal critical planes, up to signed coordinate permutation. -/

namespace Loneliness.SixPlane

noncomputable section

open CoordinateSubspace

def standardPlane (kind : Fin 3) : Submodule ℚ (Fin 6 → ℚ) :=
  Submodule.span ℚ {standard kind (1 : ℚ) 0, standard kind (0 : ℚ) 1}

def CriticalPlane (E : Submodule ℚ (Fin 6 → ℚ)) : Prop :=
  ∃ (σ : Fin 6 → ℤ) (hσ : ∀ i, σ i = 1 ∨ σ i = -1)
    (p : Equiv.Perm (Fin 6)) (kind : Fin 3),
    E.map (signedCoordinates ℚ σ hσ p).toLinearMap = standardPlane kind

theorem standard_linear_combination (kind : Fin 3) (s t : ℚ) :
    standard kind s t = s • standard kind (1 : ℚ) 0 + t • standard kind (0 : ℚ) 1 := by
  fin_cases kind <;> ext i <;> fin_cases i <;> simp [standard] <;> ring

theorem standard_cast (kind : Fin 3) (s t : ℤ) :
    (fun i => (standard kind s t i : ℚ)) = standard kind (s : ℚ) (t : ℚ) := by
  fin_cases kind <;> ext i <;> fin_cases i <;> simp [standard]

theorem standard_mem (kind : Fin 3) (s t : ℚ) :
    standard kind s t ∈ standardPlane kind := by
  rw [standard_linear_combination]
  exact Submodule.add_mem _
    (Submodule.smul_mem _ _ (Submodule.subset_span (by simp [standardPlane])))
    (Submodule.smul_mem _ _ (Submodule.subset_span (by simp [standardPlane])))

theorem standardPlane_finrank_le_two (kind : Fin 3) :
    Module.finrank ℚ (standardPlane kind) ≤ 2 := by
  have hne : standard kind (1 : ℚ) 0 ≠ standard kind (0 : ℚ) 1 := by
    intro h
    have hzero := congrFun h 0
    fin_cases kind <;> norm_num [standard] at hzero
  calc
    _ ≤ ({standard kind (1 : ℚ) 0, standard kind (0 : ℚ) 1} :
        Set (Fin 6 → ℚ)).ncard := finrank_span_le_ncard _ (by simp)
    _ = 2 := Set.ncard_pair hne

theorem literalTest_sound (kind : Fin 3) (w : Vector)
    (h : literalTest kind w = true) :
    w = standard kind (w 0) (if kind = 2 then w 1 else w 5) := by
  simp only [literalTest, List.all_eq_true, beq_iff_eq] at h
  funext i
  exact h i (by simp)

theorem literalTest_mem_standardPlane (kind : Fin 3) (w : Vector)
    (h : literalTest kind w = true) :
    (fun i => (w i : ℚ)) ∈ standardPlane kind := by
  have heq := congrArg (fun u : Vector => fun i => (u i : ℚ))
    (literalTest_sound kind w h)
  rw [standard_cast] at heq
  rw [heq]
  exact standard_mem _ _ _

theorem fullSigns_spec (mask : Fin 64) (i : Fin 6) :
    fullSigns mask i = 1 ∨ fullSigns mask i = -1 := by
  simp only [fullSigns]
  split <;> simp

theorem acceptanceCheck_sound (q c : Vector) (r : Acceptance)
    (hdim : Module.finrank ℚ
      (Submodule.span ℚ {(fun i => (q i : ℚ)), (fun i => (c i : ℚ))}) = 2)
    (h : acceptanceCheck q c r = true) :
    CriticalPlane (Submodule.span ℚ {(fun i => (q i : ℚ)), (fun i => (c i : ℚ))}) := by
  have hparts : literalTest r.kind (r.transform q) = true ∧
      literalTest r.kind (r.transform c) = true := by
    simpa only [acceptanceCheck, Bool.and_eq_true] using h
  let T := signedCoordinates ℚ (fullSigns r.mask) (fullSigns_spec r.mask) r.permutation
  have hq : T (fun i => (q i : ℚ)) ∈ standardPlane r.kind := by
    simpa [T, Acceptance.transform] using
      literalTest_mem_standardPlane r.kind (r.transform q) hparts.1
  have hc : T (fun i => (c i : ℚ)) ∈ standardPlane r.kind := by
    simpa [T, Acceptance.transform] using
      literalTest_mem_standardPlane r.kind (r.transform c) hparts.2
  have hle : (Submodule.span ℚ {(fun i => (q i : ℚ)), (fun i => (c i : ℚ))}).map
      T.toLinearMap ≤ standardPlane r.kind := by
    rw [Submodule.map_span]
    apply Submodule.span_le.mpr
    rintro v ⟨u, hu, rfl⟩
    rcases hu with rfl | hu
    · exact hq
    · rw [Set.mem_singleton_iff] at hu
      simpa only [hu] using hc
  refine ⟨fullSigns r.mask, fullSigns_spec r.mask, r.permutation, r.kind, ?_⟩
  apply Submodule.eq_of_le_of_finrank_le hle
  rw [LinearEquiv.finrank_map_eq, hdim]
  exact standardPlane_finrank_le_two r.kind

theorem criticalPlane_of_signedCoordinates (E : Submodule ℚ (Fin 6 → ℚ))
    (σ : Fin 6 → ℤ) (hσ : ∀ i, σ i = 1 ∨ σ i = -1)
    (p : Equiv.Perm (Fin 6))
    (h : CriticalPlane (E.map (signedCoordinates ℚ σ hσ p).toLinearMap)) :
    CriticalPlane E := by
  obtain ⟨τ, hτ, ρ, kind, heq⟩ := h
  let ν : Fin 6 → ℤ := fun i => τ i * σ (ρ i)
  have hν : ∀ i, ν i = 1 ∨ ν i = -1 := by
    intro i
    rcases hτ i with ht | ht <;> rcases hσ (ρ i) with hs | hs <;> simp [ν, ht, hs]
  have hcomp : (signedCoordinates ℚ τ hτ ρ).toLinearMap.comp
      (signedCoordinates ℚ σ hσ p).toLinearMap =
      (signedCoordinates ℚ ν hν (ρ.trans p)).toLinearMap := by
    ext x i
    change (τ i : ℚ) * ((σ (ρ i) : ℚ) * x (p (ρ i))) =
      ((τ i * σ (ρ i) : ℤ) : ℚ) * x (p (ρ i))
    rw [Int.cast_mul, mul_assoc]
  refine ⟨ν, hν, ρ.trans p, kind, ?_⟩
  rw [Submodule.map_map, hcomp] at heq
  exact heq

end

end Loneliness.SixPlane
