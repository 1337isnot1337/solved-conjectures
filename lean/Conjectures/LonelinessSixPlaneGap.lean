import Conjectures.LonelinessPlaneDirections
import Conjectures.LonelinessSixPlaneDefs

/-! Semantic reductions for the six-coordinate plane gap. The exact five-speed
low-gap classification is explicit. The four-speed runner input is already a
proved repository theorem and is discharged in the final assembly. -/

namespace Loneliness.SixPlane

noncomputable section

open CoordinateSubspace

def FiveSpeedGap : Prop :=
  ∀ ds : List ℕ, ds.length = 5 → ds.Nodup → (∀ a ∈ ds, 0 < a) →
    value ds < (2 / 11 : ℝ) →
    ∃ d : ℕ, 1 ≤ d ∧
      (ds.Perm ([1,2,3,4,5].map (fun a => d * a)) ∨
        ds.Perm ([1,3,4,5,9].map (fun a => d * a)))

def CriticalIntegerDirection (w : Vector) : Prop :=
  ∃ d : ℕ, 1 ≤ d ∧
    ((integerSpeeds w).Perm ([1,2,3,4,5].map (fun a => d * a)) ∨
      (integerSpeeds w).Perm ([1,3,4,5,9].map (fun a => d * a)))

theorem integer_direction_classCount
    (E : Submodule ℚ (Fin 6 → ℚ)) (hfree : CoordinateFree E) :
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
    (E : Submodule ℚ (Fin 6 → ℚ)) (hfree : CoordinateFree E)
    (m : ℕ) (hLRC : LonelyRunnerBound m)
    (hcount : classCount E - Module.finrank ℚ E + 1 ≤ m) :
    (1 : ℝ) / (m + 1) ≤ SubspaceDensity.spaceValue (realSpan E) := by
  obtain ⟨w, hwE, hwzero, hwcard⟩ := integer_direction_classCount E hfree
  have hlower := hLRC (integerSpeeds w) (integerSpeeds_nonempty w)
    (integerSpeeds_nodup w)
    (by rw [integerSpeeds_length]; exact hwcard.trans hcount)
    (integerSpeeds_positive w hwzero)
  exact hlower.trans (integer_direction_value_le E w hwE)

theorem classCount_lt_six_of_same
    (E : Submodule ℚ (Fin 6 → ℚ)) (i j : Fin 6)
    (hij : i ≠ j) (hsame : SameCoordinate E i j) : classCount E < 6 := by
  by_contra h
  have hcard : Nat.card (Fin 6) ≤ Nat.card (Quotient (coordinateSetoid E)) := by
    simpa only [Nat.card_eq_fintype_card, Fintype.card_fin, classCount] using le_of_not_gt h
  have hsurj : Function.Surjective (Quotient.mk (coordinateSetoid E)) :=
    Quotient.mk_surjective
  have hbij := hsurj.bijective_of_nat_card_le hcard
  exact hij (hbij.1 (Quotient.sound hsame))

/-- An actual low-value plane has six different coordinate functions up to
sign. This justifies rejecting identical-coordinate cases in the finite test. -/
theorem no_same_coordinate_of_low_plane (hfour : LonelyRunnerBound 4)
    (E : Submodule ℚ (Fin 6 → ℚ)) (hfree : CoordinateFree E)
    (hdim : Module.finrank ℚ E = 2)
    (hbelow : SubspaceDensity.spaceValue (realSpan E) < (2 / 11 : ℝ))
    (i j : Fin 6) (hij : i ≠ j) : ¬SameCoordinate E i j := by
  intro hsame
  have hcount := classCount_lt_six_of_same E i j hij hsame
  have hlower := value_lower_of_classCount E hfree 4 hfour (by rw [hdim]; omega)
  norm_num at hlower
  linarith

theorem critical_of_repeated_direction
    (hfour : LonelyRunnerBound 4) (hfive : FiveSpeedGap)
    (w : Vector) (hwzero : ∀ i, w i ≠ 0)
    (hwcard : Nat.card (Set.range (fun i => (w i).natAbs)) ≤ 5)
    (hbelow : value (integerSpeeds w) < (2 / 11 : ℝ)) :
    CriticalIntegerDirection w := by
  have hlen : (integerSpeeds w).length ≤ 5 := by
    rw [integerSpeeds_length]
    exact hwcard
  have hexact : (integerSpeeds w).length = 5 := by
    by_contra hne
    have hsmall : (integerSpeeds w).length ≤ 4 := by omega
    have hlower := hfour (integerSpeeds w) (integerSpeeds_nonempty w)
      (integerSpeeds_nodup w) hsmall (integerSpeeds_positive w hwzero)
    norm_num at hlower
    linarith
  exact hfive (integerSpeeds w) hexact (integerSpeeds_nodup w)
    (integerSpeeds_positive w hwzero) hbelow

theorem two_critical_integer_directions
    (hfour : LonelyRunnerBound 4) (hfive : FiveSpeedGap)
    (E : Submodule ℚ (Fin 6 → ℚ)) (hfree : CoordinateFree E)
    (hdim : Module.finrank ℚ E = 2)
    (hbelow : SubspaceDensity.spaceValue (realSpan E) < (2 / 11 : ℝ)) :
    ∃ q w : Vector,
      (fun i => (q i : ℚ)) ∈ E ∧ (fun i => (w i : ℚ)) ∈ E ∧
      (∀ i, q i ≠ 0) ∧ (∀ i, w i ≠ 0) ∧
      CriticalIntegerDirection q ∧ CriticalIntegerDirection w ∧
      LinearIndependent ℚ ![(fun i => (q i : ℚ)), (fun i => (w i : ℚ))] ∧
      Submodule.span ℚ {(fun i => (q i : ℚ)), (fun i => (w i : ℚ))} = E := by
  obtain ⟨q, w, hqE, hwE, hqzero, hwzero, hqcard, hwcard, hpair, hspan⟩ :=
    two_integer_directions E hfree hdim
  have hqcrit := critical_of_repeated_direction hfour hfive q hqzero
    (by simpa using hqcard) ((integer_direction_value_le E q hqE).trans_lt hbelow)
  have hwcrit := critical_of_repeated_direction hfour hfive w hwzero
    (by simpa using hwcard) ((integer_direction_value_le E w hwE).trans_lt hbelow)
  exact ⟨q, w, hqE, hwE, hqzero, hwzero, hqcrit, hwcrit, hpair, hspan⟩

end

end Loneliness.SixPlane
