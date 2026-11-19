import Conjectures.LonelinessPrimeFiltering
import Conjectures.LonelinessPrimeFilteringResidues

/-! The prime-filtering conclusion as a coprime natural multiplier and as an
actual unit modulo `p^(m+1)`. Digit periodicity transports the conclusion to
the unit's canonical natural representative. -/

open scoped BigOperators

namespace Loneliness.PrimeFiltering

open Loneliness.PrimeFilteringArithmetic Loneliness.PrimeFilteringResidues

/-- The filtering multiplier is coprime to the full prime-power modulus. -/
theorem prime_filtering_coprime {ι : Type*} {p m : ℕ} [Fact p.Prime]
    (s : Finset ι) (v level : ι → ℕ) (F : ι → Finset (ZMod p))
    (hlevel : ∀ i ∈ s, level i ≤ m)
    (hdiv : ∀ i ∈ s, p ^ level i ∣ v i)
    (hnext : ∀ i ∈ s, ¬ p ^ (level i + 1) ∣ v i)
    (hlower : ∀ j < m, ∑ i ∈ s.filter (fun i => level i = j), (F i).card ≤ p - 1)
    (htop : ∑ i ∈ s.filter (fun i => level i = m), (F i).card ≤ p - 2) :
    ∃ a : ℕ, Nat.Coprime a (p ^ (m + 1)) ∧
      ∀ i ∈ s, digit p m (a * v i) ∉ F i := by
  obtain ⟨a, ha, hav⟩ := prime_filtering_of_card_bounds
    s v level F hlevel hdiv hnext hlower htop
  exact ⟨a, coprime_prime_power_of_nonzero (Fact.out : p.Prime) ha, hav⟩

/-- The finite-modulus formulation of the prime-filtering lemma, with the
top digit evaluated at the unit's actual natural representative. -/
theorem prime_filtering_unit {ι : Type*} {p m : ℕ} [Fact p.Prime]
    (s : Finset ι) (v level : ι → ℕ) (F : ι → Finset (ZMod p))
    (hlevel : ∀ i ∈ s, level i ≤ m)
    (hdiv : ∀ i ∈ s, p ^ level i ∣ v i)
    (hnext : ∀ i ∈ s, ¬ p ^ (level i + 1) ∣ v i)
    (hlower : ∀ j < m, ∑ i ∈ s.filter (fun i => level i = j), (F i).card ≤ p - 1)
    (htop : ∑ i ∈ s.filter (fun i => level i = m), (F i).card ≤ p - 2) :
    ∃ u : (ZMod (p ^ (m + 1)))ˣ,
      ∀ i ∈ s, digit p m ((u : ZMod (p ^ (m + 1))).val * v i) ∉ F i := by
  obtain ⟨a, ha, hav⟩ := prime_filtering_of_card_bounds
    s v level F hlevel hdiv hnext hlower htop
  obtain ⟨u, hu⟩ := exists_unit_lift (m := m) (Fact.out : p.Prime) ha
  refine ⟨u, ?_⟩
  intro i hi
  have hdigit : digit p m ((u : ZMod (p ^ (m + 1))).val * v i) =
      digit p m (a * v i) := by
    apply digit_eq_of_mod_eq
    rw [hu, ZMod.val_natCast]
    simp only [Nat.mul_mod, Nat.mod_mod]
  rw [hdigit]
  exact hav i hi

end Loneliness.PrimeFiltering
