import Conjectures.LonelinessPrimePowerUnitGrid
import Conjectures.LonelinessFiveSpeedBound

/-!
# Coprime seven-power seeds for at most five speeds

Renault's proved five-speed lower bound is one sixth. Its strict margin
above one seventh permits the unit-grid approximation. The conclusion is
an actual natural folded-residue bound at arbitrarily fine powers of seven.
Repeated speeds are allowed and only the number of distinct speeds matters.
-/

namespace Loneliness.PrimePowerUnitGrid

theorem five_speed_value_lower (ds : List ℕ) (hlen : ds.length ≤ 5)
    (hpos : ∀ d ∈ ds, 0 < d) : (1 / 6 : ℝ) ≤ value ds :=
  Renault.bounded_list_value_lower_of_primitive Renault.primitive_five_safe_time ds hlen hpos

theorem five_distinct_speed_value_lower (ds : List ℕ)
    (hpos : ∀ d ∈ ds, 0 < d) (hcard : ds.toFinset.card ≤ 5) :
    (1 / 6 : ℝ) ≤ value ds := by
  have hlen : ds.toFinset.toList.length ≤ 5 := by simpa using hcard
  have hpos' : ∀ d ∈ ds.toFinset.toList, 0 < d := by
    intro d hd
    exact hpos d (by simpa using hd)
  have h := five_speed_value_lower ds.toFinset.toList hlen hpos'
  have heq : value ds.toFinset.toList = value ds :=
    CriticalFamilies.value_eq_of_mem (by intro d; simp)
  exact heq ▸ h

theorem one_seventh_lt_value_of_five_distinct (ds : List ℕ)
    (hpos : ∀ d ∈ ds, 0 < d) (hcard : ds.toFinset.card ≤ 5) :
    (1 / 7 : ℝ) < value ds :=
  lt_of_lt_of_le (by norm_num) (five_distinct_speed_value_lower ds hpos hcard)

theorem eventually_unit_seven_witness_of_five_distinct (ds : List ℕ)
    (hpos : ∀ d ∈ ds, 0 < d) (hcard : ds.toFinset.card ≤ 5) :
    ∃ M : ℕ, ∀ m ≥ M, ∃ a : ℕ,
      a % 7 = 1 ∧ Nat.Coprime a (7 ^ (m + 1)) ∧
      (1 / 7 : ℝ) < clearance ds ((a : ℝ) / (7 ^ (m + 1) : ℕ)) ∧
      Modular.Witness 7 (7 ^ (m + 1)) a ds :=
  eventually_unit_witness_of_value (by decide) ds
    (one_seventh_lt_value_of_five_distinct ds hpos hcard)

/-- A direct seed for the higher-family distance premise of prime filtering. -/
theorem arbitrarily_fine_seven_seed_of_five_distinct (ds : List ℕ)
    (hpos : ∀ d ∈ ds, 0 < d) (hcard : ds.toFinset.card ≤ 5) (M : ℕ) :
    ∃ m ≥ M, ∃ a : ℕ, a % 7 = 1 ∧ Nat.Coprime a (7 ^ (m + 1)) ∧
      ∀ d ∈ ds, 7 ^ m ≤
        min ((a * d) % 7 ^ (m + 1)) (7 ^ (m + 1) - (a * d) % 7 ^ (m + 1)) := by
  obtain ⟨m, hm, a, ha, hcop, hw⟩ := arbitrarily_fine_unit_witness_of_value
    (by decide) ds (one_seventh_lt_value_of_five_distinct ds hpos hcard) M
  refine ⟨m, hm, a, ha, hcop, fun d hd => ?_⟩
  have h := hw d hd
  change 7 ^ (m + 1) ≤ 7 *
    min ((a * d) % 7 ^ (m + 1)) (7 ^ (m + 1) - (a * d) % 7 ^ (m + 1)) at h
  have hpower : 7 ^ (m + 1) = 7 ^ m * 7 := pow_succ 7 m
  omega

theorem arbitrarily_fine_seven_seed_of_five (ds : List ℕ)
    (hlen : ds.length ≤ 5) (hpos : ∀ d ∈ ds, 0 < d) (M : ℕ) :
    ∃ m ≥ M, ∃ a : ℕ, a % 7 = 1 ∧ Nat.Coprime a (7 ^ (m + 1)) ∧
      ∀ d ∈ ds, 7 ^ m ≤
        min ((a * d) % 7 ^ (m + 1)) (7 ^ (m + 1) - (a * d) % 7 ^ (m + 1)) :=
  arbitrarily_fine_seven_seed_of_five_distinct ds hpos
    ((List.toFinset_card_le ds).trans hlen) M

end Loneliness.PrimePowerUnitGrid
