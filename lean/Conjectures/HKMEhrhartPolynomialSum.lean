module

public import Mathlib.NumberTheory.BernoulliPolynomials
public import Mathlib.RingTheory.Polynomial.Pochhammer
public import Mathlib.Tactic

public section
namespace HKMEhrhart
open Polynomial Finset
open scoped BigOperators Polynomial

noncomputable def integerChoosePolynomial (k : ℕ) : ℚ[X] :=
  C ((k.factorial:ℚ)⁻¹) * descPochhammer ℚ k

theorem integerChoosePolynomial_eval (n k : ℕ) :
    (integerChoosePolynomial k).eval (n:ℚ) = (n.choose k:ℚ) := by
  rw [integerChoosePolynomial,eval_mul,eval_C,Nat.cast_choose_eq_descPochhammer_div]
  ring

theorem integerChoosePolynomial_degree (k : ℕ) :
    (integerChoosePolynomial k).natDegree ≤ k := by
  unfold integerChoosePolynomial
  exact (natDegree_mul_le).trans (by simp [descPochhammer_natDegree])

noncomputable def powerSumPolynomial (k : ℕ) : ℚ[X] :=
  C (((k+1:ℕ):ℚ)⁻¹) * (Polynomial.bernoulli (k+1)-C (_root_.bernoulli (k+1)))

theorem powerSumPolynomial_eval (m k : ℕ) :
    (powerSumPolynomial k).eval (m:ℚ) = ∑ j ∈ Finset.range m, (j:ℚ)^k := by
  unfold powerSumPolynomial
  rw [eval_mul,eval_C,eval_sub,eval_C,← Polynomial.sum_range_pow_eq_bernoulli_sub m k]
  push_cast
  have h : (k:ℚ)+1 ≠ 0 := by positivity
  field_simp [h]

theorem bernoulliPolynomial_degree_le (n : ℕ) :
    (Polynomial.bernoulli n).natDegree ≤ n := by
  rw [Polynomial.bernoulli_def]
  apply natDegree_sum_le_of_forall_le
  intro i hi
  exact (natDegree_monomial_le _ (m := i)).trans (Nat.le_of_lt_succ (Finset.mem_range.mp hi))

theorem powerSumPolynomial_degree (k : ℕ) :
    (powerSumPolynomial k).natDegree ≤ k+1 := by
  unfold powerSumPolynomial
  refine (natDegree_mul_le).trans ?_
  rw [natDegree_C,zero_add]
  exact (natDegree_sub_le _ _).trans (max_le (bernoulliPolynomial_degree_le _) (by simp))

noncomputable def prefixSumPolynomial (p : ℚ[X]) : ℚ[X] :=
  ∑ k ∈ Finset.range (p.natDegree+1), C (p.coeff k)*powerSumPolynomial k

/-- A discrete antiderivative with an exact degree bound for natural inputs. -/
theorem prefixSumPolynomial_eval (p : ℚ[X]) (m : ℕ) :
    (prefixSumPolynomial p).eval (m:ℚ) = ∑ j ∈ Finset.range m, p.eval (j:ℚ) := by
  unfold prefixSumPolynomial
  simp only [eval_finsetSum,eval_mul,eval_C,powerSumPolynomial_eval]
  simp_rw [Finset.mul_sum]
  rw [Finset.sum_comm]
  exact Finset.sum_congr rfl (fun j _ => (Polynomial.eval_eq_sum_range (p := p) (j:ℚ)).symm)

theorem prefixSumPolynomial_degree (p : ℚ[X]) :
    (prefixSumPolynomial p).natDegree ≤ p.natDegree+1 := by
  unfold prefixSumPolynomial
  apply natDegree_sum_le_of_forall_le
  intro i hi
  refine natDegree_mul_le.trans ?_
  rw [natDegree_C,zero_add]
  exact (powerSumPolynomial_degree _).trans (Nat.succ_le_succ (Nat.le_of_lt_succ (mem_range.mp hi)))

end HKMEhrhart
