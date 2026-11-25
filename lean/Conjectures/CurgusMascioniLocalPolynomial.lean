import Mathlib.Algebra.Polynomial.Eval.Defs
import Mathlib.Algebra.Polynomial.Coeff
import Mathlib.Algebra.Polynomial.Derivative
import Mathlib.Tactic.Ring
import Mathlib.Topology.Algebra.Ring.Basic

namespace CurgusMascioniLocalPolynomial

open Filter Polynomial
open scoped Topology BigOperators

variable {R : Type*} [Field R]

theorem normalize_product {I : Type*} [DecidableEq I] (s t : Finset I)
    (hd : Disjoint s t) (a : I → R) (ha : ∀ i ∈ t, a i ≠ 0) :
    C ((∏ i ∈ t, a i)⁻¹) * (∏ i ∈ s ∪ t, (X + C (a i))) =
      (∏ i ∈ s, (X + C (a i))) * (∏ i ∈ t, (1 + C ((a i)⁻¹) * X)) := by
  have hfactor (i : I) (hi : i ∈ t) :
      C (a i) * (1 + C ((a i)⁻¹) * X) = (X + C (a i)) := by
    rw [mul_add, mul_one, ← mul_assoc, ← map_mul, mul_inv_cancel₀ (ha i hi), map_one, one_mul, add_comm]
  have hprod : (∏ i ∈ t, (X + C (a i))) =
      C (∏ i ∈ t, a i) * (∏ i ∈ t, (1 + C ((a i)⁻¹) * X)) := by
    simp only [map_prod, ← Finset.prod_mul_distrib]
    exact Finset.prod_congr rfl (fun i hi => (hfactor i hi).symm)
  rw [Finset.prod_union hd, hprod, ← mul_assoc,
    mul_comm (C ((∏ i ∈ t, a i)⁻¹)), ← mul_assoc, mul_assoc (∏ i ∈ s, _),
    ← map_mul, inv_mul_cancel₀ (Finset.prod_ne_zero_iff.mpr ha), map_one, mul_one]

theorem recenter_product {I : Type*} (s : Finset I) (u : I → R) (c : R) :
    (∏ i ∈ s, (X - C (u i))).comp (X + C c) =
      ∏ i ∈ s, (X + C (c-u i)) := by
  rw [prod_comp]
  apply Finset.prod_congr rfl
  intro i _
  simp only [sub_comp, X_comp, C_comp, map_sub]
  ring

section Limits

variable [TopologicalSpace R] [IsTopologicalRing R]

/-- Coefficientwise convergence does not require choosing a norm or topology
on the entire polynomial space. -/
def CoeffTendsto (p : ℕ → R[X]) (q : R[X]) : Prop :=
  ∀ k : ℕ, Tendsto (fun n => (p n).coeff k) atTop (𝓝 (q.coeff k))

theorem coeffTendsto_mul {p q : ℕ → R[X]} {p₀ q₀ : R[X]}
    (hp : CoeffTendsto p p₀) (hq : CoeffTendsto q q₀) :
    CoeffTendsto (fun n => p n * q n) (p₀ * q₀) := by
  intro k
  simp only [coeff_mul]
  apply tendsto_finsetSum
  intro i _
  exact (hp i.1).mul (hq i.2)

theorem coeffTendsto_prod {I : Type*} (s : Finset I) {p : I → ℕ → R[X]} {p₀ : I → R[X]}
    (h : ∀ i ∈ s, CoeffTendsto (p i) (p₀ i)) :
    CoeffTendsto (fun n => ∏ i ∈ s, p i n) (∏ i ∈ s, p₀ i) := by
  classical
  induction s using Finset.induction_on with
  | empty =>
    intro k
    simpa only [Finset.prod_empty] using (tendsto_const_nhds : Tendsto
      (fun _ : ℕ => (1 : R[X]).coeff k) atTop (𝓝 ((1 : R[X]).coeff k)))
  | insert i s hi ih =>
    simp only [Finset.prod_insert hi]
    apply coeffTendsto_mul (h _ (Finset.mem_insert_self _ _))
    exact ih (fun j hj => h _ (Finset.mem_insert_of_mem hj))

omit [IsTopologicalRing R] in
theorem coeffTendsto_X_add_C {a : ℕ → R} {b : R} (h : Tendsto a atTop (𝓝 b)) :
    CoeffTendsto (fun n => X + C (a n)) (X + C b) := by
  intro k
  by_cases hk : k = 0
  · subst k
    simpa only [coeff_add, coeff_X_zero, coeff_C_zero, zero_add] using h
  · simpa only [coeff_add, coeff_C, ite_eq_right hk, add_zero] using (tendsto_const_nhds :
      Tendsto (fun _ : ℕ => (X : R[X]).coeff k) atTop (𝓝 ((X : R[X]).coeff k)))

omit [IsTopologicalRing R] in
theorem coeffTendsto_far_factor {a : ℕ → R} (h : Tendsto a atTop (𝓝 0)) :
    CoeffTendsto (fun n => 1 + C (a n) * X) 1 := by
  intro k
  by_cases hk : k = 1
  · subst k
    simpa [coeff_C_mul_X, coeff_one] using h
  · simpa only [coeff_add, coeff_C_mul_X, ite_eq_right hk, add_zero] using (tendsto_const_nhds :
      Tendsto (fun _ : ℕ => (1 : R[X]).coeff k) atTop (𝓝 ((1 : R[X]).coeff k)))

/-- Cluster-local factor limit, once the recentered roots of this cluster
converge and the inverse differences from every exterior root vanish. -/
theorem coeffTendsto_local_factors {I : Type*} (s t : Finset I) (a : I → ℕ → R) (b : I → R)
    (hnear : ∀ i ∈ s, Tendsto (a i) atTop (𝓝 (b i)))
    (hfar : ∀ i ∈ t, Tendsto (fun n => (a i n)⁻¹) atTop (𝓝 0)) :
    CoeffTendsto (fun n => (∏ i ∈ s, (X+C (a i n))) *
        ∏ i ∈ t, (1+C ((a i n)⁻¹)*X)) (∏ i ∈ s, (X+C (b i))) := by
  have hin := coeffTendsto_prod s (fun i hi => coeffTendsto_X_add_C (hnear i hi))
  have hout := coeffTendsto_prod t (fun i hi => coeffTendsto_far_factor (hfar i hi))
  simpa only [Finset.prod_const_one, mul_one] using coeffTendsto_mul hin hout

theorem coeffTendsto_derivative {p : ℕ → R[X]} {q : R[X]}
    (h : CoeffTendsto p q) : CoeffTendsto (fun n => derivative (p n)) (derivative q) := by
  intro k
  simp only [coeff_derivative]
  exact (h (k+1)).mul tendsto_const_nhds

theorem coeffTendsto_iteratedDerivative {p : ℕ → R[X]} {q : R[X]}
    (h : CoeffTendsto p q) (j : ℕ) :
    CoeffTendsto (fun n => (derivative^[j]) (p n)) ((derivative^[j]) q) := by
  induction j with
  | zero => exact h
  | succ j ih =>
    simpa only [Function.iterate_succ_apply'] using coeffTendsto_derivative ih

theorem coeffTendsto_constantOperator {p : ℕ → R[X]} {q : R[X]}
    (h : CoeffTendsto p q) (d : ℕ) (a : ℕ → R) :
    CoeffTendsto (fun n => ∑ j ∈ Finset.range d, C (a j) * (derivative^[j]) (p n))
      (∑ j ∈ Finset.range d, C (a j) * (derivative^[j]) q) := by
  intro k
  simp only [finsetSum_coeff, coeff_C_mul]
  apply tendsto_finsetSum
  intro j _
  exact tendsto_const_nhds.mul (coeffTendsto_iteratedDerivative h j k)

end Limits

end CurgusMascioniLocalPolynomial
