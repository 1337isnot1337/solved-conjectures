import Mathlib.Data.Nat.Log
import Mathlib.Data.Nat.ModEq
import Mathlib.Data.Nat.Squarefree

namespace SunSquarefreePowers

/-- The parity-dependent representation in OEIS A304081. -/
def Represents (n : ℕ) : Prop :=
  ∃ p k b : ℕ, p.Prime ∧ Odd p ∧ Squarefree (2^k + (1 + n % 2) * 5^b) ∧
    n = p + (2^k + (1 + n % 2) * 5^b)

/-- Both parities use the same odd squarefree shifts, doubled for odd inputs. -/
theorem common_shifts (n : ℕ) : Represents n ↔
    ∃ p a b : ℕ, p.Prime ∧ Odd p ∧ Squarefree (2^(a+1) + 5^b) ∧
      n = p + (1 + n % 2) * (2^(a+1) + 5^b) := by
  have five (b : ℕ) : Odd (5^b) := (show Odd (5 : ℕ) by decide).pow
  have shift_odd (a b : ℕ) : Odd (2^(a+1) + 5^b) := by
    apply Even.add_odd _ (five b)
    exact ⟨2^a, by rw [pow_succ]; omega⟩
  rcases (show n % 2 = 0 ∨ n % 2 = 1 by omega) with hn | hn
  · simp only [Represents, hn, Nat.add_zero, Nat.one_mul]
    constructor
    · rintro ⟨p, k, b, hp, ho, hs, he⟩
      cases k with
      | zero =>
        simp only [pow_zero] at he
        have hp_odd := Nat.odd_iff.mp ho
        have hf_odd := Nat.odd_iff.mp (five b)
        omega
      | succ a => exact ⟨p, a, b, hp, ho, hs, he⟩
    · rintro ⟨p, a, b, hp, ho, hs, he⟩
      exact ⟨p, a+1, b, hp, ho, hs, he⟩
  · simp only [Represents, hn, Nat.reduceAdd]
    constructor
    · rintro ⟨p, k, b, hp, ho, hs, he⟩
      cases k with
      | zero =>
        simp only [pow_zero] at he
        have hp_odd := Nat.odd_iff.mp ho
        omega
      | succ a =>
        have factor : 2^(a+1) + 2*5^b = 2*(2^a + 5^b) := by rw [pow_succ]; omega
        rw [factor] at hs he
        obtain ⟨hc, _, hsf⟩ := Nat.squarefree_mul_iff.mp hs
        cases a with
        | zero =>
          have odd := Nat.odd_iff.mp (Nat.coprime_two_left.mp hc)
          simp only [pow_zero] at odd
          have := Nat.odd_iff.mp (five b)
          omega
        | succ a => exact ⟨p, a, b, hp, ho, hsf, he⟩
    · rintro ⟨p, a, b, hp, ho, hs, he⟩
      refine ⟨p, a+2, b, hp, ho, ?_, ?_⟩
      all_goals rw [show 2^(a+2) + 2*5^b = 2*(2^(a+1) + 5^b) by rw [pow_succ (2 : ℕ) (a+1)]; omega]
      · exact Nat.squarefree_mul_iff.mpr ⟨Nat.coprime_two_left.mpr (shift_odd a b), Nat.squarefree_two, hs⟩
      · exact he

/-- A finite search over exponents with an exact natural-number subtraction. -/
abbrev ValidShift (n a b : ℕ) : Prop :=
  let s := 2^(a+1) + 5^b
  let p := n - (1 + n % 2) * s
  Squarefree s ∧ p.Prime ∧ p % 2 = 1

theorem finite_search (n : ℕ) : Represents n ↔
    ∃ a : Fin (Nat.log 2 n), ∃ b : Fin (Nat.log 5 n + 1), ValidShift n a b := by
  rw [common_shifts]
  constructor
  · rintro ⟨p, a, b, hp, ho, hs, he⟩
    have bound := Nat.le_mul_of_pos_left (2^(a+1) + 5^b) (show 0 < 1 + n % 2 by omega)
    have sumLE := bound.trans ((Nat.le_add_left _ p).trans_eq he.symm)
    have ha := Nat.le_log_of_pow_le (by decide : 1 < 2) ((Nat.le_add_right (2^(a+1)) (5^b)).trans sumLE)
    have hb := Nat.le_log_of_pow_le (by decide : 1 < 5) ((Nat.le_add_left (5^b) (2^(a+1))).trans sumLE)
    have eq : n - (1 + n % 2) * (2^(a+1) + 5^b) = p := by omega
    exact ⟨⟨a, by omega⟩, ⟨b, by omega⟩, hs, eq.symm ▸ hp, eq.symm ▸ Nat.odd_iff.mp ho⟩
  · rintro ⟨a, b, hs, hp, ho⟩
    refine ⟨_, a, b, hp, Nat.odd_iff.mpr ho, hs, ?_⟩
    have bound := hp.two_le
    omega

private theorem reduce_exponent (c a : ℕ) (hc : Nat.ModEq 9 (c^6) 1) :
    Nat.ModEq 9 (c^a) (c^(a%6)) := by
  have h := (hc.pow (a / 6)).mul_right (c^(a%6))
  rw [← pow_mul, ← pow_add, Nat.add_comm (6 * (a / 6)), Nat.mod_add_div] at h
  simpa using h

/-- Exactly one of six exponent-sum classes is excluded by the square divisor 9. -/
theorem nine_dvd_iff (a b : ℕ) : 9 ∣ 2^a + 5^b ↔ (a+b)%6 = 3 := by
  have h := (reduce_exponent 2 a (by decide)).add (reduce_exponent 5 b (by decide))
  have finiteTable : ∀ x y : Fin 6, (9 ∣ 2^x.val + 5^y.val) ↔ (x.val+y.val)%6 = 3 := by decide
  have ht := finiteTable ⟨a % 6, by omega⟩ ⟨b % 6, by omega⟩
  rw [Nat.add_mod a b, Nat.dvd_iff_mod_eq_zero, h]
  simpa only [Nat.dvd_iff_mod_eq_zero] using ht

-- Both examples evaluate the finite predicate inside the Lean kernel.
example : Represents 27 := (finite_search 27).mpr (by decide +kernel)
example : ¬ Represents 7 := by rw [finite_search]; decide +kernel

end SunSquarefreePowers
