import Mathlib.Analysis.Calculus.LocalExtr.Polynomial
import Mathlib.Analysis.Complex.Polynomial.Basic
import Mathlib.Algebra.Polynomial.Splits
import Mathlib.Algebra.Polynomial.Reverse
import Mathlib.Tactic.NormNum

/-! Real-rooted polynomials remain real-rooted under differentiation. -/

namespace FussCatalan
open Polynomial

theorem splits_derivative (p : ℝ[X]) (hp : p.Splits) : p.derivative.Splits := by
  rw [splits_iff_card_roots] at hp ⊢
  have h1 := p.card_roots_le_derivative
  have h2 := p.derivative.card_roots'
  rw [natDegree_derivative] at h2 ⊢
  omega

theorem splits_iterate_derivative (p : ℝ[X]) (hp : p.Splits) (n : ℕ) :
    (derivative^[n] p).Splits := by
  induction n with
  | zero => simpa using hp
  | succ n ih =>
    rw [Function.iterate_succ_apply']
    exact splits_derivative _ ih

/-- Reversing coefficients preserves real-rootedness. -/
theorem splits_reverse (p : ℝ[X]) (hp : p.Splits) : p.reverse.Splits := by
  induction hp using Submonoid.closure_induction with
  | mem p hp =>
    rcases hp with hp | hp
    · obtain ⟨a, rfl⟩ := hp
      simp
    · obtain ⟨a, rfl⟩ := hp
      apply Splits.of_natDegree_le_one
      exact (reverse_natDegree_le _).trans (by simp)
  | one =>
    have he : reverse (1 : ℝ[X]) = 1 := by simpa only [map_one] using (reverse_C (1 : ℝ))
    rw [he]
    exact Splits.one
  | mul a b ha hb iha ihb =>
    rw [reverse_mul_of_domain]
    exact iha.mul ihb

/-- A coefficient reversal and translation implement a fractional-linear root transform. -/
noncomputable def rootTransform (p : ℝ[X]) : ℝ[X] := (p.reverse.comp (X+1)).reverse

theorem rootTransform_splits (p : ℝ[X]) (hp : p.Splits) : (rootTransform p).Splits := by
  apply splits_reverse
  apply Splits.comp_X_add_C
  exact splits_reverse p hp

/-- The derivatives used in the Rolle proof have only real roots. -/
theorem base_iterated_derivative_splits (d e : ℕ) :
    (derivative^[d] ((X : ℝ[X])^(d+1) * (1-X)^e)).Splits := by
  apply splits_iterate_derivative
  apply Splits.mul (Splits.X_pow _)
  apply Splits.pow _ e
  have h : (1-X : ℝ[X]) = -(X + C (-1)) := by simp; ring
  rw [h]
  exact (Splits.X_add_C (-1)).neg

/-- The fractional-linear transform of the derivative in the proof is real-rooted. -/
theorem transformed_base_splits (d e : ℕ) :
    (rootTransform (derivative^[d] ((X : ℝ[X])^(d+1) * (1-X)^e))).Splits :=
  rootTransform_splits _ (base_iterated_derivative_splits d e)

/-- The binomial polynomial appearing after removing the zero at the origin. -/
noncomputable def binomialPolynomial (d e : ℕ) : ℝ[X] :=
  ∑ j ∈ Finset.range (d+1), C (((d.choose j : ℝ) * (e.choose j : ℝ)) / (j+1)) * X^j

theorem binomialPolynomial_pos (d e : ℕ) {x : ℝ} (hx : 0 ≤ x) :
    0 < (binomialPolynomial d e).eval x := by
  have hs : 1 ≤ (binomialPolynomial d e).eval x := by
    simp only [binomialPolynomial, eval_finsetSum, eval_mul, eval_C, eval_pow, eval_X]
    calc
      (1 : ℝ) = ((d.choose 0 : ℝ) * (e.choose 0 : ℝ)) / (0+1) * x^0 := by simp
      _ ≤ ∑ j ∈ Finset.range (d+1), ((d.choose j : ℝ) * (e.choose j : ℝ)) / (j+1) * x^j := by
        have hh := Finset.single_le_sum (s := Finset.range (d+1))
          (f := fun j : ℕ => ((d.choose j : ℝ) * (e.choose j : ℝ)) / (j+1) * x^j)
          (a := 0) (by intro j hj; positivity) (by simp)
        simpa using hh
  linarith

theorem binomialPolynomial_zero (e : ℕ) : binomialPolynomial 0 e = 1 := by
  simp [binomialPolynomial]

theorem binomialPolynomial_coeff (d e j : ℕ) :
    (binomialPolynomial d e).coeff j =
      if j ≤ d then ((d.choose j : ℝ) * (e.choose j : ℝ)) / (j+1) else 0 := by
  classical
  simp [binomialPolynomial]

theorem binomialPolynomial_natDegree (d e : ℕ) (hde : d ≤ e) :
    (binomialPolynomial d e).natDegree = d := by
  apply natDegree_eq_of_le_of_coeff_ne_zero
  · apply natDegree_le_iff_coeff_eq_zero.mpr
    intro j hj
    simp [binomialPolynomial_coeff, Nat.not_le_of_gt hj]
  · rw [binomialPolynomial_coeff]
    simp only [le_refl, ↓reduceIte, Nat.choose_self, Nat.cast_one, one_mul]
    have hpos : 0 < e.choose d := Nat.choose_pos hde
    positivity

/-- Coefficients of the iterated derivative reduce to the binomial factor. -/
theorem base_derivative_coeff (d e j : ℕ) :
    (derivative^[d] ((X : ℝ[X])^(d+1) * (1-X)^e)).coeff (j+1) =
      ((j+1+d).descFactorial d : ℕ) • ((1-X : ℝ[X])^e).coeff j := by
  rw [coeff_iterate_derivative]
  have heq : j+1+d = j+(d+1) := by omega
  rw [heq, coeff_X_pow_mul]

theorem coeff_one_sub_X_pow (e j : ℕ) (hj : j ≤ e) :
    ((1-X : ℝ[X])^e).coeff j = (-1 : ℝ)^j * (e.choose j : ℝ) := by
  have heq : (1-X : ℝ[X]) = -(X + C (-1)) := by simp; ring
  rw [heq, neg_pow]
  have hc : (-1 : ℝ[X])^e = C ((-1 : ℝ)^e) := by simp
  rw [hc, coeff_C_mul, coeff_X_add_C_pow]
  have hparity : (-1 : ℝ)^e * (-1)^(e-j) = (-1)^j := by
    rw [← pow_add]
    have hn : e + (e-j) = j + 2*(e-j) := by omega
    rw [hn, pow_add, pow_mul]
    norm_num
  rw [← mul_assoc, hparity]

theorem binomialPolynomial_real_root_negative (d e : ℕ) (x : ℝ)
    (hx : (binomialPolynomial d e).IsRoot x) : x < 0 := by
  by_contra h
  have hpos := binomialPolynomial_pos d e (le_of_not_gt h)
  exact (ne_of_gt hpos) hx

theorem base_derivative_coeff_explicit (d e j : ℕ) (hj : j ≤ e) :
    (derivative^[d] ((X : ℝ[X])^(d+1) * (1-X)^e)).coeff (j+1) =
      ((j+1+d).descFactorial d : ℝ) * (-1)^j * (e.choose j : ℝ) := by
  rw [base_derivative_coeff, coeff_one_sub_X_pow e j hj]
  simp only [nsmul_eq_mul]
  ring

theorem iterate_derivative_one_sub_X_pow (e k : ℕ) (hk : k ≤ e) :
    derivative^[k] ((1-X : ℝ[X])^e) =
      C ((-1 : ℝ)^k * e.descFactorial k) * (1-X)^(e-k) := by
  have heq : (1-X : ℝ[X]) = -(X - C 1) := by simp
  rw [heq, neg_pow]
  have hc : (-1 : ℝ[X])^e = C ((-1 : ℝ)^e) := by simp
  rw [hc, iterate_derivative_C_mul, iterate_derivative_X_sub_pow]
  simp only [nsmul_eq_mul]
  rw [neg_pow (X - C 1 : ℝ[X]) (e-k)]
  have hc2 : (-1 : ℝ[X])^(e-k) = C ((-1 : ℝ)^(e-k)) := by simp
  rw [hc2]
  have hparity : (-1 : ℝ)^k * (-1)^(e-k) = (-1)^e := by
    rw [← pow_add, Nat.add_sub_of_le hk]
  rw [← hparity]
  simp only [map_mul, map_natCast]
  ring

/-- Leibniz expansion of the derivative used in the real-root argument. -/
theorem base_derivative_expansion (d e : ℕ) (hde : d ≤ e) :
    derivative^[d] ((X : ℝ[X])^(d+1) * (1-X)^e) =
      ∑ j ∈ Finset.range (d+1),
        C ((d.choose j : ℝ) * ((d+1).descFactorial (d-j) : ℝ) *
          (-1)^j * (e.descFactorial j : ℝ)) * X^(j+1) * (1-X)^(e-j) := by
  rw [iterate_derivative_mul]
  apply Finset.sum_congr rfl
  intro j hj
  have hjd : j ≤ d := by simpa using hj
  have hje : j ≤ e := hjd.trans hde
  rw [iterate_derivative_X_pow_eq_natCast_mul, iterate_derivative_one_sub_X_pow e j hje]
  have hexp : d+1-(d-j) = j+1 := by omega
  rw [hexp]
  simp only [nsmul_eq_mul, map_mul, map_natCast]
  ring

theorem derivative_scalar_identity (d e j : ℕ) (hj : j ≤ d) :
    ((d+1).descFactorial (d-j) : ℝ) * (e.descFactorial j : ℝ) =
      ((d+1).factorial : ℝ) * (e.choose j : ℝ) / (j+1) := by
  have hn : (j+1).factorial * (d+1).descFactorial (d-j) = (d+1).factorial := by
    have h := Nat.factorial_mul_descFactorial (n := d+1) (k := d-j) (by omega)
    have heq : d+1-(d-j) = j+1 := by omega
    simpa only [heq] using h
  have hr : ((j+1 : ℕ) : ℝ) * (j.factorial : ℝ) *
      ((d+1).descFactorial (d-j) : ℝ) = ((d+1).factorial : ℝ) := by
    exact_mod_cast (by simpa [Nat.factorial_succ] using hn)
  push_cast at hr
  rw [Nat.descFactorial_eq_factorial_mul_choose e j]
  push_cast
  have hj0 : (j : ℝ)+1 ≠ 0 := by positivity
  field_simp
  linear_combination (e.choose j : ℝ) * hr

noncomputable def derivativeCore (d e : ℕ) : ℝ[X] :=
  ∑ j ∈ Finset.range (d+1),
    C (((d.choose j : ℝ) * (e.choose j : ℝ)) / (j+1)) * (-X)^j * (1-X)^(d-j)

theorem base_derivative_factorization (d e : ℕ) (hde : d ≤ e) :
    derivative^[d] ((X : ℝ[X])^(d+1) * (1-X)^e) =
      C ((d+1).factorial : ℝ) * X * (1-X)^(e-d) * derivativeCore d e := by
  rw [base_derivative_expansion d e hde]
  unfold derivativeCore
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro j hj
  have hjd : j ≤ d := by simpa using hj
  have hp : e-j = (e-d)+(d-j) := by omega
  rw [hp, pow_add (1-X : ℝ[X]) (e-d) (d-j), pow_succ (X : ℝ[X]) j, neg_pow (X : ℝ[X]) j]
  have hc : ((d.choose j : ℝ) * ((d+1).descFactorial (d-j) : ℝ) *
      (-1)^j * (e.descFactorial j : ℝ)) =
      ((d+1).factorial : ℝ) * (((d.choose j : ℝ)*(e.choose j : ℝ))/(j+1)) * (-1)^j := by
    calc
      _ = (d.choose j : ℝ) * (((d+1).descFactorial (d-j) : ℝ) *
          (e.descFactorial j : ℝ)) * (-1)^j := by ring
      _ = _ := by rw [derivative_scalar_identity d e j hjd]; ring
  rw [hc]
  simp only [map_mul, map_natCast, map_pow, map_neg, map_one]
  ring

theorem derivativeCore_splits (d e : ℕ) (hde : d ≤ e) : (derivativeCore d e).Splits := by
  have hs := base_iterated_derivative_splits d e
  rw [base_derivative_factorization d e hde] at hs
  have hone : (1-X : ℝ[X]) ≠ 0 := by
    intro h
    have hh := congrArg (fun p : ℝ[X] => p.coeff 0) h
    simp at hh
  have hpre : C ((d+1).factorial : ℝ) * X * (1-X)^(e-d) ≠ 0 := by
    apply mul_ne_zero (mul_ne_zero ?_ X_ne_zero) (pow_ne_zero _ hone)
    exact C_ne_zero.mpr (by exact_mod_cast Nat.factorial_ne_zero (d+1))
  exact ((splits_mul'.mp hs).2).resolve_right hpre

theorem natDegree_iterate_derivative_exact (p : ℝ[X]) (k : ℕ) :
    (derivative^[k] p).natDegree = p.natDegree - k := by
  induction k with
  | zero => simp
  | succ k ih =>
    rw [Function.iterate_succ_apply', natDegree_derivative, ih]
    omega

theorem one_sub_X_ne_zero : (1-X : ℝ[X]) ≠ 0 := by
  intro h
  have hh := congrArg (fun p : ℝ[X] => p.coeff 0) h
  simp at hh

theorem one_sub_X_natDegree : (1-X : ℝ[X]).natDegree = 1 := by
  have heq : (1-X : ℝ[X]) = -(X - C 1) := by simp
  rw [heq, natDegree_neg, natDegree_X_sub_C]

theorem base_derivative_natDegree (d e : ℕ) :
    (derivative^[d] ((X : ℝ[X])^(d+1) * (1-X)^e)).natDegree = e+1 := by
  rw [natDegree_iterate_derivative_exact]
  rw [natDegree_mul (pow_ne_zero _ X_ne_zero) (pow_ne_zero _ one_sub_X_ne_zero),
    natDegree_pow, natDegree_pow, natDegree_X, one_sub_X_natDegree]
  simp
  omega

theorem derivativeCore_natDegree (d e : ℕ) (hde : d ≤ e) :
    (derivativeCore d e).natDegree = d := by
  have hbase := base_derivative_natDegree d e
  have hcore : derivativeCore d e ≠ 0 := by
    intro hc
    have hf := base_derivative_factorization d e hde
    rw [hc, mul_zero] at hf
    rw [hf, natDegree_zero] at hbase
    omega
  have hc : C ((d+1).factorial : ℝ) ≠ 0 :=
    C_ne_zero.mpr (by exact_mod_cast Nat.factorial_ne_zero (d+1))
  have hp : C ((d+1).factorial : ℝ) * X * (1-X)^(e-d) ≠ 0 :=
    mul_ne_zero (mul_ne_zero hc X_ne_zero) (pow_ne_zero _ one_sub_X_ne_zero)
  rw [base_derivative_factorization d e hde, natDegree_mul hp hcore,
    natDegree_mul (mul_ne_zero hc X_ne_zero) (pow_ne_zero _ one_sub_X_ne_zero),
    natDegree_mul hc X_ne_zero, natDegree_C, natDegree_X, natDegree_pow,
    one_sub_X_natDegree] at hbase
  simp only [zero_add] at hbase
  omega

theorem derivativeCore_eval_zero (d e : ℕ) : (derivativeCore d e).eval 0 = 1 := by
  simp only [derivativeCore, eval_finsetSum, eval_mul, eval_C, eval_pow, eval_neg,
    eval_X, eval_sub, eval_one, sub_zero, one_pow, mul_one, neg_zero]
  rw [Finset.sum_eq_single 0]
  · simp
  · intro b hb hne
    simp [zero_pow hne]
  · simp

theorem derivativeCore_reverse_natDegree (d e : ℕ) (hde : d ≤ e) :
    (derivativeCore d e).reverse.natDegree = d := by
  rw [reverse_natDegree, derivativeCore_natDegree d e hde]
  have htr : (derivativeCore d e).natTrailingDegree = 0 := by
    apply natTrailingDegree_eq_zero.mpr
    right
    rw [coeff_zero_eq_eval_zero, derivativeCore_eval_zero]
    norm_num
  rw [htr, Nat.sub_zero]

theorem derivativeCore_eval_one (d e : ℕ) :
    (derivativeCore d e).eval 1 = ((e.choose d : ℝ) / (d+1)) * (-1)^d := by
  simp only [derivativeCore, eval_finsetSum, eval_mul, eval_C, eval_pow, eval_neg,
    eval_X, eval_sub, eval_one, sub_self]
  rw [Finset.sum_eq_single d]
  · simp
  · intro j hj hjne
    have hjd : j ≤ d := by simpa using hj
    have hdj : d-j ≠ 0 := by omega
    simp [zero_pow hdj]
  · simp

theorem fractional_power_identity (y : ℂ) (hy : y ≠ 1) (d j : ℕ) (hj : j ≤ d) :
    (-y)^j * (1-y)^(d-j) = (1-y)^d * (y/(y-1))^j := by
  have heq : (1-y) * (y/(y-1)) = -y := by
    field_simp
    ring
  calc
    _ = ((1-y) * (y/(y-1)))^j * (1-y)^(d-j) := by rw [heq]
    _ = (1-y)^(j+(d-j)) * (y/(y-1))^j := by rw [pow_add, mul_pow]; ring
    _ = _ := by rw [Nat.add_sub_of_le hj]

theorem core_eval_substitution (d e : ℕ) (y : ℂ) (hy : y ≠ 1) :
    ((derivativeCore d e).map (algebraMap ℝ ℂ)).eval y =
      (1-y)^d * ((binomialPolynomial d e).map (algebraMap ℝ ℂ)).eval (y/(y-1)) := by
  simp only [derivativeCore, binomialPolynomial, Polynomial.map_sum, eval_finsetSum]
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro j hj
  have hjd : j ≤ d := by simpa using hj
  simp only [Polynomial.map_mul, Polynomial.map_pow, Polynomial.map_neg, Polynomial.map_sub,
    Polynomial.map_one, Polynomial.map_X, Polynomial.map_C, eval_C, eval_mul, eval_pow, eval_neg, eval_sub, eval_one, eval_X]
  rw [mul_assoc, fractional_power_identity y hy d j hjd]
  ring

/-- Every zero of the binomial factor is real. -/
theorem binomialPolynomial_splits (d e : ℕ) (hde : d ≤ e) :
    (binomialPolynomial d e).Splits := by
  let ι : ℝ →+* ℂ := algebraMap ℝ ℂ
  apply Splits.of_splits_map ι (IsAlgClosed.splits _)
  intro z hz
  have hzroot : ((binomialPolynomial d e).map ι).IsRoot z := (mem_roots'.mp hz).2
  have hzero : ((binomialPolynomial d e).map ι).eval z = 0 := hzroot
  have hz1 : z ≠ 1 := by
    intro hz1
    subst z
    have hp := binomialPolynomial_pos d e (x := 1) (by norm_num)
    have heval : ((binomialPolynomial d e).map ι).eval 1 = ι ((binomialPolynomial d e).eval 1) := by
      simp
    rw [heval] at hzero
    apply (ne_of_gt hp)
    apply ι.injective
    simpa using hzero
  let y : ℂ := z/(z-1)
  have hy1 : y ≠ 1 := by
    dsimp [y]
    intro heq
    have : z = z-1 := (div_eq_one_iff_eq (sub_ne_zero.mpr hz1)).mp heq
    have hbad : (1 : ℂ) = 0 := by linear_combination this
    exact one_ne_zero hbad
  have hyz : y/(y-1) = z := by
    dsimp [y]
    field_simp
    ring
  have hyroot : ((derivativeCore d e).map ι).eval y = 0 := by
    rw [core_eval_substitution d e y hy1, hyz, hzero, mul_zero]
  have hq : derivativeCore d e ≠ 0 := by
    intro h
    have hqzero := derivativeCore_eval_zero d e
    simp [h] at hqzero
  have hymem : y ∈ ((derivativeCore d e).map ι).roots :=
    (mem_roots (map_ne_zero hq)).mpr hyroot
  rw [(derivativeCore_splits d e hde).roots_map ι, Multiset.mem_map] at hymem
  obtain ⟨r, hr, hry⟩ := hymem
  have hr1 : r ≠ 1 := by
    intro hr1
    subst r
    apply hy1
    simpa using hry.symm
  refine ⟨r/(r-1), ?_⟩
  simp [map_div₀, map_sub, map_one, hry, hyz]

/-- The binomial sum from the stated coefficient formula, indexed from zero. -/
noncomputable def enumeratorFactor (a b : ℕ) : ℝ[X] :=
  ∑ j ∈ Finset.range (min a b + 1),
    C (((a+1).choose (j+1) : ℝ) * (b.choose j : ℝ)) * X^(j+1)

theorem choose_coefficient_identity (a b j : ℕ) :
    ((a+1).choose (j+1) : ℝ) * (b.choose j : ℝ) =
      ((a+1 : ℕ) : ℝ) * (((a.choose j : ℝ) * (b.choose j : ℝ)) / (j+1)) := by
  have hh : ((a+1 : ℕ) : ℝ) * (a.choose j : ℝ) =
      ((a+1).choose (j+1) : ℝ) * ((j+1 : ℕ) : ℝ) := by
    exact_mod_cast Nat.add_one_mul_choose_eq a j
  push_cast at hh ⊢
  have hj : (j : ℝ)+1 ≠ 0 := by positivity
  field_simp
  linear_combination -(b.choose j : ℝ) * hh

theorem enumeratorFactor_identity (a b : ℕ) :
    enumeratorFactor a b = C ((a+1 : ℕ) : ℝ) * X * binomialPolynomial (min a b) (max a b) := by
  unfold enumeratorFactor binomialPolynomial
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro j hj
  rw [choose_coefficient_identity]
  have hchoose : (min a b).choose j * (max a b).choose j = a.choose j * b.choose j := by
    rcases le_total a b with hab | hba
    · simp [min_eq_left hab, max_eq_right hab]
    · simp [min_eq_right hba, max_eq_left hba, mul_comm]
  have hchoose' : ((min a b).choose j : ℝ) * ((max a b).choose j : ℝ) =
      (a.choose j : ℝ) * (b.choose j : ℝ) := by exact_mod_cast hchoose
  rw [hchoose', map_mul, pow_succ]
  ring

theorem enumeratorFactor_splits (a b : ℕ) : (enumeratorFactor a b).Splits := by
  rw [enumeratorFactor_identity]
  exact (Splits.C _ |>.mul Splits.X).mul (binomialPolynomial_splits _ _ (min_le_max))

/-- The closed-form Fuss--Catalan polynomial, before its path enumeration is established. -/
noncomputable def closedForm (m n k : ℕ) : ℝ[X] :=
  if n = k then C (((m*n+1).choose n : ℝ) / (m*n+1))
  else C (((m*n+1).choose k : ℝ) / (m*n+1)) * enumeratorFactor (k-1) (n-k-1)

theorem closedForm_splits (m n k : ℕ) : (closedForm m n k).Splits := by
  unfold closedForm
  split
  · exact Splits.C _
  · exact (Splits.C _).mul (enumeratorFactor_splits _ _)

end FussCatalan
