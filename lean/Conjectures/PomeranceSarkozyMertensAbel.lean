module
public import Conjectures.PomeranceSarkozyWeightedPrime
public import Conjectures.PomeranceSarkozyLogKernels
public import Mathlib.NumberTheory.AbelSummation
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Ring

@[expose] public section
namespace PomeranceSarkozy

open Finset MeasureTheory
open scoped BigOperators Interval

noncomputable def primeReciprocalSum (x : ℝ) : ℝ :=
  ∑ p ∈ Finset.Icc 0 ⌊x⌋₊ with p.Prime,(1:ℝ)/(p:ℝ)

theorem weightedPrime_sum_Icc (N : ℕ) :
    (∑ p ∈ Finset.Icc 0 N,primeLogCoeff p/(p:ℝ))=primeWeightedReciprocal N := by
  unfold primeWeightedReciprocal
  congr 1
  ext p
  simp only [Finset.mem_Icc,Finset.mem_range]
  omega

private theorem reciprocalLog_primeCoeff (n : ℕ) :
    reciprocalLog (n:ℝ)*(primeLogCoeff n/(n:ℝ)) =
      if n.Prime then (1:ℝ)/(n:ℝ) else 0 := by
  unfold primeLogCoeff reciprocalLog
  by_cases hn : n.Prime
  · rw [ite_eq_left hn,ite_eq_left hn]
    have h₁ : (1:ℝ)<(n:ℝ) := by exact_mod_cast hn.one_lt
    have hlog := Real.log_pos h₁
    field_simp
  · simp [hn]

/-- The exact Abel-summation formula connecting the bounded-error
weighted prime sum to the unweighted sum of prime reciprocals. -/
theorem primeReciprocalSum_abel {x : ℝ} (hx : 2≤x) :
    primeReciprocalSum x=reciprocalLog x*primeWeightedReciprocal ⌊x⌋₊+
      ∫ t in Set.Ioc (2:ℝ) x,logSquaredKernel t*primeWeightedReciprocal ⌊t⌋₊ := by
  let c (n : ℕ) := primeLogCoeff n/(n:ℝ)
  have hc₀ : c 0=0 := by simp [c]
  have hc₁ : c 1=0 := by simp [c,primeLogCoeff]
  have hder (t : ℝ) (ht : t∈Set.Icc (2:ℝ) x) :
      deriv reciprocalLog t = -logSquaredKernel t :=
    (hasDerivAt_reciprocalLog ((by norm_num : (1:ℝ)<2).trans_le ht.1)).deriv
  have hdiff (t : ℝ) (ht : t∈Set.Icc (2:ℝ) x) : DifferentiableAt ℝ reciprocalLog t :=
    (hasDerivAt_reciprocalLog ((by norm_num : (1:ℝ)<2).trans_le ht.1)).differentiableAt
  have hint : IntegrableOn (deriv reciprocalLog) (Set.Icc (2:ℝ) x) := by
    have hk := (intervalIntegrable_iff_integrableOn_Icc_of_le hx).mp
      (logSquaredKernel_intervalIntegrable hx)
    refine hk.neg.congr_fun (fun t ht => (hder t ht).symm) measurableSet_Icc
  have ha := sum_mul_eq_sub_integral_mul₁ c (f:=reciprocalLog) hc₀ hc₁ x hdiff hint
  have hl : (∑ k ∈ Finset.Icc 0 ⌊x⌋₊,reciprocalLog (k:ℝ)*c k)=primeReciprocalSum x := by
    unfold c primeReciprocalSum
    simp_rw [reciprocalLog_primeCoeff,Finset.sum_filter]
  have hw (t : ℝ) : (∑ k ∈ Finset.Icc 0 ⌊t⌋₊,c k)=primeWeightedReciprocal ⌊t⌋₊ :=
    weightedPrime_sum_Icc _
  rw [hl,hw] at ha
  have hi : (∫ t in Set.Ioc (2:ℝ) x,deriv reciprocalLog t*∑ k ∈ Finset.Icc 0 ⌊t⌋₊,c k)
      = -(∫ t in Set.Ioc (2:ℝ) x,logSquaredKernel t*primeWeightedReciprocal ⌊t⌋₊) := by
    rw [← integral_neg]
    apply integral_congr_ae
    filter_upwards [ae_restrict_mem measurableSet_Ioc] with t ht
    rw [hder t ⟨ht.1.le,ht.2⟩,hw,neg_mul]
  rw [hi,sub_neg_eq_add] at ha
  exact ha

end PomeranceSarkozy
