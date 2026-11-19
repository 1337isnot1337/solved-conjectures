import Conjectures.HadamardBorderCompression
import Mathlib.Tactic.Ring

/-!
# Compressed energy from the original four-row correlations

Four sign-valued rows have total correlation four times the group cardinality
at zero. The prescribed values at every nonzero shift then give the exact
compressed correlation, energy, and squared row-sum identities. No parity,
energy, quotient splitting, or compression shape is assumed.
-/

namespace HadamardBorderConstruction

open scoped BigOperators
open HadamardBorderNormalizationTransport

variable {G Q : Type*} [Fintype G] [Fintype Q]
  [AddCommGroup G] [AddCommGroup Q] [DecidableEq Q]

/-- Every nonzero quotient shift collects one fibre of correlations equal to four. -/
theorem compressed_correlation_nonzero
    (π : G →+ Q) (hπ : Function.Surjective π) (f : Rows G)
    (hcorr : ∀ u : G, u ≠ 0 → combinedCorrelation f u =
      if π u = 0 then -12 else 4)
    (t : Q) (ht : t ≠ 0) :
    combinedCorrelation (fun i => compress π (f i)) t =
      4 * (Nat.card π.ker : ℤ) := by
  classical
  rw [combinedCorrelation_compress_eq_fiber_sum]
  calc
    (∑ u, if π u = t then combinedCorrelation f u else 0) =
        ∑ u : G, if π u = t then (4 : ℤ) else 0 := by
      apply Finset.sum_congr rfl
      intro u hu
      by_cases h : π u = t
      · have hu0 : u ≠ 0 := by
          intro heq
          apply ht
          simpa only [heq, map_zero] using h.symm
        have hp : π u ≠ 0 := by simpa only [h] using ht
        simp only [ite_eq_left h, hcorr u hu0, ite_eq_right hp]
      · simp only [ite_eq_right h]
    _ = 4 * (Nat.card π.ker : ℤ) := compress_const π hπ 4 t

/-- The zero compressed correlation is obtained by correcting the zero shift
inside the kernel fibre. -/
theorem compressed_correlation_zero
    (π : G →+ Q) (hπ : Function.Surjective π) (f : Rows G)
    (hQ : Fintype.card Q = 4) (hf : ∀ i, SignValued (f i))
    (hcorr : ∀ u : G, u ≠ 0 → combinedCorrelation f u =
      if π u = 0 then -12 else 4) :
    combinedCorrelation (fun i => compress π (f i)) 0 =
      4 * (Nat.card π.ker : ℤ) + 12 := by
  classical
  have hcard : Fintype.card G = 4 * Nat.card π.ker := by
    simpa only [hQ] using fintype_card_eq_card_mul_kernel_card π hπ
  have hcardZ := congrArg (fun n : ℕ => (n : ℤ)) hcard
  norm_num only [Nat.cast_mul] at hcardZ
  have hcount : (∑ u : G, if π u = 0 then (1 : ℤ) else 0) =
      (Nat.card π.ker : ℤ) := compress_one π hπ 0
  rw [combinedCorrelation_compress_eq_fiber_sum]
  calc
    (∑ u, if π u = 0 then combinedCorrelation f u else 0) =
        ∑ u : G, (-12) * (if π u = 0 then (1 : ℤ) else 0) +
          (if u = 0 then 4 * (Fintype.card G : ℤ) + 12 else 0) := by
      apply Finset.sum_congr rfl
      intro u hu
      by_cases hu0 : u = 0
      · subst u
        simp only [map_zero, ite_true, combinedCorrelation_zero f hf, mul_one]
        ring
      · rw [hcorr u hu0]
        by_cases hp : π u = 0
        · simp only [ite_eq_left hp, ite_eq_right hu0, mul_one, add_zero]
        · simp only [ite_eq_right hp, ite_eq_right hu0, mul_zero, add_zero]
    _ = (-12) * (Nat.card π.ker : ℤ) +
        (4 * (Fintype.card G : ℤ) + 12) := by
      rw [Finset.sum_add_distrib, ← Finset.mul_sum, hcount, Fintype.sum_ite_eq']
    _ = 4 * (Nat.card π.ker : ℤ) + 12 := by
      rw [hcardZ]
      ring

/-- The complete correlation formula for the actual compressed rows. -/
theorem compressed_correlation_formula
    (π : G →+ Q) (hπ : Function.Surjective π) (f : Rows G)
    (hQ : Fintype.card Q = 4) (hf : ∀ i, SignValued (f i))
    (hcorr : ∀ u : G, u ≠ 0 → combinedCorrelation f u =
      if π u = 0 then -12 else 4) (t : Q) :
    combinedCorrelation (fun i => compress π (f i)) t =
      4 * (Nat.card π.ker : ℤ) + if t = 0 then 12 else 0 := by
  by_cases ht : t = 0
  · subst t
    simpa only [ite_true] using compressed_correlation_zero π hπ f hQ hf hcorr
  · simpa only [ite_eq_right ht, add_zero] using
      compressed_correlation_nonzero π hπ f hcorr t ht

theorem compressed_energy
    (π : G →+ Q) (hπ : Function.Surjective π) (f : Rows G)
    (hQ : Fintype.card Q = 4) (hf : ∀ i, SignValued (f i))
    (hcorr : ∀ u : G, u ≠ 0 → combinedCorrelation f u =
      if π u = 0 then -12 else 4) :
    (∑ i, ∑ q, (compress π (f i) q) ^ 2) =
      4 * (Nat.card π.ker : ℤ) + 12 := by
  simpa only [combinedCorrelation, correlation, add_zero, pow_two] using
    compressed_correlation_zero π hπ f hQ hf hcorr

theorem compressed_row_sum_squares
    (π : G →+ Q) (hπ : Function.Surjective π) (f : Rows G)
    (hQ : Fintype.card Q = 4) (hf : ∀ i, SignValued (f i))
    (hcorr : ∀ u : G, u ≠ 0 → combinedCorrelation f u =
      if π u = 0 then -12 else 4) :
    (∑ i, (∑ q, compress π (f i) q) ^ 2) =
      16 * (Nat.card π.ker : ℤ) + 12 := by
  classical
  calc
    (∑ i, (∑ q, compress π (f i) q) ^ 2) =
        ∑ t, combinedCorrelation (fun i => compress π (f i)) t :=
      (sum_combinedCorrelation_eq_row_sum_squares
        (fun i => compress π (f i))).symm
    _ = ∑ t : Q, (4 * (Nat.card π.ker : ℤ) + if t = 0 then 12 else 0) := by
      apply Finset.sum_congr rfl
      intro t ht
      exact compressed_correlation_formula π hπ f hQ hf hcorr t
    _ = 16 * (Nat.card π.ker : ℤ) + 12 := by
      rw [Finset.sum_add_distrib]
      simp only [Finset.sum_const, Finset.card_univ, hQ, nsmul_eq_mul,
        Fintype.sum_ite_eq']
      ring

end HadamardBorderConstruction
