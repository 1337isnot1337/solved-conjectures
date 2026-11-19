import Conjectures.RectangleLogBounds
import Mathlib.Analysis.Real.Sqrt

/-! Exact assembly of the independent partition counts and their deletion loss. -/

namespace RectanglePartitions

open Filter
open scoped Topology

theorem partition_lower_assembly (I : Finset ℕ) (C T : ℕ → ℕ) (h w : ℕ)
    {c ε S : ℝ} (hc : 0 < c) (hεc : ε ≤ c) (hS : 0 ≤ S)
    (hI : ∀ a ∈ I, 1 < a)
    (hprod : (∏ a : I,(boundedParts a.val (C a.val) (T a.val)).card) ≤ rectangleCount h w)
    (hpart : ∀ a ∈ I, (2*c-ε)*Real.sqrt (T a : ℝ) ≤
      Real.log ((boundedParts 1 (C a) (T a)).card : ℝ))
    (hsqrt : (1-7*ε)*S ≤ ∑ a ∈ I,Real.sqrt (T a : ℝ))
    (hloss : (∑ a ∈ I,((a-1 : ℕ) : ℝ)*Real.log ((T a : ℝ)+1)) ≤ ε*S) :
    (2*c-(14*c+2)*ε)*S ≤ Real.log (rectangleCount h w : ℝ) := by
  have hcoef : 0 ≤ 2*c-ε := by linarith
  have hp := Finset.sum_le_sum hpart
  rw [←Finset.mul_sum] at hp
  have hl := log_partition_lower I C T h w hI hprod
  rw [Finset.sum_coe_sort I (fun a : ℕ =>
      Real.log ((boundedParts 1 (C a) (T a)).card : ℝ) -
      ((a-1 : ℕ) : ℝ)*Real.log ((T a : ℝ)+1)),Finset.sum_sub_distrib] at hl
  have hs := mul_le_mul_of_nonneg_left hsqrt hcoef
  have hm := mul_nonneg (sq_nonneg ε) hS
  have hbase : (2*c-ε)*((1-7*ε)*S)-ε*S ≤
      Real.log (rectangleCount h w : ℝ) := by
    calc
      _ ≤ (2*c-ε)*(∑ a ∈ I,Real.sqrt (T a : ℝ)) -
          (∑ a ∈ I,((a-1 : ℕ) : ℝ)*Real.log ((T a : ℝ)+1)) := sub_le_sub hs hloss
      _ ≤ (∑ a ∈ I,Real.log ((boundedParts 1 (C a) (T a)).card : ℝ)) -
          (∑ a ∈ I,((a-1 : ℕ) : ℝ)*Real.log ((T a : ℝ)+1)) := sub_le_sub_right hp _
      _ ≤ _ := hl
  apply le_trans _ hbase
  calc
    (2*c-(14*c+2)*ε)*S ≤ (2*c-(14*c+2)*ε)*S + 7*(ε^2*S) :=
      le_add_of_nonneg_right (mul_nonneg (by norm_num) hm)
    _ = _ := by ring

/-- The fixed positive exponent can be chosen after the requested final error. -/
theorem eventually_lower_of_approximants {ι : Type*} {l : Filter ι}
    (X S : ι → ℝ) {c : ℝ} (hc : 0 < c)
    (hS : ∀ᶠ x in l, 0 ≤ S x)
    (h : ∀ ε : ℝ, 0 < ε → ε < c → ε < 1/10 →
      ∀ᶠ x in l, (2*c-(14*c+2)*ε)*S x ≤ X x)
    {δ : ℝ} (hδ : 0 < δ) :
    ∀ᶠ x in l, (2*c-δ)*S x ≤ X x := by
  let K : ℝ := 14*c+2
  have hK : 0 < K := by dsimp [K]; linarith
  let ε : ℝ := min (c/2) (min (1/20) (δ/(2*K)))
  have hε : 0 < ε := lt_min (by positivity) (lt_min (by norm_num) (by positivity))
  have hεc : ε < c := (min_le_left _ _).trans_lt (by linarith)
  have hεsmall : ε < 1/10 :=
    ((min_le_right _ _).trans (min_le_left _ _)).trans_lt (by norm_num)
  have hεδ : ε ≤ δ/(2*K) := (min_le_right _ _).trans (min_le_right _ _)
  have hKε : K*ε ≤ δ := by
    have hh := (le_div_iff₀ (mul_pos (by norm_num : (0 : ℝ)<2) hK)).1 hεδ
    nlinarith
  filter_upwards [h ε hε hεc hεsmall,hS] with x hx hs
  apply le_trans _ hx
  apply mul_le_mul_of_nonneg_right _ hs
  dsimp [K] at hKε
  linarith

end RectanglePartitions
