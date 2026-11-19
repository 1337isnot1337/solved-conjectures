import Conjectures.LonelinessEightPlaneGap
import Conjectures.LonelinessEightPlaneGeometry
import Mathlib.SetTheory.Cardinal.NatCard

/-! A low-value rational plane satisfies every repeat-line condition used
by the finite checker. Both lower-dimensional classification inputs remain
explicit. -/

namespace Loneliness.EightPlane

noncomputable section

open CoordinateSubspace

theorem range_card_le_seven_of_repeat (f : Fin 8 → ℕ) (i j : Fin 8)
    (hij : i ≠ j) (heq : f i = f j) : Nat.card (Set.range f) ≤ 7 := by
  have hle : Nat.card (Set.range f) ≤ 8 := by simpa using Finite.card_range_le f
  have hne : Nat.card (Set.range f) ≠ 8 := by
    intro hcard
    have hbij : Function.Bijective (Set.rangeFactorization f) :=
      (Nat.bijective_iff_surjective_and_card (Set.rangeFactorization f)).mpr
        ⟨Set.rangeFactorization_surjective, by simpa using hcard.symm⟩
    exact hij (hbij.injective (Subtype.ext heq))
  omega

theorem repeatVector_repeats (w z : Vector) (i j : Fin 8) (sign : ℤ)
    (hsign : sign = 1 ∨ sign = -1) :
    (repeatVector w z i j sign i).natAbs = (repeatVector w z i j sign j).natAbs := by
  have heq : repeatVector w z i j sign i = sign * repeatVector w z i j sign j := by
    rcases hsign with rfl | rfl <;> simp only [repeatVector] <;> ring
  rw [heq, Int.natAbs_mul]
  rcases hsign with rfl | rfl <;> simp

theorem repeatVector_mem (E : Submodule ℚ (Fin 8 → ℚ)) (w z : Vector)
    (hw : (fun i => (w i : ℚ)) ∈ E) (hz : (fun i => (z i : ℚ)) ∈ E)
    (i j : Fin 8) (sign : ℤ) :
    (fun k => (repeatVector w z i j sign k : ℚ)) ∈ E := by
  have h := E.sub_mem
    (E.smul_mem ((w i - sign * w j : ℤ) : ℚ) hz)
    (E.smul_mem ((z i - sign * z j : ℤ) : ℚ) hw)
  have heq : (fun k => (repeatVector w z i j sign k : ℚ)) =
      ((w i - sign * w j : ℤ) : ℚ) • (fun k => (z k : ℚ)) -
      ((z i - sign * z j : ℤ) : ℚ) • (fun k => (w k : ℚ)) := by
    ext k
    simp only [repeatVector, Int.cast_sub, Int.cast_mul, Pi.sub_apply,
      Pi.smul_apply, smul_eq_mul]
  rw [heq]
  exact h

theorem lineAllowed_of_low_plane (hsix : LonelyRunnerBound 6)
    (hseven : SevenLowGapInput.SevenSpeedGap)
    (E : Submodule ℚ (Fin 8 → ℚ)) (w z : Vector)
    (hw : (fun i => (w i : ℚ)) ∈ E) (hz : (fun i => (z i : ℚ)) ∈ E)
    (hbelow : SubspaceDensity.spaceValue (realSpan E) < (3 / 23 : ℝ))
    (i j : Fin 8) (hij : i ≠ j) (sign : ℤ) (hsign : sign = 1 ∨ sign = -1) :
    LineAllowed (repeatVector w z i j sign) := by
  by_cases hzero : ∃ k, repeatVector w z i j sign k = 0
  · exact Or.inl hzero
  · apply Or.inr
    apply critical_of_repeated_direction hsix hseven
      (repeatVector w z i j sign) (fun k hk => hzero ⟨k, hk⟩)
    · exact range_card_le_seven_of_repeat _ i j hij (repeatVector_repeats w z i j sign hsign)
    · exact (integer_direction_value_le E _ (repeatVector_mem E w z hw hz i j sign)).trans_lt hbelow

theorem sameCoordinate_of_span_equations (w z : Vector) (i j : Fin 8) (sign : ℤ)
    (hsign : sign = 1 ∨ sign = -1) (hw : w i = sign * w j) (hz : z i = sign * z j) :
    SameCoordinate (spanPair w z) i j := by
  have hwQ : (w i : ℚ) = (sign : ℚ) * (w j : ℚ) := by exact_mod_cast hw
  have hzQ : (z i : ℚ) = (sign : ℚ) * (z j : ℚ) := by exact_mod_cast hz
  have hrel (x : Fin 8 → ℚ) (hx : x ∈ spanPair w z) : x i = (sign : ℚ) * x j := by
    obtain ⟨a, b, hab⟩ := Submodule.mem_span_pair.mp hx
    rw [← hab]
    simp only [Pi.add_apply, Pi.smul_apply, smul_eq_mul]
    rw [hwQ, hzQ]
    ring
  rcases hsign with rfl | rfl
  · exact Or.inl (by simpa using hrel)
  · exact Or.inr (by simpa using hrel)

theorem repeatTests_of_low_plane (hsix : LonelyRunnerBound 6)
    (hseven : SevenLowGapInput.SevenSpeedGap) (w z : Vector)
    (hfree : CoordinateFree (spanPair w z))
    (hdim : Module.finrank ℚ (spanPair w z) = 2)
    (hbelow : SubspaceDensity.spaceValue (realSpan (spanPair w z)) < (3 / 23 : ℝ)) :
    RepeatTests w z := by
  intro i j hij sign hsign
  constructor
  · by_contra hboth
    push Not at hboth
    have hsame := sameCoordinate_of_span_equations w z i j sign hsign
      (sub_eq_zero.mp hboth.1) (sub_eq_zero.mp hboth.2)
    exact no_same_coordinate_of_low_plane hsix _ hfree hdim hbelow i j hij hsame
  · exact lineAllowed_of_low_plane hsix hseven (spanPair w z) w z
      (Submodule.subset_span (by simp)) (Submodule.subset_span (by simp)) hbelow i j hij sign hsign

end

end Loneliness.EightPlane

