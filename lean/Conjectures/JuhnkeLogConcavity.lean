import Mathlib.Algebra.Polynomial.Derivative
import Mathlib.Algebra.Polynomial.Taylor
import Mathlib.Algebra.Module.LinearMap.End
import Mathlib.Probability.Distributions.Poisson.PoissonLimitThm
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring

/-!
# Juhnke's conjecture

This file supplies the general binomial-translation step used in the recorded
proof of Juhnke's Conjecture 6, Oberwolfach Report 2/2026, pp. 149–150.
The argument follows `results/juhnke-lattice-paths/PROOF.md`: the operator
`I + t D` preserves nonnegative log-concave coefficient sequences, and its
iterates with `t = 1/N` converge coefficientwise to translation by one.
No path-counting assertion is made by this supporting module alone.
-/

namespace Juhnke

open scoped BigOperators Topology
open Polynomial Filter

/-- Adjacent log-concavity, with the sequence extended by zero where necessary. -/
def LogConcave (a : ℕ → ℝ) : Prop :=
  ∀ i, a i * a (i + 2) ≤ a (i + 1) ^ 2

/-- The ratio-order form, which also excludes internal zeros of a nonnegative sequence. -/
def StrongLogConcave (a : ℕ → ℝ) : Prop :=
  ∀ i j, i ≤ j → a i * a (j + 1) ≤ a (i + 1) * a j

theorem StrongLogConcave.logConcave {a : ℕ → ℝ} (h : StrongLogConcave a) :
    LogConcave a := by
  intro i
  simpa [pow_two, Nat.add_assoc] using h i (i + 1) (by omega)

/-- A nonnegative sequence has no internal zero when its positive support is an interval. -/
def IntervalSupport (a : ℕ → ℝ) : Prop :=
  ∀ i j k, i ≤ j → j ≤ k → 0 < a i → 0 < a k → 0 < a j

theorem LogConcave.strong {a : ℕ → ℝ} (ha : ∀ i, 0 ≤ a i)
    (hc : LogConcave a) (hs : IntervalSupport a) : StrongLogConcave a := by
  intro i j hij
  induction j, hij using Nat.le_induction with
  | base => exact le_of_eq (mul_comm _ _)
  | succ j hij ih =>
    by_cases hi : a i = 0
    · simp only [hi, zero_mul]
      exact mul_nonneg (ha _) (ha _)
    by_cases hj : a (j + 1 + 1) = 0
    · simp only [hj, mul_zero]
      exact mul_nonneg (ha _) (ha _)
    have hpi : 0 < a i := lt_of_le_of_ne (ha i) (Ne.symm hi)
    have hpj : 0 < a (j + 1 + 1) := lt_of_le_of_ne (ha _) (Ne.symm hj)
    have hmid : 0 < a (j + 1) := hs i (j + 1) (j + 1 + 1) (by omega) (by omega) hpi hpj
    have hlocal := hc j
    have h1 := mul_le_mul_of_nonneg_right ih (ha (j + 2))
    have h2 := mul_le_mul_of_nonneg_left hlocal (ha (i + 1))
    have h3 : a i * a (j + 2) * a (j + 1) ≤
        (a (i + 1) * a (j + 1)) * a (j + 1) := by nlinarith
    have h4 := (mul_le_mul_iff_left₀ hmid).mp h3
    simpa [Nat.add_assoc] using h4

/-- One Euler step for the derivative operator on coefficient sequences. -/
noncomputable def derivativeStep (t : ℝ) (a : ℕ → ℝ) (i : ℕ) : ℝ :=
  a i + t * (i + 1) * a (i + 1)

theorem derivativeStep_nonneg {t : ℝ} (ht : 0 ≤ t) {a : ℕ → ℝ}
    (ha : ∀ i, 0 ≤ a i) : ∀ i, 0 ≤ derivativeStep t a i := by
  intro i
  dsimp [derivativeStep]
  exact add_nonneg (ha _) (mul_nonneg (mul_nonneg ht (by positivity)) (ha _))

theorem StrongLogConcave.derivativeStep_preserves {a : ℕ → ℝ} (ha : ∀ i, 0 ≤ a i)
    (hc : StrongLogConcave a) {t : ℝ} (ht : 0 ≤ t) :
    StrongLogConcave (derivativeStep t a) := by
  intro i j hij
  rcases eq_or_lt_of_le hij with rfl | hij'
  · exact le_of_eq (mul_comm _ _)
  have h₀ := hc i j hij
  have h₁ := hc i (j + 1) (by omega)
  have h₂ := hc (i + 1) j (by omega)
  have h₃ := hc (i + 1) (j + 1) (by omega)
  have hijR : (i : ℝ) ≤ j := by exact_mod_cast hij
  have hA : 0 ≤ a (i + 1) * a (j + 2) := mul_nonneg (ha _) (ha _)
  have hlin : 0 ≤ ((i : ℝ) + 2) * a (i + 2) * a j +
      ((j : ℝ) - i) * a (i + 1) * a (j + 1) -
      ((j : ℝ) + 2) * a i * a (j + 2) := by
    have h₂' := mul_le_mul_of_nonneg_left h₂ (show 0 ≤ (i : ℝ) + 2 by positivity)
    have h₁' := mul_le_mul_of_nonneg_left h₁ (show 0 ≤ (j : ℝ) + 2 by positivity)
    nlinarith
  have hquad : 0 ≤ ((i : ℝ) + 2) * ((j : ℝ) + 1) * a (i + 2) * a (j + 1) -
      ((i : ℝ) + 1) * ((j : ℝ) + 2) * a (i + 1) * a (j + 2) := by
    have h₃' := mul_le_mul_of_nonneg_left h₃
      (show 0 ≤ ((i : ℝ) + 2) * ((j : ℝ) + 1) by positivity)
    have hgap : 0 ≤ ((j : ℝ) - i) * (a (i + 1) * a (j + 2)) :=
      mul_nonneg (sub_nonneg.mpr hijR) hA
    nlinarith
  have hlin' := mul_nonneg ht hlin
  have hquad' := mul_nonneg (sq_nonneg t) hquad
  dsimp [derivativeStep]
  simp only [Nat.cast_add, Nat.cast_one]
  nlinarith

/-- Polynomial Euler step, retaining the literal derivative coefficients. -/
noncomputable def polynomialStep (t : ℝ) (p : ℝ[X]) : ℝ[X] :=
  p + t • p.derivative

theorem polynomialStep_coeff (t : ℝ) (p : ℝ[X]) (i : ℕ) :
    (polynomialStep t p).coeff i = derivativeStep t p.coeff i := by
  simp [polynomialStep, derivativeStep, coeff_derivative]
  ring

theorem polynomialStep_preserves {p : ℝ[X]} (hp : ∀ i, 0 ≤ p.coeff i)
    (hc : StrongLogConcave p.coeff) {t : ℝ} (ht : 0 ≤ t) :
    (∀ i, 0 ≤ (polynomialStep t p).coeff i) ∧
      StrongLogConcave (polynomialStep t p).coeff := by
  have heq : (polynomialStep t p).coeff = derivativeStep t p.coeff := by
    funext i
    exact polynomialStep_coeff t p i
  rw [heq]
  exact ⟨derivativeStep_nonneg ht hp, hc.derivativeStep_preserves hp ht⟩

theorem polynomialStep_iterate_preserves {p : ℝ[X]} (hp : ∀ i, 0 ≤ p.coeff i)
    (hc : StrongLogConcave p.coeff) {t : ℝ} (ht : 0 ≤ t) (N : ℕ) :
    (∀ i, 0 ≤ ((polynomialStep t)^[N] p).coeff i) ∧
      StrongLogConcave ((polynomialStep t)^[N] p).coeff := by
  induction N with
  | zero => simpa using And.intro hp hc
  | succ N ih =>
    rw [Function.iterate_succ_apply']
    exact polynomialStep_preserves ih.1 ih.2 ht

theorem polynomialStep_iterate_sum (t : ℝ) (p : ℝ[X]) (N : ℕ) :
    (polynomialStep t)^[N] p =
      ∑ k ∈ Finset.range (N + 1), ((N.choose k : ℝ) * t ^ k) •
        (derivative^[k] p) := by
  let D : Module.End ℝ ℝ[X] := derivative
  let E : Module.End ℝ ℝ[X] := t • D + 1
  have hE : (E : ℝ[X] → ℝ[X]) = polynomialStep t := by
    funext q
    simp [E, polynomialStep, D, add_comm]
  rw [← hE, ← Module.End.pow_apply]
  dsimp only [E]
  rw [(Commute.one_right (t • D)).add_pow]
  simp only [LinearMap.sum_apply, one_pow, mul_one, smul_pow,
    Module.End.mul_apply, LinearMap.smul_apply, Module.End.natCast_apply, map_nsmul,
    Module.End.pow_apply]
  apply Finset.sum_congr rfl
  intro k hk
  rw [← Nat.cast_smul_eq_nsmul ℝ, smul_smul]

theorem polynomialStep_iterate_sum_degree (t : ℝ) (p : ℝ[X]) (N : ℕ)
    (hN : p.natDegree ≤ N) :
    (polynomialStep t)^[N] p =
      ∑ k ∈ Finset.range (p.natDegree + 1), ((N.choose k : ℝ) * t ^ k) •
        (derivative^[k] p) := by
  rw [polynomialStep_iterate_sum]
  symm
  apply Finset.sum_subset (Finset.range_mono (by omega))
  intro k hk hk'
  have hdegree : p.natDegree < k := by
    simp only [Finset.mem_range] at hk'
    omega
  rw [iterate_derivative_eq_zero hdegree, smul_zero]

theorem taylor_eq_sum_hasseDeriv (r : ℝ) (p : ℝ[X]) :
    taylor r p = ∑ k ∈ Finset.range (p.natDegree + 1), r ^ k • hasseDeriv k p := by
  ext i
  rw [taylor_coeff]
  rw [eval_eq_sum_range' (n := p.natDegree + 1)]
  · simp only [finsetSum_coeff, coeff_smul, smul_eq_mul, hasseDeriv_coeff]
    apply Finset.sum_congr rfl
    intro k hk
    rw [Nat.add_comm k i, Nat.choose_symm_add]
    ring
  · exact lt_of_le_of_lt ((natDegree_hasseDeriv_le p i).trans (Nat.sub_le _ _))
      (Nat.lt_succ_self _)

theorem inv_factorial_smul_iterate_derivative (p : ℝ[X]) (k : ℕ) :
    (1 / (k.factorial : ℝ)) • (derivative^[k] p) = hasseDeriv k p := by
  have h := congrFun (factorial_smul_hasseDeriv (R := ℝ) k) p
  rw [← h]
  simp only [LinearMap.smul_apply]
  rw [← Nat.cast_smul_eq_nsmul ℝ, smul_smul]
  simp [Nat.factorial_ne_zero]

theorem taylor_eq_sum_derivatives (r : ℝ) (p : ℝ[X]) :
    taylor r p = ∑ k ∈ Finset.range (p.natDegree + 1),
      (r ^ k / (k.factorial : ℝ)) • (derivative^[k] p) := by
  rw [taylor_eq_sum_hasseDeriv]
  apply Finset.sum_congr rfl
  intro k hk
  rw [← inv_factorial_smul_iterate_derivative p k, smul_smul]
  congr 1
  ring

theorem polynomialStep_iterate_tendsto_coeff (r : ℝ) (p : ℝ[X]) (i : ℕ) :
    Tendsto (fun N : ℕ => ((polynomialStep (r / N))^[N] p).coeff i)
      atTop (𝓝 ((taylor r p).coeff i)) := by
  have hr : Tendsto (fun N : ℕ => (N : ℝ) * (r / N)) atTop (𝓝 r) := by
    apply tendsto_const_nhds.congr'
    filter_upwards [eventually_ge_atTop 1] with N hN
    have hne : (N : ℝ) ≠ 0 := by exact_mod_cast (show N ≠ 0 by omega)
    field_simp
  have hsum : Tendsto (fun N : ℕ =>
      ∑ k ∈ Finset.range (p.natDegree + 1),
        ((N.choose k : ℝ) * (r / N) ^ k) * (derivative^[k] p).coeff i)
      atTop (𝓝 (∑ k ∈ Finset.range (p.natDegree + 1),
        (r ^ k / (k.factorial : ℝ)) * (derivative^[k] p).coeff i)) := by
    apply tendsto_finsetSum
    intro k hk
    exact (ProbabilityTheory.tendsto_choose_mul_pow_atTop k hr).mul_const _
  have heq : (fun N : ℕ => ∑ k ∈ Finset.range (p.natDegree + 1),
        ((N.choose k : ℝ) * (r / N) ^ k) * (derivative^[k] p).coeff i) =ᶠ[atTop]
      (fun N : ℕ => ((polynomialStep (r / N))^[N] p).coeff i) := by
    filter_upwards [eventually_ge_atTop p.natDegree] with N hN
    rw [polynomialStep_iterate_sum_degree _ _ _ hN]
    simp only [finsetSum_coeff, coeff_smul, smul_eq_mul]
  rw [taylor_eq_sum_derivatives]
  simp only [finsetSum_coeff, coeff_smul, smul_eq_mul]
  exact hsum.congr' heq

/-- Translation by a nonnegative real preserves nonnegative coefficient
sequences with interval support and log-concavity. This is the full general
translation step, not a finite numerical check. -/
theorem taylor_preserves_strongLogConcave {p : ℝ[X]} (hp : ∀ i, 0 ≤ p.coeff i)
    (hc : StrongLogConcave p.coeff) {r : ℝ} (hr : 0 ≤ r) :
    (∀ i, 0 ≤ (taylor r p).coeff i) ∧ StrongLogConcave (taylor r p).coeff := by
  have hN (N : ℕ) := polynomialStep_iterate_preserves hp hc
    (show 0 ≤ r / (N : ℝ) by positivity) N
  constructor
  · intro i
    exact le_of_tendsto_of_tendsto tendsto_const_nhds
      (polynomialStep_iterate_tendsto_coeff r p i)
      (Filter.Eventually.of_forall fun N => (hN N).1 i)
  · intro i j hij
    exact le_of_tendsto_of_tendsto
      ((polynomialStep_iterate_tendsto_coeff r p i).mul
        (polynomialStep_iterate_tendsto_coeff r p (j + 1)))
      ((polynomialStep_iterate_tendsto_coeff r p (i + 1)).mul
        (polynomialStep_iterate_tendsto_coeff r p j))
      (Filter.Eventually.of_forall fun N => (hN N).2 i j hij)

theorem taylor_preserves_logConcave {p : ℝ[X]} (hp : ∀ i, 0 ≤ p.coeff i)
    (hc : LogConcave p.coeff) (hs : IntervalSupport p.coeff)
    {r : ℝ} (hr : 0 ≤ r) : LogConcave (taylor r p).coeff :=
  (taylor_preserves_strongLogConcave hp (hc.strong hp hs) hr).2.logConcave

end Juhnke
