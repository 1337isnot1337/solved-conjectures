import Mathlib.Basic.Real.Basic
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Positivity

/-! Exact arithmetic of the five-speed norm reduction. The lattice product
estimate and the larger-subspace lower bounds are explicit hypotheses. -/

namespace Loneliness.NormArithmetic

theorem first_minimum_bound {V a b c d : ℝ}
    (hV : 0 < V) (ha : 0 ≤ a)
    (hab : a ≤ b) (hbc : b ≤ c) (hcd : c ≤ d)
    (h₂ : 1 / 10 < a + b) (h₃ : 4 / 15 < a + b + c)
    (h₄ : 3 / 5 < a + b + c + d)
    (hprod : a * b * c * d ≤ 1 / V) : a < 1500 / V := by
  have hb : (1 / 20 : ℝ) < b := by linarith
  have hc : (4 / 45 : ℝ) < c := by linarith
  have hd : (3 / 20 : ℝ) < d := by linarith
  have hbcprod : (1 / 225 : ℝ) < b * c := by
    calc
      (1 / 225 : ℝ) = (1 / 20) * (4 / 45) := by norm_num
      _ < (1 / 20) * c := mul_lt_mul_of_pos_left hc (by norm_num)
      _ < b * c := mul_lt_mul_of_pos_right hb (by linarith)
  have htail : (1 / 1500 : ℝ) < b * c * d := by
    calc
      (1 / 1500 : ℝ) = (1 / 225) * (3 / 20) := by norm_num
      _ < (1 / 225) * d := mul_lt_mul_of_pos_left hd (by norm_num)
      _ < b * c * d := mul_lt_mul_of_pos_right hbcprod (by linarith)
  rcases eq_or_lt_of_le ha with hzero | hapos
  · rw [← hzero]
    positivity
  · have hsmall := mul_lt_mul_of_pos_left htail hapos
    have hsmallV := mul_lt_mul_of_pos_right hsmall hV
    have hprodV := (le_div_iff₀ hV).mp hprod
    apply (lt_div_iff₀ hV).mpr
    nlinarith

theorem five_speed_threshold {V a b c d L W : ℝ}
    (hV : 33750 ≤ V) (ha : 0 ≤ a)
    (hab : a ≤ b) (hbc : b ≤ c) (hcd : c ≤ d)
    (hbelow : L < 1 / 5)
    (hthree : 1 / 4 ≤ L + (a + b) / 2)
    (hfour : 1 / 3 ≤ L + (a + b + c) / 2)
    (hfive : 1 / 2 ≤ L + (a + b + c + d) / 2)
    (hprod : a * b * c * d ≤ 1 / V)
    (hW : W ≤ L + a / 2) : W < 2 / 9 := by
  have hVpos : 0 < V := by linarith
  have hfirst : a < 1500 / V := first_minimum_bound hVpos ha hab hbc hcd
    (by linarith) (by linarith) (by linarith) hprod
  have hbound : (1500 : ℝ) / V ≤ 2 / 45 := by
    apply (div_le_iff₀ hVpos).mpr
    linarith
  linarith

theorem two_dimensional_covolume_bound {A a b c L : ℝ}
    (hA : 0 < A) (hab : a ≤ b) (hbc : b ≤ c)
    (hbelow : L < 2 / 9)
    (hthree : 1 / 4 ≤ L + a / 2)
    (hfour : 1 / 3 ≤ L + (a + b) / 2)
    (hfive : 1 / 2 ≤ L + (a + b + c) / 2)
    (hprod : a * b * c ≤ 1 / A) : A < 4374 / 5 := by
  have ha : (1 / 18 : ℝ) < a := by linarith
  have hb : (1 / 9 : ℝ) < b := by linarith
  have hc : (5 / 27 : ℝ) < c := by linarith
  have habprod : (1 / 162 : ℝ) < a * b := by
    calc
      (1 / 162 : ℝ) = (1 / 18) * (1 / 9) := by norm_num
      _ < (1 / 18) * b := mul_lt_mul_of_pos_left hb (by norm_num)
      _ < a * b := mul_lt_mul_of_pos_right ha (by linarith)
  have habcprod : (5 / 4374 : ℝ) < a * b * c := by
    calc
      (5 / 4374 : ℝ) = (1 / 162) * (5 / 27) := by norm_num
      _ < (1 / 162) * c := mul_lt_mul_of_pos_left hc (by norm_num)
      _ < a * b * c := mul_lt_mul_of_pos_right habprod (by linarith)
  have h := (le_div_iff₀ hA).mp hprod
  have hmul := mul_lt_mul_of_pos_right habcprod hA
  nlinarith

theorem squared_covolume_integer_bound {A : ℝ} {N : ℕ}
    (hA : 0 ≤ A) (hbound : A < 4374 / 5) (hN : (N : ℝ) = A * A) :
    N ≤ 765275 := by
  have hsq : (N : ℝ) < (4374 / 5 : ℝ) ^ 2 := by
    rw [hN]
    nlinarith
  have hN' : (N : ℝ) < 765276 := by norm_num at hsq; linarith
  exact Nat.le_of_lt_succ (by exact_mod_cast hN')

end Loneliness.NormArithmetic
