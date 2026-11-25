import Conjectures.HajduSarkozyProductsCommon
import Conjectures.HajduSarkozyProductsGrowth

/-!
# Hajdu–Sárközy's shifted-product total primitivity conjecture

Two fixed elements of one factor force the other factor to have little-oh
root growth. Finite coefficient heads are controlled by mixed-color common
neighbors; the summable tail has a cutoff-independent constant.
-/

open Classical Filter Finset Asymptotics

namespace Conjectures.HajduSarkozy.Products

noncomputable section

theorem bad_multiplier_card_le {u v : ℕ} {A B P : Set ℕ} {X : ℝ}
    (huA : u ∈ A) (hu0 : 0 < u) (huv : u ≤ v) :
    ((realPrefix B X).filter fun b => u*b ∉ P).card ≤
      (realPrefix (productSet A B \ P) ((v : ℝ)*X)).card := by
  apply card_le_card_of_injOn (fun b => u*b)
  · intro b hb
    obtain ⟨hbX, hbad⟩ := mem_filter.mp hb
    obtain ⟨hb0, hbX, hbB⟩ := mem_realPrefix.mp hbX
    apply mem_realPrefix.mpr
    refine ⟨Nat.mul_pos hu0 hb0, ?_, ⟨⟨u, huA, b, hbB, rfl⟩, hbad⟩⟩
    rw [Nat.cast_mul]
    exact mul_le_mul (by exact_mod_cast huv) hbX (Nat.cast_nonneg _) (Nat.cast_nonneg _)
  · intro b _ b' _ he
    exact Nat.eq_of_mul_eq_mul_left hu0 he

theorem factor_count_bound {a a' : ℕ} {A B P : Set ℕ}
    (haA : a ∈ A) (ha'A : a' ∈ A) (ha0 : 0 < a) (haa : a < a') (X : ℝ) :
    count B X ≤ 2*count (productSet A B \ P) ((a' : ℝ)*X) +
      count (commonIn P a a') X := by
  let S := realPrefix B X
  let U := S.filter fun b => a*b ∉ P
  let V := S.filter fun b => a'*b ∉ P
  let W := realPrefix (commonIn P a a') X
  let T := realPrefix (productSet A B \ P) ((a' : ℝ)*X)
  have hsub : S ⊆ (U ∪ V) ∪ W := by
    intro b hb
    by_cases h₁ : a*b ∈ P
    · by_cases h₂ : a'*b ∈ P
      · apply mem_union.mpr
        right
        obtain ⟨hb0, hbX, _⟩ := mem_realPrefix.mp hb
        exact mem_realPrefix.mpr ⟨hb0, hbX, h₁, h₂⟩
      · exact mem_union.mpr (Or.inl (mem_union.mpr (Or.inr (mem_filter.mpr ⟨hb, h₂⟩))))
    · exact mem_union.mpr (Or.inl (mem_union.mpr (Or.inl (mem_filter.mpr ⟨hb, h₁⟩))))
  have hU : U.card ≤ T.card := bad_multiplier_card_le haA ha0 haa.le
  have hV : V.card ≤ T.card := bad_multiplier_card_le ha'A (ha0.trans haa) le_rfl
  have h₁ := card_le_card hsub
  have h₂ := card_union_le (U ∪ V) W
  have h₃ := card_union_le U V
  have hh : S.card ≤ 2*T.card+W.card := by omega
  unfold count
  exact_mod_cast hh

theorem difference_head_count_le {k : ℕ} {c : ℤ} (Q : ℕ → ℕ)
    (S : Set ℕ) (T : ℕ) (X : ℝ) :
    count (S \ headPowers k c Q T) X ≤ count (S \ familyPowers k c Q) X +
      count (familyPowers k c Q \ headPowers k c Q T) X := by
  apply (count_mono ?_ le_rfl).trans (count_union_le _ _ X)
  intro n hn
  by_cases hP : n ∈ familyPowers k c Q
  · exact Or.inr ⟨hP, hn.2⟩
  · exact Or.inl ⟨hn.1, hP⟩

theorem factor_grid_isLittleO {k : ℕ} {c : ℤ} {ρ : ℝ}
    (hk : 2 ≤ k) (hc : c ≠ 0) (hρ : 1 < ρ) (Q : ℕ → ℕ)
    (hsum : Summable (fun i => coefficientWeight k (Q i))) (A B : Set ℕ)
    (hA : Positive A) (hA₂ : A.Nontrivial)
    (herror : Sparse k (productSet A B \ familyPowers k c Q)) :
    (fun L : ℕ => count B (ρ^L)) =o[atTop] fun L => (rootRatio k ρ)^L := by
  have hex : ∃ a ∈ A, ∃ a' ∈ A, a < a' := by
    obtain ⟨a, ha, a', ha', hne⟩ := hA₂
    rcases lt_or_gt_of_ne hne with h | h
    · exact ⟨a, ha, a', ha', h⟩
    · exact ⟨a', ha', a, ha, h⟩
  obtain ⟨a, ha, a', ha', haa⟩ := hex
  have ha0 := hA a ha
  have ha'0 : (0 : ℝ) < a' := by exact_mod_cast hA a' ha'
  have hk0 : 0 < k := by omega
  have hq := rootRatio_gt_one hk0 hρ
  have hE := sparse_scaled_grid (t := (a' : ℝ)) herror hρ ha'0
  obtain ⟨K, hK⟩ := head_common_grid_bound hk hc ha0 haa hρ Q
  have hconst (C : ℝ) : (fun _ : ℕ => C) =o[atTop] fun L => (rootRatio k ρ)^L := by
    apply isLittleO_const_left.mpr
    exact Or.inr (tendsto_norm_atTop_atTop.comp (tendsto_pow_atTop_atTop_of_one_lt hq))
  have hlinear := (isLittleO_coe_const_pow_of_one_lt (R := ℝ) hq).const_mul_left (K : ℝ)
  have hcommon := ((hconst (2*c.natAbs)).add hlinear).add (hconst 1)
  apply uniform_tail_isLittleO (C := 2*((a' : ℝ)+c.natAbs)^(1/(k : ℝ)))
    hq (fun L => count_nonneg B (ρ^L)) (tailMass_tendsto hsum)
  intro T
  refine ⟨fun L => 2*count (productSet A B \ familyPowers k c Q) ((a' : ℝ)*ρ^L) +
      (T : ℝ)^2*(2*(c.natAbs : ℝ)+(K : ℝ)*L+1),
    (hE.const_mul_left 2).add (hcommon.const_mul_left ((T : ℝ)^2)), ?_⟩
  intro L
  have ht := coefficient_tail_grid_le hk0 c Q hsum hρ ha'0.le T L
  calc
    count B (ρ^L) ≤ 2*count (productSet A B \ headPowers k c Q T) ((a' : ℝ)*ρ^L) +
        count (commonIn (headPowers k c Q T) a a') (ρ^L) :=
      factor_count_bound ha ha' ha0 haa (ρ^L)
    _ ≤ 2*(count (productSet A B \ familyPowers k c Q) ((a' : ℝ)*ρ^L) +
        count (familyPowers k c Q \ headPowers k c Q T) ((a' : ℝ)*ρ^L)) +
        (T : ℝ)^2*(2*(c.natAbs : ℝ)+(K : ℝ)*L+1) :=
      add_le_add (mul_le_mul_of_nonneg_left (difference_head_count_le Q _ T _) (by norm_num)) (hK T L)
    _ ≤ 2*(count (productSet A B \ familyPowers k c Q) ((a' : ℝ)*ρ^L) +
        ((a' : ℝ)+c.natAbs)^(1/(k : ℝ))*tailMass (fun i => coefficientWeight k (Q i)) T*
          (rootRatio k ρ)^L) + (T : ℝ)^2*(2*(c.natAbs : ℝ)+(K : ℝ)*L+1) :=
      add_le_add (mul_le_mul_of_nonneg_left (add_le_add le_rfl ht) (by norm_num)) le_rfl
    _ = _ := by ring

theorem factor_binMass_isLittleO {k : ℕ} {c : ℤ} {ρ : ℝ}
    (hk : 2 ≤ k) (hc : c ≠ 0) (hρ : 1 < ρ) (Q : ℕ → ℕ)
    (hsum : Summable (fun i => coefficientWeight k (Q i))) (A B : Set ℕ)
    (hA : Positive A) (hA₂ : A.Nontrivial)
    (herror : Sparse k (productSet A B \ familyPowers k c Q)) :
    binMass B ρ =o[atTop] fun L => (rootRatio k ρ)^L := by
  have hq := rootRatio_gt_one (show 0 < k by omega) hρ
  have hh := shift_isLittleO hq (factor_grid_isLittleO hk hc hρ Q hsum A B hA hA₂ herror)
  apply (IsBigO.of_bound 1 ?_).trans_isLittleO hh
  filter_upwards [] with L
  rw [one_mul, Real.norm_of_nonneg (by exact Nat.cast_nonneg _ : 0 ≤ binMass B ρ L),
    Real.norm_of_nonneg (count_nonneg B (ρ^(L+1)))]
  exact geoBin_card_le B ρ L

end

end Conjectures.HajduSarkozy.Products
