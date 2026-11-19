import Conjectures.RectangleEuler

/-! A sharp finite Euler-product limit with a moving largest-part cutoff. -/
namespace RectangleEuler

open Finset Filter
open scoped Topology

noncomputable def partialBasel (K : ℕ) : ℝ :=
  ∑ m ∈ range K, 1 / ((m : ℝ) + 1) ^ 2

noncomputable def harmonicSum (K : ℕ) : ℝ :=
  ∑ m ∈ range K, 1 / ((m : ℝ) + 1)

lemma basel_pos : 0 < basel := by
  have h := basel_summable.sum_le_tsum (range 1) (fun n hn => by positivity)
  have h' : 1 ≤ basel := by simpa [basel] using h
  linarith

lemma logEuler_summand_lower (B m : ℕ) {t : ℝ} (ht : 0 < t) :
    (1 - Real.exp (-(B : ℝ) * t)) / ((m : ℝ) + 1) ^ 2 - t / ((m : ℝ) + 1) ≤
      t * (∑ a ∈ range B, Real.exp (-((a : ℝ) + 1) * t) ^ (m + 1) /
        ((m : ℝ) + 1)) := by
  have hm : 0 < (m : ℝ) + 1 := by positivity
  have he : Real.exp (-(B : ℝ) * (t * ((m : ℝ) + 1))) ≤
      Real.exp (-(B : ℝ) * t) := by
    apply Real.exp_le_exp.mpr
    have hBm : 0 ≤ (B : ℝ) * t * (m : ℝ) := by positivity
    nlinarith
  have hlo := mul_le_mul_of_nonneg_left (exp_sum_lower B (mul_pos ht hm))
    (by positivity : 0 ≤ t / ((m : ℝ) + 1))
  rw [logEuler_summand_eq]
  calc
    _ ≤ (1 - Real.exp (-(B : ℝ) * (t * ((m : ℝ) + 1)))) /
        ((m : ℝ) + 1) ^ 2 - t / ((m : ℝ) + 1) := by
      exact sub_le_sub_right (div_le_div_of_nonneg_right (sub_le_sub_left he 1)
        (by positivity)) _
    _ = (t / ((m : ℝ) + 1)) * (1 / (t * ((m : ℝ) + 1)) - 1 -
        Real.exp (-(B : ℝ) * (t * ((m : ℝ) + 1))) / (t * ((m : ℝ) + 1))) := by
      field_simp
      ring
    _ ≤ (t / ((m : ℝ) + 1)) * (∑ a ∈ range B,
        Real.exp (-((a : ℝ) + 1) * (t * ((m : ℝ) + 1)))) := hlo
    _ = _ := by ring

lemma logEuler_partial_le (B K : ℕ) {t : ℝ} (ht : 0 < t) :
    (∑ m ∈ range K, ∑ a ∈ range B,
      Real.exp (-((a : ℝ) + 1) * t) ^ (m + 1) / ((m : ℝ) + 1)) ≤ logEuler B t := by
  have hs := logEuler_hasSum B ht
  rw [← hs.tsum_eq]
  apply hs.summable.sum_le_tsum
  intro m hm
  apply sum_nonneg
  intro a ha
  positivity

/-- Every finite partial Basel sum gives a uniform lower bound. -/
theorem scaled_logEuler_lower (B K : ℕ) {t : ℝ} (ht : 0 < t) :
    (1 - Real.exp (-(B : ℝ) * t)) * partialBasel K - t * harmonicSum K ≤
      t * logEuler B t := by
  have hs := sum_le_sum (fun m (_ : m ∈ range K) => logEuler_summand_lower B m ht)
  have hp := mul_le_mul_of_nonneg_left (logEuler_partial_le B K ht) ht.le
  calc
    _ = ∑ m ∈ range K, ((1 - Real.exp (-(B : ℝ) * t)) / ((m : ℝ) + 1) ^ 2 -
        t / ((m : ℝ) + 1)) := by
      simp only [partialBasel, harmonicSum, mul_sum, sum_sub_distrib, mul_one_div]
    _ ≤ ∑ m ∈ range K, t * (∑ a ∈ range B,
        Real.exp (-((a : ℝ) + 1) * t) ^ (m + 1) / ((m : ℝ) + 1)) := hs
    _ ≤ _ := by simpa only [← mul_sum] using hp

lemma scaled_logEuler_le (B : ℕ) {t : ℝ} (ht : 0 < t) :
    t * logEuler B t ≤ basel := by
  have h := (le_div_iff₀ ht).1 (logEuler_le B ht)
  simpa only [mul_comm] using h

/-- The logarithm of the Euler product has its sharp leading constant, even
when the largest permitted part varies, provided that its scaled cutoff tends
to infinity. -/
theorem tendsto_scaled_logEuler {ι : Type*} {l : Filter ι}
    (B : ι → ℕ) (t : ι → ℝ) (hpos : ∀ᶠ x in l, 0 < t x)
    (ht : Tendsto t l (𝓝 0))
    (hBt : Tendsto (fun x => (B x : ℝ) * t x) l atTop) :
    Tendsto (fun x => t x * logEuler (B x) (t x)) l (𝓝 basel) := by
  apply tendsto_order.2
  constructor
  · intro a ha
    have hsum : Tendsto partialBasel atTop (𝓝 basel) :=
      basel_summable.hasSum.tendsto_sum_nat
    obtain ⟨K, hK⟩ := ((tendsto_order.1 hsum).1 a ha).exists
    have hexp : Tendsto (fun x => Real.exp (-(B x : ℝ) * t x)) l (𝓝 0) := by
      have hn := tendsto_neg_atTop_atBot.comp hBt
      have hc : Tendsto (fun x => Real.exp (-((B x : ℝ) * t x))) l (𝓝 0) :=
        Real.tendsto_exp_atBot.comp hn
      simpa only [neg_mul] using hc
    have hlow : Tendsto (fun x => (1 - Real.exp (-(B x : ℝ) * t x)) * partialBasel K -
        t x * harmonicSum K) l (𝓝 (partialBasel K)) := by
      have h1 : Tendsto (fun _ : ι => (1 : ℝ)) l (𝓝 1) := tendsto_const_nhds
      simpa using ((h1.sub hexp).mul_const (partialBasel K)).sub
        (ht.mul_const (harmonicSum K))
    filter_upwards [(tendsto_order.1 hlow).1 a hK, hpos] with x hx htx
    exact hx.trans_le (scaled_logEuler_lower (B x) K htx)
  · intro b hb
    filter_upwards [hpos] with x htx
    exact (scaled_logEuler_le (B x) htx).trans_lt hb

end RectangleEuler
