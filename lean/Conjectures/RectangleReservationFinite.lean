import Conjectures.RectangleParameters
import Conjectures.RectangleLogBounds
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Ring

/-! Exact budgets for the two reservations, and their floor losses. No
asymptotic hypothesis is used in this finite bookkeeping module. -/

namespace RectangleAsymptotics

open Finset

noncomputable def idealQ (ε : ℝ) (h w a : ℕ) : ℝ :=
  if smallAspect ε h w then (h : ℝ)/(L ε h w*(a : ℝ)^2) else (h : ℝ)/(a : ℝ)

noncomputable def idealB (ε : ℝ) (h w a : ℕ) : ℝ :=
  if smallAspect ε h w then (w : ℝ) else (w : ℝ)/(L ε h w*(a : ℝ))

theorem Q_eq_floor_ideal (ε : ℝ) (h w a : ℕ) : Q ε h w a=⌊idealQ ε h w a⌋₊ := by
  by_cases hs : smallAspect ε h w <;> simp [Q,idealQ,hs]

theorem B_eq_floor_ideal (ε : ℝ) (h w a : ℕ) : B ε h w a=⌊idealB ε h w a⌋₊ := by
  by_cases hs : smallAspect ε h w <;> simp [B,idealB,hs]

theorem idealQ_nonneg (ε : ℝ) (h w a : ℕ) (hL : 0 ≤ L ε h w) : 0 ≤ idealQ ε h w a := by
  unfold idealQ
  split <;> positivity

theorem idealB_nonneg (ε : ℝ) (h w a : ℕ) (hL : 0 ≤ L ε h w) : 0 ≤ idealB ε h w a := by
  unfold idealB
  split <;> positivity

theorem ideal_product (ε : ℝ) (h w a : ℕ) (hL : 0 < L ε h w) (ha : 0 < a) :
    idealQ ε h w a*idealB ε h w a=area h w/(L ε h w*(a : ℝ)^2) := by
  have haR : (0 : ℝ) < a := by exact_mod_cast ha
  by_cases hs : smallAspect ε h w
  · simp only [idealQ,idealB,if_pos hs,area,Nat.cast_mul]
    field_simp
  · simp only [idealQ,idealB,if_neg hs,area,Nat.cast_mul]
    field_simp

theorem cap_le_width (ε : ℝ) (h w a : ℕ) (hε : ε ≤ 1) : C ε h w a ≤ B ε h w a := by
  apply Nat.floor_le_of_le
  nlinarith [show (0 : ℝ) ≤ B ε h w a by positivity]

theorem small_height_budget (ε : ℝ) (h w : ℕ) (hs : smallAspect ε h w)
    (hL : 0 < L ε h w) (hpos : ∀ a ∈ active ε h w,0 < a) :
    (∑ a ∈ active ε h w,a*Q ε h w a) ≤ h := by
  have hterm : ∀ a ∈ active ε h w,
      (a : ℝ)*(Q ε h w a : ℝ) ≤ ((h : ℝ)/L ε h w)*(1/(a : ℝ)) := by
    intro a ha
    have haR : (0 : ℝ) < a := by exact_mod_cast hpos a ha
    have hf := Nat.floor_le (show 0 ≤ (h : ℝ)/(L ε h w*(a : ℝ)^2) by positivity)
    calc
      (a : ℝ)*(Q ε h w a : ℝ) ≤ (a : ℝ)*((h : ℝ)/(L ε h w*(a : ℝ)^2)) := by
        simpa only [Q,if_pos hs] using mul_le_mul_of_nonneg_left hf haR.le
      _ = ((h : ℝ)/L ε h w)*(1/(a : ℝ)) := by field_simp
  have hh : (∑ a ∈ active ε h w,(a : ℝ)*(Q ε h w a : ℝ)) ≤ h := by
    calc
      _ ≤ ∑ a ∈ active ε h w,((h : ℝ)/L ε h w)*(1/(a : ℝ)) := sum_le_sum hterm
      _ = ((h : ℝ)/L ε h w)*L ε h w := by rw [← mul_sum]; rfl
      _ = h := div_mul_cancel₀ _ (ne_of_gt hL)
  exact_mod_cast hh

theorem large_column_budget (ε : ℝ) (h w : ℕ) (hs : ¬ smallAspect ε h w)
    (hL : 0 < L ε h w) (hpos : ∀ a ∈ active ε h w,0 < a) :
    (∑ a ∈ active ε h w,B ε h w a) ≤ w := by
  have hterm : ∀ a ∈ active ε h w,
      (B ε h w a : ℝ) ≤ ((w : ℝ)/L ε h w)*(1/(a : ℝ)) := by
    intro a ha
    have haR : (0 : ℝ) < a := by exact_mod_cast hpos a ha
    have hf := Nat.floor_le (show 0 ≤ (w : ℝ)/(L ε h w*(a : ℝ)) by positivity)
    calc
      (B ε h w a : ℝ) ≤ (w : ℝ)/(L ε h w*(a : ℝ)) := by simpa only [B,if_neg hs] using hf
      _ = ((w : ℝ)/L ε h w)*(1/(a : ℝ)) := by field_simp
  have hh : (∑ a ∈ active ε h w,(B ε h w a : ℝ)) ≤ w := by
    calc
      _ ≤ ∑ a ∈ active ε h w,((w : ℝ)/L ε h w)*(1/(a : ℝ)) := sum_le_sum hterm
      _ = ((w : ℝ)/L ε h w)*L ε h w := by rw [← mul_sum]; rfl
      _ = w := div_mul_cancel₀ _ (ne_of_gt hL)
  exact_mod_cast hh

theorem large_height_budget (ε : ℝ) (h w a : ℕ) (hs : ¬ smallAspect ε h w) (ha : 0 < a) :
    a*Q ε h w a ≤ h := by
  have haR : (0 : ℝ) < a := by exact_mod_cast ha
  have hf := Nat.floor_le (show 0 ≤ (h : ℝ)/(a : ℝ) by positivity)
  have hh : (a : ℝ)*(Q ε h w a : ℝ) ≤ h := by
    calc
      _ ≤ (a : ℝ)*((h : ℝ)/(a : ℝ)) := by
        simpa only [Q,if_neg hs] using mul_le_mul_of_nonneg_left hf haR.le
      _ = h := by field_simp
  exact_mod_cast hh

theorem reservation_product_lower (ε : ℝ) (h w : ℕ) (hε : ε ≤ 1)
    (hL : 0 < L ε h w) (hI : ∀ a ∈ active ε h w,1 < a) :
    (∏ a : active ε h w,
      (RectanglePartitions.boundedParts a.val (C ε h w a.val) (T ε h w a.val)).card) ≤
        RectanglePartitions.rectangleCount h w := by
  have hpos : ∀ a ∈ active ε h w,0 < a := fun a ha => lt_trans (by omega) (hI a ha)
  by_cases hs : smallAspect ε h w
  · apply RectanglePartitions.stacked_choice_product_le_rectangleCount
      (active ε h w) (Q ε h w) (C ε h w) (T ε h w) h w hI
    · intro a ha
      simpa only [B,if_pos hs] using cap_le_width ε h w a hε
    · intro a ha
      simp only [T,B,if_pos hs]
      exact le_rfl
    · rw [Finset.sum_coe_sort (active ε h w) (fun a => a*Q ε h w a)]
      exact small_height_budget ε h w hs hL hpos
  · apply RectanglePartitions.column_choice_product_le_rectangleCount
      (active ε h w) (Q ε h w) (B ε h w) (C ε h w) (T ε h w) h w hI
    · exact fun a ha => cap_le_width ε h w a hε
    · exact fun a ha => le_rfl
    · exact fun a ha => large_height_budget ε h w a hs (hpos a ha)
    · rw [Finset.sum_coe_sort (active ε h w) (B ε h w)]
      exact large_column_budget ε h w hs hL hpos

theorem reservation_log_lower (ε : ℝ) (h w : ℕ) (hε : ε ≤ 1)
    (hL : 0 < L ε h w) (hI : ∀ a ∈ active ε h w,1 < a) :
    (∑ a : active ε h w,
      (Real.log ((RectanglePartitions.boundedParts 1 (C ε h w a.val) (T ε h w a.val)).card : ℝ) -
        ((a.val-1 : ℕ) : ℝ)*Real.log ((T ε h w a.val : ℝ)+1))) ≤
          Real.log (RectanglePartitions.rectangleCount h w : ℝ) :=
  RectanglePartitions.log_partition_lower (active ε h w) (C ε h w) (T ε h w) h w hI
    (reservation_product_lower ε h w hε hL hI)

theorem floor_relative_lower {ε x : ℝ} (hε : 0 < ε) (hx : 1/ε ≤ x) :
    (1-ε)*x ≤ (⌊x⌋₊ : ℝ) := by
  have hm : 1 ≤ ε*x := by
    have hh := (div_le_iff₀ hε).mp hx
    nlinarith
  have hf := Nat.lt_floor_add_one x
  nlinarith

theorem T_le_volume (ε : ℝ) (h w a : ℕ) (hL : 0 < L ε h w) (ha : 0 < a) :
    (T ε h w a : ℝ) ≤ area h w/(L ε h w*(a : ℝ)^2) := by
  have hq : (Q ε h w a : ℝ) ≤ idealQ ε h w a := by
    rw [Q_eq_floor_ideal]
    exact Nat.floor_le (idealQ_nonneg ε h w a hL.le)
  have hb : (B ε h w a : ℝ) ≤ idealB ε h w a := by
    rw [B_eq_floor_ideal]
    exact Nat.floor_le (idealB_nonneg ε h w a hL.le)
  have ht : (T ε h w a : ℝ) ≤ (Q ε h w a : ℝ)*(B ε h w a : ℝ) := by
    exact_mod_cast Nat.mul_le_mul_left (Q ε h w a) (Nat.sub_le (B ε h w a) (C ε h w a))
  exact ht.trans ((mul_le_mul hq hb (Nat.cast_nonneg _) (idealQ_nonneg ε h w a hL.le)).trans_eq
    (ideal_product ε h w a hL ha))

theorem T_ge_volume (ε : ℝ) (h w a : ℕ) (hε : 0 < ε) (hε1 : ε ≤ 1)
    (hL : 0 < L ε h w) (ha : 0 < a)
    (hq : (1-ε)*idealQ ε h w a ≤ (Q ε h w a : ℝ))
    (hb : (1-ε)*idealB ε h w a ≤ (B ε h w a : ℝ)) :
    (1-ε)^3*(area h w/(L ε h w*(a : ℝ)^2)) ≤ (T ε h w a : ℝ) := by
  have hε' : 0 ≤ 1-ε := by linarith
  have hcap : (C ε h w a : ℝ) ≤ ε*(B ε h w a : ℝ) :=
    Nat.floor_le (by positivity)
  have hremain : (1-ε)*(B ε h w a : ℝ) ≤ ((B ε h w a-C ε h w a : ℕ) : ℝ) := by
    rw [Nat.cast_sub (cap_le_width ε h w a hε1)]
    linarith
  have hprod := mul_le_mul hq hb
    (mul_nonneg hε' (idealB_nonneg ε h w a hL.le)) (Nat.cast_nonneg (Q ε h w a))
  have hprod' := mul_le_mul_of_nonneg_left hprod hε'
  have hret := mul_le_mul_of_nonneg_left hremain (Nat.cast_nonneg (Q ε h w a))
  rw [T,Nat.cast_mul]
  calc
    (1-ε)^3*(area h w/(L ε h w*(a : ℝ)^2)) =
        (1-ε)*(((1-ε)*idealQ ε h w a)*((1-ε)*idealB ε h w a)) := by
      rw [← ideal_product ε h w a hL ha]
      ring
    _ ≤ (1-ε)*((Q ε h w a : ℝ)*(B ε h w a : ℝ)) := hprod'
    _ = (Q ε h w a : ℝ)*((1-ε)*(B ε h w a : ℝ)) := by ring
    _ ≤ _ := hret

end RectangleAsymptotics
