import Mathlib.Algebra.Polynomial.Inductions
import Mathlib.Algebra.Polynomial.Eval.Degree
import Mathlib.Tactic

/-! Exact coefficientwise comparison by base digits, with an explicit no-carry bound. -/

namespace OrdinaryDarcais

open Finset Polynomial

def compareDigits (base : ℕ) : ℕ → ℕ → ℕ → Bool
  | 0, _, b => b == 0
  | fuel + 1, a, b =>
    decide (b % base ≤ a % base) && compareDigits base fuel (a / base) (b / base)

private theorem eval_split (p : ℕ[X]) (base : ℕ) :
    p.eval base = base * p.divX.eval base + p.coeff 0 := by
  simpa [mul_comm] using congrArg (Polynomial.eval base) (divX_mul_X_add p).symm

private theorem eval_mod_base {p : ℕ[X]} {base : ℕ} (h : p.coeff 0 < base) :
    p.eval base % base = p.coeff 0 := by
  rw [eval_split, Nat.mul_add_mod_self_left, Nat.mod_eq_of_lt h]

private theorem eval_div_base {p : ℕ[X]} {base : ℕ} (h : p.coeff 0 < base) :
    p.eval base / base = p.divX.eval base := by
  rw [eval_split, Nat.mul_add_div (by omega), Nat.div_eq_of_lt h, Nat.add_zero]

private theorem coeff_eq_digit {p : ℕ[X]} {base : ℕ}
    (h : ∀ j, p.coeff j < base) (k : ℕ) :
    p.coeff k = p.eval base / base ^ k % base := by
  induction k generalizing p with
  | zero => simpa using (eval_mod_base (h 0)).symm
  | succ k ih =>
    rw [pow_succ', ← Nat.div_div_eq_div_mul, eval_div_base (h 0)]
    exact (coeff_divX (p := p) (n := k)).symm.trans (ih fun j => by simpa only [coeff_divX] using h (j + 1))

theorem compareDigits_sound {base fuel : ℕ} {p q : ℕ[X]}
    (hp : ∀ j, p.coeff j < base) (hq : ∀ j, q.coeff j < base)
    (h : compareDigits base fuel (p.eval base) (q.eval base) = true) :
    ∀ k, q.coeff k ≤ p.coeff k := by
  induction fuel generalizing p q with
  | zero =>
    change (q.eval base == 0) = true at h
    intro k
    rw [coeff_eq_digit hq k, beq_iff_eq.mp h]
    simp
  | succ fuel ih =>
    simp only [compareDigits, Bool.and_eq_true, decide_eq_true_eq] at h
    intro k
    cases k with
    | zero =>
      simpa only [eval_mod_base (hp 0), eval_mod_base (hq 0)] using h.1
    | succ k =>
      have h' := ih (p := p.divX) (q := q.divX)
        (fun j => by simpa only [coeff_divX] using hp (j + 1))
        (fun j => by simpa only [coeff_divX] using hq (j + 1))
        (by simpa only [eval_div_base (hp 0), eval_div_base (hq 0)] using h.2) k
      simpa only [coeff_divX] using h'

theorem coeff_le_eval_one (p : ℕ[X]) (k : ℕ) : p.coeff k ≤ p.eval 1 := by
  rcases le_or_gt k p.natDegree with h | h
  · rw [eval_eq_sum_range]
    simp only [one_pow, mul_one]
    exact single_le_sum (fun _ _ => Nat.zero_le _) (mem_range.mpr (Nat.lt_succ_of_le h))
  · rw [coeff_eq_zero_of_natDegree_lt h]
    exact Nat.zero_le _

/-- A bounded digit comparison together with the strict units comparison implies
strict evaluation inequality at every nonnegative real argument. -/
theorem eval_lt_of_packed_check {p q : ℕ[X]} {base fuel : ℕ}
    (hp : p.eval 1 < base) (hq : q.eval 1 < base)
    (h : compareDigits base fuel (p.eval base) (q.eval base) = true)
    (h0 : q.eval base % base < p.eval base % base) {t : ℝ} (ht : 0 ≤ t) :
    q.eval₂ (Nat.castRingHom ℝ) t < p.eval₂ (Nat.castRingHom ℝ) t := by
  have hp' (j : ℕ) := (coeff_le_eval_one p j).trans_lt hp
  have hq' (j : ℕ) := (coeff_le_eval_one q j).trans_lt hq
  have hc := compareDigits_sound hp' hq' h
  have hconst : q.coeff 0 < p.coeff 0 := by
    simpa only [eval_mod_base (hp' 0), eval_mod_base (hq' 0)] using h0
  let N := max p.natDegree q.natDegree + 1
  rw [eval₂_eq_sum_range' _ (n := N) (by dsimp [N]; omega),
    eval₂_eq_sum_range' _ (n := N) (by dsimp [N]; omega)]
  apply Finset.sum_lt_sum
  · intro j _
    apply mul_le_mul_of_nonneg_right _ (pow_nonneg ht _)
    change (q.coeff j : ℝ) ≤ (p.coeff j : ℝ)
    exact_mod_cast hc j
  · refine ⟨0, mem_range.mpr (by dsimp [N]; omega), ?_⟩
    simpa using (show (q.coeff 0 : ℝ) < (p.coeff 0 : ℝ) by exact_mod_cast hconst)


def packedCheck (fuel : ℕ) (left right : ℕ → ℕ) : Bool :=
  let base := left 1 + right 1 + 1
  let a := left base
  let b := right base
  compareDigits base fuel a b && decide (b % base < a % base)

theorem packedCheck_sound {p q : ℕ[X]} {fuel : ℕ} {left right : ℕ → ℕ}
    (hl : ∀ d, left d = p.eval d) (hr : ∀ d, right d = q.eval d)
    (h : packedCheck fuel left right = true) {t : ℝ} (ht : 0 ≤ t) :
    q.eval₂ (Nat.castRingHom ℝ) t < p.eval₂ (Nat.castRingHom ℝ) t := by
  simp only [packedCheck, hl, hr, Bool.and_eq_true, decide_eq_true_eq] at h
  exact eval_lt_of_packed_check (by omega) (by omega) h.1 h.2 ht

end OrdinaryDarcais
