import Conjectures.LonelinessFiveRunnerPrime0149
import Conjectures.LonelinessFiveRunnerPrime0151
import Conjectures.LonelinessFiveRunnerPrime0163
import Conjectures.LonelinessFiveRunnerPrime0167
import Conjectures.LonelinessFiveRunnerPrime0173
import Conjectures.LonelinessFiveRunnerNorm
import Conjectures.LonelinessFiveRunnerConsequences

/-! The unconditional five-runner lower bound and its two primitive equality
directions. The full prime certificates, the geometric norm bound, prime
avoidance, and the lower-dimensional runner inputs are all discharged here.
-/

namespace Loneliness.Modular.FiveRunner

theorem primitive_classification : PrimitiveClassification := by
  intro v hpositive hprimitive hvalue
  have hprimitive' : (List.ofFn v).foldr Nat.gcd 0 = 1 := by
    simpa only [Search.Primitive, Normalization.gcd] using hprimitive
  obtain ⟨p, hp, havoid⟩ := FiveRunnerNorm.exists_prime_avoiding v
    hpositive hprimitive' hvalue
  have hmod (i : Fin 5) : v i % p ≠ 0 := by
    intro hzero
    exact havoid i (Nat.dvd_of_mod_eq_zero hzero)
  have hfour := FiveRunnerNorm.lower_runner_bound 4 (by decide)
  have hcases : p = 149 ∨ p = 151 ∨ p = 163 ∨ p = 167 ∨ p = 173 := by
    simpa [FiveRunnerNorm.primeSet, FiveRunnerNorm.primeList] using hp
  rcases hcases with rfl | rfl | rfl | rfl | rfl
  · exact Prime0149.primitive_classification_cases hfour v hpositive hprimitive hmod hvalue
  · exact Prime0151.primitive_classification_cases hfour v hpositive hprimitive hmod hvalue
  · exact Prime0163.primitive_classification_cases hfour v hpositive hprimitive hmod hvalue
  · exact Prime0167.primitive_classification_cases hfour v hpositive hprimitive hmod hvalue
  · exact Prime0173.primitive_classification_cases hfour v hpositive hprimitive hmod hvalue

theorem primitive_value_eq (v : Fin 5 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hprimitive : Search.Primitive v) (hvalue : value (List.ofFn v) ≤ (1 / 6 : ℝ)) :
    value (List.ofFn v) = (1 / 6 : ℝ) :=
  value_eq_of_direction (primitive_classification v hpositive hprimitive hvalue)

theorem five_runner_bound : CoordinateSubspace.LonelyRunnerBound 5 :=
  lonelyRunnerBound_of_classification
    (FiveRunnerNorm.lower_runner_bound 4 (by decide)) primitive_classification

theorem complete_normalized_classification (ds : List ℕ) (hlength : ds.length = 5)
    (hpositive : ∀ a ∈ ds, 0 < a) (hvalue : value ds ≤ (1 / 6 : ℝ)) :
    (Normalization.normalize ds).Perm consecutive ∨
      (Normalization.normalize ds).Perm exceptional :=
  normalized_classification primitive_classification ds hlength hpositive hvalue

end Loneliness.Modular.FiveRunner

namespace Loneliness.CoordinateSubspace

theorem five_speed_lonelyRunnerBound : LonelyRunnerBound 5 :=
  Modular.FiveRunner.five_runner_bound

end Loneliness.CoordinateSubspace
