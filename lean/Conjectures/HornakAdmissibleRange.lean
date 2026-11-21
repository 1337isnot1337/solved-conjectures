import Conjectures.HornakLargeSource

/-! The next-modulus endpoint in the finite source-test range. -/
namespace Hornak

theorem next_modulus_carry_at_upper (arms : Fin 3 → ℕ) (i : ℕ)
    (hi : i = arms 1+arms 2) :
    (∑ j, arms j%(i+1))/(i+1) ≤ 1 := by
  have h1 : arms 1 < i+1 := by omega
  have h2 : arms 2 < i+1 := by omega
  have h0 := Nat.mod_lt (arms 0) (by omega : 0 < i+1)
  have hsum : (∑ j, arms j%(i+1)) < 2*(i+1) := by
    rw [Fin.sum_univ_three, Nat.mod_eq_of_lt h1, Nat.mod_eq_of_lt h2]
    omega
  have hh := (Nat.div_lt_iff_lt_mul (by omega : 0 < i+1)).2 hsum
  omega

/-- The one additional carry bound needed at the upper endpoint follows
from the two shorter arm lengths, so the original finite range suffices. -/
theorem regular_source_from_index_range (arms : Fin 3 → ℕ)
    (hcarry : ∀ k, 0 < k → k ≤ arms 1+arms 2 → (∑ j, arms j%k)/k ≤ 1)
    (hsource5 : ∀ i, 0 < i → i ≤ arms 1+arms 2 → ∀ a b : ℕ, a ≤ i → 1 ≤ b →
      a*i+b*(i+1) = 1+∑ j, arms j →
      (∑ j, arms j%(i+1))/(i+1) = 1 →
      ∃ p : Fin 3, (∑ j, arms j%(i+1))%(i+1) < arms p%(i+1) ∧
        i+1 ≤ arms p/i+arms p%(i+1)) :
    ∀ i, 0 < i → i ≤ arms 1+arms 2 → RegularSourceAt arms i := by
  intro i hi hb
  refine ⟨hcarry i hi hb,?_,hsource5 i hi hb⟩
  by_cases h : i = arms 1+arms 2
  · exact next_modulus_carry_at_upper arms i h
  · exact hcarry (i+1) (by omega) (by omega)

/-- Every large-part tripod partition is realized under tests 1 and 5
in the original finite index range. -/
theorem large_parts_from_index_range (arms : Fin 3 → ℕ) (hshortpos : 0 < arms 2)
    (hcarry : ∀ k, 0 < k → k ≤ arms 1+arms 2 → (∑ j, arms j%k)/k ≤ 1)
    (hsource5 : ∀ i, 0 < i → i ≤ arms 1+arms 2 → ∀ a b : ℕ, a ≤ i → 1 ≤ b →
      a*i+b*(i+1) = 1+∑ j, arms j →
      (∑ j, arms j%(i+1))/(i+1) = 1 →
      ∃ p : Fin 3, (∑ j, arms j%(i+1))%(i+1) < arms p%(i+1) ∧
        i+1 ≤ arms p/i+arms p%(i+1)) :
    ∀ largest : ℕ, ∀ parts : List ℕ,
      (∀ x ∈ parts, x ≤ largest) →
      arms 2 < largest → (∀ x ∈ parts, arms 2 < x) →
      largest+parts.sum = 1+∑ j, arms j →
      Partitionable arms (Fin.cases largest parts.get) := by
  exact large_parts_from_regular_source arms hshortpos (regular_source_from_index_range arms hcarry hsource5)

end Hornak
