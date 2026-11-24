module

public import Mathlib.Algebra.CubicDiscriminant
public import Mathlib.Analysis.Complex.Polynomial.Basic
public import Mathlib.Analysis.SpecialFunctions.Complex.Arg
public import Mathlib.Analysis.SpecialFunctions.Pow.Real
public import Mathlib.Tactic.ByContra
public import Mathlib.Tactic.Linarith
public import Mathlib.Tactic.NormNum
public import Mathlib.Tactic.Ring

/-! The explicit counterexample to Cardon–Forgács–Piotrowski–Sorensen–White
Question 6.1: the cubic input has all its zeros at 1, but its image has
a nonreal zero at a positive-width sector obstruction. -/

@[expose] public section

namespace CardonZeroSector

open Polynomial

noncomputable section

/-- The real monomial-diagonal operator in Question 6.1. -/
def diagonal (α p : ℝ) (f : ℝ[X]) : ℝ[X] :=
  f.sum (fun k a => monomial k (a * Real.exp (-α * (k : ℝ) ^ p)))

theorem diagonal_add (α p : ℝ) (f g : ℝ[X]) :
    diagonal α p (f + g) = diagonal α p f + diagonal α p g := by
  unfold diagonal
  apply sum_add_index
  · intro i
    simp
  · intro i a b
    simp [add_mul]

theorem diagonal_monomial (α p : ℝ) (k : ℕ) (a : ℝ) :
    diagonal α p (monomial k a) = monomial k (a * Real.exp (-α * (k : ℝ) ^ p)) := by
  unfold diagonal
  rw [sum_monomial_index]
  simp

/-- The literal multiplier formula holds in every degree for every real polynomial. -/
theorem diagonal_coeff (α p : ℝ) (f : ℝ[X]) (k : ℕ) :
    (diagonal α p f).coeff k = f.coeff k * Real.exp (-α * (k : ℝ) ^ p) := by
  rw [diagonal, coeff_sum, sum_def]
  rw [Finset.sum_eq_single k]
  · simp
  · intro i _ hi
    simp [coeff_monomial, hi]
  · intro hn
    simp [notMem_support_iff.mp hn]

/-- The closed sector about the nonnegative real axis. -/
def sector (θ : ℝ) (z : ℂ) : Prop := z = 0 ∨ |z.arg| ≤ θ

/-- All the complex zeros of a real polynomial lie in the indicated sector. -/
def rootsIn (θ : ℝ) (f : ℝ[X]) : Prop :=
  ∀ z : ℂ, (f.map Complex.ofRealHom).IsRoot z → sector θ z

/-- An operator can reduce every sector of strictly positive width below π/2. -/
def reduces (T : ℝ[X] → ℝ[X]) : Prop :=
  ∀ θ : ℝ, 0 < θ → θ < Real.pi / 2 →
    ∃ γ : ℝ, 0 ≤ γ ∧ γ < θ ∧ ∀ f : ℝ[X], rootsIn θ f → rootsIn γ (T f)

/-- The exact positive parameter in the written cubic witness. -/
def α₀ : ℝ := Real.log (16 / 15) / 6
private def q : ℝ := Real.exp (-α₀)

theorem alpha_pos : 0 < α₀ := by
  unfold α₀
  exact div_pos (Real.log_pos (by norm_num)) (by norm_num)

private theorem q_pow_six : q ^ 6 = 15 / 16 := by
  rw [q, ← Real.exp_nat_mul]
  norm_num [α₀]
  rw [show -((6 : ℝ) * (Real.log (16 / 15) / 6)) = -Real.log (16 / 15) by ring,
    Real.exp_neg, Real.exp_log (by norm_num : (0 : ℝ) < 16 / 15)]
  norm_num

private theorem exponential_power_three (k : ℕ) :
    Real.exp (-α₀ * (k : ℝ) ^ (3 : ℝ)) = q ^ (k ^ 3) := by
  rw [show (3 : ℝ) = (3 : ℕ) by norm_num, Real.rpow_natCast, q, ← Real.exp_nat_mul,
    Nat.cast_pow, mul_comm]

private def input : ℝ[X] := (X - 1) ^ 3

private def outputCubic : Cubic ℝ := ⟨q ^ 27, -3 * q ^ 8, 3 * q, -1⟩

private theorem diagonal_input : diagonal α₀ 3 input = outputCubic.toPoly := by
  rw [show input = (⟨1, -3, 3, -1⟩ : Cubic ℝ).toPoly by
    have hC : C (3 : ℝ) = 3 := by simpa using (map_natCast (C : ℝ →+* ℝ[X]) 3)
    simp [input, Cubic.toPoly, hC]
    ring]
  unfold Cubic.toPoly
  simp only [C_mul_X_pow_eq_monomial, C_mul_X_eq_monomial]
  simp only [← monomial_zero_left, diagonal_add, diagonal_monomial, exponential_power_three]
  norm_num [outputCubic]

private theorem output_a_ne_zero : outputCubic.a ≠ 0 :=
  pow_ne_zero _ (ne_of_gt (Real.exp_pos _))

private theorem output_discr_neg : outputCubic.discr < 0 := by
  have hid : outputCubic.discr =
      q^6 * (Cubic.mk ((q^6)^4) (-3*(q^6)) 3 (-1)).discr := by
    unfold outputCubic Cubic.discr
    dsimp
    ring
  rw [hid, q_pow_six]
  norm_num [Cubic.discr]

/-- A real cubic with negative discriminant has a nonreal complex root. -/
theorem exists_nonreal_root (P : Cubic ℝ) (ha : P.a ≠ 0) (hD : P.discr < 0) :
    ∃ z : ℂ, (P.toPoly.map Complex.ofRealHom).IsRoot z ∧ z.im ≠ 0 := by
  by_contra! h
  obtain ⟨x,y,z,hroots⟩ := (Cubic.splits_iff_roots_eq_three
    (P := P) (φ := Complex.ofRealHom) ha).mp (IsAlgClosed.splits _)
  have aux (w : ℂ) (hw : w ∈ ({x,y,z} : Multiset ℂ)) : (w.re : ℂ) = w := by
    have hw' : w ∈ (P.toPoly.map Complex.ofRealHom).roots := by
      rwa [← Cubic.map_roots, hroots]
    apply Complex.ext
    · rfl
    · simpa using (h w (Polynomial.isRoot_of_mem_roots hw')).symm
  have hx := aux x (by simp)
  have hy := aux y (by simp)
  have hz := aux z (by simp)
  have hd := Cubic.discr_eq_prod_three_roots ha hroots
  rw [← hx, ← hy, ← hz] at hd
  have hd' : P.discr = (P.a * P.a * (x.re - y.re) * (x.re - z.re) *
      (y.re - z.re)) ^ 2 := by
    apply Complex.ofReal_injective
    simpa only [Complex.ofRealHom_eq_coe, Complex.ofReal_sub,
      Complex.ofReal_mul, Complex.ofReal_pow] using hd
  rw [hd'] at hD
  exact (not_lt_of_ge (sq_nonneg _)) hD

private theorem input_rootsIn (θ : ℝ) (hθ : 0 ≤ θ) : rootsIn θ input := by
  intro z hz
  simp only [input, Polynomial.map_pow, Polynomial.map_sub, Polynomial.map_X,
    Polynomial.map_one, Polynomial.IsRoot, Polynomial.eval_pow, Polynomial.eval_sub,
    Polynomial.eval_X, Polynomial.eval_one] at hz
  have hz1 : z = 1 := sub_eq_zero.mp (eq_zero_of_pow_eq_zero hz)
  exact Or.inr (by simpa [hz1, Complex.arg_one] using hθ)

/-- At the source parameters \(p=3\) and \(\alpha=\log(16/15)/6\), sector
reduction fails already on \((X-1)^3\), at strictly positive width. -/
theorem counterexample : ¬ reduces (diagonal α₀ 3) := by
  intro h
  obtain ⟨z, hz, hi⟩ := exists_nonreal_root outputCubic output_a_ne_zero output_discr_neg
  have ha : 0 < |z.arg| := abs_pos.mpr (fun harg => hi (Complex.arg_eq_zero_iff.mp harg).2)
  let θ := min (|z.arg| / 2) (Real.pi / 4)
  have hθ : 0 < θ := lt_min (by linarith) (by linarith [Real.pi_pos])
  have hθ' : θ < Real.pi / 2 :=
    (min_le_right _ _).trans_lt (by linarith [Real.pi_pos])
  obtain ⟨γ, _, hg, hred⟩ := h θ hθ hθ'
  have hr := hred input (input_rootsIn θ hθ.le) z (by rwa [diagonal_input])
  rcases hr with rfl | harg
  · simp at hi
  · have ht : θ ≤ |z.arg| / 2 := min_le_left _ _
    linarith

/-- The universal sufficiency assertion in Question 6.1 is false. -/
theorem cardon_question_6_1_false :
    ¬ ∀ α p : ℝ, 0 < α → 0 < p → (reduces (diagonal α p) ↔ 2 ≤ p) := by
  intro h
  exact counterexample ((h α₀ 3 alpha_pos (by norm_num)).2 (by norm_num))

end

end CardonZeroSector
