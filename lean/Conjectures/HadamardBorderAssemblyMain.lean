import Conjectures.HadamardBorderAssembly
import Conjectures.HadamardBorderVarianceNormalization
import Conjectures.HadamardFixedBorderLiteral

/-!
# Fixed-border construction from the original four sign rows

The only mathematical inputs are a finite abelian quotient with four
elements and four actual sign rows satisfying the original nonzero
correlation formula. Compression, parity, variance, actual normalization,
the core identities, and the literal finite border are all proved inputs
to the construction, rather than additional hypotheses of the final theorem.
-/

namespace HadamardBorderConstruction

open Matrix
open scoped BigOperators
open HadamardBorderNormalizationTransport
open HadamardFixedBorder

variable {G Q : Type*} [Fintype G] [Fintype Q]
  [AddCommGroup G] [AddCommGroup Q] [DecidableEq Q]

/-- The complete construction on twelve border positions and four copies
of the original group, with no normalization or finite-certificate premise. -/
theorem exists_bordered_matrix_of_correlation [DecidableEq G]
    (π : G →+ Q) (hπ : Function.Surjective π) (f : Rows G)
    (hQ : Fintype.card Q = 4) (hf : ∀ i, SignValued (f i))
    (hcorr : ∀ u : G, u ≠ 0 → combinedCorrelation f u =
      if π u = 0 then -12 else 4) :
    ∃ H : Matrix (BorderIndex G) (BorderIndex G) ℤ,
      SignMatrix H ∧ H * Hᵀ =
        (4 * (Fintype.card G : ℤ) + 12) •
          (1 : Matrix (BorderIndex G) (BorderIndex G) ℤ) := by
  obtain ⟨_k, d, σ, ε, t, a, b, c, _hσ, _hε0, _ht0, _hε,
      hsign, hpreserve, hzero, hfirst, hsecond, hthird⟩ :=
    exists_normalized_sign_rows_of_correlation π hπ f hQ hf hcorr
  let g : Rows G := transformRows f σ ε t
  let baseline : Fin 3 → ℤ := ![a, b, c]
  have hgsign : ∀ i, SignValued (g i) := hsign
  have hgcorr : ∀ u : G, u ≠ 0 → combinedCorrelation g u =
      if π u = 0 then -12 else 4 := by
    intro u hu
    change combinedCorrelation (transformRows f σ ε t) u = _
    rw [hpreserve]
    exact hcorr u hu
  have hother (r : Fin 3) (q : Q) :
      compress π (g r.succ) q = baseline r + if q = 0 then 2 else 0 := by
    fin_cases r
    · exact hfirst q
    · exact hsecond q
    · exact hthird q
  obtain ⟨E, F, hKsign, hEsign, hFsign, hKgram, hEgram, hFgram, hbalanced, hcross⟩ :=
    HadamardFixedBorder.Literal.exists_border_of_card_four (Q := Q) hQ
  have hgamma : HadamardFixedBorder.Literal.gamma = gamma := rfl
  rw [hgamma] at hcross
  refine ⟨borderedMatrix π HadamardFixedBorder.Literal.K E F g, ?_, ?_⟩
  · exact borderedMatrix_sign π HadamardFixedBorder.Literal.K E F g
      hKsign hEsign hFsign hgsign
  · exact borderedMatrix_gram π hπ HadamardFixedBorder.Literal.K E F g
      hQ hgsign hgcorr d baseline hzero hother
      hKgram hEgram hFgram hbalanced hcross

/-- Reindexing gives a sign matrix with the standard finite index type. -/
theorem exists_hadamard_fin_of_correlation
    (π : G →+ Q) (hπ : Function.Surjective π) (f : Rows G)
    (hQ : Fintype.card Q = 4) (hf : ∀ i, SignValued (f i))
    (hcorr : ∀ u : G, u ≠ 0 → combinedCorrelation f u =
      if π u = 0 then -12 else 4) :
    ∃ H : Matrix (Fin (4 * Fintype.card G + 12)) (Fin (4 * Fintype.card G + 12)) ℤ,
      SignMatrix H ∧ H * Hᵀ =
        (4 * (Fintype.card G : ℤ) + 12) • 1 := by
  classical
  obtain ⟨H, hsign, hgram⟩ :=
    exists_bordered_matrix_of_correlation π hπ f hQ hf hcorr
  let e : BorderIndex G ≃ Fin (4 * Fintype.card G + 12) :=
    Fintype.equivFinOfCardEq (bordered_index_card (G := G))
  refine ⟨H.submatrix e.symm e.symm, ?_, ?_⟩
  · exact fun i j => hsign (e.symm i) (e.symm j)
  · change H.submatrix e.symm e.symm * Hᵀ.submatrix e.symm e.symm = _
    rw [Matrix.submatrix_mul_equiv, hgram]
    change (4 * (Fintype.card G : ℤ) + 12) •
      (1 : Matrix (BorderIndex G) (BorderIndex G) ℤ).submatrix e.symm e.symm = _
    rw [Matrix.submatrix_one_equiv]

/-- The order-2396 specialization uses only the actual kernel cardinality 149. -/
theorem exists_hadamard_2396_of_correlation
    (π : G →+ Q) (hπ : Function.Surjective π) (f : Rows G)
    (hQ : Fintype.card Q = 4) (hkernel : Nat.card π.ker = 149)
    (hf : ∀ i, SignValued (f i))
    (hcorr : ∀ u : G, u ≠ 0 → combinedCorrelation f u =
      if π u = 0 then -12 else 4) :
    ∃ H : Matrix (Fin 2396) (Fin 2396) ℤ,
      SignMatrix H ∧ H * Hᵀ = (2396 : ℤ) • 1 := by
  have hcard := fintype_card_eq_card_mul_kernel_card π hπ
  rw [hQ, hkernel] at hcard
  norm_num at hcard
  have horder : 4 * Fintype.card G + 12 = 2396 := by rw [hcard]
  have hscalar : 4 * (Fintype.card G : ℤ) + 12 = (2396 : ℤ) := by
    rw [hcard]
    norm_num
  rw [← horder]
  simpa only [hscalar] using
    exists_hadamard_fin_of_correlation π hπ f hQ hf hcorr

end HadamardBorderConstruction
