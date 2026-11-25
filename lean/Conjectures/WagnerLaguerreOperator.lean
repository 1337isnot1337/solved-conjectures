module

public import Mathlib.Algebra.Polynomial.Derivative
public import Mathlib.Algebra.Polynomial.Degree.Lemmas
public import Mathlib.Analysis.Normed.Module.MultipliableUniformlyOn
public import Mathlib.Analysis.SpecialFunctions.ExpDeriv
public import Mathlib.Tactic.FieldSimp
public import Mathlib.Tactic.GCongr
public import Mathlib.Tactic.Linarith
public import Mathlib.Tactic.NormNum
public import Mathlib.Tactic.Positivity
public import Mathlib.Tactic.Ring

/-! Direct formalization of the exp-plus-one counterexample to Wagner
Conjecture 4.3. Membership is witnessed by actual real polynomials and
compact-uniform convergence, not assumed from a Jensen equivalence. -/

@[expose] public section

namespace WagnerLaguerreOperator

open Filter Polynomial
open scoped Topology

noncomputable section

/-- The real, same-sign root condition on a polynomial. -/
def sameSignRoots (P : ℝ[X]) : Prop :=
  (∀ z : ℂ, (P.map Complex.ofRealHom).IsRoot z → z.im = 0 ∧ z.re ≤ 0) ∨
  (∀ z : ℂ, (P.map Complex.ofRealHom).IsRoot z → z.im = 0 ∧ 0 ≤ z.re)

/-- A real entire member of the positive shifted Laguerre–Pólya class. -/
def positiveShifted (f : ℂ → ℂ) : Prop :=
  Differentiable ℂ f ∧
  (∀ x : ℝ, (f x).im = 0) ∧
  (∃ m : ℕ, ∀ k ≥ m, 0 ≤ ((deriv^[k] f) 0).re) ∧
  ∃ P : ℕ → ℝ[X],
    (∀ K : Set ℂ, IsCompact K →
      TendstoUniformlyOn (fun n z => ((P n).map Complex.ofRealHom).eval z) f atTop K) ∧
    ∀ d : ℕ, ∃ N : ℕ, ∀ n ≥ N,
      d ≤ (P n).natDegree ∧ sameSignRoots (derivative^[(P n).natDegree - d] (P n))

/-- The first Laguerre operator, exactly the formula in equation (1.2). -/
def firstLaguerre (f : ℂ → ℂ) (z : ℂ) : ℂ :=
  deriv f z ^ 2 - f z * deriv (deriv f) z

/-- The full family in the paper's explicit generalized Leibniz formula (1.3). -/
def laguerre (j : ℕ) (f : ℂ → ℂ) (z : ℂ) : ℂ :=
  (∑ i ∈ Finset.range (2*j+1),
    (-1 : ℂ)^(i+j) * ((2*j).choose i : ℂ) *
      (deriv^[i] f) z * (deriv^[2*j-i] f) z) / ((2*j).factorial : ℂ)

theorem laguerre_one (f : ℂ → ℂ) : laguerre 1 f = firstLaguerre f := by
  funext z
  norm_num [laguerre, firstLaguerre, Finset.sum_range_succ,
    Function.iterate_succ_apply]
  ring

def witness (z : ℂ) : ℂ := Complex.exp z + 1

/-- The real polynomials \`(1 + X/n)^n + 1\` in the witness sequence. -/
def approximate (n : ℕ) : ℝ[X] :=
  C (((n : ℝ) ^ n)⁻¹) * (X + C (n : ℝ)) ^ n + 1

private theorem approx_degree {n : ℕ} (hn : 0 < n) :
    (approximate n).natDegree = n := by
  rw [approximate, natDegree_add_one, natDegree_C_mul (by positivity),
    natDegree_pow, natDegree_X_add_C]
  simp

private theorem approx_eval {n : ℕ} (hn : 0 < n) (z : ℂ) :
    ((approximate n).map Complex.ofRealHom).eval z = (1 + z / n) ^ n + 1 := by
  have hn' : (n : ℂ) ≠ 0 := by exact_mod_cast hn.ne'
  simp [approximate]
  rw [← inv_pow, ← mul_pow]
  congr 2
  field_simp
  ring

private theorem approx_shifted_roots {d n : ℕ} (hn : d + 1 ≤ n) :
    sameSignRoots (derivative^[n - d] (approximate n)) := by
  let k := n - d
  have hk : 0 < k := by omega
  have hnpos : 0 < n := by omega
  have hdf : n.descFactorial k ≠ 0 := (Nat.descFactorial_pos.mpr (by omega)).ne'
  have hsplit (a b : ℝ[X]) :
      derivative^[k] (a + b) = derivative^[k] a + derivative^[k] b := by
    simp_rw [← Module.End.pow_apply, map_add]
  have hp : derivative^[n - d] (approximate n) =
      C (((n : ℝ) ^ n)⁻¹) * (n.descFactorial k • (X + C (n : ℝ)) ^ d) := by
    change derivative^[k] (approximate n) = _
    rw [approximate, hsplit, iterate_derivative_one hk, add_zero,
      iterate_derivative_C_mul, iterate_derivative_X_add_pow]
    have h : n - k = d := by omega
    rw [h]
  left
  intro z hz
  rw [hp] at hz
  have hnC : (n : ℂ) ≠ 0 := by exact_mod_cast hnpos.ne'
  have hdC : (n.descFactorial k : ℂ) ≠ 0 := by exact_mod_cast hdf
  have hroot : z + (n : ℂ) = 0 := by
    simp [Polynomial.IsRoot, hnC, hdC] at hz
    exact hz.1
  have hz' : z = -(n : ℂ) := eq_neg_of_add_eq_zero_left hroot
  rw [hz']
  simp

private theorem uniform_log (K : Set ℂ) (hK : IsCompact K) :
    TendstoUniformlyOn (fun n : ℕ => fun z : ℂ => (n : ℂ) * Complex.log (1 + z / n))
      id atTop K := by
  obtain ⟨M, hM⟩ := hK.isBounded.exists_norm_le
  let R := max 1 M
  have hR : 0 < R := lt_of_lt_of_le zero_lt_one (le_max_left _ _)
  rw [Metric.tendstoUniformlyOn_iff]
  intro ε hε
  obtain ⟨N, hN⟩ := exists_nat_gt (max (2 * R) (R^2 / ε))
  filter_upwards [eventually_ge_atTop N] with n hn z hz
  have h1 : 2 * R < (n : ℝ) :=
    (le_max_left _ _).trans_lt (hN.trans_le (by exact_mod_cast hn))
  have h2 : R ^ 2 / ε < (n : ℝ) :=
    (le_max_right _ _).trans_lt (hN.trans_le (by exact_mod_cast hn))
  have hnR : 0 < (n : ℝ) := by linarith
  have hnC : (n : ℂ) ≠ 0 := by exact_mod_cast hnR.ne'
  let u : ℂ := z / n
  have hu : ‖u‖ ≤ R / (n : ℝ) := by
    rw [show ‖u‖ = ‖z‖ / (n : ℝ) by simp [u]]
    exact (div_le_div_iff_of_pos_right hnR).2 ((hM z hz).trans (le_max_right _ _))
  have hu' : ‖u‖ < 1 / 2 := hu.trans_lt ((div_lt_iff₀ hnR).2 (by linarith))
  have hinv : (1 - ‖u‖)⁻¹ ≤ 2 := by
    rw [inv_le_comm₀ (by linarith : 0 < 1 - ‖u‖) (by norm_num : (0 : ℝ) < 2)]
    linarith
  have herr : ‖Complex.log (1 + u) - u‖ ≤ ‖u‖ ^ 2 := by
    refine (Complex.norm_log_one_add_sub_self_le (by linarith)).trans ?_
    nlinarith [mul_le_mul_of_nonneg_left hinv (sq_nonneg ‖u‖)]
  have heq : (n : ℂ) * (Complex.log (1 + u) - u) =
      (n : ℂ) * Complex.log (1 + z/n) - z := by
    rw [mul_sub, show (n : ℂ) * u = z by dsimp [u]; field_simp]
  simp only [id_eq, dist_comm z, dist_eq_norm, ← heq, norm_mul, Complex.norm_natCast]
  calc
    (n : ℝ) * ‖Complex.log (1 + u) - u‖ ≤ (n : ℝ) * ‖u‖^2 :=
      mul_le_mul_of_nonneg_left herr hnR.le
    _ ≤ (n : ℝ) * (R / n)^2 := by gcongr
    _ = R^2 / n := by field_simp
    _ < ε := by
      rw [div_lt_iff₀ hnR]
      linarith [(div_lt_iff₀ hε).1 h2]

theorem approximate_converges (K : Set ℂ) (hK : IsCompact K) :
    TendstoUniformlyOn (fun n z => ((approximate n).map Complex.ofRealHom).eval z)
      witness atTop K := by
  obtain ⟨M, hM⟩ := hK.isBounded.exists_norm_le
  let R := max 1 M
  have hB : BddAbove ((fun z : ℂ => (id z).re) '' K) := by
    use R
    rintro _ ⟨z,hz,rfl⟩
    exact (Complex.re_le_norm z).trans ((hM z hz).trans (le_max_right _ _))
  have h := (uniform_log K hK).comp_cexp hB
  rw [Metric.tendstoUniformlyOn_iff] at h ⊢
  intro ε hε
  obtain ⟨N, hN⟩ := exists_nat_gt R
  filter_upwards [h ε hε, eventually_ge_atTop N] with n hdist hn z hz
  have hnR : R < (n : ℝ) := hN.trans_le (by exact_mod_cast hn)
  have hnposR : 0 < (n : ℝ) := lt_trans (lt_of_lt_of_le zero_lt_one (le_max_left _ _)) hnR
  have hnpos : 0 < n := by exact_mod_cast hnposR
  have hne : 1 + z / (n : ℂ) ≠ 0 := by
    intro he
    have he' : z / (n : ℂ) = -1 := eq_neg_of_add_eq_zero_right he
    have hnorm := congrArg norm he'
    rw [norm_div, Complex.norm_natCast, norm_neg, norm_one] at hnorm
    have hh : ‖z‖ = (n : ℝ) := (div_eq_iff hnposR.ne').mp hnorm |>.trans (one_mul _)
    exact (not_le_of_gt (hh ▸ hnR)) ((hM z hz).trans (le_max_right _ _))
  have hpow : Complex.exp ((n : ℂ) * Complex.log (1 + z / n)) = (1 + z / n) ^ n := by
    rw [Complex.exp_nat_mul, Complex.exp_log hne]
  have hz' := hdist z hz
  simp only [Function.comp_apply, id_eq, hpow] at hz'
  rw [approx_eval hnpos]
  simpa [witness, dist_eq_norm] using hz'

private theorem deriv_witness : deriv witness = Complex.exp := by
  unfold witness
  rw [deriv_add_const', Complex.deriv_exp]

private theorem deriv_neg_exp : deriv (fun z : ℂ => -Complex.exp z) =
    (fun z : ℂ => -Complex.exp z) := by
  funext z
  exact (Complex.hasDerivAt_exp z).neg.deriv

private theorem iterate_deriv_witness (k : ℕ) :
    deriv^[k + 1] witness = Complex.exp := by
  rw [Function.iterate_succ_apply, deriv_witness, Complex.iter_deriv_exp]

theorem witness_in_class : positiveShifted witness := by
  refine ⟨Complex.differentiable_exp.add_const _, ?_, ⟨1, ?_⟩,
    approximate, approximate_converges, ?_⟩
  · intro x
    simp [witness, ← Complex.ofReal_exp]
  · intro k hk
    obtain ⟨m, rfl⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : k ≠ 0)
    rw [iterate_deriv_witness]
    simp
  · intro d
    refine ⟨d + 1, fun n hn => ?_⟩
    rw [approx_degree (by omega : 0 < n)]
    exact ⟨by omega, approx_shifted_roots hn⟩

theorem firstLaguerre_witness : firstLaguerre witness = fun z => -Complex.exp z := by
  ext z
  unfold firstLaguerre
  rw [deriv_witness, Complex.deriv_exp]
  simp only [witness]
  ring

theorem firstLaguerre_not_in_class : ¬ positiveShifted (firstLaguerre witness) := by
  rw [firstLaguerre_witness]
  rintro ⟨_, _, ⟨m, hm⟩, _⟩
  have hi : ∀ k, deriv^[k] (fun z : ℂ => -Complex.exp z) = fun z => -Complex.exp z := by
    intro k
    induction k with
    | zero => rfl
    | succ k ih => rw [Function.iterate_succ_apply, deriv_neg_exp, ih]
  have hc := hm m le_rfl
  rw [hi m] at hc
  norm_num at hc

/-- Wagner's full universally quantified closure claim, Conjecture 4.3, is false. -/
theorem wagner_conjecture_4_3_false :
    ¬ ∀ (f : ℂ → ℂ) (j : ℕ), positiveShifted f → positiveShifted (laguerre j f) := by
  intro h
  have h' := h witness 1 witness_in_class
  rw [laguerre_one] at h'
  exact firstLaguerre_not_in_class h'

end

end WagnerLaguerreOperator
