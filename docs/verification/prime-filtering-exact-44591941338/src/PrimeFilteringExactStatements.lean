import Conjectures.LonelinessPrimeFilteringWitness
import Conjectures.LonelinessPrimeFilteringUnits
import Conjectures.LonelinessPrimeFilteringCases

open scoped BigOperators
noncomputable section

namespace PrimeFilteringArithmeticContracts
open Loneliness.PrimeFilteringArithmetic
variable {p m j k x d : ℕ}
example (hp : 0 < p) (hj : j ≤ m) (hx : p ^ j ∣ x) :
    ((1 + k * p ^ (m - j)) * x) / p ^ m = x / p ^ m + k * (x / p ^ j) :=
  quotient_step hp hj hx
example (hp : 0 < p) (hj : j ≤ m) (hx : p ^ j ∣ x) :
    (((((1 + k * p ^ (m - j)) * x) / p ^ m) : ℕ) : ZMod p) =
      ((x / p ^ m : ℕ) : ZMod p) + (k : ZMod p) * ((x / p ^ j : ℕ) : ZMod p) :=
  digit_step hp hj hx
example (hp : 0 < p) (hj : j ≤ m) (hx : p ^ (j + 1) ∣ x) :
    digit p m ((1 + k * p ^ (m - j)) * x) = digit p m x :=
  digit_step_of_next_pow_dvd hp hj hx
example (hd : p ^ j ∣ d) (hnext : ¬ p ^ (j + 1) ∣ d) :
    ((d / p ^ j : ℕ) : ZMod p) ≠ 0 := leading_digit_ne_zero hd hnext
example (hp : 1 < p) (hj : j < m) :
    ((1 + k * p ^ (m - j) : ℕ) : ZMod p) ≠ 0 := multiplier_ne_zero_of_lt hp hj
example (hk : (k : ZMod p) ≠ -1) :
    ((1 + k * p ^ (m - m) : ℕ) : ZMod p) ≠ 0 := multiplier_ne_zero_at_top hk
example (hp : 1 < p) (hj : j ≤ m) (htop : j = m → (k : ZMod p) ≠ -1) :
    ((1 + k * p ^ (m - j) : ℕ) : ZMod p) ≠ 0 := multiplier_ne_zero hp hj htop
end PrimeFilteringArithmeticContracts


namespace PrimeFilteringResiduesContracts
open Loneliness.PrimeFilteringArithmetic Loneliness.PrimeFilteringResidues
variable {p m j k x y a : ℕ}
example (hj : j ≤ m) (hx : p ^ (j + 1) ∣ x) :
    (1 + k * p ^ (m - j)) * x = x + (k * (x / p ^ (j + 1))) * p ^ (m + 1) :=
  step_expansion_of_next_pow_dvd hj hx
example (hj : j ≤ m) (hx : p ^ (j + 1) ∣ x) :
    ((1 + k * p ^ (m - j)) * x) % p ^ (m + 1) = x % p ^ (m + 1) :=
  residue_step_of_next_pow_dvd hj hx
example : (((x % p ^ (m + 1) / p ^ m : ℕ)) : ZMod p) =
    ((x / p ^ m : ℕ) : ZMod p) := digit_mod_prime_power p m x
example (h : x % p ^ (m + 1) = y % p ^ (m + 1)) :
    digit p m x = digit p m y := digit_eq_of_mod_eq h
example (hp : p.Prime) (ha : (a : ZMod p) ≠ 0) :
    Nat.Coprime a (p ^ (m + 1)) := coprime_prime_power_of_nonzero hp ha
example (hp : p.Prime) (ha : (a : ZMod p) ≠ 0) :
    IsUnit (a : ZMod (p ^ (m + 1))) := isUnit_prime_power_of_nonzero hp ha
example (hp : p.Prime) (ha : (a : ZMod p) ≠ 0) :
    ∃ u : (ZMod (p ^ (m + 1)))ˣ, (u : ZMod (p ^ (m + 1))) = (a : ZMod (p ^ (m + 1))) :=
  exists_unit_lift hp ha
example (hp : p.Prime) (b : ZMod p) (hb : b ≠ 0) :
    Nat.Coprime b.val (p ^ (m + 1)) := val_coprime_prime_power_of_nonzero hp b hb
example (hp : p.Prime) (b : ZMod p) (hb : b ≠ 0) :
    ∃ u : (ZMod (p ^ (m + 1)))ˣ,
      (u : ZMod (p ^ (m + 1))) = (b.val : ZMod (p ^ (m + 1))) :=
  exists_unit_val_lift hp b hb
end PrimeFilteringResiduesContracts


namespace PrimeFilteringDigitBoundContracts
open Loneliness.PrimeFilteringDigitBound
variable {p m x : ℕ}
example (hp : 0 < p) (hzero : ((x / p ^ m : ℕ) : ZMod p) ≠ 0)
    (hlast : ((x / p ^ m : ℕ) : ZMod p) ≠ -1) :
    p ^ m ≤ x % p ^ (m + 1) ∧
      x % p ^ (m + 1) + p ^ m ≤ p ^ (m + 1) :=
  residue_bounds_of_digit_avoiding hp hzero hlast
example (hp : 0 < p) (hzero : ((x / p ^ m : ℕ) : ZMod p) ≠ 0)
    (hlast : ((x / p ^ m : ℕ) : ZMod p) ≠ -1) :
    p ^ m ≤ min (x % p ^ (m + 1)) (p ^ (m + 1) - x % p ^ (m + 1)) :=
  folded_lower_of_digit_avoiding hp hzero hlast
end PrimeFilteringDigitBoundContracts


namespace PrimeFilteringPartialContracts
open scoped BigOperators
open Loneliness.PrimeFiltering
example {ι : Type*} {p m r : ℕ} [Fact p.Prime]
    (s : Finset ι) (v level : ι → ℕ) (F : ι → Finset (ZMod p))
    (hrm : r < m) (hlevel : ∀ i ∈ s, level i ≤ r)
    (hdiv : ∀ i ∈ s, p ^ level i ∣ v i)
    (hnext : ∀ i ∈ s, ¬ p ^ (level i + 1) ∣ v i)
    (hbudget : ∀ j ≤ r,
      ∑ i ∈ s.filter (fun i => level i = j), (F i).card ≤ p - 1)
    (a : ℕ) (ha : (a : ZMod p) ≠ 0) :
    ∃ b : ℕ, (b : ZMod p) ≠ 0 ∧
      (∀ i ∈ s, (((b * v i) / p ^ m : ℕ) : ZMod p) ∉ F i) ∧
      ∀ x : ℕ, p ^ (r + 1) ∣ x →
        (b * x) % p ^ (m + 1) = (a * x) % p ^ (m + 1) :=
  partial_prime_filtering s v level F hrm hlevel hdiv hnext hbudget a ha
end PrimeFilteringPartialContracts


namespace PrimeFilteringCorollaryThreeContracts
open Loneliness.PrimeFiltering
example {ι : Type*} {p m r : ℕ} [Fact p.Prime]
    (s : Finset ι) (v level : ι → ℕ) (hrm : r < m)
    (hdiv : ∀ i ∈ s, p ^ level i ∣ v i)
    (hnext : ∀ i ∈ s, ¬ p ^ (level i + 1) ∣ v i)
    (hcount : ∀ j ≤ r,
      (s.filter (fun i => level i = j)).card ≤ (p - 1) / 2)
    (a : ℕ) (ha : Nat.Coprime a (p ^ (m + 1)))
    (hhigher : ∀ i ∈ s, r < level i →
      p ^ m ≤ min ((a * v i) % p ^ (m + 1))
        (p ^ (m + 1) - (a * v i) % p ^ (m + 1))) :
    ∃ b : ℕ, Nat.Coprime b (p ^ (m + 1)) ∧
      (∀ i ∈ s, p ^ m ≤ min ((b * v i) % p ^ (m + 1))
        (p ^ (m + 1) - (b * v i) % p ^ (m + 1))) ∧
      ∀ x : ℕ, p ^ (r + 1) ∣ x →
        (b * x) % p ^ (m + 1) = (a * x) % p ^ (m + 1) :=
  corollary_three_distance_of_coprime_seed s v level hrm hdiv hnext hcount a ha hhigher
example {ι : Type*} {p m r : ℕ} [Fact p.Prime]
    (s : Finset ι) (v level : ι → ℕ) (hrm : r < m)
    (hdiv : ∀ i ∈ s, p ^ level i ∣ v i)
    (hnext : ∀ i ∈ s, ¬ p ^ (level i + 1) ∣ v i)
    (hcount : ∀ j ≤ r,
      (s.filter (fun i => level i = j)).card ≤ (p - 1) / 2)
    (hhigher : ∀ i ∈ s, r < level i →
      p ^ m ≤ min (v i % p ^ (m + 1)) (p ^ (m + 1) - v i % p ^ (m + 1))) :
    ∃ b : ℕ, Nat.Coprime b (p ^ (m + 1)) ∧
      (∀ i ∈ s, p ^ m ≤ min ((b * v i) % p ^ (m + 1))
        (p ^ (m + 1) - (b * v i) % p ^ (m + 1))) ∧
      ∀ x : ℕ, p ^ (r + 1) ∣ x →
        (b * x) % p ^ (m + 1) = x % p ^ (m + 1) :=
  corollary_three_distance s v level hrm hdiv hnext hcount hhigher
end PrimeFilteringCorollaryThreeContracts


open scoped BigOperators

example {p n : ℕ} [Fact p.Prime] (hn : 0 < n) :
    p ^ padicValNat p n ∣ n ∧ ¬ p ^ (padicValNat p n + 1) ∣ n :=
  Loneliness.PrimeFiltering.padic_level_exact hn

example {ι : Type*} (p : ℕ) (s : Finset ι) (v : ι → ℕ) (i : ι) (hi : i ∈ s) :
    padicValNat p (v i) ≤ s.sup (fun k => padicValNat p (v k)) :=
  Loneliness.PrimeFiltering.padicValNat_le_maxPadicVal p s v hi

example {ι : Type*} {p : ℕ} [Fact p.Prime]
    (s : Finset ι) (v : ι → ℕ) (hpos : ∀ i ∈ s, 0 < v i) (i : ι) (hi : i ∈ s) :
    ¬ p ^ (s.sup (fun k => padicValNat p (v k)) + 1) ∣ v i :=
  Loneliness.PrimeFiltering.not_dvd_pow_maxPadicVal_succ s v hpos hi

example {ι : Type*} {p : ℕ} [Fact p.Prime]
    (s : Finset ι) (v : ι → ℕ) (F : ι → Finset (ZMod p))
    (hpos : ∀ i ∈ s, 0 < v i)
    (hlower : ∀ j < s.sup (fun i => padicValNat p (v i)),
      ∑ i ∈ s.filter (fun i => padicValNat p (v i) = j), (F i).card ≤ p - 1)
    (htop : ∑ i ∈ s.filter
      (fun i => padicValNat p (v i) = s.sup (fun k => padicValNat p (v k))),
      (F i).card ≤ p - 2) :
    ∃ a : ℕ, (a : ZMod p) ≠ 0 ∧
      ∀ i ∈ s, (((a * v i) / p ^ (s.sup (fun k => padicValNat p (v k))) : ℕ) : ZMod p)
        ∉ F i :=
  Loneliness.PrimeFiltering.prime_filtering_padic s v F hpos hlower htop

namespace PrimeFilteringExactContracts

open scoped BigOperators
open Loneliness.PrimeFiltering

example {ι : Type*} {p m : ℕ} [Fact p.Prime]
    (s : Finset ι) (v level : ι → ℕ) (F : ι → Finset (ZMod p))
    (hlevel : ∀ i ∈ s, level i ≤ m)
    (hdiv : ∀ i ∈ s, p ^ level i ∣ v i)
    (hnext : ∀ i ∈ s, ¬ p ^ (level i + 1) ∣ v i)
    (hlower : ∀ j < m, ∑ i ∈ s.filter (fun i => level i = j), (F i).card ≤ p - 1)
    (htop : ∑ i ∈ s.filter (fun i => level i = m), (F i).card ≤ p - 2) :
    ∃ a : ℕ, (a : ZMod p) ≠ 0 ∧
      ∀ i ∈ s, (((a * v i) / p ^ m : ℕ) : ZMod p) ∉ F i :=
  prime_filtering_of_card_bounds s v level F hlevel hdiv hnext hlower htop

example {ι : Type*} {p m : ℕ} [Fact p.Prime]
    (s : Finset ι) (v level : ι → ℕ) (F : ι → Finset (ZMod p))
    (hlevel : ∀ i ∈ s, level i ≤ m)
    (hdiv : ∀ i ∈ s, p ^ level i ∣ v i)
    (hnext : ∀ i ∈ s, ¬ p ^ (level i + 1) ∣ v i)
    (hlower : ∀ j < m, ∑ i ∈ s.filter (fun i => level i = j), (F i).card ≤ p - 1)
    (htop : ∑ i ∈ s.filter (fun i => level i = m), (F i).card ≤ p - 2) :
    ∃ u : (ZMod (p ^ (m + 1)))ˣ,
      ∀ i ∈ s, ((((u : ZMod (p ^ (m + 1))).val * v i) / p ^ m : ℕ) : ZMod p) ∉ F i :=
  prime_filtering_unit s v level F hlevel hdiv hnext hlower htop

example (ds : List ℕ) :
    Loneliness.value ds = sSup (Loneliness.clearance ds '' Set.Icc (0 : ℝ) 1) := rfl

example (k m t : ℕ) (ds : List ℕ) :
    Loneliness.Modular.Witness k m t ds ↔
      ∀ d ∈ ds, m ≤ k * min ((t * d) % m) (m - (t * d) % m) := Iff.rfl

example (ds : List ℕ) (hpos : ∀ d ∈ ds, 0 < d)
    (hcount : ∀ j : ℕ, (ds.toFinset.filter (fun d => padicValNat 7 d = j)).card ≤ 3) :
    ∃ a : ℕ, ∀ d ∈ ds,
      7 ^ (ds.toFinset.sup (fun x => padicValNat 7 x) + 2) ≤
        7 * min ((a * d) % 7 ^ (ds.toFinset.sup (fun x => padicValNat 7 x) + 2))
          (7 ^ (ds.toFinset.sup (fun x => padicValNat 7 x) + 2) -
            (a * d) % 7 ^ (ds.toFinset.sup (fun x => padicValNat 7 x) + 2)) :=
  hasWitness_seven_of_three_per_valuation ds hpos hcount

example {p j : ℕ} (ds : List ℕ) (hp : 2 ≤ p)
    (hdiv : ∀ d ∈ ds, p ^ j ∣ d)
    (hnext : ∀ d ∈ ds, ¬ p ^ (j + 1) ∣ d) :
    (1 : ℝ) / p ≤ sSup (Loneliness.clearance ds '' Set.Icc (0 : ℝ) 1) :=
  uniform_level_value ds hp hdiv hnext

-- No cardinality bound is imposed on the highest occupied valuation level.
example {p : ℕ} [Fact p.Prime] (ds : List ℕ) (hpos : ∀ d ∈ ds, 0 < d)
    (hcount : ∀ j < ds.toFinset.sup (fun d => padicValNat p d),
      (ds.toFinset.filter (fun d => padicValNat p d = j)).card ≤ (p - 1) / 2) :
    ∃ a : ℕ, ∀ d ∈ ds,
      p ^ (ds.toFinset.sup (fun x => padicValNat p x) + 1) ≤
        p * min ((a * d) % p ^ (ds.toFinset.sup (fun x => padicValNat p x) + 1))
          (p ^ (ds.toFinset.sup (fun x => padicValNat p x) + 1) -
            (a * d) % p ^ (ds.toFinset.sup (fun x => padicValNat p x) + 1)) :=
  hasWitness_of_lower_valuation_counts ds hpos hcount

example (ds : List ℕ) (hpos : ∀ d ∈ ds, 0 < d)
    (hcount : ∀ j < ds.toFinset.sup (fun d => padicValNat 7 d),
      (ds.toFinset.filter (fun d => padicValNat 7 d = j)).card ≤ 3) :
    (1 : ℝ) / 7 ≤ sSup (Loneliness.clearance ds '' Set.Icc (0 : ℝ) 1) :=
  one_seventh_of_three_below_max_valuation ds hpos hcount

end PrimeFilteringExactContracts

end
