import Conjectures.HadamardBorderCompression
import Mathlib.Algebra.Field.ZMod
import Mathlib.Tactic.Linarith

/-!
# Exact compression identities for four length-598 sign rows

The quotient is the actual first-coordinate map C26×C23→C26.
Every energy and row-sum bound below follows from sign-valuedness and
the original nonzero combined correlation−4.
-/

namespace Hadamard598

open scoped BigOperators
open HadamardBorderNormalizationTransport
open HadamardBorderConstruction

abbrev Space := ZMod 26 × ZMod 23

def projection : Space →+ ZMod 26 := AddMonoidHom.fst _ _

theorem projection_surjective : Function.Surjective projection :=
  fun q => ⟨(q,0),rfl⟩

theorem projection_kernel_card : Nat.card projection.ker = 23 := by
  have h := fintype_card_eq_card_mul_kernel_card projection projection_surjective
  norm_num only [Fintype.card_prod, ZMod.card] at h
  omega

def compressed (f : Rows Space) : Rows (ZMod 26) :=
  fun i q => ∑ z : ZMod 23, f i (q,z)

theorem compressed_apply_eq_compress (f : Rows Space) (i : Fin 4) (q : ZMod 26) :
    compressed f i q = compress projection (f i) q := by
  classical
  change (∑ z, f i (q, z)) =
    ∑ x : Space, if x.1 = q then f i x else 0
  rw [Fintype.sum_prod_type, Finset.sum_comm]
  simp only [Fintype.sum_ite_eq']

theorem compressed_eq_compress (f : Rows Space) :
    compressed f = fun i => compress projection (f i) := by
  funext i q
  exact compressed_apply_eq_compress f i q

theorem raw_correlation_zero (f : Rows Space) (hf : ∀ i, SignValued (f i)) :
    combinedCorrelation f 0 = 2392 := by
  have h := combinedCorrelation_zero f hf
  norm_num only [Fintype.card_prod, ZMod.card] at h
  exact h

theorem raw_correlation_formula (f : Rows Space) (hf : ∀ i, SignValued (f i))
    (hcorr : ∀ u : Space, u ≠ 0 → combinedCorrelation f u = -4) (u : Space) :
    combinedCorrelation f u = -4 + if u = 0 then 2396 else 0 := by
  by_cases hu : u = 0
  · subst u
    norm_num [raw_correlation_zero f hf]
  · simp only [ite_eq_right hu, add_zero, hcorr u hu]

private theorem compress_zero_indicator (a : ℤ) (t : ZMod 26) :
    compress projection (fun u : Space => if u = 0 then a else 0) t =
      if t = 0 then a else 0 := by
  classical
  unfold compress
  calc
    (∑ u : Space, if projection u = t then (if u = 0 then a else 0) else 0) =
        ∑ u : Space, if u = 0 then (if t = 0 then a else 0) else 0 := by
      apply Finset.sum_congr rfl
      intro u hu
      by_cases hu0 : u = 0
      · subst u
        by_cases ht : t = 0
        · subst t
          simp only [map_zero, ite_true]
        · simp only [map_zero, ite_eq_right (Ne.symm ht), ite_true, ite_eq_right ht]
      · simp only [ite_eq_right hu0, ite_self]
    _ = if t = 0 then a else 0 := Fintype.sum_ite_eq' 0 _

theorem compressed_correlation (f : Rows Space) (hf : ∀ i, SignValued (f i))
    (hcorr : ∀ u : Space, u ≠ 0 → combinedCorrelation f u = -4) (t : ZMod 26) :
    combinedCorrelation (compressed f) t = if t = 0 then 2304 else -92 := by
  rw [compressed_eq_compress, combinedCorrelation_compress_eq_fiber_sum]
  change compress projection (combinedCorrelation f) t = _
  have hraw : combinedCorrelation f =
      fun u : Space => -4 + if u = 0 then 2396 else 0 :=
    funext (raw_correlation_formula f hf hcorr)
  rw [hraw, compress_add, compress_const projection projection_surjective,
    projection_kernel_card, compress_zero_indicator]
  by_cases ht : t = 0 <;> norm_num [ht]

theorem compressed_energy (f : Rows Space) (hf : ∀ i, SignValued (f i))
    (hcorr : ∀ u : Space, u ≠ 0 → combinedCorrelation f u = -4) :
    (∑ i, ∑ q, (compressed f i q) ^ 2) = 2304 := by
  simpa only [combinedCorrelation, correlation, add_zero, pow_two, ite_true] using
    compressed_correlation f hf hcorr 0

theorem original_row_sum_squares (f : Rows Space) (hf : ∀ i, SignValued (f i))
    (hcorr : ∀ u : Space, u ≠ 0 → combinedCorrelation f u = -4) :
    (∑ i, (∑ x, f i x) ^ 2) = 4 := by
  calc
    (∑ i, (∑ x, f i x) ^ 2) = ∑ u, combinedCorrelation f u :=
      (sum_combinedCorrelation_eq_row_sum_squares f).symm
    _ = ∑ u : Space, (-4 + if u = 0 then 2396 else 0) :=
      Finset.sum_congr rfl (fun u _ => raw_correlation_formula f hf hcorr u)
    _ = 4 := by
      rw [Finset.sum_add_distrib]
      norm_num [Fintype.card_prod, ZMod.card]

theorem original_row_sum_abs_le_two (f : Rows Space) (hf : ∀ i, SignValued (f i))
    (hcorr : ∀ u : Space, u ≠ 0 → combinedCorrelation f u = -4) (i : Fin 4) :
    |∑ x, f i x| ≤ 2 := by
  have h := Finset.single_le_sum (fun j (_ : j ∈ Finset.univ) =>
    sq_nonneg (∑ x, f j x)) (Finset.mem_univ i)
  rw [original_row_sum_squares f hf hcorr] at h
  apply abs_le.mpr
  constructor <;> nlinarith [sq_nonneg ((∑ x, f i x)+2), sq_nonneg ((∑ x, f i x)-2)]

theorem compressed_row_sum_eq_original (f : Rows Space) (i : Fin 4) :
    (∑ q, compressed f i q) = ∑ x, f i x := by
  simp_rw [compressed_apply_eq_compress]
  exact sum_compress_eq_sum projection (f i)

end Hadamard598
