import Mathlib.Algebra.Polynomial.Expand
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.NumberTheory.Padics.PadicVal.Basic
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring

namespace GawronMiskaUlas

def choose (m : Nat) : Nat → Nat
  | 0 => 1
  | (i+1) => (choose m i * (m-i))/(i+1)

def signedChoose (m i : Nat) : Int :=
  if i % 2 = 0 then (choose m i : Int) else -(choose m i : Int)

def step (m : Nat) (c : Nat → Int) (n : Nat) : Int :=
  ((List.range (m+1)).map fun i =>
    if i ≤ n ∧ (n-i)%2=0 then signedChoose m i * c ((n-i)/2) else 0).sum

def partialCoeff (m : Nat) : Nat → Nat → Int
  | 0, n => if n = 0 then 1 else 0
  | k+1, n => step m (partialCoeff m k) n

def coeff (m n : Nat) : Int := partialCoeff m (n+1) n

theorem partialCoeff_succ_eq_below (m k n : Nat) (hn : n < 2^k) :
    partialCoeff m (k+1) n = partialCoeff m k n := by
  induction k generalizing n with
  | zero =>
    have h : n = 0 := by simpa using hn
    subst n
    change step m (partialCoeff m 0) 0 = partialCoeff m 0 0
    unfold step
    rw [List.range_succ_eq_map]
    simp only [List.map_cons, List.map_map, Function.comp_def, List.sum_cons]
    simp [partialCoeff, signedChoose, choose]
  | succ k ih =>
    change step m (partialCoeff m (k+1)) n = step m (partialCoeff m k) n
    unfold step
    congr 1
    apply List.map_congr_left
    intro i _
    split <;> rename_i h
    · rw [ih]
      rw [Nat.div_lt_iff_lt_mul (by decide : 0 < 2)]
      rw [Nat.pow_succ] at hn
      omega
    · rfl

theorem partialCoeff_eq_add (m k d n : Nat) (hn : n < 2^k) :
    partialCoeff m (k+d) n = partialCoeff m k n := by
  induction d with
  | zero => rfl
  | succ d ih =>
    rw [Nat.add_succ, partialCoeff_succ_eq_below, ih]
    exact Nat.lt_of_lt_of_le hn (Nat.pow_le_pow_right (by decide) (Nat.le_add_right k d))

theorem partialCoeff_is_coeff (m k n : Nat) (hn : n < 2^k) :
    partialCoeff m k n = coeff m n := by
  have hn' : n < 2^(n+1) := Nat.lt_trans (Nat.lt_succ_self n) Nat.lt_two_pow_self
  unfold coeff
  rcases Nat.le_total k (n+1) with hk | hk
  · have h := partialCoeff_eq_add m k (n+1-k) n hn
    rw [Nat.add_sub_of_le hk] at h
    exact h.symm
  · have h := partialCoeff_eq_add m (n+1) (k-(n+1)) n hn'
    rwa [Nat.add_sub_of_le hk] at h

theorem partialCoeff_succ (m k n : Nat) : partialCoeff m (k+1) n = step m (partialCoeff m k) n := rfl

open scoped BigOperators Polynomial
open Polynomial

/-- The literal k-factor truncation of the Thue–Morse product. -/
noncomputable def partialProduct (k : Nat) : ℤ[X] :=
  ∏ j ∈ Finset.range k, (1 - X ^ (2 ^ j))

theorem partialProduct_succ (k : Nat) :
    partialProduct (k+1) = (1-X) * Polynomial.expand ℤ 2 (partialProduct k) := by
  unfold partialProduct
  rw [Finset.prod_range_succ', map_prod]
  simp only [pow_zero, pow_one, map_sub, map_one, map_pow, Polynomial.expand_X]
  rw [mul_comm]
  congr 1
  apply Finset.prod_congr rfl
  intro j _
  rw [← pow_mul, Nat.pow_succ, Nat.mul_comm]

theorem choose_eq (m i : Nat) : choose m i = m.choose i := by
  induction i with
  | zero => simp [choose]
  | succ i hi =>
    rw [choose, hi, ← Nat.choose_succ_right_eq]
    simp

theorem signedChoose_eq (m i : Nat) :
    signedChoose m i = (-1 : Int)^i * (m.choose i : Int) := by
  unfold signedChoose
  rw [choose_eq]
  rcases Nat.mod_two_eq_zero_or_one i with h | h
  · rw [ite_eq_left h]
    have hh : i = 2 * (i/2) := by omega
    have hp : (-1 : Int)^i = 1 := by rw [hh, pow_mul]; norm_num
    simp [hp]
  · rw [ite_eq_right (by omega)]
    have hh : i = 2 * (i/2) + 1 := by omega
    have hp : (-1 : Int)^i = -1 := by rw [hh, pow_succ, pow_mul]; norm_num
    simp [hp]

theorem list_sum_range (n : Nat) (f : Nat → Int) :
    ((List.range n).map f).sum = ∑ i ∈ Finset.range n, f i := by
  induction n with
  | zero => simp
  | succ n ih => simp [List.range_succ, Finset.sum_range_succ, ih]

theorem one_sub_X_pow (m : Nat) :
    ((1 : ℤ[X]) - X)^m =
      ∑ i ∈ Finset.range (m+1), C (signedChoose m i) * X^i := by
  have h : (1 : ℤ[X])-X = C (-1) * X + 1 := by simp [sub_eq_add_neg, add_comm]
  rw [h, add_pow]
  apply Finset.sum_congr rfl
  intro i _
  rw [signedChoose_eq, map_mul, map_pow, mul_pow, one_pow, mul_one]
  rw [map_natCast]
  ring

theorem partialCoeff_eq_polynomial (m k n : Nat) :
    partialCoeff m k n = ((partialProduct k)^m).coeff n := by
  induction k generalizing n with
  | zero => simp [partialCoeff, partialProduct, coeff_one]
  | succ k ih =>
    rw [partialCoeff_succ, partialProduct_succ, mul_pow, ← map_pow, one_sub_X_pow,
      Finset.sum_mul, Polynomial.finsetSum_coeff]
    simp only [step, list_sum_range]
    apply Finset.sum_congr rfl
    intro i _
    rw [mul_assoc, coeff_C_mul, coeff_X_pow_mul']
    rw [Polynomial.coeff_expand (by decide : 0 < 2)]
    simp only [Nat.dvd_iff_mod_eq_zero]
    by_cases hi : i ≤ n
    · by_cases hj : (n-i)%2 = 0 <;> simp [hi, hj, ih]
    · simp [hi]

/-- This connects the executable sequence to the source formal product, coefficient by coefficient. -/
theorem coeff_eq_stable_product (m k n : Nat) (hn : n < 2^k) :
    ((partialProduct k)^m).coeff n = coeff m n :=
  (partialCoeff_eq_polynomial m k n).symm.trans (partialCoeff_is_coeff m k n hn)

/-- The formal Thue–Morse series obtained by stabilizing partial-product coefficients. -/
def thueMorseSeries : PowerSeries ℤ := PowerSeries.mk (coeff 1)

theorem powerSeries_coeff_matches (m k n : Nat) (hn : n < 2^k) :
    PowerSeries.coeff n (thueMorseSeries^m) = ((partialProduct k)^m).coeff n := by
  induction m generalizing n with
  | zero => simp [PowerSeries.coeff_one, Polynomial.coeff_one]
  | succ m ih =>
    rw [pow_succ, pow_succ, PowerSeries.coeff_mul, Polynomial.coeff_mul]
    apply Finset.sum_congr rfl
    rintro ⟨i,j⟩ hij
    have hij' : i+j=n := Finset.mem_antidiagonal.mp hij
    rw [ih i (by omega)]
    have hj : j < 2^k := by omega
    simp only [thueMorseSeries, PowerSeries.coeff_mk, ← coeff_eq_stable_product 1 k j hj, pow_one]

/-- The source coefficient, computed by the certified partial-product recurrence. -/
noncomputable def t (m n : Nat) : Int := PowerSeries.coeff n (thueMorseSeries^m)

theorem t_eq_coeff (m n : Nat) : t m n = coeff m n := by
  have hn : n < 2^(n+1) := Nat.lt_trans (Nat.lt_succ_self n) Nat.lt_two_pow_self
  exact (powerSeries_coeff_matches m (n+1) n hn).trans (coeff_eq_stable_product m (n+1) n hn)

section NumericalCertificate
set_option linter.unusedSimpArgs false

private theorem range18 : List.range (17+1) =
  [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17] := rfl
private theorem partialCoeff_zero (m n : Nat) :
    partialCoeff m 0 n = (if n=0 then 1 else 0) := rfl

macro "gmu_calc" "[" hs:Lean.Parser.Tactic.simpLemma,* "]" : tactic =>
  `(tactic|
    (rw [partialCoeff_succ]
     simp only [step, range18, List.map_cons, List.map_nil, List.sum_cons, List.sum_nil,
       Nat.reduceLeDiff, Nat.reduceSub, Nat.reduceMod, Nat.reduceDiv, Nat.reduceEqDiff,
       and_self, true_and, false_and, and_false, ite_true, ite_false, partialCoeff_zero,
       $hs,*] <;> decide +kernel))

private theorem c_1_1 : partialCoeff 17 1 1 = -17 := by
  gmu_calc []

private theorem c_1_0 : partialCoeff 17 1 0 = 1 := by
  gmu_calc []

private theorem c_2_3 : partialCoeff 17 2 3 = -391 := by
  gmu_calc [c_1_1, c_1_0]

private theorem c_2_2 : partialCoeff 17 2 2 = 119 := by
  gmu_calc [c_1_1, c_1_0]

private theorem c_2_1 : partialCoeff 17 2 1 = -17 := by
  gmu_calc [c_1_0]

private theorem c_2_0 : partialCoeff 17 2 0 = 1 := by
  gmu_calc [c_1_0]

private theorem c_3_7 : partialCoeff 17 3 7 = 11475 := by
  gmu_calc [c_2_3, c_2_2, c_2_1, c_2_0]

private theorem c_3_6 : partialCoeff 17 3 6 = -12291 := by
  gmu_calc [c_2_3, c_2_2, c_2_1, c_2_0]

private theorem c_3_5 : partialCoeff 17 3 5 = 3349 := by
  gmu_calc [c_2_2, c_2_1, c_2_0]

private theorem c_3_4 : partialCoeff 17 3 4 = 187 := by
  gmu_calc [c_2_2, c_2_1, c_2_0]

private theorem c_3_3 : partialCoeff 17 3 3 = -391 := by
  gmu_calc [c_2_1, c_2_0]

private theorem c_3_2 : partialCoeff 17 3 2 = 119 := by
  gmu_calc [c_2_1, c_2_0]

private theorem c_3_1 : partialCoeff 17 3 1 = -17 := by
  gmu_calc [c_2_0]

private theorem c_3_0 : partialCoeff 17 3 0 = 1 := by
  gmu_calc [c_2_0]

private theorem c_4_15 : partialCoeff 17 4 15 = -8124793 := by
  gmu_calc [c_3_7, c_3_6, c_3_5, c_3_4, c_3_3, c_3_2, c_3_1, c_3_0]

private theorem c_4_14 : partialCoeff 17 4 14 = 1329417 := by
  gmu_calc [c_3_7, c_3_6, c_3_5, c_3_4, c_3_3, c_3_2, c_3_1, c_3_0]

private theorem c_4_13 : partialCoeff 17 4 13 = 1693761 := by
  gmu_calc [c_3_6, c_3_5, c_3_4, c_3_3, c_3_2, c_3_1, c_3_0]

private theorem c_4_12 : partialCoeff 17 4 12 = -1382321 := by
  gmu_calc [c_3_6, c_3_5, c_3_4, c_3_3, c_3_2, c_3_1, c_3_0]

private theorem c_4_11 : partialCoeff 17 4 11 = 321997 := by
  gmu_calc [c_3_5, c_3_4, c_3_3, c_3_2, c_3_1, c_3_0]

private theorem c_4_10 : partialCoeff 17 4 10 = 177123 := by
  gmu_calc [c_3_5, c_3_4, c_3_3, c_3_2, c_3_1, c_3_0]

private theorem c_4_9 : partialCoeff 17 4 9 = -167365 := by
  gmu_calc [c_3_4, c_3_3, c_3_2, c_3_1, c_3_0]

private theorem c_4_8 : partialCoeff 17 4 8 = 44149 := by
  gmu_calc [c_3_4, c_3_3, c_3_2, c_3_1, c_3_0]

private theorem c_4_7 : partialCoeff 17 4 7 = 11475 := by
  gmu_calc [c_3_3, c_3_2, c_3_1, c_3_0]

private theorem c_5_31 : partialCoeff 17 5 31 = 6008995304 := by
  gmu_calc [c_4_15, c_4_14, c_4_13, c_4_12, c_4_11, c_4_10, c_4_9, c_4_8, c_4_7]

private theorem c_5_30 : partialCoeff 17 5 30 = -2636780648 := by
  gmu_calc [c_4_15, c_4_14, c_4_13, c_4_12, c_4_11, c_4_10, c_4_9, c_4_8, c_4_7]

private theorem c_4_6 : partialCoeff 17 4 6 = -12291 := by
  gmu_calc [c_3_3, c_3_2, c_3_1, c_3_0]

private theorem c_5_29 : partialCoeff 17 5 29 = -1223926696 := by
  gmu_calc [c_4_14, c_4_13, c_4_12, c_4_11, c_4_10, c_4_9, c_4_8, c_4_7, c_4_6]

private theorem c_5_28 : partialCoeff 17 5 28 = 2258525480 := by
  gmu_calc [c_4_14, c_4_13, c_4_12, c_4_11, c_4_10, c_4_9, c_4_8, c_4_7, c_4_6]

private theorem c_4_5 : partialCoeff 17 4 5 = 3349 := by
  gmu_calc [c_3_2, c_3_1, c_3_0]

private theorem c_5_27 : partialCoeff 17 5 27 = -1029408344 := by
  gmu_calc [c_4_13, c_4_12, c_4_11, c_4_10, c_4_9, c_4_8, c_4_7, c_4_6, c_4_5]

private theorem c_5_26 : partialCoeff 17 5 26 = -375201832 := by
  gmu_calc [c_4_13, c_4_12, c_4_11, c_4_10, c_4_9, c_4_8, c_4_7, c_4_6, c_4_5]

private theorem c_4_4 : partialCoeff 17 4 4 = 187 := by
  gmu_calc [c_3_2, c_3_1, c_3_0]

private theorem c_5_25 : partialCoeff 17 5 25 = 776939032 := by
  gmu_calc [c_4_12, c_4_11, c_4_10, c_4_9, c_4_8, c_4_7, c_4_6, c_4_5, c_4_4]

private theorem c_5_24 : partialCoeff 17 5 24 = -384695448 := by
  gmu_calc [c_4_12, c_4_11, c_4_10, c_4_9, c_4_8, c_4_7, c_4_6, c_4_5, c_4_4]

private theorem c_4_3 : partialCoeff 17 4 3 = -391 := by
  gmu_calc [c_3_1, c_3_0]

private theorem c_5_23 : partialCoeff 17 5 23 = -83712216 := by
  gmu_calc [c_4_11, c_4_10, c_4_9, c_4_8, c_4_7, c_4_6, c_4_5, c_4_4, c_4_3]

private theorem c_6_62 : partialCoeff 17 6 62 = -3091186722496 := by
  gmu_calc [c_5_31, c_5_30, c_5_29, c_5_28, c_5_27, c_5_26, c_5_25, c_5_24, c_5_23]

private theorem c_5_22 : partialCoeff 17 5 22 = 233236056 := by
  gmu_calc [c_4_11, c_4_10, c_4_9, c_4_8, c_4_7, c_4_6, c_4_5, c_4_4, c_4_3]

private theorem c_6_61 : partialCoeff 17 6 61 = 7353759095616 := by
  gmu_calc [c_5_30, c_5_29, c_5_28, c_5_27, c_5_26, c_5_25, c_5_24, c_5_23, c_5_22]

private theorem c_6_60 : partialCoeff 17 6 60 = -3978458801984 := by
  gmu_calc [c_5_30, c_5_29, c_5_28, c_5_27, c_5_26, c_5_25, c_5_24, c_5_23, c_5_22]

private theorem c_4_2 : partialCoeff 17 4 2 = 119 := by
  gmu_calc [c_3_1, c_3_0]

private theorem c_5_21 : partialCoeff 17 5 21 = -128607720 := by
  gmu_calc [c_4_10, c_4_9, c_4_8, c_4_7, c_4_6, c_4_5, c_4_4, c_4_3, c_4_2]

private theorem c_6_59 : partialCoeff 17 6 59 = -1806839936448 := by
  gmu_calc [c_5_29, c_5_28, c_5_27, c_5_26, c_5_25, c_5_24, c_5_23, c_5_22, c_5_21]

private theorem c_6_58 : partialCoeff 17 6 58 = 4256679596480 := by
  gmu_calc [c_5_29, c_5_28, c_5_27, c_5_26, c_5_25, c_5_24, c_5_23, c_5_22, c_5_21]

private theorem c_5_20 : partialCoeff 17 5 20 = -8264856 := by
  gmu_calc [c_4_10, c_4_9, c_4_8, c_4_7, c_4_6, c_4_5, c_4_4, c_4_3, c_4_2]

private theorem c_6_57 : partialCoeff 17 6 57 = -2276192789568 := by
  gmu_calc [c_5_28, c_5_27, c_5_26, c_5_25, c_5_24, c_5_23, c_5_22, c_5_21, c_5_20]

private theorem c_6_56 : partialCoeff 17 6 56 = -1039634464704 := by
  gmu_calc [c_5_28, c_5_27, c_5_26, c_5_25, c_5_24, c_5_23, c_5_22, c_5_21, c_5_20]

private theorem c_4_1 : partialCoeff 17 4 1 = -17 := by
  gmu_calc [c_3_0]

private theorem c_5_19 : partialCoeff 17 5 19 = 58037864 := by
  gmu_calc [c_4_9, c_4_8, c_4_7, c_4_6, c_4_5, c_4_4, c_4_3, c_4_2, c_4_1]

private theorem c_6_55 : partialCoeff 17 6 55 = 2402162428352 := by
  gmu_calc [c_5_27, c_5_26, c_5_25, c_5_24, c_5_23, c_5_22, c_5_21, c_5_20, c_5_19]

private theorem c_6_54 : partialCoeff 17 6 54 = -1263460009408 := by
  gmu_calc [c_5_27, c_5_26, c_5_25, c_5_24, c_5_23, c_5_22, c_5_21, c_5_20, c_5_19]

private theorem c_7_125 : partialCoeff 17 7 125 = -18350699491004928 := by
  gmu_calc [c_6_62, c_6_61, c_6_60, c_6_59, c_6_58, c_6_57, c_6_56, c_6_55, c_6_54]

private theorem c_7_124 : partialCoeff 17 7 124 = 23558054230520320 := by
  gmu_calc [c_6_62, c_6_61, c_6_60, c_6_59, c_6_58, c_6_57, c_6_56, c_6_55, c_6_54]

private theorem c_5_18 : partialCoeff 17 5 18 = -36253928 := by
  gmu_calc [c_4_9, c_4_8, c_4_7, c_4_6, c_4_5, c_4_4, c_4_3, c_4_2, c_4_1]

private theorem c_6_53 : partialCoeff 17 6 53 = -579915418560 := by
  gmu_calc [c_5_26, c_5_25, c_5_24, c_5_23, c_5_22, c_5_21, c_5_20, c_5_19, c_5_18]

private theorem c_7_123 : partialCoeff 17 7 123 = -6366814438084096 := by
  gmu_calc [c_6_61, c_6_60, c_6_59, c_6_58, c_6_57, c_6_56, c_6_55, c_6_54, c_6_53]

private theorem c_7_122 : partialCoeff 17 7 122 = -13710817046516224 := by
  gmu_calc [c_6_61, c_6_60, c_6_59, c_6_58, c_6_57, c_6_56, c_6_55, c_6_54, c_6_53]

private theorem c_6_52 : partialCoeff 17 6 52 = 1310203039680 := by
  gmu_calc [c_5_26, c_5_25, c_5_24, c_5_23, c_5_22, c_5_21, c_5_20, c_5_19, c_5_18]

private theorem c_7_121 : partialCoeff 17 7 121 = 17852293724864000 := by
  gmu_calc [c_6_60, c_6_59, c_6_58, c_6_57, c_6_56, c_6_55, c_6_54, c_6_53, c_6_52]

private theorem c_7_120 : partialCoeff 17 7 120 = -5035591715757568 := by
  gmu_calc [c_6_60, c_6_59, c_6_58, c_6_57, c_6_56, c_6_55, c_6_54, c_6_53, c_6_52]

private theorem c_4_0 : partialCoeff 17 4 0 = 1 := by
  gmu_calc [c_3_0]

private theorem c_5_17 : partialCoeff 17 5 17 = 2383960 := by
  gmu_calc [c_4_8, c_4_7, c_4_6, c_4_5, c_4_4, c_4_3, c_4_2, c_4_1, c_4_0]

private theorem c_6_51 : partialCoeff 17 6 51 = -674041118400 := by
  gmu_calc [c_5_25, c_5_24, c_5_23, c_5_22, c_5_21, c_5_20, c_5_19, c_5_18, c_5_17]

private theorem c_7_119 : partialCoeff 17 7 119 = -10117236228185600 := by
  gmu_calc [c_6_59, c_6_58, c_6_57, c_6_56, c_6_55, c_6_54, c_6_53, c_6_52, c_6_51]

private theorem c_7_118 : partialCoeff 17 7 118 = 13409007739026944 := by
  gmu_calc [c_6_59, c_6_58, c_6_57, c_6_56, c_6_55, c_6_54, c_6_53, c_6_52, c_6_51]

private theorem c_6_50 : partialCoeff 17 6 50 = -316909720896 := by
  gmu_calc [c_5_25, c_5_24, c_5_23, c_5_22, c_5_21, c_5_20, c_5_19, c_5_18, c_5_17]

private theorem c_7_117 : partialCoeff 17 7 117 = -3943099979043328 := by
  gmu_calc [c_6_58, c_6_57, c_6_56, c_6_55, c_6_54, c_6_53, c_6_52, c_6_51, c_6_50]

private theorem c_8_251 : partialCoeff 17 8 251 = -59071134428569894912 := by
  gmu_calc [c_7_125, c_7_124, c_7_123, c_7_122, c_7_121, c_7_120, c_7_119, c_7_118, c_7_117]

private theorem c_8_250 : partialCoeff 17 8 250 = 100850162091807571968 := by
  gmu_calc [c_7_125, c_7_124, c_7_123, c_7_122, c_7_121, c_7_120, c_7_119, c_7_118, c_7_117]

private theorem c_7_116 : partialCoeff 17 7 116 = -7399580257586688 := by
  gmu_calc [c_6_58, c_6_57, c_6_56, c_6_55, c_6_54, c_6_53, c_6_52, c_6_51, c_6_50]

private theorem c_8_249 : partialCoeff 17 8 249 = -42163552652719521792 := by
  gmu_calc [c_7_124, c_7_123, c_7_122, c_7_121, c_7_120, c_7_119, c_7_118, c_7_117, c_7_116]

private theorem c_8_248 : partialCoeff 17 8 248 = -51541491877990400000 := by
  gmu_calc [c_7_124, c_7_123, c_7_122, c_7_121, c_7_120, c_7_119, c_7_118, c_7_117, c_7_116]

private theorem c_5_16 : partialCoeff 17 5 16 = 11466024 := by
  gmu_calc [c_4_8, c_4_7, c_4_6, c_4_5, c_4_4, c_4_3, c_4_2, c_4_1, c_4_0]

private theorem c_6_49 : partialCoeff 17 6 49 = 689953062080 := by
  gmu_calc [c_5_24, c_5_23, c_5_22, c_5_21, c_5_20, c_5_19, c_5_18, c_5_17, c_5_16]

private theorem c_7_115 : partialCoeff 17 7 115 = 9982134506631680 := by
  gmu_calc [c_6_57, c_6_56, c_6_55, c_6_54, c_6_53, c_6_52, c_6_51, c_6_50, c_6_49]

private theorem c_8_247 : partialCoeff 17 8 247 = 87274857215315968000 := by
  gmu_calc [c_7_123, c_7_122, c_7_121, c_7_120, c_7_119, c_7_118, c_7_117, c_7_116, c_7_115]

private theorem c_8_246 : partialCoeff 17 8 246 = -36136613099265884160 := by
  gmu_calc [c_7_123, c_7_122, c_7_121, c_7_120, c_7_119, c_7_118, c_7_117, c_7_116, c_7_115]

private theorem c_7_114 : partialCoeff 17 7 114 = -3054751935255040 := by
  gmu_calc [c_6_57, c_6_56, c_6_55, c_6_54, c_6_53, c_6_52, c_6_51, c_6_50, c_6_49]

private theorem c_8_245 : partialCoeff 17 8 245 = -44902911463270481920 := by
  gmu_calc [c_7_122, c_7_121, c_7_120, c_7_119, c_7_118, c_7_117, c_7_116, c_7_115, c_7_114]

private theorem c_8_244 : partialCoeff 17 8 244 = 75453465076981137408 := by
  gmu_calc [c_7_122, c_7_121, c_7_120, c_7_119, c_7_118, c_7_117, c_7_116, c_7_115, c_7_114]

private theorem c_6_48 : partialCoeff 17 6 48 = -343038447808 := by
  gmu_calc [c_5_24, c_5_23, c_5_22, c_5_21, c_5_20, c_5_19, c_5_18, c_5_17, c_5_16]

private theorem c_7_113 : partialCoeff 17 7 113 = -5367659522572800 := by
  gmu_calc [c_6_56, c_6_55, c_6_54, c_6_53, c_6_52, c_6_51, c_6_50, c_6_49, c_6_48]

private theorem c_8_243 : partialCoeff 17 8 243 = -30954911799821041664 := by
  gmu_calc [c_7_121, c_7_120, c_7_119, c_7_118, c_7_117, c_7_116, c_7_115, c_7_114, c_7_113]

private theorem c_9_503 : partialCoeff 17 9 503 = -382073745322860227067904 := by
  gmu_calc [c_8_251, c_8_250, c_8_249, c_8_248, c_8_247, c_8_246, c_8_245, c_8_244, c_8_243]

private theorem c_6_63 : partialCoeff 17 6 63 = -6787585107264 := by
  gmu_calc [c_5_31, c_5_30, c_5_29, c_5_28, c_5_27, c_5_26, c_5_25, c_5_24, c_5_23]

private theorem c_7_126 : partialCoeff 17 7 126 = -8054218184425984 := by
  gmu_calc [c_6_63, c_6_62, c_6_61, c_6_60, c_6_59, c_6_58, c_6_57, c_6_56, c_6_55]

private theorem c_8_252 : partialCoeff 17 8 252 = -49161838846416420864 := by
  gmu_calc [c_7_126, c_7_125, c_7_124, c_7_123, c_7_122, c_7_121, c_7_120, c_7_119, c_7_118]

private theorem c_9_504 : partialCoeff 17 9 504 = -98392455150140920430592 := by
  gmu_calc [c_8_252, c_8_251, c_8_250, c_8_249, c_8_248, c_8_247, c_8_246, c_8_245, c_8_244]

theorem witness_coefficients :
    coeff 17 503 = -382073745322860227067904 ∧
    coeff 17 504 = -98392455150140920430592 := by
  exact ⟨(partialCoeff_is_coeff 17 9 503 (by decide)).symm.trans c_9_503,
    (partialCoeff_is_coeff 17 9 504 (by decide)).symm.trans c_9_504⟩

theorem valuation_from_divisibility (z : Int) (a : Nat) (hz : z ≠ 0)
    (h : (2 : ℤ)^a ∣ z) (h' : ¬ (2 : ℤ)^(a+1) ∣ z) :
    padicValInt 2 z = a := by
  have hlow := ((padicValInt_dvd_iff_of_ne_one (p := 2) (by decide) a z).1 h).resolve_left hz
  by_contra hh
  apply h'
  apply (padicValInt_dvd_iff_of_ne_one (p := 2) (by decide) (a+1) z).2
  exact Or.inr (by omega)

theorem witness_valuations :
    padicValInt 2 (coeff 17 503) = 18 ∧
    padicValInt 2 (coeff 17 504) = 19 := by
  rw [witness_coefficients.1, witness_coefficients.2]
  exact ⟨valuation_from_divisibility _ _ (by decide) (by decide) (by decide),
    valuation_from_divisibility _ _ (by decide) (by decide) (by decide)⟩

/-- The source-series witness has valuations 18 and 19 in one block. -/
theorem source_witness :
    padicValInt 2 (t 17 503) = 18 ∧ padicValInt 2 (t 17 504) = 19 := by
  simpa only [t_eq_coeff] using witness_valuations

/-- The universal clause in Gawron–Miśka–Ulas, Conjecture 5.2. -/
def GeneralValuationConjecture : Prop :=
  ∀ k : Nat, 2 ≤ k → ∃ A : Nat → Nat, StrictMono A ∧ A 0 = 0 ∧
    ∀ n j : Nat, j < 2^k →
      padicValInt 2 (t (2^k+1) (2^k*n+j)) = A (padicValNat 2 (n+1))

theorem conjecture_false : ¬ GeneralValuationConjecture := by
  intro h
  obtain ⟨A, _, _, hA⟩ := h 4 (by decide)
  have h1 := hA 31 7 (by decide)
  have h2 := hA 31 8 (by decide)
  change padicValInt 2 (t 17 503) = A (padicValNat 2 32) at h1
  change padicValInt 2 (t 17 504) = A (padicValNat 2 32) at h2
  rw [source_witness.1] at h1
  rw [source_witness.2] at h2
  omega

end NumericalCertificate

end GawronMiskaUlas
