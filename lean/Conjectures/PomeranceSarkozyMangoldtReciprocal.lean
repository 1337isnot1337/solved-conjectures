module
public import Conjectures.PomeranceSarkozyMangoldtFloor
public import Mathlib.Analysis.SpecialFunctions.Stirling
public import Mathlib.Analysis.Real.Pi.Bounds
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith

@[expose] public section
namespace PomeranceSarkozy

open Finset ArithmeticFunction
open scoped BigOperators

noncomputable def mangoldtReciprocal (N : ℕ) : ℝ :=
  ∑ d ∈ Finset.range (N+1),ArithmeticFunction.vonMangoldt d/(d:ℝ)

private theorem mangoldt_quotient_error (N d : ℕ) :
    0≤ArithmeticFunction.vonMangoldt d*((N:ℝ)/(d:ℝ)-((N/d:ℕ):ℝ)) ∧
      ArithmeticFunction.vonMangoldt d*((N:ℝ)/(d:ℝ)-((N/d:ℕ):ℝ))≤ArithmeticFunction.vonMangoldt d := by
  by_cases hd : d=0
  · simp [hd]
  have hd' : (0:ℝ)<(d:ℝ) := by exact_mod_cast (Nat.pos_of_ne_zero hd)
  have hmod : (((N%d:ℕ):ℝ))<(d:ℝ) := by exact_mod_cast Nat.mod_lt N (Nat.pos_of_ne_zero hd)
  have hsum : (N:ℝ)=(d:ℝ)*((N/d:ℕ):ℝ)+((N%d:ℕ):ℝ) := by
    exact_mod_cast (Nat.div_add_mod N d).symm
  have he : (N:ℝ)/(d:ℝ)-((N/d:ℕ):ℝ)=((N%d:ℕ):ℝ)/(d:ℝ) := by
    field_simp
    linarith
  rw [he]
  have h₀ : (0:ℝ)≤((N%d:ℕ):ℝ)/(d:ℝ) := by positivity
  have h₁ : ((N%d:ℕ):ℝ)/(d:ℝ)≤1 := div_le_one_of_le₀ hmod.le hd'.le
  exact ⟨mul_nonneg vonMangoldt_nonneg h₀,
    (mul_le_mul_of_nonneg_left h₁ vonMangoldt_nonneg).trans_eq (mul_one _)⟩

theorem mangoldt_sum_range_eq_psi (N : ℕ) :
    (∑ d ∈ Finset.range (N+1),ArithmeticFunction.vonMangoldt d)=Chebyshev.psi (N:ℝ) := by
  have he : Finset.range (N+1)=insert 0 (Finset.Ioc 0 N) := by
    ext d
    simp only [Finset.mem_range,Finset.mem_insert,Finset.mem_Ioc]
    omega
  rw [he,Finset.sum_insert (by simp),Chebyshev.psi]
  simp

theorem mangoldtReciprocal_floor_bounds (N : ℕ) :
    0≤(N:ℝ)*mangoldtReciprocal N-Real.log (N.factorial:ℝ) ∧
    (N:ℝ)*mangoldtReciprocal N-Real.log (N.factorial:ℝ)≤Chebyshev.psi (N:ℝ) := by
  have he : (N:ℝ)*mangoldtReciprocal N-Real.log (N.factorial:ℝ) =
      ∑ d ∈ Finset.range (N+1),ArithmeticFunction.vonMangoldt d*((N:ℝ)/(d:ℝ)-((N/d:ℕ):ℝ)) := by
    unfold mangoldtReciprocal
    rw [Finset.mul_sum,log_factorial_eq_mangoldt_floors,← Finset.sum_sub_distrib]
    apply Finset.sum_congr rfl
    intro d _
    ring
  rw [he,← mangoldt_sum_range_eq_psi]
  exact ⟨Finset.sum_nonneg (fun d _ => (mangoldt_quotient_error N d).1),
    Finset.sum_le_sum (fun d _ => (mangoldt_quotient_error N d).2)⟩

/-- An effective bounded error for the reciprocally weighted von
Mangoldt sum, needed to control the prime-mean parameter. -/
theorem mangoldtReciprocal_log_bounds (N : ℕ) (hN : 0<N) :
    Real.log (N:ℝ)-1≤mangoldtReciprocal N ∧
      mangoldtReciprocal N≤Real.log (N:ℝ)+(Real.log 4+4) := by
  have hn : (0:ℝ)<(N:ℝ) := by exact_mod_cast hN
  have h1 : (1:ℝ)≤(N:ℝ) := by exact_mod_cast hN
  have hlog : 0≤Real.log (N:ℝ) := Real.log_nonneg h1
  have hπ : 0≤Real.log (2*Real.pi) := Real.log_nonneg (by linarith [Real.pi_gt_three])
  have hl := Stirling.le_log_factorial_stirling (Nat.ne_of_gt hN)
  have hfl : (N:ℝ)*(Real.log (N:ℝ)-1)≤Real.log (N.factorial:ℝ) := by linarith
  have hfu : Real.log (N.factorial:ℝ)≤(N:ℝ)*Real.log (N:ℝ) := by
    rw [log_nat_factorial_as_sum]
    calc
      _ ≤ ∑ j ∈ Finset.range N,Real.log (N:ℝ) := by
        apply Finset.sum_le_sum
        intro j hj
        exact Real.log_le_log (by positivity) (by exact_mod_cast Nat.succ_le_of_lt (Finset.mem_range.mp hj))
      _ = _ := by simp [nsmul_eq_mul]
  have h0 := (mangoldtReciprocal_floor_bounds N).1
  have h2 := (mangoldtReciprocal_floor_bounds N).2
  have hp := Chebyshev.psi_le_const_mul_self (x:=(N:ℝ)) (le_of_lt hn)
  constructor
  · exact (mul_le_mul_iff_right₀ hn).mp (hfl.trans (sub_nonneg.mp h0))
  · apply (mul_le_mul_iff_right₀ hn).mp
    nlinarith

end PomeranceSarkozy
