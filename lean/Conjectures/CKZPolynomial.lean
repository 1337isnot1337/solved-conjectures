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

theorem toPolynomial_trim (xs : List ℤ) : toPolynomial (trim xs) = toPolynomial xs := by
  induction xs with
  | nil => rfl
  | cons x xs ih =>
    simp only [trim]
    split
    · rename_i h
      obtain ⟨rfl, hxs⟩ := h
      rw [hxs] at ih
      simpa [toPolynomial] using ih.symm
    · simp only [toPolynomial, ih]

theorem toPolynomial_shift (n : ℕ) (xs : List ℤ) :
    toPolynomial (List.replicate n 0 ++ xs) = X^n * toPolynomial xs := by
  induction n with
  | zero => simp
  | succ n ih => simp only [List.replicate_succ, List.cons_append, toPolynomial, map_zero,
      zero_add, ih, pow_succ']; ring

theorem certificateIdentity_sound (f : List ℤ) (h : certificateIdentity f = true) :
    let N := numerator f
    let state := N.foldl (fun st p => let v := p+2*st.1+st.2.1; (v,st.1,v::st.2.2)) (0,0,[])
    let V := toPolynomial state.2.2.reverse
    (1-2*X-X^2)*V + X^N.length*(C (2*state.1+state.2.1) + X*C state.1) =
      (1+X)^2*(toPolynomial f).derivative := by
  dsimp only
  have heq := of_decide_eq_true h
  have hp := congrArg toPolynomial heq
  simp only [toPolynomial_trim, toPolynomial_add, toPolynomial_mul, toPolynomial_shift,
    toPolynomial_numerator] at hp
  convert hp using 1; simp [toPolynomial]; ring_nf; simp

def StateInv (st : ℤ × ℤ × List ℤ) : Prop :=
  (st.1 = 0 ∨ st.1 ∈ st.2.2) ∧ (st.2.1 = 0 ∨ st.2.1 ∈ st.2.2)

theorem fold_state_inv (xs : List ℤ) (st : ℤ × ℤ × List ℤ) (h : StateInv st) :
    StateInv (xs.foldl (fun st p => let v := p+2*st.1+st.2.1; (v,st.1,v::st.2.2)) st) := by
  induction xs generalizing st with
  | nil => exact h
  | cons p xs ih =>
    apply ih
    constructor
    · right; simp
    · rcases h.1 with hzero | hmem
      · left; exact hzero
      · right; simp [hmem]

theorem cert_state_nonneg (f : List ℤ) (h : certOK f = true) :
    let st := (numerator f).foldl (fun st p => let v := p+2*st.1+st.2.1; (v,st.1,v::st.2.2)) (0,0,[])
    0 ≤ st.1 ∧ 0 ≤ st.2.1 ∧ ∀ v ∈ st.2.2.reverse, 0 ≤ v := by
  have hall : ∀ v ∈ certPrefix (numerator f), 0 ≤ v := by
    have hb := (Bool.and_eq_true_iff.mp h).2
    exact fun v hv => of_decide_eq_true ((List.all_eq_true.mp hb) v hv)
  have hinv := fold_state_inv (numerator f) (0,0,[]) (by simp [StateInv])
  dsimp only [StateInv] at hinv
  dsimp only
  constructor
  · rcases hinv.1 with hz | hm
    · rw [hz]
    · exact hall _ hm
  constructor
  · rcases hinv.2 with hz | hm
    · rw [hz]
    · exact hall _ hm
  · intro v hv
    exact hall v (List.mem_reverse.mp hv)

theorem nonneg_coeff_of_list (xs : List ℤ) (h : ∀ v ∈ xs, 0 ≤ v) (j : ℕ) :
    0 ≤ (toPolynomial xs).coeff j := by
  rw [coeff_toPolynomial]
  induction xs generalizing j with
  | nil => simp
  | cons x xs ih =>
    cases j with
    | zero => exact h x (by simp)
    | succ j =>
      apply ih
      intro v hv
      exact h v (by simp [hv])

end CKZCertificates
