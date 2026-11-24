import Conjectures.HajduSarkozyProductsPowers

/-!
# Hajdu–Sárközy's shifted-product total primitivity conjecture

The original Conjecture 1 of L. Hajdu and A. Sárközy, *On multiplicative
decompositions of polynomial sequences, II*, Acta Arithmetica 186 (2018),
191–200, printed p. 198, DOI 10.4064/aa171116-7-3. Both exponents range
over every integer greater than one and both variables are positive.
Total m-primitivity includes every finite modification, as in Definition
1.3 of that paper. The coprime cases are included; the separately
highlighted case with exponent two is not substituted for the conjecture.

The complete argument formalized here is the existing repository proof in
`results/hajdu-sarkozy-shifted-products/PROOF.md`, recorded by Cinna Davis
at commit `83c325ae559864ec0b5e916d90a342b50a81de7f` on 24 November 2026.
The source credits Hajdu–Sárközy's prior cases and C. H. Yip's graph and
geometric-bin methods for single shifted powers (arXiv:2501.16620).
Its bounded search for an earlier full resolution does not establish
priority. No external number-theoretic theorem is assumed as an axiom.

`summable_family` proves the full summable-family theorem, with its
literal real-threshold positive-limsup hypothesis. The preceding module
also proves all-exponent, all-nonzero-shift symmetric-difference
perturbations at the inverse minimum-exponent scale. The optional last
sentence of the source about an arbitrary finite number of variables is
not separately stated by this development.
-/

open Classical
open scoped symmDiff

namespace Conjectures.HajduSarkozy.Products

noncomputable section

/-- The positive-root convention of the original 2018 conjecture. -/
def originalProducts (k l : ℕ) : Set ℕ :=
  {n | ∃ x : ℕ, 0 < x ∧ ∃ y : ℕ, 0 < y ∧ n = x^k*y^l+1}

theorem originalProducts_eq (k l : ℕ) :
    originalProducts k l = shiftedProducts k l 1 := by
  ext n
  constructor
  · rintro ⟨x, hx, y, hy, he⟩
    refine ⟨by omega, x, hx, y, hy, ?_⟩
    exact_mod_cast he
  · rintro ⟨_, x, hx, y, hy, he⟩
    exact ⟨x, hx, y, hy, by exact_mod_cast he⟩

/-- The original conjecture with every allowed exponent pair and every finite modification. -/
theorem hajdu_sarkozy_shifted_products_conjecture (k l : ℕ) (hk : 2 ≤ k) (hl : 2 ≤ l) :
    TotallyMPrimitive (originalProducts k l) := by
  apply shifted_product_perturbations hk hl (by norm_num : (1 : ℤ) ≠ 0) (originalProducts k l)
  rw [originalProducts_eq]
  exact sparse_finite (by omega) (by simp)

/-- Explicit non-decomposition after any finite change, with no finiteness restriction on the factors. -/
theorem original_finite_modification_not_product (k l : ℕ) (hk : 2 ≤ k) (hl : 2 ≤ l)
    (T A B : Set ℕ) (hT : Positive T) (hfinite : (T ∆ originalProducts k l).Finite)
    (hA : Positive A) (hB : Positive B) (hA₂ : A.Nontrivial) (hB₂ : B.Nontrivial) :
    T ≠ productSet A B := by
  intro he
  exact hajdu_sarkozy_shifted_products_conjecture k l hk hl T hT hfinite
    ⟨A, B, hA, hB, hA₂, hB₂, he⟩

end

end Conjectures.HajduSarkozy.Products
