import Conjectures.LonelinessPrimeFiltering
import Mathlib.Data.Nat.PadicValNat
import Mathlib.Data.Finset.Lattice.Fold

/-!
# Prime filtering with canonical p-adic levels

The descending prime-filtering theorem accepts exact divisibility levels.
For positive natural inputs, Mathlib's `padicValNat` supplies those levels.
Their finite supremum gives a canonical highest level and hence the modulus
`p ^ (maxPadicVal p s v + 1)` used by the top-digit map.

The final theorem uses the usual forbidden-set budgets: at most `p - 1`
residues at every lower level and at most `p - 2` at the highest level. It
produces a natural multiplier nonzero modulo `p`. Unit representatives and
the separate runner-distance estimates are handled in other modules.
-/

open scoped BigOperators

namespace Loneliness.PrimeFiltering

open Loneliness.PrimeFilteringArithmetic

/-- The greatest p-adic level occurring in a finite family, with value zero
for an empty family. -/
def maxPadicVal {ι : Type*} (p : ℕ) (s : Finset ι) (v : ι → ℕ) : ℕ :=
  s.sup (fun i => padicValNat p (v i))

theorem padicValNat_le_maxPadicVal {ι : Type*} (p : ℕ) (s : Finset ι)
    (v : ι → ℕ) {i : ι} (hi : i ∈ s) :
    padicValNat p (v i) ≤ maxPadicVal p s v :=
  Finset.le_sup (f := fun i => padicValNat p (v i)) hi

theorem maxPadicVal_le_iff {ι : Type*} (p : ℕ) (s : Finset ι)
    (v : ι → ℕ) (m : ℕ) :
    maxPadicVal p s v ≤ m ↔ ∀ i ∈ s, padicValNat p (v i) ≤ m :=
  Finset.sup_le_iff

/-- A positive input is divisible by exactly its p-adic power, but not the
next power. The positivity hypothesis excludes the default valuation of zero. -/
theorem padic_level_exact {p n : ℕ} [Fact p.Prime] (hn : 0 < n) :
    p ^ padicValNat p n ∣ n ∧ ¬ p ^ (padicValNat p n + 1) ∣ n := by
  refine ⟨pow_padicValNat_dvd, ?_⟩
  intro hd
  have hbad := (Nat.pow_dvd_iff_le_padicValNat
    (Fact.out : p.Prime).ne_one (Nat.ne_of_gt hn)).mp hd
  omega

/-- The canonical prime-power modulus does not divide any selected positive
input. In particular, the selected inputs are nonzero modulo that modulus. -/
theorem not_dvd_pow_maxPadicVal_succ {ι : Type*} {p : ℕ} [Fact p.Prime]
    (s : Finset ι) (v : ι → ℕ) (hpos : ∀ i ∈ s, 0 < v i)
    {i : ι} (hi : i ∈ s) :
    ¬ p ^ (maxPadicVal p s v + 1) ∣ v i := by
  intro hd
  apply (padic_level_exact (p := p) (hpos i hi)).2
  exact (Nat.pow_dvd_pow p
    (Nat.add_le_add_right (padicValNat_le_maxPadicVal p s v hi) 1)).trans hd

/-- Prime filtering with actual p-adic levels and any supplied upper bound. -/
theorem prime_filtering_padic_of_le {ι : Type*} {p m : ℕ} [Fact p.Prime]
    (s : Finset ι) (v : ι → ℕ) (F : ι → Finset (ZMod p))
    (hpos : ∀ i ∈ s, 0 < v i)
    (hlevel : ∀ i ∈ s, padicValNat p (v i) ≤ m)
    (hlower : ∀ j < m,
      ∑ i ∈ s.filter (fun i => padicValNat p (v i) = j), (F i).card ≤ p - 1)
    (htop :
      ∑ i ∈ s.filter (fun i => padicValNat p (v i) = m), (F i).card ≤ p - 2) :
    ∃ a : ℕ, (a : ZMod p) ≠ 0 ∧
      ∀ i ∈ s, digit p m (a * v i) ∉ F i := by
  exact prime_filtering_of_card_bounds s v (fun i => padicValNat p (v i)) F
    hlevel (fun i hi => (padic_level_exact (p := p) (hpos i hi)).1)
    (fun i hi => (padic_level_exact (p := p) (hpos i hi)).2) hlower htop

/-- The prime-filtering lemma with the canonical valuation levels and their
finite maximum. No exact-divisibility hypotheses remain for callers to supply. -/
theorem prime_filtering_padic {ι : Type*} {p : ℕ} [Fact p.Prime]
    (s : Finset ι) (v : ι → ℕ) (F : ι → Finset (ZMod p))
    (hpos : ∀ i ∈ s, 0 < v i)
    (hlower : ∀ j < maxPadicVal p s v,
      ∑ i ∈ s.filter (fun i => padicValNat p (v i) = j), (F i).card ≤ p - 1)
    (htop : ∑ i ∈ s.filter (fun i => padicValNat p (v i) = maxPadicVal p s v),
      (F i).card ≤ p - 2) :
    ∃ a : ℕ, (a : ZMod p) ≠ 0 ∧
      ∀ i ∈ s, digit p (maxPadicVal p s v) (a * v i) ∉ F i := by
  exact prime_filtering_padic_of_le s v F hpos
    (fun _ hi => padicValNat_le_maxPadicVal p s v hi) hlower htop

end Loneliness.PrimeFiltering
