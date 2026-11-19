import Conjectures.HaralambisDefects
import Conjectures.HaralambisPeriods
import Conjectures.HaralambisDensity
import Conjectures.HaralambisPairSum

/-! The complete three-difference theorem: arbitrary avoiding sets have upper
density at most the actual circle maximum, and a pair-sum-periodic set attains
it. The primitive local input and common-divisor reduction are both discharged. -/

namespace Haralambis

theorem minRatio_le_value (d : Fin 3 → ℕ) (hd : ∀ i, 0 < d i)
    (hprim : commonDivisor d = 1) (A : Set ℤ)
    (hA : Loneliness.Packing.Avoids (speeds d) A) :
    minRatio d A ≤ Loneliness.value (speeds d) := by
  obtain ⟨F, hF, h01, h12, h20⟩ := finite_signed_edges d (occupancy A)
    (occupancy_zero_or_one A) (fun i t _ => occupancy_avoids hA i t)
  apply minRatio_le_value_of_periods d A hd
  simpa only [prefixSum] using
    odd_period_certificate d hd hprim (occupancy A) F hF h01 h12 h20

theorem upperDensity_le_circle (d : Fin 3 → ℕ) (hd : ∀ i, 0 < d i)
    (A : Set ℤ) (hA : Loneliness.Packing.Avoids (speeds d) A) :
    NonmixedGap.upperDensity A ≤ Loneliness.value (speeds d) :=
  upperDensity_of_primitive_local minRatio_le_value d hd A hA

theorem density_eq_value (d : Fin 3 → ℕ) (hd : ∀ i, 0 < d i) :
    Loneliness.Packing.density (speeds d) = Loneliness.value (speeds d) := by
  apply le_antisymm
  · exact Loneliness.Packing.density_le (upperDensity_le_circle d hd)
  · exact Loneliness.Packing.value_le_density (speeds d) (by simp [speeds])

/-- Haralambis's equality and pair-sum periodic attainment. The proof works
even if some positive differences repeat; distinct triples are included. -/
theorem three_difference_theorem (d : Fin 3 → ℕ) (hd : ∀ i, 0 < d i) :
    Loneliness.Packing.density (speeds d) = Loneliness.value (speeds d) ∧
      ∃ i j : Fin 3, i ≠ j ∧ 0 < d i+d j ∧ ∃ A : Set ℤ,
        NonmixedGap.IsPeriodic A (d i+d j : ℕ) ∧
        Loneliness.Packing.Avoids (speeds d) A ∧
        NonmixedGap.upperDensity A = Loneliness.Packing.density (speeds d) := by
  refine ⟨density_eq_value d hd, ?_⟩
  obtain ⟨i,j,hij,A,hP,hA,hv⟩ := pair_sum_packing d hd
  refine ⟨i,j,hij,by have hi := hd i; omega,A,hP,hA,?_⟩
  rw [density_eq_value d hd]
  exact hv

end Haralambis
