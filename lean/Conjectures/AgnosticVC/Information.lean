module

public import Conjectures.SteinkeZakynthinou.Channel

/-! The selector-information inequality for the agnostic VC learner, in nats. -/

@[expose] public section

open scoped BigOperators

namespace AgnosticVC

open SteinkeZakynthinou
open SteinkeZakynthinou.Learner (selectorMean)

/-- Squared Hellinger distance without the factor of one half. -/
noncomputable def hellingerSq {α : Type*} [Fintype α] (p q : α → ℝ) : ℝ :=
  ∑ a, (Real.sqrt (p a) - Real.sqrt (q a)) ^ 2

theorem hellingerSq_nonneg {α : Type*} [Fintype α] (p q : α → ℝ) :
    0 ≤ hellingerSq p q :=
  Finset.sum_nonneg fun _ _ => sq_nonneg _

theorem hellingerSq_triangle {α : Type*} [Fintype α] (p q r : α → ℝ) :
    hellingerSq p q ≤ 2 * (hellingerSq p r + hellingerSq q r) := by
  unfold hellingerSq
  rw [← Finset.sum_add_distrib, Finset.mul_sum]
  exact Finset.sum_le_sum fun a _ => by
    nlinarith [sq_nonneg (Real.sqrt (p a) + Real.sqrt (q a) - 2 * Real.sqrt (r a))]

private theorem weighted_log_le {p m : ℝ} (hp : 0 ≤ p) (hm : 0 < m) :
    p * Real.log (p / m) ≤ p * (p / m - 1) := by
  rcases hp.eq_or_lt with h | h
  · simp [← h]
  exact mul_le_mul_of_nonneg_left (Real.log_le_sub_one_of_pos (div_pos h hm)) h.le

/-- The pointwise inequality also covers outputs present on only one side of a deletion. -/
theorem jsTerm_le_sqrt_sub_sq {p q : ℝ} (hp : 0 ≤ p) (hq : 0 ≤ q) :
    jsTerm p q ≤ (Real.sqrt p - Real.sqrt q)^2 := by
  by_cases h : p + q = 0
  · have hp0 : p = 0 := by linarith
    have hq0 : q = 0 := by linarith
    simp [hp0, hq0, jsTerm_zero_right]
  have hs : 0 < p + q := lt_of_le_of_ne (add_nonneg hp hq) (Ne.symm h)
  have hm : 0 < (p + q) / 2 := by positivity
  have hsquares : (Real.sqrt p + Real.sqrt q)^2 ≤ 2 * (p+q) := by
    nlinarith [Real.sq_sqrt hp, Real.sq_sqrt hq, sq_nonneg (Real.sqrt p - Real.sqrt q)]
  have hdiff : p - q = (Real.sqrt p - Real.sqrt q) * (Real.sqrt p + Real.sqrt q) := by
    nlinarith [Real.sq_sqrt hp, Real.sq_sqrt hq]
  rw [jsTerm_eq hp hq]
  calc
    _ ≤ (p * (p / ((p+q)/2) - 1) + q * (q / ((p+q)/2) - 1)) / 2 :=
      div_le_div_of_nonneg_right (add_le_add (weighted_log_le hp hm) (weighted_log_le hq hm))
        (by norm_num)
    _ = (p - q)^2 / (2*(p+q)) := by field_simp; ring
    _ ≤ _ := by
      rw [div_le_iff₀ (by positivity), hdiff, mul_pow]
      exact mul_le_mul_of_nonneg_left hsquares (sq_nonneg _)

/-- Information in the output channel is controlled by deleting either member
of each row from a common law. Output names are indexed identically in all laws. -/
theorem channelInfo_le_deletionCharges {n : ℕ} {α : Type*} [Fintype α]
    (p : Selector n → α → ℝ) (hp : ∀ s a, 0 ≤ p s a)
    (full : Fin n → Selector n → α → ℝ) :
    channelInfo p ≤ ∑ i : Fin n, selectorMean (fun s =>
      2 * (hellingerSq (p (Function.update s i false)) (full i s) +
        hellingerSq (p (Function.update s i true)) (full i s))) := by
  refine (channelInfo_le_js p hp).trans (Finset.sum_le_sum fun i _ =>
    selectorMean_mono fun s => ?_)
  exact (Finset.sum_le_sum fun a _ => jsTerm_le_sqrt_sub_sq (hp _ a) (hp _ a)).trans
    (hellingerSq_triangle _ _ (full i s))

end AgnosticVC
