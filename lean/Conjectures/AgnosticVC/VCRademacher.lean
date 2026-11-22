module

public import Conjectures.AgnosticVC.VCEmpirical
public import Mathlib.Analysis.Convex.Jensen
public import Mathlib.Analysis.Convex.SpecificFunctions.Basic
public import Mathlib.Analysis.SpecialFunctions.Trigonometric.Series

@[expose] public section

namespace AgnosticVC

open Finset
open scoped BigOperators

variable {α : Type*} [Fintype α] [DecidableEq α]

/-- The finite uniform average over all choices of independent signs. -/
noncomputable def signAverage (f : (α → Bool) → ℝ) : ℝ :=
  (∑ σ, f σ) / (Fintype.card (α → Bool) : ℝ)

lemma signAverage_mono {f g : (α → Bool) → ℝ} (h : ∀ σ, f σ ≤ g σ) :
    signAverage f ≤ signAverage g :=
  div_le_div_of_nonneg_right (Finset.sum_le_sum fun σ _ => h σ) (Nat.cast_nonneg _)

lemma signAverage_add (f g : (α → Bool) → ℝ) :
    signAverage (fun σ => f σ + g σ) = signAverage f + signAverage g := by
  simp [signAverage, Finset.sum_add_distrib, add_div]

lemma signAverage_sum {β : Type*} (s : Finset β) (f : β → (α → Bool) → ℝ) :
    signAverage (fun σ => ∑ j ∈ s, f j σ) = ∑ j ∈ s, signAverage (f j) := by
  unfold signAverage
  rw [Finset.sum_comm]
  simp only [div_eq_mul_inv, Finset.sum_mul]

lemma signAverage_const (c : ℝ) : signAverage (fun _ : α → Bool => c) = c := by
  simp [signAverage, nsmul_eq_mul]

/-- The sum of the coefficients with prescribed independent signs. -/
def signedSum (c : α → ℝ) (σ : α → Bool) : ℝ :=
  ∑ i, (if σ i then 1 else -1) * c i

omit [DecidableEq α] in
lemma signedSum_sub (c d : α → ℝ) (σ : α → Bool) :
    signedSum (fun i => c i - d i) σ = signedSum c σ - signedSum d σ := by
  simp [signedSum, mul_sub, Finset.sum_sub_distrib]

omit [DecidableEq α] in
lemma signedSum_neg (c : α → ℝ) (σ : α → Bool) :
    signedSum (fun i => -c i) σ = -signedSum c σ := by
  simp [signedSum]

/-- The moment generating function bound for a sum of independent signs. -/
theorem signAverage_exp_signedSum_le (c : α → ℝ) (θ : ℝ) :
    signAverage (fun σ => Real.exp (θ * signedSum c σ)) ≤
      Real.exp (θ ^ 2 * (∑ i, c i ^ 2) / 2) := by
  classical
  have hprod : (∑ σ : α → Bool, Real.exp (θ * signedSum c σ)) =
      ∏ i : α, ∑ b : Bool, Real.exp ((if b then 1 else -1) * (θ * c i)) := by
    simp only [signedSum, Finset.mul_sum, Real.exp_sum]
    rw [← Finset.sum_prod_piFinset Finset.univ]
    rw [Fintype.piFinset_univ]
    congr 1
    funext σ
    congr 1
    funext i
    congr 1
    ring
  have hnormalize : signAverage (fun σ => Real.exp (θ * signedSum c σ)) =
      ∏ i : α, Real.cosh (θ * c i) := by
    unfold signAverage
    rw [hprod, Fintype.card_fun, Fintype.card_bool, Nat.cast_pow, Nat.cast_ofNat,
      ← Finset.card_univ, ← Finset.prod_const, ← Finset.prod_div_distrib]
    apply Finset.prod_congr rfl
    intro i hi
    rw [Fintype.sum_bool, Real.cosh_eq]
    simp [div_eq_mul_inv]
  rw [hnormalize, Finset.mul_sum]
  simp only [div_eq_mul_inv, Finset.sum_mul, Real.exp_sum]
  apply Finset.prod_le_prod₀ (fun i _ => (Real.cosh_pos (θ * c i)).le)
  intro i hi
  rw [show θ ^ 2 * c i ^ 2 * (2 : ℝ)⁻¹ = (θ * c i) ^ 2 / 2 by ring]
  exact Real.cosh_le_exp_half_sq _

private lemma exp_signAverage_le (f : (α → Bool) → ℝ) :
    Real.exp (signAverage f) ≤ signAverage (fun σ => Real.exp (f σ)) := by
  let N : ℝ := Fintype.card (α → Bool)
  have hN : 0 < N := Nat.cast_pos.mpr Fintype.card_pos
  have hsum : ∑ _σ : α → Bool, N⁻¹ = 1 := by
    simp [nsmul_eq_mul, N]
  have hJ := convexOn_exp.map_sum_le (w := fun _σ : α → Bool => N⁻¹)
    (t := Finset.univ) (p := f) (fun _ _ => inv_nonneg.mpr hN.le) hsum
    (fun _ _ => Set.mem_univ _)
  simp only [smul_eq_mul, ← Finset.mul_sum] at hJ
  simpa only [signAverage, div_eq_inv_mul, N] using hJ

/-- A finite collection of signed sums with bounded squared coefficients satisfies the
logarithmic bound for the expected largest absolute value. -/
theorem signAverage_sup_abs_signedSum_le {β : Type*} (B : Finset β) (hB : B.Nonempty)
    (c : β → α → ℝ) (v θ : ℝ) (hθ : 0 < θ) (hv : ∀ b ∈ B, ∑ i, (c b i) ^ 2 ≤ v) :
    signAverage (fun σ => B.sup' hB (fun b => |signedSum (c b) σ|)) ≤
      (Real.log (2 * B.card) + θ ^ 2 * v / 2) / θ := by
  let X (σ : α → Bool) := B.sup' hB (fun b => |signedSum (c b) σ|)
  let g (b : β) (σ : α → Bool) :=
    Real.exp (θ * signedSum (c b) σ) + Real.exp (θ * signedSum (fun i => - c b i) σ)
  have hpoint (σ : α → Bool) : Real.exp (θ * X σ) ≤ ∑ b ∈ B, g b σ := by
    obtain ⟨b, hb, hX⟩ := Finset.exists_mem_eq_sup' hB (fun b => |signedSum (c b) σ|)
    apply le_trans _ (Finset.single_le_sum (f := fun b => g b σ)
      (fun j _ => add_nonneg (Real.exp_nonneg _) (Real.exp_nonneg _)) hb)
    change X σ = _ at hX
    rw [hX]
    by_cases hsign : 0 ≤ signedSum (c b) σ
    · rw [abs_of_nonneg hsign]
      exact le_add_of_nonneg_right (Real.exp_nonneg _)
    · rw [abs_of_neg (lt_of_not_ge hsign), ← signedSum_neg]
      exact le_add_of_nonneg_left (Real.exp_nonneg _)
  have hmgf (b : β) (hb : b ∈ B) : signAverage (g b) ≤ 2 * Real.exp (θ ^ 2 * v / 2) := by
    have h := mul_le_mul_of_nonneg_left (hv b hb) (sq_nonneg θ)
    have h' : Real.exp (θ ^ 2 * (∑ i, c b i ^ 2) / 2) ≤ Real.exp (θ ^ 2 * v / 2) := by
      exact Real.exp_le_exp.mpr (div_le_div_of_nonneg_right h (by norm_num))
    have hpos := (signAverage_exp_signedSum_le (c b) θ).trans h'
    have hneg := signAverage_exp_signedSum_le (fun i => -c b i) θ
    simp only [neg_sq] at hneg
    change signAverage (fun σ => _ + _) ≤ _
    rw [signAverage_add, two_mul]
    exact add_le_add hpos (hneg.trans h')
  have hsum : Real.exp (θ * signAverage X) ≤ 2 * B.card * Real.exp (θ ^ 2 * v / 2) := by
    have heq : signAverage (fun σ => θ * X σ) = θ * signAverage X := by
      simp [signAverage, ← Finset.mul_sum, mul_div_assoc]
    rw [← heq]
    calc
      _ ≤ signAverage (fun σ => Real.exp (θ * X σ)) := exp_signAverage_le _
      _ ≤ signAverage (fun σ => ∑ b ∈ B, g b σ) := signAverage_mono hpoint
      _ = ∑ b ∈ B, signAverage (g b) := signAverage_sum _ _
      _ ≤ ∑ b ∈ B, 2 * Real.exp (θ ^ 2 * v / 2) := Finset.sum_le_sum hmgf
      _ = _ := by simp [nsmul_eq_mul]; ring
  have hcard : 0 < (2 * B.card : ℝ) := mul_pos (by norm_num) (Nat.cast_pos.mpr hB.card_pos)
  rw [← Real.exp_log hcard, ← Real.exp_add] at hsum
  exact (le_div_iff₀ hθ).mpr (by simpa only [mul_comm θ] using Real.exp_le_exp.mp hsum)

end AgnosticVC
