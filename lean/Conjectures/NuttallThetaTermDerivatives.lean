module

public import Conjectures.NuttallThetaKernel
public import Mathlib.Analysis.Calculus.Deriv.Polynomial
public import Mathlib.Analysis.Calculus.IteratedDeriv.Defs

public section
namespace NuttallCumulants

open Polynomial

noncomputable def thetaModeScale (n : ℕ) (t : ℝ) : ℝ :=
  Real.pi * ((n : ℝ)+1)^2 * Real.exp (4*t)

noncomputable def modeCore (P : ℝ[X]) (n : ℕ) (t : ℝ) : ℝ :=
  Real.exp t * Real.exp (-thetaModeScale n t) * P.eval (thetaModeScale n t)

noncomputable def modeDerivativePolynomial (P : ℝ[X]) : ℝ[X] :=
  P + C 4 * X * P.derivative - C 4 * X * P

noncomputable def modePolynomials : ℕ → ℝ[X]
  | 0 => C 2 * X^2 - C 3 * X
  | j+1 => modeDerivativePolynomial (modePolynomials j)

theorem thetaTerm_eq_modeCore (n : ℕ) (t : ℝ) :
    thetaTerm t n = modeCore (modePolynomials 0) n t := by
  have h5 : Real.exp (5*t) = Real.exp t * Real.exp (4*t) := by
    rw [← Real.exp_add, show t+4*t=5*t by ring]
  have h9 : Real.exp (9*t) = Real.exp t * Real.exp (4*t)^2 := by
    rw [pow_two, ← Real.exp_add, ← Real.exp_add, show t+(4*t+4*t)=9*t by ring]
  unfold thetaTerm modeCore thetaModeScale modePolynomials
  simp only [eval_sub, eval_mul, eval_C, eval_pow, eval_X]
  rw [h5, h9]
  have he : -Real.pi * ((n:ℝ)+1)^2 * Real.exp (4*t) =
      -(Real.pi * ((n:ℝ)+1)^2 * Real.exp (4*t)) := by ring
  rw [he]
  ring

theorem hasDerivAt_thetaModeScale (n : ℕ) (t : ℝ) :
    HasDerivAt (thetaModeScale n) (4 * thetaModeScale n t) t := by
  have ht : HasDerivAt (fun t : ℝ => 4*t) 4 t := by
    simpa only [id_eq, mul_one] using (hasDerivAt_id t).const_mul (4:ℝ)
  convert ht.exp.const_mul (Real.pi * ((n:ℝ)+1)^2) using 1 <;> first | rfl | (simp only [thetaModeScale]; ring)

theorem hasDerivAt_modeCore (P : ℝ[X]) (n : ℕ) (t : ℝ) :
    HasDerivAt (modeCore P n) (modeCore (modeDerivativePolynomial P) n t) t := by
  have hz := hasDerivAt_thetaModeScale n t
  have hp := (P.hasDerivAt (thetaModeScale n t)).comp t hz
  have he := (Real.hasDerivAt_exp t).mul hz.neg.exp
  convert he.mul hp using 1 <;> first | rfl | (simp only [modeCore, modeDerivativePolynomial, eval_sub, eval_add, eval_mul, eval_C, eval_X, Function.comp_apply, Pi.neg_apply, Pi.mul_apply]; ring)

/-- Exact derivative hierarchy of one summand. The series is not differentiated
by this theorem. -/
theorem iteratedDeriv_thetaTerm (j n : ℕ) :
    iteratedDeriv j (fun t => thetaTerm t n) = modeCore (modePolynomials j) n := by
  induction j with
  | zero =>
    funext t
    simpa only [iteratedDeriv_zero] using thetaTerm_eq_modeCore n t
  | succ j ih =>
    rw [iteratedDeriv_succ, ih]
    funext t
    exact (hasDerivAt_modeCore (modePolynomials j) n t).deriv

private theorem modeDerivative_top {P : ℝ[X]} (hP : P ≠ 0) (hp : 0 < P.natDegree) :
    (modeDerivativePolynomial P).natDegree = P.natDegree + 1 ∧
      (modeDerivativePolynomial P).leadingCoeff = -4 * P.leadingCoeff := by
  let A := P + C (4:ℝ) * X * P.derivative
  let B := C (4:ℝ) * X * P
  have hX : (C (4:ℝ)*X).natDegree = 1 := natDegree_C_mul_X 4 (by norm_num)
  have hX0 : C (4:ℝ) * X ≠ 0 :=
    mul_ne_zero (C_ne_zero.mpr (by norm_num)) X_ne_zero
  have hB : B.natDegree = P.natDegree + 1 := by
    dsimp only [B]
    rw [natDegree_mul hX0 hP, hX, add_comm]
  have hA : A.natDegree ≤ max P.natDegree (1 + (P.natDegree - 1)) := by
    unfold A
    calc
      _ ≤ max P.natDegree (C (4:ℝ) * X * P.derivative).natDegree := natDegree_add_le ..
      _ ≤ _ := by
        apply max_le_max_left
        calc
          _ ≤ (C (4:ℝ)*X).natDegree + P.derivative.natDegree := natDegree_mul_le
          _ ≤ _ := by rw [hX]; exact Nat.add_le_add_left (natDegree_derivative_le P) 1
  have hlt : A.natDegree < B.natDegree := by
    rw [hB]
    omega
  change (A-B).natDegree = _ ∧ (A-B).leadingCoeff = _
  refine ⟨(natDegree_sub_eq_right_of_natDegree_lt hlt).trans hB, ?_⟩
  rw [leadingCoeff_sub_of_degree_lt' (degree_lt_degree hlt)]
  unfold B
  rw [leadingCoeff_mul, leadingCoeff_C_mul_X]
  ring

/-- The degree and leading coefficient at every differentiation order. -/
theorem modePolynomials_top (j : ℕ) :
    (modePolynomials j).natDegree = j+2 ∧
      (modePolynomials j).leadingCoeff = 2 * (-4:ℝ)^j := by
  induction j with
  | zero =>
    have h2 : (C (2:ℝ) * X^2).natDegree = 2 := natDegree_C_mul_X_pow 2 2 (by norm_num)
    have h3 : (C (3:ℝ) * X).natDegree = 1 := natDegree_C_mul_X 3 (by norm_num)
    have hlt : (C (3:ℝ)*X).natDegree < (C (2:ℝ)*X^2).natDegree := by rw [h2,h3]; omega
    unfold modePolynomials
    rw [natDegree_sub_eq_left_of_natDegree_lt hlt, h2,
      leadingCoeff_sub_of_degree_lt (degree_lt_degree hlt), leadingCoeff_C_mul_X_pow]
    norm_num
  | succ j ih =>
    have hne : modePolynomials j ≠ 0 := by
      intro h
      rw [h, natDegree_zero] at ih
      omega
    obtain ⟨hd, hc⟩ := modeDerivative_top hne (by rw [ih.1]; omega)
    unfold modePolynomials
    rw [hd, hc, ih.1, ih.2, pow_succ]
    constructor <;> ring

end NuttallCumulants
