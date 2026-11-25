import Conjectures.HajduSarkozyProduct

/-!
# Hajdu–Sárközy's shifted-power perturbation conjecture

Two fixed positive multipliers have only linearly many common shifted-power
neighbors along any geometric grid.  This is exactly the logarithmic common
neighbor estimate from the recorded argument, with the logarithm eliminated
by comparing two geometric grids.
-/

open Classical Filter Finset Asymptotics

namespace Conjectures.HajduSarkozy

noncomputable section

def commonLarge (k : ℕ) (c : ℤ) (a a' : ℕ) : Set ℕ :=
  {b | largeShiftedEdge k c a b ∧ largeShiftedEdge k c a' b}

def commonPowers (k : ℕ) (c : ℤ) (a a' : ℕ) : Set ℕ :=
  {b | ShiftedPower k c (a*b) ∧ ShiftedPower k c (a'*b)}

theorem no_common_bin_pair {k a a' b b' j : ℕ} {c : ℤ} {σ : ℝ}
    (hk : 2 ≤ k) (hc : c ≠ 0) (ha : 0 < a) (haa : a < a') (hσ : 1 < σ)
    (hskinny : (c.natAbs : ℝ)*((a' : ℝ)-a)*(σ-1) < a)
    (hb : b ∈ geoBin (commonLarge k c a a') σ j)
    (hb' : b' ∈ geoBin (commonLarge k c a a') σ j) (hbb : b < b') : False := by
  obtain ⟨hb0, ⟨h11, h21⟩, _⟩ := mem_geoBin.mp hb
  obtain ⟨_, ⟨h12, h22⟩, _⟩ := mem_geoBin.mp hb'
  have hd : (0 : ℝ) < (c.natAbs : ℝ)*((a' : ℝ)-a) := by
    apply mul_pos
    · exact_mod_cast natAbs_pos hc
    · exact sub_pos.mpr (by exact_mod_cast haa)
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
  exact no_thin_four_cycle hk hc ha hb0 haa hbb h11.2 hthin h11.1 h12.1 h21.1 h22.1

theorem common_bin_card_le_one {k a a' : ℕ} {c : ℤ} {σ : ℝ}
    (hk : 2 ≤ k) (hc : c ≠ 0) (ha : 0 < a) (haa : a < a') (hσ : 1 < σ)
    (hskinny : (c.natAbs : ℝ)*((a' : ℝ)-a)*(σ-1) < a) (j : ℕ) :
    (geoBin (commonLarge k c a a') σ j).card ≤ 1 := by
  apply card_le_one.mpr
  intro b hb b' hb'
  by_contra hne
  rcases lt_or_gt_of_ne hne with h | h
  · exact no_common_bin_pair hk hc ha haa hσ hskinny hb hb' h
  · exact no_common_bin_pair hk hc ha haa hσ hskinny hb' hb h

theorem exists_common_ratio {a a' : ℕ} {c : ℤ}
    (hc : c ≠ 0) (ha : 0 < a) (haa : a < a') :
    ∃ σ : ℝ, 1 < σ ∧ (c.natAbs : ℝ)*((a' : ℝ)-a)*(σ-1) < a := by
  let D : ℝ := (c.natAbs : ℝ)*((a' : ℝ)-a)
  have hD : 0 < D := mul_pos (by exact_mod_cast natAbs_pos hc)
    (sub_pos.mpr (by exact_mod_cast haa))
  have haR : (0 : ℝ) < a := by exact_mod_cast ha
  refine ⟨1+(a : ℝ)/(2*D), lt_add_of_pos_right _ (by positivity), ?_⟩
  change D*(1+(a : ℝ)/(2*D)-1) < (a : ℝ)
  have he : D*(1+(a : ℝ)/(2*D)-1) = (a : ℝ)/2 := by field_simp; ring
  rw [he]
  linarith

theorem commonLarge_grid_bound {k a a' : ℕ} {c : ℤ} {ρ : ℝ}
    (hk : 2 ≤ k) (hc : c ≠ 0) (ha : 0 < a) (haa : a < a') (hρ : 1 < ρ) :
    ∃ K : ℕ, ∀ L : ℕ, count (commonLarge k c a a') (ρ^L) ≤ (K : ℝ)*L+1 := by
  obtain ⟨σ, hσ, hskinny⟩ := exists_common_ratio hc ha haa
  obtain ⟨K, hK⟩ := ((tendsto_pow_atTop_atTop_of_one_lt hσ).eventually
    (eventually_ge_atTop ρ)).exists
  refine ⟨K, fun L => ?_⟩
  have hpow : ρ^L ≤ σ^(K*L) := by
    rw [pow_mul]
    exact pow_le_pow_left₀ (by linarith) hK L
  calc
    count (commonLarge k c a a') (ρ^L) ≤ count (commonLarge k c a a') (σ^(K*L)) :=
      count_mono (by intro n hn; exact hn) hpow
    _ ≤ ∑ j ∈ range (K*L+1), ((geoBin (commonLarge k c a a') σ j).card : ℝ) :=
      count_le_sum_bin_cards hσ (K*L)
    _ ≤ ∑ j ∈ range (K*L+1), (1 : ℝ) := sum_le_sum fun j _ => by
      exact_mod_cast common_bin_card_le_one hk hc ha haa hσ hskinny j
    _ = (K : ℝ)*L+1 := by simp

theorem commonPowers_grid_bound {k a a' : ℕ} {c : ℤ} {ρ : ℝ}
    (hk : 2 ≤ k) (hc : c ≠ 0) (ha : 0 < a) (haa : a < a') (hρ : 1 < ρ) :
    ∃ K : ℕ, ∀ L : ℕ, count (commonPowers k c a a') (ρ^L) ≤
      (2*c.natAbs : ℝ) + (K : ℝ)*L+1 := by
  obtain ⟨K, hK⟩ := commonLarge_grid_bound hk hc ha haa hρ
  have hsub : {b : ℕ | b ∈ commonPowers k c a a' ∧ 2*c.natAbs ≤ b} ⊆ commonLarge k c a a' := by
    intro b hb
    exact ⟨⟨hb.1.1, hb.2.trans (Nat.le_mul_of_pos_left b ha)⟩,
      ⟨hb.1.2, hb.2.trans (Nat.le_mul_of_pos_left b (ha.trans haa))⟩⟩
  refine ⟨K, fun L => ?_⟩
  have hh := (count_threshold_le (commonPowers k c a a') (2*c.natAbs) (ρ^L)).trans
    (add_le_add le_rfl ((count_mono hsub le_rfl).trans (hK L)))
  simpa only [Nat.cast_mul, Nat.cast_ofNat, add_assoc] using hh

end

end Conjectures.HajduSarkozy
