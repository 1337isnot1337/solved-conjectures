module

public import Mathlib.Data.Nat.Prime.Basic
public import Mathlib.Tactic.IntervalCases
public import Mathlib.Tactic.NormNum
public import Mathlib.Tactic.Omega

/-!
# Polignac's conjecture

This concerns the disproved prime-plus-power-of-two conjecture, not prime gaps.
Original: Alphonse de Polignac, Nouvelles annales de mathematiques 8 (1849),
423–429, p.428. Published retraction: Comptes rendus 29 (1849), 738–739,
"Rectification a une precedente communication relative a la theorie des nombres".
The retraction credits Euler's counterexample 959. No discovery is claimed here.
-/
@[expose] public section
namespace Polignac

def Conjecture : Prop :=
  ∀ m : ℕ, 3 < m → Odd m → ∃ p k : ℕ, p.Prime ∧ m = 2 ^ k + p

theorem counterexample_composite : ¬ Nat.Prime 959 := by norm_num

theorem counterexample_not_representable :
    ¬ ∃ p k : ℕ, (p = 1 ∨ p.Prime) ∧ 959 = 2 ^ k + p := by
  rintro ⟨p, k, hp, heq⟩
  have hk : k < 10 := by
    by_contra h
    have h10 : 10 ≤ k := by omega
    have hpow : (2 : ℕ) ^ 10 ≤ 2 ^ k := Nat.pow_le_pow_right (by decide) h10
    norm_num at hpow
    omega
  have hpval : p = 959 - 2 ^ k := by omega
  rw [hpval] at hp
  interval_cases k <;> norm_num at hp

theorem conjecture_false : ¬ Conjecture := by
  intro h
  obtain ⟨p, k, hp, heq⟩ := h 959 (by norm_num) (by decide)
  exact counterexample_not_representable ⟨p, k, Or.inr hp, heq⟩

theorem composite_variant_false :
    ¬ (∀ m : ℕ, 3 < m → Odd m → ¬ m.Prime →
      ∃ p k : ℕ, (p = 1 ∨ p.Prime) ∧ m = 2 ^ k + p) := by
  intro h
  exact counterexample_not_representable
    (h 959 (by norm_num) (by decide) counterexample_composite)
end Polignac
