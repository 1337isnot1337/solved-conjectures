module

public import Mathlib.Data.Nat.Digits.Lemmas
public import Mathlib.Tactic

@[expose] public section
namespace SobolewskiUlasException

/-- The Thue–Morse digit sum, literally the sum of the binary digits. -/
def digitSum (n : ℕ) : ℕ := (Nat.digits 2 n).sum

theorem digitSum_double (n : ℕ) : digitSum (2*n)=digitSum n := by
  cases n with
  | zero => rfl
  | succ n =>
    unfold digitSum
    rw [Nat.digits_eq_cons_digits_div (by decide) (show 2*(n+1)≠0 by omega)]
    simp

theorem digitSum_double_add_one (n : ℕ) : digitSum (2*n+1)=digitSum n+1 := by
  unfold digitSum
  rw [Nat.digits_eq_cons_digits_div (by decide) (show 2*n+1≠0 by omega)]
  have h₁ : (2*n+1)%2=1 := by omega
  have h₂ : (2*n+1)/2=n := by omega
  rw [h₁,h₂,List.sum_cons,Nat.add_comm]

/-- Equal to `(-1)^digitSum` for every input. -/
def tmSign (n : ℕ) : ℤ := if (digitSum n)%2=0 then 1 else -1

theorem tmSign_eq_pow (n : ℕ) : tmSign n=(-1 : ℤ)^digitSum n := by
  by_cases h : digitSum n % 2=0
  · have he : digitSum n=2*(digitSum n/2) := by omega
    rw [tmSign,ite_eq_left h]
    nth_rw 1 [he]
    rw [pow_mul]
    norm_num
  · have he : digitSum n=2*(digitSum n/2)+1 := by omega
    rw [tmSign,ite_eq_right h]
    nth_rw 1 [he]
    rw [pow_add,pow_mul]
    norm_num

theorem tmSign_double (n : ℕ) : tmSign (2*n)=tmSign n := by
  simp only [tmSign,digitSum_double]

theorem tmSign_double_add_one (n : ℕ) : tmSign (2*n+1)= -tmSign n := by
  rw [tmSign_eq_pow,tmSign_eq_pow,digitSum_double_add_one,pow_succ]
  ring

/-- The offset of the odd layer: 1 for odd binary digit sum, 5 otherwise. -/
def layerOffset (n : ℕ) : ℕ := if (digitSum n)%2=0 then 5 else 1

def baseValue (n : ℕ) : ℕ := 8*n+layerOffset n

theorem cast_offset (n : ℕ) : (layerOffset n : ℤ)=3+2*tmSign n := by
  unfold layerOffset tmSign
  split_ifs <;> decide

theorem cast_baseValue (n : ℕ) : (baseValue n : ℤ)=8*(n : ℤ)+3+2*tmSign n := by
  unfold baseValue
  push_cast
  rw [cast_offset]
  ring

theorem offset_bounds (n : ℕ) : 1≤layerOffset n ∧ layerOffset n≤5 := by
  unfold layerOffset
  split_ifs <;> decide

theorem baseValue_odd (n : ℕ) : baseValue n%2=1 := by
  unfold baseValue layerOffset
  split_ifs <;> omega

theorem baseValue_strictMono : StrictMono baseValue := by
  intro x y h
  have hx := (offset_bounds x).2
  have hy := (offset_bounds y).1
  unfold baseValue
  omega

/-- Base-16 number consisting of `k` copies of digit 9. -/
def repeatedNine : ℕ→ℕ
  | 0 => 0
  | k+1 => 16*repeatedNine k+9

theorem digitSum_mul_sixteen_add_nine (n : ℕ) : digitSum (16*n+9)=digitSum n+2 := by
  rw [show 16*n+9=2*(2*(2*(2*n+1)))+1 by omega,digitSum_double_add_one,
    digitSum_double,digitSum_double,digitSum_double_add_one]

theorem repeatedNine_digitSum (k : ℕ) : digitSum (repeatedNine k)=2*k := by
  induction k with
  | zero => rfl
  | succ k ih =>
    rw [repeatedNine,digitSum_mul_sixteen_add_nine,ih]
    omega

theorem repeatedNine_odd (k : ℕ) : repeatedNine (k+1)%2=1 := by
  rw [repeatedNine]
  omega

theorem repeatedNine_tmSign (k : ℕ) : tmSign (repeatedNine k)=1 := by
  unfold tmSign
  rw [repeatedNine_digitSum]
  rw [ite_eq_left (by omega)]

theorem repeatedNine_closed_form (k : ℕ) :
    15*repeatedNine k=9*(16^k-1) := by
  induction k with
  | zero => rfl
  | succ k ih =>
    rw [repeatedNine,pow_succ]
    have hp : 0<16^k := by positivity
    have hs : 16^k=16^k-1+1 := by omega
    omega

end SobolewskiUlasException
