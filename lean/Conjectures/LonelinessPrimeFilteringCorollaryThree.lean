import Conjectures.LonelinessPrimeFilteringPartial
import Conjectures.LonelinessPrimeFilteringDigitBound

/-!
# The distance conclusion of the partial filtering corollary

This composes partial prime filtering with the actual natural folded
distance bound. It formalizes the arithmetic conclusion of Corollary 3
in Barajas and Serra, *The lonely runner with seven runners*, Electronic
Journal of Combinatorics 15 (2008), R48, doi:10.37236/772, page 4.

The seeded form allows any multiplier coprime to `p^(m+1)` that already
treats the higher levels. The original distance statement follows by
using seed one. Both forms preserve every higher input's full residue.
The connection to runner values is a separate theorem.
-/

open scoped BigOperators

namespace Loneliness.PrimeFiltering

open Loneliness.PrimeFilteringArithmetic Loneliness.PrimeFilteringResidues
open Loneliness.PrimeFilteringDigitBound

/-- Treat all lower levels by two forbidden digits and keep the seed's
already sufficient higher distances. The conclusion gives the actual
folded natural residue for every input. -/
theorem corollary_three_distance_of_coprime_seed {ι : Type*} {p m r : ℕ}
    [Fact p.Prime] (s : Finset ι) (v level : ι → ℕ) (hrm : r < m)
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
        (b * x) % p ^ (m + 1) = (a * x) % p ^ (m + 1) := by
  classical
  let low := s.filter (fun i => level i ≤ r)
  let F : ι → Finset (ZMod p) := fun _ => {0, -1}
  have hpair : ({(0 : ZMod p), -1} : Finset (ZMod p)).card = 2 :=
    Finset.card_pair (Ne.symm (neg_ne_zero.mpr one_ne_zero))
  have hsum (t : Finset ι) : ∑ i ∈ t, (F i).card = 2 * t.card := by
    simp only [F, hpair, Finset.sum_const, nsmul_eq_mul, Nat.cast_id, mul_comm]
  have hbudget : ∀ j ≤ r,
      ∑ i ∈ low.filter (fun i => level i = j), (F i).card ≤ p - 1 := by
    intro j hj
    have hsub : low.filter (fun i => level i = j) ⊆
        s.filter (fun i => level i = j) := by
      intro i hi
      obtain ⟨hilow, hij⟩ := Finset.mem_filter.mp hi
      exact Finset.mem_filter.mpr ⟨(Finset.mem_filter.mp hilow).1, hij⟩
    have hbound := (Finset.card_le_card hsub).trans (hcount j hj)
    rw [hsum]
    omega
  have hpdiv : p ∣ p ^ (m + 1) := by
    simpa only [pow_one] using Nat.pow_dvd_pow p (Nat.succ_le_succ (Nat.zero_le m))
  have hcoprime : Nat.Coprime a p := Nat.Coprime.of_dvd_right hpdiv ha
  have hanz : (a : ZMod p) ≠ 0 :=
    ((ZMod.isUnit_iff_coprime a p).mpr hcoprime).ne_zero
  obtain ⟨b, hb, hbavoid, hbpreserve⟩ := partial_prime_filtering low v level F hrm
    (fun i hi => (Finset.mem_filter.mp hi).2)
    (fun i hi => hdiv i (Finset.mem_filter.mp hi).1)
    (fun i hi => hnext i (Finset.mem_filter.mp hi).1) hbudget a hanz
  refine ⟨b, coprime_prime_power_of_nonzero (Fact.out : p.Prime) hb, ?_, hbpreserve⟩
  intro i hi
  by_cases hilow : level i ≤ r
  · have havoid : digit p m (b * v i) ≠ 0 ∧ digit p m (b * v i) ≠ -1 := by
      simpa only [F, Finset.mem_insert, Finset.mem_singleton, not_or] using
        hbavoid i (Finset.mem_filter.mpr ⟨hi, hilow⟩)
    exact folded_lower_of_digit_avoiding (Fact.out : p.Prime).pos havoid.1 havoid.2
  · have hihigh : r < level i := Nat.lt_of_not_ge hilow
    have hd : p ^ (r + 1) ∣ v i :=
      (Nat.pow_dvd_pow p (Nat.succ_le_of_lt hihigh)).trans (hdiv i hi)
    rw [hbpreserve (v i) hd]
    exact hhigher i hi hihigh

/-- The seed-one arithmetic form of Barajas--Serra Corollary 3. The higher
inputs already meet the distance bound and retain their full residues. -/
theorem corollary_three_distance {ι : Type*} {p m r : ℕ} [Fact p.Prime]
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
        (b * x) % p ^ (m + 1) = x % p ^ (m + 1) := by
  simpa only [one_mul] using corollary_three_distance_of_coprime_seed
    s v level hrm hdiv hnext hcount 1 (by simp)
    (by simpa only [one_mul] using hhigher)

end Loneliness.PrimeFiltering
