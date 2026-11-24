import Mathlib.Data.Fin.VecNotation
import Mathlib.Data.Nat.Prime.Basic
import Mathlib.Data.Fintype.Basic
import Mathlib.Tactic

/-!
# Goldbach's lesser conjecture

M. A. Stern, "Sur une assertion de Goldbach relative aux nombres impairs",
Nouvelles annales de mathématiques (1) 15 (1856), 23–24.
https://www.numdam.org/item/NAM_1856_1_15__23_0.pdf

The historical formulation is refuted even allowing 1 as a prime.
The two odd composite witnesses are Stern and his students' 5777 and 5993.
-/
namespace PublishedGoldbachLesser

/-- The universal odd-number assertion, including the historical convention
that the prime summand could be 1. Nonnegative square roots suffice. -/
def LesserConjecture : Prop :=
  ∀ n : ℕ, n % 2 = 1 →
    ∃ p a : ℕ, (p = 1 ∨ p.Prime) ∧ n = p + 2 * a ^ 2

private def factors5777 : Fin 54 → ℕ × ℕ := ![
  (53, 109), (3, 1925), (3, 1923), (13, 443), (3, 1915), (3, 1909),
  (5, 1141), (3, 1893), (3, 1883), (5, 1123), (3, 1859), (3, 1845),
  (11, 499), (3, 1813), (3, 1795), (7, 761), (3, 1755), (3, 1733),
  (23, 223), (3, 1685), (3, 1659), (5, 979), (3, 1603), (3, 1573),
  (5, 925), (3, 1509), (3, 1475), (7, 617), (3, 1403), (3, 1365),
  (41, 97), (3, 1285), (3, 1243), (59, 61), (3, 1155), (3, 1109),
  (5, 637), (3, 1013), (3, 963), (5, 547), (3, 859), (3, 805),
  (13, 173), (3, 693), (3, 635), (11, 157), (3, 515), (3, 453),
  (7, 167), (3, 325), (3, 259), (5, 115), (3, 123), (3, 53)
]

private def factors5993 : Fin 55 → ℕ × ℕ := ![
  (13, 461), (3, 1997), (3, 1995), (5, 1195), (3, 1987), (3, 1981),
  (31, 191), (3, 1965), (3, 1955), (7, 833), (3, 1931), (3, 1917),
  (5, 1141), (3, 1885), (3, 1867), (23, 241), (3, 1827), (3, 1805),
  (5, 1069), (3, 1757), (3, 1731), (19, 269), (3, 1675), (3, 1645),
  (47, 103), (3, 1581), (3, 1547), (5, 907), (3, 1475), (3, 1437),
  (7, 599), (3, 1357), (3, 1315), (5, 763), (3, 1227), (3, 1181),
  (19, 179), (3, 1085), (3, 1035), (13, 227), (3, 931), (3, 877),
  (5, 493), (3, 765), (3, 707), (29, 67), (3, 587), (3, 525),
  (5, 277), (3, 397), (3, 331), (7, 113), (3, 195), (3, 125),
  (7, 23)
]

private def IsCertificate (n : ℕ) {bound : ℕ} (f : Fin bound → ℕ × ℕ) : Prop :=
  ∀ i : Fin bound, (f i).1 ≠ 1 ∧ (f i).2 ≠ 1 ∧
    (f i).1 * (f i).2 = n - 2 * i.val ^ 2 ∧ n - 2 * i.val ^ 2 ≠ 1

set_option maxRecDepth 10000 in
set_option maxHeartbeats 0 in
private theorem cert5777 : IsCertificate 5777 factors5777 := by
  unfold IsCertificate
  decide

set_option maxRecDepth 10000 in
set_option maxHeartbeats 0 in
private theorem cert5993 : IsCertificate 5993 factors5993 := by
  unfold IsCertificate
  decide

private theorem reject_of_certificate {n bound : ℕ} (f : Fin bound → ℕ × ℕ)
    (hb : n < 2 * bound ^ 2) (hc : IsCertificate n f) :
    ∀ p a : ℕ, (p = 1 ∨ p.Prime) → n ≠ p + 2 * a ^ 2 := by
  intro p a hp heq
  have ha : a < bound := by
    by_contra h
    have hle : bound ≤ a := by omega
    have hsq : bound ^ 2 ≤ a ^ 2 := by
      simpa only [pow_two] using Nat.mul_le_mul hle hle
    have htwo : 2 * bound ^ 2 ≤ 2 * a ^ 2 := Nat.mul_le_mul_left 2 hsq
    omega
  have hv : p = n - 2 * a ^ 2 := by omega
  obtain ⟨h1, h2, hprod, hn1⟩ := hc ⟨a, ha⟩
  rw [hv] at hp
  rcases hp with hp | hp
  · exact hn1 hp
  · exact Nat.not_prime_of_mul_eq hprod h1 h2 hp

/-- Stern's first published counterexample, with the prime-or-one convention. -/
theorem stern_5777 : ∀ p a : ℕ, (p = 1 ∨ p.Prime) → 5777 ≠ p + 2 * a ^ 2 :=
  reject_of_certificate factors5777 (by decide) cert5777

/-- Stern's second published counterexample, with the same convention. -/
theorem stern_5993 : ∀ p a : ℕ, (p = 1 ∨ p.Prime) → 5993 ≠ p + 2 * a ^ 2 :=
  reject_of_certificate factors5993 (by decide) cert5993

/-- The universal conjecture is false, not merely a statement about a fixed range. -/
theorem goldbach_lesser_false : ¬ LesserConjecture := by
  intro h
  obtain ⟨p, a, hp, heq⟩ := h 5777 (by decide)
  exact stern_5777 p a hp heq

/-- The modern variant with strictly prime summand is false even for
odd composite integers exceeding 17. -/
theorem goldbach_lesser_modern_false :
    ¬ (∀ n : ℕ, 17 < n → n % 2 = 1 → ¬ n.Prime →
      ∃ p a : ℕ, p.Prime ∧ n = p + 2 * a ^ 2) := by
  intro h
  have hn : ¬ (5777 : ℕ).Prime :=
    Nat.not_prime_of_mul_eq (a := 53) (b := 109) (by decide) (by decide) (by decide)
  obtain ⟨p, a, hp, heq⟩ := h 5777 (by decide) (by decide) hn
  exact stern_5777 p a (Or.inr hp) heq

end PublishedGoldbachLesser
