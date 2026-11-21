import Conjectures.FussFinal
import Mathlib.Algebra.Polynomial.FieldDivision
import Mathlib.Analysis.Calculus.Deriv.Polynomial
import Mathlib.Analysis.Calculus.Deriv.Inv

/-! Root-count refinements for the Fuss--Catalan polynomial. -/
namespace FussRoots
open Polynomial Filter
open scoped Topology

theorem binomial_nonzero (d e : ℕ) : FussCatalan.binomialPolynomial d e ≠ 0 := by
  intro h
  have hp := FussCatalan.binomialPolynomial_pos d e (x := 0) (by norm_num)
  simp [h] at hp

theorem binomial_roots_card (d e : ℕ) (hde : d ≤ e) :
    (FussCatalan.binomialPolynomial d e).roots.card = d := by
  exact (splits_iff_card_roots.mp (FussCatalan.binomialPolynomial_splits d e hde)).trans
    (FussCatalan.binomialPolynomial_natDegree d e hde)

theorem binomial_roots_negative (d e : ℕ) (x : ℝ)
    (hx : x ∈ (FussCatalan.binomialPolynomial d e).roots) : x < 0 := by
  exact FussCatalan.binomialPolynomial_real_root_negative d e x
    ((mem_roots (binomial_nonzero d e)).mp hx)

/-- The logarithmic-derivative summands have strictly negative derivatives away from roots. -/
theorem reciprocalSum_hasDeriv (s : Multiset ℝ) (x : ℝ) (hx : ∀ r ∈ s, x ≠ r) :
    HasDerivAt (fun t => (s.map (fun r => 1 / (t-r))).sum)
      (-(s.map (fun r => 1 / (x-r)^2)).sum) x := by
  induction s using Multiset.induction_on with
  | empty => simpa using (hasDerivAt_const x (0 : ℝ))
  | @cons a s ih =>
    have ha : x ≠ a := hx a (by simp)
    have hs : ∀ r ∈ s, x ≠ r := by intro r hr; exact hx r (by simp [hr])
    have hterm := ((hasDerivAt_id x).sub_const a).inv (sub_ne_zero.mpr ha)
    have hsum := ih hs
    convert hterm.fun_add hsum using 1 <;> simp [div_eq_mul_inv, sub_eq_add_neg, add_comm]

theorem reciprocalSquare_sum_pos (s : Multiset ℝ) (x : ℝ) (hne : s ≠ 0)
    (hx : ∀ r ∈ s, x ≠ r) : 0 < (s.map (fun r => 1/(x-r)^2)).sum := by
  induction s using Multiset.induction_on with
  | empty => contradiction
  | @cons a s ih =>
    have ha : x ≠ a := hx a (by simp)
    have hfirst : 0 < 1/(x-a)^2 := by positivity
    have hrest : 0 ≤ (s.map (fun r => 1/(x-r)^2)).sum := by
      apply Multiset.sum_nonneg
      intro y hy
      obtain ⟨r,hr,rfl⟩ := Multiset.mem_map.mp hy
      positivity
    simp only [Multiset.map_cons, Multiset.sum_cons]
    linarith

/-- Away from roots of a split real polynomial, all critical points are simple. -/
theorem derivative_simple_away (p : ℝ[X]) (hp : p.Splits) (hp' : p.derivative ≠ 0)
    (x : ℝ) (hx : p.eval x ≠ 0) (hcrit : p.derivative.eval x = 0) :
    p.derivative.derivative.eval x ≠ 0 := by
  have hdeg : p.natDegree ≠ 0 := by
    intro h
    exact hp' (Polynomial.derivative_eq_zero.mpr h)
  have hroots : p.roots ≠ 0 := hp.roots_ne_zero hdeg
  have haway : ∀ r ∈ p.roots, x ≠ r := by
    intro r hr he
    subst r
    apply hx
    exact (mem_roots'.mp hr).2
  have hrecip := reciprocalSum_hasDeriv p.roots x haway
  have hpos := reciprocalSquare_sum_pos p.roots x hroots haway
  have hquot := (p.derivative.hasDerivAt x).div (p.hasDerivAt x) hx
  have hevent : (fun t => (p.roots.map (fun r => 1/(t-r))).sum) =ᶠ[𝓝 x]
      (fun t => p.derivative.eval t / p.eval t) := by
    filter_upwards [(p.hasDerivAt x).continuousAt.eventually_ne hx] with t ht
    exact (hp.eval_derivative_div_eval_of_ne_zero ht).symm
  have heq := (hquot.congr_of_eventuallyEq hevent).unique hrecip
  intro hsecond
  simp [hcrit, hsecond] at heq
  simp only [one_div] at hpos
  linarith

/-- Iterated derivatives of the two-endpoint polynomial have simple interior roots. -/
theorem base_iterate_simple_away (d e r : ℕ) :
    let p : ℝ[X] := derivative^[r] (X^(d+1) * (1-X)^e)
    p ≠ 0 → ∀ x : ℝ, x ≠ 0 → x ≠ 1 → p.IsRoot x → ¬p.derivative.IsRoot x := by
  induction r with
  | zero =>
    dsimp only [Function.iterate_zero_apply]
    intro hp x hx0 hx1 hroot
    exfalso
    have he : (X^(d+1) * (1-X)^e : ℝ[X]).eval x ≠ 0 := by
      simp only [eval_mul, eval_pow, eval_X, eval_sub, eval_one]
      exact mul_ne_zero (pow_ne_zero _ hx0) (pow_ne_zero _ (sub_ne_zero.mpr (Ne.symm hx1)))
    exact he hroot
  | succ r ih =>
    dsimp only at ih ⊢
    simp only [Function.iterate_succ_apply']
    let p : ℝ[X] := derivative^[r] (X^(d+1) * (1-X)^e)
    change p.derivative ≠ 0 → ∀ x : ℝ, x ≠ 0 → x ≠ 1 →
      p.derivative.IsRoot x → ¬p.derivative.derivative.IsRoot x
    intro hpd x hx0 hx1 hroot
    have hp : p ≠ 0 := by intro h; simp [h] at hpd
    by_cases hpx : p.IsRoot x
    · exact False.elim ((ih hp x hx0 hx1 hpx) hroot)
    · exact derivative_simple_away p (FussCatalan.splits_iterate_derivative _ (by
        apply Splits.mul (Splits.X_pow _)
        apply Splits.pow _ e
        have heq : (1-X : ℝ[X]) = -(X + C (-1)) := by simp; ring
        rw [heq]
        exact (Splits.X_add_C (-1)).neg) r) hpd x hpx hroot

theorem core_simple_away (d e : ℕ) (hde : d ≤ e) (x : ℝ) (hx0 : x ≠ 0) (hx1 : x ≠ 1)
    (hx : (FussCatalan.derivativeCore d e).IsRoot x) :
    ¬(FussCatalan.derivativeCore d e).derivative.IsRoot x := by
  intro hdx
  change (FussCatalan.derivativeCore d e).eval x = 0 at hx
  change (FussCatalan.derivativeCore d e).derivative.eval x = 0 at hdx
  let p : ℝ[X] := derivative^[d] (X^(d+1) * (1-X)^e)
  have hp : p ≠ 0 := by
    intro h
    have hd := FussCatalan.base_derivative_natDegree d e
    change p.natDegree = e+1 at hd
    rw [h, natDegree_zero] at hd
    omega
  have hf := FussCatalan.base_derivative_factorization d e hde
  change p = _ at hf
  have hroot : p.IsRoot x := by
    rw [hf]
    simp only [IsRoot, eval_mul, hx, mul_zero]
  have hdroot : p.derivative.IsRoot x := by
    rw [hf]
    simp only [derivative_mul, IsRoot, eval_add, eval_mul, hx, hdx, mul_zero, zero_add]
  exact (base_iterate_simple_away d e d hp x hx0 hx1 hroot) hdroot

theorem fractional_power_identity_real (y : ℝ) (hy : y ≠ 1) (d j : ℕ) (hj : j ≤ d) :
    (-y)^j * (1-y)^(d-j) = (1-y)^d * (y/(y-1))^j := by
  have heq : (1-y) * (y/(y-1)) = -y := by field_simp; ring
  calc
    _ = ((1-y) * (y/(y-1)))^j * (1-y)^(d-j) := by rw [heq]
    _ = (1-y)^(j+(d-j)) * (y/(y-1))^j := by rw [pow_add, mul_pow]; ring
    _ = _ := by rw [Nat.add_sub_of_le hj]

theorem core_eval_substitution_real (d e : ℕ) (y : ℝ) (hy : y ≠ 1) :
    (FussCatalan.derivativeCore d e).eval y =
      (1-y)^d * (FussCatalan.binomialPolynomial d e).eval (y/(y-1)) := by
  simp only [FussCatalan.derivativeCore, FussCatalan.binomialPolynomial, eval_finsetSum,
    eval_mul, eval_C, eval_pow, eval_neg, eval_sub, eval_one, eval_X]
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro j hj
  have hjd : j ≤ d := by simpa using hj
  rw [mul_assoc, fractional_power_identity_real y hy d j hjd]
  ring

/-- Every real zero of the binomial polynomial is simple. -/
theorem binomial_real_root_simple (d e : ℕ) (hde : d ≤ e) (x : ℝ)
    (hx : (FussCatalan.binomialPolynomial d e).IsRoot x) :
    ¬(FussCatalan.binomialPolynomial d e).derivative.IsRoot x := by
  intro hdx
  have hxneg : x < 0 := FussCatalan.binomialPolynomial_real_root_negative d e x hx
  change (FussCatalan.binomialPolynomial d e).eval x = 0 at hx
  change (FussCatalan.binomialPolynomial d e).derivative.eval x = 0 at hdx
  -- The fractional-linear map sends a negative zero into the open unit interval.
  have hx1 : x ≠ 1 := by linarith
  have hx0 : x ≠ 0 := ne_of_lt hxneg
  let y : ℝ := x/(x-1)
  have hy1 : y ≠ 1 := by
    dsimp [y]
    intro heq
    have : x = x-1 := (div_eq_one_iff_eq (sub_ne_zero.mpr hx1)).mp heq
    linarith
  have hy0 : y ≠ 0 := by dsimp [y]; exact div_ne_zero hx0 (sub_ne_zero.mpr hx1)
  have hyx : y/(y-1) = x := by dsimp [y]; field_simp; ring
  have hQ : (FussCatalan.derivativeCore d e).IsRoot y := by
    change (FussCatalan.derivativeCore d e).eval y = 0
    rw [core_eval_substitution_real d e y hy1, hyx, hx, mul_zero]
  have hphi := (hasDerivAt_id y).div ((hasDerivAt_id y).sub_const 1) (sub_ne_zero.mpr hy1)
  have hH := ((FussCatalan.binomialPolynomial d e).hasDerivAt (y/(y-1))).comp y hphi
  have hpow := ((hasDerivAt_const y (1 : ℝ)).sub (hasDerivAt_id y)).pow d
  have hprod := hpow.fun_mul hH
  have hprod0 : HasDerivAt (fun t : ℝ => (1-t)^d *
      (FussCatalan.binomialPolynomial d e).eval (t/(t-1))) 0 y := by
    convert hprod using 1
    · funext t
      rfl
    · change 0 = ((d : ℝ) * (1-y)^(d-1) * (0-1)) *
        (FussCatalan.binomialPolynomial d e).eval (y/(y-1)) +
      (1-y)^d * ((FussCatalan.binomialPolynomial d e).derivative.eval (y/(y-1)) *
        ((1*(y-1)-y*1)/(y-1)^2))
      simp [hyx, hx, hdx]
  have hevent : (fun t : ℝ => (1-t)^d *
      (FussCatalan.binomialPolynomial d e).eval (t/(t-1))) =ᶠ[𝓝 y]
      (fun t => (FussCatalan.derivativeCore d e).eval t) := by
    filter_upwards [(continuousAt_id.eventually_ne hy1)] with t ht
    exact (core_eval_substitution_real d e t ht).symm
  have hQ' : (FussCatalan.derivativeCore d e).derivative.IsRoot y := by
    have huniq := ((FussCatalan.derivativeCore d e).hasDerivAt y |>.congr_of_eventuallyEq hevent).unique hprod0
    exact huniq
  exact (core_simple_away d e hde y hy0 hy1 hQ) hQ'

theorem binomial_roots_nodup (d e : ℕ) (hde : d ≤ e) :
    (FussCatalan.binomialPolynomial d e).roots.Nodup := by
  classical
  rw [Multiset.nodup_iff_count_le_one]
  intro x
  rw [count_roots]
  by_contra h
  have hmul : 1 < (FussCatalan.binomialPolynomial d e).rootMultiplicity x := by omega
  have ⟨hx,hdx⟩ := (one_lt_rootMultiplicity_iff_isRoot (binomial_nonzero d e)).mp hmul
  exact (binomial_real_root_simple d e hde x hx) hdx

theorem binomial_distinct_negative_roots (d e : ℕ) (hde : d ≤ e) :
    (FussCatalan.binomialPolynomial d e).roots.toFinset.card = d ∧
      ∀ x ∈ (FussCatalan.binomialPolynomial d e).roots.toFinset, x < 0 := by
  classical
  constructor
  · rw [Multiset.toFinset_card_of_nodup (binomial_roots_nodup d e hde)]
    exact binomial_roots_card d e hde
  · intro x hx
    exact binomial_roots_negative d e x (Multiset.mem_toFinset.mp hx)

theorem actual_roots_nonboundary (m n k : ℕ) (hm : 0 < m) (hn : 0 < n)
    (hk : 0 < k) (hkn : k < n) :
    (FussFinal.actualEnumerator m n k hm hn).roots =
      0 ::ₘ (FussCatalan.binomialPolynomial (min (k-1) (n-k-1)) (max (k-1) (n-k-1))).roots := by
  have hL : k ≤ m*n+1 := by nlinarith
  have hc : (0 : ℝ) < ((m*n+1).choose k : ℝ) := by exact_mod_cast Nat.choose_pos hL
  have hs : ((m*n+1).choose k : ℝ) / (m*n+1) ≠ 0 := div_ne_zero (ne_of_gt hc) (by positivity)
  have hk' : ((k-1+1 : ℕ) : ℝ) ≠ 0 := by exact_mod_cast (by omega : k-1+1 ≠ 0)
  rw [FussFinal.actualEnumerator_eq_closedForm m n k hm hn hk (by omega)]
  simp only [FussCatalan.closedForm, show n ≠ k by omega, ↓reduceIte]
  rw [FussCatalan.enumeratorFactor_identity]
  rw [roots_C_mul _ hs, mul_assoc, roots_C_mul _ hk']
  rw [roots_mul (mul_ne_zero X_ne_zero (binomial_nonzero _ _)), roots_X]
  rfl

/-- The nonconstant path polynomial has a simple zero at 0 and exactly the stated
number of simple negative zeros. -/
theorem actual_roots_simple_and_count (m n k : ℕ) (hm : 0 < m) (hn : 0 < n)
    (hk : 0 < k) (hkn : k < n) :
    (FussFinal.actualEnumerator m n k hm hn).roots.Nodup ∧
    ((FussFinal.actualEnumerator m n k hm hn).roots.filter (fun x => x < 0)).card =
      min (k-1) (n-k-1) ∧
    (FussFinal.actualEnumerator m n k hm hn).roots.count 0 = 1 := by
  classical
  let d := min (k-1) (n-k-1)
  let e := max (k-1) (n-k-1)
  have hde : d ≤ e := min_le_max
  have hnzero : (0 : ℝ) ∉ (FussCatalan.binomialPolynomial d e).roots := by
    intro h
    have hh := binomial_roots_negative d e 0 h
    linarith
  have hfilter : (FussCatalan.binomialPolynomial d e).roots.filter (fun x => x < 0) =
      (FussCatalan.binomialPolynomial d e).roots := by
    apply Multiset.filter_eq_self.mpr
    intro x hx
    exact binomial_roots_negative d e x hx
  rw [actual_roots_nonboundary m n k hm hn hk hkn]
  change (0 ::ₘ (FussCatalan.binomialPolynomial d e).roots).Nodup ∧
    ((0 ::ₘ (FussCatalan.binomialPolynomial d e).roots).filter (fun x => x < 0)).card = d ∧
    (0 ::ₘ (FussCatalan.binomialPolynomial d e).roots).count 0 = 1
  simp [hnzero, binomial_roots_nodup d e hde, hfilter, binomial_roots_card d e hde]

/-- The scalar reduction transfers every statement depending only on the root multiset. -/
theorem actual_roots_independent_of_fuss (m n k : ℕ) (hm : 0 < m) (hn : 0 < n)
    (hk : 0 < k) (hkn : k ≤ n) :
    (FussFinal.actualEnumerator m n k hm hn).roots =
      (FussFinal.actualEnumerator 1 n k (by omega) hn).roots := by
  have hL : k ≤ m*n+1 := by nlinarith
  have hp : (0 : ℝ) < ((m*n+1).choose k : ℝ) := by exact_mod_cast Nat.choose_pos hL
  have hq : (0 : ℝ) < ((n+1).choose k : ℝ) := by exact_mod_cast Nat.choose_pos (by omega : k ≤ n+1)
  have hs : ((n+1 : ℝ) * ((m*n+1).choose k : ℝ)) /
      ((m*n+1 : ℝ) * ((n+1).choose k : ℝ)) ≠ 0 := by positivity
  rw [FussFinal.actualEnumerator_scalar_reduction m n k hm hn hk hkn, roots_C_mul _ hs]

theorem transfer_root_relation (m n k n' k' : ℕ) (hm : 0 < m) (hn : 0 < n) (hn' : 0 < n')
    (hk : 0 < k) (hkn : k ≤ n) (hk' : 0 < k') (hk'n : k' ≤ n')
    (R : Multiset ℝ → Multiset ℝ → Prop)
    (h : R (FussFinal.actualEnumerator 1 n k (by omega) hn).roots
      (FussFinal.actualEnumerator 1 n' k' (by omega) hn').roots) :
    R (FussFinal.actualEnumerator m n k hm hn).roots
      (FussFinal.actualEnumerator m n' k' hm hn').roots := by
  rwa [actual_roots_independent_of_fuss m n k hm hn hk hkn,
    actual_roots_independent_of_fuss m n' k' hm hn' hk' hk'n]

end FussRoots
