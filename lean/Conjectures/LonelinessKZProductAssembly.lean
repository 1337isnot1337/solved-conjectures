import Conjectures.LonelinessKZProductOrder

open scoped BigOperators

namespace Loneliness.KZProduct

theorem selectedCount_le {d : ℕ} (s : Fin d → Bool) : selectedCount s ≤ d := by
  simpa [selectedCount] using Finset.card_filter_le (Finset.univ : Finset (Fin d))
    (fun i => s i = true)

theorem increment_prefix_sum_real (k r : ℕ) :
    ∑ i ∈ Finset.range r, (PrefixProduct.kzIncrement k i : ℝ) = (kzBound k r : ℝ) := by
  exact_mod_cast increment_prefix_sum k r

/-- All subset bounds follow from a finite family of exact dual certificates.
The variables remain arbitrary real numbers. -/
theorem subset_sums_of_certificate (k d : ℕ) (bounds : ℕ → ℕ) (D : ℕ)
    (hD : 0 < D) (rows : Fin (2^d) → DualRow)
    (hrows : ∀ m : Fin (2^d), DualValid d bounds (fun i => m.val.testBit i.val) (rows m))
    (hbound : ∀ r ≤ d, (bounds r : ℚ)/D = kzBound k r)
    (t : ℕ → ℝ)
    (hprefix : ∀ r ≤ d, (kzBound k r : ℝ) ≤ ∑ i ∈ Finset.range r, t i)
    (hratio : ∀ i, i+1 < d → 3*t i ≤ 4*t (i+1))
    (s : Fin d → Bool) :
    (kzBound k (selectedCount s) : ℝ) ≤ ∑ i : Fin d, if s i then t i.val else 0 := by
  have hboundR (r : ℕ) (hr : r ≤ d) :
      (bounds r : ℝ)/D = (kzBound k r : ℝ) := by
    have h := congrArg (fun q : ℚ => (q : ℝ)) (hbound r hr)
    simpa only [Rat.cast_div,Rat.cast_natCast] using h
  have hc := constraints_of_prefix_ratio bounds D t
    (fun r hr => by rw [hboundR r hr]; exact hprefix r hr) hratio
  have h := all_masks_sound bounds D hD rows hrows (fun i => t i.val) hc s
  rwa [hboundR _ (selectedCount_le s)] at h

/-- Exact dual certificates plus the logarithmic prefix theorem prove the
KZ product lower bound without assuming that the KZ lengths are sorted. -/
theorem product_of_certificate (k d : ℕ) (bounds : ℕ → ℕ) (D : ℕ)
    (hD : 0 < D) (rows : Fin (2^d) → DualRow)
    (hrows : ∀ m : Fin (2^d), DualValid d bounds (fun i => m.val.testBit i.val) (rows m))
    (hbound : ∀ r ≤ d, (bounds r : ℚ)/D = kzBound k r)
    (hc : ∀ i < d, 0 < PrefixProduct.kzIncrement k i)
    (t : ℕ → ℝ) (ht : ∀ i < d, 0 < t i)
    (hprefix : ∀ r ≤ d, (kzBound k r : ℝ) ≤ ∑ i ∈ Finset.range r, t i)
    (hratio : ∀ i, i+1 < d → 3*t i ≤ 4*t (i+1)) :
    ∏ i ∈ Finset.range d, (PrefixProduct.kzIncrement k i : ℝ) ≤
      ∏ i ∈ Finset.range d, t i := by
  have h := prod_le_of_subset_sums (fun i : Fin d => t i.val)
    (fun i => (PrefixProduct.kzIncrement k i : ℝ)) (fun i => ht i.val i.isLt)
    (fun i hi => by exact_mod_cast hc i hi) (fun s => by
      rw [increment_prefix_sum_real]
      exact subset_sums_of_certificate k d bounds D hD rows hrows hbound t hprefix hratio s)
  simpa only [Finset.prod_range] using h

end Loneliness.KZProduct
