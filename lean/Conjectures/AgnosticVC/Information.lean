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

private theorem selectorMean_update_add {n : ℕ} (f : Selector n → ℝ) (i : Fin n) :
    selectorMean (fun s => f (Function.update s i false) + f (Function.update s i true)) =
      2 * selectorMean f := by
  let flip (s : Selector n) : Selector n := Function.update s i (!(s i))
  have hf : Function.Involutive flip := by
    intro s
    funext j
    by_cases h : j = i
    · subst j
      simp [flip]
    · simp [flip, Function.update_of_ne h]
  let e : Selector n ≃ Selector n := ⟨flip, flip, hf, hf⟩
  have hmean : selectorMean (fun s => f (flip s)) = selectorMean f := by
    unfold selectorMean
    rw [Fintype.sum_equiv e (fun s => f (flip s)) f (fun _ => rfl)]
  have hsum (s : Selector n) : f (Function.update s i false) + f (Function.update s i true) =
      f s + f (flip s) := by
    cases h : s i with
    | false => simp [flip, h, show Function.update s i false = s by simp [h]]
    | true => simp [flip, h, show Function.update s i true = s by simp [h], add_comm]
  simp_rw [hsum]
  rw [selectorMean_add, hmean, two_mul]

/-- Compare both choices in each row with the law on the same deleted sample. Averaging
over the fair bit then charges the two comparisons to the respective selected samples. -/
theorem channelInfo_le_commonDeletion {n : ℕ} {α : Type*} [Fintype α]
    (p : Selector n → α → ℝ) (hp : ∀ s a, 0 ≤ p s a)
    (deleted : Fin n → Selector n → α → ℝ) (charge : Fin n → Selector n → ℝ)
    (B : ℝ) (hbudget : ∀ s, ∑ i, charge i s ≤ B)
    (hcharge : ∀ i s b, hellingerSq (p (Function.update s i b)) (deleted i s) ≤
      charge i (Function.update s i b)) : channelInfo p ≤ 4 * B := by
  calc
    _ ≤ ∑ i : Fin n, selectorMean (fun s => 2 *
        (charge i (Function.update s i false) + charge i (Function.update s i true))) :=
      (channelInfo_le_deletionCharges p hp deleted).trans
        (Finset.sum_le_sum fun i _ => selectorMean_mono fun s => by
          linarith only [hcharge i s false, hcharge i s true])
    _ = 4 * selectorMean (fun s => ∑ i, charge i s) := by
      rw [average_coordinate_sum, Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro i _
      simp_rw [show ∀ a : ℝ, 2 * a = a * 2 by intro; ring,
        selectorMean_mul_const, selectorMean_update_add]
      ring
    _ ≤ 4 * B := by
      rw [← selectorMean_const (n := n) B]
      exact mul_le_mul_of_nonneg_left (selectorMean_mono hbudget) (by norm_num)

/-- A coarse bound for the case where dimension equals the sample size. -/
theorem channelInfo_le_two_mul_size {n : ℕ} {α : Type*} [Fintype α]
    (p : Selector n → α → ℝ) (hp : ∀ s a, 0 ≤ p s a) (hm : ∀ s, ∑ a, p s a = 1) :
    channelInfo p ≤ 2 * n := by
  refine (channelInfo_le_js p hp).trans ?_
  calc
    _ ≤ ∑ _ : Fin n, (2 : ℝ) := Finset.sum_le_sum fun i _ => by
      rw [← selectorMean_const (n := n) (2 : ℝ)]
      apply selectorMean_mono
      intro s
      let u := Function.update s i false
      let v := Function.update s i true
      calc
        _ ≤ ∑ a, (Real.sqrt (p u a) - Real.sqrt (p v a))^2 :=
          Finset.sum_le_sum fun a _ => jsTerm_le_sqrt_sub_sq (hp u a) (hp v a)
        _ ≤ ∑ a, (p u a + p v a) := Finset.sum_le_sum fun a _ => by
          nlinarith only [Real.sq_sqrt (hp u a), Real.sq_sqrt (hp v a),
            mul_nonneg (Real.sqrt_nonneg (p u a)) (Real.sqrt_nonneg (p v a))]
        _ = 2 := by rw [Finset.sum_add_distrib, hm, hm]; norm_num
    _ = _ := by simp [mul_comm]

end AgnosticVC
