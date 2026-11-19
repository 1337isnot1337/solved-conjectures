import Conjectures.LonelinessCriticalNormalization
import Conjectures.LonelinessSignedCoordinates

/-! Complete reduction of low-value rational planes to the finite canonical
pattern pairs. Only the explicitly stated four-speed gap is used. -/

namespace Loneliness.PlaneCertificate

noncomputable section

open CoordinateSubspace

theorem bool_signs_coverage : ∀ b : Fin 5 → Bool, b 0 = true →
    ∃ mask : Fin 16, ∀ i, signs mask i = if b i then (1 : ℤ) else -1 := by
  decide +kernel

theorem signs_coverage (σ : Fin 5 → ℤ)
    (hσ : ∀ i, σ i = 1 ∨ σ i = -1) (hzero : σ 0 = 1) :
    ∃ mask : Fin 16, ∀ i, signs mask i = σ i := by
  obtain ⟨mask, hmask⟩ := bool_signs_coverage (fun i => decide (σ i = 1)) (by simp [hzero])
  refine ⟨mask, ?_⟩
  intro i
  rw [hmask i]
  rcases hσ i with h | h <;> simp [h]

theorem critical_direction_candidate (w : Vector) (hwzero : ∀ i, w i ≠ 0)
    (hcrit : CriticalIntegerDirection w) :
    ∃ (d : ℕ) (δ : ℤ) (j : Fin 8) (p : Equiv.Perm (Fin 5)) (mask : Fin 16),
      1 ≤ d ∧ (δ = 1 ∨ δ = -1) ∧
      ∀ i, w i = (d : ℤ) * δ * candidate j p mask i := by
  obtain ⟨d, j, p, σ, hd, hσ, hw⟩ := critical_direction_normalization w hwzero hcrit
  have hτ : ∀ i, σ 0 * σ i = 1 ∨ σ 0 * σ i = -1 := by
    intro i
    rcases hσ 0 with h0 | h0 <;> rcases hσ i with hi | hi <;> simp [h0, hi]
  have hτzero : σ 0 * σ 0 = 1 := by rcases hσ 0 with h | h <;> simp [h]
  obtain ⟨mask, hmask⟩ := signs_coverage (fun i => σ 0 * σ i) hτ hτzero
  refine ⟨d, σ 0, j, p, mask, hd, hσ 0, ?_⟩
  intro i
  rw [hw i, candidate, hmask i]
  rcases hσ 0 with h | h <;> simp [h, mul_assoc]

theorem critical_signedCoordinates (σ : Fin 5 → ℤ)
    (hσ : ∀ i, σ i = 1 ∨ σ i = -1) (p : Equiv.Perm (Fin 5))
    (w : Vector) (hcrit : CriticalIntegerDirection w) :
    CriticalIntegerDirection (signedCoordinates ℤ σ hσ p w) := by
  obtain ⟨d, hd, hperm⟩ := hcrit
  refine ⟨d, hd, ?_⟩
  rcases hperm with hperm | hperm
  · exact Or.inl ((integerSpeeds_signedCoordinates σ hσ p w).trans hperm)
  · exact Or.inr ((integerSpeeds_signedCoordinates σ hσ p w).trans hperm)

def canonicalPlane (i j : Fin 8) (p : Equiv.Perm (Fin 5)) (mask : Fin 16) :
    Submodule ℚ (Fin 5 → ℚ) :=
  Submodule.span ℚ {(fun k => (canonical i k : ℚ)), (fun k => (candidate j p mask k : ℚ))}

theorem mem_of_nonzero_smul_mem (E : Submodule ℚ (Fin 5 → ℚ))
    (v : Fin 5 → ℚ) (a : ℚ) (ha : a ≠ 0) (hv : a • v ∈ E) : v ∈ E := by
  have h := E.smul_mem a⁻¹ hv
  simpa [smul_smul, ha] using h

theorem normalized_low_plane (hgap : FourSpeedGap)
    (E : Submodule ℚ (Fin 5 → ℚ)) (hfree : CoordinateFree E)
    (hdim : Module.finrank ℚ E = 2)
    (hbelow : SubspaceDensity.spaceValue (realSpan E) < (2 / 9 : ℝ)) :
    ∃ (σ : Fin 5 → ℤ) (hσ : ∀ i, σ i = 1 ∨ σ i = -1)
      (π : Equiv.Perm (Fin 5)) (i j : Fin 8) (p : Equiv.Perm (Fin 5)) (mask : Fin 16),
      E.map (signedCoordinates ℚ σ hσ π).toLinearMap = canonicalPlane i j p mask ∧
      SubspaceDensity.spaceValue (realSpan (canonicalPlane i j p mask)) < (2 / 9 : ℝ) := by
  obtain ⟨q, w, hqE, hwE, hqzero, hwzero, hqcrit, hwcrit, hpair, hspan⟩ :=
    two_critical_integer_directions hgap E hfree hdim hbelow
  obtain ⟨dq, i, π, τ, hdq, hτ, hqnormal⟩ := critical_direction_normalization q hqzero hqcrit
  let σ : Fin 5 → ℤ := fun k => τ (π.symm k)
  have hσ : ∀ k, σ k = 1 ∨ σ k = -1 := fun k => hτ (π.symm k)
  let T := signedCoordinates ℚ σ hσ π.symm
  let F := E.map T.toLinearMap
  let w' : Vector := signedCoordinates ℤ σ hσ π.symm w
  have hw'zero : ∀ k, w' k ≠ 0 := by
    intro k
    rcases hσ k with h | h <;> simpa [w', h] using hwzero (π.symm k)
  have hw'crit : CriticalIntegerDirection w' := critical_signedCoordinates σ hσ π.symm w hwcrit
  obtain ⟨dw, δ, j, p, mask, hdw, hδ, hwnormal⟩ := critical_direction_candidate w' hw'zero hw'crit
  have hqT : T (fun k => (q k : ℚ)) = (dq : ℚ) • (fun k => (canonical i k : ℚ)) := by
    ext k
    simp only [T, signedCoordinates_apply, Pi.smul_apply, smul_eq_mul]
    rw [hqnormal (π.symm k)]
    simp only [Int.cast_mul, Int.cast_natCast, Equiv.apply_symm_apply]
    rcases hτ (π.symm k) with h | h <;> simp [σ, h]
  have hwT : T (fun k => (w k : ℚ)) =
      ((dw : ℚ) * (δ : ℚ)) • (fun k => (candidate j p mask k : ℚ)) := by
    ext k
    have h := congrArg (fun z : ℤ => (z : ℚ)) (hwnormal k)
    simpa [w', T, Pi.smul_apply, smul_eq_mul] using h
  have hdqne : (dq : ℚ) ≠ 0 := by exact_mod_cast (show dq ≠ 0 by omega)
  have hdwne : (dw : ℚ) ≠ 0 := by exact_mod_cast (show dw ≠ 0 by omega)
  have hδne : (δ : ℚ) ≠ 0 := by rcases hδ with h | h <;> simp [h]
  have hqF : (fun k => (canonical i k : ℚ)) ∈ F := by
    apply mem_of_nonzero_smul_mem F _ (dq : ℚ) hdqne
    rw [← hqT]
    exact Submodule.mem_map.mpr ⟨_, hqE, rfl⟩
  have hcF : (fun k => (candidate j p mask k : ℚ)) ∈ F := by
    apply mem_of_nonzero_smul_mem F _ ((dw : ℚ) * (δ : ℚ)) (mul_ne_zero hdwne hδne)
    rw [← hwT]
    exact Submodule.mem_map.mpr ⟨_, hwE, rfl⟩
  have hFeq : F = canonicalPlane i j p mask := by
    apply le_antisymm
    · change E.map T.toLinearMap ≤ _
      rw [← hspan, Submodule.map_span]
      apply Submodule.span_le.mpr
      rintro v ⟨u, hu, rfl⟩
      rcases hu with rfl | hu
      · change T (fun k => (q k : ℚ)) ∈ canonicalPlane i j p mask
        rw [hqT]
        exact Submodule.smul_mem _ _ (Submodule.subset_span (by simp [canonicalPlane]))
      · rw [Set.mem_singleton_iff] at hu
        rw [hu]
        change T (fun k => (w k : ℚ)) ∈ canonicalPlane i j p mask
        rw [hwT]
        exact Submodule.smul_mem _ _ (Submodule.subset_span (by simp [canonicalPlane]))
    · exact Submodule.span_le.mpr (Set.insert_subset_iff.mpr ⟨hqF, Set.singleton_subset_iff.mpr hcF⟩)
  refine ⟨σ, hσ, π.symm, i, j, p, mask, hFeq, ?_⟩
  rw [← hFeq]
  change SubspaceDensity.spaceValue
    (realSpan (E.map (signedCoordinates ℚ σ hσ π.symm).toLinearMap)) < _
  rw [spaceValue_realSpan_signedCoordinates]
  exact hbelow

end

end Loneliness.PlaneCertificate
