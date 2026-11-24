import Conjectures.HajduSarkozyBins
import Conjectures.HajduSarkozyMatrix

/-!
# Hajdu–Sárközy's shifted-power perturbation conjecture

The sparse-factor estimate for actual product sets.  Distinct retained
products are covered by images of the finite bin edge sets.  Small products
cost only the fixed cutoff; all remaining representations are bounded by the
verified triangular incidence sum.
-/

open Classical Filter Finset Asymptotics

namespace Conjectures.HajduSarkozy

noncomputable section

def shiftedPowers (k : ℕ) (c : ℤ) : Set ℕ := {n | ShiftedPower k c n}

def binMass (A : Set ℕ) (ρ : ℝ) (i : ℕ) : ℝ := (geoBin A ρ i).card

def binEdges (k : ℕ) (c : ℤ) (A B : Set ℕ) (i j : ℕ) : Finset (ℕ × ℕ) :=
  (geoBin A (thinRatio c) i ×ˢ geoBin B (thinRatio c) j).filter
    fun p => largeShiftedEdge k c p.1 p.2

def edgeCount (k : ℕ) (c : ℤ) (A B : Set ℕ) (i j : ℕ) : ℝ :=
  (binEdges k c A B i j).card

@[simp] theorem mem_binEdges {k i j : ℕ} {c : ℤ} {A B : Set ℕ} {p : ℕ × ℕ} :
    p ∈ binEdges k c A B i j ↔ p.1 ∈ geoBin A (thinRatio c) i ∧
      p.2 ∈ geoBin B (thinRatio c) j ∧ largeShiftedEdge k c p.1 p.2 := by
  simp only [binEdges, mem_filter, mem_product, and_assoc]

@[simp] theorem largeShiftedEdge_comm (k : ℕ) (c : ℤ) (a b : ℕ) :
    largeShiftedEdge k c a b ↔ largeShiftedEdge k c b a := by
  simp only [largeShiftedEdge, Nat.mul_comm]

theorem edgeCount_comm (k : ℕ) (c : ℤ) (A B : Set ℕ) (i j : ℕ) :
    edgeCount k c A B i j = edgeCount k c B A j i := by
  unfold edgeCount
  congr 1
  apply card_bij (fun p _ => p.swap)
  · intro p hp
    obtain ⟨ha, hb, hP⟩ := mem_binEdges.mp hp
    exact mem_binEdges.mpr ⟨hb, ha, (largeShiftedEdge_comm k c _ _).mp hP⟩
  · intro p _ r _ he
    exact Prod.swap_injective he
  · intro p hp
    obtain ⟨hb, ha, hP⟩ := mem_binEdges.mp hp
    exact ⟨p.swap, mem_binEdges.mpr ⟨ha, hb, (largeShiftedEdge_comm k c _ _).mp hP⟩, rfl⟩

theorem count_below_le (M : ℕ) (X : ℝ) : count {n : ℕ | n < M} X ≤ M := by
  unfold count
  apply Nat.cast_le.mpr
  calc
    (realPrefix {n : ℕ | n < M} X).card ≤ (range M).card := card_le_card (by
      intro n hn
      exact mem_range.mpr (mem_realPrefix.mp hn).2.2)
    _ = M := card_range M

theorem count_threshold_le (S : Set ℕ) (M : ℕ) (X : ℝ) :
    count S X ≤ M + count {n : ℕ | n ∈ S ∧ M ≤ n} X := by
  have hsub : S ⊆ {n : ℕ | n < M} ∪ {n : ℕ | n ∈ S ∧ M ≤ n} := by
    intro n hn
    rcases lt_or_ge n M with h | h
    · exact Or.inl h
    · exact Or.inr ⟨hn, h⟩
  exact (count_mono hsub le_rfl).trans
    ((count_union_le _ _ X).trans (add_le_add (count_below_le M X) le_rfl))

theorem large_product_count_le_triangle {k : ℕ} {c : ℤ} (hc : c ≠ 0)
    (A B : Set ℕ) (hA : Positive A) (hB : Positive B) (L : ℕ) :
    count {n : ℕ | n ∈ productSet A B ∩ shiftedPowers k c ∧ 2*c.natAbs ≤ n}
      ((thinRatio c)^L) ≤ triangleSum (edgeCount k c A B) L := by
  let V (p : ℕ × ℕ) := (binEdges k c A B p.1 p.2).image fun ab => ab.1*ab.2
  have hsub : realPrefix {n : ℕ | n ∈ productSet A B ∩ shiftedPowers k c ∧
      2*c.natAbs ≤ n} ((thinRatio c)^L) ⊆ (triangle L).biUnion V := by
    intro n hn
    obtain ⟨hn0, hnX, ⟨⟨a, ha, b, hb, he⟩, hP⟩, hlarge⟩ := mem_realPrefix.mp hn
    change ShiftedPower k c n at hP
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
  have h₂ : ∑ p ∈ triangle L, (V p).card ≤ ∑ p ∈ triangle L, (binEdges k c A B p.1 p.2).card :=
    sum_le_sum fun p _ => card_image_le
  have hh := h₁.trans h₂
  unfold count triangleSum edgeCount
  exact_mod_cast hh

theorem product_grid_isLittleO {k : ℕ} {c : ℤ} (hk : 2 ≤ k) (hc : c ≠ 0)
    {q : ℝ} (hq : 1 < q) (A B : Set ℕ) (hA : Positive A) (hB : Positive B)
    (hm : binMass A (thinRatio c) =o[atTop] fun i => q^i)
    (hn : binMass B (thinRatio c) =o[atTop] fun i => q^i) :
    (fun L : ℕ => count (productSet A B ∩ shiftedPowers k c) ((thinRatio c)^L))
      =o[atTop] fun L => q^L := by
  have htri := triangleSum_isLittleO hq (m := binMass A (thinRatio c))
    (n := binMass B (thinRatio c)) (E := edgeCount k c A B)
    (fun _ => Nat.cast_nonneg _) (fun _ => Nat.cast_nonneg _) (fun _ _ => Nat.cast_nonneg _)
    (fun i j => thin_bin_edge_card_le hk hc A B i j)
    (fun i j => by rw [edgeCount_comm]; exact thin_bin_edge_card_le hk hc B A j i) hm hn
  have hconst : (fun _ : ℕ => (2*c.natAbs : ℝ)) =o[atTop] fun L => q^L := by
    apply isLittleO_const_left.mpr
    exact Or.inr (tendsto_norm_atTop_atTop.comp (tendsto_pow_atTop_atTop_of_one_lt hq))
  apply (IsBigO.of_bound 1 ?_).trans_isLittleO (hconst.add htri)
  filter_upwards [] with L
  have hpos : 0 ≤ triangleSum (edgeCount k c A B) L := sum_nonneg fun _ _ => Nat.cast_nonneg _
  rw [one_mul, Real.norm_of_nonneg (count_nonneg _ _), Real.norm_of_nonneg (by positivity)]
  simpa only [Nat.cast_mul, Nat.cast_ofNat] using
    (count_threshold_le (productSet A B ∩ shiftedPowers k c) (2*c.natAbs) ((thinRatio c)^L)).trans
      (add_le_add le_rfl (large_product_count_le_triangle hc A B hA hB L))

end

end Conjectures.HajduSarkozy
