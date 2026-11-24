import Mathlib

/-!
# Wagner's conjecture

Candidate formalization of the existing repository disproof, not a new result.
Source: Ian Wagner, arXiv:2108.01827v2, Conjecture 4.3.
Argument: results/wagner-laguerre-operator/PROOF.md (original attribution
and bounded priority audit there). The first Laguerre operator alone
refutes the universal operator-preservation conjecture.

This candidate is not certified until strict compilation, all-owned
axiom audit, kernel replay, and statement audit have passed.
-/

open Polynomial Filter
open scoped Topology

namespace WagnerLaguerre

noncomputable section

/-- The witness in the existing proof. -/
def witness (z : ℂ) : ℂ := Complex.exp z + 1

/-- The first Laguerre operator, as defined in the source. -/
def firstLaguerre (f : ℂ → ℂ) (z : ℂ) : ℂ :=
  (deriv f z)^2 - f z * deriv (deriv f) z

/-- Eventual nonnegativity of the exponential Taylor coefficients. -/
def EventuallyPositive (f : ℂ → ℂ) : Prop :=
  ∃ N : ℕ, ∀ k : ℕ, N ≤ k → 0 ≤ (iteratedDeriv k f 0).re

/-- Evaluation of a real polynomial at a complex point. -/
def evalComplex (p : ℝ[X]) (z : ℂ) : ℂ :=
  p.eval₂ Complex.ofRealHom z

/-- The source's approximating polynomial, written in factored form. -/
def approximant (n : ℕ) : ℝ[X] :=
  C (((n : ℝ)⁻¹)^n) * (X + C (n : ℝ))^n + 1

/-- Uniform convergence on all compact subsets of the complex plane. -/
def LocalUniform (p : ℕ → ℝ[X]) (f : ℂ → ℂ) : Prop :=
  ∀ K : Set ℂ, IsCompact K →
    TendstoUniformlyOn (fun n z => evalComplex (p n) z) f atTop K

/-- The fixed-degree eventual same-sign-real-root condition.
The choice of sign is allowed to depend on the polynomial. -/
def ShiftedRoots (p : ℕ → ℝ[X]) : Prop :=
  ∀ d : ℕ, 0 < d → ∃ N : ℕ, ∀ n : ℕ, N ≤ n →
    d ≤ (p n).natDegree ∧
    let q := (derivative^[((p n).natDegree - d)]) (p n)
    ((∀ z : ℂ, evalComplex q z = 0 → z.im = 0 ∧ z.re ≤ 0) ∨
     (∀ z : ℂ, evalComplex q z = 0 → z.im = 0 ∧ 0 ≤ z.re))

/-- Positive shifted Laguerre–Pólya class, using the polynomial definition
rather than assuming the source's Jensen-polynomial equivalence. -/
def ShiftedPositive (f : ℂ → ℂ) : Prop :=
  (∀ z, AnalyticAt ℂ f z) ∧
  (∀ x : ℝ, (f x).im = 0) ∧
  EventuallyPositive f ∧
  ∃ p : ℕ → ℝ[X], LocalUniform p f ∧ ShiftedRoots p

theorem witness_deriv : deriv witness = Complex.exp := by
  funext z
  exact ((Complex.hasDerivAt_exp z).add_const 1).deriv

theorem witness_iteratedDeriv_succ (k : ℕ) :
    iteratedDeriv (k + 1) witness = Complex.exp := by
  rw [iteratedDeriv_eq_iterate, Function.iterate_succ_apply]
  rw [witness_deriv, Complex.iter_deriv_exp]

theorem witness_eventuallyPositive : EventuallyPositive witness := by
  refine ⟨1, ?_⟩
  intro k hk
  obtain ⟨j, rfl⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : k ≠ 0)
  rw [witness_iteratedDeriv_succ]
  simp

theorem firstLaguerre_witness :
    firstLaguerre witness = fun z => -Complex.exp z := by
  funext z
  simp only [firstLaguerre, witness_deriv, Complex.deriv_exp, witness]
  ring

theorem firstLaguerre_not_positive :
    ¬ EventuallyPositive (firstLaguerre witness) := by
  rw [firstLaguerre_witness]
  rintro ⟨N, hN⟩
  have h : iteratedDeriv (N + 1) (fun z : ℂ => -Complex.exp z) =
      fun z => -Complex.exp z := by
    induction N with
    | zero =>
      simp [iteratedDeriv_succ, Complex.deriv_exp]
    | succ N ih =>
      rw [iteratedDeriv_succ', ih]
      simp [Complex.deriv_exp]
  have hbad := hN (N + 1) (by omega)
  rw [h] at hbad
  simp at hbad

theorem approximant_degree {n : ℕ} (hn : 0 < n) :
    (approximant n).natDegree = n := by
  have hn' : (n : ℝ) ≠ 0 := by exact_mod_cast (Nat.ne_of_gt hn)
  have hunit : IsUnit (((n : ℝ)⁻¹)^n) :=
    isUnit_iff_ne_zero.mpr (pow_ne_zero _ (inv_ne_zero hn'))
  have hdegree :
      (C (((n : ℝ)⁻¹)^n) * (X + C (n : ℝ))^n).natDegree = n := by
    rw [Polynomial.natDegree_C_mul_of_isUnit hunit]
    simp [Polynomial.natDegree_pow]
  unfold approximant
  rw [Polynomial.natDegree_add_eq_left_of_natDegree_lt]
  · exact hdegree
  · simpa [hdegree] using hn

/-- Iteration preserves addition; this is also true at iteration zero. -/
theorem derivative_iterate_add (k : ℕ) (p q : ℝ[X]) :
    (derivative^[k]) (p + q) = (derivative^[k]) p + (derivative^[k]) q := by
  induction k with
  | zero => rfl
  | succ k ih =>
    simp only [Function.iterate_succ_apply', ih, Polynomial.derivative_add]

theorem approximant_shifted_derivative {n d : ℕ} (hdn : d < n) :
    (derivative^[n-d]) (approximant n) =
      C (((n : ℝ)⁻¹)^n) *
        (n.descFactorial (n-d) • (X + C (n : ℝ))^d) := by
  have hk : 0 < n - d := by omega
  have hsub : n - (n - d) = d := by omega
  unfold approximant
  rw [derivative_iterate_add, Polynomial.iterate_derivative_C_mul,
    Polynomial.iterate_derivative_X_add_pow, hsub,
    Polynomial.iterate_derivative_one hk, add_zero]

theorem approximant_shifted_roots {n d : ℕ} (hd : 0 < d) (hdn : d < n)
    (z : ℂ)
    (hz : evalComplex ((derivative^[n-d]) (approximant n)) z = 0) :
    z = -(n : ℂ) := by
  have hn : (n : ℂ) ≠ 0 := by exact_mod_cast (by omega : n ≠ 0)
  have hf : n.descFactorial (n-d) ≠ 0 :=
    Nat.ne_of_gt (Nat.descFactorial_pos.mpr (by omega))
  have hf' : (n.descFactorial (n-d) : ℂ) ≠ 0 := by exact_mod_cast hf
  rw [approximant_shifted_derivative hdn] at hz
  have hz' : ((n : ℂ)⁻¹)^n *
      ((n.descFactorial (n-d) : ℂ) * (z + (n : ℂ))^d) = 0 := by
    simpa [evalComplex, nsmul_eq_mul] using hz
  have hp : (z + (n : ℂ))^d = 0 :=
    (mul_eq_zero.mp ((mul_eq_zero.mp hz').resolve_left
      (pow_ne_zero _ (inv_ne_zero hn)))).resolve_left hf'
  have ha : z + (n : ℂ) = 0 := (pow_eq_zero hp)
  exact eq_neg_of_add_eq_zero_left ha

theorem approximants_shiftedRoots : ShiftedRoots approximant := by
  intro d hd
  refine ⟨d+1, ?_⟩
  intro n hn
  have hdn : d < n := by omega
  rw [approximant_degree (by omega : 0 < n)]
  refine ⟨by omega, Or.inl ?_⟩
  intro z hz
  rw [approximant_shifted_roots hd hdn z hz]
  constructor
  · simp
  · simp

theorem approximant_eval (n : ℕ) (z : ℂ) :
    evalComplex (approximant n) z = (1 + z/(n : ℂ))^n + 1 := by
  by_cases hn : n = 0
  · subst n
    simp [approximant, evalComplex]
  · have hn' : (n : ℂ) ≠ 0 := by exact_mod_cast hn
    simp only [approximant, evalComplex, Polynomial.eval₂_add,
      Polynomial.eval₂_mul, Polynomial.eval₂_pow, Polynomial.eval₂_C,
      Polynomial.eval₂_X, Polynomial.eval₂_one, map_pow, map_inv₀, map_natCast]
    rw [← mul_pow]
    congr 2
    field_simp
    ring

theorem approximant_pointwise (z : ℂ) :
    Tendsto (fun n => evalComplex (approximant n) z) atTop (𝓝 (witness z)) := by
  simpa only [approximant_eval, witness] using
    (Complex.tendsto_one_add_div_pow_exp z).add tendsto_const_nhds

/-- A norm estimate for the difference of powers. We deliberately use
the weaker exponent n, valid when the common norm bound a is at least 1. -/
theorem pow_difference_bound (u v : ℂ) (a : ℝ) (ha : 1 ≤ a)
    (hu : ‖u‖ ≤ a) (hv : ‖v‖ ≤ a) (n : ℕ) :
    ‖u^n-v^n‖ ≤ (n : ℝ) * ‖u-v‖ * a^n := by
  induction n with
  | zero => simp
  | succ n ih =>
    have hsplit : u^(n+1)-v^(n+1) =
        u*(u^n-v^n)+(u-v)*v^n := by
      rw [pow_succ' u, pow_succ' v]
      ring
    rw [hsplit]
    calc
      _ ≤ ‖u*(u^n-v^n)‖ + ‖(u-v)*v^n‖ := norm_add_le _ _
      _ = ‖u‖ * ‖u^n-v^n‖ + ‖u-v‖ * ‖v‖^n := by rw [norm_mul, norm_mul, norm_pow]
      _ ≤ a*((n : ℝ)*‖u-v‖*a^n)+‖u-v‖*a^n := by gcongr
      _ ≤ a*((n : ℝ)*‖u-v‖*a^n)+‖u-v‖*a^(n+1) := by
        rw [pow_succ]
        gcongr
        exact le_mul_of_one_le_right (by positivity) ha
      _ = (↑(n+1) : ℝ)*‖u-v‖*a^(n+1) := by
        push_cast
        rw [pow_succ]
        ring

/-- Uniform error estimate on the disk of radius n, n positive.
Together with the Archimedean property this gives local uniformity. -/
theorem approximation_error {n : ℕ} (hn : 0 < n) (z : ℂ)
    (hz : ‖z‖ ≤ (n : ℝ)) :
    ‖evalComplex (approximant n) z - witness z‖ ≤
      ‖z‖^2 * Real.exp ‖z‖ / (n : ℝ) := by
  have hnR : (0 : ℝ) < n := by exact_mod_cast hn
  have hnC : (n : ℂ) ≠ 0 := by exact_mod_cast (Nat.ne_of_gt hn)
  let x : ℂ := z / (n : ℂ)
  have hxnorm : ‖x‖ = ‖z‖ / (n : ℝ) := by simp [x, norm_div]
  have hx : ‖x‖ ≤ 1 := by rw [hxnorm]; exact (div_le_one hnR).2 hz
  let a := Real.exp ‖x‖
  have ha : 1 ≤ a := by dsimp [a]; exact Real.one_le_exp (norm_nonneg x)
  have hu : ‖1+x‖ ≤ a := calc
    _ ≤ 1+‖x‖ := by simpa using norm_add_le (1 : ℂ) x
    _ ≤ a := Real.add_one_le_exp ‖x‖ |>.trans_eq (by rfl)
  have hv : ‖Complex.exp x‖ ≤ a := Complex.norm_exp_le_exp_norm x
  have hdiff : ‖1+x-Complex.exp x‖ ≤ ‖x‖^2 := by
    rw [norm_sub_rev, sub_add_eq_sub_sub]
    exact Complex.norm_exp_sub_one_sub_id_le hx
  have he : Complex.exp x ^ n = Complex.exp z := by
    rw [← Complex.exp_nat_mul]
    congr 1
    dsimp [x]
    field_simp
  have hmul : (n : ℝ) * ‖x‖ = ‖z‖ := by
    rw [hxnorm]
    field_simp
  have hap : a^n = Real.exp ‖z‖ := by
    dsimp [a]
    rw [← Real.exp_nat_mul, hmul]
  rw [approximant_eval, witness]
  have hcancel : (1 + z / (n : ℂ))^n + 1 - (Complex.exp z + 1) =
      (1+x)^n - (Complex.exp x)^n := by
    rw [he]
    dsimp [x]
    ring
  rw [hcancel]
  calc
    _ ≤ (n : ℝ)*‖1+x-Complex.exp x‖*a^n :=
      pow_difference_bound _ _ a ha hu hv n
    _ ≤ (n : ℝ)*‖x‖^2*a^n := by gcongr
    _ = _ := by
      rw [hxnorm, hap]
      field_simp
      ring

/-- Compact-uniform convergence is obtained from the explicit disk estimate. -/
theorem approximants_localUniform : LocalUniform approximant witness := by
  intro K hK
  rw [Metric.tendstoUniformlyOn_iff]
  intro ε hε
  obtain ⟨R, hR⟩ := hK.isBounded.subset_closedBall (0 : ℂ)
  let B := max R 0
  have hB : 0 ≤ B := le_max_right _ _
  obtain ⟨N, hN⟩ := exists_nat_gt (max B (B^2 * Real.exp B / ε) + 1)
  filter_upwards [eventually_ge_atTop N] with n hn z hz
  have hzB : ‖z‖ ≤ B := by
    have hzR := hR hz
    rw [Metric.mem_closedBall, dist_zero_right] at hzR
    exact hzR.trans (le_max_left _ _)
  have hnR : (N : ℝ) ≤ n := by exact_mod_cast hn
  have hnB : B < (n : ℝ) := by
    have := le_max_left B (B^2 * Real.exp B / ε)
    linarith
  have hnposR : (0 : ℝ) < n := lt_of_le_of_lt hB hnB
  have hnpos : 0 < n := by exact_mod_cast hnposR
  have hN' : B^2 * Real.exp B / ε < (n : ℝ) := by
    have := le_max_right B (B^2 * Real.exp B / ε)
    linarith
  have hsmall : B^2 * Real.exp B / (n : ℝ) < ε := by
    apply (div_lt_iff₀ hnposR).2
    have := (div_lt_iff₀ hε).1 hN'
    linarith
  rw [dist_eq_norm, norm_sub_rev]
  calc
    _ ≤ ‖z‖^2 * Real.exp ‖z‖ / (n : ℝ) :=
      approximation_error hnpos z (hzB.trans hnB.le)
    _ ≤ B^2 * Real.exp B / (n : ℝ) := by gcongr
    _ < ε := hsmall

theorem witness_shiftedPositive : ShiftedPositive witness := by
  refine ⟨?_, ?_, witness_eventuallyPositive, approximant,
    approximants_localUniform, approximants_shiftedRoots⟩
  · intro z
    exact analyticAt_cexp.add analyticAt_const
  · intro x
    simp [witness, Complex.exp_ofReal_im]

/-- Refutes the universal preservation assertion already at j = 1. -/
theorem wagner_conjecture_false :
    ¬ ∀ f : ℂ → ℂ, ShiftedPositive f → ShiftedPositive (firstLaguerre f) := by
  intro h
  exact firstLaguerre_not_positive (h witness witness_shiftedPositive).2.2.1

end
end WagnerLaguerre
