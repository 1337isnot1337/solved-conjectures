import Conjectures.LonelinessPlaneDirections
import Conjectures.LonelinessNormalization
import Conjectures.LonelinessSevenCoordinateDefs

/-! Seven-coordinate repeat directions in a low-value rational plane.
The only classification input concerns primitive lists of six positive
integer speeds. The plane and its two independent repeat directions are
constructed by the checked coordinate-coalescence theorems. -/

namespace Loneliness.SevenCoordinateCritical

open CoordinateSubspace SubspaceDensity

noncomputable section

/-- The precise six-speed input needed by the plane reduction. -/
def PrimitiveSixClassification : Prop :=
  ∀ ds : List ℕ, ds.length = 6 → ds.Nodup →
    (∀ a ∈ ds, 0 < a) → Normalization.gcd ds = 1 →
    value ds ≤ (1 / 7 : ℝ) → ds.Perm sixBase

def ConsecutiveRepeatDirection (w : Vector) : Prop :=
  ∃ d : ℕ, 0 < d ∧
    (integerSpeeds w).Perm (sixBase.map (fun a => d * a))

theorem six_support_of_repeated_direction
    (hfive : LonelyRunnerBound 5)
    (w : Vector) (hzero : ∀ i, w i ≠ 0)
    (hcard : Nat.card (Set.range (fun i => (w i).natAbs)) ≤ 6)
    (hlow : value (integerSpeeds w) ≤ (1 / 7 : ℝ)) :
    (integerSpeeds w).length = 6 := by
  have hle : (integerSpeeds w).length ≤ 6 := by
    rw [integerSpeeds_length]
    exact hcard
  by_contra hne
  have hsmall : (integerSpeeds w).length ≤ 5 := by omega
  have hbound := hfive (integerSpeeds w) (integerSpeeds_nonempty w)
    (integerSpeeds_nodup w) hsmall (integerSpeeds_positive w hzero)
  norm_num at hbound
  linarith

theorem consecutive_of_repeated_direction
    (hfive : LonelyRunnerBound 5) (hsix : PrimitiveSixClassification)
    (w : Vector) (hzero : ∀ i, w i ≠ 0)
    (hcard : Nat.card (Set.range (fun i => (w i).natAbs)) ≤ 6)
    (hlow : value (integerSpeeds w) ≤ (1 / 7 : ℝ)) :
    ConsecutiveRepeatDirection w := by
  have hlength := six_support_of_repeated_direction hfive w hzero hcard hlow
  have hnonempty := integerSpeeds_nonempty w
  have hpositive := integerSpeeds_positive w hzero
  have hnormal : (Normalization.normalize (integerSpeeds w)).Perm sixBase := by
    apply hsix
    · simpa only [Normalization.normalize_length] using hlength
    · exact Normalization.normalize_nodup (integerSpeeds_nodup w)
    · exact Normalization.normalize_positive _ hpositive
    · exact Normalization.normalize_primitive _ hnonempty hpositive
    · rw [Normalization.value_normalize _ hnonempty hpositive]
      exact hlow
  have hscaled := hnormal.map (fun a => Normalization.gcd (integerSpeeds w) * a)
  rw [Normalization.rescale_normalize] at hscaled
  exact ⟨Normalization.gcd (integerSpeeds w),
    Normalization.gcd_pos hnonempty hpositive, hscaled⟩

theorem two_consecutive_repeat_directions
    (hfive : LonelyRunnerBound 5) (hsix : PrimitiveSixClassification)
    (E : Submodule ℚ (Fin 7 → ℚ)) (hfree : CoordinateFree E)
    (hdim : Module.finrank ℚ E = 2)
    (hlow : spaceValue (realSpan E) ≤ (1 / 7 : ℝ)) :
    ∃ q w : Vector,
      (fun i => (q i : ℚ)) ∈ E ∧ (fun i => (w i : ℚ)) ∈ E ∧
      (∀ i, q i ≠ 0) ∧ (∀ i, w i ≠ 0) ∧
      ConsecutiveRepeatDirection q ∧ ConsecutiveRepeatDirection w ∧
      LinearIndependent ℚ ![(fun i => (q i : ℚ)), (fun i => (w i : ℚ))] ∧
      Submodule.span ℚ {(fun i => (q i : ℚ)), (fun i => (w i : ℚ))} = E := by
  obtain ⟨q, w, hqE, hwE, hqzero, hwzero, hqcard, hwcard, hpair, hspan⟩ :=
    two_integer_directions E hfree hdim
  have hqcrit := consecutive_of_repeated_direction hfive hsix q hqzero
    (by simpa using hqcard) ((integer_direction_value_le E q hqE).trans hlow)
  have hwcrit := consecutive_of_repeated_direction hfive hsix w hwzero
    (by simpa using hwcard) ((integer_direction_value_le E w hwE).trans hlow)
  exact ⟨q, w, hqE, hwE, hqzero, hwzero, hqcrit, hwcrit, hpair, hspan⟩

theorem range_card_le_six_of_repeat (f : Fin 7 → ℕ) (i j : Fin 7)
    (hij : i ≠ j) (heq : f i = f j) : Nat.card (Set.range f) ≤ 6 := by
  have hle : Nat.card (Set.range f) ≤ 7 := by simpa using Finite.card_range_le f
  have hne : Nat.card (Set.range f) ≠ 7 := by
    intro hcard
    have hbij : Function.Bijective (Set.rangeFactorization f) :=
      (Nat.bijective_iff_surjective_and_card (Set.rangeFactorization f)).mpr
        ⟨Set.rangeFactorization_surjective, by simpa using hcard.symm⟩
    exact hij (hbij.injective (Subtype.ext heq))
  omega

/-- Every nonzero repeated-coordinate integer line in the plane is constrained
by the same six-speed theorem, including lines beyond the two generators. -/
theorem every_repeat_direction_consecutive
    (hfive : LonelyRunnerBound 5) (hsix : PrimitiveSixClassification)
    (E : Submodule ℚ (Fin 7 → ℚ))
    (hlow : spaceValue (realSpan E) ≤ (1 / 7 : ℝ))
    (w : Vector) (hwE : (fun i => (w i : ℚ)) ∈ E)
    (hzero : ∀ i, w i ≠ 0) (i j : Fin 7) (hij : i ≠ j)
    (heq : (w i).natAbs = (w j).natAbs) :
    ConsecutiveRepeatDirection w :=
  consecutive_of_repeated_direction hfive hsix w hzero
    (range_card_le_six_of_repeat _ i j hij heq)
    ((integer_direction_value_le E w hwE).trans hlow)

/-- A forced signed equality would coalesce the plane to a direction with at
most five distinct speeds, contradicting the five-speed lower bound. -/
theorem low_plane_classCount_eq_seven
    (hfive : LonelyRunnerBound 5)
    (E : Submodule ℚ (Fin 7 → ℚ)) (hfree : CoordinateFree E)
    (hdim : Module.finrank ℚ E = 2)
    (hlow : spaceValue (realSpan E) ≤ (1 / 7 : ℝ)) : classCount E = 7 := by
  have hupper : classCount E ≤ 7 := by simpa using classCount_le_card E
  by_contra hne
  have hclasses : classCount E ≤ 6 := by omega
  obtain ⟨F, hFE, _, hFfree, hcount⟩ := exists_coordinate_free_line E hfree
  have hFclasses : classCount F ≤ 5 := by rw [hdim] at hcount; omega
  obtain ⟨w, hwF, hwzero, _⟩ := exists_integer_direction F hFfree
  have hsmall : (integerSpeeds w).length ≤ 5 := by
    rw [integerSpeeds_length]
    exact (natAbs_values_card_le_rational_abs w).trans
      ((absolute_values_card_le_classCount hwF).trans hFclasses)
  have hlower := hfive (integerSpeeds w) (integerSpeeds_nonempty w)
    (integerSpeeds_nodup w) hsmall (integerSpeeds_positive w hwzero)
  have hvalue := (integer_direction_value_le E w (hFE hwF)).trans hlow
  norm_num at hlower
  linarith

theorem low_plane_no_forced_signed_equality
    (hfive : LonelyRunnerBound 5)
    (E : Submodule ℚ (Fin 7 → ℚ)) (hfree : CoordinateFree E)
    (hdim : Module.finrank ℚ E = 2)
    (hlow : spaceValue (realSpan E) ≤ (1 / 7 : ℝ))
    (i j : Fin 7) (hij : i ≠ j) : ¬SameCoordinate E i j := by
  have hcard := low_plane_classCount_eq_seven hfive E hfree hdim hlow
  have hsurj : Function.Surjective (Quotient.mk (coordinateSetoid E)) :=
    Quotient.mk_surjective
  have hbij := hsurj.bijective_of_nat_card_le
    (show Nat.card (Fin 7) ≤ Nat.card (Quotient (coordinateSetoid E)) by
      change Nat.card (Fin 7) ≤ classCount E
      simpa only [Nat.card_eq_fintype_card, Fintype.card_fin] using hcard.ge)
  intro hsame
  exact hij (hbij.injective (Quotient.sound hsame))

end

end Loneliness.SevenCoordinateCritical
