module
public import Conjectures.PomeranceSarkozyMangoldtReciprocal
public import Conjectures.PomeranceSarkozySqrtWeightedPrefix
import Mathlib.Tactic.Linarith

@[expose] public section
namespace PomeranceSarkozy

open Finset ArithmeticFunction
open scoped BigOperators

noncomputable def primeLogCoeff (n : ℕ) : ℝ :=
  if n.Prime then Real.log (n:ℝ) else 0

noncomputable def primePowerExtra (n : ℕ) : ℝ :=
  ArithmeticFunction.vonMangoldt n-primeLogCoeff n

noncomputable def primeWeightedReciprocal (N : ℕ) : ℝ :=
  ∑ n ∈ Finset.range (N+1),primeLogCoeff n/(n:ℝ)

private theorem primePowerExtra_nonneg (n : ℕ) : 0≤primePowerExtra n := by
  unfold primePowerExtra primeLogCoeff
  by_cases h : n.Prime
  · rw [ite_eq_left h,ArithmeticFunction.vonMangoldt_apply_prime h,sub_self]
  · simp [h]

private theorem primeLogCoeff_sum_eq_theta (N : ℕ) :
    (∑ n ∈ Finset.range (N+1),primeLogCoeff n)=Chebyshev.theta (N:ℝ) := by
  have he : Finset.range (N+1)=insert 0 (Finset.Ioc 0 N) := by
    ext n
    simp only [Finset.mem_range,Finset.mem_insert,Finset.mem_Ioc]
    omega
  rw [he,Finset.sum_insert (by simp),Chebyshev.theta,Nat.floor_natCast,Finset.sum_filter]
  simp [primeLogCoeff]

private theorem primePowerExtra_cumulative (N : ℕ) :
    (∑ n ∈ Finset.range (N+1),primePowerExtra n)=
      Chebyshev.psi (N:ℝ)-Chebyshev.theta (N:ℝ) := by
  unfold primePowerExtra
  rw [Finset.sum_sub_distrib,mangoldt_sum_range_eq_psi,primeLogCoeff_sum_eq_theta]

/-- The contribution of prime powers beyond primes to the harmonic
Mangoldt sum stays bounded, using Mathlib's square-root cumulative bound. -/
theorem primePowerExtra_weighted_bounded :
    ∃ B : ℝ,∀ N,(∑ n ∈ Finset.range (N+1),primePowerExtra n/(n:ℝ))≤B := by
  obtain ⟨C,hC⟩ := Chebyshev.psi_sub_theta_le_mul_sqrt
  refine weighted_prefix_bounded_of_sqrt primePowerExtra (max C 0) primePowerExtra_nonneg
    (le_max_right _ _) ?_
  intro N
  rw [primePowerExtra_cumulative]
  exact (hC (N:ℝ)).trans (mul_le_mul_of_nonneg_right (le_max_left _ _) (Real.sqrt_nonneg _))

theorem mangoldtReciprocal_sub_weighted_primes (N : ℕ) :
    mangoldtReciprocal N-primeWeightedReciprocal N=
      ∑ n ∈ Finset.range (N+1),primePowerExtra n/(n:ℝ) := by
  unfold mangoldtReciprocal primeWeightedReciprocal primePowerExtra
  rw [← Finset.sum_sub_distrib]
  apply Finset.sum_congr rfl
  intro n _
  exact (sub_div _ _ _).symm

/-- The logarithmically weighted reciprocal prime sum differs from
log N by a bounded amount. This is the step before partial summation. -/
theorem primeWeightedReciprocal_log_bounded :
    ∃ C : ℝ,∀ N : ℕ,0<N→|primeWeightedReciprocal N-Real.log (N:ℝ)|≤C := by
  obtain ⟨B,hB⟩ := primePowerExtra_weighted_bounded
  refine ⟨max (B+1) (Real.log 4+4),fun N hN => ?_⟩
  have h₁ := hB N
  have h₀ : (0:ℝ)≤∑ n ∈ Finset.range (N+1),primePowerExtra n/(n:ℝ) :=
    Finset.sum_nonneg (fun n _ => div_nonneg (primePowerExtra_nonneg _) (Nat.cast_nonneg _))
  rw [← mangoldtReciprocal_sub_weighted_primes] at h₁ h₀
  obtain ⟨hn₁,hn₂⟩ := mangoldtReciprocal_log_bounds N hN
  apply abs_le.mpr
  exact ⟨(by linarith [le_max_left (B+1) (Real.log 4+4)]),
    (by linarith [le_max_right (B+1) (Real.log 4+4)])⟩

/-- The same bounded error on real arguments, with an explicit
adjustment for the floor. -/
theorem primeWeightedReciprocal_log_real_bounded :
    ∃ C : ℝ,0≤C ∧ ∀ x : ℝ,2≤x→|primeWeightedReciprocal ⌊x⌋₊-Real.log x|≤C := by
  obtain ⟨C,hC⟩ := primeWeightedReciprocal_log_bounded
  refine ⟨max C 0+Real.log 2,add_nonneg (le_max_right _ _) (Real.log_nonneg (by norm_num)),?_⟩
  intro x hx
  let n := ⌊x⌋₊
  have hx₀ : 0≤x := by linarith
  have hn₀ : 0<n := by
    have hn : (1:ℕ)≤n := Nat.le_floor (by norm_num; linarith)
    omega
  have hnl : (x:ℝ)/2≤(n:ℝ) := by
    have hi := Nat.lt_floor_add_one x
    change x<(n:ℝ)+1 at hi
    linarith
  have hnr : (n:ℝ)≤x := Nat.floor_le hx₀
  have hl : Real.log x-Real.log 2≤Real.log (n:ℝ) := by
    rw [← Real.log_div (by linarith : x≠0) (by norm_num : (2:ℝ)≠0)]
    exact Real.log_le_log (by linarith) hnl
  have hr : Real.log (n:ℝ)≤Real.log x := Real.log_le_log (by exact_mod_cast hn₀) hnr
  have hd : |Real.log (n:ℝ)-Real.log x|≤Real.log 2 := by
    rw [abs_of_nonpos (sub_nonpos.mpr hr)]
    linarith
  exact (abs_sub_le _ (Real.log (n:ℝ)) _).trans
    (add_le_add ((hC n hn₀).trans (le_max_left _ _)) hd)

end PomeranceSarkozy
