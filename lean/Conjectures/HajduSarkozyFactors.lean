import Conjectures.HajduSarkozyCommon
import Mathlib.Analysis.SpecificLimits.Normed

/-!
# Hajdu–Sárközy's shifted-power perturbation conjecture

An approximate product decomposition forces both factors to be sparse.
The two multiplication maps are proved injective on actual finite prefixes;
their exceptional images are counted in the actual missing-power set.
-/

open Classical Filter Finset Asymptotics

namespace Conjectures.HajduSarkozy

noncomputable section

def rootRatio (k : ℕ) (ρ : ℝ) : ℝ := ρ^(1/(k : ℝ))

theorem rootRatio_gt_one {k : ℕ} {ρ : ℝ} (hk : 0 < k) (hρ : 1 < ρ) :
    1 < rootRatio k ρ := Real.one_lt_rpow hρ (by positivity)

theorem rootRatio_pow {k : ℕ} {ρ : ℝ} (hk : 0 < k) (hρ : 0 ≤ ρ) :
    (rootRatio k ρ)^k = ρ := by
  unfold rootRatio
  rw [one_div]
  exact Real.rpow_inv_natCast_pow hρ hk.ne'

theorem sparse_scaled_grid {k : ℕ} {S : Set ℕ} {ρ t : ℝ}
    (hS : Sparse k S) (hρ : 1 < ρ) (ht : 0 < t) :
    (fun L : ℕ => count S (t*ρ^L)) =o[atTop] fun L => (rootRatio k ρ)^L := by
  have hgrid : Tendsto (fun L : ℕ => t*ρ^L) atTop atTop :=
    Tendsto.const_mul_atTop ht (tendsto_pow_atTop_atTop_of_one_lt hρ)
  have hcomp := hS.comp_tendsto hgrid
  have he (L : ℕ) : (t*ρ^L)^(1/(k : ℝ)) = t^(1/(k : ℝ))*(rootRatio k ρ)^L := by
    rw [Real.mul_rpow ht.le (pow_nonneg (by linarith) L)]
    rw [← Real.rpow_pow_comm (by linarith : 0 ≤ ρ)]
    rfl
  have hb : (fun L : ℕ => (t*ρ^L)^(1/(k : ℝ))) =O[atTop] fun L => (rootRatio k ρ)^L := by
    simp_rw [he]
    exact (isBigO_refl (fun L : ℕ => (rootRatio k ρ)^L) atTop).const_mul_left (t^(1/(k : ℝ)))
  exact hcomp.trans_isBigO hb

theorem bad_multiplier_card_le {k u v : ℕ} {c : ℤ} {A B : Set ℕ} {X : ℝ}
    (huA : u ∈ A) (hu0 : 0 < u) (huv : u ≤ v) :
    ((realPrefix B X).filter fun b => u*b ∉ shiftedPowers k c).card ≤
      (realPrefix (productSet A B \ shiftedPowers k c) ((v : ℝ)*X)).card := by
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

theorem factor_count_bound {k a a' : ℕ} {c : ℤ} {A B : Set ℕ}
    (haA : a ∈ A) (ha'A : a' ∈ A) (ha0 : 0 < a) (haa : a < a') (X : ℝ) :
    count B X ≤ 2*count (productSet A B \ shiftedPowers k c) ((a' : ℝ)*X) +
      count (commonPowers k c a a') X := by
  let S := realPrefix B X
  let U := S.filter fun b => a*b ∉ shiftedPowers k c
  let V := S.filter fun b => a'*b ∉ shiftedPowers k c
  let W := realPrefix (commonPowers k c a a') X
  let T := realPrefix (productSet A B \ shiftedPowers k c) ((a' : ℝ)*X)
  have hsub : S ⊆ (U ∪ V) ∪ W := by
    intro b hb
    by_cases h₁ : a*b ∈ shiftedPowers k c
    · by_cases h₂ : a'*b ∈ shiftedPowers k c
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

theorem factor_grid_isLittleO {k : ℕ} {c : ℤ} {ρ : ℝ}
    (hk : 2 ≤ k) (hc : c ≠ 0) (hρ : 1 < ρ) (A B : Set ℕ)
    (hA : Positive A) (hA₂ : A.Nontrivial)
    (herror : Sparse k (productSet A B \ shiftedPowers k c)) :
    (fun L : ℕ => count B (ρ^L)) =o[atTop] fun L => (rootRatio k ρ)^L := by
  have hex : ∃ a ∈ A, ∃ a' ∈ A, a < a' := by
    obtain ⟨a, ha, a', ha', hne⟩ := hA₂
    rcases lt_or_gt_of_ne hne with h | h
    · exact ⟨a, ha, a', ha', h⟩
    · exact ⟨a', ha', a, ha, h⟩
  obtain ⟨a, ha, a', ha', haa⟩ := hex
  have ha0 := hA a ha
  have hq := rootRatio_gt_one (show 0 < k by omega) hρ
  have hE := sparse_scaled_grid (t := (a' : ℝ)) herror hρ (by exact_mod_cast hA a' ha')
  have hE₂ := hE.const_mul_left 2
  obtain ⟨K, hK⟩ := commonPowers_grid_bound hk hc ha0 haa hρ
  have hconst (C : ℝ) : (fun _ : ℕ => C) =o[atTop] fun L => (rootRatio k ρ)^L := by
    apply isLittleO_const_left.mpr
    exact Or.inr (tendsto_norm_atTop_atTop.comp (tendsto_pow_atTop_atTop_of_one_lt hq))
  have hlinear := (isLittleO_coe_const_pow_of_one_lt (R := ℝ) hq).const_mul_left (K : ℝ)
  have hcommon := ((hconst (2*c.natAbs)).add hlinear).add (hconst 1)
  have hbound := hE₂.add hcommon
  apply (IsBigO.of_bound 1 ?_).trans_isLittleO hbound
  filter_upwards [] with L
  rw [one_mul, Real.norm_of_nonneg (count_nonneg _ _), Real.norm_of_nonneg (by
    have hcount := count_nonneg (productSet A B \ shiftedPowers k c) ((a' : ℝ)*ρ^L)
    positivity)]
  exact (factor_count_bound ha ha' ha0 haa (ρ^L)).trans (add_le_add le_rfl (hK L))

theorem factor_binMass_isLittleO {k : ℕ} {c : ℤ} {ρ : ℝ}
    (hk : 2 ≤ k) (hc : c ≠ 0) (hρ : 1 < ρ) (A B : Set ℕ)
    (hA : Positive A) (hA₂ : A.Nontrivial)
    (herror : Sparse k (productSet A B \ shiftedPowers k c)) :
    binMass B ρ =o[atTop] fun L => (rootRatio k ρ)^L := by
  have hq := rootRatio_gt_one (show 0 < k by omega) hρ
  have hh := shift_isLittleO hq (factor_grid_isLittleO hk hc hρ A B hA hA₂ herror)
  apply (IsBigO.of_bound 1 ?_).trans_isLittleO hh
  filter_upwards [] with L
  rw [one_mul, Real.norm_of_nonneg (by exact Nat.cast_nonneg _ : 0 ≤ binMass B ρ L),
    Real.norm_of_nonneg (count_nonneg B (ρ^(L+1)))]
  exact geoBin_card_le B ρ L

theorem productSet_comm (A B : Set ℕ) : productSet A B = productSet B A := by
  ext n
  constructor
  · rintro ⟨a, ha, b, hb, he⟩
    exact ⟨b, hb, a, ha, by simpa only [Nat.mul_comm] using he⟩
  · rintro ⟨b, hb, a, ha, he⟩
    exact ⟨a, ha, b, hb, by simpa only [Nat.mul_comm] using he⟩

end

end Conjectures.HajduSarkozy
