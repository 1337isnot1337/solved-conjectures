import Conjectures.KauersKoutschanEvaluation

/-! Evaluate the archived order-thirteen factorization on scalar sequences. -/

open scoped BigOperators

namespace KauersKoutschanCertificate

private theorem eval_sub (x : ℚ) (p q : Poly) :
    eval x (sub p q) = eval x p - eval x q := by
  rw [sub, eval_add, eval_scale, neg_one_mul, sub_eq_add_neg]

private theorem eval_const (x c : ℚ) : eval x (constant c) = c := by
  simp [constant, eval]

private def zeilbergerB (n : ℚ) (a : ℕ → ℚ) (i : ℕ) : ℚ :=
  a (i + 3) + a (i + 2) +
    (1 / 2) * ((n + i + 4) * a (i + 1) + (n + i - 1) * a i)

private def zeilbergerC (n : ℚ) (b : ℕ → ℚ) (i : ℕ) : ℚ :=
  b (i + 4) + (1 / 2) * ((n + i + 4) * b (i + 2) - b (i + 1) + (1 - (n + i)) * b i)

/-- Mark van Hoeij's factorization of the order-thirteen operator in A189281. -/
def orderThirteen (n : ℚ) (a : ℕ → ℚ) : ℚ :=
  let c := zeilbergerC n (zeilbergerB n a)
  4 * c 6 - 4 * (n + 11) * c 5 - (8 * n + 75) * c 4 + (3 - n) * c 3 -
    2 * c 2 - (7 * n + 22) * c 1 - 4 * n * c 0

private def polyB (n : Poly) (a : List Poly) (i : ℕ) : Poly :=
  let k := add n (constant (i : Rat))
  add (add a[i+3]! a[i+2]!)
    (scale (1/2) (add (mul (add k [4]) a[i+1]!) (mul (sub k [1]) a[i]!)))

private def polyC (n : Poly) (b : List Poly) (i : ℕ) : Poly :=
  let k := add n (constant (i : Rat))
  add b[i+4]! (scale (1/2) (add (sub (mul (add k [4]) b[i+2]!) b[i+1]!) (mul (sub [1] k) b[i]!)))

private theorem polyB_eval (x : ℚ) (n : Poly) (a : List Poly) (i : ℕ) :
    eval x (polyB n a i) = zeilbergerB (eval x n) (fun j => eval x a[j]!) i := by
  simp [polyB, zeilbergerB, eval_sub, eval_add, eval_mul, eval_scale, eval_const, eval]

private theorem polyC_eval (x : ℚ) (n : Poly) (b : List Poly) (i : ℕ) :
    eval x (polyC n b i) = zeilbergerC (eval x n) (fun j => eval x b[j]!) i := by
  simp [polyC, zeilbergerC, eval_sub, eval_add, eval_mul, eval_scale, eval_const, eval]

private theorem get_map_range {α : Type} [Inhabited α] (f : ℕ → α) (i k : ℕ) (h : i < k) :
    ((List.range k).map f)[i]! = f i := by
  rw [getElem!_pos _ _ (by simpa using h), List.getElem_map, List.getElem_range]

/-- Horner evaluation commutes with the full factorized operator. -/
theorem eval_zeilbergerResidual (x : ℚ) (n : Poly) (a : List Poly) :
    eval x (zeilbergerResidual n a) =
      orderThirteen (eval x n) (fun j => eval x a[j]!) := by
  let b := (List.range 11).map (polyB n a)
  let c := (List.range 7).map (polyC n b)
  have hb (i : ℕ) (hi : i < 11) :
      eval x b[i]! = zeilbergerB (eval x n) (fun j => eval x a[j]!) i := by
    rw [show b[i]! = polyB n a i from get_map_range _ _ _ hi, polyB_eval]
  have hc (i : ℕ) (hi : i < 7) :
      eval x c[i]! = zeilbergerC (eval x n) (zeilbergerB (eval x n) (fun j => eval x a[j]!)) i := by
    rw [show c[i]! = polyC n b i from get_map_range _ _ _ hi, polyC_eval, zeilbergerC, zeilbergerC]
    simp only [hb (i + 4) (by omega), hb (i + 2) (by omega), hb (i + 1) (by omega), hb i (by omega)]
  change eval x
    (sub (sub (sub (add (sub (sub (scale 4 c[6]!) (scale 4 (mul (add n [11]) c[5]!)))
        (mul (add (scale 8 n) [75]) c[4]!)) (mul (sub [3] n) c[3]!))
        (scale 2 c[2]!)) (mul (add (scale 7 n) [22]) c[1]!)) (scale 4 (mul n c[0]!))) = _
  simp only [eval_add, eval_sub, eval_mul, eval_scale, hc 0 (by decide), hc 1 (by decide),
    hc 2 (by decide), hc 3 (by decide), hc 4 (by decide), hc 5 (by decide), hc 6 (by decide), orderThirteen]
  norm_num [eval]
  ring

private theorem zeilbergerB_sum {ι : Type*} [Fintype ι] (n : ℚ)
    (w : ι → ℚ) (a : ι → ℕ → ℚ) (i : ℕ) :
    zeilbergerB n (fun k => ∑ j, w j * a j k) i = ∑ j, w j * zeilbergerB n (a j) i := by
  simp only [zeilbergerB, mul_add, Finset.mul_sum]
  simp_rw [← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro j _
  ring

private theorem zeilbergerC_sum {ι : Type*} [Fintype ι] (n : ℚ)
    (w : ι → ℚ) (a : ι → ℕ → ℚ) (i : ℕ) :
    zeilbergerC n (fun k => ∑ j, w j * a j k) i = ∑ j, w j * zeilbergerC n (a j) i := by
  simp only [zeilbergerC, mul_add, mul_sub, Finset.mul_sum]
  simp only [← Finset.sum_add_distrib, ← Finset.sum_sub_distrib]
  apply Finset.sum_congr rfl
  intro j _
  ring

theorem orderThirteen_sum {ι : Type*} [Fintype ι] (n : ℚ)
    (w : ι → ℚ) (a : ι → ℕ → ℚ) :
    orderThirteen n (fun k => ∑ j, w j * a j k) = ∑ j, w j * orderThirteen n (a j) := by
  unfold orderThirteen
  have hb : zeilbergerB n (fun k => ∑ j, w j * a j k) =
      (fun k => ∑ j, w j * zeilbergerB n (a j) k) :=
    funext (zeilbergerB_sum n w a)
  rw [hb]
  simp only [zeilbergerC_sum, mul_add, mul_sub, Finset.mul_sum]
  simp only [← Finset.sum_add_distrib, ← Finset.sum_sub_distrib]
  apply Finset.sum_congr rfl
  intro j _
  ring

theorem orderThirteen_congr (n : ℚ) (a b : ℕ → ℚ)
    (h : ∀ j < 14, a j = b j) : orderThirteen n a = orderThirteen n b := by
  unfold orderThirteen zeilbergerC zeilbergerB
  norm_num
  simp only [h 0 (by decide), h 1 (by decide), h 2 (by decide), h 3 (by decide),
    h 4 (by decide), h 5 (by decide), h 6 (by decide), h 7 (by decide),
    h 8 (by decide), h 9 (by decide), h 10 (by decide), h 11 (by decide),
    h 12 (by decide), h 13 (by decide)]

private theorem eval_zeroPoly (x : ℚ) (p : Poly) (h : zeroPoly p = true) :
    eval x p = 0 := by
  induction p with
  | nil => rfl
  | cons c cs ih =>
    have hcs : c = 0 ∧ zeroPoly cs = true := by
      simpa only [zeroPoly, List.all_cons, Bool.and_eq_true, beq_iff_eq] using h
    simp [eval, hcs.1, ih hcs.2]

theorem orderThirteen_basis (x : ℚ) (t i : ℕ) (ht : t = 4 ∨ t = 5) (hi : i < 6) :
    orderThirteen (t + 2 * x) (fun j => eval x (count (state i) (t + j))) = 0 := by
  let f (j : ℕ) := count (state i) (t + j)
  let a := (List.range 14).map f
  have hall : (List.range 6).all (zeilbergerCheck t) = true := by
    rcases ht with rfl | rfl
    · exact zeilberger_even
    · exact zeilberger_odd
  have hzero : zeroPoly (zeilbergerResidual (nPoly t) a) = true :=
    List.all_eq_true.mp hall i (List.mem_range.mpr hi)
  have hv := eval_zeroPoly x _ hzero
  rw [eval_zeilbergerResidual, eval_nPoly] at hv
  have hfun : orderThirteen (t + 2 * x) (fun j => eval x (f j)) =
      orderThirteen (t + 2 * x) (fun j => eval x a[j]!) := by
    apply orderThirteen_congr
    intro j hj
    rw [show a[j]! = f j from get_map_range f j 14 hj]
  exact hfun.trans hv

theorem orderThirteen_linear_combination (x : ℚ) (t : ℕ) (ht : t = 4 ∨ t = 5)
    (w : Fin 6 → ℚ) :
    orderThirteen (t + 2 * x)
      (fun j => ∑ i : Fin 6, w i * eval x (count (state i) (t + j))) = 0 := by
  rw [orderThirteen_sum]
  apply Finset.sum_eq_zero
  intro i _
  rw [orderThirteen_basis x t i ht i.isLt, mul_zero]

theorem orderThirteen_directCount_initial (n : ℕ) (hn : n < 4) :
    orderThirteen n (fun j => directCount (n + j)) = 0 := by
  let f (j : ℕ) := constant (directCount (n + j))
  let a := (List.range 14).map f
  have hzero : zeroPoly (zeilbergerResidual (constant (n : ℚ)) a) = true :=
    List.all_eq_true.mp zeilberger_initial n (List.mem_range.mpr hn)
  have hv := eval_zeroPoly 0 _ hzero
  rw [eval_zeilbergerResidual, eval_const] at hv
  refine (orderThirteen_congr _ _ _ ?_).trans hv
  intro j hj
  rw [show a[j]! = f j from get_map_range f j 14 hj]
  simp [f, eval_const]

end KauersKoutschanCertificate
