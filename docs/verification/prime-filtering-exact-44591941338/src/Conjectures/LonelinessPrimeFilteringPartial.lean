import Conjectures.LonelinessPrimeFilteringChoice
import Conjectures.LonelinessPrimeFilteringResidues
import Mathlib.Data.Nat.Init
import Lean.Elab.Tactic.Omega

/-!
# Partial prime filtering with full higher-residue preservation

This is the lower-level descent used in the proof of Corollary 3 of
Barajas and Serra, *The lonely runner with seven runners*, Electronic
Journal of Combinatorics 15 (2008), R48, doi:10.37236/772.

Starting from any multiplier nonzero modulo the prime, the descent treats
levels at most `r < m`. Each step preserves every full residue whose input
is divisible by `p^(r+1)`. This provides the preservation argument needed
when the higher levels have already been treated; a runner theorem and its
exceptional configurations are separate statements.
-/

open scoped BigOperators

namespace Loneliness.PrimeFiltering

open Loneliness.PrimeFilteringArithmetic Loneliness.PrimeFilteringResidues

/-- Filter the lower levels while preserving every higher input's full
residue under the specified initial multiplier. -/
theorem partial_prime_filtering {ι : Type*} {p m r : ℕ} [Fact p.Prime]
    (s : Finset ι) (v level : ι → ℕ) (F : ι → Finset (ZMod p))
    (hrm : r < m)
    (hlevel : ∀ i ∈ s, level i ≤ r)
    (hdiv : ∀ i ∈ s, p ^ level i ∣ v i)
    (hnext : ∀ i ∈ s, ¬ p ^ (level i + 1) ∣ v i)
    (hbudget : ∀ j ≤ r,
      ∑ i ∈ s.filter (fun i => level i = j), (F i).card ≤ p - 1)
    (a : ℕ) (ha : (a : ZMod p) ≠ 0) :
    ∃ b : ℕ, (b : ZMod p) ≠ 0 ∧
      (∀ i ∈ s, digit p m (b * v i) ∉ F i) ∧
      ∀ x : ℕ, p ^ (r + 1) ∣ x →
        (b * x) % p ^ (m + 1) = (a * x) % p ^ (m + 1) := by
  classical
  have hp : 0 < p := (Fact.out : p.Prime).pos
  let P (j : ℕ) : Prop := ∃ b : ℕ, (b : ZMod p) ≠ 0 ∧
    (∀ i ∈ s, j ≤ level i → digit p m (b * v i) ∉ F i) ∧
    ∀ x : ℕ, p ^ (r + 1) ∣ x →
      (b * x) % p ^ (m + 1) = (a * x) % p ^ (m + 1)
  have hbase : P (r + 1) := by
    refine ⟨a, ha, ?_, fun _ _ => rfl⟩
    intro i hi hlarge
    have hbound := hlevel i hi
    omega
  have hstep : ∀ j < r + 1, P (j + 1) → P j := by
    intro j hj hs
    have hjr : j ≤ r := by omega
    have hjm : j < m := lt_of_le_of_lt hjr hrm
    obtain ⟨b, hb, hbv, hbhigh⟩ := hs
    let sj := s.filter (fun i => level i = j)
    have hslope : ∀ i ∈ sj, digit p j (b * v i) ≠ 0 := by
      intro i hi
      obtain ⟨his, hij⟩ := Finset.mem_filter.mp hi
      have hd : p ^ j ∣ v i := by simpa only [hij] using hdiv i his
      have hn : ¬ p ^ (j + 1) ∣ v i := by simpa only [hij] using hnext i his
      rw [digit_mul_of_dvd hd]
      exact mul_ne_zero hb (leading_digit_ne_zero hd hn)
    have hcard : (∅ : Finset (ZMod p)).card + ∑ i ∈ sj, (F i).card < p := by
      have hbound := hbudget j hjr
      simp only [Finset.card_empty, zero_add]
      dsimp only [sj]
      omega
    obtain ⟨k, _hkp, _hkB, hkF⟩ := exists_nat_affine_avoiding sj ∅ F
      (fun i => digit p m (b * v i)) (fun i => digit p j (b * v i)) hslope hcard
    let c := 1 + k * p ^ (m - j)
    have hc : (c : ZMod p) ≠ 0 :=
      multiplier_ne_zero_of_lt (Fact.out : p.Prime).one_lt hjm
    refine ⟨c * b, ?_, ?_, ?_⟩
    · simpa only [Nat.cast_mul] using mul_ne_zero hc hb
    · intro i his hji
      by_cases hij : level i = j
      · have hd : p ^ j ∣ b * v i := by
          rw [← hij]
          exact (hdiv i his).mul_left b
        have hupdate : digit p m ((c * b) * v i) =
            digit p m (b * v i) + (k : ZMod p) * digit p j (b * v i) := by
          dsimp only [c]
          rw [mul_assoc]
          exact digit_step hp (Nat.le_of_lt hjm) hd
        rw [hupdate]
        exact hkF i (Finset.mem_filter.mpr ⟨his, hij⟩)
      · have hhi : j + 1 ≤ level i := by omega
        have hd : p ^ (j + 1) ∣ b * v i :=
          (Nat.pow_dvd_pow p hhi).trans ((hdiv i his).mul_left b)
        have hupdate : digit p m ((c * b) * v i) = digit p m (b * v i) := by
          dsimp only [c]
          rw [mul_assoc]
          exact digit_step_of_next_pow_dvd hp (Nat.le_of_lt hjm) hd
        rw [hupdate]
        exact hbv i his hhi
    · intro x hx
      have hjr' : j + 1 ≤ r + 1 := Nat.add_le_add_right hjr 1
      have hd : p ^ (j + 1) ∣ b * x :=
        (Nat.pow_dvd_pow p hjr').trans (hx.mul_left b)
      calc
        ((c * b) * x) % p ^ (m + 1) = (b * x) % p ^ (m + 1) := by
          dsimp only [c]
          rw [mul_assoc]
          exact residue_step_of_next_pow_dvd (Nat.le_of_lt hjm) hd
        _ = (a * x) % p ^ (m + 1) := hbhigh x hx
  have hzero : P 0 := Nat.decreasingInduction' (P := P)
    (fun j hj _ => hstep j hj) (Nat.zero_le (r + 1)) hbase
  obtain ⟨b, hb, hbv, hbhigh⟩ := hzero
  exact ⟨b, hb, fun i hi => hbv i hi (Nat.zero_le _), hbhigh⟩

end Loneliness.PrimeFiltering
