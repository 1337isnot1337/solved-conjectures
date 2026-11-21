module

public import Mathlib.Basic.Complex.BigOperators
public import Mathlib.Algebra.BigOperators.Ring.Finset
public import Lean.Elab.Tactic.Omega
public import Mathlib.Tactic.Positivity
public import Mathlib.Tactic.Ring

/-!
# Ordered complex inequalities for the refined type-D recurrence

The recurrence preserves two explicit inequalities in the upper half-plane.
The preservation proof is algebraic: it expands each new imaginary part as
a sum of old ordered imaginary parts and nonnegative squared moduli.
-/

@[expose] public section

namespace Chow

open scoped BigOperators ComplexConjugate

/-- The two ordered inequalities used by the refined recurrence. The
diagonal is included, so nonnegative sums can be handled uniformly. -/
def OrderedCone {ι : Type*} [Preorder ι] (z : ℂ) (f : ι → ℂ) : Prop :=
  ∀ i j, i ≤ j →
    0 ≤ (f j * conj (f i)).im ∧
    0 ≤ (z * f i * conj (f j)).im

theorem orderedCone_sum_pair {ι : Type*} [Preorder ι]
    {z : ℂ} {f : ι → ℂ} (hf : OrderedCone z f) (s t : Finset ι)
    (hst : ∀ i ∈ s, ∀ j ∈ t, i ≤ j) :
    0 ≤ ((∑ j ∈ t, f j) * conj (∑ i ∈ s, f i)).im ∧
    0 ≤ (z * (∑ i ∈ s, f i) * conj (∑ j ∈ t, f j)).im := by
  constructor
  · have h : 0 ≤ ∑ i ∈ s, ∑ j ∈ t, (f j * conj (f i)).im := by
      exact Finset.sum_nonneg fun i hi => Finset.sum_nonneg fun j hj =>
        (hf i j (hst i hi j hj)).1
    simpa only [map_sum, Finset.sum_mul, Finset.mul_sum, Complex.im_sum] using h
  · have h : 0 ≤ ∑ j ∈ t, ∑ i ∈ s, (z * f i * conj (f j)).im := by
      exact Finset.sum_nonneg fun j hj => Finset.sum_nonneg fun i hi =>
        (hf i j (hst i hi j hj)).2
    simpa only [map_sum, Finset.sum_mul, Finset.mul_sum, Complex.im_sum] using h

theorem cone_step_first_identity (z A B C : ℂ) :
    ((z * A + z * B + C) * conj (z * A + B + C)).im =
      Complex.normSq z * (B * conj A).im +
      (z * A * conj B).im + z.im * Complex.normSq B +
      (z * B * conj C).im + (C * conj B).im := by
  simp only [Complex.add_re, Complex.add_im, Complex.mul_re, Complex.mul_im,
    Complex.conj_re, Complex.conj_im, Complex.normSq_apply]
  ring

theorem cone_step_second_identity (z A B C : ℂ) :
    (z * (z * A + B + C) * conj (z * A + z * B + C)).im =
      z.im * Complex.normSq (z * A + C) +
      Complex.normSq z * (z * A * conj B).im +
      Complex.normSq z * (B * conj A).im +
      (z * B * conj C).im +
      Complex.normSq z * (C * conj B).im := by
  simp only [Complex.add_re, Complex.add_im, Complex.mul_re, Complex.mul_im,
    Complex.conj_re, Complex.conj_im, Complex.normSq_apply]
  ring

theorem cone_step {z A B C : ℂ} (hz : 0 ≤ z.im)
    (hAB : 0 ≤ (B * conj A).im ∧ 0 ≤ (z * A * conj B).im)
    (hBC : 0 ≤ (C * conj B).im ∧ 0 ≤ (z * B * conj C).im) :
    0 ≤ ((z * A + z * B + C) * conj (z * A + B + C)).im ∧
    0 ≤ (z * (z * A + B + C) * conj (z * A + z * B + C)).im := by
  constructor
  · rw [cone_step_first_identity]
    exact add_nonneg (add_nonneg (add_nonneg
      (add_nonneg (mul_nonneg (Complex.normSq_nonneg z) hAB.1) hAB.2)
      (mul_nonneg hz (Complex.normSq_nonneg B))) hBC.2) hBC.1
  · rw [cone_step_second_identity]
    exact add_nonneg (add_nonneg (add_nonneg
      (add_nonneg (mul_nonneg hz (Complex.normSq_nonneg (z * A + C)))
        (mul_nonneg (Complex.normSq_nonneg z) hAB.2))
      (mul_nonneg (Complex.normSq_nonneg z) hAB.1)) hBC.2)
      (mul_nonneg (Complex.normSq_nonneg z) hBC.1)

/-- The evaluation-level cutoff recurrence. -/
noncomputable def cutValue {n : ℕ} (z : ℂ) (f : Fin n → ℂ) (k : ℕ) : ℂ :=
  ∑ i : Fin n, if i.val < k then z * f i else f i

theorem cutValue_pair {n : ℕ} {z : ℂ} (hz : 0 ≤ z.im)
    {f : Fin n → ℂ} (hf : OrderedCone z f) (k l : ℕ) (hkl : k ≤ l) :
    0 ≤ (cutValue z f l * conj (cutValue z f k)).im ∧
    0 ≤ (z * cutValue z f k * conj (cutValue z f l)).im := by
  let s : Finset (Fin n) := Finset.univ.filter fun i => i.val < k
  let t : Finset (Fin n) := Finset.univ.filter fun i => k ≤ i.val ∧ i.val < l
  let u : Finset (Fin n) := Finset.univ.filter fun i => l ≤ i.val
  let A := ∑ i ∈ s, f i
  let B := ∑ i ∈ t, f i
  let C := ∑ i ∈ u, f i
  have hAB : 0 ≤ (B * conj A).im ∧
      0 ≤ (z * A * conj B).im := by
    apply orderedCone_sum_pair hf s t
    intro i hi j hj
    simp only [s, t, Finset.mem_filter, Finset.mem_univ, true_and] at hi hj
    exact Fin.le_iff_val_le_val.mpr (by omega)
  have hBC : 0 ≤ (C * conj B).im ∧
      0 ≤ (z * B * conj C).im := by
    apply orderedCone_sum_pair hf t u
    intro i hi j hj
    simp only [t, u, Finset.mem_filter, Finset.mem_univ, true_and] at hi hj
    exact Fin.le_iff_val_le_val.mpr (by omega)
  have hk : cutValue z f k = z * A + B + C := by
    dsimp [cutValue, A, B, C, s, t, u]
    simp only [Finset.sum_filter, Finset.mul_sum, ← Finset.sum_add_distrib]
    apply Finset.sum_congr rfl
    intro i hi
    by_cases hik : i.val < k
    · simp [hik, show ¬k ≤ i.val by omega, show ¬l ≤ i.val by omega]
    · by_cases hil : i.val < l
      · simp [hik, hil, show k ≤ i.val by omega, show ¬l ≤ i.val by omega]
      · simp [hik, hil, show k ≤ i.val by omega, show l ≤ i.val by omega]
  have hl : cutValue z f l = z * A + z * B + C := by
    dsimp [cutValue, A, B, C, s, t, u]
    simp only [Finset.sum_filter, Finset.mul_sum, ← Finset.sum_add_distrib]
    apply Finset.sum_congr rfl
    intro i hi
    by_cases hik : i.val < k
    · simp [hik, show i.val < l by omega, show ¬k ≤ i.val by omega,
        show ¬l ≤ i.val by omega]
    · by_cases hil : i.val < l
      · simp [hik, hil, show k ≤ i.val by omega, show ¬l ≤ i.val by omega]
      · simp [hik, hil, show k ≤ i.val by omega, show l ≤ i.val by omega]
  rw [hk, hl]
  exact cone_step hz hAB hBC

theorem orderedCone_cutValue {n m : ℕ} {z : ℂ} (hz : 0 ≤ z.im)
    {f : Fin n → ℂ} (hf : OrderedCone z f) (k : Fin m → ℕ) (hk : Monotone k) :
    OrderedCone z (fun i => cutValue z f (k i)) := by
  intro i j hij
  exact cutValue_pair hz hf (k i) (k j) (hk hij)

end Chow
