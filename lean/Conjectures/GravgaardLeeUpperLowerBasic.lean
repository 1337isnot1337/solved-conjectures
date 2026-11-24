import Conjectures.GravgaardLeeMixedLuroth

/-! # Gravgaard–Lee's mixed upper/lower Lüroth conjecture

Basic source-matched geometry for Conjecture 2.6 in Gravgaard–Lee,
*Decomposition of real numbers into sums of Lüroth sets*, arXiv:2506.12513v2.
The argument being formalized is the existing repository proof in
`results/gravgaard-lee-upper-lower-luroth/DIRECT-REFINEMENT.md`.

This module reuses the actual infinite Lüroth series and its positive-tail
semantics. Its statements are supporting lemmas, not the complete sumset theorem.
-/

open Filter Finset Set
open scoped Topology Pointwise

namespace GravgaardLeeUpperLower

open GravgaardLeeLargeLuroth GravgaardLeeMixedLuroth

noncomputable section

/-- Value of the constant digit `k` string. -/
def endpoint (k : ℕ) : ℝ := ((k : ℝ) - 1) / ((k : ℝ) * ((k : ℝ) - 1) - 1)

/-- The increasing affine inverse of the source Lüroth map on digit `d`. -/
def branch (d : ℕ) (t : ℝ) : ℝ := 1 / (d : ℝ) + width d * t

theorem endpoint_den_pos {k : ℕ} (hk : 2 ≤ k) :
    0 < (k : ℝ) * ((k : ℝ) - 1) - 1 := by
  have h : (2 : ℝ) ≤ k := by exact_mod_cast hk
  nlinarith [mul_nonneg (show 0 ≤ (k : ℝ) - 2 by linarith)
    (show 0 ≤ (k : ℝ) - 1 by linarith)]

theorem endpoint_pos {k : ℕ} (hk : 2 ≤ k) : 0 < endpoint k := by
  have h : (2 : ℝ) ≤ k := by exact_mod_cast hk
  exact div_pos (by linarith) (endpoint_den_pos hk)

theorem endpoint_le_one {k : ℕ} (hk : 2 ≤ k) : endpoint k ≤ 1 := by
  have h : (2 : ℝ) ≤ k := by exact_mod_cast hk
  apply (div_le_iff₀ (endpoint_den_pos hk)).2
  nlinarith [mul_nonneg (show 0 ≤ (k : ℝ) - 2 by linarith)
    (show 0 ≤ (k : ℝ) from Nat.cast_nonneg k)]

theorem endpoint_le_two_fifths {k : ℕ} (hk : 3 ≤ k) : endpoint k ≤ 2 / 5 := by
  have h : (3 : ℝ) ≤ k := by exact_mod_cast hk
  apply (div_le_iff₀ (endpoint_den_pos (by omega))).2
  nlinarith [mul_nonneg (show 0 ≤ (k : ℝ) - 3 by linarith)
    (show 0 ≤ 2 * (k : ℝ) - 1 by linarith)]

theorem endpoint_lt_one {k : ℕ} (hk : 3 ≤ k) : endpoint k < 1 :=
  (endpoint_le_two_fifths hk).trans_lt (by norm_num)

theorem one_div_lt_endpoint {k : ℕ} (hk : 2 ≤ k) : 1 / (k : ℝ) < endpoint k := by
  have h : (2 : ℝ) ≤ k := by exact_mod_cast hk
  apply (div_lt_div_iff₀ (by linarith) (endpoint_den_pos hk)).2
  nlinarith

theorem endpoint_fixed {k : ℕ} (hk : 2 ≤ k) : branch k (endpoint k) = endpoint k := by
  have h : (2 : ℝ) ≤ k := by exact_mod_cast hk
  have hk0 : (k : ℝ) ≠ 0 := by linarith
  have hk1 : (k : ℝ) - 1 ≠ 0 := by linarith
  have hden := (endpoint_den_pos hk).ne'
  unfold branch endpoint width
  field_simp
  ring

theorem branch_mono {d : ℕ} (hd : 2 ≤ d) : Monotone (branch d) := by
  intro x y hxy
  exact add_le_add le_rfl (mul_le_mul_of_nonneg_left hxy (width_pos hd).le)

theorem width_antitone {d e : ℕ} (hd : 2 ≤ d) (hde : d ≤ e) : width e ≤ width d := by
  have hdR : (2 : ℝ) ≤ d := by exact_mod_cast hd
  have hdeR : (d : ℝ) ≤ e := by exact_mod_cast hde
  apply one_div_le_one_div_of_le
  · exact mul_pos (by linarith) (by linarith)
  · nlinarith [mul_nonneg (show 0 ≤ (e : ℝ) - d by linarith)
      (show 0 ≤ (e : ℝ) + d - 1 by linarith)]

theorem branch_antitone_digit {d e : ℕ} (hd : 2 ≤ d) (hde : d ≤ e)
    {t : ℝ} (ht : 0 ≤ t) : branch e t ≤ branch d t := by
  have hdR : (2 : ℝ) ≤ d := by exact_mod_cast hd
  have hdeR : (d : ℝ) ≤ e := by exact_mod_cast hde
  exact add_le_add (one_div_le_one_div_of_le (by linarith) hdeR)
    (mul_le_mul_of_nonneg_right (width_antitone hd hde) ht)

theorem truncation_antitone_digits (d e : ℕ → ℕ)
    (hd : ∀ i, 2 ≤ d i) (hde : ∀ i, d i ≤ e i) (n : ℕ) :
    truncation e n ≤ truncation d n := by
  induction n generalizing d e with
  | zero => simp [truncation]
  | succ n ih =>
    rw [prefix_head, prefix_head]
    change branch (e 0) (truncation (fun i => e (i + 1)) n) ≤
      branch (d 0) (truncation (fun i => d (i + 1)) n)
    apply (branch_antitone_digit (hd 0) (hde 0)
      (prefix_mem (fun i => e (i + 1)) (fun i => (hd (i + 1)).trans (hde (i + 1))) n).1).trans
    exact branch_mono (hd 0) (ih _ _ (fun i => hd (i + 1)) (fun i => hde (i + 1)))

theorem value_antitone_digits (d e : ℕ → ℕ)
    (hd : ∀ i, 2 ≤ d i) (hde : ∀ i, d i ≤ e i) : value e ≤ value d := by
  apply ciSup_le
  intro n
  exact (truncation_antitone_digits d e hd hde n).trans (prefix_le_value d hd n)

theorem value_const {k : ℕ} (hk : 2 ≤ k) : value (fun _ => k) = endpoint k := by
  have he := value_head (fun _ => k) (fun _ => hk)
  have hf := endpoint_fixed hk
  change value (fun _ => k) = branch k (value (fun _ => k)) at he
  have hw := width_le_half hk
  unfold branch at he hf
  nlinarith

theorem endpoint_antitone {d e : ℕ} (hd : 2 ≤ d) (hde : d ≤ e) :
    endpoint e ≤ endpoint d := by
  rw [← value_const hd, ← value_const (hd.trans hde)]
  exact value_antitone_digits (fun _ => d) (fun _ => e) (fun _ => hd) (fun _ => hde)

theorem endpoint_lt_top {k : ℕ} (hk : 3 ≤ k) :
    endpoint k < 1 / ((k : ℝ) - 1) := by
  rw [← digitTop (show 2 ≤ k by omega)]
  calc
    endpoint k = branch k (endpoint k) := (endpoint_fixed (by omega)).symm
    _ < 1 / (k : ℝ) + width k * 1 := by
      have hmul := mul_lt_mul_of_pos_left (endpoint_lt_one hk)
        (width_pos (d := k) (by omega))
      dsimp [branch]
      linarith
    _ = _ := by rw [mul_one]

theorem endpoint_lt_one_div {k p : ℕ} (hp : 2 ≤ p) (hpk : p < k) :
    endpoint k < 1 / (p : ℝ) := by
  have htop := endpoint_lt_top (show 3 ≤ p + 1 by omega)
  simp only [Nat.cast_add, Nat.cast_one, add_sub_cancel_right] at htop
  exact (endpoint_antitone (by omega : 2 ≤ p + 1) (by omega : p + 1 ≤ k)).trans_lt htop

theorem consecutive_width_bound {e : ℕ} (he : 3 ≤ e) : width e ≤ 2 * width (e + 1) := by
  have h : (3 : ℝ) ≤ e := by exact_mod_cast he
  have he0 : (e : ℝ) ≠ 0 := by linarith
  have he1 : (e : ℝ) - 1 ≠ 0 := by linarith
  have hep : (e : ℝ) + 1 ≠ 0 := by linarith
  unfold width
  simp only [Nat.cast_add, Nat.cast_one, add_sub_cancel_right]
  apply (div_le_iff₀ (mul_pos (by linarith : (0 : ℝ) < e) (by linarith : (0 : ℝ) < (e : ℝ) - 1))).2
  field_simp
  nlinarith

/-- The first-side gap is at most twice the left remaining hull.
This is uniform in both digit thresholds, including the equality case `k=3,p=2`. -/
theorem upper_gap_le_two_left {k p : ℕ} (hp : 2 ≤ p) (hpk : p < k) :
    endpoint k * width p ≤ 2 * (1 / (p : ℝ) - endpoint k) := by
  have hpR : (2 : ℝ) ≤ p := by exact_mod_cast hp
  have hp0 : (p : ℝ) ≠ 0 := by linarith
  have hp1 : (p : ℝ) - 1 ≠ 0 := by linarith
  have hbound := endpoint_antitone (by omega : 2 ≤ p + 1) (by omega : p + 1 ≤ k)
  suffices hb : endpoint (p + 1) * width p ≤ 2 * (1 / (p : ℝ) - endpoint (p + 1)) by
    calc
      _ ≤ endpoint (p + 1) * width p := mul_le_mul_of_nonneg_right hbound (width_pos hp).le
      _ ≤ _ := hb
      _ ≤ _ := by linarith
  have hden : (0 : ℝ) < ((p : ℝ) + 1) * p - 1 := by nlinarith
  have hc : (p : ℝ) * (1 + 2 * p * (p - 1)) ≤
      2 * (p - 1) * ((p + 1) * p - 1) := by
    nlinarith [mul_nonneg (show 0 ≤ (p : ℝ) - 2 by linarith)
      (show 0 ≤ 2 * (p : ℝ) - 1 by linarith)]
  have ha : endpoint (p + 1) * (1 + 2 * (p : ℝ) * (p - 1)) ≤ 2 * (p - 1) := by
    unfold endpoint
    simp only [Nat.cast_add, Nat.cast_one, add_sub_cancel_right]
    rw [div_mul_eq_mul_div]
    exact (div_le_iff₀ hden).2 hc
  unfold width
  rw [mul_one_div]
  apply (div_le_iff₀ (mul_pos (by linarith : (0 : ℝ) < p)
    (by linarith : (0 : ℝ) < (p : ℝ) - 1))).2
  calc
    endpoint (p + 1) ≤ 2 * ((p : ℝ) - 1) - 2 * endpoint (p + 1) * p * (p - 1) := by
      nlinarith
    _ = (2 * (1 / (p : ℝ) - endpoint (p + 1))) * ((p : ℝ) * (p - 1)) := by
      field_simp

theorem mem_largeDigitSet {k : ℕ} (hk : 2 ≤ k) {y : ℝ} :
    y ∈ largeDigitSet k ↔ ∃ d : ℕ → ℕ, (∀ i, k ≤ d i) ∧ value d = y := by
  constructor
  · rintro ⟨d, hd, hy⟩
    exact ⟨d, hd, (value_hasSum d fun i => hk.trans (hd i)).unique hy⟩
  · rintro ⟨d, hd, rfl⟩
    exact ⟨d, hd, value_hasSum d fun i => hk.trans (hd i)⟩

theorem smallDigitSet_endpoint_bounds {k : ℕ} (hk : 2 ≤ k) {x : ℝ}
    (hx : x ∈ smallDigitSet k) : x ∈ Icc (endpoint k) 1 := by
  obtain ⟨d, hd, rfl⟩ := mem_smallDigitSet.mp hx
  constructor
  · rw [← value_const hk]
    exact value_antitone_digits d (fun _ => k) (fun i => (hd i).1) (fun i => (hd i).2)
  · exact (value_mem d fun i => (hd i).1).2

theorem largeDigitSet_endpoint_bounds {k : ℕ} (hk : 2 ≤ k) {y : ℝ}
    (hy : y ∈ largeDigitSet k) : y ∈ Ioc (0 : ℝ) (endpoint k) := by
  obtain ⟨d, hd, rfl⟩ := (mem_largeDigitSet hk).mp hy
  constructor
  · exact (value_mem d fun i => hk.trans (hd i)).1
  · rw [← value_const hk]
    exact value_antitone_digits (fun _ => k) d (fun _ => hk) hd

theorem endpoint_mem_small {k : ℕ} (hk : 2 ≤ k) : endpoint k ∈ smallDigitSet k :=
  mem_smallDigitSet.mpr ⟨fun _ => k, fun _ => ⟨hk, le_rfl⟩, value_const hk⟩

theorem endpoint_mem_large {k : ℕ} (hk : 2 ≤ k) : endpoint k ∈ largeDigitSet k :=
  (mem_largeDigitSet hk).mpr ⟨fun _ => k, fun _ => le_rfl, value_const hk⟩

/-- The exact upper inclusion retains the excluded zero tail. -/
theorem sum_subset_target {k : ℕ} (hk : 2 ≤ k) :
    smallDigitSet k + largeDigitSet k ⊆ Ioc (endpoint k) (1 + endpoint k) := by
  rintro z ⟨x, hx, y, hy, rfl⟩
  have ha := smallDigitSet_endpoint_bounds hk hx
  have hb := largeDigitSet_endpoint_bounds hk hy
  exact ⟨by linarith [ha.1, hb.1], add_le_add ha.2 hb.2⟩

end
end GravgaardLeeUpperLower
