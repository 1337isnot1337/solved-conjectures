module

public import Mathlib.Data.Nat.Choose.Basic

@[expose] public section
namespace McNamaraSteingrimsson

/-- The row is checked by recurrence identities and small arithmetic,
without reducing the recursive definition of `Nat.choose`. -/
theorem choose25_0 : Nat.choose 25 0 = 1 := Nat.choose_zero_right 25

theorem choose25_1 : Nat.choose 25 1 = 25 := by
  apply Nat.eq_of_mul_eq_mul_right (m := 1) (by decide)
  calc
    Nat.choose 25 1 * 1 = Nat.choose 25 0 * (25 - 0) :=
      Nat.choose_succ_right_eq 25 0
    _ = 25 * 1 := by
      rw [choose25_0]

theorem choose25_2 : Nat.choose 25 2 = 300 := by
  apply Nat.eq_of_mul_eq_mul_right (m := 2) (by decide)
  calc
    Nat.choose 25 2 * 2 = Nat.choose 25 1 * (25 - 1) :=
      Nat.choose_succ_right_eq 25 1
    _ = 300 * 2 := by
      rw [choose25_1]

theorem choose25_3 : Nat.choose 25 3 = 2300 := by
  apply Nat.eq_of_mul_eq_mul_right (m := 3) (by decide)
  calc
    Nat.choose 25 3 * 3 = Nat.choose 25 2 * (25 - 2) :=
      Nat.choose_succ_right_eq 25 2
    _ = 2300 * 3 := by
      rw [choose25_2]

theorem choose25_4 : Nat.choose 25 4 = 12650 := by
  apply Nat.eq_of_mul_eq_mul_right (m := 4) (by decide)
  calc
    Nat.choose 25 4 * 4 = Nat.choose 25 3 * (25 - 3) :=
      Nat.choose_succ_right_eq 25 3
    _ = 12650 * 4 := by
      rw [choose25_3]

theorem choose25_5 : Nat.choose 25 5 = 53130 := by
  apply Nat.eq_of_mul_eq_mul_right (m := 5) (by decide)
  calc
    Nat.choose 25 5 * 5 = Nat.choose 25 4 * (25 - 4) :=
      Nat.choose_succ_right_eq 25 4
    _ = 53130 * 5 := by
      rw [choose25_4]

theorem choose25_6 : Nat.choose 25 6 = 177100 := by
  apply Nat.eq_of_mul_eq_mul_right (m := 6) (by decide)
  calc
    Nat.choose 25 6 * 6 = Nat.choose 25 5 * (25 - 5) :=
      Nat.choose_succ_right_eq 25 5
    _ = 177100 * 6 := by
      rw [choose25_5]

theorem choose25_7 : Nat.choose 25 7 = 480700 := by
  apply Nat.eq_of_mul_eq_mul_right (m := 7) (by decide)
  calc
    Nat.choose 25 7 * 7 = Nat.choose 25 6 * (25 - 6) :=
      Nat.choose_succ_right_eq 25 6
    _ = 480700 * 7 := by
      rw [choose25_6]

theorem choose25_8 : Nat.choose 25 8 = 1081575 := by
  apply Nat.eq_of_mul_eq_mul_right (m := 8) (by decide)
  calc
    Nat.choose 25 8 * 8 = Nat.choose 25 7 * (25 - 7) :=
      Nat.choose_succ_right_eq 25 7
    _ = 1081575 * 8 := by
      rw [choose25_7]

theorem choose25_9 : Nat.choose 25 9 = 2042975 := by
  apply Nat.eq_of_mul_eq_mul_right (m := 9) (by decide)
  calc
    Nat.choose 25 9 * 9 = Nat.choose 25 8 * (25 - 8) :=
      Nat.choose_succ_right_eq 25 8
    _ = 2042975 * 9 := by
      rw [choose25_8]

theorem choose25_10 : Nat.choose 25 10 = 3268760 := by
  apply Nat.eq_of_mul_eq_mul_right (m := 10) (by decide)
  calc
    Nat.choose 25 10 * 10 = Nat.choose 25 9 * (25 - 9) :=
      Nat.choose_succ_right_eq 25 9
    _ = 3268760 * 10 := by
      rw [choose25_9]

theorem choose25_11 : Nat.choose 25 11 = 4457400 := by
  apply Nat.eq_of_mul_eq_mul_right (m := 11) (by decide)
  calc
    Nat.choose 25 11 * 11 = Nat.choose 25 10 * (25 - 10) :=
      Nat.choose_succ_right_eq 25 10
    _ = 4457400 * 11 := by
      rw [choose25_10]

theorem choose25_12 : Nat.choose 25 12 = 5200300 := by
  apply Nat.eq_of_mul_eq_mul_right (m := 12) (by decide)
  calc
    Nat.choose 25 12 * 12 = Nat.choose 25 11 * (25 - 11) :=
      Nat.choose_succ_right_eq 25 11
    _ = 5200300 * 12 := by
      rw [choose25_11]

theorem choose25_13 : Nat.choose 25 13 = 5200300 := by
  apply Nat.eq_of_mul_eq_mul_right (m := 13) (by decide)
  calc
    Nat.choose 25 13 * 13 = Nat.choose 25 12 * (25 - 12) :=
      Nat.choose_succ_right_eq 25 12
    _ = 5200300 * 13 := by
      rw [choose25_12]

theorem choose25_14 : Nat.choose 25 14 = 4457400 := by
  apply Nat.eq_of_mul_eq_mul_right (m := 14) (by decide)
  calc
    Nat.choose 25 14 * 14 = Nat.choose 25 13 * (25 - 13) :=
      Nat.choose_succ_right_eq 25 13
    _ = 4457400 * 14 := by
      rw [choose25_13]

theorem choose25_15 : Nat.choose 25 15 = 3268760 := by
  apply Nat.eq_of_mul_eq_mul_right (m := 15) (by decide)
  calc
    Nat.choose 25 15 * 15 = Nat.choose 25 14 * (25 - 14) :=
      Nat.choose_succ_right_eq 25 14
    _ = 3268760 * 15 := by
      rw [choose25_14]

theorem choose25_16 : Nat.choose 25 16 = 2042975 := by
  apply Nat.eq_of_mul_eq_mul_right (m := 16) (by decide)
  calc
    Nat.choose 25 16 * 16 = Nat.choose 25 15 * (25 - 15) :=
      Nat.choose_succ_right_eq 25 15
    _ = 2042975 * 16 := by
      rw [choose25_15]

theorem choose25_17 : Nat.choose 25 17 = 1081575 := by
  apply Nat.eq_of_mul_eq_mul_right (m := 17) (by decide)
  calc
    Nat.choose 25 17 * 17 = Nat.choose 25 16 * (25 - 16) :=
      Nat.choose_succ_right_eq 25 16
    _ = 1081575 * 17 := by
      rw [choose25_16]

theorem choose25_18 : Nat.choose 25 18 = 480700 := by
  apply Nat.eq_of_mul_eq_mul_right (m := 18) (by decide)
  calc
    Nat.choose 25 18 * 18 = Nat.choose 25 17 * (25 - 17) :=
      Nat.choose_succ_right_eq 25 17
    _ = 480700 * 18 := by
      rw [choose25_17]

theorem choose25_19 : Nat.choose 25 19 = 177100 := by
  apply Nat.eq_of_mul_eq_mul_right (m := 19) (by decide)
  calc
    Nat.choose 25 19 * 19 = Nat.choose 25 18 * (25 - 18) :=
      Nat.choose_succ_right_eq 25 18
    _ = 177100 * 19 := by
      rw [choose25_18]

theorem choose25_20 : Nat.choose 25 20 = 53130 := by
  apply Nat.eq_of_mul_eq_mul_right (m := 20) (by decide)
  calc
    Nat.choose 25 20 * 20 = Nat.choose 25 19 * (25 - 19) :=
      Nat.choose_succ_right_eq 25 19
    _ = 53130 * 20 := by
      rw [choose25_19]

theorem choose25_21 : Nat.choose 25 21 = 12650 := by
  apply Nat.eq_of_mul_eq_mul_right (m := 21) (by decide)
  calc
    Nat.choose 25 21 * 21 = Nat.choose 25 20 * (25 - 20) :=
      Nat.choose_succ_right_eq 25 20
    _ = 12650 * 21 := by
      rw [choose25_20]

theorem choose25_22 : Nat.choose 25 22 = 2300 := by
  apply Nat.eq_of_mul_eq_mul_right (m := 22) (by decide)
  calc
    Nat.choose 25 22 * 22 = Nat.choose 25 21 * (25 - 21) :=
      Nat.choose_succ_right_eq 25 21
    _ = 2300 * 22 := by
      rw [choose25_21]

theorem choose25_23 : Nat.choose 25 23 = 300 := by
  apply Nat.eq_of_mul_eq_mul_right (m := 23) (by decide)
  calc
    Nat.choose 25 23 * 23 = Nat.choose 25 22 * (25 - 22) :=
      Nat.choose_succ_right_eq 25 22
    _ = 300 * 23 := by
      rw [choose25_22]

theorem choose25_24 : Nat.choose 25 24 = 25 := by
  apply Nat.eq_of_mul_eq_mul_right (m := 24) (by decide)
  calc
    Nat.choose 25 24 * 24 = Nat.choose 25 23 * (25 - 23) :=
      Nat.choose_succ_right_eq 25 23
    _ = 25 * 24 := by
      rw [choose25_23]

theorem choose25_25 : Nat.choose 25 25 = 1 := by
  apply Nat.eq_of_mul_eq_mul_right (m := 25) (by decide)
  calc
    Nat.choose 25 25 * 25 = Nat.choose 25 24 * (25 - 24) :=
      Nat.choose_succ_right_eq 25 24
    _ = 1 * 25 := by
      rw [choose25_24]

end McNamaraSteingrimsson
