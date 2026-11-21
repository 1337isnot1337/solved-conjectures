module

public import Mathlib.Analysis.SpecificLimits.Basic
public import Mathlib.Analysis.Normed.Group.InfiniteSum
public import Mathlib.Topology.Order.IntermediateValue
public import Mathlib.Tactic.Linarith
public import Mathlib.Tactic.Ring
public import Mathlib.Tactic.NormNum
public import Lean.Elab.Tactic.Omega

/-!
# Error bounds and distinct zeros for the separated Gaussian series

The estimates in this module concern an actual summable series. A strict bound
on the earlier terms and a geometric bound on later terms preserve each block's
sign. The intermediate value theorem then supplies distinct ordered zeros.
-/

@[expose] public section

namespace Grochenig

open Set
open scoped BigOperators

noncomputable section

/-- The geometric error budget for all terms after the selected block. -/
theorem later_series_bound (a : ℕ → ℝ) (m : ℕ) (δ : ℝ) (hδ : 0 ≤ δ)
    (hlater : ∀ n : ℕ, m < n → |a n| ≤ δ * (1 / 2 : ℝ) ^ (n + 3)) :
    |∑' k : ℕ, a (k + (m + 1))| ≤ δ / 8 := by
  have hgeo : HasSum (fun k : ℕ => (δ / 16) * (1 / 2 : ℝ) ^ k) (δ / 8) := by
    convert hasSum_geometric_two.mul_left (δ / 16) using 1
    ring
  have hbound (k : ℕ) : ‖a (k + (m + 1))‖ ≤ (δ / 16) * (1 / 2 : ℝ) ^ k := by
    rw [Real.norm_eq_abs]
    calc
      _ ≤ δ * (1 / 2 : ℝ) ^ ((k + (m + 1)) + 3) := hlater _ (by omega)
      _ ≤ δ * (1 / 2 : ℝ) ^ (k + 4) :=
        mul_le_mul_of_nonneg_left
          (pow_le_pow_of_le_one (by norm_num) (by norm_num) (by omega)) hδ
      _ = _ := by rw [pow_add]; ring
  simpa only [Real.norm_eq_abs] using tsum_of_norm_bounded hgeo hbound

/-- The exact prefix and tail split gives the error bound used at every test
point. No finite truncation replaces the infinite series. -/
theorem series_error_lt (a : ℕ → ℝ) (ha : Summable a) (m : ℕ)
    (δ : ℝ) (hδ : 0 < δ)
    (hearlier : |∑ i ∈ Finset.range m, a i| < δ / 4)
    (hlater : ∀ n : ℕ, m < n → |a n| ≤ δ * (1 / 2 : ℝ) ^ (n + 3)) :
    |(∑' n : ℕ, a n) - a m| < 3 * δ / 8 := by
  have hsplit : (∑' n : ℕ, a n) - a m =
      (∑ i ∈ Finset.range m, a i) + ∑' k : ℕ, a (k + (m + 1)) := by
    rw [← Summable.sum_add_tsum_nat_add (m + 1) ha, Finset.sum_range_succ]
    ring
  rw [hsplit]
  calc
    _ ≤ |∑ i ∈ Finset.range m, a i| + |∑' k : ℕ, a (k + (m + 1))| := abs_add_le _ _
    _ < δ / 4 + δ / 8 :=
      add_lt_add_of_lt_of_le hearlier (later_series_bound a m δ hδ.le hlater)
    _ = _ := by ring

/-- A perturbation smaller than a nonzero value preserves its sign. -/
theorem mul_pos_of_abs_sub_lt {a b : ℝ} (h : |a - b| < |b|) : 0 < a * b := by
  rcases lt_trichotomy b 0 with hb | hb | hb
  · rw [abs_of_neg hb] at h
    have ha : a < 0 := by linarith [(abs_lt.mp h).2]
    exact mul_pos_of_neg_of_neg ha hb
  · subst b
    simp only [sub_zero, abs_zero] at h
    exact False.elim ((abs_nonneg a).not_gt h)
  · rw [abs_of_pos hb] at h
    have ha : 0 < a := by linarith [(abs_lt.mp h).1]
    exact mul_pos ha hb

/-- Opposite signs at two endpoints give a zero strictly between them. -/
theorem exists_zero_between {f : ℝ → ℝ} (hf : Continuous f) {a b : ℝ}
    (hab : a < b) (hsign : f a * f b < 0) :
    ∃ z : ℝ, z ∈ Ioo a b ∧ f z = 0 := by
  rcases mul_neg_iff.mp hsign with h | h
  · exact intermediate_value_Ioo' hab.le hf.continuousOn ⟨h.2, h.1⟩
  · exact intermediate_value_Ioo hab.le hf.continuousOn ⟨h.1, h.2⟩

/-- The zeros in consecutive open unit intervals are distinct and ordered. -/
theorem ordered_zero_witnesses (f : ℝ → ℝ) (hf : Continuous f)
    (N : ℕ) (a : ℝ)
    (hsign : ∀ j : Fin N, f (a + (j.val : ℝ)) * f (a + (j.val : ℝ) + 1) < 0) :
    ∃ z : Fin N → ℝ, StrictMono z ∧
      ∀ j : Fin N, z j ∈ Ioo (a + (j.val : ℝ)) (a + (j.val : ℝ) + 1) ∧
        f (z j) = 0 := by
  have hex (j : Fin N) : ∃ z : ℝ,
      z ∈ Ioo (a + (j.val : ℝ)) (a + (j.val : ℝ) + 1) ∧ f z = 0 :=
    exists_zero_between hf (by linarith) (hsign j)
  let z : Fin N → ℝ := fun j => Classical.choose (hex j)
  have hz (j : Fin N) :
      z j ∈ Ioo (a + (j.val : ℝ)) (a + (j.val : ℝ) + 1) ∧ f (z j) = 0 :=
    Classical.choose_spec (hex j)
  refine ⟨z, ?_, hz⟩
  intro i j hij
  have hnat : i.val + 1 ≤ j.val := hij
  have hreal : (i.val : ℝ) + 1 ≤ j.val := by exact_mod_cast hnat
  linarith [(hz i).1.2, (hz j).1.1]

end

end Grochenig
