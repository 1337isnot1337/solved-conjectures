import Conjectures.LonelinessSixSpeedFiniteSound
import Conjectures.LonelinessTightSmallNormBounds
import Conjectures.LonelinessFourSpeedGap
import Conjectures.LonelinessSixClassificationBound

/-! Conditional assembly of the tight six-speed classification.

The geometric norm bound selects one of the eight literal primes below. Each
prime classification and the five-speed runner bound remain explicit inputs.
The tuple and list classifications assume positivity and the stated length,
without assuming distinct speeds. No finite prime certificate is imported or
discharged in this module.
-/

namespace Loneliness.TightSixClosure

open CoordinateSubspace

/-- The exact contract supplied by a complete six-speed prime certificate. -/
def PrimeClassification (p : ℕ) : Prop :=
  LonelyRunnerBound 5 →
    ∀ (v : Fin 6 → ℕ), (∀ i, 0 < v i) →
      (List.ofFn v).foldr Nat.gcd 0 = 1 →
      (∀ i, v i % p ≠ 0) →
      value (List.ofFn v) ≤ (1 / 7 : ℝ) →
        (List.ofFn v).Perm [1, 2, 3, 4, 5, 6]

def primeList : List ℕ := [257, 271, 307, 313, 359, 373, 379, 383]

theorem primeSet_eq :
    Modular.TightPrimeBounds.primeSet 6 = primeList.toFinset := rfl

/-- Each smaller dimension uses its own runner bound. -/
theorem lower_runner_bound (hLRC5 : LonelyRunnerBound 5)
    (m : ℕ) (hm : m < 6) : LonelyRunnerBound m := by
  by_cases hfive : m = 5
  · subst m
    exact hLRC5
  by_cases hfour : m = 4
  · subst m
    exact four_speed_lonelyRunnerBound
  · exact SmallRunner.lonelyRunnerBound m (by omega)

theorem exists_prime_avoiding (hLRC5 : LonelyRunnerBound 5)
    (v : Fin 6 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hvalue : value (List.ofFn v) ≤ (1 / 7 : ℝ)) :
    ∃ p ∈ primeList, ∀ i, v i % p ≠ 0 := by
  obtain ⟨p, hp, havoid⟩ := NormGeometry.exists_small_prime_of_tight
    (n := 5) (by decide) (by decide) v hpositive hprimitive hvalue
    (fun m _hm hlt => lower_runner_bound hLRC5 m hlt)
  change p ∈ Modular.TightPrimeBounds.primeSet 6 at hp
  rw [primeSet_eq] at hp
  refine ⟨p, List.mem_toFinset.mp hp, ?_⟩
  intro i hzero
  exact havoid i (Nat.dvd_of_mod_eq_zero hzero)

section

variable (hLRC5 : LonelyRunnerBound 5)
  (h257 : PrimeClassification 257) (h271 : PrimeClassification 271)
  (h307 : PrimeClassification 307) (h313 : PrimeClassification 313)
  (h359 : PrimeClassification 359) (h373 : PrimeClassification 373)
  (h379 : PrimeClassification 379) (h383 : PrimeClassification 383)

theorem prime_classifications : ∀ p ∈ primeList, PrimeClassification p := by
  intro p hp
  have hcases : p = 257 ∨ p = 271 ∨ p = 307 ∨ p = 313 ∨
      p = 359 ∨ p = 373 ∨ p = 379 ∨ p = 383 := by
    simpa [primeList] using hp
  rcases hcases with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact h257
  · exact h271
  · exact h307
  · exact h313
  · exact h359
  · exact h373
  · exact h379
  · exact h383

/-- No distinctness hypothesis is imposed on the six input coordinates. -/
theorem primitive_classification (v : Fin 6 → ℕ)
    (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hvalue : value (List.ofFn v) ≤ (1 / 7 : ℝ)) :
    (List.ofFn v).Perm [1, 2, 3, 4, 5, 6] := by
  obtain ⟨p, hp, hmod⟩ := exists_prime_avoiding hLRC5 v hpositive hprimitive hvalue
  exact prime_classifications h257 h271 h307 h313 h359 h373 h379 h383 p hp
    hLRC5 v hpositive hprimitive hmod hvalue

theorem primitive_value_eq (v : Fin 6 → ℕ)
    (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hvalue : value (List.ofFn v) ≤ (1 / 7 : ℝ)) :
    value (List.ofFn v) = (1 / 7 : ℝ) := by
  have hperm := primitive_classification hLRC5 h257 h271 h307 h313 h359 h373 h379 h383
    v hpositive hprimitive hvalue
  exact (CriticalFamilies.value_perm hperm).trans Modular.SixSpeed.consecutive_value

theorem primitive_list_classification (ds : List ℕ) (hlength : ds.length = 6)
    (hpositive : ∀ a ∈ ds, 0 < a) (hprimitive : ds.foldr Nat.gcd 0 = 1)
    (hvalue : value ds ≤ (1 / 7 : ℝ)) :
    ds.Perm [1, 2, 3, 4, 5, 6] := by
  let v : Fin 6 → ℕ := fun i => ds.get (Fin.cast hlength.symm i)
  have hv : List.ofFn v = ds :=
    (List.ofFn_congr hlength ds.get).symm.trans (List.ofFn_get ds)
  have hpositive' (i : Fin 6) : 0 < v i := by
    apply hpositive
    rw [← hv]
    exact List.mem_ofFn.mpr ⟨i, rfl⟩
  have hprimitive' : (List.ofFn v).foldr Nat.gcd 0 = 1 := by
    rwa [hv]
  have hvalue' : value (List.ofFn v) ≤ (1 / 7 : ℝ) := by
    rwa [hv]
  simpa only [hv] using
    primitive_classification hLRC5 h257 h271 h307 h313 h359 h373 h379 h383
      v hpositive' hprimitive' hvalue'

theorem normalized_classification (ds : List ℕ) (hlength : ds.length = 6)
    (hpositive : ∀ a ∈ ds, 0 < a) (hvalue : value ds ≤ (1 / 7 : ℝ)) :
    (Normalization.normalize ds).Perm [1, 2, 3, 4, 5, 6] := by
  have hnonempty : ds ≠ [] := by intro h; simp [h] at hlength
  apply primitive_list_classification hLRC5 h257 h271 h307 h313 h359 h373 h379 h383
    (Normalization.normalize ds)
    (by simpa only [Normalization.normalize_length] using hlength)
    (Normalization.normalize_positive ds hpositive)
    (Normalization.normalize_primitive ds hnonempty hpositive)
  rwa [Normalization.value_normalize ds hnonempty hpositive]

theorem value_eq_of_tight (ds : List ℕ) (hlength : ds.length = 6)
    (hpositive : ∀ a ∈ ds, 0 < a) (hvalue : value ds ≤ (1 / 7 : ℝ)) :
    value ds = (1 / 7 : ℝ) := by
  have hnonempty : ds ≠ [] := by intro h; simp [h] at hlength
  calc
    value ds = value (Normalization.normalize ds) :=
      (Normalization.value_normalize ds hnonempty hpositive).symm
    _ = value [1, 2, 3, 4, 5, 6] := CriticalFamilies.value_perm
      (normalized_classification hLRC5 h257 h271 h307 h313 h359 h373 h379 h383
        ds hlength hpositive hvalue)
    _ = (1 / 7 : ℝ) := Modular.SixSpeed.consecutive_value

theorem seven_coordinate_primitive_classification :
    SevenCoordinateCritical.PrimitiveSixClassification := by
  intro ds hlength _hnodup hpositive hprimitive hvalue
  change ds.Perm [1, 2, 3, 4, 5, 6]
  exact primitive_list_classification hLRC5 h257 h271 h307 h313 h359 h373 h379 h383
    ds hlength hpositive hprimitive hvalue

theorem six_runner_bound : LonelyRunnerBound 6 :=
  SevenCoordinateCritical.lonelyRunnerBound_six_of_classification hLRC5
    (seven_coordinate_primitive_classification hLRC5
      h257 h271 h307 h313 h359 h373 h379 h383)

end

end Loneliness.TightSixClosure
