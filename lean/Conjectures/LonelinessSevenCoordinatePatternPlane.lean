import Conjectures.LonelinessSevenCoordinatePlaneNormalization
import Conjectures.LonelinessSevenCoordinateQuantitativeRepeat

/-! The exact pattern reduction needs only bounds on repeated directions.
The original plane value is preserved as an equality during normalization. -/

namespace Loneliness.SevenCoordinateCritical.Quantitative

open CoordinateSubspace SubspaceDensity

noncomputable section

theorem repeatDirectionBound_signedCoordinates
    (E : Submodule ℚ (Fin 7 → ℚ)) (hbound : RepeatDirectionBound E)
    (σ : Fin 7 → ℤ) (hσ : ∀ i, σ i = 1 ∨ σ i = -1)
    (p : Equiv.Perm (Fin 7)) :
    RepeatDirectionBound (E.map (signedCoordinates ℚ σ hσ p).toLinearMap) := by
  intro x hx hxzero hxcard
  let τ : Fin 7 → ℤ := fun i => σ (p.symm i)
  have hτ : ∀ i, τ i = 1 ∨ τ i = -1 := fun i => hσ (p.symm i)
  let u : Vector := signedCoordinates ℤ τ hτ p.symm x
  have hT : signedCoordinates ℚ σ hσ p (fun i => (u i : ℚ)) =
      (fun i => (x i : ℚ)) := by
    ext i
    rcases hσ i with h | h <;> simp [u, τ, h]
  have huE : (fun i => (u i : ℚ)) ∈ E := by
    obtain ⟨y, hy, hyx⟩ := Submodule.mem_map.mp hx
    have huy : (fun i => (u i : ℚ)) = y :=
      (signedCoordinates ℚ σ hσ p).injective (hT.trans hyx.symm)
    rw [huy]
    exact hy
  have huzero (i : Fin 7) : u i ≠ 0 := by
    rcases hτ i with h | h <;> simpa [u, h] using hxzero (p.symm i)
  have hperm := integerSpeeds_signedCoordinates τ hτ p.symm x
  have hucard : Nat.card (Set.range (fun i => (u i).natAbs)) ≤ 6 := by
    rw [← integerSpeeds_length]
    calc
      (integerSpeeds u).length = (integerSpeeds x).length := hperm.length_eq
      _ ≤ 6 := by rw [integerSpeeds_length]; exact hxcard
  have huvalue := hbound u huE huzero hucard
  have hvalue : value (integerSpeeds u) = value (integerSpeeds x) :=
    CriticalFamilies.value_perm hperm
  rw [hvalue] at huvalue
  exact huvalue

theorem repeatTests_of_direction_bound
    (hfive : LonelyRunnerBound 5) (hsix : PrimitiveSixClassification)
    (E : Submodule ℚ (Fin 7 → ℚ)) (hfree : CoordinateFree E)
    (hdim : Module.finrank ℚ E = 2)
    (hsixth : spaceValue (realSpan E) < (1/6 : ℝ))
    (hrepeated : RepeatDirectionBound E)
    (u w : Vector)
    (hu : (fun i => (u i : ℚ)) ∈ E) (hw : (fun i => (w i : ℚ)) ∈ E)
    (hspan : Submodule.span ℚ {(fun i => (u i : ℚ)), (fun i => (w i : ℚ))} = E) :
    Finite.RepeatTests u w := by
  intro i j hij positive
  constructor
  · rintro ⟨hui, hwi⟩
    exact no_forced_signed_equality_of_lt_sixth hfive E hfree hdim hsixth i j
      (ne_of_gt hij) (sameCoordinate_of_spanning_pair E u w hspan i j positive hui hwi)
  · let q := Finite.repeatVector u w i j positive
    by_cases hzero : ∃ a, q a = 0
    · exact Or.inl hzero
    · have hqzero : ∀ a, q a ≠ 0 := fun a ha => hzero ⟨a, ha⟩
      have hqE := repeatVector_mem E u w hu hw i j positive
      have hqcard := range_card_le_six_of_repeat (fun a => (q a).natAbs) i j
        (ne_of_gt hij) (repeatVector_repeats u w i j positive)
      exact Or.inr (repeatShape_of_consecutive q
        (consecutive_of_repeated_direction hfive hsix q hqzero hqcard
          (hrepeated q hqE hqzero hqcard)))

theorem two_primitive_signed_repeat_directions_of_bound
    (hfive : LonelyRunnerBound 5) (hsix : PrimitiveSixClassification)
    (E : Submodule ℚ (Fin 7 → ℚ)) (hfree : CoordinateFree E)
    (hdim : Module.finrank ℚ E = 2)
    (hrepeated : RepeatDirectionBound E) :
    ∃ q w : Vector,
      (fun i => (q i : ℚ)) ∈ E ∧ (fun i => (w i : ℚ)) ∈ E ∧
      (∀ i, q i ≠ 0) ∧ (∀ i, w i ≠ 0) ∧
      PrimitiveDirection q ∧ PrimitiveDirection w ∧
      CanonicalSignedRepeat q ∧ CanonicalSignedRepeat w ∧
      LinearIndependent ℚ ![(fun i => (q i : ℚ)), (fun i => (w i : ℚ))] ∧
      Submodule.span ℚ {(fun i => (q i : ℚ)), (fun i => (w i : ℚ))} = E := by
  obtain ⟨q, w, hqE, hwE, hqzero, hwzero, hqcard, hwcard, hpair, hspan⟩ :=
    two_integer_directions E hfree hdim
  have hqcard' : Nat.card (Set.range (fun i => (q i).natAbs)) ≤ 6 := by
    simpa using hqcard
  have hwcard' : Nat.card (Set.range (fun i => (w i).natAbs)) ≤ 6 := by
    simpa using hwcard
  have hqcrit := consecutive_of_repeated_direction hfive hsix q hqzero hqcard'
    (hrepeated q hqE hqzero hqcard')
  have hwcrit := consecutive_of_repeated_direction hfive hsix w hwzero hwcard'
    (hrepeated w hwE hwzero hwcard')
  obtain ⟨dq, q', hdq, hq', hqscale⟩ := consecutive_direction_rescale q hqzero hqcrit
  obtain ⟨dw, w', hdw, hw', hwscale⟩ := consecutive_direction_rescale w hwzero hwcrit
  have hqQ := rational_cast_rescale q q' dq hqscale
  have hwQ := rational_cast_rescale w w' dw hwscale
  have hq'E := primitive_rescale_mem E q q' dq hdq hqE hqQ
  have hw'E := primitive_rescale_mem E w w' dw hdw hwE hwQ
  have hdqne : (dq : ℚ) ≠ 0 := by exact_mod_cast (ne_of_gt hdq)
  have hdwne : (dw : ℚ) ≠ 0 := by exact_mod_cast (ne_of_gt hdw)
  have hpair' : LinearIndependent ℚ ![(fun i => (q' i : ℚ)), (fun i => (w' i : ℚ))] := by
    rw [hqQ, hwQ] at hpair
    exact (LinearIndependent.pair_smul_smul_iff
      (isUnit_iff_ne_zero.mpr hdqne) (isUnit_iff_ne_zero.mpr hdwne)).mp hpair
  refine ⟨q', w', hq'E, hw'E, canonicalSigned_nonzero hq', canonicalSigned_nonzero hw',
    canonicalSigned_primitive hq', canonicalSigned_primitive hw', hq', hw', hpair', ?_⟩
  apply le_antisymm
  · exact Submodule.span_le.mpr
      (Set.insert_subset_iff.mpr ⟨hq'E, Set.singleton_subset_iff.mpr hw'E⟩)
  · rw [← hspan]
    apply Submodule.span_le.mpr
    refine Set.insert_subset_iff.mpr ⟨?_, Set.singleton_subset_iff.mpr ?_⟩
    · rw [hqQ]
      exact Submodule.smul_mem _ _ (Submodule.subset_span (by simp))
    · rw [hwQ]
      exact Submodule.smul_mem _ _ (Submodule.subset_span (by simp))


theorem normalized_plane_of_repeat_bound
    (hfive : LonelyRunnerBound 5) (hsix : PrimitiveSixClassification)
    (E : Submodule ℚ (Fin 7 → ℚ)) (hfree : CoordinateFree E)
    (hdim : Module.finrank ℚ E = 2)
    (hrepeated : RepeatDirectionBound E) :
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
        (Submodule.span ℚ {(fun i => (canonical k i : ℚ)), (fun i => (b i : ℚ))})) =
          spaceValue (realSpan E) := by
  obtain ⟨q, w, hqE, hwE, _, _, _, _, hqcrit, hwcrit, _, hspan⟩ :=
    two_primitive_signed_repeat_directions_of_bound hfive hsix E hfree hdim hrepeated
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
    change spaceValue (realSpan (E.map (signedCoordinates ℚ σ hσ p.symm).toLinearMap)) = _
    rw [spaceValue_realSpan_signedCoordinates]


end

end Loneliness.SevenCoordinateCritical.Quantitative
