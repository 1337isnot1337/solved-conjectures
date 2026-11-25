import Conjectures.RevisedTanZhouCylinders
import Mathlib.Topology.MetricSpace.HausdorffDimension
import Mathlib.Analysis.PSeries

/-!
# The cylinder covering bound for the revised Tan–Zhou problem
-/

open Set Finset Filter MeasureTheory
open scoped Topology ENNReal

namespace RevisedTanZhou

open GravgaardLeeLargeLuroth GravgaardLeeMixedLuroth

noncomputable section

theorem hasSum_width_tail (M : ℕ) :
    HasSum (fun d : ℕ => width (M + d + 2)) (1 / ((M : ℝ) + 1)) := by
  have hsum (n : ℕ) : (∑ d ∈ range n, width (M + d + 2)) =
      1 / ((M : ℝ) + 1) - 1 / ((M : ℝ) + n + 1) := by
    induction n with
    | zero => simp
    | succ n ih =>
      rw [sum_range_succ, ih]
      have h := digitTop (d := M + n + 2) (by omega)
      push_cast at h ⊢
      rw [show (M : ℝ) + n + 2 - 1 = (M : ℝ) + n + 1 by ring] at h
      linear_combination h
  apply (hasSum_iff_tendsto_nat_of_nonneg
    (fun d => (width_pos (show 2 ≤ M + d + 2 by omega)).le) _).mpr
  simp_rw [hsum]
  have hlim := (tendsto_one_div_add_atTop_nhds_zero_nat (𝕜 := ℝ)).comp
    (tendsto_add_atTop_nat M)
  have ht : Tendsto (fun n : ℕ => 1 / ((M : ℝ) + n + 1)) atTop (𝓝 0) := by
    convert hlim using 1
    funext n
    simp only [Function.comp_apply, Nat.cast_add]
    rw [add_comm (M : ℝ)]
  simpa only [sub_zero] using tendsto_const_nhds.sub ht

theorem tsum_width (M : ℕ) :
    (∑' d : ℕ, ENNReal.ofReal (width (M + d + 2))) = ENNReal.ofReal (1 / ((M : ℝ) + 1)) := by
  rw [← ENNReal.ofReal_tsum_of_nonneg (fun d => (width_pos (show 2 ≤ M + d + 2 by omega)).le)
    (hasSum_width_tail M).summable, (hasSum_width_tail M).tsum_eq]

private def digitCost (a : ℝ) : ℝ≥0∞ :=
  ∑' d : ℕ, ENNReal.ofReal (width (d + 2) ^ a)

private def finalCost (a : ℝ) : ℝ≥0∞ :=
  ∑' d : ℕ, ENNReal.ofReal ((1 / ((d : ℝ) + 2)) ^ a)

set_option maxHeartbeats 600000 in
theorem tsum_lengths_rpow (a : ℝ) (n : ℕ) :
    (∑' w : Word n, ENNReal.ofReal (lengthOf w ^ a)) = digitCost a ^ n := by
  induction n with
  | zero =>
      change (∑' w : Unit, ENNReal.ofReal (@lengthOf 0 w ^ a)) = _
      have he : (fun w : Unit => ENNReal.ofReal (@lengthOf 0 w ^ a)) = fun _ => 1 := by
        funext w
        simp [lengthOf, A]
      rw [he, tsum_fintype, pow_zero]
      simp
  | succ n ih =>
      change (∑' w : Word n × ℕ, ENNReal.ofReal
        (lengthOf (show Word (n + 1) from w) ^ a)) = _
      have he (w : Word n × ℕ) : ENNReal.ofReal (lengthOf (show Word (n + 1) from w) ^ a) =
          ENNReal.ofReal (lengthOf w.1 ^ a) * ENNReal.ofReal (width (w.2 + 2) ^ a) := by
        rw [← ENNReal.ofReal_mul (Real.rpow_nonneg (length_pos w.1).le _),
          ← Real.mul_rpow (length_pos w.1).le (width_pos (show 2 ≤ w.2 + 2 by omega)).le,
          length_snoc]
      simp_rw [he]
      rw [ENNReal.tsum_prod', pow_succ, ← ih]
      simp [digitCost, ENNReal.tsum_mul_left, ENNReal.tsum_mul_right]

theorem tsum_cylinder_lengths (n : ℕ) :
    (∑' w : Word n, ENNReal.ofReal (lengthOf w)) = 1 := by
  have h := tsum_lengths_rpow 1 n
  simp only [Real.rpow_one] at h
  rw [h]
  have he := tsum_width 0
  simp only [Nat.cast_zero, zero_add, div_one, ENNReal.ofReal_one] at he
  simp [digitCost, he]

private theorem tsum_Q_rpow (a : ℝ) (n : ℕ) :
    (∑' w : Word (n + 1), ENNReal.ofReal ((1 / (Q n w : ℝ)) ^ a)) =
      digitCost a ^ n * finalCost a := by
  change (∑' w : Word n × ℕ, ENNReal.ofReal ((1 / (Q n w : ℝ)) ^ a)) = _
  have h (w : Word n × ℕ) : 1 / (Q n w : ℝ) = lengthOf w.1 * (1 / ((w.2 : ℝ) + 2)) := by
    simp only [Q, Nat.cast_mul, Nat.cast_add, Nat.cast_ofNat, lengthOf, one_div, mul_inv]
  have he (w : Word n × ℕ) : ENNReal.ofReal ((1 / (Q n w : ℝ)) ^ a) =
      ENNReal.ofReal (lengthOf w.1 ^ a) * ENNReal.ofReal ((1 / ((w.2 : ℝ) + 2)) ^ a) := by
    rw [h, Real.mul_rpow (length_pos w.1).le (by positivity),
      ENNReal.ofReal_mul (Real.rpow_nonneg (length_pos w.1).le _)]
  simp_rw [he]
  rw [ENNReal.tsum_prod', ← tsum_lengths_rpow]
  simp [finalCost, ENNReal.tsum_mul_left, ENNReal.tsum_mul_right]

private theorem digitCost_lt_one {a : ℝ} (ha : 1 < a) : digitCost a < 1 := by
  let r := (1 / 2 : ℝ) ^ (a - 1)
  have hr : r < 1 := Real.rpow_lt_one (by norm_num) (by norm_num) (by linarith)
  have hr0 : 0 ≤ r := Real.rpow_nonneg (by norm_num) _
  have h (d : ℕ) : width (d + 2) ^ a ≤ r * width (d + 2) := by
    have hpos := width_pos (show 2 ≤ d + 2 by omega)
    have hle := width_le_half (show 2 ≤ d + 2 by omega)
    have hpow := Real.rpow_le_rpow hpos.le hle (show 0 ≤ a - 1 by linarith)
    calc
      width (d + 2) ^ a = width (d + 2) ^ ((a - 1) + 1) := by ring_nf
      _ = width (d + 2) ^ (a - 1) * width (d + 2) := by rw [Real.rpow_add hpos, Real.rpow_one]
      _ ≤ _ := mul_le_mul_of_nonneg_right hpow hpos.le
  calc
    digitCost a ≤ ∑' d : ℕ, ENNReal.ofReal r * ENNReal.ofReal (width (d + 2)) := by
      apply ENNReal.tsum_le_tsum
      intro d
      rw [← ENNReal.ofReal_mul hr0]
      exact ENNReal.ofReal_le_ofReal (h d)
    _ = ENNReal.ofReal r := by
      have he := tsum_width 0
      simp only [Nat.cast_zero, zero_add, div_one, ENNReal.ofReal_one] at he
      rw [ENNReal.tsum_mul_left, he, mul_one]
    _ < 1 := by simpa only [ENNReal.ofReal_one] using ENNReal.ofReal_lt_ofReal_iff (by norm_num : (0 : ℝ) < 1) |>.mpr hr

private theorem finalCost_ne_top {a : ℝ} (ha : 1 < a) : finalCost a ≠ ∞ := by
  have hs : Summable (fun d : ℕ => (1 / ((d : ℝ) + 2)) ^ a) := by
    have hf := (Real.summable_one_div_nat_add_rpow 2 a).mpr ha
    convert hf using 1
    funext d
    rw [abs_of_nonneg (by positivity), Real.div_rpow (by norm_num) (by positivity), Real.one_rpow]
  unfold finalCost
  rw [← ENNReal.ofReal_tsum_of_nonneg (fun _ => by positivity) hs]
  exact ENNReal.ofReal_ne_top

theorem length_le_geom {n : ℕ} (w : Word n) : lengthOf w ≤ (1 / 2 : ℝ) ^ n := by
  induction n with
  | zero => simp [lengthOf, A]
  | succ n ih =>
      change lengthOf (show Word (n + 1) from (w.1, w.2)) ≤ _
      rw [length_snoc, pow_succ]
      exact mul_le_mul (ih w.1) (width_le_half (by omega)) (width_pos (by omega)).le (by positivity)

/-- The Hausdorff measure vanishes when the eventual power bound makes
the sum over all cylinder targets converge. -/
theorem hausdorff_zero_of_eventually_power {ψ : ℕ → ℝ} {t s : ℝ}
    (hs : 0 < s) (hconv : 1 < s * (1 + t))
    (hψ : ∀ᶠ q : ℕ in atTop, ψ q ≤ (q : ℝ) ^ (-t)) :
    μH[s] (approxSet ψ) = 0 := by
  let a := s * (1 + t)
  let C := digitCost a
  let D := finalCost a
  have hC : C < 1 := digitCost_lt_one hconv
  have hD : D ≠ ∞ := finalCost_ne_top hconv
  let cover (N : ℕ) (w : Σ j : ℕ, Word (N + j + 1)) : Set ℝ := target ψ w.2
  have hdiam (N : ℕ) (w : Σ j : ℕ, Word (N + j + 1)) :
      Metric.ediam (cover N w) ≤ (1 / 2 : ℝ≥0∞) ^ N := by
    apply (Metric.ediam_mono (Set.inter_subset_left : target ψ w.2 ⊆ cylinder w.2)).trans
    rw [cylinder, Real.ediam_Ioc, add_sub_cancel_left]
    have h := (length_le_geom w.2).trans (pow_le_pow_of_le_one (by norm_num) (by norm_num)
      (show N ≤ N + w.1 + 1 by omega))
    rw [← show ENNReal.ofReal ((1 / 2 : ℝ) ^ N) = (1 / 2 : ℝ≥0∞) ^ N by
      rw [ENNReal.ofReal_pow (by norm_num)]
      have hf : ENNReal.ofReal (1 / 2 : ℝ) = (1 / 2 : ℝ≥0∞) := by
        simp [one_div]
      rw [hf]]
    exact ENNReal.ofReal_le_ofReal h
  have hcover (N : ℕ) : approxSet ψ ⊆ ⋃ w, cover N w := by
    intro x hx
    obtain ⟨n, hn, w, hw⟩ := hx N
    obtain ⟨j, rfl⟩ := Nat.exists_eq_add_of_le hn
    exact mem_iUnion.mpr ⟨⟨j, w⟩, hw⟩
  have hm := Measure.hausdorffMeasure_le_liminf_tsum s (approxSet ψ)
    (fun N => (1 / 2 : ℝ≥0∞) ^ N)
    (ENNReal.tendsto_pow_atTop_nhds_zero_of_lt_one (by norm_num))
    cover (Eventually.of_forall hdiam) (Eventually.of_forall hcover)
  obtain ⟨N₀, hN₀⟩ := eventually_atTop.mp hψ
  have hsum : ∀ᶠ N : ℕ in atTop,
      (∑' w, Metric.ediam (cover N w) ^ s) ≤
        C ^ N * ((∑' j : ℕ, C ^ j) * D) := by
    filter_upwards [eventually_ge_atTop N₀] with N hN
    calc
      _ ≤ ∑' w : Σ j : ℕ, Word (N + j + 1), ENNReal.ofReal ((1 / (Q (N + w.1) w.2 : ℝ)) ^ a) := by
        apply ENNReal.tsum_le_tsum
        rintro ⟨j, w⟩
        let q := Q (N + j) w
        have hq : 0 < (q : ℝ) := by exact_mod_cast Q_pos w
        have hqN : N₀ ≤ q := hN.trans ((show N ≤ 2 ^ (N + j + 1) by
          have := Nat.lt_pow_self (n := N + j + 1) (show 1 < 2 by decide); omega).trans (two_pow_le_Q _ w))
        apply (ENNReal.rpow_le_rpow (Metric.ediam_mono Set.inter_subset_right) hs.le).trans
        rw [Real.ediam_Ioo, add_sub_cancel_left]
        have hu : ψ q / q ≤ (q : ℝ) ^ (-(1 + t)) := by
          calc
            _ ≤ (q : ℝ) ^ (-t) / q := div_le_div_of_nonneg_right (hN₀ q hqN) hq.le
            _ = _ := by
              rw [show (q : ℝ) ^ (-t) / q = (q : ℝ) ^ (-t - 1) by
                rw [Real.rpow_sub hq, Real.rpow_one]]
              congr 1
              ring
        apply (ENNReal.rpow_le_rpow (ENNReal.ofReal_le_ofReal hu) hs.le).trans_eq
        change ENNReal.ofReal ((q : ℝ) ^ (-(1 + t))) ^ s = ENNReal.ofReal ((1 / (q : ℝ)) ^ a)
        rw [ENNReal.ofReal_rpow_of_pos (Real.rpow_pos_of_pos hq _), ← Real.rpow_mul hq.le,
          one_div, ← Real.rpow_neg_one (q : ℝ), ← Real.rpow_mul hq.le]
        congr 2
        dsimp [a]
        ring
      _ = C ^ N * ((∑' j : ℕ, C ^ j) * D) := by
        rw [ENNReal.tsum_sigma']
        have hterm (j : ℕ) :
            (∑' w : Word (N + j + 1), ENNReal.ofReal ((1 / (Q (N + j) w : ℝ)) ^ a)) =
              C ^ (N + j) * D := tsum_Q_rpow a (N + j)
        simp_rw [hterm]
        change (∑' j : ℕ, C ^ (N + j) * D) = _
        simp_rw [pow_add, mul_assoc]
        rw [ENNReal.tsum_mul_left, ENNReal.tsum_mul_right]
  have hfinite : ((∑' j : ℕ, C ^ j) * D) ≠ ∞ :=
    ENNReal.mul_ne_top (by
      rw [ENNReal.tsum_geometric]
      exact ENNReal.inv_ne_top.mpr (tsub_pos_of_lt hC).ne') hD
  have hlim := ENNReal.Tendsto.mul_const (ENNReal.tendsto_pow_atTop_nhds_zero_of_lt_one hC) (Or.inr hfinite)
  rw [zero_mul] at hlim
  exact le_antisymm (hm.trans ((liminf_le_liminf hsum).trans_eq hlim.liminf_eq)) bot_le

end
end RevisedTanZhou
