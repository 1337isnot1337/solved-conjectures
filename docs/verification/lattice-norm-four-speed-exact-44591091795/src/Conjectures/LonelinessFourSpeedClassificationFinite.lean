import Conjectures.LonelinessFourSpeedClassification
import Conjectures.LonelinessFourSpeedFinite

/-! The finite four-speed certificate supplies the classification premise
in the normalization and scaling argument. The numerical cutoff remains
an explicit input to this assembly lemma. -/

namespace Loneliness.CoordinateSubspace

theorem four_speed_gap_of_cutoff
    (hcutoff : ∀ v : Fin 4 → ℕ, (∀ i, 0 < v i) →
      (List.ofFn v).foldr Nat.gcd 0 = 1 →
      value (List.ofFn v) < (2/9 : ℝ) → ∀ i, v i ≤ 5832) :
    FourSpeedGap :=
  four_speed_gap_of_bounded_classification hcutoff
    (fun v hpositive hbound hprimitive hlow =>
      Modular.FourSpeed.bounded_four_speed_classification v
        hpositive hbound hprimitive hlow)

end Loneliness.CoordinateSubspace
