import Conjectures.HajduSarkozyFactors
import Conjectures.HajduSarkozyDensity

/-!
# Hajdu–Sárközy's multiplicative perturbation conjecture

Full scope of `results/hajdu-sarkozy-shifted-power-perturbations/PROOF.md`:
every exponent `k ≥ 2`, every nonzero integral shift, every perturbation with
`o(X^(1/k))` symmetric-difference count, and every finite modification.

The original conjecture is L. Hajdu and A. Sárközy, *On multiplicative
decompositions of polynomial sequences, III*, Conjecture 1.2, with total
m-primitivity as in Definition 1.6.  Its root range includes zero; the last
theorem explicitly accounts for the resulting extra value `1`.

The proof follows the existing repository argument: its exact determinant
gap, geometric bins, sparse-factor counting, and error-map injections.  The
weaker elementary incidence bound is enough after a double-prefix summation.
The recorded argument is by Cinna Davis, repository commit
`83c325ae559864ec0b5e916d90a342b50a81de7f` (24 November 2026).
Prior graph and geometric-bin methods, including C. H. Yip's general-shift
result for `k ≥ 3` (arXiv:2501.16620), are credited by that entry.  The source's
bounded priority search is not treated as a guarantee of priority.
-/

open Classical Filter Asymptotics
open scoped symmDiff

namespace Conjectures.HajduSarkozy

theorem no_product_of_sparse_error {k : ℕ} {c : ℤ}
    (hk : 2 ≤ k) (hc : c ≠ 0) (R : Set ℕ)
    (herror : Sparse k (R ∆ shiftedPowers k c)) : ¬ HasNontrivialProduct R := by
  rintro ⟨A, B, hA, hB, hA₂, hB₂, rfl⟩
  let ρ := thinRatio c
  let q := rootRatio k ρ
  have hk0 : 0 < k := by omega
  have hρ : 1 < ρ := thinRatio_gt_one hc
  have hq : 1 < q := rootRatio_gt_one hk0 hρ
  have hmissing : Sparse k (productSet A B \ shiftedPowers k c) :=
    sparse_mono (fun _ hn => Or.inl hn) herror
  have hmissingSwap : Sparse k (productSet B A \ shiftedPowers k c) := by
    rw [productSet_comm B A]
    exact hmissing
  have hm := factor_binMass_isLittleO hk hc hρ B A hB hB₂ hmissingSwap
  have hn := factor_binMass_isLittleO hk hc hρ A B hA hA₂ hmissing
  have hretained := product_grid_isLittleO hk hc hq A B hA hB hm hn
  have hremoved : Sparse k (shiftedPowers k c \ productSet A B) :=
    sparse_mono (fun _ hn => Or.inr hn) herror
  have hremovedGrid : (fun L : ℕ => count (shiftedPowers k c \ productSet A B) (ρ^L))
      =o[atTop] fun L => q^L := by
    simpa only [one_mul] using sparse_scaled_grid (t := 1) hremoved hρ zero_lt_one
  have hsum := hretained.add hremovedGrid
  have hP : (fun L : ℕ => count (shiftedPowers k c) (ρ^L)) =o[atTop] fun L => q^L := by
    apply (IsBigO.of_bound 1 ?_).trans_isLittleO hsum
    filter_upwards [] with L
    rw [one_mul, Real.norm_of_nonneg (count_nonneg _ _),
      Real.norm_of_nonneg (add_nonneg (count_nonneg _ _) (count_nonneg _ _))]
    simpa only [Set.inter_comm] using count_split_le (shiftedPowers k c) (productSet A B) (ρ^L)
  exact shiftedPowers_not_grid_isLittleO hk0 hq hρ (rootRatio_pow hk0 (by linarith)) hP

/-- The full general-shift theorem, including every finite modification of the perturbation. -/
theorem shiftedPowerPerturbations {k : ℕ} {c : ℤ}
    (hk : 2 ≤ k) (hc : c ≠ 0) (R : Set ℕ)
    (herror : Sparse k (R ∆ shiftedPowers k c)) : TotallyMPrimitive R := by
  intro T _ hfinite
  have herrorT := sparse_symmDiff_trans (sparse_finite (by omega : 0 < k) hfinite) herror
  exact no_product_of_sparse_error hk hc T herrorT

/-- The original root convention: all nonnegative integer roots, including zero. -/
def originalPowers (k : ℕ) : Set ℕ := {n | ∃ m : ℕ, n = m^k+1}

theorem shiftedPowers_one_subset_original (k : ℕ) : shiftedPowers k 1 ⊆ originalPowers k := by
  intro n hn
  obtain ⟨_, m, _, he⟩ := hn
  exact ⟨m, by exact_mod_cast he⟩

theorem original_mem_shifted_or_one {k n : ℕ} (hk : 0 < k) (hn : n ∈ originalPowers k) :
    n ∈ shiftedPowers k 1 ∨ n = 1 := by
  obtain ⟨m, he⟩ := hn
  by_cases hm : m = 0
  · right
    simpa only [hm, zero_pow hk.ne', zero_add] using he
  · left
    refine ⟨by omega, m, Nat.pos_of_ne_zero hm, ?_⟩
    exact_mod_cast he

theorem original_shifted_finite_difference {k : ℕ} (hk : 0 < k) :
    (originalPowers k ∆ shiftedPowers k 1).Finite := by
  apply (Set.finite_singleton 1).subset
  intro n hn
  rcases hn with ⟨ho, hs⟩ | ⟨hs, ho⟩
  · rcases original_mem_shifted_or_one hk ho with hp | he
    · exact False.elim (hs hp)
    · exact he
  · exact False.elim (ho (shiftedPowers_one_subset_original k hs))

/-- Hajdu and Sárközy's original Conjecture 1.2, including `k = 2`. -/
theorem hajdu_sarkozy_conjecture (k : ℕ) (hk : 2 ≤ k) (R : Set ℕ)
    (_hR : Positive R) (herror : Sparse k (R ∆ originalPowers k)) : TotallyMPrimitive R := by
  have hk0 : 0 < k := by omega
  have htransfer := sparse_symmDiff_trans herror
    (sparse_finite hk0 (original_shifted_finite_difference hk0))
  exact shiftedPowerPerturbations hk (by norm_num) R htransfer

end Conjectures.HajduSarkozy
