module

public import Conjectures.KVZGammaCompositionGamma
public import Mathlib.Basic.Real.Sign
public import Mathlib.Tactic.FinCases

/-!
# All-order sign regularity of the source gamma quotient

The source parameters and arbitrary real node grids are retained. Positivity
is required only for the denominator arguments `d + x_i + y_j`. A translation
splits those arguments into positive nodes, so the integral proof covers the
whole stated domain. Noninteger parameters give strict signs at every order;
positive integer differences give the exact rank cutoff.
-/

@[expose] public section

namespace KVZGamma

open Matrix Set
open scoped BigOperators

noncomputable section

/-- The literal shifted gamma quotient from the source. -/
def sourceKernel (c d x y : ℝ) : ℝ := Real.Gamma (c + x + y) / Real.Gamma (d + x + y)

theorem sourceKernel_eq (c d x y : ℝ) : sourceKernel c d x y =
    Real.Gamma (c + x + y) / Real.Gamma (d + x + y) := by
  simp only [sourceKernel]

/-- Positive denominator sums can be split into two strictly ordered positive
tuples without changing any sum. -/
theorem positive_translation {r : ℕ} (hr : 0 < r) (d : ℝ)
    (x y : Fin r → ℝ) (hx : StrictMono x) (hy : StrictMono y)
    (hargs : ∀ i j, 0 < d + x i + y j) :
    ∃ a b : Fin r → ℝ, StrictMono a ∧ StrictMono b ∧
      (∀ i, 0 < a i) ∧ (∀ j, 0 < b j) ∧
      ∀ i j, a i + b j = d + x i + y j := by
  let z : Fin r := ⟨0, hr⟩
  let e : ℝ := (d + x z + y z) / 2
  let a : Fin r → ℝ := fun i => x i - x z + e
  let b : Fin r → ℝ := fun j => y j - y z + e
  have he : 0 < e := div_pos (hargs z z) (by norm_num)
  have hz (i : Fin r) : z ≤ i := Nat.zero_le i.val
  refine ⟨a, b, ?_, ?_, ?_, ?_, ?_⟩
  · intro i j hij
    dsimp [a]
    linarith [hx hij]
  · intro i j hij
    dsimp [b]
    linarith [hy hij]
  · intro i
    dsimp [a]
    linarith [hx.monotone (hz i)]
  · intro j
    dsimp [b]
    linarith [hy.monotone (hz j)]
  · intro i j
    dsimp [a, b, e]
    ring

theorem sourceKernel_eq_gammaQuotient {c d x y a b : ℝ}
    (hsum : a + b = d + x + y) :
    sourceKernel c d x y = gammaQuotient (c - d) a b := by
  have hnum : a + b + (c - d) = c + x + y := by rw [hsum]; ring
  unfold sourceKernel gammaQuotient
  rw [hnum, hsum]

/-- The exact source signature on every ordered grid in the full domain. -/
theorem source_det_mul_signature_pos {r : ℕ} (c d : ℝ) (hcd : d < c)
    (x y : Fin r → ℝ) (hx : StrictMono x) (hy : StrictMono y)
    (hargs : ∀ i j, 0 < d + x i + y j)
    (hfall : ∀ i : Fin r, falling (c - d) i.val ≠ 0) :
    0 < Matrix.det (Matrix.of fun i j => sourceKernel c d (x i) (y j)) *
      powerSignature (c - d) r := by
  by_cases hr : r = 0
  · subst r
    simp [Matrix.det_isEmpty, powerSignature]
  · obtain ⟨a, b, ha, hb, hapos, hbpos, hsum⟩ :=
      positive_translation (Nat.pos_of_ne_zero hr) d x y hx hy hargs
    have hmatrix : (Matrix.of fun i j => sourceKernel c d (x i) (y j)) =
        Matrix.of (fun i j => gammaQuotient (c - d) (a i) (b j)) := by
      ext i j
      exact sourceKernel_eq_gammaQuotient (hsum i j)
    rw [hmatrix]
    exact gammaQuotient_det_mul_signature_pos (c - d) (sub_pos.mpr hcd)
      a b ha hb hapos hbpos hfall

/-- Every order is strict when the positive parameter difference is not an
integer. The signature is independent of the chosen ordered grid. -/
theorem source_noninteger_all_orders {r : ℕ} (c d : ℝ) (hcd : d < c)
    (hnot : ∀ m : ℕ, c - d ≠ m) (x y : Fin r → ℝ)
    (hx : StrictMono x) (hy : StrictMono y)
    (hargs : ∀ i j, 0 < d + x i + y j) :
    0 < Matrix.det (Matrix.of fun i j => sourceKernel c d (x i) (y j)) *
      powerSignature (c - d) r :=
  source_det_mul_signature_pos c d hcd x y hx hy hargs
    (fun i => falling_ne_zero hnot i.val)

/-- For a positive integer difference, every minor through order `m+1`
has the alternating source signature. -/
theorem source_integer_strict {r m : ℕ} (c d : ℝ) (hcd : d < c)
    (hdiff : c - d = (m : ℝ)) (hr : r ≤ m + 1) (x y : Fin r → ℝ)
    (hx : StrictMono x) (hy : StrictMono y)
    (hargs : ∀ i j, 0 < d + x i + y j) :
    0 < Matrix.det (Matrix.of fun i j => sourceKernel c d (x i) (y j)) *
      (-1 : ℝ) ^ (r.choose 2) := by
  have hfall : ∀ i : Fin r, falling (c - d) i.val ≠ 0 := by
    intro i
    rw [hdiff]
    exact (falling_nat_pos (by omega : i.val ≤ m)).ne'
  have hp := source_det_mul_signature_pos c d hcd x y hx hy hargs hfall
  rw [hdiff] at hp
  have hsig := powerSignature_nat_mul_sign_pos hr
  have hmul : 0 <
      (Matrix.det (Matrix.of fun i j => sourceKernel c d (x i) (y j)) *
        (-1 : ℝ) ^ (r.choose 2)) *
      (powerSignature (m : ℝ) r * powerSignature (m : ℝ) r) := by
    convert mul_pos hp hsig using 1
    ring
  exact pos_of_mul_pos_left hmul (mul_self_nonneg _)

/-- Every larger minor vanishes for a positive integer parameter difference. -/
theorem source_integer_rank_cutoff {r m : ℕ} (c d : ℝ) (hcd : d < c)
    (hdiff : c - d = (m : ℝ)) (hr : m + 1 < r) (x y : Fin r → ℝ)
    (hx : StrictMono x) (hy : StrictMono y)
    (hargs : ∀ i j, 0 < d + x i + y j) :
    Matrix.det (Matrix.of fun i j => sourceKernel c d (x i) (y j)) = 0 := by
  have hm : 0 < m := by
    have hm' : (0 : ℝ) < m := by rw [← hdiff]; exact sub_pos.mpr hcd
    exact_mod_cast hm'
  obtain ⟨a, b, _ha, _hb, hapos, hbpos, hsum⟩ :=
    positive_translation (by omega : 0 < r) d x y hx hy hargs
  have hmatrix : (Matrix.of fun i j => sourceKernel c d (x i) (y j)) =
      Matrix.of (fun i j => gammaQuotient (m : ℝ) (a i) (b j)) := by
    ext i j
    simpa only [Matrix.of_apply, hdiff] using
      sourceKernel_eq_gammaQuotient (c := c) (hsum i j)
  rw [hmatrix]
  exact gammaQuotient_nat_det_eq_zero hm hr a b hapos hbpos

/-- A single all-order statement records both exhaustive parameter branches. -/
theorem source_sign_regularity (c d : ℝ) (hcd : d < c) :
    (∀ r : ℕ, ∀ x y : Fin r → ℝ, StrictMono x → StrictMono y →
      (∀ i j, 0 < d + x i + y j) →
      (∀ m : ℕ, c - d ≠ m) →
      0 < Matrix.det (Matrix.of fun i j => sourceKernel c d (x i) (y j)) *
        powerSignature (c - d) r) ∧
    (∀ m r : ℕ, c - d = (m : ℝ) → ∀ x y : Fin r → ℝ,
      StrictMono x → StrictMono y → (∀ i j, 0 < d + x i + y j) →
      (r ≤ m + 1 →
        0 < Matrix.det (Matrix.of fun i j => sourceKernel c d (x i) (y j)) *
          (-1 : ℝ) ^ (r.choose 2)) ∧
      (m + 1 < r →
        Matrix.det (Matrix.of fun i j => sourceKernel c d (x i) (y j)) = 0)) := by
  constructor
  · intro r x y hx hy hargs hnot
    exact source_noninteger_all_orders c d hcd hnot x y hx hy hargs
  · intro m r hdiff x y hx hy hargs
    exact ⟨fun hr => source_integer_strict c d hcd hdiff hr x y hx hy hargs,
      fun hr => source_integer_rank_cutoff c d hcd hdiff hr x y hx hy hargs⟩

private theorem real_sign_eq_of_mul_pos {a b : ℝ} (h : 0 < a * b) :
    Real.sign a = Real.sign b := by
  rcases mul_pos_iff.mp h with hpos | hneg
  · rw [Real.sign_of_pos hpos.1, Real.sign_of_pos hpos.2]
  · rw [Real.sign_of_neg hneg.1, Real.sign_of_neg hneg.2]

/-- The sign of every source minor equals the explicit parameter signature,
including the zero branch at each positive integer difference. -/
theorem source_exact_signature {r : ℕ} (c d : ℝ) (hcd : d < c)
    (x y : Fin r → ℝ) (hx : StrictMono x) (hy : StrictMono y)
    (hargs : ∀ i j, 0 < d + x i + y j) :
    Real.sign (Matrix.det (Matrix.of fun i j => sourceKernel c d (x i) (y j))) =
      Real.sign (powerSignature (c - d) r) := by
  classical
  by_cases hnot : ∀ m : ℕ, c - d ≠ (m : ℝ)
  · exact real_sign_eq_of_mul_pos
      (source_noninteger_all_orders c d hcd hnot x y hx hy hargs)
  · push Not at hnot
    obtain ⟨m, hdiff⟩ := hnot
    by_cases hr : r ≤ m + 1
    · have hdet := real_sign_eq_of_mul_pos
        (source_integer_strict c d hcd hdiff hr x y hx hy hargs)
      have hsignature := real_sign_eq_of_mul_pos
        (powerSignature_nat_mul_sign_pos hr)
      rw [hdiff]
      exact hdet.trans hsignature.symm
    · have hlt : m + 1 < r := Nat.lt_of_not_ge hr
      rw [source_integer_rank_cutoff c d hcd hdiff hlt x y hx hy hargs,
        hdiff, powerSignature_nat_eq_zero hlt]

/-- At order three the parameter polynomial is exactly `δ²(1-δ)`. -/
theorem source_third_order_signature (c d : ℝ) (hcd : d < c)
    (x y : Fin 3 → ℝ) (hx : StrictMono x) (hy : StrictMono y)
    (hargs : ∀ i j, 0 < d + x i + y j) :
    Real.sign (Matrix.det (Matrix.of fun i j => sourceKernel c d (x i) (y j))) =
      Real.sign ((c - d)^2 * (1 - (c - d))) := by
  rw [source_exact_signature c d hcd x y hx hy hargs, powerSignature_three]

end

end KVZGamma
