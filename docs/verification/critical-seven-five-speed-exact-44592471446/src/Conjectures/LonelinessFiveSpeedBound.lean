import Conjectures.LonelinessRenaultFiveSpeed
import Conjectures.LonelinessFourSpeedGap

/-! The unconditional five-speed bound. The four-speed theorem, phase
certificates, and all structural premises are discharged in the proof. -/

namespace Loneliness.Renault

theorem primitive_five_safe_time (v : Fin 5 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1) :
    ∃ t : ℝ, AllSafe v t :=
  primitive_five_safe_time_of_four CoordinateSubspace.four_speed_lonelyRunnerBound
    v hpositive hprimitive

theorem five_speed_common_time (v : Fin 5 → ℕ) (hpositive : ∀ i, 0 < v i) :
    ∃ t ∈ Set.Icc (0 : ℝ) 1, ∀ i, (1 / 6 : ℝ) ≤ distance ((v i : ℝ) * t) :=
  five_speed_common_time_of_four CoordinateSubspace.four_speed_lonelyRunnerBound v hpositive

theorem five_speed_lonelyRunnerBound : CoordinateSubspace.LonelyRunnerBound 5 :=
  five_speed_bound_of_four CoordinateSubspace.four_speed_lonelyRunnerBound

end Loneliness.Renault
