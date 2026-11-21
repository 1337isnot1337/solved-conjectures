module

public import Conjectures.SteinkeZakynthinou.Tensor

/-! Finite output channels in the fair selector experiment. -/

@[expose] public section

open scoped BigOperators

namespace SteinkeZakynthinou

open Learner (selectorMean)

theorem selectorMean_const {n : ℕ} (x : ℝ) : selectorMean (n := n) (fun _ => x) = x := by
  have h : (Fintype.card (Selector n) : ℝ) ≠ 0 := by positivity
  simp only [selectorMean, Finset.sum_const, Finset.card_univ, nsmul_eq_mul, mul_comm _ x]
  exact mul_div_cancel_right₀ x h

theorem selectorMean_sum {n : ℕ} {α : Type*} (u : Finset α) (f : Selector n → α → ℝ) :
    selectorMean (fun s => ∑ a ∈ u, f s a) = ∑ a ∈ u, selectorMean (fun s => f s a) := by
  unfold selectorMean
  rw [← Finset.sum_div, Finset.sum_comm]

theorem selectorMean_mul_const {n : ℕ} (f : Selector n → ℝ) (x : ℝ) :
    selectorMean (fun s => f s * x) = selectorMean f * x := by
  unfold selectorMean
  rw [← Finset.sum_mul, mul_div_right_comm]

theorem selectorMean_sub {n : ℕ} (f g : Selector n → ℝ) :
    selectorMean (fun s => f s - g s) = selectorMean f - selectorMean g := by
  unfold selectorMean
  rw [Finset.sum_sub_distrib, sub_div]

theorem selectorMean_mono {n : ℕ} {f g : Selector n → ℝ} (h : ∀ s, f s ≤ g s) :
    selectorMean f ≤ selectorMean g :=
  div_le_div_of_nonneg_right (Finset.sum_le_sum fun s _ => h s) (by positivity)

theorem eq_zero_of_selectorMean_eq_zero {n : ℕ} {f : Selector n → ℝ}
    (hf : ∀ s, 0 ≤ f s) (h : selectorMean f = 0) (s : Selector n) : f s = 0 := by
  have hpos : (Fintype.card (Selector n) : ℝ) ≠ 0 := by positivity
  unfold selectorMean at h
  exact (Finset.sum_eq_zero_iff_of_nonneg (fun i _ => hf i)).mp
    ((div_eq_zero_iff.mp h).resolve_right hpos) s (Finset.mem_univ s)

private theorem relativeTerm_expand {p r : ℝ} (h : r = 0 → p = 0) :
    relativeTerm p r = entropyTerm p - p * Real.log r + r - p := by
  by_cases hp : p = 0
  · simp [hp, entropyTerm, relativeTerm, InformationTheory.klFun_zero]
  have hr : r ≠ 0 := fun he => hp (h he)
  rw [relativeTerm_eq h, entropyTerm, Real.log_div hp hr, mul_sub]

theorem mean_relativeTerm_eq {n : ℕ} (f : Selector n → ℝ) (r : ℝ)
    (h : ∀ s, r = 0 → f s = 0) :
    selectorMean (fun s => relativeTerm (f s) r) =
      entropyGap f + relativeTerm (selectorMean f) r := by
  have hr : r = 0 → selectorMean f = 0 := by
    intro he
    unfold selectorMean
    simp [fun s => h s he]
  rw [relativeTerm_expand hr, entropyGap]
  simp only [relativeTerm_expand (h _), selectorMean_add, selectorMean_sub, selectorMean_const,
    selectorMean_mul_const]
  ring

noncomputable def channelInfo {n : ℕ} {α : Type*} [Fintype α] (p : Selector n → α → ℝ) : ℝ :=
  ∑ a, entropyGap (fun s => p s a)

theorem channelInfo_eq {n : ℕ} {α : Type*} [Fintype α]
    (p : Selector n → α → ℝ) (hp : ∀ s a, 0 ≤ p s a) :
    channelInfo p = selectorMean fun s =>
      ∑ a, relativeTerm (p s a) (selectorMean fun v => p v a) := by
  unfold channelInfo
  rw [selectorMean_sum]
  apply Finset.sum_congr rfl
  intro a _
  have he := mean_relativeTerm_eq (fun s => p s a) (selectorMean fun v => p v a)
    (fun s h => eq_zero_of_selectorMean_eq_zero (fun v => hp v a) h s)
  rw [he]
  have hz (x : ℝ) : relativeTerm x x = 0 := by
    by_cases h : x = 0
    · simp [h, relativeTerm]
    · simp [relativeTerm, div_self h, InformationTheory.klFun_one]
  rw [hz, add_zero]

theorem channelInfo_nonneg {n : ℕ} {α : Type*} [Fintype α]
    (p : Selector n → α → ℝ) (hp : ∀ s a, 0 ≤ p s a) :
    0 ≤ channelInfo p := by
  rw [channelInfo_eq p hp]
  exact selectorMean_nonneg (fun s => Finset.sum_nonneg (fun a _ =>
    relativeTerm_nonneg (hp s a) (selectorMean_nonneg (fun v => hp v a))))

theorem channelInfo_le_reference {n : ℕ} {α : Type*} [Fintype α]
    (p : Selector n → α → ℝ) (hp : ∀ s a, 0 ≤ p s a)
    (r : α → ℝ) (hr : ∀ a, 0 ≤ r a) (hs : ∀ s a, r a = 0 → p s a = 0) :
    channelInfo p ≤ selectorMean (fun s => ∑ a, relativeTerm (p s a) (r a)) := by
  unfold channelInfo
  rw [selectorMean_sum]
  exact Finset.sum_le_sum (fun a _ => by
    rw [mean_relativeTerm_eq _ _ (fun s => hs s a)]
    exact le_add_of_nonneg_right (relativeTerm_nonneg (selectorMean_nonneg (fun s => hp s a)) (hr a)))

theorem channelInfo_le_js {n : ℕ} {α : Type*} [Fintype α]
    (p : Selector n → α → ℝ) (hp : ∀ s a, 0 ≤ p s a) :
    channelInfo p ≤ ∑ i : Fin n, selectorMean (fun s =>
      ∑ a, jsTerm (p (Function.update s i false) a) (p (Function.update s i true) a)) := by
  unfold channelInfo
  simp only [selectorMean_sum]
  rw [Finset.sum_comm]
  exact Finset.sum_le_sum fun a _ =>
    entropyGap_le_coordinateCharges (fun s => p s a) (fun s => hp s a)

noncomputable def pushChannel {n : ℕ} {α β : Type*} [Fintype α] [DecidableEq β]
    (g : α → β) (p : Selector n → α → ℝ) (s : Selector n) (b : β) : ℝ :=
  ∑ a ∈ Finset.univ.filter (fun a => g a = b), p s a

/-- Conditional data processing, pointwise in the pool. -/
theorem channelInfo_push_le {n : ℕ} {α β : Type*} [Fintype α] [Fintype β] [DecidableEq β]
    (g : α → β) (p : Selector n → α → ℝ) (hp : ∀ s a, 0 ≤ p s a) :
    channelInfo (pushChannel g p) ≤ channelInfo p := by
  have hh : ∀ s b, 0 ≤ pushChannel g p s b := fun s b =>
    Finset.sum_nonneg fun a _ => hp s a
  rw [channelInfo_eq p hp, channelInfo_eq _ hh]
  apply selectorMean_mono
  intro s
  unfold pushChannel
  simp only [selectorMean_sum]
  calc
    _ ≤ ∑ b, ∑ a ∈ Finset.univ.filter (fun a => g a = b),
          relativeTerm (p s a) (selectorMean (fun v => p v a)) :=
      Finset.sum_le_sum (fun b _ =>
        relativeTerm_sum_le _ _ _ (fun a _ => hp s a)
          (fun a _ => selectorMean_nonneg (fun v => hp v a))
          (fun a _ h => eq_zero_of_selectorMean_eq_zero (fun v => hp v a) h s))
    _ = _ := Finset.sum_fiberwise Finset.univ g _

end SteinkeZakynthinou
