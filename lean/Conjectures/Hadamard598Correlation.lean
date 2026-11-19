import Conjectures.Hadamard598Exceptions

/-!
# Correlation bounds and the order-eleven contradiction

The two mixed correlations are bounded by the five derived exceptional
positions. The integer exceptional autocorrelation must therefore vanish
at every nonzero shift. Its row-sum square total is five, contradicting
the row-sum bounds inherited from the original four rows.
-/

namespace Hadamard598

open scoped BigOperators
open HadamardBorderNormalizationTransport
open HadamardBorderConstruction

def crossCorrelation (a b : Rows (ZMod 26)) (t : ZMod 26) : ℤ :=
  ∑ i, ∑ q, a i q * b i (q+t)

theorem crossCorrelation_swap (a b : Rows (ZMod 26)) (t : ZMod 26) :
    crossCorrelation a b t = crossCorrelation b a (-t) := by
  unfold crossCorrelation
  apply Finset.sum_congr rfl
  intro i hi
  apply Fintype.sum_equiv (Equiv.addRight t)
  intro q
  simp [add_assoc,mul_comm]

theorem zero_correlation_bounds (f : Rows Space) (hf : ∀ i, SignValued (f i))
    (t : ZMod 26) :
    -104 ≤ combinedCorrelation (zeroRows f) t ∧
      combinedCorrelation (zeroRows f) t ≤ 104 := by
  have hp (i : Fin 4) (q : ZMod 26) :
      (-1 : ℤ) ≤ zeroRows f i q * zeroRows f i (q+t) ∧
        zeroRows f i q * zeroRows f i (q+t) ≤ 1 := by
    rcases zeroRows_sign f hf i q with h | h <;>
      rcases zeroRows_sign f hf i (q+t) with h' | h' <;> norm_num [h,h']
  constructor
  · have h := Finset.sum_le_sum (fun i (_ : i ∈ Finset.univ) =>
      Finset.sum_le_sum (fun q (_ : q ∈ Finset.univ) => (hp i q).1))
    norm_num only [Finset.sum_const, Finset.card_univ, ZMod.card,
      Fintype.card_fin, nsmul_eq_mul] at h
    exact h
  · have h := Finset.sum_le_sum (fun i (_ : i ∈ Finset.univ) =>
      Finset.sum_le_sum (fun q (_ : q ∈ Finset.univ) => (hp i q).2))
    norm_num only [Finset.sum_const, Finset.card_univ, ZMod.card,
      Fintype.card_fin, nsmul_eq_mul] at h
    exact h

theorem mixed_correlation_bounds (f : Rows Space) (hf : ∀ i, SignValued (f i))
    (hcorr : ∀ v : Space, v ≠ 0 → combinedCorrelation f v = -4)
    (u : (ZMod 23)ˣ) (hu : orderOf u = 11)
    (hinv : ∀ i q z, f i (q,(u : ZMod 23)*z) = f i (q,z))
    (t : ZMod 26) :
    -5 ≤ crossCorrelation (zeroRows f) (exceptionRows f) t ∧
      crossCorrelation (zeroRows f) (exceptionRows f) t ≤ 5 := by
  have hp (i : Fin 4) (q : ZMod 26) :=
    sign_exception_product_bounds (zeroRows f i q) (exceptionRows f i (q+t))
      (zeroRows_sign f hf i q) (exceptionRows_values f hf u hu hinv i (q+t))
  have hshift : (∑ i, ∑ q, (exceptionRows f i (q+t)) ^ 2) = 5 := by
    have hi (i : Fin 4) :
        (∑ q, (exceptionRows f i (q+t)) ^ 2) = ∑ q, (exceptionRows f i q) ^ 2 :=
      Fintype.sum_equiv (Equiv.addRight t)
        (fun q => (exceptionRows f i (q+t)) ^ 2)
        (fun q => (exceptionRows f i q) ^ 2) (by intro q; rfl)
    simp_rw [hi]
    exact exception_energy_eq_five f hf hcorr u hu hinv
  have hlo := Finset.sum_le_sum (fun i (_ : i ∈ Finset.univ) =>
    Finset.sum_le_sum (fun q (_ : q ∈ Finset.univ) => (hp i q).1))
  have hhi := Finset.sum_le_sum (fun i (_ : i ∈ Finset.univ) =>
    Finset.sum_le_sum (fun q (_ : q ∈ Finset.univ) => (hp i q).2))
  simp only [Finset.sum_neg_distrib, hshift] at hlo
  rw [hshift] at hhi
  exact ⟨hlo,hhi⟩

theorem reverse_mixed_correlation_bounds
    (f : Rows Space) (hf : ∀ i, SignValued (f i))
    (hcorr : ∀ v : Space, v ≠ 0 → combinedCorrelation f v = -4)
    (u : (ZMod 23)ˣ) (hu : orderOf u = 11)
    (hinv : ∀ i q z, f i (q,(u : ZMod 23)*z) = f i (q,z))
    (t : ZMod 26) :
    -5 ≤ crossCorrelation (exceptionRows f) (zeroRows f) t ∧
      crossCorrelation (exceptionRows f) (zeroRows f) t ≤ 5 := by
  simpa only [crossCorrelation_swap (exceptionRows f) (zeroRows f) t] using
    mixed_correlation_bounds f hf hcorr u hu hinv (-t)

theorem compressed_correlation_expansion
    (f : Rows Space) (hf : ∀ i, SignValued (f i))
    (u : (ZMod 23)ˣ) (hu : orderOf u = 11)
    (hinv : ∀ i q z, f i (q,(u : ZMod 23)*z) = f i (q,z))
    (t : ZMod 26) :
    combinedCorrelation (compressed f) t =
      combinedCorrelation (zeroRows f) t +
        22 * crossCorrelation (zeroRows f) (exceptionRows f) t +
        22 * crossCorrelation (exceptionRows f) (zeroRows f) t +
        484 * combinedCorrelation (exceptionRows f) t := by
  have hp (i : Fin 4) (q : ZMod 26) :
      compressed f i q * compressed f i (q+t) =
        zeroRows f i q * zeroRows f i (q+t) +
        22 * (zeroRows f i q * exceptionRows f i (q+t)) +
        22 * (exceptionRows f i q * zeroRows f i (q+t)) +
        484 * (exceptionRows f i q * exceptionRows f i (q+t)) := by
    rw [compressed_decomposition f hf u hu hinv i q,
      compressed_decomposition f hf u hu hinv i (q+t)]
    ring
  unfold combinedCorrelation correlation crossCorrelation
  simp_rw [hp]
  simp only [Finset.sum_add_distrib, ← Finset.mul_sum]

/-- The integer exceptional autocorrelation is forced to vanish at every nonzero shift. -/
theorem exception_correlation_nonzero
    (f : Rows Space) (hf : ∀ i, SignValued (f i))
    (hcorr : ∀ v : Space, v ≠ 0 → combinedCorrelation f v = -4)
    (u : (ZMod 23)ˣ) (hu : orderOf u = 11)
    (hinv : ∀ i q z, f i (q,(u : ZMod 23)*z) = f i (q,z))
    (t : ZMod 26) (ht : t ≠ 0) :
    combinedCorrelation (exceptionRows f) t = 0 := by
  have hexpand := compressed_correlation_expansion f hf u hu hinv t
  rw [compressed_correlation f hf hcorr, ite_eq_right ht] at hexpand
  have hzero := zero_correlation_bounds f hf t
  have hleft := mixed_correlation_bounds f hf hcorr u hu hinv t
  have hright := reverse_mixed_correlation_bounds f hf hcorr u hu hinv t
  omega

theorem exception_correlation_formula
    (f : Rows Space) (hf : ∀ i, SignValued (f i))
    (hcorr : ∀ v : Space, v ≠ 0 → combinedCorrelation f v = -4)
    (u : (ZMod 23)ˣ) (hu : orderOf u = 11)
    (hinv : ∀ i q z, f i (q,(u : ZMod 23)*z) = f i (q,z))
    (t : ZMod 26) :
    combinedCorrelation (exceptionRows f) t = if t = 0 then 5 else 0 := by
  by_cases ht : t = 0
  · subst t
    simpa only [combinedCorrelation, correlation, add_zero, pow_two, ite_true] using
      exception_energy_eq_five f hf hcorr u hu hinv
  · simpa only [ite_eq_right ht] using
      exception_correlation_nonzero f hf hcorr u hu hinv t ht

theorem exception_row_sum_squares_eq_five
    (f : Rows Space) (hf : ∀ i, SignValued (f i))
    (hcorr : ∀ v : Space, v ≠ 0 → combinedCorrelation f v = -4)
    (u : (ZMod 23)ˣ) (hu : orderOf u = 11)
    (hinv : ∀ i q z, f i (q,(u : ZMod 23)*z) = f i (q,z)) :
    (∑ i, (∑ q, exceptionRows f i q) ^ 2) = 5 := by
  calc
    (∑ i, (∑ q, exceptionRows f i q) ^ 2) =
        ∑ t, combinedCorrelation (exceptionRows f) t :=
      (sum_combinedCorrelation_eq_row_sum_squares (exceptionRows f)).symm
    _ = ∑ t : ZMod 26, if t = 0 then (5 : ℤ) else 0 :=
      Finset.sum_congr rfl (fun t _ => exception_correlation_formula f hf hcorr u hu hinv t)
    _ = 5 := Fintype.sum_ite_eq' 0 _

theorem original_row_sum_decomposition
    (f : Rows Space) (hf : ∀ i, SignValued (f i))
    (u : (ZMod 23)ˣ) (hu : orderOf u = 11)
    (hinv : ∀ i q z, f i (q,(u : ZMod 23)*z) = f i (q,z)) (i : Fin 4) :
    (∑ x, f i x) = (∑ q, zeroRows f i q) + 22 * (∑ q, exceptionRows f i q) := by
  rw [← compressed_row_sum_eq_original f i]
  simp_rw [compressed_decomposition f hf u hu hinv i]
  rw [Finset.sum_add_distrib, ← Finset.mul_sum]

theorem zero_row_sum_bounds (f : Rows Space) (hf : ∀ i, SignValued (f i)) (i : Fin 4) :
    -26 ≤ (∑ q, zeroRows f i q) ∧ (∑ q, zeroRows f i q) ≤ 26 := by
  have hlo (q : ZMod 26) : (-1 : ℤ) ≤ zeroRows f i q := by
    rcases zeroRows_sign f hf i q with h | h <;> omega
  have hhi (q : ZMod 26) : zeroRows f i q ≤ (1 : ℤ) := by
    rcases zeroRows_sign f hf i q with h | h <;> omega
  constructor
  · have h := Finset.sum_le_sum (fun q (_ : q ∈ Finset.univ) => hlo q)
    norm_num only [Finset.sum_const, Finset.card_univ, ZMod.card, nsmul_eq_mul] at h
    exact h
  · have h := Finset.sum_le_sum (fun q (_ : q ∈ Finset.univ) => hhi q)
    norm_num only [Finset.sum_const, Finset.card_univ, ZMod.card, nsmul_eq_mul] at h
    exact h

theorem exception_row_sum_abs_le_one
    (f : Rows Space) (hf : ∀ i, SignValued (f i))
    (hcorr : ∀ v : Space, v ≠ 0 → combinedCorrelation f v = -4)
    (u : (ZMod 23)ˣ) (hu : orderOf u = 11)
    (hinv : ∀ i q z, f i (q,(u : ZMod 23)*z) = f i (q,z)) (i : Fin 4) :
    |∑ q, exceptionRows f i q| ≤ 1 := by
  have horiginal := abs_le.mp (original_row_sum_abs_le_two f hf hcorr i)
  have hzero := zero_row_sum_bounds f hf i
  have hdecomposition := original_row_sum_decomposition f hf u hu hinv i
  apply abs_le.mpr
  constructor <;> omega

/-- No four actual sign rows with the required correlations are fixed by
the nontrivial order-eleven action on their 23-coordinate. -/
theorem order11_fiber_invariance_impossible
    (f : Rows Space) (hf : ∀ i, SignValued (f i))
    (hcorr : ∀ v : Space, v ≠ 0 → combinedCorrelation f v = -4)
    (u : (ZMod 23)ˣ) (hu : orderOf u = 11)
    (hinv : ∀ i q z, f i (q,(u : ZMod 23)*z) = f i (q,z)) : False := by
  have hsquares := exception_row_sum_squares_eq_five f hf hcorr u hu hinv
  have hbound (i : Fin 4) : (∑ q, exceptionRows f i q) ^ 2 ≤ 1 := by
    have h := abs_le.mp (exception_row_sum_abs_le_one f hf hcorr u hu hinv i)
    have hc : (∑ q, exceptionRows f i q) = -1 ∨
        (∑ q, exceptionRows f i q) = 0 ∨ (∑ q, exceptionRows f i q) = 1 := by omega
    rcases hc with h | h | h <;> norm_num [h]
  have htotal := Finset.sum_le_sum (fun i (_ : i ∈ Finset.univ) => hbound i)
  norm_num only [Finset.sum_const, Finset.card_univ, Fintype.card_fin, nsmul_eq_mul] at htotal
  omega

end Hadamard598
