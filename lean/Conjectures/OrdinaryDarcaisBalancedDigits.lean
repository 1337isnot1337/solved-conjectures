import Conjectures.OrdinaryDarcaisPacked

/-! A balanced comparison of base digits. Splitting a packed integer in half
keeps the kernel's intermediate numerals short at high polynomial degrees. -/

namespace OrdinaryDarcais

def blockCompare (b : ℕ) : ℕ → ℕ → ℕ → Bool
  | 0, p, q => decide (q % b ≤ p % b)
  | h+1, p, q =>
    let split := b^(2^h)
    blockCompare b h (p % split) (q % split) && blockCompare b h (p / split) (q / split)

private theorem digit_below_split {j m : ℕ} (hj : j < m) (b a : ℕ) :
    a % b^m / b^j % b = a / b^j % b := by
  have factor : b^m = b^j * b^(m-j) := by rw [← pow_add]; congr 1; omega
  rw [factor,Nat.mod_mul_right_div_self]
  apply Nat.mod_mod_of_dvd
  obtain ⟨k,hk⟩ : ∃ k, m-j=k+1 := ⟨m-j-1,by omega⟩
  rw [hk,pow_succ]
  exact dvd_mul_left _ _

theorem blockCompare_digits {b h p q : ℕ} (checked : blockCompare b h p q = true)
    {j : ℕ} (hj : j < 2^h) : q / b^j % b ≤ p / b^j % b := by
  induction h generalizing p q j with
  | zero =>
    have hj' : j=0 := by simpa using hj
    simpa [hj',blockCompare] using checked
  | succ h ih =>
    simp only [blockCompare,Bool.and_eq_true] at checked
    obtain ⟨low,high⟩ := checked
    by_cases before : j < 2^h
    · simpa only [digit_below_split before] using ih low before
    · have small : j-2^h < 2^h := by rw [pow_succ] at hj; omega
      have split : 2^h+(j-2^h)=j := by omega
      simpa only [Nat.div_div_eq_div_mul,← pow_add,split] using ih high small

theorem compareDigits_of_digits {b p q m : ℕ} (stop : q / b^m = 0)
    (digits : ∀ j < m, q / b^j % b ≤ p / b^j % b) : compareDigits b m p q=true := by
  induction m generalizing p q with
  | zero => simpa [compareDigits] using stop
  | succ m ih =>
    rw [compareDigits,Bool.and_eq_true,decide_eq_true_eq]
    constructor
    · simpa using digits 0 (by omega)
    · apply ih
      · simpa only [Nat.div_div_eq_div_mul,← pow_succ'] using stop
      · intro j hj
        simpa only [Nat.div_div_eq_div_mul,← pow_succ'] using digits (j+1) (by omega)

theorem blockCompare_sound {b h p q : ℕ} (checked : blockCompare b h p q=true)
    (bound : q < b^(2^h)) : compareDigits b (2^h) p q=true :=
  compareDigits_of_digits (Nat.div_eq_of_lt bound) (fun _ j => blockCompare_digits checked j)

end OrdinaryDarcais
