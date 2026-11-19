import Conjectures.LonelinessPrimeFilteringTwoForbidden
import Conjectures.LonelinessPrimeFilteringDigitBound
import Conjectures.LonelinessPrimeFilteringValuation
import Conjectures.LonelinessModularWitness

/-!
# Prime filtering gives actual runner witnesses

The digit conclusions are transported to the repository's natural modular
witnesses and hence to the actual real-time loneliness value. In particular,
positive speed lists with at most three distinct speeds at each 7-adic level
have loneliness at least `1/7`. Repeated speeds are allowed. This covers a
specified class of inputs and does not assert the full six-speed theorem.
-/

namespace Loneliness.PrimeFiltering

open Loneliness.PrimeFilteringArithmetic Loneliness.PrimeFilteringDigitBound

/-- Avoiding the two extreme digits is a genuine modular runner witness. -/
theorem witness_of_digit_avoiding {p m a : ℕ} (ds : List ℕ) (hp : 0 < p)
    (hav : ∀ d ∈ ds, digit p m (a * d) ≠ 0 ∧ digit p m (a * d) ≠ -1) :
    Modular.Witness p (p ^ (m + 1)) a ds := by
  intro d hd
  change p ^ (m + 1) ≤ p *
    min ((a * d) % p ^ (m + 1)) (p ^ (m + 1) - (a * d) % p ^ (m + 1))
  calc
    p ^ (m + 1) = p * p ^ m := by rw [pow_succ, mul_comm]
    _ ≤ p * min ((a * d) % p ^ (m + 1))
        (p ^ (m + 1) - (a * d) % p ^ (m + 1)) :=
      Nat.mul_le_mul_left p (folded_lower_of_digit_avoiding hp (hav d hd).1 (hav d hd).2)

/-- The level-cardinality hypotheses produce a witness on the prime-power grid. -/
theorem hasWitness_of_level_budgets {p m : ℕ} [Fact p.Prime]
    (ds : List ℕ) (level : ℕ → ℕ)
    (hlevel : ∀ d ∈ ds, level d ≤ m)
    (hdiv : ∀ d ∈ ds, p ^ level d ∣ d)
    (hnext : ∀ d ∈ ds, ¬ p ^ (level d + 1) ∣ d)
    (hlower : ∀ j < m, 2 * (ds.toFinset.filter (fun d => level d = j)).card ≤ p - 1)
    (htop : 2 * (ds.toFinset.filter (fun d => level d = m)).card ≤ p - 2) :
    Modular.HasWitness p (p ^ (m + 1)) ds := by
  obtain ⟨a, _ha, hav⟩ := avoid_two_per_level ds.toFinset id level
    (fun d hd => hlevel d (List.mem_toFinset.mp hd))
    (fun d hd => hdiv d (List.mem_toFinset.mp hd))
    (fun d hd => hnext d (List.mem_toFinset.mp hd)) hlower htop
  exact ⟨a, witness_of_digit_avoiding ds (Fact.out : p.Prime).pos
    (fun d hd => hav d (List.mem_toFinset.mpr hd))⟩

/-- The level budgets bound the actual real-time loneliness value. -/
theorem value_lower_of_level_budgets {p m : ℕ} [Fact p.Prime]
    (ds : List ℕ) (level : ℕ → ℕ)
    (hlevel : ∀ d ∈ ds, level d ≤ m)
    (hdiv : ∀ d ∈ ds, p ^ level d ∣ d)
    (hnext : ∀ d ∈ ds, ¬ p ^ (level d + 1) ∣ d)
    (hlower : ∀ j < m, 2 * (ds.toFinset.filter (fun d => level d = j)).card ≤ p - 1)
    (htop : 2 * (ds.toFinset.filter (fun d => level d = m)).card ≤ p - 2) :
    (1 : ℝ) / p ≤ Loneliness.value ds :=
  Modular.hasWitness_value_lower (Fact.out : p.Prime).two_le
    (pow_pos (Fact.out : p.Prime).pos _)
    (hasWitness_of_level_budgets ds level hlevel hdiv hnext hlower htop)

/-- Prime seven needs at most three inputs at each level when an empty top
position is added. The conclusion is an explicit finite-grid witness. -/
theorem hasWitness_seven_of_three_per_level {m : ℕ}
    (ds : List ℕ) (level : ℕ → ℕ)
    (hlevel : ∀ d ∈ ds, level d ≤ m)
    (hdiv : ∀ d ∈ ds, 7 ^ level d ∣ d)
    (hnext : ∀ d ∈ ds, ¬ 7 ^ (level d + 1) ∣ d)
    (hcount : ∀ j ≤ m, (ds.toFinset.filter (fun d => level d = j)).card ≤ 3) :
    Modular.HasWitness 7 (7 ^ (m + 2)) ds := by
  obtain ⟨a, _ha, hav⟩ := seven_avoid_two_of_three_per_level ds.toFinset id level
    (fun d hd => hlevel d (List.mem_toFinset.mp hd))
    (fun d hd => hdiv d (List.mem_toFinset.mp hd))
    (fun d hd => hnext d (List.mem_toFinset.mp hd)) hcount
  exact ⟨a, witness_of_digit_avoiding ds (by decide)
    (fun d hd => hav d (List.mem_toFinset.mpr hd))⟩

theorem one_seventh_of_three_per_level {m : ℕ}
    (ds : List ℕ) (level : ℕ → ℕ)
    (hlevel : ∀ d ∈ ds, level d ≤ m)
    (hdiv : ∀ d ∈ ds, 7 ^ level d ∣ d)
    (hnext : ∀ d ∈ ds, ¬ 7 ^ (level d + 1) ∣ d)
    (hcount : ∀ j ≤ m, (ds.toFinset.filter (fun d => level d = j)).card ≤ 3) :
    (1 : ℝ) / 7 ≤ Loneliness.value ds :=
  Modular.hasWitness_value_lower (by decide) (pow_pos (by decide) _)
    (hasWitness_seven_of_three_per_level ds level hlevel hdiv hnext hcount)

/-- The condition uses actual 7-adic valuations of the input speeds; no
auxiliary divisibility witnesses or upper bound have to be supplied. -/
theorem hasWitness_seven_of_three_per_valuation (ds : List ℕ)
    (hpos : ∀ d ∈ ds, 0 < d)
    (hcount : ∀ j : ℕ, (ds.toFinset.filter (fun d => padicValNat 7 d = j)).card ≤ 3) :
    Modular.HasWitness 7 (7 ^ (maxPadicVal 7 ds.toFinset id + 2)) ds := by
  let : Fact (Nat.Prime 7) := ⟨by decide⟩
  apply hasWitness_seven_of_three_per_level ds (padicValNat 7)
  · intro d hd
    exact padicValNat_le_maxPadicVal 7 ds.toFinset id (List.mem_toFinset.mpr hd)
  · intro d hd
    exact (padic_level_exact (p := 7) (hpos d hd)).1
  · intro d hd
    exact (padic_level_exact (p := 7) (hpos d hd)).2
  · intro j _hj
    exact hcount j

/-- A conditional class of runner instances, now expressed in the actual
real-time loneliness value and canonical valuations. -/
theorem one_seventh_of_three_per_valuation (ds : List ℕ)
    (hpos : ∀ d ∈ ds, 0 < d)
    (hcount : ∀ j : ℕ, (ds.toFinset.filter (fun d => padicValNat 7 d = j)).card ≤ 3) :
    (1 : ℝ) / 7 ≤ Loneliness.value ds :=
  Modular.hasWitness_value_lower (by decide) (pow_pos (by decide) _)
    (hasWitness_seven_of_three_per_valuation ds hpos hcount)

end Loneliness.PrimeFiltering
