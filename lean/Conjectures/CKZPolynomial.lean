import Conjectures.CKZCertificates
import Mathlib.Algebra.Polynomial.Derivative
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Tactic.Ring

/-! Relating executable integer lists to the mathematical kernel polynomials. -/
namespace CKZCertificates
open Polynomial

noncomputable def toPolynomial : List ℤ → ℤ[X]
  | [] => 0
  | x::xs => C x + X * toPolynomial xs

theorem toPolynomial_add (xs ys : List ℤ) : toPolynomial (add xs ys) = toPolynomial xs + toPolynomial ys := by
  induction xs generalizing ys with
  | nil => simp [add, toPolynomial]
  | cons x xs ih =>
    cases ys with
    | nil => simp [add, toPolynomial]
    | cons y ys => simp only [add, toPolynomial, ih, map_add]; ring

theorem toPolynomial_scale (c : ℤ) (xs : List ℤ) :
    toPolynomial (scale c xs) = C c * toPolynomial xs := by
  induction xs with
  | nil => simp [scale, toPolynomial]
  | cons x xs ih =>
    change C (c*x) + X*toPolynomial (scale c xs) = C c * (C x + X*toPolynomial xs)
    rw [ih, map_mul]
    ring

theorem toPolynomial_mul (xs ys : List ℤ) : toPolynomial (mul xs ys) = toPolynomial xs * toPolynomial ys := by
  induction xs with
  | nil => simp [mul, toPolynomial]
  | cons x xs ih =>
    simp only [mul, toPolynomial_add, toPolynomial_scale, toPolynomial, map_zero, zero_add, ih]
    ring

theorem toPolynomial_power (xs : List ℤ) (n : ℕ) : toPolynomial (power xs n) = toPolynomial xs ^ n := by
  induction n with
  | zero => simp [power, toPolynomial]
  | succ n ih => simp only [power, toPolynomial_mul, ih, pow_succ']

theorem toPolynomial_derivativeAux (k : ℕ) (xs : List ℤ) :
    toPolynomial (derivativeAux k xs) = C (k : ℤ)*toPolynomial xs + X*(toPolynomial xs).derivative := by
  induction xs generalizing k with
  | nil => simp [derivativeAux, toPolynomial]
  | cons x xs ih =>
    simp only [derivativeAux, toPolynomial, ih, derivative_C, derivative_mul,
      derivative_X, zero_add, one_mul, Nat.cast_add, Nat.cast_one, map_add, map_mul, C_1]
    ring

theorem toPolynomial_derivative (xs : List ℤ) :
    toPolynomial (derivative xs) = (toPolynomial xs).derivative := by
  cases xs with
  | nil => simp [derivative, toPolynomial]
  | cons x xs =>
    simp [derivative, toPolynomial_derivativeAux, toPolynomial, derivative_add,
      derivative_mul, derivative_X]

theorem coeff_toPolynomial (xs : List ℤ) (j : ℕ) : (toPolynomial xs).coeff j = xs.getD j 0 := by
  induction xs generalizing j with
  | nil => simp [toPolynomial]
  | cons x xs ih =>
    cases j with
    | zero => simp [toPolynomial]
    | succ j =>
      change (C x + X*toPolynomial xs).coeff (j+1) = _
      rw [coeff_add, coeff_C, coeff_X_mul, ih]
      simp

theorem toPolynomial_fold {α : Type} (xs : List α) (f : α → List ℤ) (init : List ℤ) :
    toPolynomial (xs.foldl (fun acc j => add acc (f j)) init) =
      toPolynomial init + (xs.map (fun j => toPolynomial (f j))).sum := by
  induction xs generalizing init with
  | nil => simp
  | cons x xs ih => simp only [List.foldl_cons, ih, toPolynomial_add, List.map_cons, List.sum_cons]; ring

theorem sum_map_range (n : ℕ) (f : ℕ → ℤ[X]) :
    ((List.range n).map f).sum = ∑ j ∈ Finset.range n, f j := by
  induction n with
  | zero => simp
  | succ n ih => simp [List.range_succ, Finset.sum_range_succ, ih]

theorem toPolynomial_T (r : ℕ) :
    toPolynomial (T r) =
      ∑ j ∈ Finset.range (r/2+1),
        C (((2*j).choose j / (j+1) * r.choose (2*j) : ℕ) : ℤ) *
          toPolynomial a^(r-2*j) * toPolynomial b^j := by
  unfold T
  rw [toPolynomial_fold]
  simp only [toPolynomial, zero_add, toPolynomial_scale, toPolynomial_mul, toPolynomial_power,
    sum_map_range, ← mul_assoc]

theorem toPolynomial_a : toPolynomial a = (X : ℤ[X])*(3+2*X) := by
  simp [a, toPolynomial]; ring

theorem toPolynomial_b : toPolynomial b = (X : ℤ[X])*(1+X)^3 := by
  simp [b, toPolynomial]; ring

theorem toPolynomial_E1 : toPolynomial E1 = (1+X)^2*(1-X-2*X^2+3*X^3) := by
  simp [E1, toPolynomial_mul, toPolynomial_power, toPolynomial]; ring_nf; simp

theorem toPolynomial_E2 : toPolynomial E2 = (1+X)^2*(1-2*X-2*X^2+4*X^3) := by
  simp [E2, toPolynomial_mul, toPolynomial_power, toPolynomial]; ring_nf; simp

theorem toPolynomial_G (r : ℕ) : toPolynomial (G r) =
    (1+X)^2*(toPolynomial (T r)+toPolynomial (T (r+1))) -
      X*(1-X)*(1+X)*(toPolynomial (T r)+2*toPolynomial (T (r+1))+toPolynomial (T (r+2))) := by
  simp [G, toPolynomial_add, toPolynomial_mul, toPolynomial_power, toPolynomial_scale, toPolynomial]
  ring

theorem toPolynomial_numerator (f : List ℤ) :
    toPolynomial (numerator f) = (1+X)^2*(toPolynomial f).derivative := by
  simp [numerator, toPolynomial_mul, toPolynomial_power, toPolynomial_derivative, toPolynomial]

end CKZCertificates
