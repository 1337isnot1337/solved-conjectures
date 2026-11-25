import Conjectures.KauersKoutschanCertificate
import Mathlib.Tactic

/-! Horner evaluation of the checked exact rational polynomial certificate. -/

open scoped BigOperators

namespace KauersKoutschanCertificate

/-- Evaluate ascending rational coefficients at an arbitrary value. -/
def eval (x : ℚ) : Poly → ℚ
  | [] => 0
  | c :: cs => c + x * eval x cs

theorem eval_add (x : ℚ) (p q : Poly) :
    eval x (add p q) = eval x p + eval x q := by
  induction p generalizing q with
  | nil => simp [add, eval]
  | cons a p ih =>
    cases q with
    | nil => simp [add, eval]
    | cons b q =>
      simp only [add, eval, ih]
      ring

theorem eval_scale (x c : ℚ) (p : Poly) :
    eval x (scale c p) = c * eval x p := by
  induction p with
  | nil => simp [scale, eval]
  | cons a p ih =>
    simp only [scale, List.map_cons, eval]
    rw [show (List.map (c * ·) p) = scale c p by rfl, ih]
    ring

theorem eval_mul (x : ℚ) (p q : Poly) :
    eval x (mul p q) = eval x p * eval x q := by
  induction p with
  | nil => simp [mul, eval]
  | cons a p ih =>
    simp only [mul, eval_add, eval_scale, eval, ih]
    ring

private theorem eval_constant (x c : ℚ) : eval x (constant c) = c := by
  simp [constant, eval]

theorem eval_nPoly (x : ℚ) (t : ℕ) :
    eval x (nPoly t) = t + 2 * x := by
  simp [nPoly, eval]
  ring

private theorem eval_eq_zero (x : ℚ) (p : Poly) (hp : zeroPoly p = true) :
    eval x p = 0 := by
  induction p with
  | nil => rfl
  | cons c cs ih =>
    have h : c = 0 ∧ zeroPoly cs = true := by
      simpa only [zeroPoly, List.all_cons, Bool.and_eq_true, beq_iff_eq] using hp
    simp [eval, h.1, ih h.2]

private theorem eval_operatorAt (x : ℚ) (n cs : Poly) :
    eval x (operatorAt n cs) = eval (eval x n) cs := by
  induction cs with
  | nil => rfl
  | cons c cs ih =>
    unfold operatorAt at *
    rw [List.foldr_cons, eval_add, eval_mul, eval_constant, ih]
    rfl

/-- The order-eight operator evaluated on a list of scalar values. -/
def scalarOriginalResidual (n : ℚ) (values : List ℚ) : ℚ :=
    (operatorCoeffs.zip values).foldl (fun p (cs, v) => p + eval n cs * v) 0

private theorem eval_originalFold (x : ℚ) (n : Poly) (pairs : List (Poly × Poly))
    (p : Poly) :
    eval x (pairs.foldl (fun q (cs, v) => add q (mul (operatorAt n cs) v)) p) =
      (pairs.map (fun (cs, v) => (cs, eval x v))).foldl
        (fun q (cs, v) => q + eval (eval x n) cs * v) (eval x p) := by
  induction pairs generalizing p with
  | nil => rfl
  | cons pair pairs ih =>
    obtain ⟨cs, v⟩ := pair
    simp only [List.foldl_cons, List.map_cons, ih, eval_add, eval_mul, eval_operatorAt]

private theorem zip_eval (x : ℚ) (cs values : List Poly) :
    (cs.zip values).map (fun (c, v) => (c, eval x v)) = cs.zip (values.map (eval x)) := by
  induction cs generalizing values with
  | nil => rfl
  | cons c cs ih =>
    cases values with
    | nil => rfl
    | cons v values =>
      change (c, eval x v) :: ((cs.zip values).map (fun (c, v) => (c, eval x v))) =
        (c, eval x v) :: cs.zip (values.map (eval x))
      rw [ih]

theorem eval_originalResidual (x : ℚ) (n : Poly) (values : List Poly) :
    eval x (originalResidual n values) =
      scalarOriginalResidual (eval x n) (values.map (eval x)) := by
  rw [originalResidual, eval_originalFold, zip_eval, scalarOriginalResidual]
  rfl

/-- Each checked basis sequence satisfies the original operator at every
rational evaluation of the base index, for either certified parity. -/
theorem original_basis_eval (x : ℚ) (t i : ℕ) (ht : t = 4 ∨ t = 5) (hi : i < 6) :
    scalarOriginalResidual (t + 2 * x)
      (((List.range 9).map (fun j => count (state i) (t + j))).map (eval x)) = 0 := by
  let samples := (List.range 9).map (fun j => count (state i) (t + j))
  have hchecks : (List.range 6).all (originalCheck t) = true := by
    rcases ht with rfl | rfl
    · exact original_even
    · exact original_odd
  have hz : zeroPoly (originalResidual (nPoly t) samples) = true :=
    List.all_eq_true.mp hchecks i (List.mem_range.mpr hi)
  rw [← eval_nPoly, ← eval_originalResidual]
  exact eval_eq_zero x _ hz

/-- The order-eight recurrence as a sum over its nine source rows. -/
def orderEight (n : ℚ) (a : ℕ → ℚ) : ℚ :=
  ∑ j ∈ Finset.range 9, eval n operatorCoeffs[j]! * a j

private theorem scalarOriginalResidual_eq (n : ℚ) (a : ℕ → ℚ) :
    scalarOriginalResidual n ((List.range 9).map a) = orderEight n a := by
  simp only [orderEight, Finset.sum_range_succ, Finset.sum_range_zero]
  rfl

private theorem scalarOriginalResidual_map_eval (n x : ℚ) (a : ℕ → Poly) :
    scalarOriginalResidual n (((List.range 9).map a).map (eval x)) =
      orderEight n (fun j => eval x (a j)) := by
  rw [List.map_map, scalarOriginalResidual_eq]
  rfl

theorem orderEight_basis (x : ℚ) (t i : ℕ) (ht : t = 4 ∨ t = 5) (hi : i < 6) :
    orderEight (t + 2 * x) (fun j => eval x (count (state i) (t + j))) = 0 :=
  (scalarOriginalResidual_map_eval (t + 2 * x) x (fun j => count (state i) (t + j))).symm.trans
    (original_basis_eval x t i ht hi)

/-- Arbitrary scalar combinations of the six evaluated basis sequences
satisfy the same exact recurrence. -/
theorem orderEight_linear_combination (x : ℚ) (t : ℕ) (ht : t = 4 ∨ t = 5)
    (w : Fin 6 → ℚ) :
    orderEight (t + 2 * x)
      (fun j => ∑ i : Fin 6, w i * eval x (count (state i) (t + j))) = 0 := by
  unfold orderEight
  simp_rw [Finset.mul_sum]
  rw [Finset.sum_comm]
  apply Finset.sum_eq_zero
  intro i _
  simp_rw [mul_left_comm (eval _ _) (w i), ← Finset.mul_sum]
  rw [← orderEight, orderEight_basis x t i ht i.isLt, mul_zero]

end KauersKoutschanCertificate
