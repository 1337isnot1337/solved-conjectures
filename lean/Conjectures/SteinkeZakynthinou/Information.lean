module

public import Mathlib.InformationTheory.KullbackLeibler.KLFun
public import Mathlib.Algebra.Order.BigOperators.Group.Finset
public import Mathlib.Tactic.FieldSimp
public import Mathlib.Tactic.Linarith
public import Mathlib.Tactic.Positivity
public import Mathlib.Tactic.Ring

/-! Finite relative entropy estimates used for the paired selector. -/

@[expose] public section

open scoped BigOperators

namespace SteinkeZakynthinou

noncomputable def relativeTerm (p q : ℝ) : ℝ :=
  q * InformationTheory.klFun (p / q)

theorem relativeTerm_nonneg {p q : ℝ} (hp : 0 ≤ p) (hq : 0 ≤ q) :
    0 ≤ relativeTerm p q :=
  mul_nonneg hq (InformationTheory.klFun_nonneg (div_nonneg hp hq))

theorem relativeTerm_eq {p q : ℝ} (h : q = 0 → p = 0) :
    relativeTerm p q = p * Real.log (p / q) + q - p := by
  by_cases hq : q = 0
  · simp [hq, h hq, relativeTerm]
  · rw [relativeTerm, InformationTheory.klFun_apply]
    field_simp

theorem relativeTerm_scale (a p q : ℝ) :
    relativeTerm (a * p) (a * q) = a * relativeTerm p q := by
  by_cases ha : a = 0
  · simp [ha, relativeTerm]
  · unfold relativeTerm
    rw [mul_div_mul_left _ _ ha, mul_assoc]

/-- Scalar log-sum inequality in homogeneous form, including zero masses. -/
theorem relativeTerm_add_le {p q r s : ℝ} (hp : 0 ≤ p) (hq : 0 ≤ q)
    (hr : 0 ≤ r) (hs : 0 ≤ s) (hpq : q = 0 → p = 0) (hrs : s = 0 → r = 0) :
    relativeTerm (p + r) (q + s) ≤ relativeTerm p q + relativeTerm r s := by
  rcases hq.eq_or_lt with hq | hq
  · simp [← hq, hpq hq.symm, relativeTerm]
  rcases hs.eq_or_lt with hs | hs
  · simp [← hs, hrs hs.symm, relativeTerm]
  have ht : 0 < q + s := add_pos hq hs
  have hab : q / (q + s) + s / (q + s) = 1 := by
    rw [← add_div, div_self ht.ne']
  have hv := InformationTheory.convexOn_klFun.2
    (show p / q ∈ Set.Ici (0 : ℝ) by exact div_nonneg hp hq.le)
    (show r / s ∈ Set.Ici (0 : ℝ) by exact div_nonneg hr hs.le)
    (div_nonneg hq.le ht.le) (div_nonneg hs.le ht.le) hab
  simp only [smul_eq_mul] at hv
  have he : q / (q + s) * (p / q) + s / (q + s) * (r / s) =
      (p + r) / (q + s) := by
    field_simp
  rw [he] at hv
  have hw := mul_le_mul_of_nonneg_left hv ht.le
  unfold relativeTerm
  convert hw using 1
  rw [mul_add]
  congr 1
  · rw [← mul_assoc, mul_comm (q + s) (q / (q+s)), div_mul_cancel₀ _ ht.ne']
  · rw [← mul_assoc, mul_comm (q + s) (s / (q+s)), div_mul_cancel₀ _ ht.ne']

theorem relativeTerm_sum_le {α : Type*} (u : Finset α) (p q : α → ℝ)
    (hp : ∀ i ∈ u, 0 ≤ p i) (hq : ∀ i ∈ u, 0 ≤ q i)
    (h : ∀ i ∈ u, q i = 0 → p i = 0) :
    relativeTerm (∑ i ∈ u, p i) (∑ i ∈ u, q i) ≤
      ∑ i ∈ u, relativeTerm (p i) (q i) := by
  classical
  induction u using Finset.induction_on with
  | empty => simp [relativeTerm]
  | insert a u ha ih =>
    rw [Finset.sum_insert ha, Finset.sum_insert ha, Finset.sum_insert ha]
    have hi := Finset.mem_insert_self a u
    have hu {i : α} (hi : i ∈ u) : i ∈ insert a u := Finset.mem_insert_of_mem hi
    have hqu : 0 ≤ ∑ i ∈ u, q i := Finset.sum_nonneg fun i hi => hq i (hu hi)
    have hpu : 0 ≤ ∑ i ∈ u, p i := Finset.sum_nonneg fun i hi => hp i (hu hi)
    have hz (he : ∑ i ∈ u, q i = 0) : ∑ i ∈ u, p i = 0 := by
      apply Finset.sum_eq_zero
      intro i hi
      exact h i (hu hi) ((Finset.sum_eq_zero_iff_of_nonneg
        (fun j hj => hq j (hu hj))).mp he i hi)
    exact (relativeTerm_add_le (hp a hi) (hq a hi) hpu hqu (h a hi) hz).trans
      (add_le_add_right (ih (fun i hi => hp i (hu hi)) (fun i hi => hq i (hu hi))
        (fun i hi => h i (hu hi))) _)

/-- A single output's contribution to the equal-mixture Jensen–Shannon divergence. -/
noncomputable def jsTerm (p q : ℝ) : ℝ :=
  (relativeTerm p ((p + q) / 2) + relativeTerm q ((p + q) / 2)) / 2

theorem jsTerm_nonneg {p q : ℝ} (hp : 0 ≤ p) (hq : 0 ≤ q) :
    0 ≤ jsTerm p q :=
  div_nonneg (add_nonneg (relativeTerm_nonneg hp (by positivity))
    (relativeTerm_nonneg hq (by positivity))) (by norm_num)

theorem jsTerm_eq {p q : ℝ} (hp : 0 ≤ p) (hq : 0 ≤ q) :
    jsTerm p q = (p * Real.log (p / ((p + q) / 2)) +
      q * Real.log (q / ((p + q) / 2))) / 2 := by
  rw [jsTerm, relativeTerm_eq (by intro h; linarith), relativeTerm_eq (by intro h; linarith)]
  ring

theorem jsTerm_zero_right {p : ℝ} (hp : 0 ≤ p) :
    jsTerm p 0 = p * Real.log 2 / 2 := by
  rcases hp.eq_or_lt with hp | hp
  · simp [← hp, jsTerm, relativeTerm]
  rw [jsTerm_eq hp.le le_rfl, add_zero, zero_mul, add_zero]
  have he : p / (p / 2) = 2 := by field_simp
  rw [he]

theorem jsTerm_comm (p q : ℝ) : jsTerm p q = jsTerm q p := by
  unfold jsTerm
  rw [add_comm p q, add_comm (relativeTerm p _)]

/-- The shared-support contribution is quadratic in the log likelihood ratio. -/
theorem jsTerm_le_log_sq {p q : ℝ} (hp : 0 < p) (hq : 0 < q) :
    jsTerm p q ≤ (p + q) * (Real.log p - Real.log q) ^ 2 / 2 := by
  let m := (p + q) / 2
  have hm : 0 < m := by dsimp [m]; positivity
  have h₁ := mul_le_mul_of_nonneg_left (Real.log_le_sub_one_of_pos (div_pos hp hm)) hp.le
  have h₂ := mul_le_mul_of_nonneg_left (Real.log_le_sub_one_of_pos (div_pos hq hm)) hq.le
  have halg : (p * (p / m - 1) + q * (q / m - 1)) / 2 = (p - q)^2 / (2 * (p + q)) := by
    dsimp [m]
    field_simp
    ring
  have h : |p - q| ≤ (p + q) * |Real.log p - Real.log q| := by
    clear h₁ h₂ halg hm m
    wlog hpq : q ≤ p
    · simpa only [abs_sub_comm, add_comm] using this hq hp (le_of_not_ge hpq)
    have hl : 0 ≤ Real.log p - Real.log q :=
      sub_nonneg.mpr (Real.log_le_log hq hpq)
    rw [abs_of_nonneg (sub_nonneg.mpr hpq), abs_of_nonneg hl]
    have hh := Real.log_le_sub_one_of_pos (div_pos hq hp)
    rw [Real.log_div hq.ne' hp.ne'] at hh
    have hh' := mul_le_mul_of_nonneg_left hh hp.le
    rw [mul_sub p (q / p) 1, ← mul_div_assoc, mul_div_cancel_left₀ _ hp.ne', mul_one] at hh'
    calc
      _ ≤ p * (Real.log p - Real.log q) := by linarith
      _ ≤ _ := mul_le_mul_of_nonneg_right (by linarith) hl
  have hs : (p - q)^2 ≤ ((p + q) * |Real.log p - Real.log q|)^2 := by
    rw [← sq_abs (p - q)]
    exact pow_le_pow_left₀ (abs_nonneg _) h _
  rw [mul_pow, sq_abs] at hs
  calc
    _ ≤ (p * (p / m - 1) + q * (q / m - 1)) / 2 := by
      rw [jsTerm_eq hp.le hq.le]
      exact div_le_div_of_nonneg_right (add_le_add h₁ h₂) (by norm_num)
    _ = _ := halg
    _ ≤ _ := by
      rw [div_le_iff₀ (by positivity : 0 < 2 * (p + q))]
      convert hs using 1
      ring

end SteinkeZakynthinou

namespace SteinkeZakynthinou

noncomputable def entropyTerm (p : ℝ) : ℝ := p * Real.log p

theorem jsTerm_entropy {p q : ℝ} (hp : 0 ≤ p) (hq : 0 ≤ q) :
    jsTerm p q = (entropyTerm p + entropyTerm q) / 2 - entropyTerm ((p + q) / 2) := by
  rcases (add_nonneg hp hq).eq_or_lt with he | he
  · have hp0 : p = 0 := by linarith
    have hq0 : q = 0 := by linarith
    simp [hp0, hq0, jsTerm, relativeTerm, entropyTerm]
  have hmid : 0 < (p + q) / 2 := by positivity
  have hlog (x : ℝ) :
      x * Real.log (x / ((p + q) / 2)) =
        entropyTerm x - x * Real.log ((p + q) / 2) := by
    by_cases hz : x = 0
    · simp [hz, entropyTerm]
    rw [entropyTerm, Real.log_div hz hmid.ne', mul_sub]
  rw [jsTerm_eq hp hq, hlog, hlog]
  unfold entropyTerm
  ring

theorem jsTerm_sum_le {α : Type*} (u : Finset α) (p q : α → ℝ)
    (hp : ∀ i ∈ u, 0 ≤ p i) (hq : ∀ i ∈ u, 0 ≤ q i) :
    jsTerm (∑ i ∈ u, p i) (∑ i ∈ u, q i) ≤ ∑ i ∈ u, jsTerm (p i) (q i) := by
  let m := fun i => (p i + q i) / 2
  have hm : ∀ i ∈ u, 0 ≤ m i := by intro i hi; dsimp [m]; linarith [hp i hi, hq i hi]
  have he : (∑ i ∈ u, p i + ∑ i ∈ u, q i) / 2 = ∑ i ∈ u, m i := by
    rw [← Finset.sum_add_distrib, Finset.sum_div]
  have h₁ := relativeTerm_sum_le u p m hp hm (fun i hi h => by
    dsimp [m] at h; linarith [hp i hi, hq i hi])
  have h₂ := relativeTerm_sum_le u q m hq hm (fun i hi h => by
    dsimp [m] at h; linarith [hp i hi, hq i hi])
  unfold jsTerm
  rw [he]
  calc
    _ ≤ ((∑ i ∈ u, relativeTerm (p i) (m i)) + ∑ i ∈ u, relativeTerm (q i) (m i)) / 2 :=
      div_le_div_of_nonneg_right (add_le_add h₁ h₂) (by norm_num : (0 : ℝ) ≤ 2)
    _ = _ := by rw [← Finset.sum_add_distrib, Finset.sum_div]

theorem jsTerm_scale (a p q : ℝ) :
    jsTerm (a * p) (a * q) = a * jsTerm p q := by
  unfold jsTerm
  rw [← mul_add, mul_div_assoc, relativeTerm_scale, relativeTerm_scale]
  ring

end SteinkeZakynthinou
