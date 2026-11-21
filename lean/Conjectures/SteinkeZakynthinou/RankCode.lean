module

public import Conjectures.SteinkeZakynthinou.Channel

/-! Information cost of revealing the first selected entry of an ordered query. -/

@[expose] public section

open scoped BigOperators

namespace SteinkeZakynthinou

open Learner (selectorMean)

/-- A finite change-of-measure estimate for a nonnegative likelihood
over the fair selector and a strictly positive comparison weight. -/
theorem selectorMean_mul_log_le_gap {n : ℕ} (f w : Selector n → ℝ)
    (hf : ∀ s, 0 ≤ f s) (hw : ∀ s, 0 < w s) :
    selectorMean (fun s => f s * Real.log (w s)) ≤
      entropyGap f + selectorMean f * Real.log (selectorMean w) := by
  let a := selectorMean f
  let b := selectorMean w
  have ha : 0 ≤ a := selectorMean_nonneg hf
  have hb : 0 < b := by
    unfold b selectorMean
    exact div_pos (Finset.sum_pos (fun s _ => hw s) Finset.univ_nonempty) (by positivity)
  rcases ha.eq_or_lt with ha0 | ha
  · have hf0 (s : Selector n) : f s = 0 :=
      eq_zero_of_selectorMean_eq_zero hf ha0.symm s
    have he : selectorMean f = 0 := ha0.symm
    simp [entropyGap, hf0, he, selectorMean_const, entropyTerm]
  let r := fun s => (a / b) * w s
  have hr : ∀ s, 0 < r s := fun s => mul_pos (div_pos ha hb) (hw s)
  have hm : selectorMean r = a := by
    have he : r = fun s => w s * (a / b) := by
      funext s
      exact mul_comm _ _
    rw [he, selectorMean_mul_const]
    change b * (a / b) = a
    rw [mul_comm b, div_mul_cancel₀ _ hb.ne']
  have hde (s : Selector n) :
      relativeTerm (f s) (r s) =
        entropyTerm (f s) - f s * (Real.log a - Real.log b) - f s * Real.log (w s) +
          r s - f s := by
    rw [relativeTerm_eq (fun h => (hr s).ne' h |>.elim)]
    by_cases hz : f s = 0
    · simp [hz, entropyTerm]
    rw [entropyTerm, Real.log_div hz (hr s).ne']
    have hlog : Real.log (r s) = Real.log a - Real.log b + Real.log (w s) := by
      dsimp [r]
      rw [Real.log_mul (div_pos ha hb).ne' (hw s).ne', Real.log_div ha.ne' hb.ne']
    rw [hlog]
    ring
  have hnonneg : 0 ≤ selectorMean (fun s => relativeTerm (f s) (r s)) :=
    selectorMean_nonneg (fun s => relativeTerm_nonneg (hf s) (hr s).le)
  simp only [hde, selectorMean_add, selectorMean_sub, selectorMean_mul_const, hm] at hnonneg
  change 0 ≤ selectorMean (fun s => entropyTerm (f s)) -
    a * (Real.log a - Real.log b) - selectorMean (fun s => f s * Real.log (w s)) + a - a at hnonneg
  unfold entropyGap
  change _ ≤ selectorMean (fun s => entropyTerm (f s)) - a * Real.log a + a * Real.log b
  linarith

noncomputable def revealRank {n : ℕ} {α : Type*} {d : ℕ}
    (p : Selector n → α → ℝ) (k : Selector n → α → Fin d)
    (s : Selector n) (ak : α × Fin d) : ℝ :=
  if ak.2 = k s ak.1 then p s ak.1 else 0

/-- An adaptive rank has bounded information once its exponential moment
is controlled for an independent fair selector. -/
theorem channelInfo_revealRank_le {n d : ℕ} {α : Type*} [Fintype α]
    (p : Selector n → α → ℝ) (hp : ∀ s a, 0 ≤ p s a) (hsum : ∀ s, ∑ a, p s a = 1)
    (k : Selector n → α → Fin d)
    (hmoment : ∀ a, selectorMean (fun s => (3 / 2 : ℝ) ^ (k s a).val) ≤ 4) :
    channelInfo (revealRank p k) ≤ 2 * channelInfo p + Real.log 4 + Real.log 3 := by
  classical
  let w := fun i : Fin d => (3 / 2 : ℝ) ^ i.val
  let q := fun a => selectorMean (fun s => p s a)
  let r := fun ai : α × Fin d => q ai.1 * (1 / (3 * w ai.2))
  have hw : ∀ i, 0 < w i := by intro i; unfold w; positivity
  have hq : ∀ a, 0 ≤ q a := fun a => selectorMean_nonneg (fun s => hp s a)
  have hr : ∀ ai, 0 ≤ r ai := fun ai =>
    mul_nonneg (hq ai.1) (by have h := hw ai.2; positivity)
  have hqp {s : Selector n} {a : α} (h : p s a ≠ 0) : q a ≠ 0 :=
    fun he => h (eq_zero_of_selectorMean_eq_zero (fun s => hp s a) he s)
  have hz : ∀ s ai, r ai = 0 → revealRank p k s ai = 0 := by
    intro s ai h
    have hqa : q ai.1 = 0 := (mul_eq_zero.mp h).resolve_right
      (by have h := hw ai.2; positivity)
    simp [revealRank, eq_zero_of_selectorMean_eq_zero (fun s => hp s ai.1) hqa s]
  have hnonneg : ∀ s ai, 0 ≤ revealRank p k s ai := by
    intro s ai
    unfold revealRank
    split
    · exact hp s _
    · exact le_rfl
  have hqsum : ∑ a, q a = 1 := by
    unfold q
    rw [← selectorMean_sum]
    simp [hsum, selectorMean_const]
  have hrank : (∑ i : Fin d, (1 / (3 * w i))) ≤ 1 := by
    have he (i : ℕ) : 1 / (3 * (3 / 2 : ℝ)^i) = (2 / 3 : ℝ)^i / 3 := by
      rw [one_div, mul_inv, ← inv_pow]
      norm_num
      ring
    simp only [w, he, Fin.sum_univ_eq_sum_range, ← Finset.sum_div]
    have hh (m : ℕ) : (∑ i ∈ Finset.range m, (2 / 3 : ℝ)^i) = 3 * (1 - (2 / 3 : ℝ)^m) := by
      induction m with
      | zero => norm_num
      | succ m ih =>
        rw [Finset.sum_range_succ, ih, pow_succ]
        ring
    rw [hh]
    have hh0 : 0 ≤ (2 / 3 : ℝ)^d := by positivity
    linarith
  have hrsum : (∑ ai, r ai) ≤ 1 := by
    simp only [Fintype.sum_prod_type, r, ← Finset.mul_sum]
    rw [← Finset.sum_mul, hqsum, one_mul]
    exact hrank
  have hsum_log (s : Selector n) :
      (∑ ai, relativeTerm (revealRank p k s ai) (r ai)) ≤
      (∑ a, relativeTerm (p s a) (q a)) + (∑ a, p s a * Real.log (w (k s a))) + Real.log 3 := by
    have he (a : α) (i : Fin d) :
        relativeTerm (revealRank p k s (a, i)) (r (a, i)) =
          (if i = k s a then relativeTerm (p s a) (q a) - q a +
            p s a * (Real.log (w i) + Real.log 3) else 0) + r (a, i) := by
      by_cases hi : i = k s a
      · simp only [revealRank, hi, ite_eq_left]
        by_cases hh : p s a = 0
        · simp [hh, relativeTerm, InformationTheory.klFun_zero]
        have hqa := hqp hh
        have hra : r (a, k s a) ≠ 0 :=
          mul_ne_zero hqa (by have h := hw (k s a); positivity)
        have hd : p s a / r (a, k s a) = (p s a / q a) * (3 * w (k s a)) := by
          dsimp [r]
          field_simp [hqa, (hw (k s a)).ne']
        rw [relativeTerm_eq (fun hz => (hra hz).elim),
          relativeTerm_eq (fun hz => (hqa hz).elim), hd,
          Real.log_mul (div_ne_zero hh hqa) (mul_ne_zero (by norm_num) (hw (k s a)).ne'),
          Real.log_mul (by norm_num : (3 : ℝ) ≠ 0) (hw (k s a)).ne']
        ring
      · simp [revealRank, hi, relativeTerm, InformationTheory.klFun_zero]
    rw [Fintype.sum_prod_type]
    simp only [he, Finset.sum_add_distrib, Finset.sum_ite_eq', Finset.mem_univ, ite_true,
      sub_add, mul_add]
    simp only [Finset.sum_add_distrib, Finset.sum_sub_distrib, hqsum, ← Finset.sum_mul, hsum s, one_mul]
    rw [← Fintype.sum_prod_type r]
    linarith
  have hmean (a : α) :
      selectorMean (fun s => p s a * Real.log (w (k s a))) ≤
        entropyGap (fun s => p s a) + q a * Real.log 4 := by
    have hpw (s : Selector n) : 0 < w (k s a) := hw _
    have hb : 0 < selectorMean (fun s => w (k s a)) := by
      unfold selectorMean
      exact div_pos (Finset.sum_pos (fun s _ => hpw s) Finset.univ_nonempty) (by positivity)
    exact (selectorMean_mul_log_le_gap _ _ (fun s => hp s a) hpw).trans
      (add_le_add_right (mul_le_mul_of_nonneg_left (Real.log_le_log hb (hmoment a)) (hq a)) _)
  calc
    _ ≤ selectorMean (fun s => ∑ ai, relativeTerm (revealRank p k s ai) (r ai)) :=
      channelInfo_le_reference _ hnonneg r hr hz
    _ ≤ selectorMean (fun s => (∑ a, relativeTerm (p s a) (q a)) +
        (∑ a, p s a * Real.log (w (k s a))) + Real.log 3) := selectorMean_mono hsum_log
    _ = channelInfo p + (∑ a, selectorMean (fun s => p s a * Real.log (w (k s a)))) +
        Real.log 3 := by
      rw [selectorMean_add, selectorMean_add, selectorMean_const, selectorMean_sum (f := fun s a =>
        p s a * Real.log (w (k s a))), channelInfo_eq p hp]
    _ ≤ _ := by
      have h := Finset.sum_le_sum (fun a (_ : a ∈ Finset.univ) => hmean a)
      rw [Finset.sum_add_distrib, ← Finset.sum_mul, hqsum, one_mul, ← channelInfo] at h
      linarith

end SteinkeZakynthinou
