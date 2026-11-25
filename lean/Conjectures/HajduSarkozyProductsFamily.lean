import Conjectures.HajduSarkozyProductsFactors
import Conjectures.HajduSarkozyProductsProduct
import Conjectures.HajduSarkozyProductsLimits

/-!
# Hajdu–Sárközy's shifted-product total primitivity conjecture

The complete summable-family theorem from Section 1 of the recorded proof.
The proof first sums a fixed finite coefficient head, then lets the entire
nonnegative summable tail tend to zero. The conclusion concerns the actual
real-threshold count and every finite modification.
-/

open Classical Filter Finset Asymptotics
open scoped symmDiff

namespace Conjectures.HajduSarkozy.Products

noncomputable section

theorem retained_head_eq (k : ℕ) (c : ℤ) (Q : ℕ → ℕ) (S : Set ℕ) (T : ℕ) :
    S ∩ headPowers k c Q T = {n | ∃ i ∈ range T, n ∈ S ∩ scaledPowers k c (Q i)} := by
  ext n
  constructor
  · rintro ⟨hS, i, hi, hP⟩
    exact ⟨i, mem_range.mpr hi, hS, hP⟩
  · rintro ⟨i, hi, hS, hP⟩
    exact ⟨hS, i, mem_range.mp hi, hP⟩

theorem retained_family_count_le (k : ℕ) (c : ℤ) (Q : ℕ → ℕ)
    (S : Set ℕ) (T : ℕ) (X : ℝ) :
    count (S ∩ familyPowers k c Q) X ≤
      (∑ i ∈ range T, count (S ∩ scaledPowers k c (Q i)) X) +
        count (familyPowers k c Q \ headPowers k c Q T) X := by
  have hsub : S ∩ familyPowers k c Q ⊆
      (S ∩ headPowers k c Q T) ∪ (familyPowers k c Q \ headPowers k c Q T) := by
    intro n hn
    by_cases hhead : n ∈ headPowers k c Q T
    · exact Or.inl ⟨hn.1, hhead⟩
    · exact Or.inr ⟨hn.2, hhead⟩
  have hhead : count (S ∩ headPowers k c Q T) X ≤
      ∑ i ∈ range T, count (S ∩ scaledPowers k c (Q i)) X := by
    rw [retained_head_eq]
    exact count_finite_union_le _ _ _
  exact (count_mono hsub le_rfl).trans
    ((count_union_le _ _ X).trans (add_le_add hhead le_rfl))

theorem family_product_grid_isLittleO {k : ℕ} {c : ℤ} (hk : 2 ≤ k) (hc : c ≠ 0)
    (Q : ℕ → ℕ) (hsum : Summable (fun i => coefficientWeight k (Q i)))
    (A B : Set ℕ) (hA : Positive A) (hB : Positive B)
    (hm : binMass A (thinRatio c) =o[atTop] fun i => (rootRatio k (thinRatio c))^i)
    (hn : binMass B (thinRatio c) =o[atTop] fun i => (rootRatio k (thinRatio c))^i) :
    (fun L : ℕ => count (productSet A B ∩ familyPowers k c Q) ((thinRatio c)^L))
      =o[atTop] fun L => (rootRatio k (thinRatio c))^L := by
  have hk0 : 0 < k := by omega
  have hρ := thinRatio_gt_one hc
  have hq := rootRatio_gt_one hk0 hρ
  apply uniform_tail_isLittleO (C := (1+(c.natAbs : ℝ))^(1/(k : ℝ))) hq
    (fun L => count_nonneg _ _) (tailMass_tendsto hsum)
  intro T
  refine ⟨fun L => ∑ i ∈ range T,
      count (productSet A B ∩ scaledPowers k c (Q i)) ((thinRatio c)^L), ?_, ?_⟩
  · apply (IsLittleO.sum (s := range T)
      (fun i _ => product_grid_isLittleO hk hc hq (Q i) A B hA hB hm hn)).congr_left
    intro L
    simp only [Finset.sum_apply]
  · intro L
    have ht := coefficient_tail_grid_le hk0 c Q hsum hρ (show (0 : ℝ) ≤ 1 by norm_num) T L
    simp only [one_mul] at ht
    exact (retained_family_count_le k c Q (productSet A B) T ((thinRatio c)^L)).trans
      (add_le_add le_rfl ht)

theorem retained_product_sparse {k : ℕ} {c : ℤ} (hk : 2 ≤ k) (hc : c ≠ 0)
    (Q : ℕ → ℕ) (hsum : Summable (fun i => coefficientWeight k (Q i)))
    (A B : Set ℕ) (hA : Positive A) (hB : Positive B)
    (hA₂ : A.Nontrivial) (hB₂ : B.Nontrivial)
    (hadded : Sparse k (productSet A B \ familyPowers k c Q)) :
    Sparse k (productSet A B ∩ familyPowers k c Q) := by
  have hρ := thinRatio_gt_one hc
  have hswap : Sparse k (productSet B A \ familyPowers k c Q) := by
    rw [productSet_comm B A]
    exact hadded
  have hm := factor_binMass_isLittleO hk hc hρ Q hsum B A hB hB₂ hswap
  have hn := factor_binMass_isLittleO hk hc hρ Q hsum A B hA hA₂ hadded
  exact sparse_of_grid (by omega) hρ (family_product_grid_isLittleO hk hc Q hsum A B hA hB hm hn)

theorem no_product_summable_family {k : ℕ} {c : ℤ} (hk : 2 ≤ k) (hc : c ≠ 0)
    (Q : ℕ → ℕ) (hsum : Summable (fun i => coefficientWeight k (Q i))) (R : Set ℕ)
    (hadded : Sparse k (R \ familyPowers k c Q))
    (hretained : ¬ Sparse k (R ∩ familyPowers k c Q)) : ¬ HasNontrivialProduct R := by
  rintro ⟨A, B, hA, hB, hA₂, hB₂, rfl⟩
  exact hretained (retained_product_sparse hk hc Q hsum A B hA hB hA₂ hB₂ hadded)

/-- The summable-family result under a non-sparse-retention hypothesis. -/
theorem summable_family_total_of_not_sparse {k : ℕ} {c : ℤ} (hk : 2 ≤ k) (hc : c ≠ 0)
    (Q : ℕ → ℕ) (hsum : Summable (fun i => coefficientWeight k (Q i))) (R : Set ℕ)
    (hadded : Sparse k (R \ familyPowers k c Q))
    (hretained : ¬ Sparse k (R ∩ familyPowers k c Q)) : TotallyMPrimitive R := by
  intro T _ hfinite
  obtain ⟨haddedT, hretainedT⟩ :=
    finite_change_conditions (by omega) (familyPowers k c Q) R T hfinite hadded hretained
  exact no_product_summable_family hk hc Q hsum T haddedT hretainedT

/-- The literal positive-limsup hypothesis recorded in the source. -/
theorem indexed_summable_family {k : ℕ} {c : ℤ} (hk : 2 ≤ k) (hc : c ≠ 0)
    (Q : ℕ → ℕ) (hsum : Summable (fun i => coefficientWeight k (Q i))) (R : Set ℕ)
    (hadded : Sparse k (R \ familyPowers k c Q))
    (hretained : 0 < limsup (fun X : ℝ =>
      count (R ∩ familyPowers k c Q) X / X^(1/(k : ℝ))) atTop) : TotallyMPrimitive R :=
  summable_family_total_of_not_sparse hk hc Q hsum R hadded
    (not_sparse_of_positive_limsup hretained)

def setCoefficients (Q : Set ℕ) (i : ℕ) : ℕ := if i ∈ Q then i else 0

def coefficientFamilyPowers (k : ℕ) (c : ℤ) (Q : Set ℕ) : Set ℕ :=
  {n | ∃ q ∈ Q, n ∈ scaledPowers k c q}

theorem setCoefficients_summable {k : ℕ} {Q : Set ℕ} (hQ : Positive Q)
    (hsum : Summable (fun q : Q => (q.val : ℝ)^(-(1/(k : ℝ))))) :
    Summable (fun i => coefficientWeight k (setCoefficients Q i)) := by
  have he : (fun i => coefficientWeight k (setCoefficients Q i)) =
      Q.indicator (fun q => (q : ℝ)^(-(1/(k : ℝ)))) := by
    funext i
    by_cases hi : i ∈ Q
    · simp [setCoefficients, hi, coefficientWeight, Nat.ne_of_gt (hQ i hi)]
    · simp [setCoefficients, hi]
  rw [he]
  exact summable_subtype_iff_indicator.mp hsum

theorem indexed_set_family_eq (k : ℕ) (c : ℤ) (Q : Set ℕ) :
    familyPowers k c (setCoefficients Q) = coefficientFamilyPowers k c Q := by
  ext n
  constructor
  · rintro ⟨i, hi⟩
    by_cases hiQ : i ∈ Q
    · exact ⟨i, hiQ, by simpa only [setCoefficients, ite_eq_left hiQ] using hi⟩
    · simp only [setCoefficients, ite_eq_right hiQ, scaledPowers_zero, Set.mem_empty_iff_false] at hi
  · rintro ⟨q, hqQ, hq⟩
    exact ⟨q, by simpa only [setCoefficients, ite_eq_left hqQ] using hq⟩

/-- Section 1 in its original form: an arbitrary nonempty set of positive coefficients. -/
theorem summable_family {k : ℕ} {c : ℤ} (hk : 2 ≤ k) (hc : c ≠ 0)
    (Q : Set ℕ) (_hQne : Q.Nonempty) (hQ : Positive Q)
    (hsum : Summable (fun q : Q => (q.val : ℝ)^(-(1/(k : ℝ))))) (R : Set ℕ)
    (hadded : Sparse k (R \ coefficientFamilyPowers k c Q))
    (hretained : 0 < limsup (fun X : ℝ =>
      count (R ∩ coefficientFamilyPowers k c Q) X / X^(1/(k : ℝ))) atTop) :
    TotallyMPrimitive R := by
  apply indexed_summable_family hk hc (setCoefficients Q) (setCoefficients_summable hQ hsum) R
  · simpa only [indexed_set_family_eq] using hadded
  · simpa only [indexed_set_family_eq] using hretained

end

end Conjectures.HajduSarkozy.Products
