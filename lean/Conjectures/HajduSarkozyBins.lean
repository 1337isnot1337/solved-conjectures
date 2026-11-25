import Conjectures.HajduSarkozyCounts
import Conjectures.HajduSarkozyIncidence

/-!
# Hajdu–Sárközy's shifted-power perturbation conjecture

Finite geometric bins of actual positive integers.  The graph retains exactly
those shifted-power products above the fixed small-product cutoff.  The exact
determinant obstruction makes every thin-bin rectangle four-cycle-free.
-/

open Classical Finset

namespace Conjectures.HajduSarkozy

noncomputable section

def geoBin (S : Set ℕ) (ρ : ℝ) (i : ℕ) : Finset ℕ :=
  (realPrefix S (ρ^(i+1))).filter fun n => ρ^i ≤ (n : ℝ) ∧ (n : ℝ) < ρ^(i+1)

@[simp] theorem mem_geoBin {S : Set ℕ} {ρ : ℝ} {i n : ℕ} :
    n ∈ geoBin S ρ i ↔ 0 < n ∧ n ∈ S ∧ ρ^i ≤ (n : ℝ) ∧ (n : ℝ) < ρ^(i+1) := by
  simp only [geoBin, mem_filter, mem_realPrefix]
  constructor
  · rintro ⟨⟨hn, _, hS⟩, hl, hu⟩
    exact ⟨hn, hS, hl, hu⟩
  · rintro ⟨hn, hS, hl, hu⟩
    exact ⟨⟨hn, hu.le, hS⟩, hl, hu⟩

theorem geoBin_card_le (S : Set ℕ) (ρ : ℝ) (i : ℕ) :
    ((geoBin S ρ i).card : ℝ) ≤ count S (ρ^(i+1)) := by
  unfold geoBin count
  exact_mod_cast card_filter_le (realPrefix S (ρ^(i+1))) _

theorem geoBin_index_unique {S T : Set ℕ} {ρ : ℝ} (hρ : 1 < ρ)
    {i j n : ℕ} (hi : n ∈ geoBin S ρ i) (hj : n ∈ geoBin T ρ j) : i = j := by
  have hi' := mem_geoBin.mp hi
  have hj' := mem_geoBin.mp hj
  apply le_antisymm
  · by_contra h
    have hp : ρ^(j+1) ≤ ρ^i := pow_le_pow_right₀ hρ.le (by omega)
    linarith [hi'.2.2.1, hj'.2.2.2]
  · by_contra h
    have hp : ρ^(i+1) ≤ ρ^j := pow_le_pow_right₀ hρ.le (by omega)
    linarith [hj'.2.2.1, hi'.2.2.2]

theorem realPrefix_covered_by_bins {S : Set ℕ} {ρ : ℝ} (hρ : 1 < ρ)
    {L n : ℕ} (hn : n ∈ realPrefix S (ρ^L)) :
    ∃ i ∈ range (L+1), n ∈ geoBin S ρ i := by
  obtain ⟨hn, hupper, hS⟩ := mem_realPrefix.mp hn
  have hp : ρ^L < ρ^(L+1) := (pow_lt_pow_iff_right₀ hρ).mpr (by omega)
  have hex : ∃ i : ℕ, (n : ℝ) < ρ^(i+1) := ⟨L, hupper.trans_lt hp⟩
  let i := Nat.find hex
  have hi : i ≤ L := Nat.find_min' hex (hupper.trans_lt hp)
  have hlow : ρ^i ≤ (n : ℝ) := by
    by_cases hzero : i = 0
    · rw [hzero, pow_zero]
      exact_mod_cast hn
    · have hpred := Nat.find_min hex (show i-1 < i by omega)
      change ¬ (n : ℝ) < ρ^(i-1+1) at hpred
      rw [Nat.sub_add_cancel (by omega : 1 ≤ i)] at hpred
      exact le_of_not_gt hpred
  exact ⟨i, mem_range.mpr (by omega), mem_geoBin.mpr
    ⟨hn, hS, hlow, Nat.find_spec hex⟩⟩

theorem count_le_sum_bin_cards {S : Set ℕ} {ρ : ℝ} (hρ : 1 < ρ) (L : ℕ) :
    count S (ρ^L) ≤ ∑ i ∈ range (L+1), ((geoBin S ρ i).card : ℝ) := by
  have hsub : realPrefix S (ρ^L) ⊆ (range (L+1)).biUnion (geoBin S ρ) := by
    intro n hn
    obtain ⟨i, hi, hni⟩ := realPrefix_covered_by_bins hρ hn
    exact mem_biUnion.mpr ⟨i, hi, hni⟩
  have hh := (card_le_card hsub).trans (card_biUnion_le)
  unfold count
  exact_mod_cast hh

theorem product_bin_indices {A B : Set ℕ} {ρ : ℝ} (hρ : 1 < ρ)
    {a b i j L : ℕ} (ha : a ∈ geoBin A ρ i) (hb : b ∈ geoBin B ρ j)
    (hab : (a : ℝ)*b ≤ ρ^L) : i+j ≤ L := by
  apply (pow_le_pow_iff_right₀ hρ).mp
  rw [pow_add]
  exact (mul_le_mul (mem_geoBin.mp ha).2.2.1 (mem_geoBin.mp hb).2.2.1
    (by positivity) (by positivity)).trans hab

def largeShiftedEdge (k : ℕ) (c : ℤ) (a b : ℕ) : Prop :=
  ShiftedPower k c (a*b) ∧ 2*c.natAbs ≤ a*b

def thinRatio (c : ℤ) : ℝ := 1 + 1/(2*(c.natAbs : ℝ))

theorem natAbs_pos {c : ℤ} (hc : c ≠ 0) : 0 < c.natAbs :=
  Nat.pos_of_ne_zero (fun h => hc (Int.natAbs_eq_zero.mp h))

theorem thinRatio_gt_one {c : ℤ} (hc : c ≠ 0) : 1 < thinRatio c := by
  have hd : (0 : ℝ) < c.natAbs := by exact_mod_cast natAbs_pos hc
  dsimp [thinRatio]
  exact lt_add_of_pos_right _ (by positivity)

theorem thinRatio_skinny {c : ℤ} (hc : c ≠ 0) :
    (c.natAbs : ℝ)*(thinRatio c-1)^2 < 1 := by
  have hd : (1 : ℝ) ≤ c.natAbs := by exact_mod_cast natAbs_pos hc
  have hd0 : (c.natAbs : ℝ) ≠ 0 := by linarith
  have he : (c.natAbs : ℝ)*(thinRatio c-1)^2 = 1/(4*(c.natAbs : ℝ)) := by
    dsimp [thinRatio]
    field_simp
    ring
  rw [he]
  exact (div_lt_one (by positivity)).mpr (by linarith)

theorem bin_difference_lt {S T : Set ℕ} {ρ : ℝ} (hρ : 1 < ρ)
    {a a' i : ℕ} (ha : a ∈ geoBin S ρ i) (ha' : a' ∈ geoBin T ρ i) :
    (a' : ℝ)-a < (ρ-1)*(a : ℝ) := by
  have h₁ := (mem_geoBin.mp ha).2.2.1
  have h₂ := (mem_geoBin.mp ha').2.2.2
  calc
    (a' : ℝ)-a < ρ^(i+1)-a := sub_lt_sub_right h₂ _
    _ ≤ ρ*(a : ℝ)-a := by
      apply sub_le_sub_right
      rw [pow_succ, mul_comm]
      exact mul_le_mul_of_nonneg_left h₁ (by linarith)
    _ = (ρ-1)*(a : ℝ) := by ring

theorem no_thin_bin_four_cycle {k : ℕ} {c : ℤ} (hk : 2 ≤ k) (hc : c ≠ 0)
    {A B : Set ℕ} {i j a a' b b' : ℕ}
    (ha : a ∈ geoBin A (thinRatio c) i) (ha' : a' ∈ geoBin A (thinRatio c) i)
    (hb : b ∈ geoBin B (thinRatio c) j) (hb' : b' ∈ geoBin B (thinRatio c) j)
    (haa : a < a') (hbb : b < b')
    (h11 : largeShiftedEdge k c a b) (h12 : largeShiftedEdge k c a b')
    (h21 : largeShiftedEdge k c a' b) (h22 : largeShiftedEdge k c a' b') : False := by
  have hρ := thinRatio_gt_one hc
  have hd : (0 : ℝ) < c.natAbs := by exact_mod_cast natAbs_pos hc
  have ha0 := (mem_geoBin.mp ha).1
  have hb0 := (mem_geoBin.mp hb).1
  have hda := bin_difference_lt hρ ha ha'
  have hdb := bin_difference_lt hρ hb hb'
  have hda0 : (0 : ℝ) < (a' : ℝ)-a := by exact sub_pos.mpr (by exact_mod_cast haa)
  have hdb0 : (0 : ℝ) < (b' : ℝ)-b := by exact sub_pos.mpr (by exact_mod_cast hbb)
  have hh : ((a' : ℝ)-a)*((b' : ℝ)-b) <
      ((thinRatio c-1)*(a : ℝ))*((thinRatio c-1)*(b : ℝ)) :=
    mul_lt_mul hda hdb.le hdb0 (by positivity)
  have hthinR : (c.natAbs : ℝ)*((a' : ℝ)-a)*((b' : ℝ)-b) < (a : ℝ)*b := by
    calc
      (c.natAbs : ℝ)*((a' : ℝ)-a)*((b' : ℝ)-b) =
          (c.natAbs : ℝ)*(((a' : ℝ)-a)*((b' : ℝ)-b)) := by ring
      _ < (c.natAbs : ℝ)*(((thinRatio c-1)*(a : ℝ))*((thinRatio c-1)*(b : ℝ))) :=
        mul_lt_mul_of_pos_left hh hd
      _ = ((c.natAbs : ℝ)*(thinRatio c-1)^2)*((a : ℝ)*b) := by ring
      _ < 1*((a : ℝ)*b) := mul_lt_mul_of_pos_right (thinRatio_skinny hc) (by positivity)
      _ = (a : ℝ)*b := one_mul _
  have hthin : c.natAbs*(a'-a)*(b'-b) < a*b := by
    have hh : (c.natAbs : ℝ)*((a'-a : ℕ) : ℝ)*((b'-b : ℕ) : ℝ) < (a : ℝ)*b := by
      simpa only [Nat.cast_sub haa.le, Nat.cast_sub hbb.le] using hthinR
    exact_mod_cast hh
  exact no_thin_four_cycle hk hc ha0 hb0 haa hbb h11.2 hthin h11.1 h12.1 h21.1 h22.1

theorem thin_bin_edge_card_le {k : ℕ} {c : ℤ} (hk : 2 ≤ k) (hc : c ≠ 0)
    (A B : Set ℕ) (i j : ℕ) :
    (((geoBin A (thinRatio c) i ×ˢ geoBin B (thinRatio c) j).filter
      fun p => largeShiftedEdge k c p.1 p.2).card : ℝ) ≤
      ((geoBin A (thinRatio c) i).card : ℝ)^2 + (geoBin B (thinRatio c) j).card := by
  have hh := filter_product_card_le (geoBin A (thinRatio c) i)
    (geoBin B (thinRatio c) j) (largeShiftedEdge k c) (by
    intro a ha a' ha' b hb b' hb' haa h11 h12 h21 h22
    by_contra hbb
    rcases lt_or_gt_of_ne haa with haa | haa <;> rcases lt_or_gt_of_ne hbb with hbb | hbb
    · exact no_thin_bin_four_cycle hk hc ha ha' hb hb' haa hbb h11 h12 h21 h22
    · exact no_thin_bin_four_cycle hk hc ha ha' hb' hb haa hbb h12 h11 h22 h21
    · exact no_thin_bin_four_cycle hk hc ha' ha hb hb' haa hbb h21 h22 h11 h12
    · exact no_thin_bin_four_cycle hk hc ha' ha hb' hb haa hbb h22 h21 h12 h11)
  exact_mod_cast hh

end

end Conjectures.HajduSarkozy
