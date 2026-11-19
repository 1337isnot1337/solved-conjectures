import Conjectures.LonelinessPrimeFilteringChoice
import Conjectures.LonelinessPrimeFilteringArithmetic
import Mathlib.Data.Nat.Init
import Lean.Elab.Tactic.Omega

/-!
# Prime filtering by descending valuation levels

This is the prime-filtering lemma used by Barajas and Serra in *The lonely
runner with seven runners*, Electronic Journal of Combinatorics 15 (2008),
R48, doi:10.37236/772. The inputs carry their exact divisibility levels.
One forbidden residue is reserved at the highest level to keep the
multiplier nonzero modulo the prime. At every lower level the multiplier
is congruent to one and preserves all previously filtered levels.

The result is a finite modular filtering theorem. The exceptional residue
configurations needed for the six-speed runner bound are separate work.
-/

open scoped BigOperators

namespace Loneliness.PrimeFiltering

open Loneliness.PrimeFilteringArithmetic

/-- A multiplier not divisible by `p` simultaneously avoids all prescribed
top-digit sets, subject to the exact budget at each divisibility level. -/
theorem prime_filtering {ι : Type*} {p m : ℕ} [Fact p.Prime]
    (s : Finset ι) (v level : ι → ℕ) (F : ι → Finset (ZMod p))
    (hlevel : ∀ i ∈ s, level i ≤ m)
    (hdiv : ∀ i ∈ s, p ^ level i ∣ v i)
    (hnext : ∀ i ∈ s, ¬ p ^ (level i + 1) ∣ v i)
    (hbudget : ∀ j ≤ m,
      (if j = m then 1 else 0) +
        ∑ i ∈ s.filter (fun i => level i = j), (F i).card < p) :
    ∃ a : ℕ, (a : ZMod p) ≠ 0 ∧
      ∀ i ∈ s, digit p m (a * v i) ∉ F i := by
  classical
  have hp : 0 < p := (Fact.out : p.Prime).pos
  let P (j : ℕ) : Prop := ∃ a : ℕ, (a : ZMod p) ≠ 0 ∧
    ∀ i ∈ s, j ≤ level i → digit p m (a * v i) ∉ F i
  have hbase : P (m + 1) := by
    refine ⟨1, by simp, ?_⟩
    intro i hi hlarge
    have hbound := hlevel i hi
    omega
  have hstep : ∀ j < m + 1, P (j + 1) → P j := by
    intro j hj hs
    have hjm : j ≤ m := by omega
    obtain ⟨a, ha, hav⟩ := hs
    let sj := s.filter (fun i => level i = j)
    let B : Finset (ZMod p) := if j = m then {-1} else ∅
    have hslope : ∀ i ∈ sj, digit p j (a * v i) ≠ 0 := by
      intro i hi
      obtain ⟨his, hij⟩ := Finset.mem_filter.mp hi
      have hd : p ^ j ∣ v i := by simpa only [hij] using hdiv i his
      have hn : ¬ p ^ (j + 1) ∣ v i := by simpa only [hij] using hnext i his
      rw [digit_mul_of_dvd hd]
      exact mul_ne_zero ha (leading_digit_ne_zero hd hn)
    have hcard : B.card + ∑ i ∈ sj, (F i).card < p := by
      by_cases heq : j = m
      · simpa [B, sj, heq] using hbudget j hjm
      · simpa [B, sj, heq] using hbudget j hjm
    obtain ⟨k, _hkp, hkB, hkF⟩ := exists_nat_affine_avoiding sj B F
      (fun i => digit p m (a * v i)) (fun i => digit p j (a * v i)) hslope hcard
    let b := 1 + k * p ^ (m - j)
    have hb : (b : ZMod p) ≠ 0 := by
      apply multiplier_ne_zero (Fact.out : p.Prime).one_lt hjm
      intro heq
      simpa [B, heq] using hkB
    refine ⟨b * a, ?_, ?_⟩
    · simpa only [Nat.cast_mul] using mul_ne_zero hb ha
    · intro i his hji
      by_cases hij : level i = j
      · have hd : p ^ j ∣ a * v i := by
          rw [← hij]
          exact (hdiv i his).mul_left a
        have hupdate : digit p m ((b * a) * v i) =
            digit p m (a * v i) + (k : ZMod p) * digit p j (a * v i) := by
          dsimp only [b]
          rw [mul_assoc]
          exact digit_step hp hjm hd
        rw [hupdate]
        exact hkF i (Finset.mem_filter.mpr ⟨his, hij⟩)
      · have hhi : j + 1 ≤ level i := by omega
        have hd : p ^ (j + 1) ∣ a * v i :=
          (Nat.pow_dvd_pow p hhi).trans ((hdiv i his).mul_left a)
        have hupdate : digit p m ((b * a) * v i) = digit p m (a * v i) := by
          dsimp only [b]
          rw [mul_assoc]
          exact digit_step_of_next_pow_dvd hp hjm hd
        rw [hupdate]
        exact hav i his hhi
  have hzero : P 0 := Nat.decreasingInduction' (P := P)
    (fun j hj _ => hstep j hj) (Nat.zero_le (m + 1)) hbase
  obtain ⟨a, ha, hav⟩ := hzero
  exact ⟨a, ha, fun i hi => hav i hi (Nat.zero_le _)⟩

/-- The usual budget formulation: at most `p - 1` exclusions at each lower
level, and at most `p - 2` exclusions at the highest level. -/
theorem prime_filtering_of_card_bounds {ι : Type*} {p m : ℕ} [Fact p.Prime]
    (s : Finset ι) (v level : ι → ℕ) (F : ι → Finset (ZMod p))
    (hlevel : ∀ i ∈ s, level i ≤ m)
    (hdiv : ∀ i ∈ s, p ^ level i ∣ v i)
    (hnext : ∀ i ∈ s, ¬ p ^ (level i + 1) ∣ v i)
    (hlower : ∀ j < m, ∑ i ∈ s.filter (fun i => level i = j), (F i).card ≤ p - 1)
    (htop : ∑ i ∈ s.filter (fun i => level i = m), (F i).card ≤ p - 2) :
    ∃ a : ℕ, (a : ZMod p) ≠ 0 ∧
      ∀ i ∈ s, digit p m (a * v i) ∉ F i := by
  apply prime_filtering s v level F hlevel hdiv hnext
  intro j hj
  have hp := (Fact.out : p.Prime).two_le
  by_cases heq : j = m
  · subst j
    simp only [ite_true]
    omega
  · have hlt : j < m := by omega
    have hbound := hlower j hlt
    simp only [heq, ite_false, zero_add]
    omega

end Loneliness.PrimeFiltering
