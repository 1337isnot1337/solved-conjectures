import Conjectures.HajduSarkozyProductsTails
import Conjectures.HajduSarkozyCommon

/-!
# Hajdu–Sárközy's shifted-product total primitivity conjecture

Uniform common-neighbor bounds for different fixed row coefficients. The
geometric ratio and grid comparison do not depend on either coefficient.
Summing over finitely many ordered pairs gives the finite-color estimate.
-/

open Classical Filter Finset Asymptotics

namespace Conjectures.HajduSarkozy.Products

noncomputable section

def largeScaledEdge (k : ℕ) (c : ℤ) (q a b : ℕ) : Prop :=
  ScaledShiftedPower k c q (a*b) ∧ 2*c.natAbs ≤ a*b

def mixedCommonLarge (k : ℕ) (c : ℤ) (q r a a' : ℕ) : Set ℕ :=
  {b | largeScaledEdge k c q a b ∧ largeScaledEdge k c r a' b}

def mixedCommon (k : ℕ) (c : ℤ) (q r a a' : ℕ) : Set ℕ :=
  {b | ScaledShiftedPower k c q (a*b) ∧ ScaledShiftedPower k c r (a'*b)}

def commonIn (P : Set ℕ) (a a' : ℕ) : Set ℕ :=
  {b | a*b ∈ P ∧ a'*b ∈ P}

theorem no_mixed_common_bin_pair {k q r a a' b b' j : ℕ} {c : ℤ} {σ : ℝ}
    (hk : 2 ≤ k) (hc : c ≠ 0) (ha : 0 < a) (haa : a < a') (hσ : 1 < σ)
    (hskinny : (c.natAbs : ℝ)*((a' : ℝ)-a)*(σ-1) < a)
    (hb : b ∈ geoBin (mixedCommonLarge k c q r a a') σ j)
    (hb' : b' ∈ geoBin (mixedCommonLarge k c q r a a') σ j) (hbb : b < b') : False := by
  obtain ⟨hb0, ⟨h11, h21⟩, _⟩ := mem_geoBin.mp hb
  obtain ⟨_, ⟨h12, h22⟩, _⟩ := mem_geoBin.mp hb'
  have hd : (0 : ℝ) < (c.natAbs : ℝ)*((a' : ℝ)-a) := by
    exact mul_pos (by exact_mod_cast natAbs_pos hc)
      (sub_pos.mpr (by exact_mod_cast haa))
  have hwidth := bin_difference_lt hσ hb hb'
  have hthinR : (c.natAbs : ℝ)*((a' : ℝ)-a)*((b' : ℝ)-b) < (a : ℝ)*b := by
    calc
      (c.natAbs : ℝ)*((a' : ℝ)-a)*((b' : ℝ)-b) <
        ((c.natAbs : ℝ)*((a' : ℝ)-a))*((σ-1)*(b : ℝ)) := mul_lt_mul_of_pos_left hwidth hd
      _ = ((c.natAbs : ℝ)*((a' : ℝ)-a)*(σ-1))*(b : ℝ) := by ring
      _ < (a : ℝ)*b := mul_lt_mul_of_pos_right hskinny (by exact_mod_cast hb0)
  have hthin : c.natAbs*(a'-a)*(b'-b) < a*b := by
    have hh : (c.natAbs : ℝ)*((a'-a : ℕ) : ℝ)*((b'-b : ℕ) : ℝ) < (a : ℝ)*b := by
      simpa only [Nat.cast_sub haa.le, Nat.cast_sub hbb.le] using hthinR
    exact_mod_cast hh
  exact no_thin_mixed_four_cycle hk hc ha hb0 haa hbb h11.2 hthin h11.1 h12.1 h21.1 h22.1

theorem mixed_common_bin_card_le_one {k q r a a' : ℕ} {c : ℤ} {σ : ℝ}
    (hk : 2 ≤ k) (hc : c ≠ 0) (ha : 0 < a) (haa : a < a') (hσ : 1 < σ)
    (hskinny : (c.natAbs : ℝ)*((a' : ℝ)-a)*(σ-1) < a) (j : ℕ) :
    (geoBin (mixedCommonLarge k c q r a a') σ j).card ≤ 1 := by
  apply card_le_one.mpr
  intro b hb b' hb'
  by_contra hne
  rcases lt_or_gt_of_ne hne with h | h
  · exact no_mixed_common_bin_pair hk hc ha haa hσ hskinny hb hb' h
  · exact no_mixed_common_bin_pair hk hc ha haa hσ hskinny hb' hb h

theorem mixedCommonLarge_grid_bound {k a a' : ℕ} {c : ℤ} {ρ : ℝ}
    (hk : 2 ≤ k) (hc : c ≠ 0) (ha : 0 < a) (haa : a < a') (hρ : 1 < ρ) :
    ∃ K : ℕ, ∀ q r L : ℕ, count (mixedCommonLarge k c q r a a') (ρ^L) ≤ (K : ℝ)*L+1 := by
  obtain ⟨σ, hσ, hskinny⟩ := exists_common_ratio hc ha haa
  obtain ⟨K, hK⟩ := ((tendsto_pow_atTop_atTop_of_one_lt hσ).eventually
    (eventually_ge_atTop ρ)).exists
  refine ⟨K, fun q r L => ?_⟩
  have hpow : ρ^L ≤ σ^(K*L) := by
    rw [pow_mul]
    exact pow_le_pow_left₀ (by linarith) hK L
  calc
    count (mixedCommonLarge k c q r a a') (ρ^L) ≤
        count (mixedCommonLarge k c q r a a') (σ^(K*L)) := count_mono (fun _ hn => hn) hpow
    _ ≤ ∑ j ∈ range (K*L+1), ((geoBin (mixedCommonLarge k c q r a a') σ j).card : ℝ) :=
      count_le_sum_bin_cards hσ (K*L)
    _ ≤ ∑ j ∈ range (K*L+1), (1 : ℝ) := sum_le_sum fun j _ => by
      exact_mod_cast mixed_common_bin_card_le_one (q := q) (r := r) hk hc ha haa hσ hskinny j
    _ = (K : ℝ)*L+1 := by simp

theorem mixedCommon_grid_bound {k a a' : ℕ} {c : ℤ} {ρ : ℝ}
    (hk : 2 ≤ k) (hc : c ≠ 0) (ha : 0 < a) (haa : a < a') (hρ : 1 < ρ) :
    ∃ K : ℕ, ∀ q r L : ℕ, count (mixedCommon k c q r a a') (ρ^L) ≤
      (2*c.natAbs : ℝ)+(K : ℝ)*L+1 := by
  obtain ⟨K, hK⟩ := mixedCommonLarge_grid_bound hk hc ha haa hρ
  refine ⟨K, fun q r L => ?_⟩
  have hsub : {b : ℕ | b ∈ mixedCommon k c q r a a' ∧ 2*c.natAbs ≤ b} ⊆
      mixedCommonLarge k c q r a a' := by
    intro b hb
    exact ⟨⟨hb.1.1, hb.2.trans (Nat.le_mul_of_pos_left b ha)⟩,
      ⟨hb.1.2, hb.2.trans (Nat.le_mul_of_pos_left b (ha.trans haa))⟩⟩
  have hh := (count_threshold_le (mixedCommon k c q r a a') (2*c.natAbs) (ρ^L)).trans
    (add_le_add le_rfl ((count_mono hsub le_rfl).trans (hK q r L)))
  simpa only [Nat.cast_mul, Nat.cast_ofNat, add_assoc] using hh

theorem commonIn_head_eq (k : ℕ) (c : ℤ) (Q : ℕ → ℕ) (T a a' : ℕ) :
    commonIn (headPowers k c Q T) a a' =
      {b | ∃ p ∈ range T ×ˢ range T, b ∈ mixedCommon k c (Q p.1) (Q p.2) a a'} := by
  ext b
  constructor
  · rintro ⟨⟨i, hi, h₁⟩, ⟨j, hj, h₂⟩⟩
    exact ⟨(i,j), mem_product.mpr ⟨mem_range.mpr hi, mem_range.mpr hj⟩, h₁, h₂⟩
  · rintro ⟨⟨i,j⟩, hp, h₁, h₂⟩
    obtain ⟨hi, hj⟩ := mem_product.mp hp
    exact ⟨⟨i, mem_range.mp hi, h₁⟩, ⟨j, mem_range.mp hj, h₂⟩⟩

theorem head_common_grid_bound {k a a' : ℕ} {c : ℤ} {ρ : ℝ}
    (hk : 2 ≤ k) (hc : c ≠ 0) (ha : 0 < a) (haa : a < a') (hρ : 1 < ρ)
    (Q : ℕ → ℕ) :
    ∃ K : ℕ, ∀ T L : ℕ, count (commonIn (headPowers k c Q T) a a') (ρ^L) ≤
      (T : ℝ)^2*((2*c.natAbs : ℝ)+(K : ℝ)*L+1) := by
  obtain ⟨K, hK⟩ := mixedCommon_grid_bound hk hc ha haa hρ
  refine ⟨K, fun T L => ?_⟩
  rw [commonIn_head_eq]
  calc
    count {b | ∃ p ∈ range T ×ˢ range T, b ∈ mixedCommon k c (Q p.1) (Q p.2) a a'} (ρ^L) ≤
        ∑ p ∈ range T ×ˢ range T, count (mixedCommon k c (Q p.1) (Q p.2) a a') (ρ^L) :=
      count_finite_union_le _ _ _
    _ ≤ ∑ _p ∈ range T ×ˢ range T, ((2*c.natAbs : ℝ)+(K : ℝ)*L+1) :=
      sum_le_sum fun p _ => hK (Q p.1) (Q p.2) L
    _ = (T : ℝ)^2*((2*c.natAbs : ℝ)+(K : ℝ)*L+1) := by
      simp [pow_two]
      ring

end

end Conjectures.HajduSarkozy.Products
