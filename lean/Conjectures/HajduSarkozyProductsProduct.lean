import Conjectures.HajduSarkozyProductsBins
import Conjectures.HajduSarkozyProduct

/-!
# Hajdu–Sárközy's shifted-product total primitivity conjecture

Actual retained products for each fixed coefficient are covered by finite
bin-edge images. The verified double-prefix incidence sum gives little-oh
root growth from little-oh growth of both factors.
-/

open Classical Filter Finset Asymptotics

namespace Conjectures.HajduSarkozy.Products

noncomputable section

def binEdges (k : ℕ) (c : ℤ) (d : ℕ) (A B : Set ℕ) (i j : ℕ) : Finset (ℕ × ℕ) :=
  (geoBin A (thinRatio c) i ×ˢ geoBin B (thinRatio c) j).filter
    fun p => largeScaledEdge k c d p.1 p.2

def edgeCount (k : ℕ) (c : ℤ) (d : ℕ) (A B : Set ℕ) (i j : ℕ) : ℝ :=
  (binEdges k c d A B i j).card

@[simp] theorem mem_binEdges {k d i j : ℕ} {c : ℤ} {A B : Set ℕ} {p : ℕ × ℕ} :
    p ∈ binEdges k c d A B i j ↔ p.1 ∈ geoBin A (thinRatio c) i ∧
      p.2 ∈ geoBin B (thinRatio c) j ∧ largeScaledEdge k c d p.1 p.2 := by
  simp only [binEdges, mem_filter, mem_product, and_assoc]

@[simp] theorem largeScaledEdge_comm (k : ℕ) (c : ℤ) (d a b : ℕ) :
    largeScaledEdge k c d a b ↔ largeScaledEdge k c d b a := by
  simp only [largeScaledEdge, Nat.mul_comm]

theorem edgeCount_comm (k : ℕ) (c : ℤ) (d : ℕ) (A B : Set ℕ) (i j : ℕ) :
    edgeCount k c d A B i j = edgeCount k c d B A j i := by
  unfold edgeCount
  congr 1
  apply card_bij (fun p _ => p.swap)
  · intro p hp
    obtain ⟨ha, hb, hP⟩ := mem_binEdges.mp hp
    exact mem_binEdges.mpr ⟨hb, ha, (largeScaledEdge_comm k c d _ _).mp hP⟩
  · intro p _ r _ he
    exact Prod.swap_injective he
  · intro p hp
    obtain ⟨hb, ha, hP⟩ := mem_binEdges.mp hp
    exact ⟨p.swap, mem_binEdges.mpr ⟨ha, hb, (largeScaledEdge_comm k c d _ _).mp hP⟩, rfl⟩

theorem large_product_count_le_triangle {k : ℕ} {c : ℤ} (hc : c ≠ 0)
    (d : ℕ) (A B : Set ℕ) (hA : Positive A) (hB : Positive B) (L : ℕ) :
    count {n : ℕ | n ∈ productSet A B ∩ scaledPowers k c d ∧ 2*c.natAbs ≤ n}
      ((thinRatio c)^L) ≤ triangleSum (edgeCount k c d A B) L := by
  let V (p : ℕ × ℕ) := (binEdges k c d A B p.1 p.2).image fun ab => ab.1*ab.2
  have hsub : realPrefix {n : ℕ | n ∈ productSet A B ∩ scaledPowers k c d ∧
      2*c.natAbs ≤ n} ((thinRatio c)^L) ⊆ (triangle L).biUnion V := by
    intro n hn
    obtain ⟨hn0, hnX, ⟨⟨a, ha, b, hb, he⟩, hP⟩, hlarge⟩ := mem_realPrefix.mp hn
    change ScaledShiftedPower k c d n at hP
    have ha0 := hA a ha
    have hb0 := hB b hb
    have han : a ≤ n := by rw [← he]; exact Nat.le_mul_of_pos_right a hb0
    have hbn : b ≤ n := by rw [← he, mul_comm]; exact Nat.le_mul_of_pos_right b ha0
    have haX : (a : ℝ) ≤ (thinRatio c)^L := (by exact_mod_cast han : (a : ℝ) ≤ n).trans hnX
    have hbX : (b : ℝ) ≤ (thinRatio c)^L := (by exact_mod_cast hbn : (b : ℝ) ≤ n).trans hnX
    obtain ⟨i, _, hai⟩ := realPrefix_covered_by_bins (thinRatio_gt_one hc)
      (mem_realPrefix.mpr ⟨ha0, haX, ha⟩)
    obtain ⟨j, _, hbj⟩ := realPrefix_covered_by_bins (thinRatio_gt_one hc)
      (mem_realPrefix.mpr ⟨hb0, hbX, hb⟩)
    have habX : (a : ℝ)*b ≤ (thinRatio c)^L := by
      simpa only [← he, Nat.cast_mul] using hnX
    have hij := product_bin_indices (thinRatio_gt_one hc) hai hbj habX
    apply mem_biUnion.mpr
    refine ⟨(i,j), mem_triangle.mpr hij, ?_⟩
    apply mem_image.mpr
    refine ⟨(a,b), mem_binEdges.mpr ⟨hai, hbj, ?_⟩, he⟩
    exact ⟨by simpa only [he] using hP, by simpa only [he] using hlarge⟩
  have h₁ := (card_le_card hsub).trans card_biUnion_le
  have h₂ : ∑ p ∈ triangle L, (V p).card ≤ ∑ p ∈ triangle L, (binEdges k c d A B p.1 p.2).card :=
    sum_le_sum fun p _ => card_image_le
  have hh := h₁.trans h₂
  unfold count triangleSum edgeCount
  exact_mod_cast hh

theorem product_grid_isLittleO {k : ℕ} {c : ℤ} (hk : 2 ≤ k) (hc : c ≠ 0)
    {q : ℝ} (hq : 1 < q) (d : ℕ) (A B : Set ℕ) (hA : Positive A) (hB : Positive B)
    (hm : binMass A (thinRatio c) =o[atTop] fun i => q^i)
    (hn : binMass B (thinRatio c) =o[atTop] fun i => q^i) :
    (fun L : ℕ => count (productSet A B ∩ scaledPowers k c d) ((thinRatio c)^L))
      =o[atTop] fun L => q^L := by
  have htri := triangleSum_isLittleO hq (m := binMass A (thinRatio c))
    (n := binMass B (thinRatio c)) (E := edgeCount k c d A B)
    (fun _ => Nat.cast_nonneg _) (fun _ => Nat.cast_nonneg _) (fun _ _ => Nat.cast_nonneg _)
    (fun i j => thin_bin_edge_card_le hk hc d A B i j)
    (fun i j => by rw [edgeCount_comm]; exact thin_bin_edge_card_le hk hc d B A j i) hm hn
  have hconst : (fun _ : ℕ => (2*c.natAbs : ℝ)) =o[atTop] fun L => q^L := by
    apply isLittleO_const_left.mpr
    exact Or.inr (tendsto_norm_atTop_atTop.comp (tendsto_pow_atTop_atTop_of_one_lt hq))
  apply (IsBigO.of_bound 1 ?_).trans_isLittleO (hconst.add htri)
  filter_upwards [] with L
  have hpos : 0 ≤ triangleSum (edgeCount k c d A B) L := sum_nonneg fun _ _ => Nat.cast_nonneg _
  rw [one_mul, Real.norm_of_nonneg (count_nonneg _ _), Real.norm_of_nonneg (by positivity)]
  simpa only [Nat.cast_mul, Nat.cast_ofNat] using
    (count_threshold_le (productSet A B ∩ scaledPowers k c d) (2*c.natAbs) ((thinRatio c)^L)).trans
      (add_le_add le_rfl (large_product_count_le_triangle hc d A B hA hB L))

end

end Conjectures.HajduSarkozy.Products
