module
public import Mathlib.Tactic
public import Mathlib.Basic.Real.Basic

@[expose] public section
namespace WachsCompleteGraph

def FinitePositiveLogConcave (d : ℕ) (f : ℕ → ℝ) : Prop :=
  (∀ j≤d,0<f j) ∧ (∀ j,d<j → f j=0) ∧
    ∀ j,j+2≤d → f j*f (j+2)<(f (j+1))^2

theorem finiteLogConcave_nonneg {d : ℕ} {f : ℕ → ℝ} (h : FinitePositiveLogConcave d f)
    (j : ℕ) : 0≤f j := by
  by_cases hj : j≤d
  · exact (h.1 j hj).le
  · rw [h.2.1 j (by omega)]

theorem finiteLogConcave_middle_minor {d : ℕ} {f : ℕ → ℝ}
    (h : FinitePositiveLogConcave d f) (j : ℕ) (hj : j+1≤d) :
    0 < (f (j+1))^2-f j*f (j+2) := by
  by_cases ht : j+2≤d
  · exact sub_pos.mpr (h.2.2 j ht)
  · rw [h.2.1 (j+2) (by omega),mul_zero,sub_zero]
    exact pow_pos (h.1 _ hj) _

theorem finiteLogConcave_cross_minor {d : ℕ} {f : ℕ → ℝ}
    (h : FinitePositiveLogConcave d f) (j : ℕ) (hj : j+2≤d) :
    0≤f (j+1)*f (j+2)-f j*f (j+3) := by
  by_cases ht : j+3≤d
  · have hp : 0 < f (j+1)*f (j+2) := mul_pos (h.1 _ (by omega)) (h.1 _ hj)
    have h1 := (h.2.2 j hj).le
    have h2 := (h.2.2 (j+1) ht).le
    have hmul := mul_le_mul h1 h2
      (mul_nonneg (finiteLogConcave_nonneg h _) (finiteLogConcave_nonneg h _)) (sq_nonneg _)
    apply sub_nonneg.mpr
    apply le_of_mul_le_mul_right _ hp
    calc
      _ = (f j*f (j+2))*(f (j+1)*f (j+3)) := by ring
      _ ≤ (f (j+1))^2*(f (j+2))^2 := by simpa [Nat.add_assoc] using hmul
      _ = _ := by ring
  · rw [h.2.1 (j+3) (by omega),mul_zero,sub_zero]
    exact mul_nonneg (finiteLogConcave_nonneg h _) (finiteLogConcave_nonneg h _)

def addLinearWeight (a : ℝ) (f : ℕ → ℝ) (j : ℕ) : ℝ :=
  f j + a*(if j=0 then 0 else f (j-1))

/-- Multiplying a polynomial with positive in-range coefficients by a
positive linear factor preserves strict ordinary log-concavity. -/
theorem finiteLogConcave_addLinear {d : ℕ} {f : ℕ → ℝ} (h : FinitePositiveLogConcave d f)
    {a : ℝ} (ha : 0<a) : FinitePositiveLogConcave (d+1) (addLinearWeight a f) := by
  refine ⟨?_,?_,?_⟩
  · intro j hj
    cases j with
    | zero => simpa [addLinearWeight] using h.1 0 (Nat.zero_le _)
    | succ j =>
      simp only [addLinearWeight,Nat.succ_ne_zero,ite_false,Nat.succ_sub_one]
      exact add_pos_of_nonneg_of_pos (finiteLogConcave_nonneg h _) (mul_pos ha (h.1 j (by omega)))
  · intro j hj
    have h0 := h.2.1 j (by omega)
    have h1 := h.2.1 (j-1) (by omega)
    have hn : j ≠ 0 := by omega
    simp [addLinearWeight,hn,h0,h1]
  · intro j hj
    cases j with
    | zero =>
      apply sub_pos.mp
      change 0 < (addLinearWeight a f 1)^2-addLinearWeight a f 0*addLinearWeight a f 2
      simp only [addLinearWeight,ite_true,one_ne_zero,ite_false,
        Nat.reduceSub,OfNat.ofNat_ne_zero]
      have hd : 1≤d := by omega
      have hc := finiteLogConcave_middle_minor h 0 hd
      have hp := mul_pos (mul_pos ha (h.1 0 (Nat.zero_le _))) (h.1 1 hd)
      have ha' := mul_nonneg (sq_nonneg a) (sq_nonneg (f 0))
      nlinarith
    | succ j =>
      apply sub_pos.mp
      change 0 < (addLinearWeight a f (j+2))^2-
        addLinearWeight a f (j+1)*addLinearWeight a f (j+3)
      simp only [addLinearWeight,Nat.add_one_ne_zero,Nat.add_sub_cancel,ite_false,
        show j+2 ≠ 0 by omega,show j+3 ≠ 0 by omega,
        show j+2-1=j+1 by omega,show j+3-1=j+2 by omega]
      have hd : j+2≤d := by omega
      have hmid := finiteLogConcave_middle_minor h (j+1) (by omega)
      have hcross := mul_nonneg ha.le (finiteLogConcave_cross_minor h j hd)
      have hlast := mul_nonneg (sq_nonneg a) (finiteLogConcave_middle_minor h j (by omega)).le
      nlinarith

end WachsCompleteGraph
