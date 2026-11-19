import Conjectures.LonelinessSevenCoordinateNormalization
import Conjectures.LonelinessSignedCoordinates

/-! Signed coordinate normalization of the actual critical plane. The first
generator is exactly `[1,2,3,4,5,6,k]`. The second is a primitive signed
repeat vector with positive first coordinate, so it belongs to the finite
domain used by the plane checker. -/

namespace Loneliness.SevenCoordinateCritical

open CoordinateSubspace SubspaceDensity

noncomputable section

theorem canonicalSigned_signedCoordinates (σ : Fin 7 → ℤ)
    (hσ : ∀ i, σ i = 1 ∨ σ i = -1) (p : Equiv.Perm (Fin 7))
    (w : Vector) (h : CanonicalSignedRepeat w) :
    CanonicalSignedRepeat (signedCoordinates ℤ σ hσ p w) := by
  obtain ⟨k, q, τ, hτ, hw⟩ := h
  refine ⟨k, p.trans q, fun i => σ i * τ (p i), ?_, ?_⟩
  · intro i
    rcases hσ i with hs | hs <;> rcases hτ (p i) with ht | ht <;> simp [hs, ht]
  · intro i
    change σ i * w (p i) = (σ i * τ (p i)) * canonical k (q (p i))
    rw [hw (p i)]
    ring

theorem canonicalSigned_sign_mul (δ : ℤ) (hδ : δ = 1 ∨ δ = -1)
    (w : Vector) (h : CanonicalSignedRepeat w) :
    CanonicalSignedRepeat (fun i => δ * w i) := by
  obtain ⟨k, p, σ, hσ, hw⟩ := h
  refine ⟨k, p, fun i => δ * σ i, ?_, ?_⟩
  · intro i
    rcases hδ with hd | hd <;> rcases hσ i with hs | hs <;> simp [hd, hs]
  · intro i
    change δ * w i = (δ * σ i) * canonical k (p i)
    rw [hw i]
    ring

theorem normalized_low_plane
    (hfive : LonelyRunnerBound 5) (hsix : PrimitiveSixClassification)
    (E : Submodule ℚ (Fin 7 → ℚ)) (hfree : CoordinateFree E)
    (hdim : Module.finrank ℚ E = 2)
    (hlow : spaceValue (realSpan E) ≤ (1 / 7 : ℝ)) :
    ∃ (σ : Fin 7 → ℤ) (hσ : ∀ i, σ i = 1 ∨ σ i = -1)
      (p : Equiv.Perm (Fin 7)) (k : Fin 6) (b : Vector),
      CanonicalSignedRepeat b ∧ 0 < b 0 ∧
      E.map (signedCoordinates ℚ σ hσ p).toLinearMap =
        Submodule.span ℚ {(fun i => (canonical k i : ℚ)), (fun i => (b i : ℚ))} ∧
      CoordinateFree
        (Submodule.span ℚ {(fun i => (canonical k i : ℚ)), (fun i => (b i : ℚ))}) ∧
      Module.finrank ℚ
        (Submodule.span ℚ {(fun i => (canonical k i : ℚ)), (fun i => (b i : ℚ))}) = 2 ∧
      spaceValue (realSpan
        (Submodule.span ℚ {(fun i => (canonical k i : ℚ)), (fun i => (b i : ℚ))})) ≤
          (1 / 7 : ℝ) := by
  obtain ⟨q, w, hqE, hwE, _, _, _, _, hqcrit, hwcrit, _, hspan⟩ :=
    two_primitive_signed_repeat_directions hfive hsix E hfree hdim hlow
  obtain ⟨k, p, τ, hτ, hqnormal⟩ := hqcrit
  let σ : Fin 7 → ℤ := fun i => τ (p.symm i)
  have hσ : ∀ i, σ i = 1 ∨ σ i = -1 := fun i => hτ (p.symm i)
  let T := signedCoordinates ℚ σ hσ p.symm
  let F := E.map T.toLinearMap
  let c : Vector := signedCoordinates ℤ σ hσ p.symm w
  have hc : CanonicalSignedRepeat c :=
    canonicalSigned_signedCoordinates σ hσ p.symm w hwcrit
  have hcne : c 0 ≠ 0 := canonicalSigned_nonzero hc 0
  let δ : ℤ := (c 0).sign
  have hδ : δ = 1 ∨ δ = -1 := by
    rcases lt_or_gt_of_ne hcne with hn | hp
    · exact Or.inr (Int.sign_eq_neg_one_of_neg hn)
    · exact Or.inl (Int.sign_eq_one_of_pos hp)
  let b : Vector := fun i => δ * c i
  have hb : CanonicalSignedRepeat b := canonicalSigned_sign_mul δ hδ c hc
  have hbzero : 0 < b 0 := by
    change 0 < (c 0).sign * c 0
    rw [Int.sign_mul_self_eq_natAbs]
    exact_mod_cast Int.natAbs_pos.mpr hcne
  have hqT : T (fun i => (q i : ℚ)) = (fun i => (canonical k i : ℚ)) := by
    ext i
    simp only [T, signedCoordinates_apply]
    rw [hqnormal (p.symm i)]
    simp only [Int.cast_mul, Equiv.apply_symm_apply]
    rcases hτ (p.symm i) with h | h <;> simp [σ, h]
  have hbT : (fun i => (b i : ℚ)) = (δ : ℚ) • T (fun i => (w i : ℚ)) := by
    ext i
    simp [b, c, T]
  have hwT : T (fun i => (w i : ℚ)) = (δ : ℚ) • (fun i => (b i : ℚ)) := by
    rw [hbT, smul_smul]
    have hδsquare : (δ : ℚ) * δ = 1 := by rcases hδ with h | h <;> simp [h]
    rw [hδsquare, one_smul]
  have hcanonicalF : (fun i => (canonical k i : ℚ)) ∈ F := by
    rw [← hqT]
    exact Submodule.mem_map.mpr ⟨_, hqE, rfl⟩
  have hbF : (fun i => (b i : ℚ)) ∈ F := by
    rw [hbT]
    exact F.smul_mem _ (Submodule.mem_map.mpr ⟨_, hwE, rfl⟩)
  have hFeq : F =
      Submodule.span ℚ {(fun i => (canonical k i : ℚ)), (fun i => (b i : ℚ))} := by
    apply le_antisymm
    · change E.map T.toLinearMap ≤ _
      rw [← hspan, Submodule.map_span]
      apply Submodule.span_le.mpr
      rintro v ⟨u, hu, rfl⟩
      rcases hu with rfl | hu
      · change T (fun i => (q i : ℚ)) ∈ _
        rw [hqT]
        exact Submodule.subset_span (by simp)
      · rw [Set.mem_singleton_iff] at hu
        rw [hu]
        change T (fun i => (w i : ℚ)) ∈ _
        rw [hwT]
        exact Submodule.smul_mem _ _ (Submodule.subset_span (by simp))
    · exact Submodule.span_le.mpr
        (Set.insert_subset_iff.mpr ⟨hcanonicalF, Set.singleton_subset_iff.mpr hbF⟩)
  refine ⟨σ, hσ, p.symm, k, b, hb, hbzero, hFeq, ?_, ?_, ?_⟩
  · rw [← hFeq]
    exact coordinateFree_signedCoordinates ℚ σ hσ p.symm E hfree
  · rw [← hFeq]
    change Module.finrank ℚ (E.map T.toLinearMap) = 2
    rw [LinearEquiv.finrank_map_eq, hdim]
  · rw [← hFeq]
    change spaceValue (realSpan (E.map (signedCoordinates ℚ σ hσ p.symm).toLinearMap)) ≤ _
    rw [spaceValue_realSpan_signedCoordinates]
    exact hlow

end

end Loneliness.SevenCoordinateCritical
