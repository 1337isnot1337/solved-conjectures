module

public import Mathlib.Analysis.SpecialFunctions.ExpDeriv
public import Mathlib.Analysis.Calculus.FDeriv.Pow
public import Mathlib.Analysis.Calculus.IteratedDeriv.Defs
public import Mathlib.Analysis.Analytic.Uniqueness
public import Mathlib.Algebra.Polynomial.Splits
public import Mathlib.Topology.UniformSpace.UniformConvergence
public import Mathlib.Analysis.Real.Sqrt
public import Mathlib.Analysis.Normed.Ring.InfiniteSum
public import Mathlib.Tactic.LinearCombination
public import Mathlib.Tactic.NormNum
public import Mathlib.Tactic.Linarith
public import Mathlib.Tactic.Ring
public import Mathlib.Tactic.Positivity
public import Lean.Elab.Tactic.Omega

/-! # Csordas–Vishnyakova Conjecture 3.6

The admissible quartic z⁴+z²+1 and entire function exp(−z⁴) give a
counterexample. Along the imaginary axis, every real-rooted polynomial
approximation has a nondecreasing paired value, while exp(−z⁴) does not.
-/

public section

open scoped BigOperators Topology
open Filter

namespace CsordasVishnyakova

noncomputable def phi (z : ℂ) : ℂ := Complex.exp (-(z^4))

theorem phi_entire : Differentiable ℂ phi := by
  have hi : Differentiable ℂ (id : ℂ→ℂ) := differentiable_id
  exact Complex.differentiable_exp.comp ((hi.pow 4).neg)

theorem phi_nonzero (z : ℂ) : phi z ≠ 0 := Complex.exp_ne_zero _

theorem phi_real (x : ℝ) : phi (x:ℂ) = (Real.exp (-(x^4)):ℂ) := by
  rw [Complex.ofReal_exp]
  push_cast
  rfl

noncomputable def alpha : ℂ := (1 + (Real.sqrt 3:ℂ) * Complex.I) / 2

private theorem alpha_sq : alpha^2 = alpha-1 := by
  have hs : (Real.sqrt 3 : ℂ)^2 = 3 := by
    exact_mod_cast Real.sq_sqrt (by norm_num : (0:ℝ)≤3)
  have hi := Complex.I_sq
  have h : ((Real.sqrt 3:ℂ)*Complex.I)^2 = -3 := by
    rw [mul_pow, hs, hi]
    norm_num
  unfold alpha
  linear_combination h / 4

private theorem alpha_shift_sq : (alpha-1)^2 = -alpha := by
  linear_combination alpha_sq

/-- The four signed factors are exactly the roots of the stated admissible
quartic, in the source's plus-sign convention. -/
theorem factor_quartic (z : ℂ) :
    (z+alpha)*(z-alpha)*(z+(alpha-1))*(z-(alpha-1)) = z^4+z^2+1 := by
  have hm : alpha*(alpha-1) = -1 := by linear_combination alpha_sq
  calc
    _ = (z^2-alpha^2)*(z^2-(alpha-1)^2) := by ring
    _ = _ := by
      rw [alpha_sq, alpha_shift_sq]
      linear_combination -hm

theorem quartic_positive (x : ℝ) : 0 < x^4+x^2+1 := by positivity

theorem alpha_nonreal : alpha.im ≠ 0 := by
  have h : 0 < Real.sqrt 3 := Real.sqrt_pos.2 (by norm_num)
  unfold alpha
  simp [h.ne']

/-- The test polynomial in the source, with real coefficients. -/
noncomputable def quartic : Polynomial ℝ := Polynomial.X^4 + Polynomial.X^2 + 1

theorem quartic_monic : quartic.Monic := by
  apply Polynomial.monic_of_natDegree_le_of_coeff_eq_one 4
  · unfold quartic
    refine Polynomial.natDegree_add_le_of_degree_le ?_ (by simp)
    exact Polynomial.natDegree_add_le_of_degree_le (by simp) (by norm_num [Polynomial.natDegree_X_pow])
  · norm_num [quartic,Polynomial.coeff_add,Polynomial.coeff_X_pow,Polynomial.coeff_one]

theorem quartic_coeff_nonneg (n : ℕ) : 0 ≤ quartic.coeff n := by
  simp only [quartic,Polynomial.coeff_add,Polynomial.coeff_X_pow,Polynomial.coeff_one]
  split <;> split <;> split <;> norm_num

theorem quartic_eval (z : ℂ) :
    (quartic.map (algebraMap ℝ ℂ)).eval z = z^4+z^2+1 := by simp [quartic]

theorem quartic_even_eval (z : ℂ) :
    (quartic.map (algebraMap ℝ ℂ)).eval (-z) =
      (quartic.map (algebraMap ℝ ℂ)).eval z := by
  rw [quartic_eval,quartic_eval]
  ring

theorem quartic_alpha_root :
    (quartic.map (algebraMap ℝ ℂ)).eval alpha = 0 := by
  rw [quartic_eval, ←factor_quartic]
  simp

/-- The exact generating function for the test associated to the quartic. -/
noncomputable def test (z t : ℂ) : ℂ :=
  phi (z+alpha*t)*phi (z-alpha*t)*phi (z+(alpha-1)*t)*phi (z-(alpha-1)*t)

theorem test_formula (z t : ℂ) :
    test z t = Complex.exp (-4*z^4) * Complex.exp (12*z^2*t^2) * Complex.exp (2*t^4) := by
  unfold test phi
  simp only [← Complex.exp_add]
  apply congrArg Complex.exp
  have h1 : alpha^4 = -alpha := by rw [show (4:ℕ)=2*2 by decide, pow_mul, alpha_sq, alpha_shift_sq]
  have h2 : (alpha-1)^4 = alpha-1 := by
    rw [show (4:ℕ)=2*2 by decide, pow_mul, alpha_shift_sq, neg_sq, alpha_sq]
  calc
    _ = -4*z^4 - 6*z^2*t^2*(2*alpha^2+2*(alpha-1)^2) -
        t^4*(2*alpha^4+2*(alpha-1)^4) := by ring
    _ = _ := by rw [alpha_sq, alpha_shift_sq, h1, h2]; ring

/-- Coefficients of exp(c*t^m), with explicit zero insertion. -/
noncomputable def expCoeffs (m : ℕ) (c : ℝ) (n : ℕ) : ℝ :=
  if m ∣ n then c^(n/m) / ((n/m).factorial : ℝ) else 0

theorem expCoeffs_nonneg {m : ℕ} {c : ℝ} (hc : 0≤c) (n : ℕ) :
    0≤expCoeffs m c n := by
  unfold expCoeffs
  split <;> positivity

private theorem monomial_series {K : Type*} [NontriviallyNormedField K] [CompleteSpace K]
    [CharZero K] [NormedAlgebra ℚ K] (m : ℕ) (hm : 0<m) (c t : K) :
    HasSum (fun n : ℕ => (if m ∣ n then c^(n/m) / ((n/m).factorial : K) else 0)*t^n)
      (NormedSpace.exp (c*t^m)) := by
  let f : ℕ → ℕ := fun k => m*k
  have hf : Function.Injective f := fun a b hab => Nat.eq_of_mul_eq_mul_left hm hab
  have hs := (hasSum_extend_zero (f := fun k : ℕ => (c*t^m)^k / (k.factorial:K)) hf).mpr
    (NormedSpace.expSeries_div_hasSum_exp (c*t^m))
  convert hs using 1
  funext n
  by_cases h : m ∣ n
  · rcases h with ⟨k,rfl⟩
    rw [show m*k=f k from rfl, Function.Injective.extend_apply hf]
    dsimp [f]
    have hdiv : m*k/m=k := Nat.mul_div_cancel_left _ hm
    rw [ite_eq_left (dvd_mul_right _ _), hdiv, mul_pow, pow_mul]
    ring
  · have h' : ¬∃ k, f k=n := by simpa [f, dvd_def, eq_comm] using h
    rw [ite_eq_right h, Function.extend_apply' _ _ _ h']
    simp

private theorem expSeries_complex (m : ℕ) (hm : 0<m) (c : ℝ) (t : ℂ) :
    HasSum (fun n => (expCoeffs m c n : ℂ)*t^n) (Complex.exp ((c:ℂ)*t^m)) := by
  rw [Complex.exp_eq_exp_ℂ]
  convert monomial_series m hm (c:ℂ) t using 1
  funext n
  by_cases h : m ∣ n <;> simp [expCoeffs,h]

private theorem expSeries_norm (m : ℕ) (hm : 0<m) (c : ℝ) (hc : 0≤c) (t : ℂ) :
    Summable (fun n => ‖(expCoeffs m c n : ℂ)*t^n‖) := by
  convert (monomial_series m hm c ‖t‖).summable using 1
  funext n
  rw [norm_mul, norm_pow, Complex.norm_real, Real.norm_eq_abs, abs_of_nonneg (expCoeffs_nonneg hc _)]
  rfl

/-- Coefficients of the whole tested product at a real base point. -/
noncomputable def testCoefficient (x : ℝ) (n : ℕ) : ℝ :=
  Real.exp (-4*x^4) *
    ∑ k ∈ Finset.range (n+1), expCoeffs 2 (12*x^2) k * expCoeffs 4 2 (n-k)

theorem testCoefficient_nonneg (x : ℝ) (n : ℕ) : 0 ≤ testCoefficient x n := by
  unfold testCoefficient
  refine mul_nonneg (Real.exp_pos _).le (Finset.sum_nonneg fun k _ => ?_)
  exact mul_nonneg (expCoeffs_nonneg (by positivity) _) (expCoeffs_nonneg (by norm_num) _)

theorem all_test_coefficients (x : ℝ) (t : ℂ) :
    HasSum (fun n => (testCoefficient x n : ℂ)*t^n) (test (x:ℂ) t) := by
  let f : ℕ → ℂ := fun n => (expCoeffs 2 (12*x^2) n:ℂ)*t^n
  let g : ℕ → ℂ := fun n => (expCoeffs 4 2 n:ℂ)*t^n
  have hf := expSeries_complex 2 (by decide) (12*x^2) t
  have hg := expSeries_complex 4 (by decide) 2 t
  have hn : Summable (fun n => ‖f n‖) := expSeries_norm 2 (by decide) _ (by positivity) _
  have hm : Summable (fun n => ‖g n‖) := expSeries_norm 4 (by decide) _ (by norm_num) _
  have hh := (hasSum_sum_range_mul_of_summable_norm hn hm).mul_left
    ((Real.exp (-4*x^4)):ℂ)
  show HasSum _ _
  rw [show (∑' n, f n) = _ from hf.tsum_eq, show (∑' n, g n) = _ from hg.tsum_eq] at hh
  rw [test_formula]
  push_cast at hh
  convert hh using 1
  · funext n
    unfold testCoefficient
    push_cast
    rw [mul_assoc, Finset.sum_mul]
    congr 1
    apply Finset.sum_congr rfl
    intro k hk
    dsimp only [f,g]
    have hkn : k≤n := by have := Finset.mem_range.mp hk; omega
    have he : t^n=t^k*t^(n-k) := by rw [←pow_add, Nat.add_sub_of_le hkn]
    rw [he]
    ring
  · ring_nf

/-- The series coefficients are exactly the normalized iterated derivatives
in the source's equation (14). -/
theorem coefficient_eq_derivative (x : ℝ) (n : ℕ) :
    (testCoefficient x n : ℂ) =
      iteratedDeriv n (test (x:ℂ)) 0 / (n.factorial:ℂ) := by
  let p := FormalMultilinearSeries.ofScalars ℂ (fun k => (testCoefficient x k : ℂ))
  have hr : Summable (testCoefficient x) := by
    have hs := (Complex.hasSum_re (all_test_coefficients x 1)).summable
    simpa only [one_pow,mul_one,Complex.ofReal_re] using hs
  have hfp : HasFPowerSeriesOnBall (test (x:ℂ)) p 0 1 := by
    refine ⟨?_, by simp, ?_⟩
    · apply p.le_radius_of_summable (r:=1)
      simpa only [p, FormalMultilinearSeries.ofScalars_norm, Complex.norm_real,
        Real.norm_eq_abs, abs_of_nonneg (testCoefficient_nonneg x _),
        NNReal.coe_one, one_pow,mul_one] using hr
    · intro y _
      simpa only [p, FormalMultilinearSeries.ofScalars_apply_eq, smul_eq_mul,zero_add]
        using all_test_coefficients x y
  have ha := hfp.hasFPowerSeriesAt
  have he := ha.eq_formalMultilinearSeries ha.analyticAt.hasFPowerSeriesAt
  simpa only [p,FormalMultilinearSeries.coeff_ofScalars] using
    congrArg (fun q : FormalMultilinearSeries ℂ ℂ ℂ => q.coeff n) he

/-- Real-rooted polynomials may be represented by a real leading coefficient
and a real list of roots, with the zero polynomial also allowed. -/
noncomputable def realRootedValue (a : ℝ) (r : List ℝ) (z : ℂ) : ℂ :=
  (a:ℂ) * (r.map fun v : ℝ => z-Complex.ofReal v).prod

private theorem listPair (r : List ℝ) (t : ℝ) :
    (r.map (fun v : ℝ => Complex.I*(t:ℂ)-Complex.ofReal v)).prod *
      (r.map (fun v : ℝ => -Complex.I*(t:ℂ)-Complex.ofReal v)).prod =
      ((r.map (fun v => v^2+t^2)).prod : ℝ) := by
  induction r with
  | nil => simp
  | cons v r ih =>
    simp only [List.map_cons,List.prod_cons,Complex.ofReal_mul]
    have hp : (Complex.I*(t:ℂ)-(v:ℂ))*(-Complex.I*(t:ℂ)-(v:ℂ)) =
        ((v^2+t^2 : ℝ):ℂ) := by
      push_cast
      linear_combination -((t:ℂ)^2)*Complex.I_sq
    calc
      _ = ((Complex.I*(t:ℂ)-(v:ℂ))*(-Complex.I*(t:ℂ)-(v:ℂ))) *
          ((r.map (fun v : ℝ => Complex.I*(t:ℂ)-Complex.ofReal v)).prod *
           (r.map (fun v : ℝ => -Complex.I*(t:ℂ)-Complex.ofReal v)).prod) := by ring
      _ = _ := by rw [hp,ih]

private theorem realRooted_pair (a : ℝ) (r : List ℝ) (t : ℝ) :
    realRootedValue a r (Complex.I*(t:ℂ)) * realRootedValue a r (-Complex.I*(t:ℂ)) =
      ((a^2 * (r.map fun v => v^2+t^2).prod : ℝ):ℂ) := by
  unfold realRootedValue
  calc
    _ = (a:ℂ)^2 * ((r.map (fun v : ℝ => Complex.I*(t:ℂ)-Complex.ofReal v)).prod *
        (r.map (fun v : ℝ => -Complex.I*(t:ℂ)-Complex.ofReal v)).prod) := by ring
    _ = _ := by rw [listPair, Complex.ofReal_mul, Complex.ofReal_pow]

private theorem list_prod_zero_le_one (r : List ℝ) :
    0 ≤ (r.map fun v => v^2).prod ∧
    (r.map fun v => v^2).prod ≤ (r.map fun v => v^2+1).prod := by
  induction r with
  | nil => simp
  | cons a r ih =>
    simp only [List.map_cons,List.prod_cons]
    refine ⟨mul_nonneg (sq_nonneg _) ih.1, ?_⟩
    exact mul_le_mul (le_add_of_nonneg_right zero_le_one) ih.2 ih.1 (by positivity)

/-- A necessary consequence of compact uniform convergence of real-rooted
polynomials (indeed pointwise convergence is already enough here). -/
def LPPointwise (f : ℂ → ℂ) : Prop :=
  ∃ a : ℕ → ℝ, ∃ r : ℕ → List ℝ,
    ∀ z : ℂ, Tendsto (fun n => realRootedValue (a n) (r n) z) atTop (𝓝 (f z))

theorem not_LPPointwise : ¬ LPPointwise phi := by
  rintro ⟨a,r,h⟩
  let U : ℕ → ℝ := fun n => (realRootedValue (a n) (r n) 0 *
    realRootedValue (a n) (r n) 0).re
  let V : ℕ → ℝ := fun n => (realRootedValue (a n) (r n) Complex.I *
    realRootedValue (a n) (r n) (-Complex.I)).re
  have hUV : ∀ n, U n ≤ V n := by
    intro n
    have hu := congrArg Complex.re (realRooted_pair (a n) (r n) 0)
    have hv := congrArg Complex.re (realRooted_pair (a n) (r n) 1)
    dsimp only [U,V]
    simp only [Complex.ofReal_zero, Complex.ofReal_one, mul_zero, mul_one,
      Complex.ofReal_re, zero_pow (by decide : (2:ℕ)≠0), one_pow, add_zero] at hu hv
    rw [hu,hv]
    exact mul_le_mul_of_nonneg_left (list_prod_zero_le_one (r n)).2 (sq_nonneg _)
  have hU : Tendsto U atTop (𝓝 1) := by
    have hp := (Complex.continuous_re.tendsto _).comp ((h 0).mul (h 0))
    change Tendsto U atTop (𝓝 ((phi 0 * phi 0).re)) at hp
    simpa [phi] using hp
  have hV : Tendsto V atTop (𝓝 (Real.exp (-2))) := by
    have hp := (Complex.continuous_re.tendsto _).comp ((h Complex.I).mul (h (-Complex.I)))
    have hI4 : Complex.I^4=1 := by
      rw [show (4:ℕ)=2*2 by decide,pow_mul,Complex.I_sq]
      norm_num
    change Tendsto V atTop (𝓝 ((phi Complex.I * phi (-Complex.I)).re)) at hp
    have hneg : (-Complex.I)^4=1 := by
      rw [show (4:ℕ)=2*2 by decide,pow_mul,neg_sq,Complex.I_sq]
      norm_num
    have hval : (phi Complex.I * phi (-Complex.I)).re = Real.exp (-2) := by
      unfold phi
      rw [hI4,hneg,←Complex.exp_add]
      norm_num
      exact_mod_cast Complex.ofReal_re (Real.exp (-2))
    rwa [hval] at hp
  have hc := le_of_tendsto_of_tendsto' hU hV hUV
  have hlt : Real.exp (-2) < 1 := by
    calc
      _ < Real.exp 0 := Real.exp_lt_exp.mpr (by norm_num)
      _ = _ := Real.exp_zero
  exact (not_le_of_gt hlt) hc

/-- The compact-uniform formulation of Laguerre–Pólya membership by
real polynomials whose roots are all real. -/
def LaguerrePolya (f : ℂ → ℂ) : Prop :=
  ∃ p : ℕ → Polynomial ℝ,
    (∀ n, (p n).Splits) ∧
      ∀ K : Set ℂ, IsCompact K →
        TendstoUniformlyOn (fun n z => ((p n).map (algebraMap ℝ ℂ)).eval z) f atTop K

private theorem split_polynomial_value (p : Polynomial ℝ) (h : p.Splits) (z : ℂ) :
    (p.map (algebraMap ℝ ℂ)).eval z = realRootedValue p.leadingCoeff p.roots.toList z := by
  have he := (h.map (algebraMap ℝ ℂ)).eval_eq_prod_roots z
  rw [h.roots_map, Polynomial.leadingCoeff_map_of_injective (algebraMap ℝ ℂ).injective,
    Multiset.map_map] at he
  rw [realRootedValue, Multiset.prod_map_toList]
  exact he

theorem not_LaguerrePolya : ¬ LaguerrePolya phi := by
  rintro ⟨p,hp,hconv⟩
  apply not_LPPointwise
  refine ⟨fun n => (p n).leadingCoeff, fun n => (p n).roots.toList, ?_⟩
  intro z
  have h := (hconv {z} isCompact_singleton).tendsto_at (Set.mem_singleton z)
  simpa only [split_polynomial_value _ (hp _)] using h

/-- Exact quartic witness to the false implication. The Taylor inequality
holds for every nonnegative order and every real argument. -/
theorem csordasVishnyakova_conj3_6_false :
    quartic.Monic ∧ (∀ n, 0 ≤ quartic.coeff n) ∧
    (∀ z : ℂ, (quartic.map (algebraMap ℝ ℂ)).eval (-z) =
      (quartic.map (algebraMap ℝ ℂ)).eval z) ∧
    ((quartic.map (algebraMap ℝ ℂ)).eval alpha = 0 ∧ alpha.im ≠ 0) ∧
    Differentiable ℂ phi ∧ (∀ z, phi z ≠ 0) ∧
    (∀ x : ℝ, phi (x:ℂ) = (Real.exp (-(x^4)):ℂ)) ∧
    (∀ z : ℂ, (z+alpha)*(z-alpha)*(z+(alpha-1))*(z-(alpha-1)) =
      (quartic.map (algebraMap ℝ ℂ)).eval z) ∧
    (∀ x n, 0 ≤ testCoefficient x n) ∧
    (∀ x t, HasSum (fun n => (testCoefficient x n : ℂ)*t^n) (test (x:ℂ) t)) ∧
    (∀ x n, (testCoefficient x n : ℂ) = iteratedDeriv n (test (x:ℂ)) 0 / (n.factorial:ℂ)) ∧
    ¬ LaguerrePolya phi := by
  exact ⟨quartic_monic,quartic_coeff_nonneg,quartic_even_eval,⟨quartic_alpha_root,alpha_nonreal⟩,
    phi_entire,phi_nonzero,phi_real,fun z => (factor_quartic z).trans (quartic_eval z).symm,testCoefficient_nonneg,
    all_test_coefficients,coefficient_eq_derivative,not_LaguerrePolya⟩

#print axioms csordasVishnyakova_conj3_6_false

end CsordasVishnyakova
