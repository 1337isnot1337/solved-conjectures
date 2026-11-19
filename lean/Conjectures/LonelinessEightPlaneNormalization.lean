import Conjectures.LonelinessEightPlaneCriticalNormalization
import Conjectures.LonelinessEightPlaneGeometry

/-! Normalize an actual low-value rational plane to one positive canonical
direction and one signed permutation represented by the finite checker. -/

namespace Loneliness.EightPlane

noncomputable section

open CoordinateSubspace

theorem knownShape_signedCoordinates (σ : Fin 8 → ℤ)
    (hσ : ∀ i, σ i = 1 ∨ σ i = -1) (p : Equiv.Perm (Fin 8))
    (w : Vector) (hcrit : KnownShape w) :
    KnownShape (signedCoordinates ℤ σ hσ p w) := by
  obtain ⟨family, d, hd, hsub, hcover⟩ := hcrit
  refine ⟨family, d, hd, ?_, ?_⟩
  · intro i
    rw [natAbs_signedCoordinates]
    exact hsub (p i)
  · intro a ha
    obtain ⟨i, hi⟩ := hcover a ha
    refine ⟨p.symm i, ?_⟩
    rw [natAbs_signedCoordinates, Equiv.apply_symm_apply]
    exact hi

theorem positive_candidate_normalization (w : Vector) (hwzero : ∀ i, w i ≠ 0)
    (hcrit : KnownShape w) :
    ∃ (d : ℕ) (δ : ℤ) (family : Fin 3) (repeatIndex : Fin 7) (z : Vector),
      1 ≤ d ∧ (δ = 1 ∨ δ = -1) ∧ 0 < z 0 ∧
      ((List.ofFn z).map Int.natAbs).Perm
        (baseList family ++ [base family repeatIndex]) ∧
      ∀ i, w i = (d : ℤ) * δ * z i := by
  obtain ⟨d, family, repeatIndex, p, σ, hd, hσ, hwnormal⟩ :=
    critical_direction_normalization w hwzero hcrit
  let δ : ℤ := σ 0
  let z : Vector := fun i => δ * σ i * canonical family repeatIndex (p i)
  have hzabs (i : Fin 8) : (z i).natAbs = (canonical family repeatIndex (p i)).natAbs := by
    rcases hσ 0 with hzero | hzero <;> rcases hσ i with hi | hi <;> simp [z, δ, hzero, hi]
  have hzpositive : 0 < z 0 := by
    have hz : z 0 = canonical family repeatIndex (p 0) := by
      rcases hσ 0 with h | h <;> simp [z, δ, h]
    rw [hz]
    exact canonical_positive family repeatIndex (p 0)
  have hperm : ((List.ofFn z).map Int.natAbs).Perm
      (baseList family ++ [base family repeatIndex]) := by
    simp only [List.map_ofFn, Function.comp_def]
    have habs : (fun i => (z i).natAbs) =
        fun i => (canonical family repeatIndex (p i)).natAbs := funext hzabs
    rw [habs]
    have h := p.ofFn_comp_perm (fun i => (canonical family repeatIndex i).natAbs)
    simpa only [Function.comp_def, canonical_absolute_list] using h
  refine ⟨d, δ, family, repeatIndex, z, hd, hσ 0, hzpositive, hperm, ?_⟩
  intro i
  rw [hwnormal i]
  rcases hσ 0 with h | h <;> simp [δ, z, h, mul_assoc]

theorem mem_of_nonzero_smul_mem (E : Submodule ℚ (Fin 8 → ℚ))
    (v : Fin 8 → ℚ) (a : ℚ) (ha : a ≠ 0) (hv : a • v ∈ E) : v ∈ E := by
  have h := E.smul_mem a⁻¹ hv
  simpa [smul_smul, ha] using h

theorem normalized_low_plane (hsix : LonelyRunnerBound 6)
    (hseven : SevenLowGapInput.SevenSpeedGap)
    (E : Submodule ℚ (Fin 8 → ℚ)) (hfree : CoordinateFree E)
    (hdim : Module.finrank ℚ E = 2)
    (hbelow : SubspaceDensity.spaceValue (realSpan E) < (3 / 23 : ℝ)) :
    ∃ (σ : Fin 8 → ℤ) (hσ : ∀ i, σ i = 1 ∨ σ i = -1)
      (π : Equiv.Perm (Fin 8)) (family secondFamily : Fin 3)
      (repeatIndex secondRepeat : Fin 7) (z : Vector),
      E.map (signedCoordinates ℚ σ hσ π).toLinearMap =
        spanPair (canonical family repeatIndex) z ∧
      0 < z 0 ∧
      ((List.ofFn z).map Int.natAbs).Perm
        (baseList secondFamily ++ [base secondFamily secondRepeat]) ∧
      SubspaceDensity.spaceValue (realSpan (spanPair (canonical family repeatIndex) z)) <
        (3 / 23 : ℝ) := by
  obtain ⟨q, w, hqE, hwE, hqzero, hwzero, hqcrit, hwcrit, _hpair, hspan⟩ :=
    two_critical_integer_directions hsix hseven E hfree hdim hbelow
  obtain ⟨dq, family, repeatIndex, π, τ, hdq, hτ, hqnormal⟩ :=
    critical_direction_normalization q hqzero hqcrit
  let σ : Fin 8 → ℤ := fun k => τ (π.symm k)
  have hσ : ∀ k, σ k = 1 ∨ σ k = -1 := fun k => hτ (π.symm k)
  let T := signedCoordinates ℚ σ hσ π.symm
  let F := E.map T.toLinearMap
  let w' : Vector := signedCoordinates ℤ σ hσ π.symm w
  have hw'zero : ∀ k, w' k ≠ 0 := by
    intro k
    rcases hσ k with h | h <;> simpa [w', h] using hwzero (π.symm k)
  have hw'crit : KnownShape w' := knownShape_signedCoordinates σ hσ π.symm w hwcrit
  obtain ⟨dw, δ, secondFamily, secondRepeat, z, hdw, hδ, hzpositive, hzperm, hwnormal⟩ :=
    positive_candidate_normalization w' hw'zero hw'crit
  have hqT : T (fun k => (q k : ℚ)) =
      (dq : ℚ) • (fun k => (canonical family repeatIndex k : ℚ)) := by
    ext k
    simp only [T, signedCoordinates_apply, Pi.smul_apply, smul_eq_mul]
    rw [hqnormal (π.symm k)]
    simp only [Int.cast_mul, Int.cast_natCast, Equiv.apply_symm_apply]
    rcases hτ (π.symm k) with h | h <;> simp [σ, h]
  have hwT : T (fun k => (w k : ℚ)) =
      ((dw : ℚ) * (δ : ℚ)) • (fun k => (z k : ℚ)) := by
    ext k
    have h := congrArg (fun a : ℤ => (a : ℚ)) (hwnormal k)
    simpa [w', T, Pi.smul_apply, smul_eq_mul] using h
  have hdqne : (dq : ℚ) ≠ 0 := by exact_mod_cast (show dq ≠ 0 by omega)
  have hdwne : (dw : ℚ) ≠ 0 := by exact_mod_cast (show dw ≠ 0 by omega)
  have hδne : (δ : ℚ) ≠ 0 := by rcases hδ with h | h <;> simp [h]
  have hqF : (fun k => (canonical family repeatIndex k : ℚ)) ∈ F := by
    apply mem_of_nonzero_smul_mem F _ (dq : ℚ) hdqne
    rw [← hqT]
    exact Submodule.mem_map.mpr ⟨_, hqE, rfl⟩
  have hzF : (fun k => (z k : ℚ)) ∈ F := by
    apply mem_of_nonzero_smul_mem F _ ((dw : ℚ) * (δ : ℚ)) (mul_ne_zero hdwne hδne)
    rw [← hwT]
    exact Submodule.mem_map.mpr ⟨_, hwE, rfl⟩
  have hFeq : F = spanPair (canonical family repeatIndex) z := by
    apply le_antisymm
    · change E.map T.toLinearMap ≤ _
      rw [← hspan, Submodule.map_span]
      apply Submodule.span_le.mpr
      rintro v ⟨u, hu, rfl⟩
      rcases hu with rfl | hu
      · change T (fun k => (q k : ℚ)) ∈ spanPair (canonical family repeatIndex) z
        rw [hqT]
        exact Submodule.smul_mem _ _ (Submodule.subset_span (by simp))
      · rw [Set.mem_singleton_iff] at hu
        rw [hu]
        change T (fun k => (w k : ℚ)) ∈ spanPair (canonical family repeatIndex) z
        rw [hwT]
        exact Submodule.smul_mem _ _ (Submodule.subset_span (by simp))
    · exact Submodule.span_le.mpr (Set.insert_subset_iff.mpr ⟨hqF, Set.singleton_subset_iff.mpr hzF⟩)
  refine ⟨σ, hσ, π.symm, family, secondFamily, repeatIndex, secondRepeat, z,
    hFeq, hzpositive, hzperm, ?_⟩
  rw [← hFeq]
  change SubspaceDensity.spaceValue
    (realSpan (E.map (signedCoordinates ℚ σ hσ π.symm).toLinearMap)) < _
  rw [spaceValue_realSpan_signedCoordinates]
  exact hbelow

end

end Loneliness.EightPlane

