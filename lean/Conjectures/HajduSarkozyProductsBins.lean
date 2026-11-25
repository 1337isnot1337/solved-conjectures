import Conjectures.HajduSarkozyProductsCommon

/-!
# Hajdu–Sárközy's shifted-product total primitivity conjecture

The four-cycle obstruction for each fixed coefficient on thin geometric
bins. The exact finite incidence estimate is reused from the independently
checked shifted-power formalization.
-/

open Classical Finset

namespace Conjectures.HajduSarkozy.Products

noncomputable section

theorem no_thin_bin_four_cycle {k q : ℕ} {c : ℤ} (hk : 2 ≤ k) (hc : c ≠ 0)
    {A B : Set ℕ} {i j a a' b b' : ℕ}
    (ha : a ∈ geoBin A (thinRatio c) i) (ha' : a' ∈ geoBin A (thinRatio c) i)
    (hb : b ∈ geoBin B (thinRatio c) j) (hb' : b' ∈ geoBin B (thinRatio c) j)
    (haa : a < a') (hbb : b < b')
    (h11 : largeScaledEdge k c q a b) (h12 : largeScaledEdge k c q a b')
    (h21 : largeScaledEdge k c q a' b) (h22 : largeScaledEdge k c q a' b') : False := by
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
  exact no_thin_mixed_four_cycle hk hc ha0 hb0 haa hbb h11.2 hthin h11.1 h12.1 h21.1 h22.1

theorem thin_bin_edge_card_le {k : ℕ} {c : ℤ} (hk : 2 ≤ k) (hc : c ≠ 0)
    (q : ℕ) (A B : Set ℕ) (i j : ℕ) :
    (((geoBin A (thinRatio c) i ×ˢ geoBin B (thinRatio c) j).filter
      fun p => largeScaledEdge k c q p.1 p.2).card : ℝ) ≤
      ((geoBin A (thinRatio c) i).card : ℝ)^2 + (geoBin B (thinRatio c) j).card := by
  have hh := filter_product_card_le (geoBin A (thinRatio c) i)
    (geoBin B (thinRatio c) j) (largeScaledEdge k c q) (by
    intro a ha a' ha' b hb b' hb' haa h11 h12 h21 h22
    by_contra hbb
    rcases lt_or_gt_of_ne haa with haa | haa <;> rcases lt_or_gt_of_ne hbb with hbb | hbb
    · exact no_thin_bin_four_cycle hk hc ha ha' hb hb' haa hbb h11 h12 h21 h22
    · exact no_thin_bin_four_cycle hk hc ha ha' hb' hb haa hbb h12 h11 h22 h21
    · exact no_thin_bin_four_cycle hk hc ha' ha hb hb' haa hbb h21 h22 h11 h12
    · exact no_thin_bin_four_cycle hk hc ha' ha hb' hb haa hbb h22 h21 h12 h11)
  exact_mod_cast hh

end

end Conjectures.HajduSarkozy.Products
