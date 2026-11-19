import Conjectures.LonelinessEightPlaneFiniteDefs
import Conjectures.LonelinessPlaneDirections
import Conjectures.LonelinessSevenLowGapInput

/-! The lower-dimensional inputs for the eight-coordinate plane gap.
The six-speed runner bound and the exact seven-speed low-gap classification
are explicit hypotheses. No finite coverage is assumed here. -/

namespace Loneliness.EightPlane

noncomputable section

open CoordinateSubspace

theorem knownShape_of_support_perm (w : Vector) (family : Fin 3) (d : ℕ)
    (hd : 0 < d)
    (hperm : (integerSpeeds w).Perm ((baseList family).map (fun a => d * a))) :
    KnownShape w := by
  refine ⟨family, d, hd, ?_, ?_⟩
  · intro i
    exact hperm.mem_iff.mp ((mem_integerSpeeds w ((w i).natAbs)).mpr ⟨i, rfl⟩)
  · intro a ha
    exact (mem_integerSpeeds w (d * a)).mp
      (hperm.mem_iff.mpr (List.mem_map.mpr ⟨a, ha, rfl⟩))

theorem integer_direction_classCount
    (E : Submodule ℚ (Fin 8 → ℚ)) (hfree : CoordinateFree E) :
    ∃ w : Vector, (fun i => (w i : ℚ)) ∈ E ∧ (∀ i, w i ≠ 0) ∧
      Nat.card (Set.range (fun i => (w i).natAbs)) ≤
        classCount E - Module.finrank ℚ E + 1 := by
  obtain ⟨F, hFE, _, hFfree, hcount⟩ := exists_coordinate_free_line E hfree
  obtain ⟨w, hwF, hwzero, _⟩ := exists_integer_direction F hFfree
  have hcard : Nat.card (Set.range (fun i => (w i).natAbs)) ≤ classCount F :=
    (natAbs_values_card_le_rational_abs w).trans
      (absolute_values_card_le_classCount hwF)
  have hFpos := classCount_pos F
  exact ⟨w, hFE hwF, hwzero, by omega⟩

theorem value_lower_of_classCount
    (E : Submodule ℚ (Fin 8 → ℚ)) (hfree : CoordinateFree E)
    (m : ℕ) (hLRC : LonelyRunnerBound m)
    (hcount : classCount E - Module.finrank ℚ E + 1 ≤ m) :
    (1 : ℝ) / (m + 1) ≤ SubspaceDensity.spaceValue (realSpan E) := by
  obtain ⟨w, hwE, hwzero, hwcard⟩ := integer_direction_classCount E hfree
  have hlower := hLRC (integerSpeeds w) (integerSpeeds_nonempty w)
    (integerSpeeds_nodup w)
    (by rw [integerSpeeds_length]; exact hwcard.trans hcount)
    (integerSpeeds_positive w hwzero)
  exact hlower.trans (integer_direction_value_le E w hwE)

theorem classCount_lt_eight_of_same
    (E : Submodule ℚ (Fin 8 → ℚ)) (i j : Fin 8)
    (hij : i ≠ j) (hsame : SameCoordinate E i j) : classCount E < 8 := by
  by_contra h
  have hcard : Nat.card (Fin 8) ≤ Nat.card (Quotient (coordinateSetoid E)) := by
    simpa only [Nat.card_eq_fintype_card, Fintype.card_fin, classCount] using le_of_not_gt h
  have hsurj : Function.Surjective (Quotient.mk (coordinateSetoid E)) :=
    Quotient.mk_surjective
  have hbij := hsurj.bijective_of_nat_card_le hcard
  exact hij (hbij.1 (Quotient.sound hsame))

theorem no_same_coordinate_of_low_plane (hsix : LonelyRunnerBound 6)
    (E : Submodule ℚ (Fin 8 → ℚ)) (hfree : CoordinateFree E)
    (hdim : Module.finrank ℚ E = 2)
    (hbelow : SubspaceDensity.spaceValue (realSpan E) < (3 / 23 : ℝ))
    (i j : Fin 8) (hij : i ≠ j) : ¬SameCoordinate E i j := by
  intro hsame
  have hcount := classCount_lt_eight_of_same E i j hij hsame
  have hlower := value_lower_of_classCount E hfree 6 hsix (by rw [hdim]; omega)
  norm_num at hlower
  linarith

theorem critical_of_repeated_direction
    (hsix : LonelyRunnerBound 6) (hseven : SevenLowGapInput.SevenSpeedGap)
    (w : Vector) (hwzero : ∀ i, w i ≠ 0)
    (hwcard : Nat.card (Set.range (fun i => (w i).natAbs)) ≤ 7)
    (hbelow : value (integerSpeeds w) < (3 / 23 : ℝ)) :
    KnownShape w := by
  have hlen : (integerSpeeds w).length ≤ 7 := by
    rw [integerSpeeds_length]
    exact hwcard
  have hexact : (integerSpeeds w).length = 7 := by
    by_contra hne
    have hsmall : (integerSpeeds w).length ≤ 6 := by omega
    have hlower := hsix (integerSpeeds w) (integerSpeeds_nonempty w)
      (integerSpeeds_nodup w) hsmall (integerSpeeds_positive w hwzero)
    norm_num at hlower
    linarith
  obtain ⟨d, hd, hperm⟩ := hseven (integerSpeeds w) hexact (integerSpeeds_nodup w)
    (integerSpeeds_positive w hwzero) hbelow
  rcases hperm with hperm | hperm | hperm
  · exact knownShape_of_support_perm w 0 d (by omega) hperm
  · exact knownShape_of_support_perm w 1 d (by omega) hperm
  · exact knownShape_of_support_perm w 2 d (by omega) hperm

theorem two_critical_integer_directions
    (hsix : LonelyRunnerBound 6) (hseven : SevenLowGapInput.SevenSpeedGap)
    (E : Submodule ℚ (Fin 8 → ℚ)) (hfree : CoordinateFree E)
    (hdim : Module.finrank ℚ E = 2)
    (hbelow : SubspaceDensity.spaceValue (realSpan E) < (3 / 23 : ℝ)) :
    ∃ q w : Vector,
      (fun i => (q i : ℚ)) ∈ E ∧ (fun i => (w i : ℚ)) ∈ E ∧
      (∀ i, q i ≠ 0) ∧ (∀ i, w i ≠ 0) ∧
      KnownShape q ∧ KnownShape w ∧
      LinearIndependent ℚ ![(fun i => (q i : ℚ)), (fun i => (w i : ℚ))] ∧
      Submodule.span ℚ {(fun i => (q i : ℚ)), (fun i => (w i : ℚ))} = E := by
  obtain ⟨q, w, hqE, hwE, hqzero, hwzero, hqcard, hwcard, hpair, hspan⟩ :=
    two_integer_directions E hfree hdim
  have hqcrit := critical_of_repeated_direction hsix hseven q hqzero
    (by simpa using hqcard) ((integer_direction_value_le E q hqE).trans_lt hbelow)
  have hwcrit := critical_of_repeated_direction hsix hseven w hwzero
    (by simpa using hwcard) ((integer_direction_value_le E w hwE).trans_lt hbelow)
  exact ⟨q, w, hqE, hwE, hqzero, hwzero, hqcrit, hwcrit, hpair, hspan⟩

end

end Loneliness.EightPlane

