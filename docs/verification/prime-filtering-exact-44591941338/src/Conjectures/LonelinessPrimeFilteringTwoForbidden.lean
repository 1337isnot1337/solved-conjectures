import Conjectures.LonelinessPrimeFiltering

/-!
# Avoiding the two extreme digits

The forbidden residues `0` and `-1` leave the interior base-prime digits.
For the prime seven, the filtering budgets hold whenever each exact
divisibility level contains at most three inputs. Choosing one extra digit
position makes the highest level empty. The cases with four or more inputs
at one level are not covered by this corollary.
-/

open scoped BigOperators

namespace Loneliness.PrimeFiltering

open Loneliness.PrimeFilteringArithmetic

/-- Two exclusions per input fit the prime-filtering budgets under the
corresponding bounds on the number of inputs at each exact level. -/
theorem avoid_two_per_level {ι : Type*} {p m : ℕ} [Fact p.Prime]
    (s : Finset ι) (v level : ι → ℕ)
    (hlevel : ∀ i ∈ s, level i ≤ m)
    (hdiv : ∀ i ∈ s, p ^ level i ∣ v i)
    (hnext : ∀ i ∈ s, ¬ p ^ (level i + 1) ∣ v i)
    (hlower : ∀ j < m, 2 * (s.filter (fun i => level i = j)).card ≤ p - 1)
    (htop : 2 * (s.filter (fun i => level i = m)).card ≤ p - 2) :
    ∃ a : ℕ, (a : ZMod p) ≠ 0 ∧
      ∀ i ∈ s, digit p m (a * v i) ≠ 0 ∧ digit p m (a * v i) ≠ -1 := by
  classical
  let F : ι → Finset (ZMod p) := fun _ => {0, -1}
  have hpair : ({(0 : ZMod p), -1} : Finset (ZMod p)).card = 2 :=
    Finset.card_pair (Ne.symm (neg_ne_zero.mpr one_ne_zero))
  have hsum (t : Finset ι) : ∑ i ∈ t, (F i).card = 2 * t.card := by
    simp only [F, hpair, Finset.sum_const, nsmul_eq_mul, Nat.cast_id, mul_comm]
  obtain ⟨a, ha, hav⟩ := prime_filtering_of_card_bounds s v level F hlevel hdiv hnext
    (fun j hj => by rw [hsum]; exact hlower j hj)
    (by rw [hsum]; exact htop)
  refine ⟨a, ha, ?_⟩
  intro i hi
  simpa only [F, Finset.mem_insert, Finset.mem_singleton, not_or] using hav i hi

/-- At most three inputs per level suffice for prime seven, after adding one
empty top digit position. This is an actual simultaneous digit choice. -/
theorem seven_avoid_two_of_three_per_level {ι : Type*} {m : ℕ}
    (s : Finset ι) (v level : ι → ℕ)
    (hlevel : ∀ i ∈ s, level i ≤ m)
    (hdiv : ∀ i ∈ s, 7 ^ level i ∣ v i)
    (hnext : ∀ i ∈ s, ¬ 7 ^ (level i + 1) ∣ v i)
    (hcount : ∀ j ≤ m, (s.filter (fun i => level i = j)).card ≤ 3) :
    ∃ a : ℕ, (a : ZMod 7) ≠ 0 ∧
      ∀ i ∈ s, digit 7 (m + 1) (a * v i) ≠ 0 ∧
        digit 7 (m + 1) (a * v i) ≠ -1 := by
  classical
  let : Fact (Nat.Prime 7) := ⟨by decide⟩
  apply avoid_two_per_level s v level
    (fun i hi => (hlevel i hi).trans (Nat.le_succ m)) hdiv hnext
  · intro j hj
    have hbound := hcount j (by omega)
    omega
  · have hempty : s.filter (fun i => level i = m + 1) = ∅ := by
      apply Finset.filter_eq_empty_iff.mpr
      intro i hi
      exact Nat.ne_of_lt (Nat.lt_succ_of_le (hlevel i hi))
    rw [hempty, Finset.card_empty]
    decide

end Loneliness.PrimeFiltering
