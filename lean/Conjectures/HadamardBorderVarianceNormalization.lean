import Conjectures.HadamardBorderCompressionRows
import Conjectures.HadamardBorderVarianceRows
import Conjectures.HadamardBorderNormalizationTransport

/-!
# Actual normalized sign rows from the original correlations

The original row correlations imply the compression energy and parity
identities. Integer variance then gives the compression shapes, and the
accepted row-operation theorem produces the actual normalized rows. No
classification, chosen splitting, oddness, or positive baseline is assumed.
-/

namespace HadamardBorderConstruction

open scoped BigOperators
open HadamardBorderNormalizationTransport

variable {G Q : Type*} [Fintype G] [Fintype Q]
  [AddCommGroup G] [AddCommGroup Q] [DecidableEq Q]

/-- The original correlation hypothesis forces the exact input shapes for
the actual-row normalization theorem. -/
theorem compression_shapes_of_correlation
    (π : G →+ Q) (hπ : Function.Surjective π) (f : Rows G)
    (hQ : Fintype.card Q = 4) (hf : ∀ i, SignValued (f i))
    (hcorr : ∀ u : G, u ≠ 0 → combinedCorrelation f u =
      if π u = 0 then -12 else 4) :
    ∃ (k : Fin 4) (d : ℤ), (∀ q, compress π (f k) q = d) ∧
      ∀ i, i ≠ k → ∃ (baseline : ℤ) (exception : Q) (ε : ℤ),
        (ε = 1 ∨ ε = -1) ∧ ∀ q, compress π (f i) q =
          baseline + if q = exception then 2 * ε else 0 :=
  HadamardBorderVariance.compression_shapes_of_card_four
    (fun i q => compress π (f i) q) (Nat.card π.ker : ℤ) hQ
    (compressed_parity π hπ f hf)
    (compressed_energy π hπ f hQ hf hcorr)
    (compressed_row_sum_squares π hπ f hQ hf hcorr)

/-- Actual row permutation, row signs, and lifted translations, derived only
from sign values and the original two-level correlations. -/
theorem exists_normalized_sign_rows_of_correlation
    (π : G →+ Q) (hπ : Function.Surjective π) (f : Rows G)
    (hQ : Fintype.card Q = 4) (hf : ∀ i, SignValued (f i))
    (hcorr : ∀ u : G, u ≠ 0 → combinedCorrelation f u =
      if π u = 0 then -12 else 4) :
    ∃ (k : Fin 4) (d : ℤ) (σ : Equiv.Perm (Fin 4))
        (ε : Fin 4 → ℤ) (t : Fin 4 → G) (a b c : ℤ),
      σ 0 = k ∧ ε 0 = 1 ∧ t 0 = 0 ∧ SignValued ε ∧
        (∀ i, SignValued (transformRows f σ ε t i)) ∧
        (∀ u, combinedCorrelation (transformRows f σ ε t) u =
          combinedCorrelation f u) ∧
        (∀ q, compress π (transformRows f σ ε t 0) q = d) ∧
        (∀ q, compress π (transformRows f σ ε t 1) q =
          a + if q = 0 then 2 else 0) ∧
        (∀ q, compress π (transformRows f σ ε t 2) q =
          b + if q = 0 then 2 else 0) ∧
        (∀ q, compress π (transformRows f σ ε t 3) q =
          c + if q = 0 then 2 else 0) := by
  obtain ⟨k, d, hconstant, hshapes⟩ :=
    compression_shapes_of_correlation π hπ f hQ hf hcorr
  refine ⟨k, d, ?_⟩
  exact exists_normalized_sign_rows π hπ f hf k d hconstant hshapes

/-- The normalized rows also satisfy the exact trivial-character equation
displayed in the fixed-border proof. -/
theorem exists_normalized_sign_rows_with_equation
    (π : G →+ Q) (hπ : Function.Surjective π) (f : Rows G)
    (hQ : Fintype.card Q = 4) (hf : ∀ i, SignValued (f i))
    (hcorr : ∀ u : G, u ≠ 0 → combinedCorrelation f u =
      if π u = 0 then -12 else 4) :
    ∃ (k : Fin 4) (d : ℤ) (σ : Equiv.Perm (Fin 4))
        (ε : Fin 4 → ℤ) (t : Fin 4 → G) (a b c : ℤ),
      σ 0 = k ∧ ε 0 = 1 ∧ t 0 = 0 ∧ SignValued ε ∧
        (∀ i, SignValued (transformRows f σ ε t i)) ∧
        (∀ u, combinedCorrelation (transformRows f σ ε t) u =
          combinedCorrelation f u) ∧
        (∀ q, compress π (transformRows f σ ε t 0) q = d) ∧
        (∀ q, compress π (transformRows f σ ε t 1) q =
          a + if q = 0 then 2 else 0) ∧
        (∀ q, compress π (transformRows f σ ε t 2) q =
          b + if q = 0 then 2 else 0) ∧
        (∀ q, compress π (transformRows f σ ε t 3) q =
          c + if q = 0 then 2 else 0) ∧
        (4 * d) ^ 2 + (4 * a + 2) ^ 2 + (4 * b + 2) ^ 2 +
          (4 * c + 2) ^ 2 = 16 * (Nat.card π.ker : ℤ) + 12 := by
  obtain ⟨k, d, σ, ε, t, a, b, c, hσ, hε0, ht0, hε,
      hf', hpreserve, h0, h1, h2, h3⟩ :=
    exists_normalized_sign_rows_of_correlation π hπ f hQ hf hcorr
  refine ⟨k, d, σ, ε, t, a, b, c, hσ, hε0, ht0, hε,
    hf', hpreserve, h0, h1, h2, h3, ?_⟩
  have hcorr' : ∀ u : G, u ≠ 0 →
      combinedCorrelation (transformRows f σ ε t) u =
        if π u = 0 then -12 else 4 := by
    intro u hu
    rw [hpreserve]
    exact hcorr u hu
  have hrows := compressed_row_sum_squares π hπ
    (transformRows f σ ε t) hQ hf' hcorr'
  have hsum (v : ℤ) :
      (∑ q : Q, (v + if q = 0 then 2 else 0)) = 4 * v + 2 := by
    rw [Finset.sum_add_distrib]
    simp [hQ]
  have hs0 : (∑ q, compress π (transformRows f σ ε t 0) q) = 4 * d := by
    simp [h0, hQ]
  have hs1 : (∑ q, compress π (transformRows f σ ε t 1) q) = 4 * a + 2 := by
    simpa only [h1] using hsum a
  have hs2 : (∑ q, compress π (transformRows f σ ε t 2) q) = 4 * b + 2 := by
    simpa only [h2] using hsum b
  have hs3 : (∑ q, compress π (transformRows f σ ε t 3) q) = 4 * c + 2 := by
    simpa only [h3] using hsum c
  simpa only [Fin.sum_univ_four, hs0, hs1, hs2, hs3] using hrows

end HadamardBorderConstruction
