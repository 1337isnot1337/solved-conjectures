module
public import Conjectures.WachsLaguerreRecurrence
public import Mathlib.Analysis.Polynomial.Basic

@[expose] public section
namespace WachsCompleteGraph

open Polynomial

noncomputable def monicLaguerre (n : ℕ) : Polynomial ℝ :=
  C ((-1:ℝ)^n*((n+1).factorial:ℝ)) *
    ((normalizedLaguerre n).map (algebraMap ℚ ℝ)).comp (-X)

theorem monicLaguerre_value (n : ℕ) (x : ℝ) :
    (monicLaguerre n).eval x =
      (-1:ℝ)^n*((n+1).factorial:ℝ) *
        ((normalizedLaguerre n).map (algebraMap ℚ ℝ)).eval (-x) := by
  simp [monicLaguerre,eval_comp]

theorem monicLaguerre_zero_value (n : ℕ) :
    (monicLaguerre n).eval 0 = (-1:ℝ)^n * ((n+1).factorial:ℝ) := by
  rw [monicLaguerre_value,neg_zero,← coeff_zero_eq_eval_zero,coeff_map,normalizedLaguerre_coeff]
  simp

theorem normalizedLaguerre_natDegree (n : ℕ) : (normalizedLaguerre n).natDegree = n := by
  apply le_antisymm
  · apply natDegree_le_iff_coeff_eq_zero.mpr
    intro i hi
    rw [normalizedLaguerre_coeff,Nat.choose_eq_zero_of_lt hi]
    simp
  · apply le_natDegree_of_ne_zero
    rw [normalizedLaguerre_coeff,Nat.choose_self,Nat.cast_one]
    exact one_div_ne_zero (by exact_mod_cast Nat.factorial_ne_zero (n+1))

theorem monicLaguerre_natDegree (n : ℕ) : (monicLaguerre n).natDegree = n := by
  have hs : (-1:ℝ)^n*((n+1).factorial:ℝ) ≠ 0 := by positivity
  rw [monicLaguerre,natDegree_C_mul hs,natDegree_comp,natDegree_neg,natDegree_X,mul_one,
    natDegree_map,normalizedLaguerre_natDegree]

theorem monicLaguerre_monic (n : ℕ) : (monicLaguerre n).Monic := by
  rw [Monic,monicLaguerre,leadingCoeff_mul,leadingCoeff_C,
    leadingCoeff_comp (by simp),leadingCoeff_neg,leadingCoeff_X,
    leadingCoeff_map,natDegree_map,normalizedLaguerre_natDegree]
  have hlead : (normalizedLaguerre n).leadingCoeff = 1/((n+1).factorial:ℚ) := by
    rw [leadingCoeff,normalizedLaguerre_natDegree,normalizedLaguerre_coeff,
      Nat.choose_self,Nat.cast_one]
  rw [hlead,map_div₀,map_one,map_natCast]
  have h : ((n+1).factorial:ℝ) ≠ 0 := by positivity
  have hs : (-1:ℝ)^n * (-1:ℝ)^n = 1 := by rw [← mul_pow]; norm_num
  field_simp
  simpa only [pow_two] using hs

theorem monicLaguerre_recurrence_value (n : ℕ) (x : ℝ) :
    (monicLaguerre (n+2)).eval x =
      (x-(2*(n:ℝ)+4))*(monicLaguerre (n+1)).eval x -
      (((n:ℝ)+1)*((n:ℝ)+2))*(monicLaguerre n).eval x := by
  have h := congrArg (fun P : Polynomial ℚ => (P.map (algebraMap ℚ ℝ)).eval (-x))
    (normalizedLaguerre_recurrence n)
  simp only [Polynomial.map_mul,Polynomial.map_add,Polynomial.map_sub,map_X,
    eval_mul,eval_add,eval_sub,eval_X,map_add,map_mul,map_ofNat,map_natCast,map_one] at h
  norm_num [Polynomial.map_natCast,Polynomial.eval_natCast] at h
  simp only [monicLaguerre_value,eval_map_algebraMap]
  rw [show n+2+1=(n+1+1)+1 by omega,Nat.factorial_succ (n+1+1),Nat.factorial_succ (n+1)]
  push_cast
  rw [show n+2=n+1+1 by omega,pow_succ (-1:ℝ) (n+1),pow_succ (-1:ℝ) n]
  rw [show n+1+1=n+2 by omega]
  linear_combination (-1:ℝ)^n*((n+1).factorial:ℝ)*((n:ℝ)+2)*h

end WachsCompleteGraph
