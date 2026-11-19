import Conjectures.SymmetricFourPointSharp
import Conjectures.SymmetricFourPointSemantics

/-! The two parity cases exhaust all positive coprime steps. -/

namespace SymmetricFourPoint

/-- The exact packing and covering densities of `{0,a,b,a+b}` for every
positive coprime pair `a < b`. Densities count centers, not covered sites. -/
theorem symmetric_four_point_densities (a b : ℕ) (ha : 0 < a) (hab : a < b)
    (hcop : Nat.Coprime a b) :
    packingDensity a b =
      (if a % 2 = 1 ∧ b % 2 = 1 then
        ((packingLength a b : ℝ) - 1) / (4 * packingLength a b) else 1 / 4) ∧
    coveringDensity a b =
      (if a % 2 = 1 ∧ b % 2 = 1 then
        ((coveringLength a b : ℝ) + 1) / (4 * coveringLength a b) else 1 / 4) := by
  by_cases hodd : a % 2 = 1 ∧ b % 2 = 1
  · simpa only [if_pos hodd] using densities_odd a b ha hab hcop hodd.1 hodd.2
  · have hparity : a % 2 ≠ b % 2 := by
      intro heq
      have hae : a % 2 = 0 := by omega
      have hbe : b % 2 = 0 := by omega
      exact Nat.not_coprime_of_dvd_of_dvd (by decide : 1 < 2)
        (Nat.dvd_of_mod_eq_zero hae) (Nat.dvd_of_mod_eq_zero hbe) hcop
    simpa only [if_neg hodd] using densities_opposite_parity a b ha hab hcop hparity

end SymmetricFourPoint
